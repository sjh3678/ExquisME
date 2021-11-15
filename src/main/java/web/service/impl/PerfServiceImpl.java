package web.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.PerfDao;
import web.dto.Perf;
import web.service.face.PerfService;
import web.util.PagingPerf;

@Service
public class PerfServiceImpl implements PerfService{

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
	public Perf getPerfView(Perf perf) {
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

}
