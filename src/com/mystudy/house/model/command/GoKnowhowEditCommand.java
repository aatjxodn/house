package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.house.model.dao.KnowhowDAO;
import com.mystudy.house.model.vo.KnowhowVO;

public class GoKnowhowEditCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		
		KnowhowVO vo = new KnowhowVO();
		
		vo.setKnowhowIdx(idx);
		vo.setCategory(request.getParameter("category"));
		vo.setContent(request.getParameter("editordata"));
		vo.setSubject(request.getParameter("subject"));
		
		KnowhowDAO.editKnowhow(vo);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='knowhowDetail.do' method='post'>");
		out.println("<input type='hidden' name='idx' value=" + idx + ">");
		out.println("</form></html>");
		out.println("<script>alert('노하우글이 수정되었습니다');frm.submit();</script>");
		out.close();

		return null;
	}

}
