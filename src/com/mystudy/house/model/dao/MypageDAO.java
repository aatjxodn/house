package com.mystudy.house.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.house.model.vo.CategoryVO;
import com.mystudy.house.model.vo.KnowhowVO;
import com.mystudy.house.model.vo.KnowscrapVO;
import com.mystudy.house.model.vo.PicscrapVO;
import com.mystudy.house.model.vo.PictureVO;
import com.mystudy.house.model.vo.ProductImgVO;
import com.mystudy.house.model.vo.ProductVO;
import com.mystudy.house.model.vo.RequestVO;
import com.mystudy.house.model.vo.myscrapVO;
import com.mystudy.house.mybatis.DBService;

public class MypageDAO {

	
		// 아이디로 노하우 조회
		public static List<KnowhowVO> myKnowhow(String id) {
			SqlSession ss = DBService.getFactory().openSession();
			List<KnowhowVO> list = ss.selectList("house.myKnowhow", id);
			ss.close();
			return list;
		}
	
	
		// 아이디로 사진글 조회
		public static List<PictureVO> myPicture(String id) {
			SqlSession ss = DBService.getFactory().openSession();
			List<PictureVO> list = ss.selectList("house.myPicture", id);
			ss.close();
			return list;
		}
		
		// 아이디로 내가 쓴 질문 조회
		public static List<RequestVO> myRequest(String id) {
			SqlSession ss = DBService.getFactory().openSession();
			List<RequestVO> list = ss.selectList("house.myRequest", id);
			ss.close();
			return list;
		}
		
		// 아이디로 내가 쓴 답변  조회
		public static List<RequestVO> myAnswer(String id) {
			SqlSession ss = DBService.getFactory().openSession();
			List<RequestVO> list = ss.selectList("house.myAnswer", id);
			ss.close();
			return list;
		}
		
		// 아이디로 스크랩 전체 조회
		public static List<myscrapVO> myscrap(String id) {
			SqlSession ss = DBService.getFactory().openSession();
			List<myscrapVO> list = ss.selectList("house.myscrap", id);
			ss.close();
			return list;
		}
		
		// 아이디, 포스트타입으로 글 전체 조회
		public static List<myscrapVO> myscrapP(myscrapVO vo) {
			SqlSession ss = DBService.getFactory().openSession();
			List<myscrapVO> list = ss.selectList("house.myscrapP", vo);
			ss.close();
			return list;
		}

		
		
		
		
		
	
}
