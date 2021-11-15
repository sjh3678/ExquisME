package web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ChatLoginController {
		private static final Logger logger = LoggerFactory.getLogger(ChatLoginController.class);
		
		@RequestMapping(value = "/test/login", method = RequestMethod.GET)
		public String login() {
			return "/test/login";
		}
		
		@RequestMapping(value = "/test/login", method = RequestMethod.POST)
		public String loginProcess(@RequestParam String id, HttpServletRequest request) {
			
			logger.info("Welcome "+id);
			
	    	HttpSession session = request.getSession();
	    	session.setAttribute("id", id);
			return "/test/chat";
		}
}
