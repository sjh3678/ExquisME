package web.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import web.dto.ExComm;
import web.dto.Extagram;
import web.dto.FileUpload;
import web.dto.Layer;
import web.dto.Report;
import web.dto.User;
import web.service.face.ExtaService;
import web.service.face.LayerService;
import web.service.face.UserService;
import web.util.PagingUserHistory;
import web.util.PagingUserHistory2;
import web.util.UserSHA256;

@Controller
@RequestMapping(value="/user")
public class UserController {
		
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired private UserService userService;
	@Autowired private ExtaService extaService;
	@Autowired private LayerService layerService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() {
		logger.info("/login [GET]");
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public @ResponseBody String loginProc(User user, Report report, HttpSession session, Model model){
		logger.info("/login [POST]");
		
		//비밀번호 암호화
		String encPw = UserSHA256.encrypt(user);
		
		user.setPw(encPw);
		
		boolean isLogin = userService.getLoginCheck(user);
		logger.info("회원정보 매칭 여부 : {}", isLogin);
		
		if(isLogin) {
			
			user = userService.getUserInfo(user);
			
			//신고 여부 조회
			boolean isReport = userService.getCheckReport(user);
			
			logger.info("제재결과 존재 여부 : {}", isReport);
			
			if(isReport) {
				report = userService.getReportInfo(user, report);
				int dateNumber = new Date().compareTo( report.getExpireDate());
				if(dateNumber < 0) {
					logger.info("로그인 거부");
					return "ban";
				}
				
			}
			session.setAttribute("login", isLogin);
			session.setAttribute("admin", user.getIsAdmin());
			session.setAttribute("nick", user.getNick() );
			session.setAttribute("userNo", user.getUserNo() );
			session.setMaxInactiveInterval(180*60); //3시간뒤 세션값 삭제
			int userNo = ((Integer)(session.getAttribute("userNo"))).intValue();
			logger.info("[로그인 성공] 회원번호 : {}",userNo);
			return "success";
		}
		return "fail";
		
	}
	
	@RequestMapping(value="/social/login", method=RequestMethod.GET)
	public @ResponseBody String socialLogin(User user, Report report,HttpSession session) {
		logger.info("socialLogin called 전달값 : {}", user);
		user= userService.getUserInfoByEmail(user);
		
		user = userService.getUserInfo(user);
		
		//신고 여부 조회
		boolean isReport = userService.getCheckReport(user);
		logger.info("신고 조회결과 : {}", isReport);
		if(isReport) {
			report = userService.getReportInfo(user, report);
			
			//두 날짜를 비교해서 같으면 0, 작으면 음수, 크면 양수 
			int dateNumber = new Date().compareTo( report.getExpireDate());
			if( dateNumber < 0 ) {
	        	logger.info("제재된 유저 [로그인 거부]");
				return "ban";
			}
		}
		
		if(user != null) { // 조회결과가 존재할때
			logger.info("로그인 성공");
			user = userService.getUserInfoByEmail(user);
			session.setAttribute("login", true);
			session.setAttribute("nick", user.getNick());
			session.setAttribute("userNo", user.getUserNo());
			
			return "true";
		}else {//조회결과 없을 때
			logger.info("조회결과 없음 추가정보 입력 및 소셜 가입페이지 이동");
			return "false";
		}
	}

	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		logger.info("/logout");
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/social/join", method=RequestMethod.GET)
	public void socialJoin(User user, Model model) {
		 model.addAttribute("user", user);
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
		boolean isEmailExist = false;
		isEmailExist = userService.searchEmail(user);
		logger.info("{}",isEmailExist);
		return isEmailExist;
	}
	
	@RequestMapping(value="/check/nick", method=RequestMethod.POST)
	public @ResponseBody boolean checkNick(User user, HttpSession session) {
		logger.info("checkNick called");
		logger.info("email : {}", user.getEmail());
		if(session.getAttribute("userNo") != null)
			user.setUserNo((Integer)session.getAttribute("userNo"));
		boolean isNickExist = false;
		isNickExist = userService.searchNick(user);
		logger.info("{}",isNickExist);
		return isNickExist;
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
	public @ResponseBody boolean pwUpdateProc(User user, String pwChk, HttpSession session) {
		logger.info("/pw/update [POST]");
		
		int userNo = (Integer) session.getAttribute("userNo");
		user.setUserNo(userNo);
		user.setPw(pwChk); // 암호화 전
		pwChk = UserSHA256.encrypt(user); // 확인값 암호화
		user.setPw(user.getPw()); // 암호화 전
		user.setPw(UserSHA256.encrypt(user)); // 변경값 암호화 후 저장
		
		boolean pwCheck = userService.getCheckPw(user.getPw(), userNo);
		logger.info("비밀번호 중복 : {}", pwCheck);
		
		//비밀번호 중복검사
		if(pwCheck) {
			return false;
		}else {
			boolean isUpdate = userService.setUpdatePw(user, pwChk);
			logger.info("결과 : {}", isUpdate);
			return isUpdate;
		}
	}
	@RequestMapping(value="/pw/check", method=RequestMethod.POST)
	public @ResponseBody boolean pwCheck(User user, HttpSession session) {
		int userNo = (Integer) session.getAttribute("userNo");
		user.setUserNo(userNo);

		user.setPw(user.getPw()); // 암호화 전
		user.setPw(UserSHA256.encrypt(user)); // 변경값 암호화 후 저장
		
		boolean pwCheck = userService.getCheckPassword(user.getPw(), userNo);
		logger.info("비밀번호 중복 : {}", pwCheck);
		
		//비밀번호 중복검사
		if(pwCheck) {
			return true;
		}
		return false;
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
	public String profileUpdate(User user, MultipartFile file, String emailCheck,
			FileUpload fileUpload, HttpSession session, Model model) {
		if(emailCheck == null || emailCheck.equals("")) {
			logger.info("[정보 수정 실패] 인증키 값이 없음");
			return "redirect:/user/mypage";
		}
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
		if(!isUpdate) {
			logger.info("회원정보 수정 실패");
		}
		return "redirect:/user/mypage";
	}

	@RequestMapping(value="/send/mail", method=RequestMethod.POST)
	public @ResponseBody boolean sendMail(String mail, HttpSession session, Random random) {
		logger.info("인증번호 메일 전송");
		
		boolean isSendAuthKey = userService.sendMailAuthKey(mail, session, random);
		logger.info("메일 전송 여부 : {}", isSendAuthKey);
		return isSendAuthKey;
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
		
		boolean isSendId = userService.sendMailId(user, questionNo, questionAnswer);
		logger.info("메일 전송 결과 : {}", isSendId);
    	return isSendId;

	}
	
	@RequestMapping(value="/search/pw")
	public @ResponseBody boolean searchPw(User user) {
		logger.info("전달값 : {}", user);
		String id = user.getId();

		
		int questionNo = user.getQuestionNo();
		String questionAnswer = user.getQuestionAnwser();
		
		user = userService.getUserInfoByEmail(user);
		
		boolean isSendPw = userService.sendMailPw(user, id, questionNo, questionAnswer);		
		logger.info("전송 결과{}",isSendPw);
		return isSendPw;
	}
	
	@RequestMapping(value="/recode")
	public String callRecode() {
		return "user/recode";
	}
	
	@RequestMapping(value="/recode/extagram")
	public String extagramRecode(User user, 
			HttpSession session, 
			Model model,
			PagingUserHistory paramData) {
		user.setUserNo((Integer) session.getAttribute("userNo"));
		logger.info("user : {}", user);
		PagingUserHistory paging = userService.getExtaPaging2(paramData, user);
		logger.info("페이징 : {}", paging);
		user.setUserNo((Integer) session.getAttribute("userNo"));
		List<Map<String, Object>> list = userService.getUserExtagramHistory2(user, paging); 
		model.addAttribute("paging", paging);
		model.addAttribute("extaList", list);
		return "/user/history/extagram";
	}
	
	@RequestMapping(value="/recode/comment")
	public String commentRecode(User user, 
			HttpSession session, 
			Model model,
			PagingUserHistory2 paramData) {
		user.setUserNo((Integer) session.getAttribute("userNo"));
		logger.info("user : {}", user);
		PagingUserHistory2 paging = userService.getCommPaging2(paramData, user);
		logger.info("페이징 : {}", paging);
		user.setUserNo((Integer) session.getAttribute("userNo"));
		List<Map<String, Object>> list = userService.getUsercommentHistory2(user, paging); 
		model.addAttribute("paging", paging);
		model.addAttribute("commList", list);
		return "/user/history/comment";
	}
	
	@RequestMapping(value="/recode/layer")
	public String layerRecode(User user, 
			HttpSession session, 
			Model model,
			PagingUserHistory2 paramData) {
		user.setUserNo((Integer) session.getAttribute("userNo"));
		logger.info("user : {}", user);
		PagingUserHistory2 paging = userService.getLayerPaging2(paramData, user);
		logger.info("페이징 : {}", paging);
		user.setUserNo((Integer) session.getAttribute("userNo"));
		List<Map<String, Object>> list = userService.getUserLayerHistory2(user, paging); 
		model.addAttribute("paging", paging);
		model.addAttribute("layerList", list);
		return "/user/history/layer";
	}
	
	
	@RequestMapping(value = "/mypage/extaDelete", method = RequestMethod.GET)
	public String extaDelete(Extagram extagram, HttpSession session) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		
		if(extagram.getUserNo() == userNo) {
			extaService.deleteExta(extagram);
		}
		return "redirect:/user/mypage";
	}
	@RequestMapping(value = "/mypage/extaCommentDelete", method = RequestMethod.GET)
	public String extaCommentDelete(ExComm comment, HttpSession session) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		
		ExComm comm = extaService.getInfoComment(comment);
		
		if(comment.getUserNo() == userNo) {
			extaService.deleteComment(comm);
		}
		return "redirect:/user/mypage";
	}
	
	@RequestMapping(value = "/mypage/layerDelete", method = RequestMethod.GET)
	public String layerDelete(Layer layer, HttpSession session) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		
		if(layer.getUserNo() == userNo) {
			int layerNo = layer.getLayeringNo();
			
			layerService.deleteLayer(layerNo);
		}
		return "redirect:/user/mypage";
	}
}
