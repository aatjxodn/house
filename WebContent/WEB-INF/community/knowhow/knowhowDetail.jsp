<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/common/style.jspf"%>
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
  </style>
</head>
<body>
<div class="container">
	<c:if test="${empty id }">
		<%@ include file="/WEB-INF/common/guestMenu.jspf" %>
	</c:if>
	<c:if test="${not empty id }">
		<%@ include file="/WEB-INF/common/memberMenu.jspf" %>
	</c:if>
	<%@ include file="/WEB-INF/common/communityMenu.jspf" %>
	<div class="pb-4">
		<div class="pt-4"><a href="knowhow.do">노하우</a> > <a href="knowhow.do?category=${vo.category }">${menu[vo.category] }</a></div>
		<c:if test="${id == vo.id }">
		<div class="pt-3 pb-2">
			<button class="btn" id="btn" onclick="location.href='knowhowEdit.do?idx=${idx}'">수정</button>
			<button class="btn" id="btn" data-toggle="modal" data-target="#myModal">삭제</button>
			<!-- The Modal -->
			<div class="modal" id="myModal">
  				<div class="modal-dialog">
    				<div class="modal-content">
      				<!-- Modal Header -->
      					<div class="modal-header">
        					<h4 class="modal-title">노하우글 삭제</h4>
        					<button type="button" class="close" data-dismiss="modal">&times;</button>
      					</div>
      				<!-- Modal body -->
      					<div class="modal-body">
        					정말로 삭제하시겠습니까?
      					</div>
      				<!-- Modal footer -->
      					<div class="modal-footer">
        					<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
        					<button type="button" class="btn btn-primary" onclick="location.href='knowhowDelete.do?idx=${idx}'" data-dismiss="modal">삭제</button>
      					</div>
    				</div>
  				</div>
			</div>
		</div>
		</c:if>
		<div class="pt-3"><h3>${vo.subject }</h3></div>
		<div class="profile row pt-1">
    		<div class="col-sm-1" style="text-align: right">
    			<img style="border-radius: 40px" src="${pageContext.request.contextPath}/img/profileImg/${vo.profileImg}" width="40px" height="40px">
    		</div>
    		<div class="col-sm-11">
    			<span><b>${vo.id }</b></span><br>
    			<span><small>${vo.regdate }</small></span>
    		</div>
    	</div>
		<div class="pt-3 pb-2">
			<span>${vo.content }</span>
		</div>
		<div>
		<div style="float:left; color: gray;">좋아요 ${vo.likeCnt } 스크랩 ${vo.scrapCnt} 댓글 ${vo.c1Cnt + vo.c2Cnt} 조회수 ${vo.views }</div>
		<c:if test="${id != vo.id }">
				<div style="float:right;" class="pb-2">
		<button type="button" class="btn btn-outline-secondary btn-sm mt-2" onclick="location.href='knowhowLike.do?idx=${idx}'">
    		좋아요
  		</button>
		<button type="button" class="btn btn-outline-secondary btn-sm mt-2" onclick="location.href='knowhowScrap.do?idx=${idx}'">
			스크랩
		</button>
		</div>
		</c:if>
		</div>
		<div style="clear:both">
			<hr>
			<div><b>댓글 ${vo.c1Cnt + vo.c2Cnt}</b></div>
			<form class="pt-3" action="knowhowCommentWrite.do" method="post">
  				<div class="row">
    				<div class="col-sm-11">
    					<input type="text" class="form-control" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)" id="comment" name="comment">
  						<input type="hidden" name="idx" value="${idx }">
  					</div>
  					<div class="col-sm-1"><button type="submit" class="btn" id="btn">입력</button></div>
  				</div>
			</form>
			<div class="comments">
				<c:forEach items="${list }" var="com" varStatus="status">
				<div class="comment row pt-4">
    				<div class="col-sm-1">
    					<img style="border-radius: 30px" src="${pageContext.request.contextPath}/img/profileImg/${com.profileImg}" width="30px" height="30px">
    				</div>
    				<div class="col-sm-11">
    					<span><b>${com.id }</b></span><br>
    					<span>${com.content }</span><br>
    					<span>${com.regdate }</span>&nbsp;&nbsp;
    					<c:if test="${com.id == id }">
    									<a style="color: #35C5F0" href="knowhowCommentDelete.do?comIdx=${com.knowcomIdx }&idx=${idx}"><i class="fas fa-eraser"></i></a>&nbsp;&nbsp;
    									</c:if>
    					<a style="color: #35C5F0" data-toggle="collapse" data-target="#com${status.index }"><i class="far fa-comment-dots"></i></a>
    					<div id="com${status.index }" class="collapse">
    						<form class="pb-3 pt-3" method="post" action="knowhowComment2Write.do">
  								<div class="row">
    								<div class="col-sm-10">
    									<input type="text" class="form-control" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)" id="comments" name="comments">
  										<input type="hidden" name="knowcomIdx" value="${com.knowcomIdx }">
  										<input type="hidden" name="idx" value="${idx }">
  									</div>
  									<div class="col-sm-2">
  										<button type="submit" class="btn" id="btn">입력</button>
  									</div>
  								</div>
							</form>
    					</div>
    					
    						<c:forEach items="${list2 }" var="com2">
    							<c:if test="${com2.knowhowIdx == com.knowcomIdx }">
    								<div class="row bg-light pb-2 pt-3 mt-2">
    								<div class="col-sm-1">
    									<img style="border-radius: 30px" src="${pageContext.request.contextPath}/img/profileImg/${com2.profileImg}" width="30px" height="30px">
    								</div>
    								<div class="col-sm-11 pb-2">
    									<span><b>${com2.id }</b></span><br>
    									<span>${com2.content }</span><br>
    									<span>${com2.regdate }</span>&nbsp;&nbsp;
    									<c:if test="${com2.id == id }">
    									<a style="color: #35C5F0" href="knowhowComment2Delete.do?comIdx=${com2.knowcomIdx }&idx=${idx}"><i class="fas fa-eraser"></i></a>
    									</c:if>
    								</div>
    								</div>
    							</c:if>
    						</c:forEach>
    						
    				</div>
    			</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/common/footer.jspf" %>
</div>
</body>
</html>