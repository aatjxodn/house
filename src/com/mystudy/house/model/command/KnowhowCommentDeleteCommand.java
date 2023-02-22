package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.house.model.dao.KnowhowDAO;

public class KnowhowCommentDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 댓글 삭제
		
		String idx = request.getParameter("idx"); // 글번호
		String comIdx = request.getParameter("comIdx"); // 댓글번호
		
		KnowhowDAO.deleteKnowhowComment(comIdx);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='knowhowDetail.do' method='post'>");
		out.println("<input type='hidden' name='idx' value=" + idx + ">");
		out.println("</form></html>");
		out.println("<script>alert('댓글이 삭제되었습니다');frm.submit();</script>");
		out.close();

		return null;
	}

}
