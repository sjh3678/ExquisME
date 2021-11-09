package web.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Perf;
import web.service.face.PerfService;
import web.util.Paging;

@Controller
@RequestMapping(value = "/admin/perf")
public class AdminPerfController {

	private Logger logger = LoggerFactory.getLogger(AdminPerfController.class);
	
	@Autowired PerfService perfService;
	
	@RequestMapping(value = "/list")
	public void perfList(Paging paging, Model model) {
		
	}
	
	@RequestMapping(value = "/view")
	public String perfView(Perf perf, Model model) {
		return null;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String perfUpdate(Perf perf) {
		return null;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String perfUpdateProc(Perf perf, HttpServletRequest req) {
		return null;
	}
	
	@RequestMapping(value = "/delete")
	public String perfDelete(Perf perf) {
		return null;
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String perfWrite() {
		return null;
	}
	
	@RequestMapping(value = "/wirte", method = RequestMethod.POST)
	public String perfWriteProc(HttpServletRequest req) {
		return null;
	}
	
}
