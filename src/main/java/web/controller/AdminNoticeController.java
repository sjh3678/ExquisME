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
@RequestMapping(value="/admin/notice")
public class AdminNoticeController {

	@Autowired NoticeService noticeService;
	
	@RequestMapping(value="/list")
	public void noticeList(Paging paging, Model model) {}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void noticeWrite() {}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public void noticeWriteProc(Notice notice) {}
	
	@RequestMapping(value="/view")
	public void noticeView(Notice notice) {}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public void noticeUpdate(Notice notice) {}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public void noticeUpdateProc(Notice notice) {}

	@RequestMapping(value="/delete")
	public void noticeDelete(Notice notice) {}
	
}
