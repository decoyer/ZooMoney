/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.5.2-MariaDB, for Win64 (AMD64)
--
-- Host: zoomoney.c3msoiki2c17.ap-northeast-2.rds.amazonaws.com    Database: zoomoney
-- ------------------------------------------------------
-- Server version	11.4.4-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Current Database: `zoomoney`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `zoomoney` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `zoomoney`;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `account_num` int(11) NOT NULL AUTO_INCREMENT,
  `account_end` date DEFAULT NULL,
  `account_goal` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_now` int(11) NOT NULL DEFAULT 0,
  `account_start` date DEFAULT curdate(),
  `account_status` tinyint(1) DEFAULT 1,
  `member_num` int(11) NOT NULL,
  `account_request` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`account_num`),
  KEY `FKhkcu1j799s0brhkqxn1hb49qv` (`member_num`),
  CONSTRAINT `FKhkcu1j799s0brhkqxn1hb49qv` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_num`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `card_num` varchar(255) NOT NULL,
  `card_metadata` varchar(255) DEFAULT NULL,
  `card_money` int(11) NOT NULL,
  `member_num` int(11) DEFAULT NULL,
  `card_update` datetime(6) DEFAULT current_timestamp(6),
  PRIMARY KEY (`card_num`),
  KEY `FKixbexnves80cqu1k70ycd1fuw` (`member_num`),
  CONSTRAINT `FKixbexnves80cqu1k70ycd1fuw` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_num` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_num`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES
(1,'먹기'),
(2,'쇼핑'),
(3,'놀기'),
(4,'저금'),
(5,'기타'),
(6,'용돈');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract` (
  `contract_num` int(11) NOT NULL AUTO_INCREMENT,
  `contract_content` varchar(255) DEFAULT NULL,
  `contract_date` datetime(6) DEFAULT NULL,
  `contract_excelpath` varchar(255) DEFAULT NULL,
  `contract_filepath` varchar(255) DEFAULT NULL,
  `contract_imgpath` varchar(255) DEFAULT NULL,
  `contract_money` int(11) NOT NULL,
  `contract_provide` datetime(6) DEFAULT NULL,
  `contract_status` bit(1) NOT NULL,
  `member_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`contract_num`),
  KEY `FK904w91e18ykvfmvv80p300l1i` (`member_num`),
  CONSTRAINT `FK904w91e18ykvfmvv80p300l1i` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_num`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily`
--

DROP TABLE IF EXISTS `daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily` (
  `daily_num` int(11) NOT NULL AUTO_INCREMENT,
  `daily_check` bit(1) NOT NULL,
  `daily_date` datetime(6) DEFAULT NULL,
  `member_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`daily_num`),
  KEY `FK7wbs0r37u25ygid5p9idoulmv` (`member_num`),
  CONSTRAINT `FK7wbs0r37u25ygid5p9idoulmv` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_num`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily`
--

LOCK TABLES `daily` WRITE;
/*!40000 ALTER TABLE `daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `member_num` int(11) NOT NULL AUTO_INCREMENT,
  `member_account` varchar(255) DEFAULT NULL,
  `member_id` varchar(255) DEFAULT NULL,
  `member_name` varchar(255) DEFAULT NULL,
  `member_parent` int(11) DEFAULT NULL,
  `member_phone` varchar(255) DEFAULT NULL,
  `member_point` int(11) DEFAULT NULL,
  `member_pw` varchar(255) DEFAULT NULL,
  `member_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`member_num`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `money_plan`
--

DROP TABLE IF EXISTS `money_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `money_plan` (
  `plan_num` int(11) NOT NULL AUTO_INCREMENT,
  `plan_date` datetime(6) DEFAULT NULL,
  `plan_money` int(11) NOT NULL,
  `plan_status` bit(1) NOT NULL,
  `member_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`plan_num`),
  KEY `FK5vobed1r7ankdv4oaaakiljcl` (`member_num`),
  CONSTRAINT `FK5vobed1r7ankdv4oaaakiljcl` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_num`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `money_plan`
--

LOCK TABLES `money_plan` WRITE;
/*!40000 ALTER TABLE `money_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `money_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify`
--

DROP TABLE IF EXISTS `notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify` (
  `notify_num` int(11) NOT NULL AUTO_INCREMENT,
  `notify_check` tinyint(1) DEFAULT 0,
  `notify_content` varchar(255) DEFAULT NULL,
  `notify_time` timestamp NULL DEFAULT current_timestamp(),
  `notify_url` varchar(255) DEFAULT NULL,
  `member_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`notify_num`),
  KEY `FK8jithdd6771vxpsng9f80k41i` (`member_num`),
  CONSTRAINT `FK8jithdd6771vxpsng9f80k41i` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_num`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify`
--

LOCK TABLES `notify` WRITE;
/*!40000 ALTER TABLE `notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_detail`
--

DROP TABLE IF EXISTS `plan_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_detail` (
  `detail_num` int(11) NOT NULL AUTO_INCREMENT,
  `detail_money` int(11) NOT NULL,
  `category_num` int(11) DEFAULT NULL,
  `plan_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`detail_num`),
  KEY `FK3xgw1i5i24oj867iftniexxop` (`category_num`),
  KEY `FK2mms94tt78yu3m5rhydmb58tv` (`plan_num`),
  CONSTRAINT `FK2mms94tt78yu3m5rhydmb58tv` FOREIGN KEY (`plan_num`) REFERENCES `money_plan` (`plan_num`),
  CONSTRAINT `FK3xgw1i5i24oj867iftniexxop` FOREIGN KEY (`category_num`) REFERENCES `category` (`category_num`)
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_detail`
--

LOCK TABLES `plan_detail` WRITE;
/*!40000 ALTER TABLE `plan_detail` DISABLE KEYS */;
INSERT INTO `plan_detail` VALUES
(608,15000,1,91),
(609,5000,2,91),
(610,3000,3,91),
(611,2000,4,91),
(612,5000,5,91);
/*!40000 ALTER TABLE `plan_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz` (
  `quiz_num` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_check` bit(1) NOT NULL,
  `quiz_date` datetime DEFAULT current_timestamp(),
  `member_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`quiz_num`),
  KEY `FK9dl12u94ynwqyawhepkc92fav` (`member_num`),
  CONSTRAINT `FK9dl12u94ynwqyawhepkc92fav` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_num`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_keyword`
--

DROP TABLE IF EXISTS `quiz_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_keyword` (
  `keyword_num` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_word` varchar(100) NOT NULL,
  PRIMARY KEY (`keyword_num`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_keyword`
--

LOCK TABLES `quiz_keyword` WRITE;
/*!40000 ALTER TABLE `quiz_keyword` DISABLE KEYS */;
INSERT INTO `quiz_keyword` VALUES
(201,'[돈]'),
(202,'[동전]'),
(203,'[지폐]'),
(204,'[은행]'),
(205,'[저금]'),
(206,'[예금]'),
(207,'[출금]'),
(208,'[대출]'),
(209,'[이자]'),
(210,'[금리]'),
(211,'[통장]'),
(212,'[용돈]'),
(213,'[소비]'),
(214,'[저축]'),
(215,'[절약]'),
(216,'[낭비]'),
(217,'[물가]'),
(218,'[환율]'),
(219,'[화폐]'),
(220,'[환전]'),
(221,'[경제]'),
(222,'[금융]'),
(223,'[투자]'),
(224,'[시장]'),
(225,'[주식]'),
(226,'[기업]'),
(227,'[회사]'),
(228,'[가게]'),
(229,'[사업]'),
(230,'[직업]'),
(231,'[월급]'),
(232,'[소득]'),
(233,'[세금]'),
(234,'[국세청]'),
(235,'[정부]'),
(236,'[국가 예산]'),
(237,'[무역]'),
(238,'[수출]'),
(239,'[수입]'),
(240,'[환율]'),
(241,'[증권]'),
(242,'[주식시장]'),
(243,'[거래소]'),
(244,'[코스피]'),
(245,'[코스닥]'),
(246,'[미국 주식]'),
(247,'[해외 주식]'),
(248,'[주식 투자]'),
(249,'[배당금]'),
(250,'[주가]'),
(251,'[시세]'),
(252,'[차트]'),
(253,'[상승]'),
(254,'[하락]'),
(255,'[매수]'),
(256,'[매도]'),
(257,'[장기 투자]'),
(258,'[단기 투자]'),
(259,'[펀드]'),
(260,'[채권]'),
(261,'[시중은행]'),
(262,'[중앙은행]'),
(263,'[예금보험공사]'),
(264,'[신용협동조합]'),
(265,'[우체국 예금]'),
(266,'[보험회사]'),
(267,'[대출기관]'),
(268,'[카드사]'),
(269,'[증권사]'),
(270,'[자산운용사]'),
(271,'[현금]'),
(272,'[신용카드]'),
(273,'[체크카드]'),
(274,'[직불카드]'),
(275,'[모바일 결제]'),
(276,'[계좌이체]'),
(277,'[송금]'),
(278,'[자동이체]'),
(279,'[수수료]'),
(280,'[할부]'),
(281,'[GDP(국내총생산)]'),
(282,'[물가 상승]'),
(283,'[인플레이션]'),
(284,'[디플레이션]'),
(285,'[환율 변동]'),
(286,'[실업률]'),
(287,'[금리 인상]'),
(288,'[금리 인하]'),
(289,'[경기 침체]'),
(290,'[경기 회복]'),
(291,'[장보기]'),
(292,'[시장 조사]'),
(293,'[할인]'),
(294,'[쿠폰]'),
(295,'[포인트]'),
(296,'[멤버십]'),
(297,'[가격 비교]'),
(298,'[홈쇼핑]'),
(299,'[온라인 쇼핑]'),
(300,'[배달비]'),
(301,'[적금]'),
(302,'[정기예금]'),
(303,'[자유적금]'),
(304,'[청약통장]'),
(305,'[펀드 투자]'),
(306,'[리츠(REITs)]'),
(307,'[비트코인]'),
(308,'[가상화폐]'),
(309,'[외환 거래]'),
(310,'[금 투자]'),
(311,'[리스크]'),
(312,'[손실]'),
(313,'[적자]'),
(314,'[흑자]'),
(315,'[부채]'),
(316,'[파산]'),
(317,'[금융 위기]'),
(318,'[채무 불이행]'),
(319,'[연체]'),
(320,'[연체료]'),
(321,'[사업]'),
(322,'[장사]'),
(323,'[창업]'),
(324,'[부업]'),
(325,'[용돈 받기]'),
(326,'[물건 팔기]'),
(327,'[중고 거래]'),
(328,'[재테크]'),
(329,'[배달 아르바이트]'),
(330,'[학용품 대여]'),
(331,'[가계부]'),
(332,'[용돈 기입장]'),
(333,'[부모님 월급]'),
(334,'[생활비]'),
(335,'[공과금]'),
(336,'[전기세]'),
(337,'[수도세]'),
(338,'[가스비]'),
(339,'[핸드폰 요금]'),
(340,'[자동차 할부금]'),
(341,'[국제 거래]'),
(342,'[수출국]'),
(343,'[수입국]'),
(344,'[글로벌 시장]'),
(345,'[무역 협정]'),
(346,'[환율 전쟁]'),
(347,'[경제 대국]'),
(348,'[개발도상국]'),
(349,'[부유한 나라]'),
(350,'[가난한 나라]'),
(351,'[한국은행]'),
(352,'[금융감독원]'),
(353,'[재정정책]'),
(354,'[통화정책]'),
(355,'[경기부양책]'),
(356,'[경제 성장 정책]'),
(357,'[금융 규제]'),
(358,'[기업 지원금]'),
(359,'[보조금]'),
(360,'[공공 예산]'),
(361,'[실업]'),
(362,'[취업]'),
(363,'[저임금]'),
(364,'[최저임금]'),
(365,'[노동법]'),
(366,'[노동 시간]'),
(367,'[비정규직]'),
(368,'[정규직]'),
(369,'[고용 안정]'),
(370,'[해고]'),
(371,'[국민연금]'),
(372,'[퇴직연금]'),
(373,'[개인연금]'),
(374,'[연금보험]'),
(375,'[실손보험]'),
(376,'[자동차보험]'),
(377,'[건강보험]'),
(378,'[생명보험]'),
(379,'[여행자보험]'),
(380,'[보험료]'),
(381,'[신용등급]'),
(382,'[담보대출]'),
(383,'[신용대출]'),
(384,'[카드론]'),
(385,'[전세대출]'),
(386,'[학자금대출]'),
(387,'[자동차 할부]'),
(388,'[대부업체]'),
(389,'[빚]'),
(390,'[채무 조정]'),
(391,'[금융 문해력]'),
(392,'[경제 교육]'),
(393,'[금융 습관]'),
(394,'[경제 신문]'),
(395,'[경제 방송]'),
(396,'[경제 뉴스]'),
(397,'[미래 계획]'),
(398,'[직업 선택]'),
(399,'[창업 아이디어]'),
(400,'[경제 독립]');
/*!40000 ALTER TABLE `quiz_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `stock_num` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` varchar(255) DEFAULT NULL,
  `stock_info` varchar(255) DEFAULT NULL,
  `stock_name` varchar(255) DEFAULT NULL,
  `stock_price` int(11) NOT NULL,
  PRIMARY KEY (`stock_num`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES
(91,'005930','한국 및 DX부문 해외 9개 지역총괄과 DS부문 해외 5개 지역총괄, SDC, Harman 등 229개의 종속기업으로 구성된 글로벌 전자기업임.','삼성전자',57600),
(92,'000660','1983년 현대전자로 설립, 2001년 하이닉스반도체를 거쳐 2012년 최대주주가 SK텔레콤으로 바뀌면서 SK하이닉스로 상호를 변경함.','SK하이닉스',203000),
(93,'373220','2020년 12월 1일 기존의 LG화학에서 분할되어 신설되었음.','LG에너지솔루션',325000),
(94,'207940','동사는 2011년 삼성바이오로직스로 설립되어 바이오의약품 위탁생산 및 세포주/공정 개발 서비스를 제공하는 CDMO 사업을 영위하고 있음.','삼성바이오로직스',1084000),
(95,'005380','승용, RV, 소형상용, 대형상용 등의 자동차 및 자동차부품을 제조 및 판매하는 완성차 제조업체로 현대자동차그룹에 속하였으며, 현대자동차그룹에는 동사를 포함한 국내 53개 계열회사가 있음.','현대차',200500),
(96,'068270','동사는 1991년 생명공학기술 및 동물세포대량배양기술을 기반으로 설립되어 2018년 유가증권시장에 상장됨.','셀트리온',187400),
(97,'000270','1999년 아시아자동차와 함께 현대자동차에 인수되었고, 기아차판매, 아시아자동차, 기아대전판매, 아시아차판매 4개사를 통합함.','기아',96400),
(98,'005935','한국 및 DX부문 해외 9개 지역총괄과 DS부문 해외 5개 지역총괄, SDC, Harman 등 229개의 종속기업으로 구성된 글로벌 전자기업임.','삼성전자우',47900),
(99,'012450','동사 및 종속회사는 고도의 정밀기계분야의 핵심기술을 바탕으로 국내외에서 항공기 및 가스터빈 엔진, 자주포, 장갑차 생산 및 판매를 영위.','한화에어로스페이스',764000),
(100,'035420','2013년 한게임 사업부문을 인적분할하여, 존속법인은 네이버, 신설법인은 구)엔에이치엔엔터테인먼트로 하였음.','NAVER',209000),
(101,'105560','2008년 설립된 KB금융그룹의 지주회사로서 높은 브랜드 인지도를 바탕으로 은행, 카드, 증권, 생명보험, 손해보험, 저축은행 등 다양한 금융 사업을 영위함.','KB금융',80200),
(102,'329180','동사는 선박과 해양구조물, 플랜트 및 엔진 등의 제조, 판매를 주 사업목적으로 2019년 6월 한국조선해양 주식회사에서 물적분할되어 신규 설립됨.','HD현대중공업',316500),
(103,'005490','동사는 자동차, 조선, 가전 등 산업에 원자재를 공급하는 철강사업(포스코)을 주력으로 영위하고 있으며, 무역/건설/에너지를 포함한 친환경인프라사업(포스코인터내셔널, 포스코건설, 포스코에너지 등)도 운영.','POSCO홀딩스',305000),
(104,'012330','동사는 1977년 6월 설립되었으며, 1989년 9월 5일 한국거래소 유가증권시장에 상장하였음.','현대모비스',264000),
(105,'042660','종합 조선/해양 전문회사로서 사업부문은 상선, 해양 및 특수선, 기타사업(서비스, 해상화물운송)으로 구성되어 있음.','한화오션',81400),
(106,'055550','동사는 신한금융 계열사에 대한 지배/경영관리, 종속회사에 대한 자금지원 등을 주요 사업목적으로 2001년 설립된 금융지주회사임.','신한지주',46550),
(107,'138040','2011년 3월 메리츠화재해상보험에서 인적 분할하여 설립된 국내 최초의 유일한 보험지주회사임.','메리츠금융지주',118800),
(108,'196170','동사는 2008년 설립되어 2014년 기술특례로 코스닥 시장에 상장한 바이오기업임.','알테오젠',443500),
(109,'028260','동사는 1938년 설립되었으며 2015년 삼성물산과 제일모직을 합병하였음 .','삼성물산',122300),
(110,'035720','1995년 2월 16일에 주식회사 다음커뮤니케이션으로 설립되었으며, 2014년 10월 1일 주식회사 카카오와 합병하였음.','카카오',44000),
(111,'096770','SK가 2007년 투자사업부문을 영위할 SK와 석유, 화학 및 윤활유 제품의 생산 판매 등을 영위할 분할신설법인인 동사를 인적 분할함으로써 설립됨.','SK이노베이션',126100),
(112,'010130','동사는 1974년 설립되었으며, 비철금속제련회사로서 아연과 연의 생산 및 판매를 주업종으로 영위하고 있음.','고려아연',882000),
(113,'011200','종합해운물류기업으로, 일반화물과 냉동화물, 특수화물 등 컨테이너로 운반 가능한 모든 화물, 원자재와 원유, 플랜트 등 벌크화물까지 상품 특성에 맞는 물류 서비스를 제공함.','HMM',20800),
(114,'000810','국내에서 가장 규모가 큰 삼성계열의 손해보험사로, 손해보험업과 제3보험업을 핵심사업으로 영위하고 있음.','삼성화재',394500),
(115,'086790','2005년 설립된 하나금융그룹 지주회사로서 자회사 지배 및 경영관리, 자금공여 등의 업무를 수행함.','하나금융지주',61100),
(116,'259960','동사는 2007년에 설립된 글로벌 게임회사로서, 게임의 개발 및 퍼블리싱을 주 사업으로 영위하고 있음.','크래프톤',351000),
(117,'034020','동사는 1962년 현대양행으로 설립되었으며 1980년 한국중공업으로 변경됨. 2022년 3월 두산중공업에서 두산에너빌리티로 사명 변경함.','두산에너빌리티',25800),
(118,'051910','동사는 석유화학 사업부문, 전지 사업부문, 첨단소재 사업부문, 생명과학 사업부문, 공통 및 기타부문의 사업을 영위하고 있음.','LG화학',231500),
(119,'032830','1957년에 설립되어 업계 최대의 전속 설계사 조직과 계리 전문인력을 보유하고 있는 삼성그룹 계열의 생명보험사.','삼성생명',84100),
(120,'009540','동사는 독점규제 및 공정거래에 관한 법률에 따라 설립된 지주회사로서, 지배기업인 동사와 종속기업 19개사로 이루어짐.','HD한국조선해양',220500);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_history`
--

DROP TABLE IF EXISTS `stock_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_history` (
  `stockhist_num` int(11) NOT NULL AUTO_INCREMENT,
  `stock_hist_date` datetime(6) DEFAULT NULL,
  `stockhist_amount` int(11) NOT NULL,
  `stockhist_price` int(11) NOT NULL,
  `stockhist_type` varchar(255) DEFAULT NULL,
  `member_num` int(11) DEFAULT NULL,
  `stock_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`stockhist_num`),
  KEY `FKkeabyndxnjiabwoshggbfeu4l` (`member_num`),
  KEY `FK3l9cycm7hkdbcn1bncx473s2c` (`stock_num`),
  CONSTRAINT `FK3l9cycm7hkdbcn1bncx473s2c` FOREIGN KEY (`stock_num`) REFERENCES `stock` (`stock_num`),
  CONSTRAINT `FKkeabyndxnjiabwoshggbfeu4l` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_num`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_history`
--

LOCK TABLES `stock_history` WRITE;
/*!40000 ALTER TABLE `stock_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_history_backup`
--

DROP TABLE IF EXISTS `stock_history_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_history_backup` (
  `stockhist_num` int(11) NOT NULL AUTO_INCREMENT,
  `stockhist_amount` int(11) NOT NULL,
  `stockhist_date` datetime(6) DEFAULT NULL,
  `stockhist_price` int(11) NOT NULL,
  `stockhist_type` varchar(255) DEFAULT NULL,
  `member_num` int(11) DEFAULT NULL,
  `stock_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`stockhist_num`),
  KEY `FKslbsb19f37xa2rgbj8m4iq5kw` (`member_num`),
  KEY `FK7any9525bp66mlecoperitxon` (`stock_num`),
  CONSTRAINT `FK7any9525bp66mlecoperitxon` FOREIGN KEY (`stock_num`) REFERENCES `stock` (`stock_num`),
  CONSTRAINT `FKslbsb19f37xa2rgbj8m4iq5kw` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_num`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_history_backup`
--

LOCK TABLES `stock_history_backup` WRITE;
/*!40000 ALTER TABLE `stock_history_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_history_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_info`
--

DROP TABLE IF EXISTS `stock_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_info` (
  `info_num` int(11) NOT NULL AUTO_INCREMENT,
  `info_content` varchar(500) DEFAULT NULL,
  `info_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`info_num`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_info`
--

LOCK TABLES `stock_info` WRITE;
/*!40000 ALTER TABLE `stock_info` DISABLE KEYS */;
INSERT INTO `stock_info` VALUES
(1,'주식은 회사에서 발행하는 작은 조각이라고 생각하면 돼. 예를 들어, 홍길동이 빵집을 샀다고 해보자. 빵집이 너무 잘 돼서 더 많은 사람들과 함께 돈을 벌고 싶어 했어. 그래서 홍길동은 빵집의 일부를 돈을 주고 샀어. 이제 홍길동은 그 빵집의 공동 주인이 된 거야.\n\n그 후 시간이 지나서 이 빵집이 유명해지고 사람들이 많이 와서 돈을 벌게 돼. 그러면 홍길동이 가진 빵집 지분의 가치도 올라가는 거지! 만약 이 빵집이 잘못돼서 사람들이 안 오면, 홍길동의 지분 가치는 떨어질 수도 있어. 주식도 이렇게 회사의 일부를 사고팔면서, 그 회사가 잘되면 돈을 벌 수 있고, 안 되면 손해를 볼 수 있는 거야.','주식은 뭘까?'),
(2,'주식을 사고 팔려면 증권사 계좌라는 걸 만들어야 해. 증권사는 주식을 사고팔 수 있도록 도와주는 회사야. 예를 들어, 홍길동은 빵집 주식을 사고 싶을 때, 증권사 계좌를 만들고, 그 계좌를 통해 빵집의 주식을 살 수 있어.\n\n주식을 살 때는 시장가 주문과 지정가 주문이라는 방법이 있어\n\n✅ 시장가 주문은 현재 거래되는 가격으로 바로 주식을 사는 거야. 예를 들어, 빵집 주식이 1000원이라면, 1000원에 바로 사는 거지.\n\n✅ 지정가 주문은 내가 원하는 가격에 맞춰서 주문을 넣는 거야. 예를 들어, 홍길동이 1000원에 팔고 싶을 때, 1000원이 되면 그때 팔리는 거지.','주식은 어떻게 사고팔 수 있을까?'),
(3,'주식 가격은 사고 싶은 사람과 팔고 싶은 사람이 얼마나 많은지에 따라 변해. 예를 들어, 빵집이 유명해지면 많은 사람들이 빵집 주식을 사고 싶어 해서 가격이 올라가. 반대로, 빵집이 인기가 없으면 사람들이 주식을 팔려고 해서 가격이 내려가.\n\n주식 가격은 또 회사가 잘 되는지도 중요해. 빵집이 잘 되어 돈을 많이 벌면, 주식 가격은 오르고, 반대로 빵집이 잘 안 되면 주식 가격은 떨어져.\n\n또한, 경제나 뉴스도 주식 가격에 영향을 줘. 예를 들어, 뉴스에서 \"빵집이 새로운 빵을 만들었다!\"라고 하면, 그 소식이 주식 가격에 영향을 줄 수 있어.','주식 가격은 왜 자주 바뀌는 걸까?'),
(4,'주식으로 돈을 벌 수 있는 방법은 두 가지야\n\n1️⃣ 시세 차익: 주식을 싸게 사서 비싸게 팔면, 돈을 벌 수 있어. 예를 들어, 홍길동이 빵집 주식을 1000원에 샀다가, 시간이 지나서 그 주식이 2000원이 되면 팔아서 1000원의 차익을 벌 수 있는 거야.\n\n2️⃣ 배당금: 어떤 회사는 이익을 내면, 그 이익의 일부를 주주들에게 나누어줘. 만약 홍길동이 빵집 주식을 가지고 있다면, 빵집이 돈을 많이 벌고 나서 주주들에게 배당금을 줄 수 있어. 이렇게 해서 배당금을 받을 수도 있는 거야.','주식으로 어떻게 돈을 벌 수 있을까?'),
(5,'좋은 주식을 고르려면 회사의 재무 상태를 잘 봐야 해. 예를 들어, 빵집이 잘 운영되고 있고, 돈을 잘 벌고 있다면 그 빵집은 성장 가능성이 높다고 볼 수 있어.\n\n주식을 고를 때 보면 좋은 지표들이 있어:\n\n📌 PER: 주식의 가격이 얼마나 비싼지, 아니면 싸게 살 수 있는지 알 수 있는 숫자야. 만약 PER이 낮으면, 그 주식이 저렴하게 살 수 있다는 뜻일 수 있어.\n\n📌 ROE: 이 숫자는 회사가 돈을 얼마나 잘 벌고 있는지 보여줘. 높은 ROE는 회사가 잘 운영되고 있다는 뜻이야.\n\n또, 배당금을 주는 회사는 주식을 오래 가지고 있으면 주기적으로 이익을 나눠준다는 점에서 좋은 회사일 수 있어.','좋은 주식을 고르는 방법은?'),
(6,'주식 차트는 주식의 가격이 어떻게 변했는지 보여주는 그림이야. 주식 차트에서 가장 많이 사용하는 건 캔들 차트야. 이 차트는 주식의 가격이 올라갔는지 내려갔는지 알 수 있게 도와줘.\n\n👍🏻 초록색 캔들은 주식이 올랐다는 뜻이야.\n\n👎🏻 빨간색 캔들은 주식이 떨어졌다는 뜻이야.\n\n차트에서는 가격의 흐름을 볼 수 있고, 이 흐름을 보고 앞으로 주식이 오를지 내릴지 예측할 수 있어. 예를 들어, 주식이 오르고 있다면, 앞으로도 오를 가능성이 있을 수 있어.','주식 차트는 어떻게 보는 걸까?'),
(7,'주식 투자에는 장기 투자와 단기 투자라는 두 가지 방법이 있어\n\n1️⃣ 장기 투자: 홍길동이 빵집이 잘될 거라고 믿고, 오래 기다리는 거야. 예를 들어, 홍길동은 10년 후 빵집이 더 커질 거라고 생각하고, 장기적으로 주식을 가지고 있어.\n\n2️⃣ 단기 투자: 주식이 갑자기 오르거나 내릴 때 빠르게 사고파는 방법이야. 예를 들어, 홍길동이 3개월 후에 주식 가격이 오를 것 같아서 주식을 샀다가, 가격이 오르면 바로 파는 거지.\n\n이렇게 목표에 따라 투자 기간을 달리할 수 있어.','주식 투자에는 어떤 전략이 있을까?'),
(8,'주식 시장에는 개인 투자자, 기관 투자자, 외국인 투자자 등이 있어.\n\n✅ 개인 투자자는 나와 같은 사람들이야. 홍길동처럼 혼자서 주식을 사고 팔려고 하는 사람들.\n\n✅ 기관 투자자는 펀드나 큰 회사들이야. 예를 들어, 큰 투자 회사들이 많은 돈을 투자해서 주식을 사고팔아.\n\n✅ 외국인 투자자는 다른 나라에서 온 사람들이야. 예를 들어, 미국에 있는 사람이 한국 주식을 사고 팔 수 있어.\n\n이렇게 여러 사람이 함께 주식을 사고 팔면서 주식 가격이 변하는 거야.','주식 시장에는 어떤 참가자들이 있을까?'),
(9,'주식 시장은 평일 9시부터 3시까지 열려. 이 시간 동안 사람들은 주식을 사고팔 수 있어. 주식 시장이 열려 있는 시간에 주식을 거래할 수 있고, 그 외에는 거래할 수 없어.\n\n시간 외 거래는 주식 시장이 끝난 후에도 주식을 사고팔 수 있는 시간이야. 하지만 이 시간에는 거래량이 적어서 가격 변동이 클 수 있어.','주식 시장은 언제 열리고, 어떻게 운영될까?'),
(10,'주식 투자에서 가장 중요한 건 감정을 따라가지 않는 것이야. 주식이 갑자기 오르면 좋다고 생각해서 너무 많이 사거나, 주식이 갑자기 내리면 무서워서 팔지 않도록 해야 해.\n\n또, 단기 급등주나 테마주는 가격이 급격히 오르내리기 때문에 리스크가 커. 너무 많이 투자하면 위험할 수 있어. 그래서 여러 회사의 주식을 나누어 투자하는 분산 투자가 중요해.','주식 투자에서 조심해야 할 것은?');
/*!40000 ALTER TABLE `stock_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_money`
--

DROP TABLE IF EXISTS `stock_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_money` (
  `stockmoney_num` int(11) NOT NULL AUTO_INCREMENT,
  `stockmoney_total` int(11) NOT NULL,
  `member_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`stockmoney_num`) USING BTREE,
  UNIQUE KEY `UKosu4f0fdhexos9fmxk1q2tutm` (`member_num`),
  CONSTRAINT `FKnehfn350nxqo70houecsq2tgv` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_num`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_money`
--

LOCK TABLES `stock_money` WRITE;
/*!40000 ALTER TABLE `stock_money` DISABLE KEYS */;
INSERT INTO `stock_money` VALUES
(1,584350,1);
/*!40000 ALTER TABLE `stock_money` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_result`
--

DROP TABLE IF EXISTS `stock_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_result` (
  `result_num` int(11) NOT NULL AUTO_INCREMENT,
  `result_date` datetime(6) DEFAULT NULL,
  `result_rank` int(11) NOT NULL,
  `result_rate` double NOT NULL,
  `member_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`result_num`),
  KEY `FK8h6l66ijfejt9dqwx3nvt6mey` (`member_num`),
  CONSTRAINT `FK8h6l66ijfejt9dqwx3nvt6mey` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_num`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_result`
--

LOCK TABLES `stock_result` WRITE;
/*!40000 ALTER TABLE `stock_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `use_history`
--

DROP TABLE IF EXISTS `use_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `use_history` (
  `usehist_num` int(11) NOT NULL AUTO_INCREMENT,
  `usehist_date` datetime(6) DEFAULT NULL,
  `usehist_money` int(11) NOT NULL,
  `usehist_shop` varchar(255) DEFAULT NULL,
  `usehist_type` varchar(255) DEFAULT NULL,
  `account_num` int(11) DEFAULT NULL,
  `card_num` varchar(255) DEFAULT NULL,
  `category_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`usehist_num`),
  KEY `FK3m934ptd8cxah95sksdfamjh2` (`account_num`),
  KEY `FKdt14kjhx1hdib8589fvok2yh8` (`card_num`),
  KEY `FKkxx5ffsgvrg6titwetip5mkvx` (`category_num`),
  CONSTRAINT `FK3m934ptd8cxah95sksdfamjh2` FOREIGN KEY (`account_num`) REFERENCES `account` (`account_num`),
  CONSTRAINT `FKdt14kjhx1hdib8589fvok2yh8` FOREIGN KEY (`card_num`) REFERENCES `card` (`card_num`),
  CONSTRAINT `FKkxx5ffsgvrg6titwetip5mkvx` FOREIGN KEY (`category_num`) REFERENCES `category` (`category_num`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `use_history`
--

LOCK TABLES `use_history` WRITE;
/*!40000 ALTER TABLE `use_history` DISABLE KEYS */;
INSERT INTO `use_history` VALUES
(1,'2025-01-06 09:00:00.000000',30000,'엄마','입금',NULL,'1078-4935-3899-8408',6),
(2,'2025-01-06 13:22:00.000000',1700,'GS리테일','출금',NULL,'1078-4935-3899-8408',1),
(3,'2025-01-06 17:30:00.000000',2500,'메가커피','출금',NULL,'1078-4935-3899-8408',1),
(4,'2025-01-08 15:30:00.000000',7500,'롯데시네마','출금',NULL,'1078-4935-3899-8408',3),
(5,'2025-01-09 16:30:00.000000',5000,'문방구','출금',NULL,'1078-4935-3899-8408',2),
(6,'2025-01-10 18:30:00.000000',3000,'CU','출금',NULL,'1078-4935-3899-8408',1),
(7,'2025-01-11 14:10:00.000000',2800,'CU','출금',NULL,'1078-4935-3899-8408',1),
(8,'2025-01-13 09:00:00.000000',30000,'엄마','입금',NULL,'1078-4935-3899-8408',6),
(9,'2025-01-13 14:30:00.000000',2500,'문방구','출금',NULL,'1078-4935-3899-8408',2),
(10,'2025-01-13 15:30:00.000000',4500,'게임방','출금',NULL,'1078-4935-3899-8408',3),
(11,'2025-01-14 17:00:00.000000',3000,'PC방','출금',NULL,'1078-4935-3899-8408',3),
(12,'2025-01-14 17:20:00.000000',2000,'PC방','출금',NULL,'1078-4935-3899-8408',1),
(13,'2025-01-15 19:20:00.000000',3000,'문방구','출금',NULL,'1078-4935-3899-8408',2),
(14,'2025-01-17 14:50:00.000000',1500,'GS리테일','출금',NULL,'1078-4935-3899-8408',1),
(15,'2025-01-17 17:15:33.000000',1500,'CU','출금',NULL,'1078-4935-3899-8408',1),
(16,'2025-01-18 17:20:00.000000',7000,'문방구','출금',NULL,'1078-4935-3899-8408',2),
(17,'2025-01-20 09:00:00.000000',30000,'엄마','입금',NULL,'1078-4935-3899-8408',6),
(18,'2025-01-20 14:55:00.000000',3000,'메가커피','출금',NULL,'1078-4935-3899-8408',1),
(19,'2025-01-21 08:10:00.000000',2500,'CU','출금',NULL,'1078-4935-3899-8408',1),
(20,'2025-01-21 16:45:00.000000',4500,'배스킨라빈스','출금',NULL,'1078-4935-3899-8408',1),
(21,'2025-01-22 17:33:00.000000',3000,'PC방','출금',NULL,'1078-4935-3899-8408',3),
(22,'2025-01-23 16:45:00.000000',3000,'메가커피','출금',NULL,'1078-4935-3899-8408',1),
(23,'2025-01-23 17:33:00.000000',20000,'방탈출','출금',NULL,'1078-4935-3899-8408',3),
(24,'2025-01-25 14:12:00.000000',2000,'CU','출금',NULL,'1078-4935-3899-8408',1),
(25,'2025-02-01 12:30:00.000000',4500,'다이소','출금',NULL,'1078-4935-3899-8408',2),
(26,'2025-02-03 09:00:00.000000',30000,'엄마','입금',NULL,'1078-4935-3899-8408',6),
(27,'2025-02-03 17:40:00.000000',7500,'신전떡볶이','출금',NULL,'1078-4935-3899-8408',1),
(28,'2025-02-05 18:15:00.000000',3000,'세계과자할인점','출금',NULL,'1078-4935-3899-8408',1),
(29,'2025-02-06 15:30:00.000000',3000,'다이소','출금',NULL,'1078-4935-3899-8408',2),
(30,'2025-02-07 13:27:00.000000',28000,'롯데월드','출금',NULL,'1078-4935-3899-8408',3),
(31,'2025-02-07 15:15:00.000000',6000,'롯데월드','출금',NULL,'1078-4935-3899-8408',1),
(32,'2025-02-10 09:00:00.000000',30000,'엄마','입금',NULL,'1078-4935-3899-8408',6),
(33,'2025-02-10 17:25:00.000000',4500,'CU','출금',NULL,'1078-4935-3899-8408',1),
(34,'2025-02-11 18:40:00.000000',2500,'CU','출금',NULL,'1078-4935-3899-8408',1),
(35,'2025-02-12 17:46:00.000000',3000,'와플대학','출금',NULL,'1078-4935-3899-8408',1),
(36,'2025-02-15 13:20:00.000000',12000,'교보문고','출금',NULL,'1078-4935-3899-8408',2),
(37,'2025-02-17 09:00:00.000000',30000,'엄마','입금',NULL,'1078-4935-3899-8408',6),
(38,'2025-02-17 16:55:00.000000',2500,'롯데슈퍼','출금',NULL,'1078-4935-3899-8408',1),
(39,'2025-02-19 17:40:00.000000',3000,'GS리테일','출금',NULL,'1078-4935-3899-8408',1),
(40,'2025-02-20 19:10:00.000000',5500,'다이소','출금',NULL,'1078-4935-3899-8408',2),
(41,'2025-02-21 18:33:00.000000',2000,'PC방','출금',NULL,'1078-4935-3899-8408',3),
(42,'2025-02-22 11:30:00.000000',2000,'수영장','출금',NULL,'1078-4935-3899-8408',3),
(43,'2025-02-24 09:00:00.000000',30000,'엄마','입금',NULL,'1078-4935-3899-8408',6),
(44,'2025-02-25 16:50:00.000000',2000,'PC방','출금',NULL,'1078-4935-3899-8408',3),
(45,'2025-02-26 15:10:00.000000',15000,'영풍문고','출금',NULL,'1078-4935-3899-8408',2),
(46,'2025-02-27 12:00:00.000000',3300,'CU','출금',NULL,'1078-4935-3899-8408',1),
(47,'2025-02-28 13:22:00.000000',800,'아이스크림할인점','출금',NULL,'1078-4935-3899-8408',1),
(48,'2025-03-03 09:00:48.000000',30000,'엄마','입금',NULL,'1078-4935-3899-8408',6),
(49,'2025-03-04 16:00:48.000000',2500,'CU','출금',NULL,'1078-4935-3899-8408',1),
(50,'2025-03-04 17:10:48.000000',800,'아이스크림할인점','출금',NULL,'1078-4935-3899-8408',1),
(51,'2025-03-06 18:12:48.000000',3300,'명랑핫도그','출금',NULL,'1078-4935-3899-8408',1),
(52,'2025-03-08 14:30:48.000000',3000,'PC방','출금',NULL,'1078-4935-3899-8408',3),
(53,'2025-03-10 09:00:41.000000',30000,'엄마','입금',NULL,'1078-4935-3899-8408',6),
(54,'2025-03-11 18:44:12.000000',12000,'교보문고','출금',NULL,'1078-4935-3899-8408',2),
(55,'2025-03-12 16:44:54.000000',4000,'인형뽑기','출금',NULL,'1078-4935-3899-8408',3),
(56,'2025-03-12 17:16:54.000000',2000,'붕어빵','출금',NULL,'1078-4935-3899-8408',1),
(57,'2025-03-14 17:05:49.000000',12000,'롯데시네마','출금',NULL,'1078-4935-3899-8408',3),
(58,'2025-03-14 17:18:49.000000',11000,'롯데시네마','출금',NULL,'1078-4935-3899-8408',1),
(59,'2025-03-17 09:00:00.000000',50000,'엄마','입금',NULL,'1078-4935-3899-8408',6),
(60,'2025-03-17 13:22:00.000000',1700,'GS리테일','출금',NULL,'1078-4935-3899-8408',1),
(61,'2025-03-17 17:30:00.000000',5000,'메가커피','출금',NULL,'1078-4935-3899-8408',1),
(62,'2025-03-18 15:30:00.000000',17500,'롯데시네마','출금',NULL,'1078-4935-3899-8408',3),
(63,'2025-03-19 16:30:00.000000',10000,'맥도날드','출금',NULL,'1078-4935-3899-8408',2),
(64,'2025-03-20 18:30:00.000000',5000,'CU','출금',NULL,'1078-4935-3899-8408',1),
(65,'2025-03-20 14:10:00.000000',2800,'CU','출금',NULL,'1078-4935-3899-8408',1),
(66,'2025-03-21 11:10:00.000000',4800,'CU','출금',NULL,'1078-4935-3899-8408',1),
(67,'2025-03-22 13:10:00.000000',2000,'백다방','출금',NULL,'1078-4935-3899-8408',1);
/*!40000 ALTER TABLE `use_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-03-25 17:53:40
