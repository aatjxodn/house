package com.mystudy.house.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.house.model.vo.PiccommentVO;
import com.mystudy.house.model.vo.PiclikeVO;
import com.mystudy.house.model.vo.PicscrapVO;
import com.mystudy.house.model.vo.PictureVO;
import com.mystudy.house.mybatis.DBService;

public class PictureDAO {

	// 사진글 개수 조회
	public static int showPicture(String order, Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = 0;
		switch(order) {
		case "0": // 최신
			result = ss.selectOne("house.showPicture0", map);
			break;
		case "1": // 최근 인기
			result = ss.selectOne("house.showPicture1", map);
			break;
		case "2": // 역대 인기
			result = ss.selectOne("house.showPicture2", map);
			break;
		}
		
		ss.close();
		return result;
	}
	
	// 사진글 페이징 조회
	public static List<PictureVO> showPicturePaging(String order, Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<PictureVO> list = null;
		switch(order) {
		case "0": // 최신
			list = ss.selectList("house.showPicturePaging0", map);
			break;
		case "1": // 최근 인기
			list = ss.selectList("house.showPicturePaging1", map);
			break;
		case "2": // 역대 인기
			list = ss.selectList("house.showPicturePaging2", map);
			break;
		}
		
		ss.close();
		return list;
	}	
	
	// 사진글 상세 조회
	public static PictureVO showPictureDetail(String idx) {
		SqlSession ss = DBService.getFactory().openSession();
		PictureVO vo = ss.selectOne("house.showPictureDetail", idx);
		ss.close();
		return vo;
	}
	
	// 사진글 작성
	public static void writePicture(PictureVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("house.writePicture", vo);
		ss.close();
	}

	// 사진글 조회수 증가
	public static void addPictureViews(String idx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("house.addPictureViews", idx);
		ss.close();
	}	
	
	// 사진글 좋아요
	public static int likePicture(PiclikeVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		
		List<String> list = ss.selectList("house.confirmpiclike", vo);
		
		int result = 0;
		if(list.isEmpty()) {
			result = ss.insert("house.likePicture", vo);
		}
		ss.close();
		return result;
	}

	// 사진글 스크랩
	public static int scrapPicture(PicscrapVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		
		String scrapNum = ss.selectOne("house.confirmpicscrap", vo);
		
		int result = 0;
		if(scrapNum == null) {
			result = ss.insert("house.scrapPicture", vo);
		} else {
			ss.delete("house.deletePictureScrap", scrapNum);
		}
		ss.close();
		return result;
	}	
	
	// 사진글 삭제
	public static void deletePicture(String idx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("house.deletePicture", idx);
		ss.close();
	}
	
	// 사진글 댓글 조회
	public static List<PiccommentVO> showPictureComments(String idx) {
		SqlSession ss = DBService.getFactory().openSession();
		List<PiccommentVO> list = ss.selectList("house.showPictureComments", idx);
		ss.close();
		return list;
	}
	
	// 사진글 대댓글 조회
	public static List<PiccommentVO> showPictureReply(String idx) {
		SqlSession ss = DBService.getFactory().openSession();
		List<PiccommentVO> list = ss.selectList("house.showPictureReply", idx);
		ss.close();
		return list;
	}
	
	// 사진글 댓글 작성
	public static void writePictureComment(PiccommentVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("house.writePictureComment", vo);
		ss.close();
	}
	
	// 사진글 대댓글 작성
	public static void writePictureComment2(PiccommentVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("house.writePictureComment2", vo);
		ss.close();
	}	
	
	// 사진글 댓글 삭제
	public static void deletePictureComment(String comIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("house.deletePictureComment", comIdx);
		ss.close();
	}
	
	// 사진글 대댓글 삭제
	public static void deletePictureComment2(String comIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("house.deletePictureComment2", comIdx);
		ss.close();
	}
	
	// 사진글 수정
	public static int editPicture(PictureVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("house.editPicture", vo);
		ss.close();
		return result;
	}
	
	// 사진글 내용 검색
	public static List<PictureVO> searchPicturebyContent(String content) {
		SqlSession ss = DBService.getFactory().openSession();
		List<PictureVO> list = ss.selectList("house.searchPicturebyContent", content);
		ss.close();
		return list;		
	}

	// 사진글 작성자 검색
	public static List<PictureVO> searchPicturebyId(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		List<PictureVO> list = ss.selectList("house.searchPicturebyId", id);
		ss.close();
		return list;		
	}
	
}
