# 인테리어 플랫폼 '모두의집'
![홈화면](https://user-images.githubusercontent.com/80879666/199145404-3e6fa3dd-90f5-450c-b2c4-cc36d1d22350.PNG)
## 주제
![주제](https://user-images.githubusercontent.com/80879666/199147728-4e32c104-48b9-4af8-91ed-c642aa92d40c.png)
인테리어 사진과 정보를 공유하고 질문 답변을 할 수 있는 **커뮤니티 기능**과 원하는 인테리어 용품을 구매하고 판매할 수 있는 **쇼핑몰 기능**을 모두 사용할 수 있는 인테리어 플랫폼 웹사이트
## 메뉴 구성
+ **회원 관리**: 회원가입, 로그인, 아이디 찾기, 비밀번호 재설정, 판매자 신청, 회원정보 수정, 비밀번호 변경, 회원탈퇴
+ **커뮤니티**: 커뮤니티홈, 사진 게시판, 노하우 게시판, 질문 답변 게시판, 고객센터
+ **스토어**: 스토어홈, 카테고리, 베스트, 기획전, 상품 상세보기, 주문/결제, 문의/리뷰, 장바구니
+ **마이페이지**: 작성한 글과 댓글 조회, 스크랩 목록 조회 
+ **나의쇼핑**: 주문/배송내역 조회, 문의내역 조회, 포인트 조회
+ **판매자**: 판매상품 조회, 등록, 수정, 삭제
## 개발 환경
+ **프로젝트 기간**: 2022.10.14 ~ 2022.10.31
+ **개발 웹서버**: Apache Tomcat 8.0
+ **개발 툴**: Eclipse IDE, Oracle SQL Developer
+ **사용 언어**: Java(JDK 1.8), SQL, JSP & Servlet, HTML/CSS, JavaScript
## 역할 분담
+ **서태우(팀원)**: DB 설계, 프론트엔드와 백엔드 개발(커뮤니티 / 스토어)
+ **안지수(팀장)**: DB 설계, 프론트엔드와 백엔드 개발(회원관리 / 커뮤니티)
+ **임다은(팀원)**: DB 설계, 프론트엔드와 백엔드 개발(스토어 / 마이페이지)
+ **조아현(팀원)**: DB 설계, 프론트엔드와 백엔드 개발(나의쇼핑 / 판매자)
## DB 설계
![DB](https://user-images.githubusercontent.com/80879666/199145974-cab664d9-335a-453b-ab99-45f1fbd72b27.png)
### 커뮤니티
![커뮤니티](https://user-images.githubusercontent.com/80879666/199147525-317ace81-9c84-4cbd-9552-55fca5bee402.png)
+ **사진 게시판**: 사진글(PICTURE), 사진댓글(PICCOMMENT), 사진대댓글(PICCOMMENT2), 사진글좋아요(PICLIKE)
+ **노하우 게시판**: 노하우(KNOWHOW), 노하우댓글(KNOWCOMMENT), 노하우대댓글(KNOWCOMMENT2), 노하우좋아요(KNOWLIKE)
+ **질문과 답변 게시판**: 질문(REQUEST), 질문글답변(REQUEST_COM), 질문좋아요(REQUEST_LIKE)
+ **고객센터**: 고객센터질문(INQUIRY), 고객센터답변(INQUIRY_COM), FAQ질문(GOGAK), FAQ답변(GOGAK_COMMENT)
### 회원
![회원](https://user-images.githubusercontent.com/80879666/199147533-1d75df47-bb53-4b8a-a17a-80d8b383a205.png)
+ **회원**: 회원(MEMBERS), 회원등급(GRADE), 포인트내역(POINT_LOG), 나의스크랩(MYSCRAP)
+ **파트너(판매자)**: 파트너(PARTNER), 상품 관리 내역(PRODUCT_LOG)
### 스토어
![스토어](https://user-images.githubusercontent.com/80879666/199147539-cf75f0c3-ff24-473c-8bf3-2009edf893f2.png)
+ **상품**: 상품(PRODUCT), 상품이미지(PRODUCT_IMG), 상품카테고리(CATEGORY), 상품상세카테고리(CATEGORY_DETAIL)
+ **장바구니**: 장바구니(CART)
+ **주문/결제**: 주문상품(ORDER_PRODUCT), 주문/결제(ORDERS)
+ **문의 게시판**: 제품문의(PRODUCTINQUIRY), 제품문의댓글(PRODUCTINQUIRY_COM)
+ **리뷰 게시판**: 리뷰(REVIEWS)
