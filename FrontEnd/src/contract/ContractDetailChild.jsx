import axios from "axios";
import { API_PATH } from "../common/config.js";
import React, { useEffect, useState } from "react";
import { FaChevronDown, FaChevronUp } from "react-icons/fa"; // ▼▲ 화살표 추가
import { Document, Page, pdfjs } from "react-pdf";
import "react-pdf/dist/Page/AnnotationLayer.css";
import "react-pdf/dist/Page/TextLayer.css";
import Header from "../common/Header";
import "./css/contractDetail.css";

// PDF Worker 설정
pdfjs.GlobalWorkerOptions.workerSrc = `${process.env.PUBLIC_URL}/pdf.worker.min.js`;

const ContractDetail = () => {
  // 계약서 열림/닫힘 상태 관리
  const [openContract, setOpenContract] = useState(null); // 열림/닫힘 상태 관리
  const [contracts, setContracts] = useState([]); // 계약서 데이터 상태 관리

  // 계약서 더보기 기능
  const toggleContract = (index) => {
    setOpenContract(openContract === index ? null : index); // 동일한 항목 클릭 시 닫힘
  };

  useEffect(() => {
    const memberNum = sessionStorage.getItem("member_num"); // 세션 값 가져오기
    axios
      .get(`${API_PATH}/zoomoney/contract/pastContracts/${memberNum}`)
      .then((response) => {
        setContracts(response.data); // 데이터를 상태에 저장
      })
      .catch((error) => {
        console.error("과거 계약서 로드 오류:", error);
      });
  }, []);

  return (
    <div className="mock-container">
      <Header title="용돈계약서 조회" />

      <div className="contractDetail1-container">
        <div className="contractDetail1-list">
          {contracts.map((contract, index) => (
            <div key={index} className="contractDetail1-item">
              <div
                className="contractDetail1-header"
                onClick={() => toggleContract(index)}
              >
                <p>{contract.contractDate} 계약 확인 </p>
                <div className="contractDetail1-toggle-icon">
                  {openContract === index ? <FaChevronUp /> : <FaChevronDown />}
                </div>
              </div>

              {openContract === index && (
                <div className="pdf-viewer">
                  <Document
                    file={`${API_PATH}/zoomoney${contract.contractFilepath}`}
                    onLoadError={(error) =>
                      console.error("PDF 로드 오류:", error)
                    }
                  >
                    <Page pageNumber={1} width={window.innerWidth * 0.9} />
                  </Document>
                </div>
              )}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default ContractDetail;
