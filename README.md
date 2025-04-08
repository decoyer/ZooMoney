# ZooMoney
Parent-Child Budgeting Platform with *Spring Boot*, *React*

using *MariaDB*

## Details
<p align="center">
  <img src="https://github.com/user-attachments/assets/6b24f294-37fd-4f2a-a944-39cddf8be309" alt="main">
</p>

### <div align="center">똑똑한 우리 아이 용돈 관리 플랫폼</div>

## Key Features
- ```용돈 계약```
- ```용돈 관리 및 저금```
- ```금융 교육```
- ```모의 투자```

## Getting Started

![React](https://img.shields.io/badge/react-%2320232a.svg?style=for-the-badge&logo=react&logoColor=%2361DAFB) &ensp;
![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white)

```INI
# BackEnd
build gradle

# FrontEnd
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
  - 지갑 주소 발급 필요(Ethereum Network)
- *dump.sql*
  - MariaDB 기준 작성
  - 데이터 추가, 수정, 삭제(유동적으로 활용 가능)
- *application.properties* ```..\src\main\resources\```
  - 한국투자증권 API 키 발급 필요([한국투자증권 개발자 센터](https://apiportal.koreainvestment.com/apiservice/oauth2#L_5c87ba63-740a-4166-93ac-803510bb9c02))
  - Gemini API 키 발급 필요([Gemini API 가이드](https://ai.google.dev/gemini-api/docs?hl=ko))
  - 네이버 뉴스 API 키 발급 필요([네이버 개발자 센터](https://developers.naver.com/docs/serviceapi/search/news/news.md#%EB%89%B4%EC%8A%A4))

    ```INI
    # 예시
    
    # 한국투자증권 API
    stock.api.key=JZiAaoY9SxiWRWAJFYTzG0trANTP5Roh23Gw
    stock.api.secret=xPXoUt6OBD+ZcV+NAyQpWDM+E46YnOgMKKIZL3GpPzviu2bR26NNmoOmqTqj+OwpJXRY05vefO44Uq497psj69ex+X1h3tFnp2/TAjwFjG/KNCi9KQeeqTYHCeG1U9z5iv7yScf0Uwnr2f/nirhdFHmpqcOHM3mpsktEwpfjG26W1XfkPta=

    # Gemini API
    gemini.api.key=AIL4gFUyHGw6CWt0R1Ar7e7LND7_seGPdwR0gcJ
    
    # 네이버 뉴스 API
    naver.client.id=XcN6HzkH9r7UUwPurxNf
    naver.client.secret=_A0Hna9g98
    ```
- *.env*
  - 스마트 계약 생성 필요([Ethereum IDE](https://remix.ethereum.org/)
    ```
    # 아래 파일 참고

    # 저금통
    AccountContract.sol
    AccountABI.json

    # 카드
    CardContract.sol
    CardABI.json
    ```
  - Pinata API 키 발급 필요([Pinata API 가이드](https://docs.pinata.cloud/account-management/api-keys))

    ```INI
    # 예시

    # MetaMask 지갑 주소 입력
    REACT_APP_WALLET_ADDRESS=0x7KgaDDSVhoY1KsoCqm84ceY8A5d67u83jP5nhp2Q
    
    # 토큰 스마트 계약 주소 입력(저금통 기능)
    REACT_APP_FT_CONTRACT_ADDRESS=0xrq0uKCYW28EWsRivyxHpNav5DYTqQC7uEIxm90M6

    # NFT 스마트 계약 주소 입력(카드 기능)
    REACT_APP_NFT_CONTRACT_ADDRESS=0xaIYqeeiHQGgJBKJpp3pJPtRlfIO2gHbzxtnLpBDc

    # IPFS(Pinata) API
    REACT_APP_PINATA_API_KEY=vkSK26YhO9CKQqUczYtS
    REACT_APP_PINATA_SECRET_API_KEY=B5NVNWlIHhdz49c1vYbpk8720lKXMi4XKc4x1bjXB8YTctY1lJGiSzewFvgMzbz5
    ```

## Tasks
- [ ] 관리자 페이지 기능 개선
- [ ] 게시물 검색 및 정렬 기능 구현
- [ ] 채팅방 이미지 첨부 지원
- [ ] 전자서명 본인인증 프로세스 추가
- [ ] 대출상품 기반 매물 추천
