package com.mystudy.house.model.command;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.house.common.PagingCommunity;
import com.mystudy.house.model.dao.KnowhowDAO;
import com.mystudy.house.model.vo.KnowhowVO;

public class KnowhowCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		request.setAttribute("category", category);
		
		String order = request.getParameter("order");
		if(order == null) {
			order = "3";
		}
		request.setAttribute("order", order);
		
		List<String> menu = Arrays.asList("시공정보","수납","꾸미기팁","청소","DIY&리폼","이거어때","생활정보","건축&주택","상업공간","지식백과");
		request.setAttribute("menu", menu);

		// 페이징 처리
		PagingCommunity p = new PagingCommunity();

		// 1. 전체 게시물 수량 구하기
		if(category == null || "".equals(category)) {
			p.setTotalRecord(KnowhowDAO.getTotalKnowhowCount());		
		} else {
			p.setTotalRecord(KnowhowDAO.getTotalKnowhowCountbyCategory(category));
		}
		p.setTotalPage();
		
		// 2. 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		// 3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		// 3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		
		// 4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getNumPerBlock() - 1);
		
		// 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		// 끝페이지를 전체페이지 수로 변경 처리
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		List<KnowhowVO> list = null;
		if(category == null || "".equals(category)) {
			list = KnowhowDAO.showAllKnowhow(order, p.getBegin(), p.getEnd());
		} else {
			list = KnowhowDAO.showKnowhow(category, order, p.getBegin(), p.getEnd());
		}
		
		request.setAttribute("list", list);
		request.setAttribute("pvo", p);
		
		return "/WEB-INF/community/knowhow/knowhow.jsp";
	}

}
