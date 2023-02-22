package com.mystudy.house.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.CartDAO;
import com.mystudy.house.model.dao.KnowhowDAO;
import com.mystudy.house.model.vo.CartVO;
import com.mystudy.house.model.vo.CartviewVO;
import com.mystudy.house.model.vo.KnowhowVO;

public class GoCartInsertCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int ProductNum = Integer.parseInt(request.getParameter("ProductNum"));
		
		CartVO vo = new CartVO();
		vo.setProductNum(Integer.parseInt(request.getParameter("ProductNum"))) ;
		vo.setId((String) session.getAttribute("id"));
		vo.setCount(Integer.parseInt(request.getParameter("count")));
		
		System.out.println(vo);
		
		//중복확인
		List<CartviewVO> list = CartDAO.cartView(id);
		for(CartviewVO cvo:list) {
			if(cvo.getProductNum()==ProductNum) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			java.io.PrintWriter out = response.getWriter();	
			out.println("<script>alert('장바구니에 해당 상품이 존재합니다');location.href='cart.do';</script>");
			out.close();
			return null;
			}
		}
		
		// 인서트~~
		CartDAO.insertCart(vo);
		
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='cart.do' method='post'>");
		out.println("</form></html>");
		out.println("<script>frm.submit();</script>");
		out.close();
		       
		return null;
		
		// return "cart.do";
	}

}
