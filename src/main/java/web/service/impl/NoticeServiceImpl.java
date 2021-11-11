package web.service.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.NoticeDao;
import web.dto.Notice;
import web.service.face.NoticeService;
import web.util.Paging;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired NoticeDao noticeDao;
	
	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 게시글 수 조회
		int totalCount = noticeDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		
		return paging;
	}

	@Override
	public List<Notice> getNoticeList(Paging paging) {
		return noticeDao.selectNoticeAll(paging);
	}

	@Override
	public void setNoticeWrite(Notice notice) {}
	
	@Override
	public Notice getNoticeView(Notice notice) {
		return noticeDao.selectNoticeByNoticeNo(notice);
	}
	
	@Override
	public void setNoticeUpdate(Notice notice) {}
	
	@Override
	public void setNoticeDelete(Notice notice) {}
}
