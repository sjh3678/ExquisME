package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Faq;
import web.service.face.FaqService;

@Controller
@RequestMapping(value="/admin/faq")
public class AdminFaqController {

	@Autowired FaqService faqService;
	
	@RequestMapping(value="/list")
	public void faqList(Model model) {
		//총 게시글 수
		model.addAttribute("faqTotal", faqService.getFaqCnt());
		//게시글 리스트
		List<Faq> list = faqService.getFaqList();
		model.addAttribute("faqList", list);
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void faqWrite() {}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String faqWriteProc(Faq faq, HttpSession session) {
		//FAQ 게시글이 10개 이상일 때
		if( faqService.getFaqCnt() >= 10 ) {
			return "redirect:/admin/faq/list";
		//FAQ 게시글이 10개 미만일 때에만 새로운 게시글 등록
		} else {
			faq.setUserNo((Integer)session.getAttribute("userNo"));
			faqService.setFaqWrite(faq);
			return "redirect:/admin/faq/list";			
		}	
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public void faqUpdate(Faq faq, Model model) {
		model.addAttribute("i", faqService.getFaqView(faq));
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String faqUpdateProc(Faq faq) {
		faqService.setFaqUpdate(faq);
		return "redirect:/admin/faq/list";			
	}
	
	@RequestMapping(value="/delete")
	public String faqDelete(Faq faq) {
		faqService.setFaqDelete(faq);
		return "redirect:/admin/faq/list";
	}
	
}
