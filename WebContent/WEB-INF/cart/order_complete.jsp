<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모두의집</title>
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


  </style>
</head>
<body>
<div class="container">
<%@ include file="/WEB-INF/common/memberMenu.jspf" %>
<br><br>


<table style="width: 100%; text-align: center;">
	<tr>
		<td>
<img alt="결제완료" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdiuDtv%2FbtrPQHJ7sbe%2FT4Pik9Sr3CNtHuDgatkqC1%2Fimg.png">
		</td>
	</tr>
	<tr>
		<td>
<button type="button" class="btn btn-lg" id="btn" onclick="location.href='myshopping.do'" style="width: 30%;">
주문현황보기
</button>
		</td>
	</tr>
</table>







<br><br>
<%@ include file="/WEB-INF/common/footer.jspf" %>
</div>
</body>
</html>