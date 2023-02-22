package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.house.model.dao.CartDAO;
import com.mystudy.house.model.dao.KnowhowDAO;

public class CartDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productNum = request.getParameter("productNum");
		
		CartDAO.deleteCart(productNum);
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='cart.do' method='post'>");
		out.println("</form></html>");
		out.println("<script>frm.submit();</script>");
		out.close();
		       
		return null;
		
		// return "cart.do";
	}

}
