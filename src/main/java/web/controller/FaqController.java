package web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Faq;
import web.service.face.FaqService;

@Controller
public class FaqController {
	
	@Autowired FaqService faqService;

	@RequestMapping(value="/faq")
	public void faqList(Model model) {
		List<Faq> list = faqService.getFaqList();
		model.addAttribute("faqList", list);
	}
}
