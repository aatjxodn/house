package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.house.model.dao.PictureDAO;
import com.mystudy.house.model.vo.PictureVO;

public class GoPictureEditCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		System.out.println(idx);
		
		PictureVO vo = new PictureVO();
		
		vo.setPictureIdx(idx);
		vo.setResidence(request.getParameter("residence"));
		vo.setSpace(request.getParameter("space"));
		vo.setStyle(request.getParameter("style"));
		vo.setSizes(request.getParameter("sizes"));
		vo.setContent(request.getParameter("editordata"));
		
		PictureDAO.editPicture(vo);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='pictureDetail.do' method='post'>");
		out.println("<input type='hidden' name='idx' value=" + idx + ">");
		out.println("</form></html>");
		out.println("<script>alert('사진글이 수정되었습니다');frm.submit();</script>");
		out.close();

		return null;
	}

}
