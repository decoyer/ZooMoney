import axios from "axios";
import { API_PATH } from "../common/config.js";
import React, { useEffect, useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import Header from "../common/Header";
import giraffe03 from "../images/giraffe/giraffe03.png";
import X from "../images/quiz/X.png";
import "./css/quizFailure.css";

const QuizFailure = () => {
  const location = useLocation();
  const navigate = useNavigate();
  const quiz = location.state?.quiz; // ✅ 전달된 퀴즈 데이터 가져오기

  const memberNum = sessionStorage.getItem("member_num");

  const [quizCount, setQuizCount] = useState(0); // 퀴즈 데이터 개수를 저장할 상태

  useEffect(() => {
    axios
      .get(`${API_PATH}/zoomoney/quiz/count`, {
        params: { memberNum: memberNum },
      })
      .then((response) => {
        setQuizCount(response.data.quizCount); // 상태 업데이트
      })
      .catch((error) => console.error("퀴즈의 개수를 알 수 없습니다.", error));
  });

  const nextQuiz = () => {
    if (quizCount >= 5) {
      // 누적 퀴즈 data수가 5개 이상이면
      navigate("/quiz/end"); // 종료 페이지로 이동
    } else {
      // 5개 미만이면
      navigate("/quiz/quiz"); // 퀴즈 출제 페이지로 이동
    }
  };

  const goToMain = () => {
    navigate("/quiz/main");
  };

  const goToEnd = () => {
    navigate("/quiz/end");
  };

  return (
    <div className="mock-container">
      <Header title="오늘의 금융퀴즈" />

      {/* 메인 콘텐츠 */}
      <div className="quizfailure-content">
        <div className="quizfailure-num-image">
          <p className="quizfailure-number">
            QUIZ {String(quizCount).padStart(2, "0")}
          </p>
          <img src={giraffe03} alt="giraffe03" className="quizfailure-image" />
        </div>
        <div className="quizfailure-board">
          <div className="quizfailure-box">
            <div className="quizfailure-nemo">
              <img src={X} alt="O" className="quizfailure-failure-image"></img>
              <p className="quizfailure-answer">오답이에요!</p>
            </div>
          </div>
          <div className="quizfailure-description-box">
            <p className="quizfailure-description">{quiz?.explanation}</p>
          </div>
        </div>

        <p className="quizfailure-point">포인트를 획득하지 못했어요...</p>

        {quizCount >= 5 ? (
          <>
            <p className="quizfailure-quiz-done">
              오늘의 퀴즈를 모두 응시했어요!
            </p>
            <button className="quizfailure-point-button" onClick={goToEnd}>
              결과 보기
            </button>
          </>
        ) : (
          <>
            <button className="quizfailure-button" onClick={nextQuiz}>
              다음 퀴즈 풀기
            </button>
            <button className="quizfailure-button-stop" onClick={goToMain}>
              그만 풀기
            </button>
          </>
        )}
      </div>
    </div>
  );
};

export default QuizFailure;
