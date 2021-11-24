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

import web.service.face.PerfService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired PerfService perfService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		List<HashMap<String, Object>> list = perfService.getPerfMostLike();		
		model.addAttribute("list", list);
		
		return "home";
	}
	
	@RequestMapping(value = "/admin")
	public String homeAdmin() {
		return "/admin/home";
	}
}
