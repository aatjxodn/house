package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.KnowhowDAO;
import com.mystudy.house.model.vo.KnowcommentVO;

public class KnowhowComment2WriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "login.do";
		}
		
		String idx = request.getParameter("idx");
		
		KnowcommentVO vo = new KnowcommentVO();
		vo.setId(id); // 작성아이디
		vo.setContent(request.getParameter("comments")); // 내용
		vo.setKnowhowIdx(request.getParameter("knowcomIdx")); // 댓글번호
		
		KnowhowDAO.writeKnowhowComment2(vo);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='knowhowDetail.do' method='post'>");
		out.println("<input type='hidden' name='idx' value=" + idx + ">");
		out.println("</form></html>");
		out.println("<script>alert('대댓글이 등록되었습니다');frm.submit();</script>");
		out.close();

		return null;
	}

}
