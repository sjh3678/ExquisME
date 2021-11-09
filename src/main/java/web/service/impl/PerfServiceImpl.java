package web.service.impl;

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
	public Paging getPaging(Paging paging) {
		return null;
	}

	@Override
	public List<Perf> getPerfList(Paging paging) {
		return null;
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
