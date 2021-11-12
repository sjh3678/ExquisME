package web.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import web.dao.face.LayerDao;
import web.dto.Layer;
import web.service.face.LayerService;
import web.util.PagingLayer;

@Service
public class LayerServiceImpl implements LayerService {

	private static final Logger logger = LoggerFactory.getLogger(LayerServiceImpl.class);
	
	@Autowired LayerDao layerDao;
	
	@Override
	public List<HashMap<String, Object>> getList(Model model, PagingLayer paging) {

		HashMap<String, Object> map = new HashMap<>();
		
		Object target = model.getAttribute("target");
		
		map.put("paging", paging);
		
		System.out.println("target "+target);
		System.out.println("paging"+ paging);
		System.out.println("map : " + map);
		System.out.println("map : " + map.get("paging"));
		List<HashMap<String, Object>> list = layerDao.selectLayerListByTarget(map);
		
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
	public Layer getView(int userNo) {
		
		return layerDao.selectLayerViewByuserNo(userNo);
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
	public List<HashMap<String, Object>> getImageList(Model model, PagingLayer paging) {
		return null;
	}




}
