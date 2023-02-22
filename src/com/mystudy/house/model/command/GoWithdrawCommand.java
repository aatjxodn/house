package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.MembersDAO;

public class GoWithdrawCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
			
		int result = MembersDAO.withdraw(id);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		java.io.PrintWriter out = response.getWriter();
		if(result > 0) {
			session.setAttribute("id", null);

			out.println("<html><form name='frm' action='community.do' method='post'>");
			out.println("</form></html>");
			out.println("<script>alert('탈퇴가 완료되었습니다');frm.submit();</script>");
		} else {
			out.println("<html><form name='frm' action='withdraw.do' method='post'>");
			out.println("</form></html>");
			out.println("<script>alert('탈퇴 실패하였습니다');frm.submit();</script>");
		}
		out.close();
		
		return null;
	}

}
