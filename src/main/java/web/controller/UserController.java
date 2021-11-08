package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.SocialAccount;
import web.dto.User;
import web.service.face.UserService;

@Controller
@RequestMapping(value="/User")
public class UserController {
		
	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired UserService userService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() {
		logger.info("/login [GET]");
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginProc(
			@RequestParam(value="id", required=false) String id
			, @RequestParam(value="pw", required=false) String pw
			, HttpSession session){
		logger.info("/login [POST]");
		User user = new User();
		user.setId(id);
		String salt = pw;//암호화....
		user.setSalt(salt);//암호화시 고정되는 솔트값
		boolean isLogin = userService.getLoginChk(user);
		return null;
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void join() {
		logger.info("/join [GET]");
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinProc(
			User user) {
		logger.info("/join [POST]");
		boolean isJoin = userService.getJoinChk(user);
		return null;
	}
	
	//이거도 아직...
	@RequestMapping(value="social/join")
	public String socialJoin(SocialAccount social) {
		logger.info("/social/join");
		return null;
	}
	
	//이거 모름....
	@RequestMapping(value="social/join")
	public String socialLogin() {
		logger.info("/social/login");
		return null;
	}
	
	@RequestMapping(value="/mypage")
	public void mypage() {
		logger.info("/mypage");
	}
	
	@RequestMapping(value="/check/password", method=RequestMethod.GET)
	public void checkPassword() {
		logger.info("/check/password [GET]");
	}
	
	@RequestMapping(value="/check/password", method=RequestMethod.POST)
	public void checkPasswordProc(String pw) {
		logger.info("/check/password [POST]");
		boolean passwordChk = userService.getCheckPassword(pw);
	}
	
	@RequestMapping(value="/change/password", method=RequestMethod.GET)
	public void changePassword() {
		logger.info("/change/password [GET]");
	}
	
	@RequestMapping(value="/change/password", method=RequestMethod.POST)
	public String changePasswordProc(
			String pw, String pwChk) {
		logger.info("/change/password [POST]");
		boolean isChange = userService.setChangePw(pw, pwChk);
		return null;
	}
	
	@RequestMapping(value="/remove/user", method=RequestMethod.GET)
	public void removeUser(int userno) {
		logger.info("/remove/user [GET]");
		boolean isDelete = userService.deleteUser(userno);
	}
}
