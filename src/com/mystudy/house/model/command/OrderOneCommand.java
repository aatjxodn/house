package com.mystudy.house.model.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.house.model.dao.CartDAO;
import com.mystudy.house.model.dao.MypageDAO;
import com.mystudy.house.model.dao.ProductDAO;
import com.mystudy.house.model.vo.CartviewVO;
import com.mystudy.house.model.vo.MembersVO;
import com.mystudy.house.model.vo.OrderCkVO;
import com.mystudy.house.model.vo.ProductVO;
import com.mystudy.house.model.vo.myscrapVO;
import com.mystudy.house.mybatis.DBService;

public class OrderOneCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//1. 사용할 파라미터 값 추출(확인)
		String id = (String) session.getAttribute("id");
		int count = Integer.parseInt(request.getParameter("count"));
		String imagefile = request.getParameter("imagefile");
		int productNum = Integer.parseInt(request.getParameter("productNum"));
		int productPrice = Integer.parseInt(request.getParameter("productPrice"));
		int shipping = Integer.parseInt(request.getParameter("shipping"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		String productName = request.getParameter("productName");
		String companyName = request.getParameter("companyName");
		
		
		//2. DB연결하고 데이터 가져오기
		SqlSession ss = DBService.getFactory().openSession();
		MembersVO user = ss.selectOne("house.showInfo", id);
		ss.close();
		
		
		OrderCkVO vo = new OrderCkVO();
		vo.setCartNum(0);
		vo.setAddr(user.getAddr());
		vo.setAddrDetail(user.getAddrDetail());
		vo.setEmail(user.getEmail());
		vo.setCompanyName(id);
		vo.setCount(count);
		vo.setId(id);
		vo.setImagefile(imagefile);
		vo.setName(user.getName());
		vo.setPhone(user.getPhone());
		vo.setPoint(Integer.parseInt(user.getPoint()));
		vo.setProductName(productName);
		vo.setProductNum(productNum);
		vo.setProductPrice(productPrice);
		vo.setShipping(shipping);
		vo.setStock(stock);
		vo.setTotp(count*productPrice);
		vo.setCompanyName(companyName);
		
		List<OrderCkVO> list = new ArrayList<OrderCkVO>();
		list.add(vo);
		System.out.println(list);
		
		//3. 데이터를 응답할 페이지에 전달
		request.setAttribute("list", list);
		
		//4. 페이지 전환 - 응답할 페이지(list.jsp)
		
		return "/WEB-INF/cart/order.jsp";
		
	}

}









