package com.mystudy.house.model.dao;

import java.sql.PreparedStatement;import java.util.HashMap;import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.house.model.vo.RequestVO;
import com.mystudy.house.model.vo.Request_comVO;
import com.mystudy.house.model.vo.ReviewsVO;
import com.mystudy.house.mybatis.DBService;
import com.mystudy.house.model.vo.GogakVO;
import com.mystudy.house.model.vo.Gogak_CommentVO;
import com.mystudy.house.model.vo.HouseVO;
import com.mystudy.house.model.vo.KnowlikeVO;
import com.mystudy.house.model.vo.ProductInquiryVO;
import com.mystudy.house.model.vo.RequestLikeVO;

public class DAO {
	
	// orderNum 받아오기
	public static String findOrderNum(String productNum, String id) {
		Map<String, String> map = new HashMap<>();
		map.put("productNum", productNum);
		map.put("id", id);
		SqlSession ss = DBService.getFactory().openSession();
		List<String> arr = ss.selectList("house.findOrderNum", map);
		String orderNum = null;
		if(!arr.isEmpty()) {
			orderNum = arr.get(0);
		}
		ss.close();
		return orderNum;
	}
	
	//게시글 입력
	// 수정, 삭제, 추가는 오픈세션 true << 자동 커밋 해주는 것이 좋음
	public static int insert_inquiry(HouseVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("house.insert_inquiry", vo);
		ss.close();
		return result;
	}
	
	//페이지에 해당하는 글목록(게시글) 가져오기(조회) REQUEST
	public static List<RequestVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<RequestVO> list = ss.selectList("house.list", map);
		ss.close();
		return list;
	}
	
	// request 게시글 입력
	public static int insert_request(RequestVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("house.insert_request", vo);
		ss.close();
		return result;
		
	}
	
	public static List<RequestVO> getList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<RequestVO> list = ss.selectList("house.list", map);
		ss.close();
		return list;
	}
	
	//게시글(REQUEST)에 전체 건수 조회
		public static int getTotalCount() {
			SqlSession ss = DBService.getFactory().openSession();
			int totalCount = ss.selectOne("house.totalCount");
			ss.close();
			
			return totalCount;
		}
		
	// request 수정
	public static int update_request(RequestVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("house.update_request", vo);
		ss.close();
		return result;
	}
	
	// request 삭제
		public static int delete_request(RequestVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.delete("house.delete_request", vo);
			ss.close();
			return result;
		}
		
	// request_comment 입력
		// request 게시글 입력
		public static int Request_comment_insert(Request_comVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("house.Request_comment_insert", vo);
			ss.close();
			return result;	
		}
		
		// request 삭제
		public static int delete_request_comment(Request_comVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.delete("house.delete_request_comment", vo);
			ss.close();
			return result;
		}
		
			
		// REQUEST 조회수 증가
		public static void REQUESTVIEWS(String requestIdx) {
			SqlSession ss = DBService.getFactory().openSession(true);
			ss.update("house.REQUESTVIEWS", requestIdx);
			ss.close();
		}	

		
		
		// request 좋아요
		public static int likeRequest(RequestLikeVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			
			List<String> list = ss.selectList("house.confirmRequestlike", vo);
			
			int result = 0;
			if(list.isEmpty()) {
				result = ss.insert("house.likeRequest", vo);
			}
			ss.close();
			return result;
		}
		
	
	
		
		
		
		// 검색

		public static List<RequestVO> getSearch(String idx, String keyword) {
			Map<String, String> map = new HashMap<>();
			map.put("idx", idx); 
			map.put("keyword", keyword); 
			
			SqlSession ss = DBService.getFactory().openSession();
			List<RequestVO> list = ss.selectList("house.search", map);
			ss.close();
			return list;
		}
		
	//------------------------------------------------------------------------------------------
	
	//페이지에 해당하는 글목록(게시글) 가져오기(조회) REVIEWS
	public static List<ReviewsVO> getList2(int begin, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewsVO> list = ss.selectList("house.list2", map);
		ss.close();
		return list;
		
	}
	
	
	public static List<ReviewsVO> getList2(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewsVO> list = ss.selectList("house.list2", map);
		ss.close();
		return list;
	}
	
	//게시글(REVIEWS)에 전체 건수 조회
		public static int getTotalCount2() {
			SqlSession ss = DBService.getFactory().openSession();
			int totalCount = ss.selectOne("house.totalCount2");
			ss.close();
			
			return totalCount;
		}
		
	// 리뷰 별점 평균 구하기
		public static int avg1() {
			SqlSession ss = DBService.getFactory().openSession();
			int avg = ss.selectOne("house.avg1");
			ss.close();
			return avg;
		}	

		//게시글 입력
		// 수정, 삭제, 추가는 오픈세션 true << 자동 커밋 해주는 것이 좋음
		public static int insert_reviews(ReviewsVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("house.insert_reviews", vo);
			ss.close();
			return result;
		}
		
		public static int reviews_delete(ReviewsVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.delete("house.reviews_delete", vo);
			ss.close();
			return result;
		}
		
		public static int reviews_update(ReviewsVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.update("house.reviews_update", vo);
			ss.close();
			return result;
		}
		
		
		
		
		
		
		//====================================================================================================REVIEWS 끝
		
		
		//페이지에 해당하는 글목록(게시글) 가져오기(조회) ProductInquiry
		public static List<ProductInquiryVO> getList3(int begin, int end) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("begin", begin);
			map.put("end", end);
			
			SqlSession ss = DBService.getFactory().openSession();
			List<ProductInquiryVO> list = ss.selectList("house.list3", map);
			ss.close();
			return list;
			
		}
		
		public static List<ProductInquiryVO> getList3(Map<String, Integer> map) {
			SqlSession ss = DBService.getFactory().openSession();
			List<ProductInquiryVO> list = ss.selectList("house.list3", map);
			ss.close();
			return list;
		}
		
		//게시글(ProductInquiry)에 전체 건수 조회
			public static int getTotalCount3() {
				SqlSession ss = DBService.getFactory().openSession();
				int totalCount = ss.selectOne("house.totalCount3");
				ss.close();
				
				return totalCount;
			}
	
			
			//게시글 입력
			// 수정, 삭제, 추가는 오픈세션 true << 자동 커밋 해주는 것이 좋음
			public static int insert_productInquiry(ProductInquiryVO vo) {
				SqlSession ss = DBService.getFactory().openSession(true);
				int result = ss.insert("house.insert_productInquiry", vo);
				ss.close();
				return result;
			}
			
			
			// 게시글 삭제
			public static int product_inquiry_delete(ProductInquiryVO vo) {
				SqlSession ss = DBService.getFactory().openSession(true);
				int result = ss.delete("house.product_inquiry_delete", vo);
				ss.close();
				return result;
			}
			
			// 게시글 수정
			public static int product_inquiry_upadte(ProductInquiryVO vo) {
				SqlSession ss = DBService.getFactory().openSession(true);
				int result = ss.update("house.product_inquiry_upadte", vo);
				ss.close();
				return result;
			}
			
			
		
//=====================================================================================================================
	
	
	
	//게시글 1개 조회(검색)
		public static RequestVO selectOne(int requestIdx) {
			SqlSession ss = DBService.getFactory().openSession();
			RequestVO vo = ss.selectOne("house.one", requestIdx);
			ss.close();
			return vo;
		}
		
	//============== 댓글 관련 ============
	public static List<Request_comVO> getCommList(int requestIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<Request_comVO> list = ss.selectList("house.commList", requestIdx);
		ss.close();
		return list;
	}
	
	// 고객
	public static List<GogakVO> gogakInfo(String gogak) {
		SqlSession ss = DBService.getFactory().openSession();
		List<GogakVO> list = ss.selectList("house.list4", gogak);
		ss.close();
		return list;
	}
	
	// 고객
	public static List<Gogak_CommentVO> gogak_commInfo(String gogak) {
		SqlSession ss = DBService.getFactory().openSession();
		List<Gogak_CommentVO> list = ss.selectList("house.list5", gogak);
		ss.close();
		return list;
	}
	
	
	// REQUEST 좋아요 증가
		public static int requestLikeCnt(String requestIdx) {
			SqlSession ss = DBService.getFactory().openSession();
			int cnt = ss.selectOne("house.requestLikeCnt", requestIdx);
			ss.close();
			return cnt;
		}
		
}
















