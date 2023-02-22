package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("id", null);
		session.setAttribute("gradeNum", null);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='community.do' method='post'>");
		out.println("</form></html>");
		out.println("<script>alert('로그아웃 되었습니다');frm.submit();</script>");
		out.close();
		
		return null;
		
		// return "/WEB-INF/community/community.jsp";
	}

}
