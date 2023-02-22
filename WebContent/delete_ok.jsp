<%@page import="com.mystudy.house.model.dao.DAO"%>
<%@page import="com.mystudy.house.model.vo.RequestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	

	String requestIdx = request.getParameter("requestIdx");
	
	RequestVO vo = new RequestVO();
	
	vo.setRequestIdx(requestIdx);
	
	DAO.delete_request(vo);
	
	response.sendRedirect("request.jsp");
	
%>

