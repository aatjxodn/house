package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.house.model.dao.KnowhowDAO;

public class KnowhowDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		
		KnowhowDAO.deleteKnowhow(idx);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='knowhow.do' method='post'>");
		out.println("</form></html>");
		out.println("<script>alert('노하우글이 삭제되었습니다');frm.submit();</script>");
		out.close();

		return null;
	}

}
