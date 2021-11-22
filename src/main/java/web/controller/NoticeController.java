package web.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.service.face.NoticeService;
import web.util.PagingNotice;

@Controller
public class NoticeController {

	@Autowired NoticeService noticeService;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping(value="/notice/list")
	public void noticeList(Model model, HttpServletRequest req) {
		
		//페이징
		PagingNotice paging = noticeService.getPaging(req);
		model.addAttribute("paging", paging);
		
		//전체 리스트 조회
		List<HashMap<String, Object>> noticeList = noticeService.getNoticeList(paging);
		model.addAttribute("noticeList", noticeList);
		
		//paging.jsp에 쓰일 현재 URL
		model.addAttribute("linkUrl", "/notice/list");
		
	}

}
