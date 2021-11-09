package web.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import web.dto.Perf;
import web.service.face.PerfService;
import web.util.Paging;

@Controller
@RequestMapping(value = "/perf")
public class PerfController {

	private Logger logger = LoggerFactory.getLogger(PerfController.class);
	
	@Autowired PerfService perfService;
	
	@RequestMapping(value = "/list")
	public void perfList(Paging paging, Model model) {
		
	}
	
	@RequestMapping(value= "/list_ok")
	public String perListOk(Paging paging, HttpServletRequest req, ModelAndView mav ) {
		return null;
	}
	
	@RequestMapping(value = "/view")
	public String perfView(Perf perf, Model model) {
		return null;
	}
}
