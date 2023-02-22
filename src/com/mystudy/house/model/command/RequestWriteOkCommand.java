package com.mystudy.house.model.command;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.mystudy.house.model.dao.DAO;
import com.mystudy.house.model.vo.RequestVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RequestWriteOkCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		String path = "C:/Users/itwill/Downloads/house/WebContent/requestImage";
		
		MultipartRequest mr = new MultipartRequest(
		request, path, (10 * 1024 * 1024),
		"UTF-8", new DefaultFileRenamePolicy());
			
		RequestVO vo = new RequestVO();
		
		vo.setSubject(mr.getParameter("subject"));
		vo.setId(id);
		vo.setRegdate(mr.getParameter("regdate"));
		vo.setComments(mr.getParameter("editordata"));
		vo.setFileName(mr.getParameter("fileName"));
		vo.setOriName(request.getParameter("oriName"));
		
		if (mr.getFile("fileName") != null) {
			vo.setFileName(mr.getFilesystemName("fileName"));
			vo.setOriName(mr.getOriginalFileName("fimename"));
		} else {
			vo.setFileName("");
			vo.setOriName("");
		}
		System.out.println("asdasd " + vo);


		DAO.insert_request(vo);
		
		response.sendRedirect("request.jsp");
		
		
		return null;
	}


}
