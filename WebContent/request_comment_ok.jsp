<%@page import="java.util.List"%>
<%@page import="com.mystudy.house.model.vo.RequestVO"%>
<%@page import="com.mystudy.house.model.dao.DAO"%>
<%@page import="com.mystudy.house.model.vo.Request_comVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%
	request.setCharacterEncoding("UTF-8");	

	String req = request.getParameter("requestIdx");
	
	HttpSession session2 = request.getSession();
	
	String id = (String) session2.getAttribute("id");
	

	Request_comVO vo = new Request_comVO();
	
	vo.setId(id);
	vo.setRequestIdx(request.getParameter("requestIdx"));
	vo.setComments(request.getParameter("comments"));
	
	int str = DAO.Request_comment_insert(vo);
	
	
	System.out.println("이거이거 : " +str);

	//EL, JSTL 사용을 위한 scope 상에 속성 등록처리
	
	session.setAttribute("vo2", str);

	response.sendRedirect("view.jsp?requestIdx=" + req);

%>