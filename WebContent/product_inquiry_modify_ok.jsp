<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.mystudy.house.model.dao.DAO"%>
<%@page import="com.mystudy.house.model.vo.ProductInquiryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String path = "C:/Users/itwill/Downloads/house/WebContent/requestImage";
	
	MultipartRequest mr = new MultipartRequest(
	request, path, (10 * 1024 * 1024),
	"UTF-8", new DefaultFileRenamePolicy());


	ProductInquiryVO vo = new ProductInquiryVO();
	
	vo.setProinIdx(mr.getParameter("proinIdx"));
	vo.setComments(mr.getParameter("comments"));
	vo.setRegdate(mr.getParameter("regdate"));
	vo.setFileName(mr.getParameter("fileName"));
	
	if (mr.getFile("fileName") != null) {
		vo.setFileName(mr.getFilesystemName("fileName"));
		vo.setOriName(mr.getOriginalFileName("fimename"));
	} else {
		vo.setFileName("");
		vo.setOriName("");
	}
	System.out.println(vo);

	DAO.product_inquiry_upadte(vo);
	
	response.sendRedirect("review_product_inquiry.jsp");
%>