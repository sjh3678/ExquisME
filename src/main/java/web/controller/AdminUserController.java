package web.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.service.face.UserService;
import web.util.PagingUser;

@Controller
@RequestMapping(value = "/admin/user")
public class AdminUserController {

	private static final Logger logger = LoggerFactory.getLogger(AdminUserController.class);
	
	@Autowired private UserService userService;
	
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
	
}
