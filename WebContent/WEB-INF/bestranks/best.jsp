<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 인기상품</title>
<%@ include file="/WEB-INF/common/style.jspf" %>

    <style>
 .today{
 	font-size: 0.8em;
 	margin-left:2%;
 	color: #A6A6A6;
 }

  .store {
  	color: #35C5F0;
  	font-weight: bold;
  }
  .community {
  	color: black;
  }
  .best {
  	color: #35C5F0;
  	font-weight: bold;
  }
  .category, .home, .discount {
  color: black;
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

<br><br>
<div class="text-center">
	<div class="btn-group text-center" id="butt" role="group" aria-label="Basic example">
		<button type="button" class="btn" id="btn" onclick="location.href='bestranks.do'">실시간 베스트</button>
		<button type="button" class="btn btn-light" onclick="location.href='mostbest.do'">역대베스트</button>
	</div>
</div>

<br>

<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm");
%>


<span class="today"><%= sf.format(nowTime) %> 기준</span>

<%@ include file="/WEB-INF/store/store_bestcard.jspf" %>

<br><br>
<%@ include file="/WEB-INF/common/footer.jspf" %>
</div>
</body>
</html>