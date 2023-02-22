<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<%@ include file="/WEB-INF/common/style.jspf" %>
    <style>

  .store {
  	color: #35C5F0;
  	font-weight: bold;
  }
  .community {
  	color: black;
  }
  .category {
  	color: #35C5F0;
  	font-weight: bold;
  }
  .best, .home, .discount {
  color: black;
  }
  
 .text-left{
 	font-size: 1.3em;
 	font-weight: bold;
 	margin-left:20%;
 	color: black;
 	
 }

#catesm{
 	font-size: 0.8em;
 	margin-left:20%;
 }

 .catedt {
 	font-size: 1.2em;
 	cursor: pointer;
 	font-weight: bold;
 	list-style: none;
 }
 
 .catedt:hover{
 	color:#35C5F0;
 	font-weight: bold;
 }
 
 
 
 

  </style>
</head>
<body>
<div class="container">
<c:if test="${empty id }">
		<%@ include file="/WEB-INF/common/guestMenu.jspf" %>
	</c:if>
	<c:if test="${not empty id }">
		<%@ include file="/WEB-INF/common/memberMenu.jspf" %>
	</c:if>
<%@ include file="/WEB-INF/common/storeMenu.jspf" %>


<br>

 

<div class="container">
<div class="row">
<div class="col-3">
		
<div class="accordion" id="accordionExample">
    <div id="headingOne">
	        <p class="text-left" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	          	가구
	        </p>
    </div>
    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div>
        	<ul id="catesm">
        		<li onclick="location.href='category.do?categoryNum=1'" class="catedt">
        		전체보기
        		</li>
        		<li onclick="location.href='categorydt.do?categoryNum=1&categoryDetail=침대'" class="catedt">
        		침대
        		</li>
        		<li onclick="location.href='categorydt.do?categoryNum=1&categoryDetail=소파'" class="catedt">
        		소파
        		</li>
        		<li onclick="location.href='categorydt.do?categoryNum=1&categoryDetail=테이블·식탁·책상'" class="catedt">
        		테이블·식탁·책상
        		</li>
        	</ul>
      </div>
    </div>
    
    <div id="headingTwo">
	        <p class="text-left collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	          패브릭
	        </p>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
        <ul id="catesm">
        <li onclick="location.href='category.do?categoryNum=2'" class="catedt">
        	전체보기
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=2&categoryDetail=침구세트'" class="catedt">
        	침구세트
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=2&categoryDetail=커튼·부자재'" class="catedt">
        	커튼·부자재
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=2&categoryDetail=러그·카페트'" class="catedt">
       	 러그·카페트
        </li>
        </ul>
    </div>
    
    <div id="headingThree">
	        <p class="text-left collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="#collapseThree">
	          주방용품
	        </p>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
        <ul id="catesm">
        <li onclick="location.href='category.do?categoryNum=3'" class="catedt">
        	전체보기
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=3&categoryDetail=냄비·프라이팬·솥'" class="catedt">
        	냄비·프라이팬·솥
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=3&categoryDetail=그릇·홈세트'" class="catedt">
        	그릇·홈세트
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=3&categoryDetail=컵·잔·텀블러'" class="catedt">
       	 컵·잔·텀블러
        </li>
        </ul>
    </div>
    
    <div id="headingFour">
	        <p class="text-left collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="#collapseFour">
	          데코·식물
	        </p>
    </div>
    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
        <ul id="catesm">
        <li onclick="location.href='category.do?categoryNum=4'" class="catedt">
        	전체보기
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=4&categoryDetail=캔들·디퓨저'" class="catedt">
        	캔들·디퓨저
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=4&categoryDetail=인테리어소품'" class="catedt">
        	인테리어소품
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=4&categoryDetail=홈갤러리'" class="catedt">
       	 	홈갤러리
        </li>
        </ul>
    </div>

	
	<div id="headingfive">
	        <p class="text-left collapsed" data-toggle="collapse" data-target="#collapsefive" aria-expanded="false" aria-controls="#collapsefive">
	          조명
	        </p>
    </div>
    <div id="collapsefive" class="collapse" aria-labelledby="headingfive" data-parent="#accordionExample">
        <ul id="catesm">
        <li onclick="location.href='category.do?categoryNum=5'" class="catedt">
        	전체보기
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=5&categoryDetail=장스탠드'" class="catedt">
        	장스탠드
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=5&categoryDetail=단스탠드'" class="catedt">
        	단스탠드
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=5&categoryDetail=무드등·장식조명'" class="catedt">
       	 	무드등·장식조명
        </li>
        </ul>
    </div>
    
    <div id="headingSix">
	        <p class="text-left collapsed" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="#collapseSix">
	          수납·정리
	        </p>
    </div>
    <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordionExample">
        <ul id="catesm">
        <li onclick="location.href='category.do?categoryNum=6'" class="catedt">
        	전체보기
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=6&categoryDetail=서랍장·트롤리'" class="catedt">
        	서랍장·트롤리
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=6&categoryDetail=행거'" class="catedt">
        	행거
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=6&categoryDetail=선반'" class="catedt">
       	 	선반
        </li>
        </ul>
    </div>
    
    <div id="headingSeven">
	        <p class="text-left collapsed" data-toggle="collapse" data-target="#collapseSeven" aria-expanded="false" aria-controls="#collapseSeven">
	          생활용품
	        </p>
    </div>
    <div id="collapseSeven" class="collapse" aria-labelledby="headingSeven" data-parent="#accordionExample">
        <ul id="catesm">
        <li onclick="location.href='category.do?categoryNum=7'" class="catedt">
        	전체보기
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=7&categoryDetail=욕실용품'" class="catedt">
        	욕실용품
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=7&categoryDetail=청소용품'" class="catedt">
        	청소용품
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=7&categoryDetail=세탁용품'" class="catedt">
       	 	세탁용품
        </li>
        </ul>
    </div>
    
    <div id="headingEight">
	        <p class="text-left collapsed" data-toggle="collapse" data-target="#collapseEight" aria-expanded="false" aria-controls="#collapseEight">
	          반려동물
	        </p>
    </div>
    <div id="collapseEight" class="collapse" aria-labelledby="headingEight" data-parent="#accordionExample">
        <ul id="catesm">
        <li onclick="location.href='category.do?categoryNum=8'" class="catedt">
        	전체보기
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=8&categoryDetail=강아지'" class="catedt">
        	강아지
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=8&categoryDetail=고양이'" class="catedt">
        	고양이
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=8&categoryDetail=관상어'" class="catedt">
       	 	관상어
        </li>
        </ul>
    </div>
    
    <div id="headingNine">
	        <p class="text-left collapsed" data-toggle="collapse" data-target="#collapseNine" aria-expanded="false" aria-controls="#collapseNine">
	          캠핑용품
	        </p>
    </div>
    <div id="collapseNine" class="collapse" aria-labelledby="headingNine" data-parent="#accordionExample">
        <ul id="catesm">
        <li onclick="location.href='category.do?categoryNum=9'" class="catedt">
        	전체보기
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=9&categoryDetail=캠핑가구'" class="catedt">
        	캠핑가구
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=9&categoryDetail=텐트·타프'" class="catedt">
        	텐트·타프
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=9&categoryDetail=침낭·매트·해먹'" class="catedt">
       	 	침낭·매트·해먹
        </li>
        </ul>
    </div>
    
    <div id="headingTen">
	        <p class="text-left collapsed" data-toggle="collapse" data-target="#collapseTen" aria-expanded="false" aria-controls="#collapseTen">
	          유아·아동
	        </p>
    </div>
    <div id="collapseTen" class="collapse" aria-labelledby="headingTen" data-parent="#accordionExample">
        <ul id="catesm">
        <li onclick="location.href='category.do?categoryNum=10'" class="catedt">
        	전체보기
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=10&categoryDetail=유아·아동식기'" class="catedt">
        	유아·아동식기
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=10&categoryDetail=완구·교구'" class="catedt">
        	완구·교구
        </li>
        <li onclick="location.href='categorydt.do?categoryNum=10&categoryDetail=유아침구'" class="catedt">
       	 	유아침구
        </li>
        </ul>
    </div>
		
	</div>

</div>

	<div class="col-9">
	
	<%@ include file="/WEB-INF/store/store_slide.jspf" %>
	
	
	<br>
	<table style="width: 100%;">
		<tr>
			<td>전체 ${list.size() }개</td>
			<td style="text-align: right;">
				<div class="btn-group">
  <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
    인기순
  </button>
  <c:forEach var="vo" items="${list}">
  <div class="dropdown-menu">
    <a class="dropdown-item" href="#">인기순</a>
    <a class="dropdown-item" href="#">낮은가격순</a>
    <a class="dropdown-item" href="#">높은가격순</a>
    <a class="dropdown-item" href="#">최신순</a>
  </div>
  </c:forEach>
</div>
			</td>
		</tr>
	</table>
	<%@ include file="/WEB-INF/category/cate_card.jspf" %>
	
	
	</div>


</div>
</div>


<br><br>
<%@ include file="/WEB-INF/common/footer.jspf" %>
</div>
</body>
</html>