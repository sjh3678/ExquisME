package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Notice;
import web.service.face.NoticeService;
import web.util.Paging;

@Controller
public class AdminNoticeController {

	@Autowired NoticeService noticeService;
	
	@RequestMapping(value="/notice/list")
	public void noticeList(Paging paging, Model model) {}
	
	@RequestMapping(value="/notice/write", method=RequestMethod.GET)
	public void noticeWrite() {}
	
	@RequestMapping(value="/notice/write", method=RequestMethod.POST)
	public void noticeWriteProc(Notice notice) {}
	
	@RequestMapping(value="/notice/view")
	public void noticeView(Notice notice) {}
	
	@RequestMapping(value="/notice/update", method=RequestMethod.GET)
	public void noticeUpdate(Notice notice) {}
	
	@RequestMapping(value="/notice/update", method=RequestMethod.POST)
	public void noticeUpdateProc(Notice notice) {}

	@RequestMapping(value="")
	public void noticeDelete(Notice notice) {}
	
}
