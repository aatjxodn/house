<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문과 답변 수정 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="/WEB-INF/common/style.jspf"%>
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

	#layout1 {
		width: 100%;
	}
	
	#layout1 .container1 {
		width: 1280px;
		margin: auto;

	}
	
	#layout1 .container1 .box1 {
		width: 800px;
		height: 300px;
		margin: 20px auto 0px auto;
		padding-top: 40px;
		box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, 0.1);
		border-radius: 5px;
	}
	
	#layout1 .container1 .box1 span {
		margin-left: 80px;
		font-weight: bold;
		font-size: 17px;
	}
	
	#layout1 .container1 .box1 ul {
		margin-top: 30px;
		margin-left: 50px;
	}
	
	#layout1 .container1 .box1 ul li {
		padding: 5px;
	
	}
	

	
	#layout2 {
		width: 100%;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	#layout2 .container2 {
		width: 1280px;
		margin: auto;
	}
	
	#layout2 .container2 .box2 {
		width: 800px;
		margin: auto;
		
	}
	
	#layout2 .container2 .box2 form {
		margin-bottom: 40px;
	}
	
	
	#layout2 .container2 .box2 form #subject {
		width: 100%;
		border: none;
		border-bottom: 2px solid silver;
		padding: 30px;
		font-weight: bold;
		font-size: 20px;
		color: silver;
	}
	
	#layout2 .container2 .box2 form textarea {
		width: 100%;
		border: none;
	}

	.btn-upload:hover {
		opacity: 0.5;
	}

  	
  	#subbut:hover {
  		opacity: 0.5;
  	}
  	
  	#layout2 .container2 .box2 #subbut {
		border: none;
	  	background-color: deepskyblue;
	  	color: white;
	  	border-radius: 5px;
	  	padding: 25px 150px 25px 60px;	
	  	font-size: 20px;
	  	font-weight: bold;
  	}
	
	
	
</style>

<style>
	
</style>
</head>
<body>
<div id="layout1">
	<div class="container1">
		<%@ include file="/WEB-INF/common/memberMenu.jspf" %>

	<%@ include file="WEB-INF/common/communityMenu.jspf" %>
		<div class="box1">
			<span>질문과 답변 글 작성 가이드</span>
			<ul>
				<li>참고가 되는 사진을 같이 공유해주시면 더 좋은 답변을 얻을 수 있습니다.</li>
				<li>비슷한 어려움을 겪는 유저를 위해 답변자에게 포인트를 지급하며,<br> 답변이 달린 질문글은 삭제할 수 없습니다.</li>
				<li>인테리어와 관련 없는 질문은 숨김 및 삭제될 수 있습니다.</li>
				<li>상품/배송 등 쇼핑 관련 문의는 <a href="gogak.jsp" style='font-weight: bold; color: deepskyblue;'>고객센터</a>에서 요청해주세요.</li>
			</ul>	
		</div>
	</div>
</div>

<div id="layout2">
	<div class="container2">
		<div class="box2">
			<form action="modify_ok.jsp?requestIdx=${vo.requestIdx }" method="post" enctype="multipart/form-data">
				<input type="text" value="제목을 입력해주세요." name="subject" id="subject" onfocus="a(this)"><br>
				<label for="fileName" style="border: none; background-color: deepskyblue; color: white; padding: 20px 120px 20px 50px; border-radius: 5px; margin-top: 10px; font-weight: bold; font-size: 20px;">파일 업로드</label>
				<input type="file" name="fileName" id="fileName" onchange="readURL(this);" style="display: none;"><br>
				<img id="preview" style="width: 500px;"/>
				<textarea id="summernote" name="editordata" rows="15" cols="80" title="내용" onfocus="a(this)" style='color: silver; font-weight: bold; font-size: 20px; padding-left : 32px; padding-top: 30px;'>내용을 입력하세요.</textarea><br>
				<input type="submit" value="수정완료" name="submit" id="subbut">
			</form>
		</div>
		<%@ include file="WEB-INF/common/footer.jspf" %>
	</div>
</div>

</body>
</html>

















