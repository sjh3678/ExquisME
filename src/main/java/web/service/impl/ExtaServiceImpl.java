package web.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.ExtaDao;
import web.dto.ExComm;
import web.dto.ExLike;
import web.dto.Extagram;
import web.service.face.ExtaService;
import web.util.Paging;

@Service
public class ExtaServiceImpl implements ExtaService {
	
	@Autowired ExtaDao extaDao;
	
	
//LIST	
	@Override
	public List<HashMap<String, Object>> getExtaList(Paging paging) {
		return extaDao.selectExtaAll(paging);
	}
	@Override
	public Paging getExtaPaging(Paging paramData) {
		
		int totalCount = extaDao.selectExtaCntAll(paramData);
		
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		
		return paging;
	}
	

//VIEW
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
		
		if( isHearted(heart) ) { //좋아요 상태
			extaDao.deleteHeart(heart);
			return false;
		} else { //좋아요 안한 상태
			extaDao.insertHeart(heart);
		}
		
		
		return true;
	}
	
	@Override
	public int getTotalCntHeart(ExLike heart) {
		return extaDao.selectTotalCntHeart(heart);
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
	public void setExtaReport(Extagram extagram) {
		
	}
	
	@Override
	public void setHeart(ExLike exLike) {
		
	}
	@Override
	public void setHeartDelete(ExLike exLike) {
		
	}
	
	
	
}
