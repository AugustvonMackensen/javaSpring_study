package com.test.first.member.model.service;

import java.util.ArrayList;

import com.test.first.common.SearchDate;
import com.test.first.member.model.vo.Member;

//스프링에서는 모델의 service는 반드시 interface 로 만들도록 되어있음
//서비스 인터페이스를 상속받는 후손클래스를 만들어서
//추상메소드를 오버라이딩하는 방식으로 구현하도록 되어있음
public interface MemberService {
	Member selectLogin(Member member);
	Member selectMember(String userid);
	int selectDupCheckId(String userid); //회원 가입시 아이디 중복 체크용
	int insertMember(Member member);
	int updateMember(Member member);
	int deleteMember(String userid);
	ArrayList<Member> selectList();
	int updateLoginOK(Member member);
	ArrayList<Member> selectSearchUserid(String keyword);
	ArrayList<Member> selectSearchGender(String keyword);
	ArrayList<Member> selectSearchAge(int age);
	ArrayList<Member> selectSearchEnrollDate(SearchDate searchDate);
	ArrayList<Member> selectSearchLoginOK(String keyword);
}
