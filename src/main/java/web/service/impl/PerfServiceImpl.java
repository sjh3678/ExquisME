package web.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.PerfDao;
import web.dto.Perf;
import web.service.face.PerfService;
import web.util.Paging;

@Service
public class PerfServiceImpl implements PerfService{

	@Autowired PerfDao perfDao;
	
	@Override
	public Paging getPaging(Paging paramData) {
		//총 게시글 수 조회
		int totalCount = perfDao.selectCntPerfAll();
				
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
				
		return paging;
	}

	@Override
	public List<HashMap<String, Object>> getPerfList(Paging paging) {
		return perfDao.selectPerfAll(paging);
	}

	@Override
	public Perf getPerfView(Perf perf) {
		return null;
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

}
