# ZooMoney
Financial Management Platform with *Spring Boot*, *React*

using *MariaDB*

## Details
<p align="center">
  <img src="https://github.com/user-attachments/assets/6b24f294-37fd-4f2a-a944-39cddf8be309" alt="main">
</p>

### <div align="center">똑똑한 우리 아이 돈관리</div>

## Key Features
- ```용돈 계약```
- ```용돈 관리 및 저금```
- ```금융 교육```
- ```모의 투자```

## Getting Started
![React](https://img.shields.io/badge/react-%2320232a.svg?style=for-the-badge&logo=react&logoColor=%2361DAFB)

```
npm install
npm start
```

```INI
# common
MetaMask
dump.sql

# BackEnd
application.properties

# FrontEnd
.env
```

- *MetaMask*
  - Chrome 확장 프로그램 설치 필요([MetaMask](https://metamask.io/))
  - 스마트 계약 및 토큰 발행 필요
    ```
    AccountContract.sol
    AccountABI.json
    CardContract.sol
    CardABI.json
    ```
  - 지갑 주소 발급 필요
- *dump.sql*
  - MariaDB 기준 작성
  - 데이터 추가, 수정, 삭제(유동적으로 활용 가능)
- *application.properties* ```..\src\main\resources\```
  - 본인인증 API 키 발급 필요([포트원 API 가이드](https://developers.portone.io/opi/ko/extra/identity-verification/v1/phone/readme?v=v1))
  - 카카오맵 API 키 발급 필요([카카오맵 API 가이드](https://apis.map.kakao.com/web/guide/))

    ```INI
    # 예시
    
    # 본인인증 API
    impKey=imp12345678
    impKey2=1234567890123456
    impSecret=TkclfeBw4uAaPWgeY5fRdOeifqSHLVA0BnB0CWY8sOuCWXEVlBCcHXD1xEhNINFVXL53du4DwPwLRz8B

    channelKey={channel-key-b2bd2116-d93d-4316-8838-951c47abfb02}

    # 카카오맵 API
    appkey=tpvp23hi47ldx0qxeqb3gzltxmdzw2aq
    ```
- *.env*
  - 데이터베이스 정보 입력(다른 DBMS로 대체 가능)

    ```INI
    # 예시
    
    driverClassName=com.mysql.cj.jdbc.Driver
    url=jdbc:mysql://localhost:3306/salre?characterEncoding=UTF-8
    username=root
    password=1234
    ```

## Tasks
- [ ] 관리자 페이지 기능 개선
- [ ] 게시물 검색 및 정렬 기능 구현
- [ ] 채팅방 이미지 첨부 지원
- [ ] 전자서명 본인인증 프로세스 추가
- [ ] 대출상품 기반 매물 추천
