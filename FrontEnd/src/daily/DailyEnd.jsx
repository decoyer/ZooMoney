import React from "react";
import { useNavigate } from "react-router-dom";
import Header from "../common/Header";
import giraffe02 from "../images/giraffe/giraffe02.png";
import "./dailyEnd.css";

const DailyEnd = () => {
  const navigate = useNavigate();
  const goToMain = () => {
    navigate("/main");
  };
  return (
    <div className="mock-container">
      <Header title="출석체크 완료" />

      {/* 메인 콘텐츠 */}
      <div className="dailyend-content">
        <img src={giraffe02} alt="giraffe02" className="dailyend-image" />
        <p className="dailyend-description">
          오늘의 출석체크 완료로
          <br />
          <span>10 포인트</span>를 획득했어요!
        </p>
        <p className="dailyend-description">내일 다시 만나요!</p>
        <button className="dailyend-button" onClick={goToMain}>
          메인으로 돌아가기
        </button>
      </div>
    </div>
  );
};

export default DailyEnd;
