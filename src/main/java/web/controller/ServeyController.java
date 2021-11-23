package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ServeyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ServeyController.class);	

	@RequestMapping(value="/survey/name")
	public void surveyName() {}
	
	@RequestMapping(value="/survey/Q1", method = RequestMethod.GET)
	public String surveyQ1(Model model, String useName) {
		
		logger.info("useName : {}", useName );
		model.addAttribute("useName", useName);
		
		return "/survey/Q1";
	}
	@RequestMapping(value="/survey/Q2", method = RequestMethod.GET)
	public void surveyQ2(Model model, String useName, String A1) {
		logger.info("A1 : {}", A1);
		
		model.addAttribute("useName", useName);
		model.addAttribute("A1", A1);
	}
	
}
