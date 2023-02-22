package com.mystudy.house.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.house.model.vo.CategoryVO;
import com.mystudy.house.model.vo.ProductImgVO;
import com.mystudy.house.model.vo.ProductVO;
import com.mystudy.house.mybatis.DBService;

public class ProductDAO {

		//전체 카테고리 목록 조회
		public static List<CategoryVO> getList(){
			SqlSession ss = DBService.getFactory().openSession();
			List<CategoryVO> list = ss.selectList("house.selectCategory");
			ss.close();
			return list;
		}
		
		
		//카테고리 첫화면(상품전체조회)
		public static List<ProductVO> cateAllList(){
			SqlSession ss = DBService.getFactory().openSession();
			List<ProductVO> list = ss.selectList("house.cateAllList");
			ss.close();
			return list;
		}
	
		//상품 카드 조회
		public static List<ProductVO> cardList(){
			SqlSession ss = DBService.getFactory().openSession();
			List<ProductVO> list = ss.selectList("house.selectCard");
			ss.close();
			return list;
		}
		
		
		//실시간 베스트 상품 조회
		public static List<ProductVO> todaybestList(){
			SqlSession ss = DBService.getFactory().openSession();
			List<ProductVO> list = ss.selectList("house.tbestCard");
			ss.close();
			return list;
		}
		
		//베스트 상품 조회
		public static List<ProductVO> mostbestList(){
			SqlSession ss = DBService.getFactory().openSession();
			List<ProductVO> list = ss.selectList("house.mbestCard");
			ss.close();
			return list;
		}
		
		//낮은 가격순 조회
		public static List<ProductVO> rowprice(){
			SqlSession ss = DBService.getFactory().openSession();
			List<ProductVO> list = ss.selectList("hosue.rowprice");
			ss.close();
			return list;
		}
		
		//높은 가격순 조회
		public static List<ProductVO> highprice(){
			SqlSession ss = DBService.getFactory().openSession();
			List<ProductVO> list = ss.selectList("house.highprice");
			ss.close();
			return list;
		}
		
		
		//상품 번호로 검색해서 상세페이지 조회
		public static List<ProductVO> pDetail(int productNum){
			SqlSession ss = DBService.getFactory().openSession();
			List<ProductVO> list = ss.selectList("house.pDetail", productNum);
			ss.close();
			return list;
		}	
		
		//카테고리번호로 상품 조회
		public static List<ProductVO> cateList(int categoryNum){
			SqlSession ss = DBService.getFactory().openSession();
			List<ProductVO> list = ss.selectList("house.cateList", categoryNum);
			ss.close();
			return list;
		}		
		
		//상세 카테고리번호로 상품 조회
		public static List<ProductVO> cateDtList(int categoryNum, String categoryDetail){
			SqlSession ss = DBService.getFactory().openSession();
			List<ProductVO> list = ss.selectList("house.cateDtList", categoryDetail);
			ss.close();
			return list;
		}		
		
		
	
}
