package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import web.dao.face.LayerDao;
import web.dto.Layer;
import web.service.face.LayerService;
import web.util.Paging;

@Service
public class LayerServiceImpl implements LayerService {

	@Autowired LayerDao layerDao;
	
	@Override
	public List<Layer> getList(Model model, Paging paging) {
		
		List<Layer> list = layerDao.selectLayerListByTarget(model);
		
		return list;
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




}
