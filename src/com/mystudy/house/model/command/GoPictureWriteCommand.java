package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.PictureDAO;
import com.mystudy.house.model.vo.PictureVO;

public class GoPictureWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		PictureVO vo = new PictureVO();
		vo.setContent(request.getParameter("editordata"));
		vo.setId((String) session.getAttribute("id"));
		vo.setResidence(request.getParameter("residence"));
		vo.setSizes(request.getParameter("sizes"));
		vo.setSpace(request.getParameter("space"));
		vo.setStyle(request.getParameter("style"));
		vo.setThumbnail(request.getParameter("thumbnail"));
			
		PictureDAO.writePicture(vo);

		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='picture.do' method='post'>");
		out.println("</form></html>");
		out.println("<script>alert('사진글을 작성하였습니다');frm.submit();</script>");
		out.close();
				       
		return null;
	}

}
