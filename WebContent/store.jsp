<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의집 - 스토어</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
  .community {
  	color: black;
  }
  .store {
  	color: blue;
  }
  </style>
</head>
<body>
<%@ include file="WEB-INF/common/guestMenu.jspf" %>
<%@ include file="WEB-INF/common/storeMenu.jspf" %>


<%@ include file="WEB-INF/common/footer.jspf" %>
</body>
</html>