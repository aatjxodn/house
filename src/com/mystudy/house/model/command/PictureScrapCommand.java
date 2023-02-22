package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.PictureDAO;
import com.mystudy.house.model.vo.PicscrapVO;

public class PictureScrapCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String idx = request.getParameter("idx");
		
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "login.do";
		}
		
		PicscrapVO vo = new PicscrapVO();
		vo.setId(id);
		vo.setPictureIdx(idx);
		
		int result = PictureDAO.scrapPicture(vo);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='pictureDetail.do' method='post'>");
		out.println("<input type='hidden' name='idx' value=" + idx + ">");
		out.println("</form></html>");
		if(result > 0) {
			out.println("<script>alert('사진글 스크랩이 완료되었습니다');frm.submit();</script>");
		} else {
			out.println("<script>alert('사진글 스크랩이 취소되었습니다');frm.submit();</script>");
		}
		out.close();
		
		return null;
	}

}
