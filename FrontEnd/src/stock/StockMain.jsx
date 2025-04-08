import axios from "axios";
import { API_PATH } from "../common/config.js";
import React, { useEffect, useState } from "react";
import { FaQuestionCircle } from "react-icons/fa";
import { IoIosArrowForward } from "react-icons/io";
import { Link, useNavigate } from "react-router-dom";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import Header from "../common/Header";
import rabbit01 from "../images/rabbit/rabbit01.png";
import "./css/stockMain.css";

function StockMain(props) {
  const memberNum = sessionStorage.getItem("member_num");
  const [myStockData, setMyStockData] = useState([]);
  const [isMarketClosed, setIsMarketClosed] = useState(false);
  const [toastId, setToastId] = useState(null);
  const [stockMoney, setStockMoney] = useState(0);

  const navi = useNavigate();

  // 장 마감 체크 함수
  useEffect(() => {
    const checkMarketStatus = () => {
      const now = new Date();
      const hours = now.getHours();

      // 9~15시까지 오픈
      const marketOpen = hours >= 9 && hours < 15;

      // 장이 닫혀 있으면 true, 열려 있으면 false
      setIsMarketClosed(!marketOpen);
    };

    checkMarketStatus();
    // 1초마다 상태 갱신
    const interval = setInterval(checkMarketStatus, 100);

    return () => clearInterval(interval);
  }, []);

  const showMarketClosedToast = () => {
    if (!toast.isActive(toastId)) {
      const id = toast.error("장이 마감되었습니다! 내일 다시 이용해주세요.", {
        position: "top-center",
        autoClose: 1000,
        toastId: "marketClosedToast",
      });
      setToastId(id);
    }
  };

  const goStockList = () => {
    if (isMarketClosed) {
      showMarketClosedToast();
      return;
    }
    navi("/stock/list");
  };

  const goToProfit = () => {
    navi("/stock/myStockProfit", {
      state: {
        totalPurchase,
        totalEvaluation,
        evaluationProfitLoss,
        totalProfitRate,
      },
    });
  };
  const goToSell = (stockId, stockPrice, stockName) => {
    if (isMarketClosed) {
      showMarketClosedToast();
      return;
    }
    navi("/stock/stockSell", { state: { stockId, stockPrice, stockName } });
  };

  // 장 마감 시간 설정 (기준은 3시)
  const marketCloseTime = new Date();
  marketCloseTime.setHours(15, 0, 0, 0);

  // 장 오픈 시간 설정 (기준은 오전 9시)
  const marketOpenTime = new Date();
  marketOpenTime.setHours(9, 0, 0, 0);

  useEffect(() => {
    // 보유 주식 불러오기
    axios
      .get(`${API_PATH}/zoomoney/stock/owned`, {
        params: { memberNum },
      })
      .then((response) => {
        setMyStockData(response.data);
      })
      .catch((error) => {
        console.error("Error fetching stock detail:", error);
      });
    // 잔고 불러오기 추가
    axios
      .get(`${API_PATH}/zoomoney/stock/getmoney`, {
        params: { memberNum },
      })
      .then((response) => {
        setStockMoney(response.data); // 상태값에 저장
      })
      .catch((error) => {
        console.error("Error fetching stock money:", error);
      });
  }, [memberNum]);

  // 총수익 (현재가 - 평군가 ) * 보유량
  const totalCurrentValue = myStockData.reduce((total, stock) => {
    return total + (stock.stockPrice - stock.averagePrice) * stock.quantity;
  }, 0);

  // 3. 총 매수 금액 (매수 평균가 * 보유량)
  // const totalInvested = myStockData.reduce((total, stock) => {
  //   return total + stock.averagePrice * stock.quantity;
  // }, 0);

  // const totalInvestment = totalCurrentValue + stockMoney;

  // 4. 총 수익률 (%) 계산
  const totalProfitRate = (totalCurrentValue / 1000000) * 100;

  // 총매입 계산 (평단가 * 수량)
  const totalPurchase = myStockData.reduce((total, stock) => {
    return stock.averagePrice * stock.quantity;
  }, 0);

  // 총평가 계산 (현재가 * 수량)
  const totalEvaluation = myStockData.reduce((total, stock) => {
    return stock.stockPrice * stock.quantity;
  }, 0);

  // 평가손익 계산 (총평가 - 총매입)
  const evaluationProfitLoss = totalEvaluation - totalPurchase;

  return (
    <div className="mock-container">
      <Header title="모의투자" />
      <div className="stock-main-header">
        <Link to="/stock/info" className="link-no-underline">
          <div className="stock-main-info">
            <FaQuestionCircle className="questionmark" />
            <span>주식에 대해 궁금해요!</span>
            <IoIosArrowForward className="selectchart-forward" />
          </div>
        </Link>
        <img src={rabbit01} alt="rabbit01" style={{ zIndex: "2" }} />
      </div>
      <div className="stock-main-box" onClick={goToProfit}>
        <h2>내 투자</h2>
        <IoIosArrowForward
          style={{
            width: "50px",
            height: "30px",
            float: "right",
            color: "#333",
          }}
        />
        <div className="stock-main-box-amount">
          {(totalCurrentValue + 1000000).toLocaleString()} 원
        </div>
        <div className="stock-main-box-text">예상 수수료 * 세금 포함</div>
        <div className="stock-main-box-detail">
          <div>
            <span>총 수익</span>
            <span className={totalCurrentValue >= 0 ? "profit" : "loss"}>
              {totalCurrentValue.toLocaleString()} 원
            </span>
          </div>
          <div>
            <span>총 수익률</span>
            <span span className={totalProfitRate >= 0 ? "profit" : "loss"}>
              {totalProfitRate.toFixed(2)} %
            </span>
          </div>
          <div>
            <span>예수금</span>
            <span>{stockMoney.toLocaleString()} 원</span>
          </div>
        </div>
      </div>

      <p className="myStock-tableName">보유 주식</p>

      <div className="stock-main-mystock-list-box33">
        <div className="table-header">
          <table className="stock-table">
            <thead>
              <tr>
                <th style={{ width: "80px" }}>종목명</th>
                <th style={{ width: "80px" }}>평균 매입가</th>
                <th style={{ width: "120px" }}>총 금액</th>
                <th style={{ width: "85px" }}>매도</th>
              </tr>
            </thead>
          </table>
        </div>
        <div className="table-body">
          <table className="stock-table" style={{ marginBottom: "50px" }}>
            <tbody className="stock-main-mystock-list-box">
              {myStockData.length > 0 ? (
                myStockData
                  .filter((stock) => stock.quantity > 0)
                  .map((stock, index) => {
                    const profitRate =
                      ((stock.stockPrice - stock.averagePrice) /
                        stock.averagePrice) *
                      100;
                    return (
                      <tr key={index}>
                        <td style={{ width: "80px" }}>
                          {stock.stockName}
                          <br />( {stock.quantity}주 )
                        </td>
                        <td style={{ width: "80px" }}>
                          {Math.floor(stock.averagePrice).toLocaleString(
                            "ko-KR"
                          )}
                          원
                          <br />
                          <span className={profitRate >= 0 ? "profit" : "loss"}>
                            ( {profitRate.toFixed(1)}% )
                          </span>
                        </td>
                        <td style={{ width: "120px" }}>
                          {stock.totalValue.toLocaleString()}원
                          <br />
                          <span className="current-price">
                            (현재가 {stock.stockPrice.toLocaleString()}원)
                          </span>
                        </td>
                        <td style={{ width: "85px" }}>
                          <button
                            className="sell-button"
                            onClick={() =>
                              goToSell(
                                stock.stockId,
                                stock.stockPrice,
                                stock.stockName
                              )
                            }
                          >
                            매도하기
                          </button>
                        </td>
                      </tr>
                    );
                  })
              ) : (
                <tr>
                  <td colSpan="4">보유한 주식이 없습니다.</td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </div>

      <button className="stock-main-button" onClick={goStockList}>
        투자하러 가기
      </button>
    </div>
  );
}

export default StockMain;
