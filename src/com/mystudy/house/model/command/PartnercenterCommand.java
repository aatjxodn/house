package com.mystudy.house.model.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.PartnercenterDAO;
import com.mystudy.house.model.vo.CategoryVO;

public class PartnercenterCommand implements Command {
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		
		int partnerGrade = PartnercenterDAO.getPartnerGrade(id);
		if (partnerGrade == 3) {
			List<CategoryVO> categoryList = PartnercenterDAO.getCategory();
			request.setAttribute("categoryList", categoryList);
			
			return "/WEB-INF/partnercenter/partnercenter.jsp";
		} else {
			// 파트너 신청 페이지
			return null;
		}
	}
	
}

