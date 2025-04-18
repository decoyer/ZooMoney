import React from "react";
import { useLocation, useNavigate } from "react-router-dom";
import Header from "../common/Header";
import rabbit04 from "../images/rabbit/rabbit04.png";
import "../stock/css/stockBuy.css";

function StockBuyDone(props) {
  const navi = useNavigate();
  const goStockMain = () => {
    navi("/stock/myStock");
  };

  const location = useLocation();

  // state에서 데이터 가져오기
  const { stockName, amount, totalPrice } = location.state || {
    stockName: "Unkown",
    amount: 0,
    totalPrice: 0,
  };

  return (
    <div className="mock-container">
      <Header title="구매 완료"></Header>
      <div className="buy-done-box">
        <img src={rabbit04} alt="rabbit04" className="done-rabbit04" />
        <div className="buy-done-message">
          {/* 데이터 값 넣기 */}
          {stockName}
          <br />
          <span>{amount}주</span>를 구매했어요!
        </div>
        <div className="buy-done-total">
          총 <span>{totalPrice.toLocaleString()}원</span> 사용했어요
        </div>
      </div>
      <button className="buy-done-button" onClick={goStockMain}>
        내 자산 보러가기
      </button>
    </div>
  );
}

export default StockBuyDone;
