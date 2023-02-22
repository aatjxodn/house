package com.mystudy.house.model.command;

import java.io.IOException;
import java.util.HashMap;
// import java.util.List;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.house.model.dao.KnowhowDAO;
import com.mystudy.house.model.dao.PictureDAO;
import com.mystudy.house.model.vo.KnowhowVO;
import com.mystudy.house.model.vo.PictureVO;

public class CommunityCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map<String, String> map = new HashMap<>();

		map.put("residence", "RESIDENCE");
		map.put("space", "SPACE");
		map.put("sizes", "SIZES");
		map.put("style", "STYLE");
		
		map.put("begin", "1");
		map.put("end", "3");
		List<PictureVO> picture1 = PictureDAO.showPicturePaging("1", map); // 사진 인기순 TOP 10
		
		map.put("begin", "4");
		map.put("end", "6");
		List<PictureVO> picture2 = PictureDAO.showPicturePaging("1", map); // 사진 인기순 TOP 10
		
		map.put("begin", "7");
		map.put("end", "9");
		List<PictureVO> picture3 = PictureDAO.showPicturePaging("1", map); // 사진 인기순 TOP 10
		request.setAttribute("picture1", picture1);
		request.setAttribute("picture2", picture2);
		request.setAttribute("picture3", picture3);
		
		List<KnowhowVO> knowhow1 = KnowhowDAO.showAllKnowhow("1", 1, 3); // 노하우 인기순 TOP 10
		List<KnowhowVO> knowhow2 = KnowhowDAO.showAllKnowhow("1", 4, 6); // 노하우 인기순 TOP 10
		List<KnowhowVO> knowhow3 = KnowhowDAO.showAllKnowhow("1", 7, 9); // 노하우 인기순 TOP 10
		request.setAttribute("knowhow1", knowhow1);
		request.setAttribute("knowhow2", knowhow2);
		request.setAttribute("knowhow3", knowhow3);
		
		return "/WEB-INF/community/community.jsp";
	}

}
