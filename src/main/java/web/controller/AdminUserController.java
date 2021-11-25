package web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Extagram;
import web.dto.User;
import web.service.face.ExtaService;
import web.service.face.UserService;
import web.util.PagingExtagram;
import web.util.PagingUser;

	@Controller
	@RequestMapping(value = "/admin/user")
	public class AdminUserController {

	private static final Logger logger = LoggerFactory.getLogger(AdminUserController.class);
	
	@Autowired private UserService userService;
	@Autowired private ExtaService extaService;
	
	
	@RequestMapping(value = "/list")
	public void userList(PagingUser paramData, Model model) {
		
		logger.info("paramData {} : ", paramData);
		
		//페이징 가져오기
		PagingUser pagingUser = userService.getPaging( paramData );
		pagingUser.setSearch(paramData.getSearch());
		
		List<HashMap<String, Object>> list = userService.getUserList( pagingUser );
		model.addAttribute("paging", pagingUser);
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping(value = "/delete")
	public String userDelete(int userNo) {
		logger.info("userNo : {}", userNo);
		userService.deleteUser(userNo);
		return "redirect:/admin/user/list";
	}
	
	@RequestMapping(value = "/history/extagram")
	public String userHistory(int userNo, Model model, PagingExtagram paramData) {
		
		User user = new User();
		user.setUserNo(userNo);
		
		PagingExtagram paging = userService.getExtaPaging(paramData, user);
		logger.info("페이징 : {}", paging);
		
		List<Map<String, Object>> list = userService.getUserExtagramHistory(user, paging); 
		model.addAttribute("paging", paging);
		model.addAttribute("extaList", list);
		return "/admin/user/history/extagram";
	}
	
	//DELETE
		@RequestMapping(value="/history/extagram/delete")
		public String extaDelete(Extagram extagram, Model model) {
			
			logger.info("extagram : {}", extagram);
			
			extaService.deleteExta(extagram);
			
			return "redirect:/admin/user/history/extagram?userNo="+extagram.getUserNo();
		}
	
}
