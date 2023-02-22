<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.mystudy.house.model.dao.DAO"%>
<%@page import="com.mystudy.house.model.vo.HouseVO"%>
<%@page import="com.mystudy.house.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이타를 DB에 저장(INSERT)
	입력성공 : 목록페이지로 이동(list.jsp)
	입력실패(예외) : 메시지 표시 후 이전화면(입력페이지) 이동
--%>
<%
	//0. 한글처리
	request.setCharacterEncoding("UTF-8");
	
	String path = "c:/MyStudy/temp";
	
	MultipartRequest mr = new MultipartRequest(
	request, path, (10 * 1024 * 1024),
	"UTF-8", new DefaultFileRenamePolicy());
	
	
	HouseVO vo = new HouseVO();
	
	vo.setId(mr.getParameter("id"));
	vo.setSubject(mr.getParameter("subject"));
	vo.setName(mr.getParameter("name"));
	vo.setEmail(mr.getParameter("email"));
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

	DAO.insert_inquiry(vo);

	response.sendRedirect("gogak.jsp");
%>

