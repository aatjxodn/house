<%@page import="com.mystudy.house.model.vo.RequestVO"%>
<%@page import="com.mystudy.house.model.vo.HouseVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.house.model.dao.DAO"%>
<%@page import="com.mystudy.house.common.Paging_Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%--현재페이지에 표시할 데이터를 화면에 표시
	1. 페이징 처리를 위한 객체(Paging) 생성해서 필요한 데이터 참조
	2. 페이징 객체에 설정할 데이터 저장
	3. (DB) 전체 데이터 건수 조회
	4. (DB) 현재 페이지에 표시할 게시글 데이터 조회
	5. 데이터 화면에 표시(화면컨트롤 - 스타일 지정)
--%>
<%
//페이징 처리를 위한 객체(Paging) 생성
	Paging_Request p = new Paging_Request();

	request.setCharacterEncoding("UTF-8");
	
	String requestIdx2 = request.getParameter("requestIdx");
	
	int cnt = DAO.requestLikeCnt(requestIdx2);

	//1. 전체 게시물 수량 구하기
	p.setTotalRecord(DAO.getTotalCount());
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
	List<RequestVO> list = DAO.getList(p.getBegin(), p.getEnd());
	System.out.println(">> 현재페이지 글목록(list) : " + list);
	
	//===================================
	//EL, JSTL 사용을 위해 scope에 데이터 등록(page 영역)
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pvo", p);
	
	System.out.println(">>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의집 - 고객센터</title>
<%@ include file="/WEB-INF/common/style.jspf"%>
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
* {
	margin: 0px;
	text-decoration: none;
	list-style: none;
	font-family: sans-serif;
}
	
  #layout1 {
  	width: 100%;
  	background-color: #f6f7f7;
  	padding-bottom: 50px;
  }
  
  #layout1 .container1 {
  	width: 100%;
  	margin: auto;
  }
  
   #layout1 .container1 .box1 {
   	width: 100%;
   }
   
     #layout1 .container1 .box1 form {
     	text-align: center;
     }
   
   #layout1 .container1 .box1 .span1 {
   	display: block;
   	padding-top: 100px;
   	text-align: center;
   	font-size: 22px;
   	font-weight: bold;
   }
   
   #layout1 .container1 .box1 .span2 {
   	display: block;
   	padding-top: 20px;
   	text-align: center;
   	
   }
   
   #layout1 .container1 .box1 .catag {
   	width: 100%;
   	margin-top: 50px;
   }
   
   #layout1 .container1 .box1 .catag span{
   	margin-left: 430px;
   	margin-right: 25px;
   	font-size: 12px;
   	font-weight: bold;
   }
   
   

   
   #layout1 .container1 .box1 .search{
   	display: inline-block;
   	padding-bottom: 15px;
   	padding-top: 15px;
   	padding-left: 20px;
   	padding-right: 150px;	
   	color: silver;
   	border-radius: 10px;
   	border: 2px solid #f0f0f1;
   }
   
   #layout1 .container1 .box1 input:hover {
	opacity: 0.8;
	}
	
	
	#idx {
		
		display: inline;
		color: #a7aaad;
		padding-bottom: 15px;
   		padding-top: 15px;
   		padding-left: 15px;
   		padding-right: 15px;
   		border-radius: 10px;
   		border: 2px solid #f0f0f1;
   
	}
	
	#searcharea {
		display: inline-block;
	   	padding: 15px;
	   	color: #a7aaad;
	   	border-radius: 10px;
	   	border: 2px solid #f0f0f1;
	   	background-color: white;
	}
	
	#layout2 {
		margin-bottom: 30px;
	}
	
	#layout2 .container2 {
		width: 1100px;
		margin: auto;
		margin-bottom: 20px;
	}
	
	#layout2 .container2 .box2 {
		width: 100%;
		margin: auto;
	}
	
	#layout2 .container2 .box2 table {
		width: 1100px;
	}
	

	#layout2 .container2 .box2 tr {
		display: block;
		border-bottom: 2px solid #f6f7f7;
	}
	
	

	#layout2 .container2 .box2 tr td {
		width: 300px;
		padding: 60px 30px;;
		text-align: center;
	}
	
	
	#layout2 .container2 .box2 tr td a {
		color: deepskyblue;
	}
	
	
	
	
	/*** 페이지 표시 영역 스타일(시작) ****/
	#layout2 .container2 table {
		margin: auto;
	}
	
	.paging {
	 	list-style: none; 
	 	margin-top: 30px;
	 }
	
	.paging li {
		float: left;
		margin: 0px 5px;
	}

	
	#layout2 .container2 table tr input {
		border: 1px solid deepskyblue;
		border-radius: 5px;
		background-color: deepskyblue;
		font-weight: bold;
		color: white;
		padding: 4px 7px;
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
  
  	#requestButton:hover {
		opacity: 0.5;
	}

</style>
<script type="text/javascript"> 
	function a(y){
	   if (y.defaultValue==y.value) {
	      y.value = "";
	   }
	}
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
	<%@ include file="WEB-INF/common/communityMenu.jspf" %>
	<div id="layout1">
		<div class="container1">
			<div class="box1">
				<span class="span1">질문과 답변</span>
				<span class="span2">오늘의집 인테리어 고수들과 전문가들에게 조언을 받아보세요.</span><br>
				<form action="search" method="get">
					<select name="idx" id="idx">
						<option value="0">제목</option>
						<option value="1">아이디</option>
					</select>
					<input type="text" value="입력" class="search" name="keyword" onfocus="a(this)">				
					<input type="hidden" value="검색" id="searcharea">				
				</form>
			</div>
		</div>
	</div>
	<div id="layout2">
		<div class="container2">
			<div class="box2">
				<table>
					<c:choose>
						<c:when test="${empty list }"> 
								<h2>현재 등록된 게시글이 없습니다</h2>
						</c:when>
					<c:otherwise>
						<c:forEach var="vo" items="${list }">
							<tr>
								<td><b>${vo.rNum }</b></td>
								<c:if test="${not empty vo.fileName }">
									<td>
										<img src="${pageContext.request.contextPath}/requestImage/${vo.fileName }" width="150px" height="150px" />
									</td>		
								</c:if>
								<td class="align-left">
									<a href="view.jsp?requestIdx=${vo.requestIdx }&cPage=${pvo.nowPage}" onclick="view(a)">${vo.subject }</a>
								</td>
								<td>${vo.id }</td>
								<td>조회수 ${vo.views }</td>								
								<td id="last">${vo.regdate.substring(0,10) }</td>
							</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>	
						
					</table>
				</div>
					
				<table>
					<tfoot> 
						<tr>
							<td colspan="4">
								<ul class="paging">
								<%--[이전으로]에 대한 사용여부 처리 --%>
								<c:if test="${pvo.beginPage == 1 }">
									<li class="disable1">&#60;</li>
								</c:if>	
								<c:if test="${pvo.beginPage != 1 }">
									<li>
										<a href="request.jsp?cPage=${pvo.beginPage - 1 }">이전으로</a>
									</li>
								</c:if>
								
								<%--블록내에 표시할 페이지 태그작성(시작페이지~끝페이지) --%>
								<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
								<c:if test="${pageNo == pvo.nowPage }">
									<li class="now">${pageNo }</li>
								</c:if>	
								<c:if test="${pageNo != pvo.nowPage }">
									<li><a href="request.jsp?cPage=${pageNo }">${pageNo }</a></li>
								</c:if>	
								</c:forEach>
									
								<%--[다음으로]에 대한 사용여부 처리 --%>
								<c:if test="${pvo.endPage < pvo.totalPage }">
									<li>
										<a href="request.jsp?cPage=${pvo.endPage + 1 }">다음으로</a>
									</li>
								</c:if>
								<c:if test="${pvo.endPage >= pvo.totalPage }">
									<li class="disable2">></li>
								</c:if>		
								<input type="button" value="질문하기" onclick="location.href = 'requestWrite.do'" id="requestButton">
								</ul>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<%@ include file="WEB-INF/common/footer.jspf" %>
		</div>
	</div>
</body>
</html>