package web.controller;

import java.util.HashMap;
import java.util.List;

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
	public void perfList(Paging paramData, Model model) {
		
		//페이징 계산
		Paging paging = perfService.getPaging( paramData );
		
		List<HashMap<String, Object>> list = perfService.getPerfList(paging);
		
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		model.addAttribute("linkUrl", "/perf/list");
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
