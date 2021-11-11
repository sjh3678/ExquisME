package web.controller;

import java.util.List;

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
	
	@RequestMapping(value="/")
	public void faqList(Model model) {
		List<Faq> list = faqService.getFaqList();
		model.addAttribute("faqList", list);
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void faqWrite() {}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public void faqWriteProc(Faq faq) {}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public void faqUpdate(Faq faq) {}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public void faqUpdateProc(Faq faq) {}
	
	@RequestMapping(value="/delete")
	public void faqDelete(Faq faq) {}
	
}
