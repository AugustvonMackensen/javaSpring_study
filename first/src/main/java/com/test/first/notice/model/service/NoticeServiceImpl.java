package com.test.first.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.first.common.SearchDate;
import com.test.first.notice.model.dao.NoticeDao;
import com.test.first.notice.model.vo.Notice;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public ArrayList<Notice> selectAll() {
		return noticeDao.selectList();
	}

	@Override
	public Notice selectNotice(int noticeno) {
		return noticeDao.selectNotice(noticeno);
	}

	@Override
	public int insertNotice(Notice notice) {
		return noticeDao.insertNotice(notice);
	}

	@Override
	public int updateNotice(Notice notice) {
		return noticeDao.updateNotice(notice);
	}

	@Override
	public int deleteNotice(int noticeno) {
		return noticeDao.deleteNotice(noticeno);
	}

	@Override
	public ArrayList<Notice> selectNewTop3() {
		return noticeDao.selectNewTop3();
	}

	@Override
	public ArrayList<Notice> selectSearchTitle(String keyword) {
		return noticeDao.selectSearchTitle(keyword);
	}

	@Override
	public ArrayList<Notice> selectSearchWriter(String keyword) {
		return noticeDao.selectSearchWriter(keyword);
	}

	@Override
	public ArrayList<Notice> selectSearchDate(SearchDate date) {
		return noticeDao.selectSearchDate(date);
	}

}
