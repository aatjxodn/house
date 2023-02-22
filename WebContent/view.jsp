
<%@page import="com.mystudy.house.model.vo.Request_comVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.house.model.vo.RequestVO"%>
<%@page import="com.mystudy.house.model.dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%
//파라미터 값 추출(확인)
	request.setCharacterEncoding("UTF-8");
	int requestIdx = Integer.parseInt(request.getParameter("requestIdx"));
	String views = request.getParameter("views");

	String cPage = request.getParameter("cPage");

	
	// 조회수 증가
	String requestIdx2 = request.getParameter("requestIdx");
	request.setAttribute("requestIdx", requestIdx2);	
	
	DAO.REQUESTVIEWS(requestIdx2);
	int cnt = DAO.requestLikeCnt(requestIdx2);
	
	//2. 게시글(bbsIdx) 데이터 조회 후 화면 표시
	RequestVO vo = DAO.selectOne(requestIdx);
	System.out.println("> vo : " + vo);
	
	//3. 게시글(bbsIdx)에 딸린 댓글이 있으면 화면 표시
	List<Request_comVO> list = DAO.getCommList(requestIdx);
	System.out.println("> Comment list : " + list);
	 
	//EL, JSTL 사용을 위한 scope 상에 속성 등록처리
	session.setAttribute("vo", vo); //게시글 데이터
	session.setAttribute("cPage", cPage);
	
	pageContext.setAttribute("c_list", list); //댓글 목록
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<%@ include file="/WEB-INF/common/style.jspf"%>

  
<style>

  .community {
  	color: #35C5F0;
  	font-weight: bold;
  }
  .store {
  	color: black;
  }
  .home, .picture, .knowhow  {
  color: black;
  }
  
  .qna {
  color: #35C5F0;
  font-weight: bold;
  }
  
  #layout1 {
  	width: 100%;
  	height: 380px;
  }
  
  #layout1 .container1 {
  	width: 1280px;
  	height: 380px;
  	margin: auto;
  }
  
  #layout1 .container1 h6 {
	font-weight: bold;
	padding-top: 100px;
	margin-left: 300px;
	color: gray;
  }
  
  #layout1 .container1 .subject1 {
    display: block;
  	font-size: 40px;
  	margin-left: 300px;
  	font-weight: bold;
  }
  
  #layout1 .container1 .id1 {
  	 margin-top: 10px;
  	 display: block;
  	 margin-left: 300px;
  	 font-weight: bold;
  	 
  }
  
  #layout1 .container1 .regdate1 {
 	 display: inline;
  	 margin-left: 300px;
  	 color: gray;
  	 border-bottom: 3px solid #f6f7f7;
  	 padding-bottom: 20px;
  }
 
  #layout2 {
  	width: 100%;
  	margin-top: 10px;
  }
  
  #layout2 .container2 {
  	width: 1280px;
  	margin: auto;
  	border-bottom: 3px solid #f6f7f7;
  }
  
  #layout2 .container2 .box2 {
  	margin-left: 300px;
  	margin-bottom: 50px;
  }
  
  #layout2 .container2 .box2 .comment {
  	width: 800px;
  	font-size: 20px;
  }
  
  #layout2 .container2 .box2 table {
  	display: inline-block;
  	margin-top: 100px;
  }
  
  #layout2 .container2 input {
  	float: right;
  	margin-right: 3px;
  	border: none;
  	background-color: deepskyblue;
  	color: white;
  	border-radius: 5px;
  	padding: 5px 10px;
  }
  
  #layout2 .container2 input:hover {
  	opacity: 0.5;
  	border: 2px border deepskyblue;
  }
  
 .comments {
 	float: left;
 	margin-left: 300px;
  	font-size: 20px;
  }
  
  #layout3 {
  	width: 100%;
  }
  
  
  #layout3 .container3 {
 	width: 1280px;
  	margin: auto;
  	text-align: center;
  	margin-top: 30px;
  }
  
  
  #layout3 .container3 .com1 {
  	border: 2px solid silver;
  	color: silver;
  	font-weight: bold;
  	padding: 10px;
  	border-radius: 5px;
  	margin: auto;
  	padding-right: 250px;
  }
  
  #layout3 .container3 .com2 {
	border: 2px solid silver;
  	color: silver;
  	font-weight: bold;
  	padding: 10px 20px;
  	border-radius: 5px;
  	margin: auto;
  }
  
  #layout3 .container3 .com2:hover {
  	opacity: 0.5;
  	color: black;
  	border: 2px solid black;
  }
  
  
  
   #layout4 {
  	width: 100%;

  }
  
  
  #layout4 .container4 {
 	width: 600px;
  	margin: auto;
  	margin-top: 10px;
  }
  
  
 	#layout4 .container4 .comment {
  	border-bottom: 3px solid #f6f7f7;
  	color: black;
  	padding: 10px;
  	border-radius: 5px;
  	margin: auto;
  }
  
  #layout4 .container4 .comment input {
	font-size: 12px;
  }
  
  #delete_com {
  	float: right;
  	border: none;
  	background-color: deepskyblue;
  	color: white;
  	border-radius: 5px;
  	padding: 5px 10px;
  }
  
  #delete_com:hover {
	opacity: 0.5;
}

.comment-message {
	word-break:break-all;
}
  
  
  
  

</style>	


<script>
	function modify_go() {
		location.href = "modify.jsp?requestIdx=${vo.requestIdx }"; //수정폼 화면
	}
	function delete_go() {
		location.href = "delete_ok.jsp?requestIdx=${vo.requestIdx }"; //삭제폼 화면
	}
	
	function list_go() {
		location.href = "request.jsp?cPage=${cPage}";
	}
</script>
</head>
<body>

<div style="white-space:pre;"><c:out value="${content}" /></div>

<div id="layout1">
	<div class="container1">
	<c:if test="${empty id }">
		<%@ include file="/WEB-INF/common/guestMenu.jspf" %>
	</c:if>
	<c:if test="${not empty id }">
		<%@ include file="/WEB-INF/common/memberMenu.jspf" %>
	</c:if>
	<%@ include file="WEB-INF/common/communityMenu.jspf" %>
		<h6>질문과 답변</h6>
		<span class="subject1">${vo.subject }</span><br>
		<span class="id1">${vo.id }</span>
		<span class="regdate1"><i>${vo.regdate.substring(0,10) }</i></span>
	</div>
</div>				
<div id="layout2">
	<div class="container2">
		<div class="box2">
			<table>
				<c:if test="${not empty vo.fileName }">
				<tr>
					<td><img src="${pageContext.request.contextPath}/requestImage/${vo.fileName }" width="700px" height="500px" /></td>	
				</tr>
				</c:if>
			</table>	
			<div class="comment-message" style="white-space:pre-wrap; font-size: 20px; margin-top: 20px; margin-bottom: 50px;"><c:out value="${vo.comments }"></c:out></div>
			<div>
			<div style="width: 180px; margin-top: 150px;">좋아요 <%=cnt %> &nbsp; 조회수 ${vo.views }</div>
				<c:if test="${id != vo.id }">
					<div style="margin-left: 905px; margin-bottom: 10px; class="pb-2">
						<button type="button" class="btn btn-outline-secondary btn-sm mt-2" onclick="location.href='RequestLike.do?requestIdx=${vo.requestIdx}'">
			    		좋아요
			  			</button>
					</div>
				</c:if>
				<input type="button" value="목록보기" onclick="list_go()">
				<c:if test="${id == vo.id }">
					<input type="button" value="삭제" onclick="delete_go()">
					<input type="button" value="수정" onclick="modify_go()">
				</c:if>
			</div>
		</div>
	</div>
</div>
<div id="layout3">
	<div class="container3">
		<%-- 게시글에 대한 댓글 작성 영역 --%>
		<form action="request_comment_ok.jsp?requestIdx=${vo.requestIdx }" method="post">
			<input type="text" value="" name="comments" class="com1">
			<input type="submit" value="입력" name="submit" class="com2">
			<input type="hidden" value="requestIdx" value="${vo.requestIdx }">
		</form>
	</div>
</div>

<div id="layout4">
	<div class="container4">
		<%-- 게시글에 적힌 댓글 표시 영역 --%>
		<c:forEach var="commVO" items="${c_list }">
			<div class="comment">		
					<form action="request_comment_delete_ok.jsp" method="post">
						<b>${commVO.id }</b><br>
						${commVO.comments }<br>
						<i>${commVO.regdate.substring(0,10) }</i>
						<c:if test="${id == commVO.id }">
							<input type="submit" value="댓글삭제" id="delete_com">			
							<!-- 댓글 삭제 후 게시글 상세 페이지로 이동시 사용 목적 -->
							<input type="hidden" name="comIdx" value="${commVO.comIdx }">	
						</c:if>			
					</form>
			</div>
		</c:forEach>
		
	</div>
</div>
<div style="width: 1280px; margin: auto; margin-top: 300px;"><%@ include file="/WEB-INF/common/footer.jspf" %></div>

</body>
</html>



