package web.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import web.dao.face.LayerDao;
import web.service.face.LayerService;
import web.util.Paging;
import web.util.PagingLayer;
import web.util.PagingLayerWrite;
import web.util.PagingPerf;

@Service
public class LayerServiceImpl implements LayerService {

	private static final Logger logger = LoggerFactory.getLogger(LayerServiceImpl.class);
	
	@Autowired LayerDao layerDao;
	
	@Override
	public List<HashMap<String, Object>> getList(Model model, PagingLayer paging) {

		
		List<HashMap<String, Object>> list = layerDao.selectLayerListByTarget(paging);
		
		return list;
	}
	
	@Override
	public PagingLayer getLayerPaging(PagingLayer paramData) {
		
		
		//총 게시글 수 조회
		int totalCount = layerDao.selectLayerCntAll();
		
		//페이징 계산
		PagingLayer paging = new PagingLayer(totalCount, paramData.getCurPage());
		paging.setTarget(paramData.getTarget());
		
		return paging;
	}
	
	@Override
	public HashMap<String, Object> getView(Model model) {
		
		return layerDao.selectLayerViewByLayeringNo(model);
	}

	@Override
	public int getCntLike(int userNo) {
		
		int cnt = layerDao.selectLayerLikeCntByuserNo(userNo);
		
		if ( cnt != 1 ) {
			layerDao.insertLayerLikeByuserNo(userNo);
		} else if( cnt == 0) {
			layerDao.deleteLayerLikeByuserNo(userNo);
		}
		
		return 0;
	}

	@Override
	public void setLayer(HttpSession session, Model model) {
		
		layerDao.insertLayerByUserNo(model);
	}

	@Override
	public List<HashMap<String, Object>> getPerfImageList(PagingLayer paging) {
		return null;
	}

	@Override
	public PagingLayerWrite getPaging(PagingLayerWrite paramData) {
		//총 게시글 수 조회
		int totalCount = layerDao.selectCntPerfAll(paramData);

		//페이징 계산
		PagingLayerWrite paging = new PagingLayerWrite(totalCount, paramData.getCurPage());
				
		return paging;
	}

	@Override
	public List<HashMap<String, Object>> getPerfList(PagingLayerWrite paging) {
		return layerDao.selectPerfAll(paging);
	}




}
