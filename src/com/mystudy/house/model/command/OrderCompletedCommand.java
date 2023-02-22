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

public class OrderCompletedCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		return "/WEB-INF/cart/order_complete.jsp";
	}

}









