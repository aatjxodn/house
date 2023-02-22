<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크랩북</title>
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
<script>

function getCheckboxValue(event)  {
	  let result = '';
	  if(event.target.checked)  {
	    result = event.target.value;
	  }else {
	    result = '';
	  }
	  
	  document.getElementById('result').innerText
	    = result;
	}
</script>





<body>
<div class="container">
<%@ include file="/WEB-INF/common/memberMenu.jspf" %>

<br>

<b class="bordname" style="margin-left: 10px;">스크랩북</b><br>
<div class="myinfo" style="text-align: center;">
<img alt="프로필사진" src="${pageContext.request.contextPath}/img/profileImg/${profileImg }" style="width: 10%; border-radius: 50%; aspect-ratio: 1/1;"><br><br>
<b class="bordname"> ${id }</b><br>
<br><br>
<b class="bordname" style="margin: 10px; cursor: pointer;" onclick="location.href='collections.do'">모두</b>
<b class="bordname" style="margin: 10px; cursor: pointer; color: #35C5F0;" onclick="location.href='collectionsP.do?id=${id}&postType=0'">사진</b>
<b class="bordname" style="margin: 10px; cursor: pointer;" onclick="location.href='collectionsK.do?id=${id}&postType=1'">노하우</b>


</div>


<hr>
<br>

<%@ include file="/WEB-INF/mypage/collections_card.jspf" %>


<br><br>
<%@ include file="/WEB-INF/common/footer.jspf" %>
</div>
</body>
</html>