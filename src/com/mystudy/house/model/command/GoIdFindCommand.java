package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.house.model.dao.MembersDAO;
import com.mystudy.house.model.vo.MembersVO;

public class GoIdFindCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MembersVO vo = new MembersVO();
		vo.setName(request.getParameter("name"));
		vo.setPhone(request.getParameter("phone"));
		
		String id = MembersDAO.findId(vo);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='idFind.do' method='post'>");
		out.println("</form></html>");
		if(id == null) {
			out.println("<script>alert('해당하는 아이디가 없습니다');frm.submit();</script>");
		} else {
			out.println("<script>alert('찾은 아이디: " + id +"');frm.submit();</script>");
		}
		out.close();

		return null;
	}

}
