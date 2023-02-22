<%@page import="com.mystudy.house.model.vo.Gogak_CommentVO"%>
<%@page import="com.mystudy.house.model.vo.GogakVO"%>
<%@page import="com.mystudy.house.model.dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String) session.getAttribute("id");
	
	GogakVO vo = new GogakVO();
	Gogak_CommentVO vo2 = new Gogak_CommentVO();
	

	DAO.gogakInfo(vo.getInfo());
	DAO.gogak_commInfo(vo2.getInfo());
	
	pageContext.setAttribute("list", DAO.gogakInfo(vo.getInfo()));
	pageContext.setAttribute("list2", DAO.gogak_commInfo(vo2.getInfo()));
	System.out.println(DAO.gogakInfo(vo.getInfo()));
	System.out.println(DAO.gogak_commInfo(vo2.getInfo()));
	
	
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의집 - 고객센터</title>
<%@ include file="/WEB-INF/common/style.jspf"%>
  

<style>
* {
	margin: 0px;
	text-decoration: none;
	list-style: none;
}
  .community {
	color: #35C5F0;
	font-weight: bold;
  }
  .store {
  	color: black;
  }
  
  .home, .picture, .knowhow, .qna {
  	color: black;  
  }
  
  #layout1 {
  	width: 100%;
  	margin-bottom: 450px;
  }
  
  #layout1 .container1 {
  	width: 1280px;
  	margin: auto;
  }
  
  #layout1 .container1 .box1 {
    display: block;
    padding-left: 80px;
    width: 50%;
    float: left;
  }
  
  #layout1 .container1 .box1 span{
 	display: block;
  	font-weight: bold;
  	font-size: 22px;
  	padding-top: 110px;
  	margin-left: 30px;
  }
  
  #layout1 .container1 .box1 ul {
	padding-top: 30px;
  }
  
  #layout1 .container1 .box1 ul li{
  	list-style: none;
  	padding-top: 10px;
  }
  
  #layout1 .container1 .box2 {
  	display: block;
 	 float: right;
 	 width: 50%;
 	 background-color: #f6f7f7;
 	 height: 350px;
 	 padding-top: 50px;
 	 margin-top: 50px;
 	 border-radius: 10px;
 	 box-shadow: 1px 1px 1px 1px rgba(0, 0, 0, 0.1);
  }
  
  #layout1 .container1 .box2 .span1 {
  	font-size: 22px;
  	padding-left: 20px;
  	
  }
  
  #layout1 .container1 .box2 .span1 b{
  	color: deepskyblue;
  }
  
  #layout1 .container1 .box2 .span2 {
  	font-size: 22px;
  	padding-left: 20px;
  	color: deepskyblue;
  	font-weight: bold;
  }
  
  #layout1 .container1 .box2 ul {
  	padding-top: 10px;
  }
  
  #layout1 .container1 .box2 ul li {
  padding-top: 5px;
  }
  
  #layout1 .container1 .box2 .button {
  	margin-top: 40px;
  	
  }
  
  #layout1 .container1 .box2 span a {
  	padding-top: 20px;
  	padding-bottom: 20px;
  	padding-left: 20px;
  	padding-right: 150px;
  	width: 250px;
  	margin-left: 10px;
  	border: 1px solid deepskyblue;
  	color: deepskyblue;
  	background-color: white;
  	border-radius: 8px;
  	text-align: center;
  	font-weight: bold;
  }
  
  #layout1 .container1 .box2 span a:hover {
  	opacity: 0.4;
  	text-decoration: none;
  }
  
  #layout1 .container1 .box2 span .but1 {

  	display: inline-block;
  	padding-top: 20px;
  	padding-bottom: 20px;
  	padding-left: 20px;
  	padding-right: 150px;
  	text-align: center;
  	border-radius: 8px;
  	background-color: white;
  	border: 1px solid deepskyblue;
  	color: deepskyblue;
  }
  
  #layout1 .container1 .box2 span .but1:hover {
  	opacity: 0.4;
  	text-decoration: none;
  }
  
  .jol {
  	background-color: #f6f7f7;
  	width: 100%;
  	height: 10px;
  	margin-top: 30px;
  }
  

  #layout2 {
  	width: 100%;
	margin-bottom: 50px;
  }
  
  #layout2 .container2 {
  	width: 1280px;

  	margin: auto;
  }
  
  #layout2 .container2 .con2-tag {
  	width: 100%;
  	height: 80px;
  }
  
  #layout2 .container2 .con2-tag ul {
  	margin-left: 160px;
  }
  #layout2 .container2 .con2-tag ul li {
  	display: inline-block;
  	margin-top: 20px;
  	margin-right: 10px;

  }
  
  #layout2 .container2 .con2-tag ul li .one {
  	padding: 10px;
  	border-radius: 50px;
  	border-style: none;
  }
  
  #layout2 .container2 .con2-tag ul li .one:hover {
	opacity: 0.4;
	
}

#layout2 .container2 .con2-list {
	width: 100%;

}

#layout2 .container2 .con2-list ul {
	margin-left: 150px;
}

#layout2 .container2 .con2-list ul .btn-primary {
	border: none;
	display: block;
	padding: 20px;
	width: 100%;
	text-align: left;
	background-color: white;
	border-bottom: 2px solid #f6f7f7;
	color: black;
}

#layout2 .container2 .con2-list ul .btn-primary:hover {
	opacity: 0.5;
}
 
#layout2 .container2 .con2-list ul li .two {
	margin-top: 10px;
	padding-bottom: 15px;
	padding-top: 15px;
	border-style: none;
	border-bottom: 3px solid #f6f7f7;
	width: 100%;
	background-color: white;
	text-align: left;
}
  
  
</style>
<script>

</script>
</head>
<body>
	<div id="layout1">
		<div class="container1">
		<c:if test="${empty id }">
		<%@ include file="/WEB-INF/common/guestMenu.jspf" %>
	</c:if>
	<c:if test="${not empty id }">
		<%@ include file="/WEB-INF/common/memberMenu.jspf" %>
	</c:if>
	<%@ include file="/WEB-INF/common/communityMenu.jspf" %>
			<div class="box1">
				<span>무엇을 도와드릴까요?</span>
				<ul>
					<li>배송은 얼마나 걸리나요?</li>
					<li>주문취소는 어떻게 하나요?</li>
					<li>제품의 자세한 정보를 알고싶어요.</li>
					<li>제품이 불량일 때는?</li>
					<li>카카오 계정으로 로그인하면 이미 가입되었다고 합니다.</li>
				</ul>
			</div>
			<div class="box2">
				<span class="span1">고객센터 <b>09:00 ~ 18:00</b></span>
				<ul>
					<li>평일: 전체 문의 상담 가능</li>
					<li>주말/공휴일: 오늘의집 직접배송 및 이사/시공/수리 문의에 한해 전화 상담 가능</li>
				</ul>
				<span class="span2"><i>1670-0876</i></span>
				<div class="button">
					<span><a href="inquiry.do">이메일 문의하기</a></span>
					<span><input class="but1" type="button" value="이메일 주소 복사하기""></span>
				</div>
			</div>
		</div>
	</div>
	<div class="jol"></div>
	<div id="layout2">
		<div class="container2">
			<div class="con2-tag">
				<ul>
					<li><input type="button" value="전체" class="one"></li>
					<li><input type="button" value="주문/결제" class="one"></li>
					<li><input type="button" value="배송관련" class="one"></li>
					<li><input type="button" value="취소/환불" class="one"></li>
					<li><input type="button" value="반품/교환" class="one"></li>
					<li><input type="button" value="증빙서류발급" class="one"></li>
					<li><input type="button" value="로그인/회원정보" class="one"></li>
					<li><input type="button" value="서비스/기타" class="one"></li>
				</ul>
			</div>
			<div class="con2-list">	
				<ul>
					<c:forEach var="vo" items="${list }" varStatus="status1">
						<button class="btn-primary" type="button" data-toggle="collapse" data-target="#col${status1.index }" aria-expanded="false" aria-controls="collapseExample">${vo }</button>
						<div class="collapse" id="col${status1.index }">
 							 <div class="card card-body">
    							${list2[status1.index] }
  							</div>
						</div>
					</c:forEach>
				</ul>
			</div>	
		</div>
	</div>
	
	<div style="width: 1280px; margin: auto;" ><%@ include file="WEB-INF/common/footer.jspf" %></div>

</body>
</html>