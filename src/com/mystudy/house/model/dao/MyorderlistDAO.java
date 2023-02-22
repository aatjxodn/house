package com.mystudy.house.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.house.mybatis.DBService;
import com.mystudy.house.model.vo.MyidperiodVO;
import com.mystudy.house.model.vo.MyorderlistVO;

public class MyorderlistDAO {
	
	// 주문 목록 조회
	public static List<MyorderlistVO> getoOrderList(MyidperiodVO vo) {
		SqlSession ss = DBService.getFactory().openSession();
		List<MyorderlistVO> orderList = ss.selectList("house.orderList", vo);
		ss.close();
		return orderList;
	}
	
}








