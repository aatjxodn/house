package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.KnowhowDAO;
import com.mystudy.house.model.vo.KnowlikeVO;

public class KnowhowLikeCommand implements Command {
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String idx = request.getParameter("idx");
		
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "login.do";
		}
		
		KnowlikeVO vo = new KnowlikeVO();
		vo.setId(id);
		vo.setKnowhowIdx(idx);
		
		int result = KnowhowDAO.likeKnowhow(vo);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='knowhowDetail.do' method='post'>");
		out.println("<input type='hidden' name='idx' value=" + idx + ">");
		out.println("</form></html>");
		if(result > 0) {
			out.println("<script>alert('노하우글 좋아요가 완료되었습니다');frm.submit();</script>");
		} else {
			out.println("<script>alert('이미 좋아요한 노하우글입니다');frm.submit();</script>");
		}
		out.close();
		
		return null;	
	}

}
