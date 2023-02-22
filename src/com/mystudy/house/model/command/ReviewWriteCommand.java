package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.DAO;
import com.mystudy.house.model.vo.ReviewsVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewWriteCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		String orderNum = request.getParameter("orderNum");

		String path = "C:/Users/itwill/Downloads/house/WebContent/requestImage";
		
		MultipartRequest mr = new MultipartRequest(
		request, path, (10 * 1024 * 1024),
		"UTF-8", new DefaultFileRenamePolicy());

		ReviewsVO vo = new ReviewsVO();
		
		vo.setIdx(mr.getParameter("idx"));
		vo.setOrderNum(orderNum);
		vo.setStar(mr.getParameter("star"));
		vo.setComments(mr.getParameter("comments"));
		vo.setId(id);
		
		
		
		if (mr.getFile("fileName") != null) {
			vo.setFileName(mr.getFilesystemName("fileName"));
			vo.setOriName(mr.getOriginalFileName("fimename"));
		} else {
			vo.setFileName("");
			vo.setOriName("");
		}
		
		System.out.println(vo);

		DAO.insert_reviews(vo);
		
		response.sendRedirect("review_product_inquiry.jsp");
		
		
		return null;
	}

}
