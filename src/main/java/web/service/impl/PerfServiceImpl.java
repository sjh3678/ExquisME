package web.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.controller.PerfController;
import web.dao.face.PerfDao;
import web.dto.Perf;
import web.dto.PerfLike;
import web.service.face.PerfService;
import web.util.PagingPerf;

@Service
public class PerfServiceImpl implements PerfService{

	private Logger logger = LoggerFactory.getLogger(PerfServiceImpl.class);
	
	@Autowired PerfDao perfDao;
	
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
	public void newPerfLike(PerfLike perfLike) {
		perfDao.insertPerfLike(perfLike);
	}

	
	@Override
	public void deletePerfLike(PerfLike perfLike) {
		perfDao.deletePerfLike(perfLike);
	}

}
