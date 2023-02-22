//package com.mystudy.house.model.command;
//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.mystudy.house.model.dao.DAO;
//import com.mystudy.house.model.vo.ReviewsVO;
//
//public class ReviewDeleteCommand implements Command{
//
//	@Override
//	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		
//		ReviewsVO vo = new ReviewsVO();
//		
//		vo.setIdx(request.getParameter("idx"));
//		
//		DAO.reviews_delete(vo);
//		
//		response.sendRedirect("review_product_inquiry.jsp");
//		
//		return null;
//	}
//
//}
