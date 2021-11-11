package web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Notice;
import web.service.face.NoticeService;
import web.util.PagingNotice;

@Controller
public class NoticeController {

	@Autowired NoticeService noticeService;
	
	@RequestMapping(value="/notice/list")
	public void noticeList(Model model, HttpServletRequest req) {
		PagingNotice paging = noticeService.getPaging(req);
		model.addAttribute("paging", paging);
		
		List<Notice> noticeList = noticeService.getNoticeList(paging);
		model.addAttribute("noticeList", noticeList);
	}
	
}
