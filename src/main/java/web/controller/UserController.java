package web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

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
import web.dto.FileUpload;
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
			session.setMaxInactiveInterval(180*60); //3시간뒤 세션값 삭제
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
	
	@RequestMapping(value="/mypage")
	public void myPage() {
		logger.info("/mypage");
	}
	
	@RequestMapping(value="/check/password", method=RequestMethod.POST)
	public @ResponseBody boolean checkPassword(User user, HttpSession session) {
		logger.info("/check/password [POST] {}", user);
		
		int userNo = (Integer) session.getAttribute("userNo");
		user.setPw(UserSHA256.encrypt(user)); // 암호화 값 적용
		logger.info("{}", user.getPw());
		boolean pwCheck = userService.getCheckPassword(user.getPw(), userNo);
		if(pwCheck)
			logger.info("비밀번호 인증됨");
		else  
			logger.info("비밀번호 인증 실패");
		return pwCheck;
	}
	
	@RequestMapping(value="/pw/update", method=RequestMethod.GET)
	public String pwUpdate() {
		logger.info("/pw/update [GET]");
		return "user/pwChange";
	}
	
	@RequestMapping(value="/pw/update", method=RequestMethod.POST)
	public @ResponseBody boolean pwUpdateProc(String pw, String pwChk, HttpSession session) {
		logger.info("/pw/update [POST]");
		User user = new User();
		int userNo = (Integer) session.getAttribute("userNo");
		user.setUserNo(userNo);
		user.setPw(pwChk); // 암호화 전
		pwChk = UserSHA256.encrypt(user); // 확인값 암호화
		user.setPw(pw); // 암호화 전
		user.setPw(UserSHA256.encrypt(user)); // 변경값 암호화 후 저장
		
		boolean isUpdate = userService.setUpdatePw(user, pwChk);
		logger.info("결과 : {}",isUpdate);
		return isUpdate;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String userDelete() {
		logger.info("/delete [GET]");
		return "user/delete";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public boolean userDeleteProc(HttpSession session) {
		logger.info("/delete [POST]");
		int userNo = (Integer) session.getAttribute("userNo");
		boolean isDelete = userService.deleteUser(userNo);
		return true;
	}
		
	@RequestMapping(value="/main")
	public void main() {
		logger.info("임시 메인 페이지 접속");
	}
	
	@RequestMapping(value="/profile")
	public String profile(User user, FileUpload file, HttpSession session, Model model) {
		logger.info("프로필 정보 ajax 통신 접속");
		user.setUserNo((Integer)session.getAttribute("userNo"));
		logger.info("유저 번호 : {}",user.getUserNo());
		logger.info("before 유저 정보 : {}", user);
		user = userService.getUserProfile(user);
		logger.info("after 유저 정보 : {}", user);
		file = userService.getFileInfo(user);
		logger.info("after 유저 정보 : {}", file);
		model.addAttribute("user", user);
		model.addAttribute("file", file);
		
		return "user/profile";
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
	
	@RequestMapping(value="/history")
	public void userHistory(User user, FileUpload file, Extagram ex, ExComm exComm, Model model ) {
		logger.info("유저 개인기록 조회");
	}
	
}
