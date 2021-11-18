package web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import web.dao.face.LayerDao;
import web.dto.LayerLike;
import web.service.face.LayerService;
import web.util.PagingLayer;
import web.util.PagingLayerWrite;

@Service
public class LayerServiceImpl implements LayerService {

	private static final Logger logger = LoggerFactory.getLogger(LayerServiceImpl.class);
	
	@Autowired LayerDao layerDao;
	
	@Override
	public List<HashMap<String, Object>> getList(int userNo, PagingLayer paging) {

		HashMap<String, Object> map = new HashMap<>();
		
		map.put("userNo", userNo);
		map.put("paging", paging);
		logger.info("map {}", map);
		System.out.println("map" + map);		
		
		List<HashMap<String, Object>> list = layerDao.selectLayerListByTarget(map);
		
//		for (int i = 0; i < list.size(); i++) {
//			logger.info("list(i) : {}", list.get(i));
//		}

		logger.info("list {}", list);
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
	public int getCntLike(LayerLike lLike) {
		
		
		int cnt = layerDao.selectLayerLikeCntByuserNo(lLike);
		
		logger.info("cnt : {}", cnt);
		
		return cnt;
	}
	
	@Override
	public HashMap<String, Object> setLayerLike(int cnt, LayerLike lLike ) {
		logger.info("lLike : {}", lLike);
		if (cnt == 1 ) {
			layerDao.deleteLayerLike(lLike);
			return layerDao.selectLayerLikeInfo(lLike);
		}else if (cnt == 0 ) {
			layerDao.insertLayerLike(lLike);
			return layerDao.selectLayerLikeInfo(lLike);
		}
		return null;
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
