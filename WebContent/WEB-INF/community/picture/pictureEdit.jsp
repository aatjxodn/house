<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/common/style.jspf"%>
<link href="${pageContext.request.contextPath}/summernote/summernote-bs4.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/summernote/summernote-bs4.js"></script>
  <script>
  $(document).ready(function() {
	  $('#summernote').summernote({
		  height: 300,                 // set editor height
		  minHeight: null,             // set minimum height of editor
		  maxHeight: null,             // set maximum height of editor
		  focus: true,                  // set focus to editable area after initializing summernote
		  toolbar: [['insert',['picture']]],
			callbacks: { // 콜백을 사용
	            // 이미지를 업로드할 경우 이벤트를 발생
			    onImageUpload: function(files, editor, welEditable) {
				    sendFile(files[0], this);
				}
			}
	  });
	});
  
  function sendFile(file, editor) {
		// 파일 전송을 위한 폼생성
	 	data = new FormData();
	 	data.append("uploadFile", file);
	 	$.ajax({ // ajax를 통해 파일 업로드 처리
	 	 	data : data,
	 	 	type : "POST",
	 	 	url : "pictureImageUpload.do",
	 	 	cache : false,
	 	 	contentType : false,
	 	 	processData : false,
	 	 	success : function(data) { // 처리가 성공할 경우
	 	 	 	// 에디터에 이미지 출력
	 			$(editor).summernote('editor.insertImage', data.url);
	 	 		$("#thumbnail").val(data.url);
	 		}
	 	});
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
  .knowhow {
  	color: #35C5F0;
  	font-weight: bold;
  }
  .home, .picture, .qna {
  color: black;
  }
  
  img {
  	width: 100%;
  }
  </style>  
</head>
<body>
  <div class="container">
<%@ include file="/WEB-INF/common/memberMenu.jspf" %>
<%@ include file="/WEB-INF/common/communityMenu.jspf"%>
<div class="mt-3 mb-1">
  <form action="goPictureEdit.do" method="post">
    <div class="form-group form-inline">
      <select class="form-control mr-2" id="sizes" name="sizes">
        <option selected disabled>평수</option>
        <c:forEach items="${sizesMenu }" var="m" varStatus="status">
        	<c:if test="${vo.sizes == status.index }">
        		<option value="${vo.sizes }" selected>${m }</option>
        	</c:if>
        	<c:if test="${vo.sizes != status.index }">
        		<option value="${vo.sizes }">${m }</option>
        	</c:if>
        </c:forEach>
      </select>   
      <select class="form-control mr-2" id="residence" name="residence">
        <option selected disabled>주거형태</option>
        <c:forEach items="${residenceMenu }" var="m" varStatus="status">
        	<c:if test="${vo.sizes == status.index }">
        		<option value="${vo.sizes }" selected>${m }</option>
        	</c:if>
        	<c:if test="${vo.sizes != status.index }">
        		<option value="${vo.sizes }">${m }</option>
        	</c:if>
        </c:forEach>
      </select>  
      <select class="form-control" id="style" name="style">
        <option selected disabled>스타일</option>
        <c:forEach items="${styleMenu }" var="m" varStatus="status">
        	<c:if test="${vo.sizes == status.index }">
        		<option value="${vo.sizes }" selected>${m }</option>
        	</c:if>
        	<c:if test="${vo.sizes != status.index }">
        		<option value="${vo.sizes }">${m }</option>
        	</c:if>
        </c:forEach>
              </select>  
      <select class="form-control" id="space" name="space">
        <option selected disabled>공간(필수)</option>
        <c:forEach items="${spaceMenu }" var="m" varStatus="status">
        	<c:if test="${vo.sizes == status.index }">
        		<option value="${vo.sizes }" selected>${m }</option>
        	</c:if>
        	<c:if test="${vo.sizes != status.index }">
        		<option value="${vo.sizes }">${m }</option>
        	</c:if>
        </c:forEach>
      </select>  
    </div>
    <div>
    <textarea class="form-control mb-4" rows="8" id="summernote" name="editordata">${vo.content }</textarea>
    </div>
    <div class="mb-4">
    <input type="hidden" name="thumbnail" id="thumbnail" value="${vo.thumbnail }">
    <input type="hidden" name="idx" value="${vo.pictureIdx }">
    <button type="submit" class="btn mt-3" id="btn">올리기</button>
    </div>
  </form>
</div>
<%@ include file="/WEB-INF/common/footer.jspf" %>
</div>
</body>
</html>