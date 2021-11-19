package web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.LayerLike;
import web.service.face.LayerService;
import web.util.PagingLayer;
import web.util.PagingLayerWrite;

@Controller
public class LayerController {

	private static final Logger logger = LoggerFactory.getLogger(LayerController.class);
	
	//서비스 객체
	@Autowired LayerService layerService;
	
	@RequestMapping(value="/layer/error")
	public String layerError() {
		return "/layout/error";
	}
	
	@RequestMapping(value="/layer/list")
	public void layerList(PagingLayer paramData, Model model) {}
	
	@RequestMapping(value="/layer/list_ok", method = RequestMethod.GET)
	public String layerListOk(Model model, PagingLayer paramData, String target, HttpSession session) {	//리스트 조회
		
		System.out.println("target : " + paramData.getTarget());
		System.out.println("paramData : " + paramData);
		System.out.println("target : " + target);
		logger.info("userNo : {}", session.getAttribute("userNo"));
		
		boolean userlogin = false;
		if(session.getAttribute("login") != null) {
			userlogin = (boolean) session.getAttribute("login");
		}

		int userNo = 0;
		if ( session.getAttribute("login") != null ) {
			userNo = (int) session.getAttribute("userNo");
		}
		
		PagingLayer paging = layerService.getLayerPaging(paramData);
		
		//페이징 처리한 카테고리 별 리스트 조회
		List<HashMap<String, Object>> list = layerService.getList(userNo, paging);
		
		logger.info("paging {} ", paging);
		
		if(paramData.getCurPage() > paging.getEndPage()) {
			return null;
		}
		
		model.addAttribute("login", userlogin);
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
	
	
	@RequestMapping(value="/layer/like")
	public String layerLike(HttpSession session, LayerLike lLike, Model model) {	//레이어드 좋아요
		
		logger.info("layeringNo : {}", lLike.getLayeringNo() );
		lLike.setUserNo((int) session.getAttribute("userNo"));
		//로그인한 회원이 등록한 레이어드 좋아요 조회
		int cnt = layerService.getCntLike(lLike);
		
		HashMap<String, Object> layerLike = layerService.setLayerLike(cnt,lLike);
		
		model.addAttribute("list", layerLike);
		return "jsonView";
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
//		logger.info("paging {} ", paging);
		
	}
	
	@RequestMapping(value="/layer/write", method = RequestMethod.POST)
	public String layerInsertProc(HttpSession session, Model model) { //레이어드 등록
		int userNo = (int) session.getAttribute("userNo");
		
		return "redirect: /layer/list";
	}

	@RequestMapping(value="/layer/write_ok", method = RequestMethod.POST)
	public String layerInsert_ok(PagingLayerWrite paramData, Model model) {
		
		PagingLayerWrite paging = layerService.getPaging( paramData );
		
		paging.setSearch(paramData.getSearch());
		
		List<HashMap<String, Object>> list = layerService.getPerfList( paging );
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		model.addAttribute("linkUrl","/layer/write");
		logger.info("paging {} ", paging);
		return "/layer/write_ok";
	}


}
