package com.mystudy.house.model.dao;

import org.apache.ibatis.session.SqlSession;
import com.mystudy.house.model.vo.MembersVO;
import com.mystudy.house.mybatis.DBService;

public class MembersDAO {
	
	// 로그인
	public static MembersVO login(MembersVO vo) {
		SqlSession ss = DBService.getFactory().openSession();
		MembersVO user = ss.selectOne("house.login", vo);
		ss.close();
		return user;
	}
	
	// 아이디 찾기
	public static String findId(MembersVO vo) {
		SqlSession ss = DBService.getFactory().openSession();
		String id = ss.selectOne("house.findId", vo);
		ss.close();
		return id;
	}
	
	// 회원정보 조회
	public static MembersVO showInfo(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		MembersVO user = ss.selectOne("house.showInfo", id);
		ss.close();
		return user;
	}
	
	// 회원정보 수정
	public static void editInfo(MembersVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("house.editInfo", vo);
		ss.close();
	}
	
	// 프로필 이미지 변경
	public static void changeProfileImg(MembersVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("house.changeProfileImg", vo);
		ss.close();		
	}
	
	// 비밀번호 변경
	public static void changepw(MembersVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("house.changepw", vo);
		ss.close();
	}
	
	// 회원가입
	public static void signup(MembersVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("house.signup", vo);
		ss.close();
	}
	
	// 회원 탈퇴
	public static int withdraw(String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("house.withdraw", id);
		ss.close();
		return result;
	}
	
}
