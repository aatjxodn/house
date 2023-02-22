package com.mystudy.house.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.MypageDAO;
import com.mystudy.house.model.dao.ProductDAO;
import com.mystudy.house.model.vo.CartviewVO;
import com.mystudy.house.model.vo.ProductVO;
import com.mystudy.house.model.vo.RequestVO;

public class MyAnswerCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//1. 사용할 파라미터 값 추출(확인)
		String id = (String) session.getAttribute("id");
		
		//2. DB연결하고 데이터 가져오기
		List<RequestVO> list = MypageDAO.myAnswer(id);
		
		//3. 데이터를 응답할 페이지에 전달
		request.setAttribute("list", list);
		
		//4. 페이지 전환 - 응답할 페이지(answer.jsp)
		return "/WEB-INF/mypage/answer.jsp";
	}

}









