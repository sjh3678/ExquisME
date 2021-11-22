package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.NoticeDao;
import web.dto.FileUpload;
import web.dto.Notice;
import web.service.face.NoticeService;
import web.util.PagingNotice;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired NoticeDao noticeDao;
	@Autowired private ServletContext context;

	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Override
	public PagingNotice getPaging(HttpServletRequest req) {
		
		String param = req.getParameter("curPage");
		int curPage = 0;
		if(param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
		
		param = req.getParameter("search");
		String search = null;
		if(param !=null && !"".equals(param)) {
			search = param;
		}

		param = req.getParameter("searchType");
		String searchType = null;
		if(param !=null && !"".equals(param)) {
			searchType = param;
		}
		
		PagingNotice paging = new PagingNotice();
		paging.setSearch(search);
		paging.setSearchType(searchType);
		
		int totalCount = noticeDao.selectCntAll(paging);
		
		paging = new PagingNotice(totalCount, curPage);
		paging.setSearch(search);
		paging.setSearchType(searchType);
		
		return paging;
	}

	@Override
	public List<HashMap<String, Object>> getNoticeList(PagingNotice paging) {
		return noticeDao.selectNoticeAll(paging);
	}

	@Override
	public void setNoticeWrite(Notice notice, MultipartFile file) {

		//-----파일업로드-----
		
		//빈 파일일 경우
		if(file.getSize() <= 0) {
			logger.info("첨부된 파일이 없습니다.");
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//저장될 파일의 정보 생성하기
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		int fileSize = (int)file.getSize();
		File dest = new File(storedPath, storedName);
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		//DB에 파일 정보 넣기
		FileUpload noticeFile = new FileUpload();
		noticeFile.setOriginName(originName);
		noticeFile.setStoredName(storedName);
		noticeFile.setFileSize(fileSize);
		logger.info("{}", noticeFile);
		noticeDao.insertFile(noticeFile);		
		notice.setFileNo(noticeFile.getFileNo());
		
		//-----게시물업로드-----
		
		//제목이 비어있을 경우
		if("".equals(notice.getNoticeTitle())) {
			notice.setNoticeTitle("(제목없음)");
		}
		
		//DB에 게시물 정보 + 파일 번호 넣기
		logger.info("{}", notice);
		noticeDao.insertNotice(notice);

	}
	
	@Override
	public HashMap<String, Object> getNoticeView(Notice notice) {
		return noticeDao.selectNoticeByNoticeNo(notice);
	}
	
	@Override
	public void setNoticeUpdate(Notice notice, MultipartFile file) {
		
		//-----파일업로드-----
		
		//빈 파일일 경우
		if(file.getSize() <= 0) {
			logger.info("첨부된 파일이 없습니다.");
		} else {
			//파일이 저장될 경로
			String storedPath = context.getRealPath("upload");
			
			File storedFolder = new File(storedPath);
			if( !storedFolder.exists() ) {
				storedFolder.mkdir();
			}
			
			//저장될 파일의 정보 생성하기
			String originName = file.getOriginalFilename();
			String storedName = originName + UUID.randomUUID().toString().split("-")[4];
			int fileSize = (int)file.getSize();
			File dest = new File(storedPath, storedName);
			
			try {
				file.transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			//DB에 파일 정보 넣기
			FileUpload noticeFile = new FileUpload();
			noticeFile.setFileNo(notice.getFileNo());
			noticeFile.setOriginName(originName);
			noticeFile.setStoredName(storedName);
			noticeFile.setFileSize(fileSize);
			logger.info("{}", noticeFile);			
			noticeDao.updateFile(noticeFile);		
		}
		
		
		//-----게시물업로드-----
		
		//제목이 비어있을 경우
		if("".equals(notice.getNoticeTitle())) {
			notice.setNoticeTitle("(제목없음)");
		}
		
		//DB에 게시물 정보 + 파일 번호 넣기
		logger.info("{}", notice);
		noticeDao.updateNoticeByNoticeNo(notice);
		
	}
	
	@Override
	public void setNoticeDelete(Notice notice) {
		noticeDao.DeleteNoticeByNoticeNo(notice);
	}
	
	@Override
	public void setFileDelete(Notice notice) {
		noticeDao.DeleteFileByNoticeNo(notice);
	}
}

