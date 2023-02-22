<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="/WEB-INF/common/style.jspf" %>
    <style>
    
  .store {
  	color: black;
  }
  .community {
  	color: black;
  }
  
   .bordname{
 	font-size: 1.2em;
 }

.card-img-top {
    width: 100%;
    height: 14rem;
    object-fit: cover;
}


#mysp, #myrv, #myupdate,
#knowhow, #qa, #collections{
	color: black;
}



#mypage, #picture	{
	color: #35C5F0;
	}



#card:hover {
  	transform: scale(1.1);
	}



  </style>
</head>
<body>
<div class="container">
<%@ include file="/WEB-INF/common/memberMenu.jspf" %>
<%@ include file="/WEB-INF/common/mypageMenu.jspf" %>
<%@ include file="/WEB-INF/mypage/profile.jspf" %>
<br><br>


<div class="container">
<div class="row">
<div class="col-3">

<%@ include file="/WEB-INF/mypage/profilecard.jspf" %>

</div>

<div class="col-9">

<div class="container">
<div class="row">

<c:if test="${empty list }">
			<div class="text-center col-12">
     			<p style="color: gray; font-size: 0.9em;">결과가 존재하지 않습니다</p>
     		</div>	
</c:if>

<c:if test="${not empty list }">
<c:forEach items="${list }" var="vo">
<div class="col-xl-4 col-lg-6 mb-3">
<div class="card" id="card" style="width: 15rem; cursor: pointer;" onclick="location.href='pictureDetail.do?idx=${vo.pictureIdx }'">
  <img src="${vo.thumbnail }" class="card-img-top" alt="...">
  <div class="card-body">
    <p class="card-text">
    		&nbsp;
    		<span class="col-sm-4"><i class="far fa-heart"></i> ${vo.likeCnt }</span>
    		<span class="col-sm-4"><i class="far fa-bookmark"></i> ${vo.scrapCnt }</span>
    		<sapn class="col-sm-4"><i class="far fa-comment"></i> ${vo.c1Cnt+vo.c2Cnt }</sapn>
    </p>
  </div>
</div>
</div>
</c:forEach>
</c:if>






</div>


</div>
</div>



</div>
</div>
<br><br>
<%@ include file="/WEB-INF/common/footer.jspf" %>
</div>
</body>
</html>