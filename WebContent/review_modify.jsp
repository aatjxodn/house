<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	request.setCharacterEncoding("UTF-8");
	String idx = request.getParameter("idx");
%>	
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>리뷰 쓰기</title>
<%@ include file="/WEB-INF/common/style.jspf"%>
<style>

	#layout1 {
		width: 100%;
	}
	
	#layout1 .container1 {
		width: 1280px;
		margin: auto;
	}
	
	#layout1 .container1 button span {
		float: right;
		margin-right: 40px;
	}
	
	#layout1 .container1 button:hover {
		opacity: 0.5;
		border: 1px solid black;
		color: : black;
	}

	#layout2 {
		width: 100%;
	}
	
	#layout2 .container2 {
		width: 1280px;
		margin: auto;
	}
	
	#layout2 .container2 form input:first-child {
		width: 1113px;
		margin-top: 20px;
	}
	
	.btn-upload:hover {
		opacity: 0.5;
		color: black;
		border: 1px solid black;
		cursor: pointer;
	}
	
	#layout2 .container2 form {
		margin-bottom: 100px;
	}
	
	
	
	#layout2 .container2 form input {	
 		 color: silver;
 		 border: 3px solid #f0f1f1;
 		 border-radius: 5px;
 		 font-size: 18px;
 		 font-weight: bold;
 		 padding: 20px;
		 margin: 5px auto 0px auto;
	     display: block;
	     text-align: center;
	}
	
	#layout2 .container2 form input:last-child {
		display: inline;
		padding: 20px 100px 20px 100px;
	}
	
	#layout2 .container2 form input:last-child:hover {
		opacity: 0.5;
		color: black;
		border: 1px solid black;
	}

	
	#layout2 .container2 form textarea {
		 width: 1113px;
 		 color: silver;
 		 border: 3px solid #f0f1f1;
 		 border-radius: 5px;
 		 margin-top: 20px;
 		 font-size: 18px;
 		 font-weight: bold;
 		 padding: 20px 0px 15px 0px;
		 margin: auto;
	     display: block;
	     padding: 20px;
	}
	
	
	.fileName:hover {
		opacity: 0.5;
		cursor: pointer;
	}

</style>
<script type="text/javascript"> 
	function a(y){
	   if (y.defaultValue==y.value) {
	      y.value = "";
	   }
	}
	
	
	function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview').src = "";
		  }
	}
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
	<%@ include file="WEB-INF/common/communityMenu.jspf" %>
			<div class="box1">
				<div class="container">
 					<button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo" 
 						style=
 						"width: 100%;
 						 color: black;
 						 background-color: #f0f1f1;
 						 border: none;
 						 margin-top: 20px;
 						 font-size: 18px;
 						 font-weight: bold;
 						 padding: 20px 0px 15px 0px;
 						">
 						오늘의집 리뷰정책<span>&#x25bc;</span>
 					</button>
 					<div id="demo" class="collapse" style="width: 100%; color: black; background-color: #f0f1f1; border: none; padding: 20px; font-size: 12px;">
 				  	    다음 금지행위에 해당되는 리뷰는 오늘의집 서비스 이용 약관 제24조에 따라 고객에게 통보 없이 삭제 또는 블라인드 될 수 있습니다.<br>
    	  			  	보다 자세한 내용은 <a href="gogak.jsp" style="color: deepskyblue;"><b>고객센터</b></a> Q&A에서 확인하실 수 있습니다.<br><br>
	
		 			    <b>&#60;리뷰 작성 시 금지행위&#62;</b><br>
		  				1. 특정 내용의 리뷰 작성 조건으로 대가를 제공받고 이를 표시하지 않거나, 기타 특정업체의 영리적 목적을 위하여 리뷰를 게시한 경우<br>
					    2. 동일 상품에 대해 반복적 리뷰 게시<br>
					    3. 허위/과장된 내용 또는 직접 작성하지 않았거나 구매한 상품과 관련 없는 내용 게시<br>
				      	4. 정당한 권한 없이 타인의 권리 등(개인정보, 지식재산권, 소유권, 명예, 신용 등)을 침해하는 내용 게시<br>
						5. 욕설, 폭언, 비방 등 타인에 불쾌하거나 위협이 되는 내용 게시<br>
						6. 음란물 또는 청소년 유해 매체물, 범죄행위나 불법적인 행동을 전시 또는 조장하는 내용 게시<br>
						7. 정보통신기기의 오작동을 일으킬 수 있는 악성코드나 데이터를 포함하는 리뷰 게시<br>
						8. 사기성 상품, 서비스, 사	업 계획 등을 판촉하는 리뷰 게시<br>
						9. 기타 관련법령 및 이용약관, 운영정책에 위배되는 리뷰 게시<br>
  					</div>
  				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	<div id="layout2">
		<div class="container2">
			<div class="box2">
				<form action="review_modify_ok.jsp?idx=<%=idx %>" method="post" enctype="multipart/form-data">				
					<input type="text" value="평점을 남겨주세요!(5점 이하)" name="star" id="star" onfocus="a(this)" style="color: darkorange;"><br>
					<label for="fileName" class="fileName" style="border: none; background-color: #f6f7f7; color: black; padding: 20px 120px 20px 50px; border-radius: 5px; font-weight: bold; font-size: 20px; width: 1113px; margin-left: 83px; text-align:  center; margin-bottom: 30px;">파일 업로드</label>
					<input type="file" name="fileName" id="fileName" onchange="readURL(this);" style="display: none;">
					<img id="preview" style="width: 1113px; margin: auto; margin-bottom: 20px; margin-left: 83px;"/>
					<textarea name="comments" rows="15" cols="80" title="내용" onfocus="a(this)">내용을 입력하세요.</textarea><br>
					<input type="submit" name="submit" value="수정완료" style="float: right; margin-right: 80px;">
				</form>
			</div>
				
<%@ include file="WEB-INF/common/footer.jspf" %>
		</div>
	</div>
	
</body>
</html>







