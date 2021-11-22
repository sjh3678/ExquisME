package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

import web.controller.PerfController;
import web.dao.face.PerfDao;
import web.dto.FileUpload;
import web.dto.NoteLike;
import web.dto.Perf;
import web.dto.PerfLike;
import web.service.face.PerfService;
import web.util.PagingPerf;

@Service
public class PerfServiceImpl implements PerfService{

	private Logger logger = LoggerFactory.getLogger(PerfServiceImpl.class);
	
	@Autowired PerfDao perfDao;
	@Autowired private ServletContext context;
	
	@Override
	public PagingPerf getPaging(PagingPerf paramData) {
		
		//총 게시글 수 조회
		int totalCount = perfDao.selectCntPerfAll(paramData);

		//페이징 계산
		PagingPerf pagingPerf = new PagingPerf(totalCount, paramData.getCurPage());
				
		return pagingPerf;
	}

	@Override
	public List<HashMap<String, Object>> getPerfList(PagingPerf pagingPerf) {
		return perfDao.selectPerfAll(pagingPerf);
	}

	@Override
	public HashMap<String, Object> getPerfView(Perf perf) {
		return perfDao.selectPerfByPerfNo(perf);
	}

	@Override
	public void setPerfUpdate(Perf perf, HttpServletRequest req) {
		
	}

	@Override
	public void setPerfDelete(Perf perf) {
		
	}

	@Override
	public void setPerfWrite(HttpServletRequest req) {
		
	}

	@Override
	public List<HashMap<String, Object>> getPerfTopNote(Perf perf) {
		return perfDao.selectTopNoteByPerfNo(perf);
	}

	@Override
	public List<HashMap<String, Object>> getPerfMiddleNote(Perf perf) {
		return perfDao.selectMiddleNoteByPerfNo(perf);
	}

	@Override
	public List<HashMap<String, Object>> getPerfBaseNote(Perf perf) {
		return perfDao.selectBaseNoteByPerfNo(perf);
	}

	@Override
	public List<HashMap<String, Object>> getPerfMainAccord(Perf perf) {
		return perfDao.selectMainAccordByPerfNo(perf);
	}

	@Override
	public HashMap<String, Object> getPerfLike(int perfNo) {
		return perfDao.selectPerfLikeByPerfNo(perfNo);
	}

	@Override
	public HashMap<String, Object> getPerfDislike(int perfNo) {
		return perfDao.selectPerfDislikeByPerfNo(perfNo);
	}

	@Override
	public int getPerfLikeCnt(int perfNo, int userNo) {
		
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		
		hashmap.put("perfNo", perfNo);
		hashmap.put("userNo", userNo);
		
		logger.info("hashmap : {}", hashmap);
		
		return perfDao.selectPerfLikeCntByPerNoUserNo(hashmap);
	}

	@Override
	public int getPerfDislikeCnt(int perfNo, int userNo) {
		
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		
		hashmap.put("perfNo", perfNo);
		hashmap.put("userNo", userNo);
		
		return perfDao.selectPerfDislikeCntByPerNoUserNo(hashmap);
	}


	@Override
	public void perfLikeProc(PerfLike perfLike) {
		if("like".equals(perfLike.getLikeType()) ) {
			//향수 좋아요/싫어요 튜플 삭제
			perfDao.deletePerfLike(perfLike);
			
			//향수 좋아요 튜플 삽입
			perfDao.insertPerfLike(perfLike);
			
		}else if("likeCancel".equals(perfLike.getLikeType())) {
			//향수 좋아요/싫어요 튜플 삭제
			perfDao.deletePerfLike(perfLike);
			
		}else if("dislike".equals(perfLike.getLikeType())) {
			//향수 좋아요/싫어요 튜플 삭제
			perfDao.deletePerfLike(perfLike);
			//향수 싫어요 튜플 삽입
			perfDao.insertPerfDislike(perfLike);
			
		}else if("dislikeCancel".equals(perfLike.getLikeType())) {
			//향수 좋아요/싫어요 튜플 삭제
			perfDao.deletePerfLike(perfLike);
		}
	}

	@Override
	public void noteLikeProc(NoteLike noteLike) {

		//노트 좋아요 튜플 삭제
		perfDao.deleteNoteLike(noteLike);
		

		
		
		if(noteLike.getNoteNo() != null) {
		for (int i = 0; i < noteLike.getNoteNo().length; i++) {
			HashMap<String, Object> hashmap = new HashMap<String, Object>();
			
			hashmap.put("userNo", noteLike.getUserNo());
			hashmap.put("perfumeNo", noteLike.getPerfumeNo());
			hashmap.put("noteNo", noteLike.getNoteNo()[i]);
			
			perfDao.insertNoteLike(hashmap);
		}
		}
		
	}

	@Override
	public int setPerfFile(MultipartFile file) {

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
		FileUpload perfFile = new FileUpload();
		perfFile.setOriginName(originName);
		perfFile.setStoredName(storedName);
		perfFile.setFileSize(fileSize);
		logger.info("{}", perfFile);
		perfDao.insertPerfFile(perfFile);
		
		return perfFile.getFileNo();
	}

	@Override
	public int setNewPerf(Perf perf, int fileNo) {
		perf.setFileNo(fileNo);
		logger.info("perf : {}", perf);
		perfDao.insertNewPerf(perf);
		
		return perf.getPerfumeNo();
	}

}
