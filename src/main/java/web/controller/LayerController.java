package web.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Layer;
import web.service.face.LayerService;
import web.util.PagingLayer;

@Controller
public class LayerController {

	private static final Logger logger = LoggerFactory.getLogger(LayerController.class);
	
	//서비스 객체
	@Autowired LayerService layerService;
	
	@RequestMapping(value="/layer/list")
	public void layerList(PagingLayer paramData, Model model) {

		
	}
	
	@RequestMapping(value="/layer/list_ok", method = RequestMethod.GET)
	public String layerListOk(Model model, PagingLayer paramData, String target) {	//리스트 조회
		
		System.out.println("target : " + paramData.getTarget());
		System.out.println("paramData : " + paramData);
		System.out.println("target : " + target);
		
		PagingLayer paging = layerService.getLayerPaging(paramData);
		
		//페이징 처리한 카테고리 별 리스트 조회
		List<HashMap<String, Object>> list = layerService.getList(model, paging);
		
		//페이징 처리한 카테고리 별 이미지 리스트 조회 
		List<HashMap<String, Object>> img = layerService.getImageList(model, paging);
		
		logger.info("paging {} ", paging);
		
		
		model.addAttribute("paging",paging);
		model.addAttribute("list",list);
		logger.debug("list {}", list);
		for (int i = 0; i < list.size(); i++) {
			System.out.println("list" + list.get(i).get("FILES2"));
			System.out.println("list" + list.get(i).get("NICK"));
			
		}
		model.addAttribute("linkurl", "/layer/list");
		
		return "/layer/list_ok";
	}
	
	@RequestMapping(value="/layer/view")
	public void layerView(HttpSession session) {	// 레이어드 상세보기
		//세션에서 userNo 가져오기
		int userNo = (int) session.getAttribute("userNo");
		
		Layer view = layerService.getView(userNo);
	}
	
	@RequestMapping(value="/layer/like")
	public void layerLike(HttpSession session) {	//레이어드 좋아요 
		int userNo = (int) session.getAttribute("userNo");
		//레이어드 좋아요 조회
		int like = layerService.getCntLike(userNo);
		
	}
	@RequestMapping(value="/layer/")
	public void layerInsert(HttpSession session, Model model) { //레이어드 등록
		
	}

}
