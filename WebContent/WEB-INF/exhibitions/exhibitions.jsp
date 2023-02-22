<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기획전</title>
<%@ include file="/WEB-INF/common/style.jspf" %>
    <style>
 
  .store {
  	color: #35C5F0;
  	font-weight: bold;
  }
  .community {
  	color: black;
  }
  .discount {
  	color: #35C5F0;
  	font-weight: bold;
  }
  .category, .home, .best {
  color: black;
  }

.eximg>a>img {
	border-radius: 5px;
}

h5 {
	font-weight: bold;
}
</style>
</head>
<body>
<div class="container">
	<%@ include file="/WEB-INF/common/memberMenu.jspf" %>
	<%@ include file="/WEB-INF/common/storeMenu.jspf" %>


	<br>
	<br>

	<div class="container">
		<div class="row">
			<div class="col-6 mt-4">
				<div class="card">
					<img
						src="https://image.ohou.se/i/bucketplace-v2-development/uploads/exhibitions/descriptions/166573096843168422.gif"
						class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">인기 캠핑용품을 한자리에!</p>
						<h5 class="card-title">가을캠핑 페스티벌 ~83%</h5>
						<a href="#" class="btn" id="btn">기획전 보기</a>
					</div>
				</div>
			</div>
			
			<div class="col-6 mt-4">
				<div class="card">
					<img
						src="https://image.ohou.se/i/bucketplace-v2-development/uploads/exhibitions/descriptions/166608106798121700.gif"
						class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">방한용품의 모든 것</p>
						<h5 class="card-title">겨울 인기템 초특가 윈터세일 ~80%</h5>
						<a href="#" class="btn" id="btn">기획전 보기</a>
					</div>
				</div>
			</div>
			
			<div class="col-6 mt-4">
				<div class="card">
					<img
						src="https://image.ohou.se/i/bucketplace-v2-development/uploads/exhibitions/descriptions/166572090722968843.gif"
						class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">한 달에 한 번! 엄마아빠 득템찬스</p>
						<h5 class="card-title">KIDS&BABY FAIR ~67%</h5>
						<a href="#" class="btn" id="btn">기획전 보기</a>
					</div>
				</div>
			</div>
			
			
			

		</div>
	</div>

<br><br>
	<%@ include file="/WEB-INF/common/footer.jspf"%>
	</div>
</body>
</html>