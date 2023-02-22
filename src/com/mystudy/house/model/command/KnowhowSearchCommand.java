package com.mystudy.house.model.command;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.house.model.dao.KnowhowDAO;
import com.mystudy.house.model.vo.KnowhowVO;

public class KnowhowSearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> menu = Arrays.asList("시공정보","수납","꾸미기팁","청소","DIY&리폼","이거어때","생활정보","건축&주택","상업공간","지식백과");
		request.setAttribute("menu", menu);
		
		String opt = request.getParameter("opt");
		String text = request.getParameter("text");
		
		List<KnowhowVO> list = null;
		switch(opt) {
		case "1":
			list = KnowhowDAO.searchKnowhowbySubject("%" + text + "%");
			break;
		case "2":
			list = KnowhowDAO.searchKnowhowbyContent("%" + text + "%");
			break;
		case "3":
			list = KnowhowDAO.searchKnowhowbyId(text);
			break;
		}
		
		request.setAttribute("text", text);
		request.setAttribute("opt", opt);
		request.setAttribute("list", list);
		
		return "/WEB-INF/community/knowhow/knowhowSearch.jsp";
	}

}
