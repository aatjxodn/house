package com.mystudy.house.model.command;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.house.model.dao.KnowhowDAO;
import com.mystudy.house.model.vo.KnowhowVO;

public class KnowhowEditCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		
		List<String> menu = Arrays.asList("시공정보","수납","꾸미기팁","청소","DIY&리폼","이거어때","생활정보","건축&주택","상업공간","지식백과");
		request.setAttribute("menu", menu);
		
		KnowhowVO vo = KnowhowDAO.showKnowhowDetail(idx);
		request.setAttribute("vo", vo);
		
		return "/WEB-INF/community/knowhow/knowhowEdit.jsp";
	}

}
