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
import web.service.face.PerfService;
import web.util.Paging;
import web.util.PagingLayer;
import web.util.PagingLayerWrite;
import web.util.PagingPerf;

@Controller
public class LayerController {

	private static final Logger logger = LoggerFactory.getLogger(LayerController.class);
	
	//서비스 객체
	@Autowired LayerService layerService;
	
	
	@RequestMapping(value="/layer/list")
	public void layerList(PagingLayer paramData, Model model) {}
	
	@RequestMapping(value="/layer/list_ok", method = RequestMethod.GET)
	public String layerListOk(Model model, PagingLayer paramData, String target) {	//리스트 조회
		
		System.out.println("target : " + paramData.getTarget());
		System.out.println("paramData : " + paramData);
		System.out.println("target : " + target);
		
		PagingLayer paging = layerService.getLayerPaging(paramData);
		
		//페이징 처리한 카테고리 별 리스트 조회
		List<HashMap<String, Object>> list = layerService.getList(model, paging);
		
		
		logger.info("paging {} ", paging);
		
		
		model.addAttribute("paging",paging);
		model.addAttribute("list",list);
//		logger.debug("list {}", list);
//		for (int i = 0; i < list.size(); i++) {
//			System.out.println("list" + list.get(i).get("FILES2"));
//			System.out.println("list" + list.get(i).get("NICK"));
//			
//		}
		model.addAttribute("linkurl", "/layer/list");
		
		return "/layer/list_ok";
	}
	
	@RequestMapping(value="/layer/view", method = RequestMethod.GET)
	public void layerView(HttpSession session,Model model) {	// 레이어드 상세보기
		//세션에서 userNo 가져오기
		logger.info("");
		
		
		
		HashMap<String, Object> view = layerService.getView(model);
	}
	
	@RequestMapping(value="/layer/like")
	public void layerLike(HttpSession session) {	//레이어드 좋아요 
		int userNo = (int) session.getAttribute("userNo");
		//레이어드 좋아요 조회
		int like = layerService.getCntLike(userNo);
		
	}
	
	@RequestMapping(value="/layer/write")
	public void layerInsert(PagingLayerWrite paramData, Model model) {
		
//		PagingLayerWrite paging = layerService.getPaging( paramData );
//		
//		paging.setSearch(paramData.getSearch());
//		
//		List<HashMap<String, Object>> list = layerService.getPerfList( paging );
//		
//		model.addAttribute("paging", paging);
//		model.addAttribute("list", list);
//		
//		model.addAttribute("linkUrl","/layer/write");
		
	}
	
	@RequestMapping(value="/layer/write", method = RequestMethod.POST)
	public void layerInsertProc(HttpSession session, Model model) { //레이어드 등록
		int userNo = (int) session.getAttribute("userNo");
		
		
	}

	@RequestMapping(value="/layer/write_ok", method = RequestMethod.POST)
	public String layerInsert_ok(PagingLayerWrite paramData, Model model) {
		
		PagingLayerWrite paging = layerService.getPaging( paramData );
		
		paging.setSearch(paramData.getSearch());
		
		List<HashMap<String, Object>> list = layerService.getPerfList( paging );
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		model.addAttribute("linkUrl","/layer/write");
		
		return "/layer/write_ok";
	}


}
