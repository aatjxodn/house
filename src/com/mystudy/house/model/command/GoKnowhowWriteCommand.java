package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.KnowhowDAO;
import com.mystudy.house.model.vo.KnowhowVO;

public class GoKnowhowWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		KnowhowVO vo = new KnowhowVO();
		vo.setCategory(request.getParameter("category"));
		vo.setContent(request.getParameter("editordata"));
		vo.setId((String) session.getAttribute("id"));
		vo.setSubject(request.getParameter("subject"));
		vo.setThumbnail(request.getParameter("thumbnail"));
		
		KnowhowDAO.writeKnowhow(vo);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='knowhow.do' method='post'>");
	    out.println("</form></html>");
	    out.println("<script>alert('노하우글을 작성하였습니다');frm.submit();</script>");
	    out.close();
	    
		return null;

	}

}
