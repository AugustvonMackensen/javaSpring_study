package com.test.first.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.first.common.SearchDate;
import com.test.first.notice.model.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {
	//스프링-마이바티스 연동 객체 사용 : root-context.xml에 있음
	
	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<Notice> selectNewTop3(){
		List<Notice> list = session.selectList("noticeMapper.selectNewTop3");
		return (ArrayList<Notice>) list;
	}
	
	public ArrayList<Notice> selectList(){
		List<Notice> list = session.selectList("noticeMapper.selectAll");
		return (ArrayList<Notice>) list;
	}
	
	public ArrayList<Notice> selectSearchTitle(String keyword){
		List<Notice> list = session.selectList("noticeMapper.searchTitle", keyword);
		return (ArrayList<Notice>) list;
	}
	
	public ArrayList<Notice> selectSearchWriter(String keyword){
		List<Notice> list = session.selectList("noticeMapper.searchWriter", keyword);
		return (ArrayList<Notice>) list;
	}
	
	public ArrayList<Notice> selectSearchDate(SearchDate date){
		List<Notice> list = session.selectList("noticeMapper.searchDate", date);
		return (ArrayList<Notice>) list;
	}
	
	//상세보기와 수정
	public Notice selectNotice(int noticeno) {
		return session.selectOne("noticeMapper.selectNotice", noticeno);
	}
	
	//공지글 삭제 처리
	public int deleteNotice(int noticeno) {
		return session.delete("noticeMapper.deleteNotice", noticeno);
	}
	
	//공지글 등록 처리
	public int insertNotice(Notice notice) {
		return session.insert("noticeMapper.insertNotice", notice);
	}
	
	//기존 공지글 수정 처리
	public int updateNotice(Notice notice) {
		return session.update("noticeMapper.updateNotice", notice);
	}

	public Notice selectLast() {
		return session.selectOne("noticeMapper.selectLast");
	}
}
