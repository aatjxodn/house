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
import com.mystudy.house.model.vo.ProductListVO;

public class PartnerInquiryCommand implements Command {
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		return "/WEB-INF/partnercenter/inquiry.jsp";
	}
	
}

