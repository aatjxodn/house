package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.house.model.dao.MembersDAO;
import com.mystudy.house.model.vo.MembersVO;

public class GoSignupCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MembersVO vo = new MembersVO();
		vo.setName(request.getParameter("name"));
		vo.setId(request.getParameter("id"));
		vo.setPw(request.getParameter("pw"));
		vo.setEmail(request.getParameter("email"));
		vo.setAddr(request.getParameter("addr"));
		vo.setAddrDetail(request.getParameter("addrDetail"));
		vo.setPhone(request.getParameter("phone"));
		
		MembersDAO.signup(vo);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='login.do' method='post'>");
		out.println("</form></html>");
		out.println("<script>alert('회원가입을 완료하였습니다');frm.submit();</script>");
		out.close();
				       
		return null;
	}

}
