package web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Notice;
import web.service.face.NoticeService;
import web.util.Paging;

@Controller
public class NoticeController {

	@Autowired NoticeService noticeService;
	
	@RequestMapping(value="/notice/list")
	public void noticeList(Paging paramData, Model model) {
		
		//페이징 계산
		Paging paging = noticeService.getPaging(paramData);
		
		//게시글 목록 조회
		List<Notice> list = noticeService.getNoticeList(paging);
		
		//모델값 전달
		model.addAttribute("paing", paging);
		model.addAttribute("list", list);
	}
	
}
