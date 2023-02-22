package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.PictureDAO;
import com.mystudy.house.model.vo.PiccommentVO;

public class PictureCommentWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "login.do";
		}
		
		String idx = request.getParameter("idx");

		PiccommentVO vo = new PiccommentVO();
		vo.setId(id);
		vo.setContent(request.getParameter("comment"));
		vo.setPictureIdx(idx);
		
		PictureDAO.writePictureComment(vo);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='pictureDetail.do' method='post'>");
		out.println("<input type='hidden' name='idx' value=" + idx + ">");
		out.println("</form></html>");
		out.println("<script>alert('댓글이 등록되었습니다');frm.submit();</script>");
		out.close();

		return null;
	}

}
