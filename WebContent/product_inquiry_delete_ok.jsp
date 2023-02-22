<%@page import="com.mystudy.house.model.dao.DAO"%>
<%@page import="com.mystudy.house.model.vo.ProductInquiryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	ProductInquiryVO vo = new ProductInquiryVO();
	
	vo.setProinIdx(request.getParameter("proinIdx"));
	
	DAO.product_inquiry_delete(vo);
	
	response.sendRedirect("review_product_inquiry.jsp");
%>