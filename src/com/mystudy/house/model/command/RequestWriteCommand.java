package com.mystudy.house.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RequestWriteCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		
		if(id == null) {
			return "/WEB-INF/member/login.jsp";
		} else {
			return "request_write.jsp";
		}		
	}

}
