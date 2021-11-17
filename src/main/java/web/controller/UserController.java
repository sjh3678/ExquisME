package web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.ExComm;
import web.dto.Extagram;
import web.dto.SocialAccount;
import web.dto.User;
import web.service.face.UserService;
import web.util.UserSHA256;

@Controller
@RequestMapping(value="/user")
public class UserController {
		
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired UserService userService;
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() {
		logger.info("/login [GET]");
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginProc( User user, HttpSession session){
		logger.info("/login [POST]");
		
		//비밀번호 암호화
		String encPw = UserSHA256.encrypt(user);
		
		user.setPw(encPw);
		
		boolean isLogin = userService.getLoginCheck(user);
		
		if(isLogin) {
			
			user = userService.getUserInfo(user);
			
			session.setAttribute("login", isLogin);
			session.setAttribute("nick", user.getNick() );
			session.setAttribute("userNo", user.getUserNo() );
			session.setMaxInactiveInterval(60*60); //1시간뒤 세션값 삭제
			int userNo = ((Integer)(session.getAttribute("userNo"))).intValue();
			logger.info("{}",userNo);
			return "redirect:/user/main";
		}else {
			return "redirect:/user/login";
		}
		
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		logger.info("/logout");
		session.invalidate();
		
		return "redirect:/user/main";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void join() {
		logger.info("/join [GET]");
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public @ResponseBody boolean joinProc(User user, String pwCheck, String birthDate, Date date) {
		logger.info("/join [POST] {}", user);
		logger.info("형변환 전 생일 날짜 : {}", birthDate);
		logger.info("생일 날짜 : {}", user.getBirth());
		SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd");
		
		Date birth;
		try {
			birth = sDate.parse(birthDate);
			System.out.println(birthDate);
			user.setBirth(birth);
			logger.info("전달된 날짜 : {}",birth);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(user.getPw().equals(pwCheck)) {
			String encPw = UserSHA256.encrypt(user);
			user.setPw(encPw);
			logger.info("암호화 값 : {}", encPw);
			boolean isJoin = userService.getJoinCheck(user);
			if(isJoin) {
				return true;	
			}else {
				return false;
			}
		}else {
			return false;
		}
		
	}
	
	@RequestMapping(value="/check/id", method=RequestMethod.POST)
	public @ResponseBody boolean checkId(User user) {
		logger.info("checkId called");
		logger.info("id : {}", user.getId());
		boolean isIdExist = userService.searchId(user);
		logger.info("{}",isIdExist);
		return isIdExist;
	}
	
	@RequestMapping(value="/check/email", method=RequestMethod.POST)
	public @ResponseBody boolean checkEmail(User user) {
		logger.info("checkEmail called");
		logger.info("email : {}", user.getEmail());
		boolean isEmailExist = userService.searchEmail(user);
		logger.info("{}",isEmailExist);
		return isEmailExist;
	}
	
	@RequestMapping(value="/check/nick", method=RequestMethod.POST)
	public @ResponseBody boolean checkNick(User user) {
		logger.info("checkNick called");
		logger.info("email : {}", user.getEmail());
		boolean isEmailExist = userService.searchNick(user);
		logger.info("{}",isEmailExist);
		return isEmailExist;
	}
	//이거도 아직...
	@RequestMapping(value="/social/join", method=RequestMethod.GET)
	public String socialJoin(SocialAccount social) {
		logger.info("/social/join");
		return null;
	}
	
	//이거 모름....
	@RequestMapping(value="/social/join", method=RequestMethod.POST)
	public String socialLogin() {
		logger.info("/social/login");
		return null;
	}
	
	@RequestMapping(value="/mypage")
	public void myPage() {
		logger.info("/mypage");
	}
	
	@RequestMapping(value="/check/password", method=RequestMethod.GET)
	public void checkPassword() {
		logger.info("/check/password [GET]");
	}
	
	@RequestMapping(value="/check/password", method=RequestMethod.POST)
	public void checkPasswordProc(String pw, HttpSession session) {
		
		logger.info("/check/password [POST]");
		
		String pwSalt = pw;
		
		int userno = 0;
		
		boolean pwCheck = userService.getCheckPassword(pwSalt, userno);
	}
	
	@RequestMapping(value="/pw/update", method=RequestMethod.GET)
	public void pwUpdate() {
		logger.info("/pw/update [GET]");
	}
	
	@RequestMapping(value="/pw/update", method=RequestMethod.POST)
	public String pwUpdateProc(String pw, String pwChk, HttpSession session) {
		logger.info("/pw/update [POST]");
		int userno = 0;
		
		String pwSalt = pw;
		String pwChkSalt = pwChk;
		
		boolean isUpdate = userService.setUpdatePw(pwSalt, pwChkSalt, userno);
		
		return null;
	}
	
	@RequestMapping(value="/delete")
	public void userDelete(int userno) {
		logger.info("/delete [GET]");
		userService.deleteUser(userno);
	}
	
	@RequestMapping(value="/view/extagram/history", method=RequestMethod.GET)
	public void viewExtraHistory(int userNo) {
		logger.info("/search/history [GET]");
		List<Extagram> extagram = userService.getExtaHistory(userNo);
		
	}
	
	@RequestMapping(value="/search/extagram/history", method=RequestMethod.POST)
	public void searchExtaHistory(int userNo, String search) {
		logger.info("/search/history [POST]");
		List<Extagram> extagram = userService.searchExtaHistory(search, userNo);
	}
	
	@RequestMapping(value="/view/comment/history", method=RequestMethod.GET)
	public void viewCommentHistory(int userNo) {
		logger.info("/search/history [GET]");
		List<ExComm> exComm = userService.getHistory(userNo);
		
	}

	@RequestMapping(value="/search/comment/history", method=RequestMethod.POST)
	public void searchCommentHistory(int userNo, String search) {
		logger.info("/search/history [POST]");
		List<ExComm> exComm = userService.searchCommentHistory(search, userNo);
	}
	
	@RequestMapping(value="/main")
	public void main() {
		logger.info("임시 메인 페이지 접속");
	}
	
	@RequestMapping(value="/profile")
	public String profile(User user, FileUpload file, HttpSession session, Model model) {
		logger.info("프로필 정보 ajax 통신 접속");
		user.setUserNo((Integer)session.getAttribute("userNo"));
		user = userService.getUserInfo(user);
		file = userService.getFileInfo(user);
		model.addAttribute("user", user);
		model.addAttribute("file", file);
		
		return "profile";
	}
	@Autowired private JavaMailSenderImpl mailSender;

	@RequestMapping(value="/send/mail", method=RequestMethod.POST)
	public @ResponseBody boolean sendMail(String mail, HttpSession session, Random random) {
		logger.info("인증번호 메일 전송");

		String authKey="";
		
        int size = 6;
        int num = 0;
        
        for(int i = 0; i< size; i++) {
        	num = (int) (Math.random()*10);
        	authKey += num; 
        }
        
        //인증메일 보내기
        MimeMessage mailSend = mailSender.createMimeMessage();
        String mailContent = "<h1>[이메일 인증]</h1><br><p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>" 
                            +"<p> 인증 번호 : " + authKey + "</p>";

        try {
            mailSend.setSubject("회원가입 이메일 인증 ", "utf-8");
            mailSend.setText(mailContent, "utf-8", "html");
            mailSend.setRecipients(Message.RecipientType.TO, mail);
            mailSender.send(mailSend);
            logger.info("인증키 : " + authKey);

            //세션에 인증키 + 메일 주소 저장
            session.setAttribute("mail", mail);
            session.setAttribute("authKey", authKey);
            
            session.setMaxInactiveInterval(5*60); //5분뒤 세션값 삭제
            
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
        return true;
	}
	
	@RequestMapping(value="/session/call")
	public @ResponseBody boolean sessionCall(String authKey, HttpSession session) {
		String authKey2 = (String) session.getAttribute("authKey");
		logger.info("{} , {}", authKey, authKey2);
		if(authKey.equals(authKey2)) {
			logger.info("인증키 일치");
			session.invalidate();
			return true;
		}
		
		return false;
	}
}
