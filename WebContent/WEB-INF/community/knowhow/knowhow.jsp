<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>노하우</title>
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
  		.picture, .home, .qna {
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
	</style>
	<script>
		$(document).ready(function(){
			$("#order").change(function() {
				let cPage = <%= request.getParameter("cPage") %>;
				let category = <%= request.getParameter("category") %>
				if(cPage == null && category == null) {
					location.href="knowhow.do?order=" + this.value;
				} else if(cPage != null) {
					location.href="knowhow.do?cPage=" + cPage + "&order=" + this.value;
				} else if(category != null) {
					location.href="knowhow.do?category=" + category + "&order=" + this.value;
				} else {
					location.href="knowhow.do?cPage=" + cPage + "&category=" + category + "&order=" + this.value;
				}
			});
			
			$("#searchBtn").click(function() {
				location.href = "knowhowSearch.do?text=" + $("#searchText").val() + "&opt=" + $("#searchOpt").val();
			})
		});
	</script>
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
		<div>
			<div class="pt-5 pb-5 text-center bg-light">
				<h5 class="mb-0"><b>테마별 노하우</b></h5>
				<div class="mt-3 input-group">
					<select class="form-control p-0" id="searchOpt" name="searchOpt">
						<option value="1" selected>제목</option>
						<option value="2">내용</option>
						<option value="3">작성자</option>
					</select> 
					<input id="searchText" type="text" class="form-control p-0" style="width: 150px" placeholder="검색어를 입력하세요">
					<div class="input-group-append">
						<button class="btn" id="searchBtn" type="button">검색</button>
					</div>
				</div>
			</div>
			<div class="d-flex flex-row-reverse pb-1 pt-1">
				<select class="form-control border-0 p-0" style="width: 150px" id="order" name="order">
        			<c:if test="${order == 1 }">
        				<option value="1" selected>최근인기순</option>
        			</c:if>
        			<c:if test="${order != 1 }">
        				<option value="1">최근인기순</option>
        			</c:if>
        			<c:if test="${order == 2 }">
        				<option value="2" selected>역대인기순</option>
        			</c:if>
        			<c:if test="${order != 2 }">
        				<option value="2">역대인기순</option>
        			</c:if>
        			<c:if test="${order == 3 || empty order }">
        				<option value="3" selected>최신순</option>
        			</c:if>
        			<c:if test="${order != 3 }">
        				<option value="3">최신순</option>
        			</c:if>
        			<c:if test="${order == 4 }">
        				<option value="4" selected>과거순</option>
        			</c:if> 
        			<c:if test="${order != 4 }">
        				<option value="4">과거순</option>
        			</c:if>	
      			</select>
			</div>
			<div class="pb-3 pt-2">
				<c:if test="${empty category }">
					<button type="button" class="btn" id="btn" onclick="location.href='knowhow.do?order=${order }'">전체</button>
					<c:forEach items="${menu }" var="m" varStatus="status">
						<button type="button" class="btn btn-light"
						onclick="location.href='knowhow.do?category=${status.index }&order=${order }'">${m }</button>
				</c:forEach>
				</c:if>
				<c:if test="${not empty category }">
					<button type="button" class="btn btn-light" onclick="location.href='knowhow.do?order=${order }'">전체</button>
					<c:forEach items="${menu }" var="m" varStatus="status">
					<c:if test="${category == status.index }">
						<button type="button" class="btn" id="btn"
						onclick="location.href='knowhow.do?category=${status.index }&order=${order }'">${m }</button>
					</c:if>
					<c:if test="${category != status.index }">
						<button type="button" class="btn btn-light"
						onclick="location.href='knowhow.do?category=${status.index }&order=${order }'">${m }</button>
					</c:if>
				</c:forEach>
				</c:if>
			</div>
			<!-- 사진에 북마크 아이콘: https://www.w3schools.com/bootstrap4/bootstrap_cards.asp -->
			<c:if test="${empty list }">
			<div class="text-center p-4">
				<img class="pb-2" src="https://image.ohou.se/i/bucketplace-v2-development/uploads/assets/163703569663018673.png" width="100px">
     			<h5>앗! 찾으시는 결과가 없네요.</h5>
     		</div>	
			</c:if>
			<c:if test="${not empty list }">
			<div class="row pb-4">
				<c:forEach items="${list }" var="vo">
					<div class="col-sm-3 pt-3">
    				<div class="thumbnail pb-2">
    					<a href="knowhowDetail.do?idx=${vo.knowhowIdx }&cPage=${pvo.nowPage}">			
    						<img style="border-radius: 10px; object-fit: cover;" src="${vo.thumbnail }" width="260px" height="180px">
    					</a>
    				</div>
    				<div class="title"><b>${vo.subject }</b></div>
    				<div class="info">
    					<small>${vo.id }<br>
    					조회수 ${vo.views } 스크랩 ${vo.scrapCnt }</small>
    				</div>
    			</div>
				</c:forEach>
    		</div>
    		<ul class="pagination justify-content-center pb-2">
    			<!-- 이전 -->
   		 		<li class="page-item">
   		 			<c:if test="${pvo.beginPage == 1 }">
   		 				<a class="page-link disabled">이전</a>
   		 			</c:if>
   		 			<c:if test="${pvo.beginPage != 1 }">
   		 				<c:if test="${empty category }">
							<a href="knowhow.do?cPage=${pvo.beginPage - 1 }&order=${order }" class="page-link">이전</a>
						</c:if>
						<c:if test="${not empty category }">
							<a href="knowhow.do?cPage=${pvo.beginPage - 1 }&category=${category }&order=${order }" class="page-link">이전</a>
						</c:if>	
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
							<c:if test="${empty category }">
								<a href="knowhow.do?cPage=${pageNo }&order=${order }" class="page-link">${pageNo }</a>
							</c:if>
							<c:if test="${not empty category }">
								<a href="knowhow.do?cPage=${pageNo }&category=${category }&order=${order }" class="page-link">${pageNo }</a>
							</c:if>		
    					</li>
					</c:if>
					</c:forEach>
    			<!-- 다음 -->
    			<li class="page-item">
    				<c:if test="${pvo.endPage < pvo.totalPage }">
    						<c:if test="${empty category }">
								<a href="knowhow.do?cPage=${pvo.endPage + 1 }&order=${order }" class="page-link">다음</a>
							</c:if>
							<c:if test="${not empty category }">
								<a href="knowhow.do?cPage=${pvo.endPage + 1 }&category=${category }&order=${order }" class="page-link">다음</a>
							</c:if>	
					</c:if>
					<c:if test="${pvo.endPage >= pvo.totalPage }">
						<a class="page-link disabled">다음</a>
					</c:if>
    			</li>
  			</ul>
  			</c:if>
    	</div>
    	<%@ include file="/WEB-INF/common/footer.jspf" %>
	</div>
</body>
</html>