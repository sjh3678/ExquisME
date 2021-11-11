package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.ExtaDao;
import web.dto.ExLike;
import web.dto.Extagram;
import web.service.face.ExtaService;
import web.util.Paging;

@Service
public class ExtaServiceImpl implements ExtaService {
	
	@Autowired ExtaDao extaDao;
	
	@Override
	public List<Extagram> getExtaList(Paging paging) {
		return extaDao.selectExtaAll(paging);
	}
	@Override
	public Paging getExtaPaging(Paging paramData) {
		
		int totalCount = extaDao.selectExtaCntAll(paramData);
		
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}
	
	@Override
	public void setExtaWrite(Extagram extagram, MultipartFile file) {
		
	}
	
	@Override
	public void setExtaUpdate(Extagram extagram) {
		
	}
	
	@Override
	public void setExtaDelete(Extagram extagram) {
		
	}
	
	@Override
	public Extagram getExtaView(Extagram extagram) {
		return null;
	}
	
	
	@Override
	public void setExtaReport(Extagram extagram) {
		
	}
	
	@Override
	public void setHeart(ExLike exLike) {
		
	}
	@Override
	public void setHeartDelete(ExLike exLike) {
		
	}
	
	
	
}
