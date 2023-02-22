package com.mystudy.house.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.house.model.vo.CartVO;
import com.mystudy.house.model.vo.CartviewVO;
import com.mystudy.house.model.vo.KnowhowVO;
import com.mystudy.house.model.vo.MembersVO;
import com.mystudy.house.model.vo.OrderCkVO;
import com.mystudy.house.model.vo.OrderPVO;
import com.mystudy.house.model.vo.OrderVO;
import com.mystudy.house.model.vo.ProductVO;
import com.mystudy.house.mybatis.DBService;

public class CartDAO {

	// 카트에 넣기
	public static int insertCart(CartVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("house.cartInsert", vo);
		ss.close();
		return result;
	}
	
	
	//아이디로 검색해서 장바구니 조회
	public static List<CartviewVO> cartView(String id){
		SqlSession ss = DBService.getFactory().openSession();
		List<CartviewVO> list = ss.selectList("house.cartView", id);
		ss.close();
		return list;
	}	
	
	// 카트 삭제
	public static void deleteCart(String productNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("house.deleteCart", productNum);
		ss.close();
	}
	
	
	// 수량 변경
	public static void changeCount(CartVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("house.changeCart", vo);
		ss.close();
	}
	
	
	//아이디로 검색해서 주문화면 조회
	public static List<OrderCkVO> OrderCK(String id){
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderCkVO> list = ss.selectList("house.orderView", id);
		ss.close();
		return list;
		}	
	
	
	// 주문번호 받아오기
	public static int selectOrderNum() {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.selectOne("house.selectOrderNum");
		ss.close();
		return result;
	}
	
	
	//주문상품 개별목록
	public static int insertOrderP(OrderPVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("house.orderpinsert", vo);
		ss.close();
		return result;
	}
	
	
	//주문완료 insert
	public static int insertOrder(OrderVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("house.orderInsert", vo);
		ss.close();
		return result;
	}
	
	
	
}
