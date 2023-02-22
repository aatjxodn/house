package com.mystudy.house.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.house.model.dao.ProductDAO;
import com.mystudy.house.model.vo.CartviewVO;
import com.mystudy.house.model.vo.ProductVO;

public class PdetailCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. 사용할 파라미터 값 추출(확인)
		int productNum = Integer.parseInt(request.getParameter("productNum"));
		
		//2. DB연결하고 데이터 가져오기
		List<ProductVO> list = ProductDAO.pDetail(productNum);
		//3. 데이터를 응답할 페이지에 전달
		request.setAttribute("list", list);
		
		//4. 페이지 전환 - 응답할 페이지(detail.jsp)
		
		return "/WEB-INF/p_detail/detail.jsp";
	}

}









