package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Layer;
import web.service.face.LayerService;
import web.util.Paging;

@Controller
public class LayerController {

	//서비스 객체
	@Autowired LayerService layerService;
	
	@RequestMapping(value="/layer/list")
	public void layerList(Model model, Paging paging) {	//리스트 조회
		//페이징 처리한 카테고리 별 리스트 조회
		List<Layer> list = layerService.getList(model, paging);
		
		model.addAttribute(list);
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
