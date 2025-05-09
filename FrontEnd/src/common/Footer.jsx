import HomeRoundedIcon from "@mui/icons-material/HomeRounded";
import InsightsRoundedIcon from "@mui/icons-material/InsightsRounded";
import PersonRoundedIcon from "@mui/icons-material/PersonRounded";
import SavingsRoundedIcon from "@mui/icons-material/SavingsRounded";
import React from "react";
import { useNavigate, useLocation } from "react-router-dom";
import "./Footer.css";

const Footer = () => {
  const navigate = useNavigate();
  const location = useLocation();

  // 현재 경로에 따라 active 클래스를 동적으로 할당
  const isActive = (path) => location.pathname.startsWith(path);

  return (
    <div className="footer">
      <div className="footer-container">
        <HomeRoundedIcon
          className={`footer-icon ${isActive("/main") ? "active" : ""}`}
          onClick={() => {
            navigate("/main");
          }}
        />
        홈
      </div>
      <div className="footer-container">
        <SavingsRoundedIcon
          className={`footer-icon ${isActive("/account") ? "active" : ""}`}
          onClick={() => {
            navigate("/account");
          }}
        />
        저금통
      </div>
      <div className="footer-container">
        <InsightsRoundedIcon
          className={`footer-icon ${isActive("/stock") ? "active" : ""}`}
          onClick={() => {
            navigate("/stock/main");
          }}
        />
        모의투자
      </div>
      <div className="footer-container">
        <PersonRoundedIcon
          className={`footer-icon ${
            isActive("/member/mypage") ? "active" : ""
          }`}
          onClick={() => {
            navigate("/member/mypage");
          }}
        />
        마이페이지
      </div>
    </div>
  );
};

export default Footer;
