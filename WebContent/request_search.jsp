<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/common/style.jspf"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="/WEB-INF/common/style.jspf"%>
<style>
  		.community {
  			color: #35C5F0;
  			font-weight: bold;
  		}
  		.store {
  			color: black;
  		}
  		.qna {
  			color: #35C5F0;
			font-weight: bold;
  		}
  		.picture, .home, .knowhow {
  			color: black;
  		}
* {
	margin: 0px;
	text-decoration: none;
	list-style: none;
	font-family: sans-serif;
}
	
  #layout1 {
  	width: 100%;
  	background-color: #f6f7f7;
  	padding-bottom: 50px;
  }
  
  #layout1 .container1 {
  	width: 100%;
  	margin: auto;
  }
  
   #layout1 .container1 .box1 {
   	width: 100%;
   }
   
     #layout1 .container1 .box1 form {
     	text-align: center;
     }
   
   #layout1 .container1 .box1 .span1 {
   	display: block;
   	padding-top: 100px;
   	text-align: center;
   	font-size: 22px;
   	font-weight: bold;
   }
   
   #layout1 .container1 .box1 .span2 {
   	display: block;
   	padding-top: 20px;
   	text-align: center;
   	
   }
   
   #layout1 .container1 .box1 .catag {
   	width: 100%;
   	margin-top: 50px;
   }
   
   #layout1 .container1 .box1 .catag span{
   	margin-left: 430px;
   	margin-right: 25px;
   	font-size: 12px;
   	font-weight: bold;
   }
   
   

   
   #layout1 .container1 .box1 .search{
   	display: inline-block;
   	padding-bottom: 15px;
   	padding-top: 15px;
   	padding-left: 20px;
   	padding-right: 150px;	
   	color: silver;
   	border-radius: 10px;
   	border: 2px solid #f0f0f1;
   }
   
   #layout1 .container1 .box1 input:hover {
	opacity: 0.8;
	}
	
	
	#idx {
		
		display: inline;
		color: #a7aaad;
		padding-bottom: 15px;
   		padding-top: 15px;
   		padding-left: 15px;
   		padding-right: 15px;
   		border-radius: 10px;
   		border: 2px solid #f0f0f1;
   
	}
	
	#searcharea {
		display: inline-block;
	   	padding: 15px;
	   	color: #a7aaad;
	   	border-radius: 10px;
	   	border: 2px solid #f0f0f1;
	   	background-color: white;
	}
	
	#layout2 {
		margin-bottom: 30px;
	}
	
	#layout2 .container2 {
		width: 1100px;
		margin: auto;
		margin-bottom: 20px;
	}
	
	#layout2 .container2 .box2 {
		width: 100%;
		margin: auto;
	}
	
	#layout2 .container2 .box2 table {
		width: 1100px;
	}
	

	#layout2 .container2 .box2 tr {
		display: block;
		border-bottom: 2px solid #f6f7f7;
	}
	
	

	#layout2 .container2 .box2 tr td {
		width: 300px;
		padding: 60px 30px;;
		text-align: center;
	}
	
	
	#layout2 .container2 .box2 tr td a {
		color: deepskyblue;
	}
	
	
	
	
	/*** 페이지 표시 영역 스타일(시작) ****/
	#layout2 .container2 table {
		margin: auto;
	}
	
	.paging {
	 	list-style: none; 
	 	margin-top: 30px;
	 }
	
	.paging li {
		float: left;
		margin: 0px 5px;
	}

	
	#layout2 .container2 table tr input {
		border: 1px solid deepskyblue;
		border-radius: 5px;
		background-color: deepskyblue;
		font-weight: bold;
		color: white;
		padding: 4px 7px;
	}

  	#requestButton:hover {
		opacity: 0.5;
	}

</style>
<script type="text/javascript"> 
	function a(y){
	   if (y.defaultValue==y.value) {
	      y.value = "";
	   }
	}
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
	<%@ include file="WEB-INF/common/communityMenu.jspf" %>
	<div id="layout1">
		<div class="container1">
			<div class="box1">
				<span class="span1">질문과 답변</span>
				<span class="span2">오늘의집 인테리어 고수들과 전문가들에게 조언을 받아보세요.</span><br>
				<form action="search" method="get">
					<select name="idx" id="idx">
						<option value="0">제목</option>
						<option value="1">아이디</option>
					</select>
					<input type="text" value="입력" class="search" name="keyword" onfocus="a(this)">				
					<input type="hidden" value="검색" id="searcharea">				
				</form>
			</div>
		</div>
	</div>
	<div id="layout2">
		<div class="container2">
			<div class="box2">
				<table>
					<c:choose>
						<c:when test="${empty search }"> 
								<h2>현재 등록된 게시글이 없습니다</h2>
						</c:when>
					<c:otherwise>
						<c:forEach var="vo" items="${search }">
							<tr>
								<c:if test="${not empty vo.fileName }">
									<td>
										<img src="${pageContext.request.contextPath}/requestImage/${vo.fileName }" width="150px" height="150px" />
									</td>		
								</c:if>
								<td class="align-left">
									<a href="view.jsp?requestIdx=${vo.requestIdx }&cPage=${pvo.nowPage}" onclick="view(a)">${vo.subject }</a>
								</td>
								<td>${vo.id }</td>
								<td>${vo.views }</td>								
								<td id="last">${vo.regdate.substring(0,10) }</td>
							</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>	
						
					</table>
				</div>
					
				
			</div>
			<%@ include file="WEB-INF/common/footer.jspf" %>
		</div>
	</div>
</body>



</html>