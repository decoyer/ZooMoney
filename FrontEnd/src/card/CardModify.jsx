import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { toast } from "react-toastify";
import Header from "../common/Header";
import card00 from "../images/card/card00.png";
import card01 from "../images/card/card01.png";
import card02 from "../images/card/card02.png";
import card03 from "../images/card/card03.png";
import card04 from "../images/card/card04.png";
import { fetchCardInfo, fetchMetadata, mintNFT } from "./resources/CardService";
import "./css/CardModify.css";
const CardModify = () => {
  const [file, setFile] = useState(null);
  const [selectedImage, setSelectedImage] = useState(null);
  const [previewUrl, setPreviewUrl] = useState(null);
  const [minting, setMinting] = useState(false);
  const [, setTokenId] = useState("");
  const [metadata, setMetadata] = useState(null);
  const [, setLoading] = useState(true);
  const [newloading, setNewLoading] = useState(true);
  const [, setMetadataUrl] = useState("");
  const [, setTransactionHash] = useState("");

  const navigate = useNavigate();

  useEffect(() => {
    const fetchData = async () => {
      const memberNum = sessionStorage.getItem("member_num");
      // 카드 정보와 메타데이터를 비동기적으로 가져오기
      await fetchCardInfo(memberNum, setTokenId, setNewLoading);
      const tokenId = sessionStorage.getItem("cardMetadata");
      if (!tokenId) {
        setLoading(false);
        return;
      }

      try {
        await fetchMetadata(tokenId, setMetadata, setMetadataUrl, setLoading);

        setLoading(false); // 데이터 로딩이 끝난 후 로딩 상태 업데이트
      } catch (error) {
        console.error("데이터 가져오기 오류:", error);
        setLoading(false); // 오류 발생시에도 로딩 상태 종료
      }
    };

    fetchData(); // fetchData 호출
  }, []); // 컴포넌트가 처음 렌더링될 때만 실행

  const handleMintNFT = async () => {
    let fileToUpload = file;

    // 파일이 없을 경우, 선택한 이미지(selectedImage)를 사용하여 변환
    if (!fileToUpload) {
      const imageToUse = selectedImage || card00;
      const response = await fetch(imageToUse);
      const blob = await response.blob();
      fileToUpload = new File([blob], "selected-card.png", {
        type: "image/png",
      });

      setFile(fileToUpload);
    }

    // NFT 발급 실행
    const success = await mintNFT(fileToUpload, setMinting, setTransactionHash);

    if (success) {
      navigate("/card/modifySuccess"); // 이미지 변경완료
    } else {
      toast.error("NFT 발급 실패");
    }
  };

  const handleFileChange = (e) => {
    let selectedFile = e.target.files[0];

    if (selectedFile) {
      setFile(selectedFile);

      // 새 파일을 업로드하면 기존 선택한 이미지(selectedImage)를 초기화
      setSelectedImage(null);

      // 파일의 미리보기 URL 생성
      setPreviewUrl(URL.createObjectURL(selectedFile));
    }
  };

  // 카드 이미지 클릭 시 실행되는 함수
  const handleImageSelect = async (image) => {
    setSelectedImage(image);
    setPreviewUrl(image);

    // 선택한 이미지를 File 객체로 변환
    const response = await fetch(image);
    const blob = await response.blob();
    const file = new File([blob], "selected-card.png", { type: "image/png" });

    setFile(file);
  };

  // previewUrl이 변경될 때 selectedImage도 업데이트
  useEffect(() => {
    if (previewUrl) {
      setSelectedImage(previewUrl);
    }
  }, [previewUrl]);
  return (
    <div className="mock-container">
      <Header title="카드 이미지 변경" />

      <div className="content">
        {/* 카드 이미지 미리보기 */}
        <div className="modifycard-preview">
          {newloading ? null : (
            <img
              src={
                selectedImage // 사용자가 이미지를 선택했다면 그 이미지를 표시
                  ? selectedImage
                  : previewUrl // 이미지 첨부한 경우 previewUrl이 있다면 그것을 표시
                  ? previewUrl
                  : metadata?.image || card00 // 선택한 이미지나 첨부한 이미지가 없다면, 기본적으로 metadata.image 또는 기본 이미지를 표시
              }
              alt="미리보기"
              className="modifycard-image"
            />
          )}
        </div>
      </div>
      <br />
      {/* 카드 기본 이미지 선택 */}
      <div className="modifyimage-container">
        {[
          { image: card00, bgColor: "bg-gray-700" },
          { image: card01, bgColor: "bg-orange-500" },
          { image: card02, bgColor: "bg-yellow-400" },
          { image: card03, bgColor: "bg-pink-400" },
          { image: card04, bgColor: "bg-gray-700" },
        ].map((item, index) => (
          <div
            key={index}
            className={`modifyimage-item ${
              selectedImage === item.image ? "ring-4 ring-purple-500" : ""
            }`}
            onClick={() => handleImageSelect(item.image)}
          >
            <img
              src={item.image}
              alt={`카드 ${index + 1}`}
              className="modifyimage-img"
            />
          </div>
        ))}
      </div>

      {/* 파일 업로드 버튼 */}
      <div className="flex justify-between w-full">
        <label className="cursor-pointer">
          <div className="upload-button flex items-center gap-2">
            <span className="plus-icon bg-orange-500 text-white rounded-full w-8 h-8 flex items-center justify-center text-xl font-bold">
              +
            </span>
            <div className="modifytext-container">
              <span className="text-lg font-semibold">
                나만의 이미지 추가
              </span>
            </div>
            <input type="file" onChange={handleFileChange} className="hidden" />
          </div>
        </label>
      </div>

      {/* 변경 버튼 */}
      <button
        onClick={handleMintNFT}
        disabled={minting}
        className="modibutton-style"
      >
        {minting ? "" : "다음"}
      </button>
    </div>
  );
};

export default CardModify;
