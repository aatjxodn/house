<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.mystudy.house.model.dao.DAO"%>
<%@page import="com.mystudy.house.model.vo.RequestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

String path = "C:/Users/itwill/Downloads/house/WebContent/requestImage";
	
	MultipartRequest mr = new MultipartRequest(
	request, path, (10 * 1024 * 1024),
	"UTF-8", new DefaultFileRenamePolicy());
	
	RequestVO vo = new RequestVO();
	
	vo.setRequestIdx(mr.getParameter("requestIdx"));
	vo.setSubject(mr.getParameter("subject"));
	vo.setComments(mr.getParameter("editordata"));
	vo.setFileName(mr.getParameter("File"));
	
	if (mr.getFile("fileName") != null) {
		vo.setFileName(mr.getFilesystemName("fileName"));
		vo.setOriName(mr.getOriginalFileName("fimename"));
	} else {
		vo.setFileName("");
		vo.setOriName("");
	}
	System.out.println(vo);

	DAO.update_request(vo);

	System.out.println(DAO.update_request(vo));
	
	response.sendRedirect("request.jsp");
%>