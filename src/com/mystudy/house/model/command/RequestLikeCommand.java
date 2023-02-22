package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.DAO;
import com.mystudy.house.model.dao.KnowhowDAO;
import com.mystudy.house.model.vo.KnowlikeVO;
import com.mystudy.house.model.vo.RequestLikeVO;

public class RequestLikeCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String requestIdx = request.getParameter("requestIdx");
		
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "login.do";
		}
		
		RequestLikeVO vo = new RequestLikeVO();
		vo.setId(id);
		vo.setRequestIdx(requestIdx);
		
		int result = DAO.likeRequest(vo);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='view.jsp' method='post'>");
		out.println("<input type='hidden' name='requestIdx' value=" + requestIdx + ">");
		out.println("</form></html>");
		if(result > 0) {
			out.println("<script>alert('질문과답변글 좋아요가 완료되었습니다');frm.submit();</script>");
		} else {
			out.println("<script>alert('이미 좋아요한 질문과답변글입니다.');frm.submit();</script>");
		}
		out.close();
		
		return null;
	}

}
