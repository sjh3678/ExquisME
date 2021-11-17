package web.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Notice;
import web.dto.User;
import web.service.face.NoticeService;
import web.service.face.UserService;
import web.util.PagingNotice;

@Controller
@RequestMapping(value="/admin/notice")
public class AdminNoticeController {

	private static final Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);
	
	@Autowired NoticeService noticeService;
	@Autowired UserService userService;
	
	@RequestMapping(value="/list")
	public void noticeList(Model model, HttpServletRequest req) {
		
		//페이징
		PagingNotice paging = noticeService.getPaging(req);
		model.addAttribute("paging", paging);
		
		//전체 리스트 조회
		List<HashMap<String, Object>> noticeList = noticeService.getNoticeList(paging);
		model.addAttribute("noticeList", noticeList);

		//paging.jsp에 쓰일 현재 URL
		model.addAttribute("linkUrl", "/admin/notice/list");
		
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void noticeWrite() {}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String noticeWriteProc(Notice notice, MultipartFile file, HttpSession session) {
						
		notice.setUserNo((Integer)session.getAttribute("userNo"));

		noticeService.setNoticeWrite(notice, file);
		
		return "redirect:/admin/notice/list";
	}
	
	@RequestMapping(value="/view")
	public void noticeView(Notice notice) {}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public void noticeUpdate(Notice notice, Model model) {
		model.addAttribute("i", noticeService.getNoticeView(notice));
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String noticeUpdateProc(Notice notice, MultipartFile file) {
		logger.info("@@@@@@@@@@@ notice 안에 뭐가 들어가 있을까? {}", notice);
		logger.info("@@@@@@@@@@@ file 안에 뭐가 들어가 있을까? {}", file);
		noticeService.setNoticeUpdate(notice, file);
		return "redirect:/admin/notice/list";
	}

	@RequestMapping(value="/delete")
	public String noticeDelete(Notice notice) {
		notice.setFileNo(((BigDecimal)noticeService.getNoticeView(notice).get("FILE_NO")).intValue());
		noticeService.setNoticeDelete(notice);
		noticeService.setFileDelete(notice);
		return "redirect:/admin/notice/list";
	}
	
}
