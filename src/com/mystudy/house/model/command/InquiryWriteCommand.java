package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.DAO;
import com.mystudy.house.model.vo.HouseVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InquiryWriteCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		
		String path = "C:/Users/itwill/Downloads/house/WebContent/requestImage";
		
		MultipartRequest mr = new MultipartRequest(
		request, path, (10 * 1024 * 1024),
		"UTF-8", new DefaultFileRenamePolicy());
		
		
		HouseVO vo = new HouseVO();
		
		vo.setId(id);
		vo.setSubject(mr.getParameter("subject"));
		vo.setName(mr.getParameter("name"));
		vo.setEmail(mr.getParameter("email"));
		vo.setComments(mr.getParameter("comments"));
		
		
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
		
		return null;
	}

}
