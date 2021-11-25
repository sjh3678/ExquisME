package web.controller;

import java.util.List;
import java.util.Map;
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
import org.springframework.web.multipart.MultipartFile;

import web.dto.FileUpload;
import web.dto.User;
import web.service.face.UserService;
import web.util.PagingExtagram;
import web.util.UserSHA256;

@Controller
@RequestMapping(value="/user")
public class UserController {
		
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired private UserService userService;
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() {
		logger.info("/login [GET]");
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public @ResponseBody boolean loginProc( User user, HttpSession session){
		logger.info("/login [POST]");
		
		//비밀번호 암호화
		String encPw = UserSHA256.encrypt(user);
		
		user.setPw(encPw);
		
		boolean isLogin = userService.getLoginCheck(user);
		logger.info("로그인 성공 여부 : {}", isLogin);
		if(isLogin) {
			
			user = userService.getUserInfo(user);
			
			session.setAttribute("login", isLogin);
			session.setAttribute("admin", user.getIsAdmin());
			session.setAttribute("nick", user.getNick() );
			session.setAttribute("userNo", user.getUserNo() );
			session.setMaxInactiveInterval(180*60); //3시간뒤 세션값 삭제
			int userNo = ((Integer)(session.getAttribute("userNo"))).intValue();
			logger.info("{}",userNo);
			return true;
		}else {
			return false;
		}
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		logger.info("/logout");
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void join() {
		logger.info("/join [GET]");
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public @ResponseBody boolean joinProc(User user, String pwCheck
			,HttpSession session) {
		logger.info("/join [POST] {}", user);
		logger.info("생일 날짜 : {}", user.getBirth());

		
		if(user.getPw().equals(pwCheck)) {
			String encPw = UserSHA256.encrypt(user);
			user.setPw(encPw);
			logger.info("암호화 값 : {}", encPw);
			boolean isJoin = userService.getJoinCheck(user);
			if(isJoin) {
				if(session.getAttribute("authKey") != null)
					session.removeAttribute("authKey");
				return true;	
			}else {
				return false;
			}
		}else {
			return false;
		}
		
	}
	
	@RequestMapping(value="/check/id", method=RequestMethod.POST)
	public @ResponseBody boolean checkId(User user, HttpSession session) {
		logger.info("checkId called");
		logger.info("id : {}", user.getId());

		boolean isIdExist = userService.searchId(user);
		logger.info("{}",isIdExist);
		return isIdExist;
	}
	
	@RequestMapping(value="/check/email", method=RequestMethod.POST)
	public @ResponseBody boolean checkEmail(User user, HttpSession session) {
		logger.info("checkEmail called");
		logger.info("email : {}", user.getEmail());
		if(session.getAttribute("userNo") != null)
			user.setUserNo((Integer)session.getAttribute("userNo"));
		boolean isEmailExist = userService.searchEmail(user);
		logger.info("{}",isEmailExist);
		return isEmailExist;
	}
	
	@RequestMapping(value="/check/nick", method=RequestMethod.POST)
	public @ResponseBody boolean checkNick(User user, HttpSession session) {
		logger.info("checkNick called");
		logger.info("email : {}", user.getEmail());
		if(session.getAttribute("userNo") != null)
			user.setUserNo((Integer)session.getAttribute("userNo"));
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
	public String userDeleteProc(HttpSession session) {
		logger.info("/delete [POST]");
		int userNo = (Integer) session.getAttribute("userNo");
		boolean isDelete = userService.deleteUser(userNo);
		
		if(isDelete) {
			session.invalidate();
			return "redirect:/";
		}else {
			return "redirect:/user/mypage";
		}
	}
	
	@RequestMapping(value="/profile", method=RequestMethod.GET)
	public String profile(User user, FileUpload file, HttpSession session, Model model) {
		logger.info("프로필 정보 ajax 통신 접속");
		user.setUserNo((Integer)session.getAttribute("userNo"));
		logger.info("유저 번호 : {}",user.getUserNo());
		logger.info("before 유저 정보 : {}", user);
		user = userService.getUserProfile(user);
		logger.info("after 유저 정보 : {}", user);
		file = userService.getFileInfo(user);
		logger.info("after 파일 정보 : {}", file);
		model.addAttribute("user", user);
		model.addAttribute("file", file);
		
		return "user/profile";
	}
	
	@RequestMapping(value="/profile", method=RequestMethod.POST)
	public String profileUpdate(User user, 
			MultipartFile file, 
			FileUpload fileUpload, HttpSession session, Model model) {
		
		logger.info("profileUpdate called");
		user.setUserNo((Integer)session.getAttribute("userNo"));
		
		boolean isUpdate = true;
		logger.info("file : {}", file);
		if(file != null) {
			fileUpload = userService.updateProfileFile(user, file);
			user.setFileNo(fileUpload.getFileNo());
		}
		isUpdate = userService.updateUserInfo(user);
		
		if(session.getAttribute("authKey") != null) {
			//인증키 값 삭제
			session.removeAttribute("authKey");
		}
		return "redirect:/user/mypage";
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
        String mailContent = "<h1>[이메일 인증]</h1><br><p>아래 인증키를 입력창에 입력하시면 이메일 인증이 완료됩니다.</p>" 
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
			
			return true;
		}

		return false;
	}
	
	@RequestMapping(value="/search/id")
	public @ResponseBody boolean searchId(User user) {
		logger.info("전달값 : {}", user);
		
		int questionNo = user.getQuestionNo();
		String questionAnswer = user.getQuestionAnwser();
		
		user = userService.getUserInfoByEmail(user);
		
		logger.info("아이디 : {}" + user.getId());
		if(questionNo != user.getQuestionNo()) {
			logger.info("질문 틀림");
			return false;
		}
		
		if(!questionAnswer.equals(user.getQuestionAnwser())) {
			logger.info("답 틀림");
			return false;
		}
		
		if(user.getId() != null) {
        	MimeMessage mailSend = mailSender.createMimeMessage();
        	String mailContent = "<h1>[아이디 찾기]</h1><br><p>하단에 적힌 아이디가 본 사이트에 접속가능한 회원님의 아이디입니다.</p>" 
                    +"<p> 회원의 아이디 : " + user.getId() + "</p>";
        	try {
                mailSend.setSubject("아이디 찾기 ", "utf-8");
                mailSend.setText(mailContent, "utf-8", "html");
                mailSend.setRecipients(Message.RecipientType.TO, user.getEmail());
                mailSender.send(mailSend);
                logger.info("아이디 : {}" + user.getId());
     
                return true;   
            } catch (MessagingException e) {
                e.printStackTrace();
                return false;
            }
        }
        logger.info("조회된 결과 없음 [ERROR]");
		return false;
	}
	
	@RequestMapping(value="/search/pw")
	public @ResponseBody boolean searchPw(User user) {
		logger.info("전달값 : {}", user);
		String id = user.getId();
		
		int questionNo = user.getQuestionNo();
		String questionAnswer = user.getQuestionAnwser();
		
		user = userService.getUserInfoByEmail(user);
		
		logger.info("아이디 :" + user.getId());
		String pw = "";
		
		if(questionNo != user.getQuestionNo()) {
			logger.info("질문 틀림");
			return false;
		}
		
		if(!questionAnswer.equals(user.getQuestionAnwser())) {
			logger.info("답 틀림");
			return false;
		}
		
		if(!id.equals(user.getId())) {
			logger.info("회원 아이디 불일치");
			return false;
		}else {
			
			//문자열 6자리 랜덤 생성
			int leftLimit = 97; // letter 'a'
			int rightLimit = 122; // letter 'z' -> a~z까지의 문자열 조합
			int targetStringLength = 6; // 문자열 길이 설정
			Random random = new Random();
			StringBuilder buffer = new StringBuilder(targetStringLength); // 버퍼를 통해 문자열 생성
			for (int i = 0; i < targetStringLength; i++) {
			    int randomLimitedInt = leftLimit + (int)
			            (random.nextFloat() * (rightLimit - leftLimit + 1));
			    buffer.append((char) randomLimitedInt);
			}//버퍼에 append를 통해 랜덤으로 생성한 문자열을 조합
			String generatedString = buffer.toString();
			pw += generatedString;
			
			//숫자 6자리 랜덤 생성
	        int size = 6;
	        int num = 0;
	        
	        for(int i = 0; i< size; i++) {
	        	num = (int) (Math.random()*10);
	        	pw += num; 
	        	user.setPw(pw);
	        }
	        
	        //비밀번호 암호화
	        user.setPw(UserSHA256.encrypt(user));
	        
	        //비밀번호 변경 서비스 호출
	        boolean isUpdate = userService.setUpdatePw(user, user.getPw());
	        
	        if(!isUpdate) {
	        	logger.info("임시 비밀번호 변경 실패");
	        	return false;
	        }
		}
		
		if(user.getId() != null) {
        	MimeMessage mailSend = mailSender.createMimeMessage();
        	String mailContent = "<h1>[비밀번호 찾기]</h1><br><p>하단에 적힌 비밀번호로 접속하여 안전한 비밀번호로 변경해주세요.</p>" 
                    +"<p> 회원의 임시 비밀번호 : " + pw + "</p>";
        	try {
                mailSend.setSubject("임시 비밀번호 발송 ", "utf-8");
                mailSend.setText(mailContent, "utf-8", "html");
                mailSend.setRecipients(Message.RecipientType.TO, user.getEmail());
                mailSender.send(mailSend);
                
                return true;   
            } catch (MessagingException e) {
                e.printStackTrace();
                return false;
            }
        }
        logger.info("조회된 결과 없음 [ERROR]");
		return false;
	}
	
	@RequestMapping(value="/recode")
	public String callRecode() {
		return "user/recode";
	}
	
	@RequestMapping(value="/recode/extagram")
	public String extagramRecode(User user, 
			HttpSession session, 
			Model model,
			PagingExtagram paramData) {
		user.setUserNo((Integer) session.getAttribute("userNo"));
		logger.info("user : {}", user);
		PagingExtagram paging = userService.getExtaPaging(paramData, user);
		logger.info("페이징 : {}", paging);
		user.setUserNo((Integer) session.getAttribute("userNo"));
		List<Map<String, Object>> list = userService.getUserExtagramHistory(user, paging); 
		model.addAttribute("paging", paging);
		model.addAttribute("extaList", list);
		return "/user/history/extagram";
	}
	
	@RequestMapping(value="/recode/comment")
	public String commentRecode(User user, 
			HttpSession session, 
			Model model,
			PagingExtagram paramData) {
		user.setUserNo((Integer) session.getAttribute("userNo"));
		logger.info("user : {}", user);
		PagingExtagram paging = userService.getCommPaging(paramData, user);
		logger.info("페이징 : {}", paging);
		user.setUserNo((Integer) session.getAttribute("userNo"));
		List<Map<String, Object>> list = userService.getUsercommentHistory(user, paging); 
		model.addAttribute("paging", paging);
		model.addAttribute("commList", list);
		return "/user/history/comment";
	}
	
	@RequestMapping(value="/social/join", method=RequestMethod.GET)
	public String socialLogin(User user, Model model,HttpSession session) {
		logger.info("socialLogin called 전달값 : {}", user);
		boolean isJoin = userService.isJoinUser(user);
		logger.info("조회결과 : {}", isJoin);
		if(isJoin) { // 조회결과가 존재할때
			user = userService.getUserInfoByEmail(user);
			session.setAttribute("login", isJoin);
			session.setAttribute("nick", user.getNick());
			session.setAttribute("userNo", user.getUserNo());
			logger.info("userNo : {}",session.getAttribute("userNo"));
			
			return "redirect:/";
		}else {//조회결과 없을 때
			model.addAttribute("user", user);
			return "user/social/join";
		}
	}
}
