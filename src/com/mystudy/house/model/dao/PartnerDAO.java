package com.mystudy.house.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.house.model.vo.PartnerVO;
import com.mystudy.house.mybatis.DBService;

public class PartnerDAO {
	// 판매자 신청
	public static int registerPartner(PartnerVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("house.registerPartner", vo);
		ss.close();
		return result;
	}
}
