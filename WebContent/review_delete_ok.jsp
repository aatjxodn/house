<%@page import="com.mystudy.house.model.dao.DAO"%>
<%@page import="com.mystudy.house.model.vo.ReviewsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	ReviewsVO vo = new ReviewsVO();
	
	vo.setIdx(request.getParameter("idx"));
	
	DAO.reviews_delete(vo);
	
	response.sendRedirect("review_product_inquiry.jsp");
%>