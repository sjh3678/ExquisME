package a.b.c;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.service.face.ExtaService;
import web.service.face.PerfService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired PerfService perfService;
	@Autowired ExtaService extaService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		List<HashMap<String, Object>> listPerf = perfService.getPerfMostLike();		
		model.addAttribute("list", listPerf);
		
		List<HashMap<String, Object>> listExta = extaService.getHeartTop5();
		model.addAttribute("listExta", listExta);
		
		return "home";
	}
	
	@RequestMapping(value = "/admin")
	public String homeAdmin() {
		return "/admin/home";
	}
}
