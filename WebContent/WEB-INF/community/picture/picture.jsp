<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진</title>
<%@ include file="/WEB-INF/common/style.jspf"%>
<style>
.community {
	color: #35C5F0;
	font-weight: bold;
}

.store {
	color: black;
}

.picture {
	color: #35C5F0;
	font-weight: bold;
}

.home, .knowhow, .qna {
	color: black;
}
.input-group {
	margin:0 auto;	
	width: 40%;
}
  		
#searchBtn {
	background-color: #35C5F0;
	color: white;
}

.content {
	overflow: hidden;
	height: 25px;
}
</style>
<script>
$(document).ready(function(){
	$(".content br").remove();
	$(".content img").unwrap();
	$(".content img").remove();
	
	$("#searchBtn").click(function() {
		location.href = "pictureSearch.do?text=" + $("#searchText").val() + "&opt=" + $("#searchOpt").val();
	})
});

	function submit(frm) {
		frm.submit();
	}
</script>
</head>
<body>
	<div class="container">
		<c:if test="${empty id }">
			<%@ include file="/WEB-INF/common/guestMenu.jspf"%>
		</c:if>
		<c:if test="${not empty id }">
			<%@ include file="/WEB-INF/common/memberMenu.jspf"%>
		</c:if>
		<%@ include file="/WEB-INF/common/communityMenu.jspf"%>
		<div>
			<div class="pt-5 pb-5 text-center bg-light">
				<h5 class="mb-0"><b>테마별 사진</b></h5>
				<div class="mt-3 input-group">
					<select class="form-control p-0" id="searchOpt" name="searchOpt">
						<option value="1" selected>내용</option>
						<option value="2">작성자</option>
					</select> 
					<input id="searchText" type="text" class="form-control p-0" style="width: 150px" placeholder="검색어를 입력하세요">
					<div class="input-group-append">
						<button class="btn" id="searchBtn" type="button">검색</button>
					</div>
				</div>
			</div>
			<div class="form-inline pt-3">
				<form action="picture.do" onchange="submit(this.form)">
					<select class="form-control" name="order">
						<c:forEach items="${orderMenu }" var="m" varStatus="status">
							<c:if test="${order == status.index }">
								<option value="${status.index }" selected>${m }</option>
							</c:if>
							<c:if test="${order != status.index }">
								<option value="${status.index }" >${m }</option>
							</c:if>
						</c:forEach>
					</select>
					<select class="form-control" name="residence">
						<c:if test="${empty residence }">
							<option selected disabled>주거형태</option>
						</c:if>
						<c:if test="${not empty residence }">
							<option disabled>주거형태</option>
						</c:if>
						<c:forEach items="${residenceMenu }" var="m" varStatus="status">
							<c:if test="${residence == status.index }">
								<option value="${status.index }" selected>${m }</option>
							</c:if>
							<c:if test="${residence != status.index }">
								<option value="${status.index }" >${m }</option>
							</c:if>
						</c:forEach>
					</select> <select class="form-control" name="space">
						<c:if test="${empty space }">
							<option selected disabled>공간</option>
						</c:if>
						<c:if test="${not empty space }">
							<option disabled>공간</option>
						</c:if>
						<c:forEach items="${spaceMenu }" var="m" varStatus="status">
							<c:if test="${space == status.index }">
								<option value="${status.index }" selected>${m }</option>
							</c:if>
							<c:if test="${space != status.index }">
								<option value="${status.index }" >${m }</option>
							</c:if>
						</c:forEach>
					</select> <select class="form-control" name="sizes">
						<c:if test="${empty sizes }">
							<option selected disabled>평수</option>
						</c:if>
						<c:if test="${not empty sizes }">
							<option disabled>평수</option>
						</c:if>
						<c:forEach items="${sizesMenu }" var="m" varStatus="status">
							<c:if test="${sizes == status.index }">
								<option value="${status.index }" selected>${m }</option>
							</c:if>
							<c:if test="${sizes != status.index }">
								<option value="${status.index }" >${m }</option>
							</c:if>
						</c:forEach>
					</select> <select class="form-control" name="style">
						<c:if test="${empty style }">
							<option selected disabled>스타일</option>
						</c:if>
						<c:if test="${not empty style }">
							<option disabled>스타일</option>
						</c:if>
						<c:forEach items="${styleMenu }" var="m" varStatus="status">
							<c:if test="${style == status.index }">
								<option value="${status.index }" selected>${m }</option>
							</c:if>
							<c:if test="${style != status.index }">
								<option value="${status.index }" >${m }</option>
							</c:if>
						</c:forEach>
					</select>
				</form>
			</div>
		</div>
		<c:if test="${empty list }">
		<div>
			<div class="text-center p-4">
				<img class="pt-2 pb-2" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/assets/163703569663018673.png" width="100px">
     			<h5>앗! 찾으시는 결과가 없네요.</h5>
     		</div>
     	</div>	
		</c:if>
		<c:if test="${not empty list }">
		<div class="row">
		<c:forEach items="${list }" var="vo">
			<div class="col-sm-3" style="display:block">
				<div class="profile row pt-4 pb-2">
					<div class="col-sm-2">
						<img style="border-radius: 40px;" src="${pageContext.request.contextPath}/img/profileImg/${vo.profileImg }"
							width="40px" height="40px">
					</div>
					<div class="col-sm-10 align-self-center">
						<span><b>${vo.id }</b></span>
					</div>
				</div>
				<div class="thumbnail pb-2">
					<a href="pictureDetail.do?idx=${vo.pictureIdx }"> <img
						style="border-radius: 5px; object-fit: cover;" src="${vo.thumbnail }"
						width="255px" height="255px">
					</a>
				</div>
				<div class="likes row pb-2 text-center">
					<div class="col-sm-4">
						<i class="far fa-heart"></i> ${vo.likeCnt }
					</div>
					<div class="col-sm-4">
						<i class="far fa-bookmark"></i> ${vo.scrapCnt }
					</div>
					<div class="col-sm-4">
						<i class="far fa-comment"></i> ${vo.c1Cnt + vo.c2Cnt }
					</div>
				</div>
				<div class="content">${vo.content }
				</div>
				<c:if test="${not empty vo.lastestCoId }">
				<div class="comments pt-2 pb-3 row">
					<div class="col-sm-2">
						<img style="border-radius: 30px" src="${pageContext.request.contextPath}/img/profileImg/${vo.lastestCoProfileimg }"
							width="30px" height="30px">
					</div>
					<div class="col-sm-10">
						<span><b>${vo.lastestCoId }</b></span> <span>${vo.lastestCoContent }</span>
					</div>
				</div>
				</c:if>		
			</div>
		</c:forEach>
		</div>
		<ul class="pagination justify-content-center pt-3 pb-2">
    			<!-- 이전 -->
   		 		<li class="page-item">
   		 			<c:if test="${pvo.beginPage == 1 }">
   		 				<a class="page-link disabled">이전</a>
   		 			</c:if>
   		 			<c:if test="${pvo.beginPage != 1 }">
   		 				<a href="picture.do?cPage=${pvo.beginPage - 1 }" class="page-link">이전</a>
					</c:if>	
   		 			
   		 		</li>
   		 		<!-- 페이지 번호 -->
   		 		<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
					<c:if test="${pageNo == pvo.nowPage }">	
						<li class="page-item active">
    						<a class="page-link">${pageNo }</a>
    					</li>
					</c:if>
					<c:if test="${pageNo != pvo.nowPage }">
						<li class="page-item">
							<a href="picture.do?cPage=${pageNo }" class="page-link">${pageNo }</a>
    					</li>
					</c:if>
					</c:forEach>
    			<!-- 다음 -->
    			<li class="page-item">
    				<c:if test="${pvo.endPage < pvo.totalPage }">
    						<a href="picture.do?cPage=${pvo.endPage + 1 }" class="page-link">다음</a>
					</c:if>
					<c:if test="${pvo.endPage >= pvo.totalPage }">
						<a class="page-link disabled">다음</a>
					</c:if>
    			</li>
  			</ul>
		</c:if>
		<%@ include file="/WEB-INF/common/footer.jspf" %>
	</div>
</body>
</html>