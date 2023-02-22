<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<%@ include file="/WEB-INF/common/style.jspf"%>
<style>
.community {
	color: #35C5F0;
	font-weight: bold;
}

.store {
	color: black;
}

.home {
	color: #35C5F0;
	font-weight: bold;
}

.picture, .knowhow, .qna {
	color: black;
}
.cards-wrapper {
  display: flex;
  justify-content: center;
}
.card img {
  max-width: 100%;
  max-height: 100%;
}
.card {
  margin: 0 0.5em;
  box-shadow: 2px 6px 8px 0 rgba(22, 22, 26, 0.18);
  border: none;
  border-radius: 0;
  width: 300px;
}
.carousel-inner {
  padding: 1em;
}
.carousel-control-prev,
.carousel-control-next {
  background-color: #e1e1e1;
  width: 5vh;
  height: 5vh;
  border-radius: 50%;
  top: 50%;
  transform: translateY(-50%);
}
@media (min-width: 768px) {
  .card img {
  	width: 300px;
  	height: 300px;
  }
}
</style>
<script>
    $(document).ready(function(){
        let $list = $("#slide_list");
        
        //앞의 이미지 3개를 복사해서 맨 뒤에 붙이기
        $list.append($("#slide_item:lt(3)").clone());
        
        let clickCnt = 0;
        $("#next").click(function(){
            $list.stop(true); //기존 애니메이션 있으면 중지(큐삭제)
            clickCnt++;
            if (clickCnt > 10) {
                $list.css("margin-left", "0px");
                clickCnt = 1;
            }
            $list.animate({"margin-left": -270 * clickCnt + "px"}, 300);
        });      
    });
</script>
</head>
<body>
<div class="container">
	<c:if test="${empty id }">
		<%@ include file="/WEB-INF/common/guestMenu.jspf" %>
	</c:if>
	<c:if test="${not empty id }">
		<%@ include file="/WEB-INF/common/memberMenu.jspf" %>
	</c:if>
	<%@ include file="/WEB-INF/common/communityMenu.jspf" %>
	<div class="pb-4">
		<div class="text-center">
			<img height="500px" 
			src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FOrjcq%2FbtrPJFLsuta%2FXPpeftoSCCiHNzjP1xK1ZK%2Fimg.png">
			<img height="500px" width="270px" 
			src="https://image.ohou.se/i/bucketplace-v2-development/uploads/exhibitions/descriptions/163426184071526323.gif">
		</div>
		<div class="pt-5">
			<h5><b>카테고리별 상품 찾기</b></h5>
			<%@ include file="/WEB-INF/common/store_category.jspf" %>
		</div>
		<div class="pt-5">
			<h5><b>인기 사진 TOP 9</b></h5>
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  				<div class="carousel-inner">
    				<div class="carousel-item active">
      					<div class="cards-wrapper">
      						<c:forEach items="${picture1 }" var="vo">
      						<div class="card">
        						<img style="object-fit: cover;" src="${vo.thumbnail }" class="card-img-top">
      						</div>
      						</c:forEach>
    					</div>
    				</div>
    				<div class="carousel-item">
      					<div class="cards-wrapper">
      						<c:forEach items="${picture2 }" var="vo">
      						<div class="card">
        						<img style="object-fit: cover;" src="${vo.thumbnail }" class="card-img-top">
      						</div>
      						</c:forEach>        					
      					</div>
    				</div>
    				<div class="carousel-item">
      					<div class="cards-wrapper">
      						<c:forEach items="${picture3 }" var="vo">
      						<div class="card">
        						<img style="object-fit: cover;" src="${vo.thumbnail }" class="card-img-top">
      						</div>
      						</c:forEach>      					
      					</div>
    				</div>
  				</div>
  				<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    				<span class="sr-only">이전</span>
  				</a>
  				<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    				<span class="carousel-control-next-icon" aria-hidden="true"></span>
    				<span class="sr-only">다음</span>
  				</a>
			</div>
		</div>
		<div class="pt-5">
			<h5><b>인기 노하우 TOP 9</b></h5>
			<div id="carouselExampleControls2" class="carousel slide" data-ride="carousel">
  				<div class="carousel-inner">
    				<div class="carousel-item active">
      					<div class="cards-wrapper">
      						<c:forEach items="${knowhow1 }" var="vo">
      						<div class="card">
        						<img style="object-fit: cover;" src="${vo.thumbnail }" class="card-img-top">
        						<div class="card-body">
          							<p class="card-text">${vo.subject }</p>
        						</div>
      						</div>
      						</c:forEach>
    					</div>
    				</div>
    				<div class="carousel-item">
      					<div class="cards-wrapper">
      						<c:forEach items="${knowhow2 }" var="vo">
      						<div class="card">
        						<img style="object-fit: cover;" src="${vo.thumbnail }" class="card-img-top">
        						<div class="card-body">
          							<p class="card-text">${vo.subject }</p>
        						</div>
      						</div>
      						</c:forEach>        					
      					</div>
    				</div>
    				<div class="carousel-item">
      					<div class="cards-wrapper">
      						<c:forEach items="${knowhow3 }" var="vo">
      						<div class="card">
        						<img style="object-fit: cover;" src="${vo.thumbnail }" class="card-img-top">
        						<div class="card-body">
          							<p class="card-text">${vo.subject }</p>
        						</div>
      						</div>
      						</c:forEach>      					
      					</div>
    				</div>
  				</div>
  				<a class="carousel-control-prev" href="#carouselExampleControls2" role="button" data-slide="prev">
    				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    				<span class="sr-only">이전</span>
  				</a>
  				<a class="carousel-control-next" href="#carouselExampleControls2" role="button" data-slide="next">
    				<span class="carousel-control-next-icon" aria-hidden="true"></span>
    				<span class="sr-only">다음</span>
  				</a>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/common/footer.jspf" %>
</div>
</body>
</html>