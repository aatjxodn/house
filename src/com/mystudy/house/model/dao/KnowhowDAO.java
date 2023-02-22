package com.mystudy.house.model.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.house.model.vo.KnowcommentVO;
import com.mystudy.house.model.vo.KnowhowVO;
import com.mystudy.house.model.vo.KnowlikeVO;
import com.mystudy.house.model.vo.KnowscrapVO;
import com.mystudy.house.mybatis.DBService;

public class KnowhowDAO {
	
	// 전체 게시글 개수 구하기
	public static int getTotalKnowhowCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int cnt = ss.selectOne("house.getTotalKnowhowCount");
		ss.close();
		return cnt;
	}
	
	// 카테고리별 전체 게시글 개수 구하기
	public static int getTotalKnowhowCountbyCategory(String category) {
		SqlSession ss = DBService.getFactory().openSession();
		int cnt = ss.selectOne("house.getTotalKnowhowCountbyCategory", category);
		ss.close();
		return cnt;
	}
	
	// 노하우 전체 조회
	public static List<KnowhowVO> showAllKnowhow(String order, int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<KnowhowVO> list = null;
		switch(order) {
		case "1": // 최근인기순
			list = ss.selectList("house.showAllKnowhow1", map);
			break;
		case "2": // 역대인기순
			list = ss.selectList("house.showAllKnowhow2", map);
			break;
		case "3": // 최신순
			list = ss.selectList("house.showAllKnowhow3", map);
			break;
		case "4": // 과거순
			list = ss.selectList("house.showAllKnowhow4", map);
			break;
		}
		ss.close();
		return list;
	}
	
	// 카테고리별 노하우 조회
	public static List<KnowhowVO> showKnowhow(String category, String order, int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("category", Integer.parseInt(category));
		
		SqlSession ss = DBService.getFactory().openSession();
		List<KnowhowVO> list = null;
		switch(order) {
		case "1": // 최근인기순
			list = ss.selectList("house.showKnowhow1", map);
			break;
		case "2": // 역대인기순
			list = ss.selectList("house.showKnowhow2", map);
			break;
		case "3": // 최신순
			list = ss.selectList("house.showKnowhow3", map);
			break;
		case "4": // 과거순
			list = ss.selectList("house.showKnowhow4", map);
			break;
		}
		ss.close();
		return list;
	}
	
	// 노하우 작성
	public static int writeKnowhow(KnowhowVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("house.writeKnowhow", vo);
		ss.close();
		return result;
	}
	
	// 노하우 수정
	public static int editKnowhow(KnowhowVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("house.editKnowhow", vo);
		ss.close();
		return result;
	}	
	
	// 노하우 상세 조회
	public static KnowhowVO showKnowhowDetail(String idx) {
		SqlSession ss = DBService.getFactory().openSession();
		KnowhowVO vo = ss.selectOne("house.showKnowhowDetail", idx);
		ss.close();
		return vo;
	}
	
	// 노하우 조회수 증가
	public static void addKnowhowViews(String idx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("house.addKnowhowViews", idx);
		ss.close();
	}	
	
	// 노하우 좋아요
	public static int likeKnowhow(KnowlikeVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		
		List<String> list = ss.selectList("house.confirmknowlike", vo);
		
		int result = 0;
		if(list.isEmpty()) {
			result = ss.insert("house.likeKnowhow", vo);
		}
		ss.close();
		return result;
	}

	// 노하우 스크랩
	public static int scrapKnowhow(KnowscrapVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		
		String scrapNum = ss.selectOne("house.confirmknowscrap", vo);
		
		int result = 0;
		if(scrapNum == null) {
			result = ss.insert("house.scrapKnowhow", vo);
		} else {
			ss.delete("house.deleteKnowhowScrap", scrapNum);
		}
		ss.close();
		return result;
	}
	
	// 노하우 삭제
	public static void deleteKnowhow(String idx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("house.deleteKnowhow", idx);
		ss.close();
	}
	
	// 노하우 댓글 조회
	public static List<KnowcommentVO> showKnowhowComments(String idx) {
		SqlSession ss = DBService.getFactory().openSession();
		List<KnowcommentVO> list = ss.selectList("house.showKnowhowComments", idx);
		ss.close();
		return list;
	}
	
	// 노하우 대댓글 조회
	public static List<KnowcommentVO> showKnowhowReply(String idx) {
		SqlSession ss = DBService.getFactory().openSession();
		List<KnowcommentVO> list = ss.selectList("house.showKnowhowReply", idx);
		ss.close();
		return list;
	}
	
	// 노하우 댓글 작성
	public static void writeKnowhowComment(KnowcommentVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("house.writeKnowhowComment", vo);
		ss.close();
	}
	
	// 노하우 대댓글 작성
	public static void writeKnowhowComment2(KnowcommentVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("house.writeKnowhowComment2", vo);
		ss.close();
	}
	
	// 노하우 댓글 삭제
	public static void deleteKnowhowComment(String comIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("house.deleteKnowhowComment", comIdx);
		ss.close();
	}
	
	
	// 노하우 대댓글 삭제
	public static void deleteKnowhowComment2(String comIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("house.deleteKnowhowComment2", comIdx);
		ss.close();
	}
	
	// 노하우 제목 검색
	public static List<KnowhowVO> searchKnowhowbySubject(String subject) {
		SqlSession ss = DBService.getFactory().openSession();
		List<KnowhowVO> list = ss.selectList("house.searchKnowhowbySubject", subject);
		ss.close();
		return list;
	}
	
	// 노하우 내용 검색
	public static List<KnowhowVO> searchKnowhowbyContent(String content) {
		SqlSession ss = DBService.getFactory().openSession();
		List<KnowhowVO> list = ss.selectList("house.searchKnowhowbyContent", content);
		ss.close();
		return list;
	}
	
	// 노하우 작성자 검색
	public static List<KnowhowVO> searchKnowhowbyId(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		List<KnowhowVO> list = ss.selectList("house.searchKnowhowbyId", id);
		ss.close();
		return list;
	}

}
