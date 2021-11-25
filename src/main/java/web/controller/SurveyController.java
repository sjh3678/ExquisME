package web.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Perf;
import web.service.face.SurveyService;

@Controller
public class SurveyController {
	
	private static final Logger logger = LoggerFactory.getLogger(SurveyController.class);
	
	@Autowired SurveyService surveyService;

	@RequestMapping(value="/survey/name")
	public void surveyName() {}
	
	@RequestMapping(value="/survey/q1", method = RequestMethod.GET)
	public void surveyQ1proc(Model model, String useName) {
		
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
		
		HashMap<String, Object> map = new HashMap<>();
		
		int a1 = Integer.parseInt(A1) ;
		int a2 = Integer.parseInt(A2) ;
		if (A3 == null) {
			int a3 = 0 ;
			map.put("A3", a3);
		}
		int a3 = Integer.parseInt(A3) ;
		int a4 = Integer.parseInt(A4) ;
		int a5 = Integer.parseInt(A5) ;
		int a6 = Integer.parseInt(A6) ;
		int a7 = Integer.parseInt(A7) ;
		int a8 = Integer.parseInt(A8) ;
		
		map.put("A1", a1);
		map.put("A2", a2);
		map.put("A3", a3);
		map.put("A4", a4);
		map.put("A5", a5);
		map.put("A6", a6);
		map.put("A7", a7);
		map.put("A8", a8);
		
		logger.info("map : {}", map);
		
		List<HashMap<String, Object>> list = surveyService.getNoteList(map);
		
		logger.info("list : {}", list);
		
		List<HashMap<String, Object>> perfList = surveyService.getPerfList(list);
		
		logger.info("perfList : {}", perfList);
		
		model.addAttribute("useName", useName);
		model.addAttribute("list", list);
		model.addAttribute("perfList", perfList);
	}
}
