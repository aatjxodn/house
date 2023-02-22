<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.mystudy.house.model.dao.DAO"%>
<%@page import="com.mystudy.house.model.vo.ReviewsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String path = "C:/Users/itwill/Downloads/house/WebContent/requestImage";
	
	MultipartRequest mr = new MultipartRequest(
	request, path, (10 * 1024 * 1024),
	"UTF-8", new DefaultFileRenamePolicy());
	
	ReviewsVO vo = new ReviewsVO();
	
	vo.setIdx(mr.getParameter("idx"));
	vo.setOrderNum(mr.getParameter("orderNum"));
	vo.setStar(mr.getParameter("star"));
	vo.setComments(mr.getParameter("comments"));

	vo.setIp(request.getRemoteAddr());
	
	if (mr.getFile("fileName") != null) {
		vo.setFileName(mr.getFilesystemName("fileName"));
		vo.setOriName(mr.getOriginalFileName("fimename"));
	} else {
		vo.setFileName("");
		vo.setOriName("");
	}
	System.out.println(vo);

	DAO.reviews_update(vo);
	
	response.sendRedirect("review_product_inquiry.jsp");
%>