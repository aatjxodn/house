package com.mystudy.house.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.house.model.dao.DAO;
import com.mystudy.house.model.vo.RequestVO;


@WebServlet("/search")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> SearchController.doGet()");
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		System.out.println("> keyword : -" + keyword + "-");
		
		//단순 페이지 전환인지 DB데이터 조회처리를 해야하는지 결정
		if (keyword == null || keyword.equals("")) {
			System.out.println("::: request.jsp 페이지로 이동");
			request.getRequestDispatcher("request.jsp").forward(request, response);
		} else { 
			//DB데이터 조회 후 결과 페이지로 이동
			System.out.println("::: DB데이터 조회 후 searchList.jsp 페이지로 이동");
			
			//1. DB데이터 조회
			List<RequestVO> search = DAO.getSearch(idx, keyword);
			
			//2. 뷰에서 사용할 수 있도록 데이터 저장
			request.setAttribute("search", search);
			
			//페이지 전환 : searchList.jsp 페이지로 이동
			request.getRequestDispatcher("request_search.jsp").forward(request, response);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> SearchController.doPost()");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
