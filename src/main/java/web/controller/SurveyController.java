package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SurveyController {
	
	private static final Logger logger = LoggerFactory.getLogger(SurveyController.class);	

	@RequestMapping(value="/survey/name")
	public void surveyName() {}
	
	@RequestMapping(value="/survey/q1", method = RequestMethod.GET)
	public void surveyQ1(Model model, String useName) {
		
		model.addAttribute("useName", useName);
	}
	
	@RequestMapping(value="/survey/q2", method = RequestMethod.GET)
	public void surveyQ2(Model model, String useName, String A1) {
		
		model.addAttribute("useName", useName);
		model.addAttribute("A1", A1);
	}
	
	@RequestMapping(value="/survey/q3", method = RequestMethod.GET)
	public void surveyQ3(Model model, String useName, String A1, String A2) {
		
		model.addAttribute("useName", useName);
		model.addAttribute("A1", A1);
		model.addAttribute("A2", A2);
	}
	
	@RequestMapping(value="/survey/q4", method = RequestMethod.GET)
	public void surveyQ4(Model model, String useName, String A1, String A2, String A3) {
		
		model.addAttribute("useName", useName);
		model.addAttribute("A1", A1);
		model.addAttribute("A2", A2);
		model.addAttribute("A3", A3);
	}
	
	@RequestMapping(value="/survey/q5", method = RequestMethod.GET)
	public void surveyQ5(Model model, String useName, String A1, String A2, String A3, String A4) {
		
		model.addAttribute("useName", useName);
		model.addAttribute("A1", A1);
		model.addAttribute("A2", A2);
		model.addAttribute("A3", A3);
		model.addAttribute("A4", A4);
	}
	
	@RequestMapping(value="/survey/q6", method = RequestMethod.GET)
	public void surveyQ6(Model model, String useName, String A1, String A2, String A3, String A4, String A5) {
		
		model.addAttribute("useName", useName);
		model.addAttribute("A1", A1);
		model.addAttribute("A2", A2);
		model.addAttribute("A3", A3);
		model.addAttribute("A4", A4);
		model.addAttribute("A5", A5);
	}
	
	@RequestMapping(value="/survey/q7", method = RequestMethod.GET)
	public void surveyQ7(Model model, String useName, String A1, String A2, String A3, String A4, String A5, String A6) {
		
		model.addAttribute("useName", useName);
		model.addAttribute("A1", A1);
		model.addAttribute("A2", A2);
		model.addAttribute("A3", A3);
		model.addAttribute("A4", A4);
		model.addAttribute("A5", A5);
		model.addAttribute("A6", A6);
	}
	
	@RequestMapping(value="/survey/q8", method = RequestMethod.GET)
	public void surveyQ8(Model model, String useName, String A1, String A2, String A3, String A4, String A5, String A6, String A7) {
		
		model.addAttribute("useName", useName);
		model.addAttribute("A1", A1);
		model.addAttribute("A2", A2);
		model.addAttribute("A3", A3);
		model.addAttribute("A4", A4);
		model.addAttribute("A5", A5);
		model.addAttribute("A6", A6);
		model.addAttribute("A7", A7);
	}
	
	@RequestMapping(value="/survey/result", method = RequestMethod.GET)
	public void surveyResult(Model model, String useName, String A1, String A2, String A3, String A4, String A5, String A6, String A7, String A8) {
		
		model.addAttribute("useName", useName);
		model.addAttribute("A1", A1);
		model.addAttribute("A2", A2);
		model.addAttribute("A3", A3);
		model.addAttribute("A4", A4);
		model.addAttribute("A5", A5);
		model.addAttribute("A6", A6);
		model.addAttribute("A7", A7);
		model.addAttribute("A8", A8);
	}
	
}
