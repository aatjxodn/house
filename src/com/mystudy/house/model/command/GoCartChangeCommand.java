package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.CartDAO;
import com.mystudy.house.model.dao.MembersDAO;
import com.mystudy.house.model.vo.CartVO;
import com.mystudy.house.model.vo.MembersVO;

public class GoCartChangeCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println("ProductNum : " + request.getParameter("ProductNum"));
		System.out.println("count : " + request.getParameter("count"));
		
		CartVO vo = new CartVO();
		vo.setProductNum(Integer.parseInt(request.getParameter("ProductNum")));
		vo.setCount(Integer.parseInt(request.getParameter("count")));
		
		CartDAO.changeCount(vo);
		
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='cart.do' method='post'>");
		out.println("</form></html>");
		out.println("<script>frm.submit();</script>");
		out.close();
		       
		return null;
		
		// return "cart.do"
	}

}
