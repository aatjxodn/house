package com.mystudy.house.model.command;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.house.model.dao.PictureDAO;
import com.mystudy.house.model.vo.PictureVO;

public class PictureSearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> residenceMenu = Arrays.asList("원룸오피스텔", "아파트", "빌라연립", "단독주택", "사무공간", "상업공간", "기타");
		request.setAttribute("residenceMenu", residenceMenu);
		
		List<String> spaceMenu = Arrays.asList("원룸", "거실", "침실", "주방", "욕실", "아이방", "서재작업실", "베란다", "사무공간", "상업공간",
				"가구소품", "현관", "외관기타");
		request.setAttribute("spaceMenu", spaceMenu);

		List<String> sizesMenu = Arrays.asList("10평 미만", "10평대", "20평대", "30평대", "40평대", "50평 이상");
		request.setAttribute("sizesMenu", sizesMenu);

		List<String> styleMenu = Arrays.asList("모던", "북유럽", "빈티지", "내추럴", "프로방스로맨틱", "클래식앤틱", "한국아시아", "유니크");
		request.setAttribute("styleMenu", styleMenu);
		
		String opt = request.getParameter("opt");
		String text = request.getParameter("text");
		
		List<PictureVO> list = null;
		switch(opt) {
		case "1":
			list = PictureDAO.searchPicturebyContent("%" + text + "%");
			break;
		case "2":
			list = PictureDAO.searchPicturebyId(text);
			break;
		}
	
		request.setAttribute("text", text);
		request.setAttribute("opt", opt);
		request.setAttribute("list", list);
		
		return "/WEB-INF/community/picture/pictureSearch.jsp";
	}

}
