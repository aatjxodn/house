package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.MembersDAO;
import com.mystudy.house.model.vo.MembersVO;

public class GoInfoEditCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		MembersVO vo = new MembersVO();
		vo.setId((String) session.getAttribute("id"));
		vo.setName(request.getParameter("name"));
		vo.setEmail(request.getParameter("email"));
		vo.setAddr(request.getParameter("addr"));
		vo.setAddrDetail(request.getParameter("addrDetail"));
		vo.setPhone(request.getParameter("phone"));
		
		MembersDAO.editInfo(vo);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='infoEdit.do' method='post'>");
		out.println("</form></html>");
		out.println("<script>alert('정보가 수정되었습니다');frm.submit();</script>");
		out.close();
				       
		return null;
	}

}
