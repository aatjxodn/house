package com.mystudy.house.model.command;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.house.model.dao.PictureDAO;
import com.mystudy.house.model.vo.PiccommentVO;
import com.mystudy.house.model.vo.PictureVO;

public class PictureDetailCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idx = request.getParameter("idx");
		request.setAttribute("idx", idx);

		List<String> residenceMenu = Arrays.asList("원룸오피스텔", "아파트", "빌라연립", "단독주택", "사무공간", "상업공간", "기타");
		request.setAttribute("residenceMenu", residenceMenu);

		List<String> spaceMenu = Arrays.asList("원룸", "거실", "침실", "주방", "욕실", "아이방", "서재작업실", "베란다", "사무공간", "상업공간",
				"가구소품", "현관", "외관기타");
		request.setAttribute("spaceMenu", spaceMenu);

		List<String> sizesMenu = Arrays.asList("10평 미만", "10평대", "20평대", "30평대", "40평대", "50평 이상");
		request.setAttribute("sizesMenu", sizesMenu);

		List<String> styleMenu = Arrays.asList("모던", "북유럽", "빈티지", "내추럴", "프로방스로맨틱", "클래식앤틱", "한국아시아", "유니크");
		request.setAttribute("styleMenu", styleMenu);

		// 조회수 증가
		PictureDAO.addPictureViews(idx);
		
		PictureVO vo = PictureDAO.showPictureDetail(idx);
		request.setAttribute("vo", vo);

		// 댓글 가져오기
		List<PiccommentVO> list = PictureDAO.showPictureComments(idx);
		request.setAttribute("list", list);
		
		// 대댓글 가져오기
		List<PiccommentVO> list2 = PictureDAO.showPictureReply(idx);
		request.setAttribute("list2", list2);

		return "/WEB-INF/community/picture/pictureDetail.jsp";
	}

}
