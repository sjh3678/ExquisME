package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.ExtaDao;
import web.dto.ExComm;
import web.dto.ExLike;
import web.dto.Extagram;
import web.dto.FileUpload;
import web.dto.Report;
import web.service.face.ExtaService;
import web.util.Paging;
import web.util.PagingExtagram;

@Service
public class ExtaServiceImpl implements ExtaService {
	private static final Logger logger = LoggerFactory.getLogger(ExtaService.class);	
	@Autowired ExtaDao extaDao;
	@Autowired ServletContext context;
	
	
//LIST	
	@Override
	public List<HashMap<String, Object>> getExtaList(PagingExtagram paging) {
		return extaDao.selectExtaAll(paging);
	}
	@Override
	public PagingExtagram getExtaPaging(PagingExtagram paramData) {
		
		int totalCount = extaDao.selectExtaCntAll(paramData);
		
		PagingExtagram paging = new PagingExtagram(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}
	

//VIEW
	
	@Override
	public List<HashMap<String, Object>> getUserResent(HashMap<String, Object> view) {
		return extaDao.selectUserResentWrite(view);
	}
	
	
	@Override
	public HashMap<String, Object> getExtaView(Extagram viewExta) {
		return extaDao.selectExtaView(viewExta);
	}
	
	@Override
	public List<HashMap<String, Object>> getCommentList(Extagram viewExta) {
		return extaDao.selectExtaComment(viewExta);
	}
	
	@Override
	public void setComment(ExComm comm) {
		extaDao.insertComment(comm);
	}
	
	@Override
	public Extagram getInfoViewExta(ExComm comment) {
		return extaDao.selectInfoViewExta(comment);
	}
	
	@Override
	public ExComm getInfoComment(ExComm comment) {
		return extaDao.selectInfoComment(comment);
	}

	@Override
	public void deleteComment(ExComm comment) {
		
		extaDao.deleteComment(comment);
	}
	
	@Override
	public boolean isHearted(ExLike heart) {
		int cnt = extaDao.selectCntHeart(heart);
		
		if(cnt>0) { //좋아요 했음
			return true;
		} else { //좋아요 안했음
			return false;
		}
	}
	
	@Override
	public boolean getHeart(ExLike heart) {
		
		if( isHearted(heart) ) { //좋아요 눌린 상태
			extaDao.deleteHeart(heart);
			return false;
		} else { //좋아요 안 눌린 상태
			extaDao.insertHeart(heart);
		}
		
		
		return true;
	}
	
	@Override
	public int getTotalCntHeart(ExLike heart) {
		return extaDao.selectTotalCntHeart(heart);
	}
	
	
	
	@Override
	@Transactional//트랜젝션
	public void setExtaWrite(Extagram extagram, MultipartFile file) {
		
		
	//------파일처리------
		if(file.getSize() <= 0) {
			return;
		}

		//저장될 경로
		String storedPath = context.getRealPath("upload");
		
		//폴더생성
		File stored = new File(storedPath);
		if( !stored.exists() ) {
			stored.mkdir();
		}
		
		//원본파일이름 알아내기
		String originName = file.getOriginalFilename();
		
		//UUID 설정
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		int fileSize = (int)file.getSize();
		
		//저장될 파일정보 객체
		File dest = new File(stored, storedName);
		
		try {
			//업로드된 파일 저장
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		FileUpload fileUpload = new FileUpload();
//		fileUpload.setFileNo(extagram.getFileNo());
		fileUpload.setOriginName(originName);
		fileUpload.setStoredName(storedName);
		fileUpload.setFileSize(fileSize);
		
		extaDao.deleteFile(extagram);
		extaDao.insertFile(fileUpload);
		extagram.setFileNo(fileUpload.getFileNo());
	//-------------------

		
	//-----게시글 처리-----
//		if( "".equals(extagram.getExContent()) ) {
//			extagram.setExContent("(비어있는 내용 입니다.)");
//		}
		
		extaDao.insertExtaWrite(extagram);
	}
	
	@Override
	public FileUpload getAttachFile(Extagram viewExta) {
		return extaDao.selectFileUploadByExNo(viewExta);
	}
	
	
	@Override
	@Transactional
	public void deleteExta(Extagram extagram) {
		extaDao.deleteHeartByExNo(extagram);//좋아요
		extaDao.deleteCommentByExNo(extagram);//댓글
		extaDao.deleteFile(extagram);//FILE
		extaDao.deleteExta(extagram);//게시글
	}
	

//UPDATE
	@Override
	public void setExtaUpdate(Extagram viewExta, MultipartFile file) {
		
	//------파일처리------
		if(file.getSize() <= 0) {
			logger.info("첨부파일 수정 없음.");
		} else {
			//저장될 경로
			String storedPath = context.getRealPath("upload");
			
			//폴더생성
			File stored = new File(storedPath);
			if( !stored.exists() ) {
				stored.mkdir();
			}
			
			//원본파일이름 알아내기
			String originName = file.getOriginalFilename();
			
			//UUID 설정
			String storedName = originName + UUID.randomUUID().toString().split("-")[4];
			
			int fileSize = (int)file.getSize();
			
			//저장될 파일정보 객체
			File dest = new File(stored, storedName);
			
			try {
				//업로드된 파일 저장
				file.transferTo(dest);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			FileUpload fileUpload = new FileUpload();
			fileUpload.setFileNo(viewExta.getFileNo());
			fileUpload.setOriginName(originName);
			fileUpload.setStoredName(storedName);
			fileUpload.setFileSize(fileSize);
			extaDao.updateExtaFile(fileUpload);
		}
			
		//업데이트
		extaDao.updateExta(viewExta);
	}
	
//REPORT - 게시글 번호에 해당하는 댓글목록 가져오기
	@Override
	public HashMap<String, Object> getCommentListForReport(Extagram viewExta) {
		return extaDao.selectCommentListForReport(viewExta);
	}
	
//REPORT - 피신고자 userNo 구하기	
	@Override
	public int getUserNoByNick(String defendantNick) {
		return extaDao.selectUserNoByNick(defendantNick);
	}
	
//REPORT - 삽입
	@Override
	public void setExtaReport(Report report) {
		extaDao.insertExtaReport(report);
	}

//ADMIN REPORT	
	@Override
	public List<HashMap<String, Object>> setReportList(Paging paging) {
		return extaDao.selectReportList(paging);
	}
	
	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 게시글 수 조회
		int totalCount = extaDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}

	@Override
	public void setReportStart(Report report) {
		extaDao.updateReportStart(report);
	}
	
	
//Main - 좋아요 탑5
	@Override
	public List<HashMap<String, Object>> getHeartTop5() {
		return extaDao.selectGetHeartTop5();
	}
	
	
	
}
