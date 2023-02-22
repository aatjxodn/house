package com.mystudy.house.model.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.CartDAO;
import com.mystudy.house.model.dao.ProductDAO;
import com.mystudy.house.model.vo.CartviewVO;
import com.mystudy.house.model.vo.OrderCkVO;
import com.mystudy.house.model.vo.OrderPVO;
import com.mystudy.house.model.vo.OrderVO;
import com.mystudy.house.model.vo.ProductVO;

public class OrderCompleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//1. 사용할 파라미터 값 추출(확인)
		String orderRequest = request.getParameter("orderRequest");
		System.out.println("orderRequest:" + orderRequest);
		
		String id =request.getParameter("id");
		System.out.println("id:" + id);
		
		String orderName = request.getParameter("orderName");
		System.out.println("orderName" + orderName);
		
		String orderPhone = request.getParameter("orderPhone");
		System.out.println("orderPhone" + orderPhone);
		
		String orderAddr = request.getParameter("orderAddr");
		System.out.println("orderAddr" + orderAddr);
		
		int totPrice = Integer.parseInt(request.getParameter("totPrice"));
		System.out.println("totPrice" + totPrice);
		
		int pointUse = Integer.parseInt(request.getParameter("pointUse"));
		System.out.println("pointUse" + pointUse);
		
		int paymentType = Integer.parseInt(request.getParameter("paymentType"));
		System.out.println("paymentType" + paymentType);
		
		int addPoint = Integer.parseInt(request.getParameter("addPoint"));
		System.out.println("addPoint" + addPoint);
		
		//-----------------------------------------------------------
		
		OrderVO ovo = new OrderVO();
		ovo.setId(id);
		ovo.setOrderAddr(orderAddr);
		ovo.setOrderName(orderName);
		ovo.setOrderPhone(orderPhone);
		ovo.setOrderRequest(orderRequest);
		ovo.setPaymentType(paymentType);
		ovo.setPointUse(pointUse);
		ovo.setTotPrice(totPrice);
		ovo.setAddPoint(addPoint);
		
		CartDAO.insertOrder(ovo);
		
		// 주문번호 받아오기
		int orderNum = CartDAO.selectOrderNum();
		
		//-----------------------------------------------------------
		//값 확인중~~
		
		List<OrderCkVO> list = (List<OrderCkVO>) session.getAttribute("plist");
		List<OrderPVO> orderplist = new ArrayList<>();
		
		for(OrderCkVO vo : list) {
			OrderPVO pvo = new OrderPVO();
			
			pvo.setOrderNum(orderNum);
		    pvo.setProductNum(vo.getProductNum());
		    pvo.setCount(vo.getCount());
		    pvo.setId(id);
		    orderplist.add(pvo);
		}
		
		System.out.println(orderplist.toString());
		
		for(OrderPVO vo : orderplist) {
			CartDAO.insertOrderP(vo);
		}
		
		 
		
		//3. 데이터를 응답할 페이지에 전달
		//request.setAttribute("list", list);
		
		//4. 페이지 전환 - 응답할 페이지(list.jsp)
		
		//return "/WEB-INF/cart/order_complete.jsp";
		
		
		
		java.io.PrintWriter out = response.getWriter();
		out.println("<html><form name='frm' action='completed.do' method='post'>");
		out.println("</form></html>");
		out.println("<script>frm.submit();</script>");
		out.close();

		
		
		
		return null;
	}

}









