<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String) session.getAttribute("id");
	String productNum = request.getParameter("productNum");
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품문의</title>
<%@ include file="/WEB-INF/common/style.jspf"%>
<style>
	#layout1 {
		width: 100%;
	}
	
	#layout1 .container1 {
		width: 1280px;
		margin: auto;
	}
	
	#layout1 .container1 .box1 {
		width: 600px;
		margin: 30px auto 60px auto;
		box-shadow: 1px 1px 2px 2px rgba(0, 0, 0, 0.2);
		border-radius: 10px;
	}
	


	.btn-upload:hover {
		opacity: 0.5;
		color: black;
		border: 1px solid black;
		cursor: pointer;
	}
	
	#submit{
		display:inline;
		border: none; 
		background-color: deepskyblue; 
		color: white; 
		border-radius: 5px; 
		font-weight: bold; 
		font-size: 12px;
		margin-bottom: 20px;
		border: none; 
		padding: 10px 30px;
		margin-left: 50px; 
		text-align: center;
	}
	
	#submit:hover {
		opacity: 0.5;
	}
	
	
	#button:visited {

	  background-color: blue;
	
	  box-shadow: 0 5px #666;


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
			<form action="product_inquiry_write_ok.do" method="post" enctype="multipart/form-data">
				<span style="font-weight: bold; display: block; margin-left: 250px; padding-top: 30px; padding-bottom: 40px; font-size: 18px;">상품 문의하기</span>
				<span style="font-weight: bold; margin-left: 50px; font-size: 14px; padding-bottom: 10px;">문의 내용</span><br>
				<textarea name="comments" rows="8" cols="65" title="내용" onfocus="a(this)" style="display: block; width: 500px; margin-left: 40px; border: 1px solid silver; color: silver; font-weight: bold;" >내용을 입력하세요.</textarea><br>
				
				<label for="fileName" class="fileName" style="border: none; background-color: deepskyblue; color: white; padding: 10px 20px; border-radius: 5px; font-weight: bold; font-size: 12px; margin-left: 50px; text-align: center;">파일 업로드</label>
				<input type="file" name="fileName" id="fileName" onchange="readURL(this);" style="display: none;">
				<img id="preview" style="display: none;"/>
				<input type="hidden" name="productNum" value="<%= productNum %>" />
				<span style="display: block; font-size: 12px; padding: 10px 55px; color: silver;">- 문의내용에 대한 답변은 ‘마이페이지 > 나의 쇼핑 > 나의 문의내역’ 또는 ‘상품 상세페이지’에서 확인 가능합니다.<br>
						- 배송,결제,교환/반품 문의는 고객센터로 문의 바랍니다.<br>
						- 상품과 관련 없거나 부적합한 내용을 기재하시는 경우, 사전 고지 없이 삭제 또는 차단될 수 있습니다.</span>		
				<input type="submit" name="submit" value="제품문의" id="submit">
			</form>
		</div>
	
	<%@ include file="WEB-INF/common/footer.jspf" %>
	</div>
</div>
</body>
</html>