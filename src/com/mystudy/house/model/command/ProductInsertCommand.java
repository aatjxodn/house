package com.mystudy.house.model.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.PartnercenterDAO;
import com.mystudy.house.model.vo.CategoryDetailVO;
import com.mystudy.house.model.vo.ProductInsertImgVO;
import com.mystudy.house.model.vo.ProductInsertVO;

public class ProductInsertCommand implements Command {
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		int categoryNum = Integer.parseInt(request.getParameter("categoryNum"));
		int partnerNum = PartnercenterDAO.getPartnerNum(id);
		String productName = request.getParameter("productName");
		int productPrice = Integer.parseInt(request.getParameter("productPrice"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		String categoryDetail = request.getParameter("categoryDetail");
		
		ProductInsertVO vo = new ProductInsertVO(categoryNum, partnerNum, productName, productPrice, stock, 
												categoryDetail);
		
		PartnercenterDAO.insertProduct(vo);
		int productNum = PartnercenterDAO.getProductNum(productName);
		System.out.println("productNum: " + productNum);
		String result = makeJson(productNum);
		
		return result;
	}

	private String makeJson(int productNum) {
		StringBuilder result = new StringBuilder();
		result.append("{ \"productNum\" : " + productNum + "}");
		return result.toString();
	}
}

