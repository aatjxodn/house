package com.mystudy.house.model.command;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.house.common.PagingCommunity;
import com.mystudy.house.model.dao.PictureDAO;
import com.mystudy.house.model.vo.PictureVO;

public class PictureCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> residenceMenu = Arrays.asList("원룸오피스텔", "아파트", "빌라연립", "단독주택", "사무공간", "상업공간", "기타");
		request.setAttribute("residenceMenu", residenceMenu);
		
		List<String> orderMenu = Arrays.asList("최신순", "최근 인기순", "역대 인기순");
		request.setAttribute("orderMenu", orderMenu);
		
		List<String> spaceMenu = Arrays.asList("원룸", "거실", "침실", "주방", "욕실", "아이방", "서재작업실", "베란다", "사무공간", "상업공간",
				"가구소품", "현관", "외관기타");
		request.setAttribute("spaceMenu", spaceMenu);

		List<String> sizesMenu = Arrays.asList("10평 미만", "10평대", "20평대", "30평대", "40평대", "50평 이상");
		request.setAttribute("sizesMenu", sizesMenu);

		List<String> styleMenu = Arrays.asList("모던", "북유럽", "빈티지", "내추럴", "프로방스로맨틱", "클래식앤틱", "한국아시아", "유니크");
		request.setAttribute("styleMenu", styleMenu);
		
		String order = request.getParameter("order");
		
		if(order == null) {
			order = "0";
		}
		
		String residence = request.getParameter("residence");
		String space = request.getParameter("space");
		String sizes = request.getParameter("sizes");
		String style = request.getParameter("style");

		Map<String, String> map = new HashMap<>();
		
		if(residence == null) {
			map.put("residence", "RESIDENCE");
		} else {
			map.put("residence", residence);
		}
		if(space == null) {
			map.put("space", "SPACE");
		} else {
			map.put("space", space);
		}
		if(sizes == null) {
			map.put("sizes", "SIZES");
		} else {
			map.put("sizes", sizes);
		}
		if(style == null) {
			map.put("style", "STYLE");
		} else {
			map.put("style", style);
		}

		int result = PictureDAO.showPicture(order, map);
		
		// 페이징 처리
		PagingCommunity p = new PagingCommunity();

		// 1. 전체 게시물 수량 구하기
		p.setTotalRecord(result);	
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

		map.put("begin", Integer.toString(p.getBegin()));
		map.put("end", Integer.toString(p.getEnd()));
		
		List<PictureVO> list = PictureDAO.showPicturePaging(order, map);

		request.setAttribute("list", list);
		request.setAttribute("order", order);
		request.setAttribute("residence", residence);
		request.setAttribute("space", space);
		request.setAttribute("sizes", sizes);
		request.setAttribute("style", style);	
		request.setAttribute("pvo", p);

		return "/WEB-INF/community/picture/picture.jsp";
	}

}
