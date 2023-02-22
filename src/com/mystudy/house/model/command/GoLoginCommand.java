package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.MembersDAO;
import com.mystudy.house.model.vo.MembersVO;

public class GoLoginCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		MembersVO vo = new MembersVO();
		vo.setId(request.getParameter("id"));
		vo.setPw(request.getParameter("pw"));
		
		MembersVO user = MembersDAO.login(vo);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		java.io.PrintWriter out = response.getWriter();
		
		if(user != null) {
			if("3".equals(user.getGradeNum())) {
				session.setAttribute("id", user.getId());
				session.setAttribute("gradeNum", user.getGradeNum());
				// session.setAttribute("profileImg", user.getProfileImg());
				
				out.println("<html><form name='frm' action='partnercenter.do' method='post'>");
				out.println("</form></html>");
				out.println("<script>frm.submit();</script>");
				out.close();
				
				return null;
				
				// return "partnercenter.do";
			} else {
				session.setAttribute("id", user.getId());
				session.setAttribute("profileImg", user.getProfileImg());

				out.println("<html><form name='frm' action='community.do' method='post'>");
				out.println("</form></html>");
				out.println("<script>frm.submit();</script>");
				out.close();
				
				return null;

				// return "community.do";
			}
		} else {
			out.println("<html><form name='frm' action='login.do' method='post'>");
			out.println("</form></html>");
			out.println("<script>alert('로그인 실패하였습니다');frm.submit();</script>");
			out.close();
			
			return null;
		}
	}

}
