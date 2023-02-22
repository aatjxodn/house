<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모두의집 - 스토어</title>
<%@ include file="/WEB-INF/common/style.jspf" %>
    <style>

  .store {
  	color: #35C5F0;
  	font-weight: bold;
  }
  .community {
  	color: black;
  }
  .home {
  	color: #35C5F0;
  	font-weight: bold;
  }
  .category, .best, .discount {
  color: black;
  }
  
 .bordname{
 	font-size: 1.2em;
 }
  
  </style>
</head>
<body>


<div class="container">
<c:if test="${empty id }">
			<%@ include file="/WEB-INF/common/guestMenu.jspf"%>
		</c:if>
		<c:if test="${not empty id }">
			<%@ include file="/WEB-INF/common/memberMenu.jspf"%>
		</c:if>
<%@ include file="/WEB-INF/common/storeMenu.jspf" %>

<div class="container-fluid">
<%@ include file="/WEB-INF/store/store_slide.jspf" %>
<br>
<!--  
<div>
<b class="bordname"> 오늘의딜</b>
<br>
include file="/WEB-INF/store/store_ocard.jspf" %>
</div>
-->

<br><br>
<b class="bordname"> 카테고리</b>
<br><br>
<%@ include file="/WEB-INF/store/store_category.jspf" %>



<br><br>
<b class="bordname"> 인기상품</b>
<br><br>
<%@ include file="/WEB-INF/store/store_bestcard.jspf" %>
<br>


<br><br>
</div>
<%@ include file="/WEB-INF/common/footer.jspf" %>
</div>
</body>
</html>