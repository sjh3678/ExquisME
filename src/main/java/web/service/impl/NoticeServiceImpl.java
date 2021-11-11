package web.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.NoticeDao;
import web.dto.Notice;
import web.service.face.NoticeService;
import web.util.PagingNotice;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired NoticeDao noticeDao;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Override
	public PagingNotice getPaging(HttpServletRequest req) {
		
		String param = req.getParameter("curPage");
		
		int curPage = 0;
		
		if(param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		} else {
			logger.info("curPage 값이 null입니다.");
		}
		
		int totalCount = noticeDao.selectCntAll();
		
		PagingNotice paging = new PagingNotice(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<HashMap<String, Object>> getNoticeList(PagingNotice paging) {
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
