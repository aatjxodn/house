<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의집 - 이메일 문의</title>
<%@ include file="/WEB-INF/common/style.jspf"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
* {
	margin: 0px;
	text-decoration: none;
	list-style: none;
	font-family: sans-serif;
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
  	padding-bottom: 20px;
  }
  
  #layout1 .container1 {
  	width: 1280px;
  	margin: auto;
  }
 
  #layout1 .container1 .box1 {
  	padding-top: 50px;
  	padding-left: 300px;
  } 
 
  #layout1 .container1 .box1 .span1 {
  	font-size: 22px;
  	font-weight: bold;
  }
  
  #layout1 .container1 .box1 .span2 {
  }
  
  #layout1 .container1 .box1 .span2 b {
  	color: deepskyblue;
  }
  
  #layout1 .container1 .box1 .idx {
 	margin-left: 10px;
  	margin-top: 30px;
  	border-style: none;
  	padding-bottom: 15px;
  	padding-top: 15px;
  	padding-right: 50px;
  	padding-left: 15px;
  	border-radius: 10px;
  	border: 1px solid deepskyblue;
  }
  #layout1 .container1 .box1 ul {
  	width: 100%;
  	margin-top: 10px;
  }
  
  
  #layout1 .container1 .box1 ul li {
  	list-style: circle;
  	font-size: 12px;
  }
  
  #layout1 .container1 .box1 .text {
  	margin-top: 20px;
  }
   
   #layout1 .container1 .box1 .text input {
   	margin-top: 10px;
    padding-bottom: 15px;
  	padding-top: 15px;
  	padding-right: 430px;
  	padding-left: 15px;
  	border: 2px solid #f0f0f1;
  	border-radius: 5px;
  	color: #a7aaad;
  	font-weight: bold;
   }
   
   #layout1 .container1 .box1 .text textarea{
   	margin-top: 10px;
   	padding-bottom: 15px;
  	padding-top: 15px;
  	padding-right: 50px;
  	padding-left: 15px;
  	border: 2px solid #f0f0f1;
  	border-radius: 5px;
  	color: #a7aaad;
  	
   }
   
   #layout1 .container1 .box2 {
   	background-color: #f6f7f7;
   	width: 940px;
   	margin-left: 200px;
   	padding: 30px;
   	margin-top: 30px;
   	border: 1px solid #f6f7f7;
   	border-radius: 10px;
   	font-size: 15px;

   } 
   
   #layout1 .container1 #submit {
   	background-color: deepskyblue;
   	padding-bottom: 25px;
  	padding-top: 25px;
  	padding-right: 300px;
  	padding-left: 30px;
  	margin-left: 200px;
  	border-style: none;
  	font-weight: bold;
  	color: white;
  	border-radius: 10px;
  	margin-top: 20px;
  	font-size: 20px;
  	margin-bottom: 30px;
   }
   
   #layout1 .container1 #submit:hover {
	opacity: 0.5;
}

  
</style>

<script type="text/javascript"> 
	function a(y){
	   if (y.defaultValue==y.value) {
	      y.value = "";
	   }
	}
	
	
	$(document).ready(function(){
		$("#checkbox").change(function(){
     	   if($("#checkbox").is(":checked")){
     		  alert("개인정보 약관 동의 완료");
       		 }	else{
            	alert("개인정보 약관 동의 후 이용해주십시오.");
      		  }
   		 });
	});
</script>

</head>
<body>
<form action="inquiryWrite.do" method="post" enctype="multipart/form-data" onsubmit="aaa()">
	<div id="layout1">
		<div class="container1">	
		<%@ include file="/WEB-INF/common/style.jspf"%>
		<c:if test="${empty id }">
			<%@ include file="/WEB-INF/common/guestMenu.jspf" %>
		</c:if>
		<c:if test="${not empty id }">
			<%@ include file="/WEB-INF/common/memberMenu.jspf" %>
		</c:if>
		<%@ include file="WEB-INF/common/communityMenu.jspf" %>
				<div class="box1">
						<span class="span1">이메일 문의하기</span><br>
						<span class="span2">상품/배송 등 쇼핑 관련 문의는 <b>고객센터</b>에서 요청해주세요.</span><br>
						<select name="idx" class="idx">
							<option value="0">문의유형</option>
							<option value="1">회원정보 문의</option>
							<option value="2">쿠폰/포인트 문의</option>
							<option value="3">주문/결제 관련 문의</option>
							<option value="4">취소/환불 관련 문의</option>
							<option value="5">배송 관련 문의</option>
							<option value="6">주문 전 상품 정보 문의</option>
							<option value="7">서비스 개선 제안</option>
							<option value="8">시스템 오류 제보</option>
							<option value="9">불편 신고</option>
							<option value="10">기타문의</option>
						</select>
						<br>
						<ul>
							<li>앱 개선 제안은 '서비스 개선 제안'으로 선택해 주세요.</li>
							<li>앱 장애 신고는 '시스템 오류 제보'로 선택해 주세요.</li>
						</ul>
						<div class="text">
							<input type="text" name="name" title="이름" value="이름" onfocus="a(this)"><br>
							<input type="text" name="email" title="이메일" value="이메일" onfocus="a(this)"><br>
							<input type="text" name="subject" title="제목" value="제목" onfocus="a(this)"><br>
							<textarea name="comments" rows="10" cols="80" title="내용" onfocus="a(this)"></textarea>
							<input type="file" name="fileName"> 
						</div>
						<div class="file">
						</div>
					</div>
					<div class="box2">
						<input type="checkbox" name="checkbox" id="checkbox" required>
						<span><b>&nbsp;개인정보 수집 및 이용동의</b></span>
						<br>
						<span>1. 수집하는 개인정보 항목 : 이름, 이메일<br>
								2. 수집 목적 : 문의자 확인, 문의에 대한 회신 등의 처리<br>
								3. 보유 기간 : 목적 달성 후 파기, 단, 관계법령에 따라 또는 회사 정책에 따른 정보보유사유가 발생하여 보존할 필요가<br>
								 있는 경우에는 필요한 기간 동안 해당 정보를 보관합니다. 전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법<br>, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우, 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며<br>
								 , 다른 목적으로는 절대 이용하지 않습니다. (개인정보처리방침 참고)
								<br>4. 귀하는 회사의 정보수집에 대해 동의하지 않거나 거부할 수 있습니다. 다만, 이때 원활한 문의 및 서비스 이용 등이 제한<br>될 수 있습니다.
						</span>
				</div>
				<input id="submit" type="submit" name="submit" title="제출하기" value="제출하기"><br>
			<%@ include file="/WEB-INF/common/footer.jspf" %>
		</div>
	</div>
</form>
</body>
</html>