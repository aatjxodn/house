package com.mystudy.house.model.command;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.house.model.dao.MyinquiryDAO;
import com.mystudy.house.model.dao.MypointDAO;
import com.mystudy.house.model.vo.MyinquiryVO;
import com.mystudy.house.model.vo.MyinquirycommentVO;
import com.mystudy.house.model.vo.MypointVO;

public class MypointCommand implements Command {
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//HttpSession session = request.getSession();
		//String id = (String) session.getAttribute("id");
		String id = "1";
		
		int myPoint = MypointDAO.getMyPoint(id);
		request.setAttribute("myPoint", myPoint);

		List<MypointVO> myPointList = MypointDAO.getMyPointList(id);
		request.setAttribute("myPointList", myPointList);
		
		
		return "/WEB-INF/myshopping/mypoint.jsp";
	}
}
