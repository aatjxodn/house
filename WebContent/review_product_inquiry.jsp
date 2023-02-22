<%@page import="com.mystudy.house.model.vo.ProductInquiryVO"%>
<%@page import="com.mystudy.house.common.Paging_Product_Inquiry"%>
<%@page import="com.mystudy.house.model.vo.ReviewsVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.house.model.dao.DAO"%>
<%@page import="com.mystudy.house.common.Paging_Reviews"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
//페이징 처리를 위한 객체(Paging) 생성 
	Paging_Reviews p = new Paging_Reviews();

	String pro = request.getParameter("productNum");
	String id = (String) session.getAttribute("id");
	String orderNum = DAO.findOrderNum(pro, id);	
	pageContext.setAttribute("orderNum", orderNum);
	pageContext.setAttribute("pro", pro);
	
	//1. 전체 게시물
	// 수량 구하기
	p.setTotalRecord(DAO.getTotalCount2());
	p.setTotalPage();
	System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
	System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
	
	//2. 현재 페이지 구하기
	String cPage = request.getParameter("cPage");
	if (cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}
	System.out.println("> cPage : " + cPage);
	System.out.println("> paging nowPage : " + p.getNowPage());
	
	//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
	p.setEnd(p.getNowPage() * p.getNumPerPage());
	p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
	
	//3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
	if (p.getEnd() > p.getTotalRecord()) {
		p.setEnd(p.getTotalRecord());
	}
	
	System.out.println(">> 시작번호(begin) : " + p.getBegin());
	System.out.println(">> 끝번호(end) : " + p.getEnd());
	
	//------ 블록(block) 계산하기 -----------
	//4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
	int nowPage = p.getNowPage();
	int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
	p.setBeginPage(beginPage);
	p.setEndPage(beginPage + p.getNumPerBlock() - 1);
	
	//끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
	// 끝페이지를 전체페이지 수로 변경 처리
	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}
	
	System.out.println(">> beginPage : " + p.getBeginPage());
	System.out.println(">> endPage : " + p.getEndPage());
	
	//=====================
	//DB 데이터 가져오기
	//시작번호(begin), 끝번호(end) 사용해서 게시글 조회
	List<ReviewsVO> list = DAO.getList2(p.getBegin(), p.getEnd());
	System.out.println(">> 현재페이지 글목록(list) : " + list);
	
	//===================================
	//EL, JSTL 사용을 위해 scope에 데이터 등록(page 영역)
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pvo", p);
	
	
	
	
	
	//페이징 처리를 위한 객체(Paging) 생성
		Paging_Product_Inquiry p2 = new Paging_Product_Inquiry();

		//1. 전체 게시물 수량 구하기
		p2.setTotalRecord(DAO.getTotalCount3());
		p2.setTotalPage();
		System.out.println("> 전체 게시글 수 : " + p2.getTotalRecord());
		System.out.println("> 전체 페이지 수 : " + p2.getTotalPage());
		
		//2. 현재 페이지 구하기
		String cPage2 = request.getParameter("cPage");
		if (cPage2 != null) {
			p2.setNowPage(Integer.parseInt(cPage2));
		}
		System.out.println("> cPage2 : " + cPage2);
		System.out.println("> paging nowPage : " + p2.getNowPage());
		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p2.setEnd(p2.getNowPage() * p2.getNumPerPage());
		p2.setBegin(p2.getEnd() - p2.getNumPerPage() + 1);
		
		//3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
		if (p2.getEnd() > p2.getTotalRecord()) {
			p2.setEnd(p2.getTotalRecord());
		}
		
		System.out.println(">> 시작번호(begin) : " + p2.getBegin());
		System.out.println(">> 끝번호(end) : " + p2.getEnd());
		
		//------ 블록(block) 계산하기 -----------
		//4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
		int nowPage2 = p2.getNowPage();
		int beginPage2 = (nowPage2 - 1) / p2.getNumPerBlock() * p2.getNumPerBlock() + 1;
		p2.setBeginPage(beginPage);
		p2.setEndPage(beginPage + p2.getNumPerBlock() - 1);
		
		//끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		// 끝페이지를 전체페이지 수로 변경 처리
		if (p2.getEndPage() > p2.getTotalPage()) {
			p2.setEndPage(p2.getTotalPage());
		}
		
		System.out.println(">> beginPage : " + p2.getBeginPage());
		System.out.println(">> endPage : " + p2.getEndPage());
		
		//=====================
		//DB 데이터 가져오기
		//시작번호(begin), 끝번호(end) 사용해서 게시글 조회
		List<ProductInquiryVO> list2 = DAO.getList3(p2.getBegin(), p2.getEnd());
		System.out.println(">> 현재페이지 글목록(list) : " + list2);
		
		DAO.avg1();
		System.out.println(">> 평균 " + DAO.avg1());
		pageContext.setAttribute("avg", DAO.avg1());
		
		//===================================
		//EL, JSTL 사용을 위해 scope에 데이터 등록(page 영역)
		pageContext.setAttribute("list2", list2);
		pageContext.setAttribute("p2", p2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모두의집 - 리뷰 및 제품문의</title>
<%@ include file="WEB-INF/common/style.jspf" %>
<style>

	#layout1 {
		width: 100%;
	}
	
	#layout1 .container1{
		width: 1280px;
		margin: auto;
		
	}
	
	#layout1 .container1 .box1 {
		display: block;
		padding-top: 100px;
		width: 600px;
		margin: auto;
	}
	
	#layout1 .container1 .box1 input {
		float: right;
		font-size: 15px;
		border: 1px solid deepskyblue;
		border-radius: 5px;
		color: white;
		padding: 3px 6px;
		background-color: deepskyblue;
	}
	
	
	
	#layout1 .container1 .box1 input:hover {
		opacity: 0.5;
	}
	
	
	#layout1 .container1 .box1 .span1 {
		font-size: 22px;
		margin-top: 100px;
		font-weight: bold;
	}
	
	#layout1 .container1 .box1 .span2 {
		display: block;
		border: 1px solid #f0f1f1;
		background-color: #f0f1f1;
		border-radius: 10px;
		margin-top: 10px;
		padding: 40px;
		text-align: center;
		font-size: 22px;
		color: darkorange;
	}
	
	#layout1 .container1 .box1 .span2 b {
		font-size: 40px;
		color: deepskyblue;
	}
	
	#layout1 .container1 .box1 ul {
	display: block;
	list-style: none; 
	padding-left: 0;
	border-bottom: 2px solid #f0f1f1;
	padding-bottom: 45px;
	}
	
	#layout1 .container1 .box1 ul:last-child {
		border: none;
	}
	
	
	#layout1 .container1 .box1 ul li {
		margin-top: 10px;
	}
	
	#layout1 .container1 .box1 ul #but1 {
		float: left;
		margin-right: 3px;
		margin-top: 5px;
	}
	
	
	
	#layout2 {
		width: 100%;
	}
	
	#layout2 .container2{
		width: 1280px;
		margin: auto;
	}
	
	#layout2 .container2 .box2 {
		display: block;
		padding-top: 50px;
		width: 600px;
		margin: auto;
		word-break:break-all;
		margin-bottom: 80px;
	}
	
	
	#layout2 .container2 .box2 span {
		font-size: 22px;
		margin-top: 100px;
		font-weight: bold;
	}
	
	
	#layout2 .container2 .box2 ul {
		display: block;
		list-style: none; 
		padding-left: 0;
		border-bottom: 2px solid #f0f1f1;
		padding-bottom: 10px;
	}
	
	#layout2 .container2 .box2 ul:last-child {
		border: none;
	}
	
	
	#layout2 .container2 .box2 ul li {
		margin-top: 10px;
	}
	
	#layout2 .container2 .box2 input {
		font-size: 15px;
		border: 1px solid deepskyblue;
		border-radius: 5px;
		color: white;
		padding: 3px 6px;
		background-color: deepskyblue;
	}
	
	
	
	#layout2 .container2 .box2 input:hover {
		opacity: 0.5;
	}
	
	
	
	
	/*** 페이지 표시 영역 스타일(시작) ****/	
	.paging {
	 	list-style: none; 
	 	margin-top: 30px;
	 }
	
	.paging li {
		float: left;
		margin: 0px 5px;
	}
	

	
	#layout2 .container2 input {
		border: 1px solid deepskyblue;
		border-radius: 5px;
		background-color: deepskyblue;
		font-weight: bold;
		color: white;
		padding: 5px 10px;
		margin-top: 10px;
	}
	
	
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid #00B3DC;
		font-weight: bold;
	}
	
	.paging .disable1 {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
		margin-left: 180px;
	}
	
	.paging .disable2 {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid deepskyblue;
		padding: 3px 7px;
		background-color: deepskyblue;
	}
	.store {
  			color: #35C5F0;
  			font-weight: bold;
  		}
  		.community {
  			color: black;
  		}
  		.home, .category, .best, .discount {
  		color: black;
  		}
  		
</style>  

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
	<%@ include file="WEB-INF/common/storeMenu.jspf" %>
		<div class="box1">
			<span class="span1">리뷰</span>
			<c:if test="${not empty orderNum }">
				<input type="button" value="리뷰쓰기" onclick="location.href='review_write.do?orderNum=' + <%=orderNum %>" />
			</c:if>
			<span class="span2">별점 : <b>${avg }</b> / 5 </span>
			
			<c:forEach var="vo" items="${list }">
				<c:if test="${empty vo.idx }">
					<ul>
						<li>등록된 리뷰가 없습니다.</li>
					</ul>
				</c:if>
				<c:if test="${not empty vo }">
					<ul>
						<li>${vo.rNum }번</li>
						<li style="font-size: 18px; color: darkorange;"><b>평점 : <b style="font-size: 20px; color: deepskyblue;">${vo.star }</b>&nbsp;점</b></li>
						<li style="margin-bottom: 10px;"><b>${vo.id }</b></li>
						<c:if test="${not empty vo.fileName }">
							<td>
								<img src="${pageContext.request.contextPath}/requestImage/${vo.fileName }" width="200px" height="200px" />
							</td>		
						</c:if>
						<div class="comment-message" style="white-space:pre-wrap; margin-top: 20px;"><c:out value="${vo.comments }"></c:out></div>
						<br>
						<c:if test="${id == vo.id }">
							<input type="button" value="리뷰수정" onclick="location.href='review_modify.jsp?idx=${vo.idx }'" id="but1">
							<input type="button" value="리뷰삭제" onclick="location.href='review_delete_ok.jsp?idx=${vo.idx }'" id="but1">
						</c:if>
					</ul>
				</c:if>
			</c:forEach>
			
			
			
				<ul class="paging">
				<%--[이전으로]에 대한 사용여부 처리 --%>
				<c:if test="${pvo.beginPage == 1 }">
					<li class="disable1">&#60;</li>
				</c:if>	
				<c:if test="${pvo.beginPage != 1 }">
					<li>
						<a href="review_product_inquiry.jsp?cPage=${pvo.beginPage - 1 }">이전으로</a>
					</li>
				</c:if>
				
				<%--블록내에 표시할 페이지 태그작성(시작페이지~끝페이지) --%>
				<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
				<c:if test="${pageNo == pvo.nowPage }">
					<li class="now">${pageNo }</li>
				</c:if>	
				<c:if test="${pageNo != pvo.nowPage }">
					<li><a href="review_product_inquiry.jsp?cPage=${pageNo }">${pageNo }</a></li>
				</c:if>	
				</c:forEach>
					
				<%--[다음으로]에 대한 사용여부 처리 --%>
				<c:if test="${p.endPage < p.totalPage }">
					<li>
						<a href="review_product_inquiry.jsp?cPage=${p.endPage + 1 }">다음으로</a>
					</li>
				</c:if>
				<c:if test="${p.endPage >= p.totalPage }">
					<li class="disable2">></li>
				</c:if>		
			</ul>
		</div>
	</div>
</div>

<div id="layout2">
	<div class="container2">
		<div class="box2">
			<span id="inquiryContent">제품 문의</span>
			<c:forEach var="vo2" items="${list2 }">
				<c:if test="${empty vo2 }">
					<ul>
						<li>등록된 제품문의가 없습니다.</li>
					</ul>
				</c:if>
				<c:if test="${not empty vo2 }">
					<ul>
						<li>${vo2.rNum }번</li>
						<li style="font-size: 18px; margin-bottom: 10px;"><b>${vo2.id }</b></li>
						<c:if test="${not empty vo2.fileName }">
							<td>
								<img src="${pageContext.request.contextPath}/requestImage/${vo2.fileName }" width="200px" height="200px" />
							</td>		
						</c:if>
						<div class="comment-message" style="white-space:pre-wrap; margin-top: 20px;" ><c:out value="${vo2.comments }"></c:out></div>
						<br>
						<li>${vo2.regdate.substring(0,10) }</li>
						<c:if test="${id == vo2.id }">
							<input type="button" value="제품문의수정" onclick="location.href='product_inquiry_modify.jsp?proinIdx=${vo2.proinIdx }'" id="but2">
							<input type="button" value="제품문의삭제" onclick="location.href='product_inquiry_delete_ok.jsp?proinIdx=${vo2.proinIdx }'" id="but2">
						</c:if>
					</ul>
				</c:if>
			</c:forEach>
			
			<ul class="paging">
				<%--[이전으로]에 대한 사용여부 처리 --%>
				<c:if test="${p2.beginPage == 1 }">
					<li class="disable1">&#60;</li>
				</c:if>	
				<c:if test="${p2.beginPage != 1 }">
					<li>
						<a href="review_product_inquiry.jsp?cPage=${p2.beginPage - 1 }">이전으로</a>
					</li>
				</c:if>
				
				<%--블록내에 표시할 페이지 태그작성(시작페이지~끝페이지) --%>
				<c:forEach var="pageNo" begin="${p2.beginPage }" end="${p2.endPage }">
				<c:if test="${pageNo == pvo.nowPage }">
					<li class="now">${pageNo }</li>
				</c:if>	
				<c:if test="${pageNo != p2.nowPage }">
					<li><a href="review_product_inquiry.jsp?cPage=${pageNo }">${pageNo }</a></li>
				</c:if>	
				</c:forEach>
					
				<%--[다음으로]에 대한 사용여부 처리 --%>
				<c:if test="${p2.endPage < p2.totalPage }">
					<li>
						<a href="review_product_inquiry?cPage=${pvo.endPage + 1 }">다음으로</a>
					</li>
				</c:if>
				<c:if test="${p2.endPage >= p2.totalPage }">
					<li class="disable2">></li>
				</c:if>		
				<c:if test="${not empty orderNum }">
					<input type="button" style="float: right;" value="제품문의" onclick="location.href='product_inquiry_write.do?productNum=' + <%=pro %>" >
				</c:if>
				
			</ul>
		</div>
		

<%@ include file="WEB-INF/common/footer.jspf" %>
	</div>
</div>

</body>
</html>