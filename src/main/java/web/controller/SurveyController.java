package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/survey")
public class SurveyController {

	@RequestMapping(value="/q1")
	public void surveyQ1(Model model) {}
	
	@RequestMapping(value="/q2")
	public void surveyQ2(Model model) {}
	
	@RequestMapping(value="/q3")
	public void surveyQ3(Model model) {}
	
	@RequestMapping(value="/q4")
	public void surveyQ4(Model model) {}
	
	@RequestMapping(value="/q5")
	public void surveyQ5(Model model) {}
	
	@RequestMapping(value="/q6")
	public void surveyQ6(Model model) {}
	
	@RequestMapping(value="/q7")
	public void surveyQ7(Model model) {}
	
	@RequestMapping(value="/q8")
	public void surveyQ8(Model model) {}
	
	@RequestMapping(value="/result")
	public void surveyResult(Model model) {}
	
}
