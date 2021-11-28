package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.UserDao;
import web.dto.Extagram;
import web.dto.FileUpload;
import web.dto.Layer;
import web.dto.Report;
import web.dto.User;
import web.service.face.UserService;
import web.util.PagingExtagram;
import web.util.PagingUser;
import web.util.PagingUserHistory;
import web.util.PagingUserHistory2;
import web.util.UserSHA256;


@Service
public class UserServiceImpl implements UserService{
	
	@Autowired UserDao userDao;
	
	@Autowired ServletContext context;
	
	private Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Override
	public boolean getLoginCheck(User param) {
		logger.info("getLoginChk called");
		
		int userCnt = userDao.selectUserCnt(param);
		logger.info("userCnt : {}", userCnt);
		if(userCnt == 1) {
			//아이디 매칭 성공
			logger.info("아이디 매칭 성공");
			
			User user = userDao.selectUserById(param);// 유저 정보 조회
			logger.info("비밀번호 매칭 여부 : {}", param.getPw().equals(user.getPw()));
			
			//해시값 비교
			if(param.getPw().equals(user.getPw())) {
				//로그인 성공
				logger.info("로그인 성공");
				return true;
			}else {
				//로그인 실패
				logger.info("로그인 실패");
				return false;
			}
				
		}else {
			//로그인 실패
			logger.info("로그인 실패");
			return false;
		}

	}
	
	@Override
	public boolean getJoinCheck(User param) {
		
		logger.info("getJoinCheck called");
		
		//아이디 중복검사
		int userCnt = userDao.selectUserCnt(param);
		
		if(userCnt == 0) {
			//회원가입 가능
			userDao.insertUserJoin(param);
			return true;
		}else {
			//아이디 중복 - 회원가입 실패
			return false;
		}

	}
	
	@Override
	public boolean getCheckPassword(String pw, int userNo) {
		
		logger.info("getCheckPassword called");
		
		User user = userDao.selectUserByUserno(userNo);
		
		if(pw.equals(user.getPw())) {
			//비밀번호 일치
			return true;
		}else {
			//비밀번호 불일치
			return false;
		}
	}
	
	@Override
	public boolean setUpdatePw(User user, String pwChk) {
		
		logger.info("setChangePw called");
		logger.info("변경값 : {}", user.getPw());
		logger.info("확인값 : {}",pwChk);
		//변경값 확인
		if(user.getPw().equals(pwChk)) {
			
			//비밀번호 변경
			userDao.updatePw(user);
			
			return true;
		}else {
			//변경할 비밀번호와 확인값이 맞지 않음
			return false;
		}
	}
	
	@Override
	public User getUserNickByUserno(User param) {
		User user = userDao.selectUserByUserno(param.getUserNo());
		return user;
	}
	
	@Override
	public boolean deleteUser(int userNo) {
		logger.info("deleteUser called {}", userNo);
		
		User user = new User();
		
		//사용자 정보 조회
		user = userDao.selectUserByUserno(userNo);
		int cnt = userDao.selectExtaCntByUserNo2(userNo);
		if(cnt != 0) {
			List<Extagram> extaList = userDao.selectExtaListByUserNo(userNo);
			logger.info("리스트 : {}", extaList);
			for(Extagram e : extaList) {
				userDao.deleteCommByUserNo(e);//댓글 내역 삭제
			}
			logger.info("댓글 삭제");
		
			for(Extagram e : extaList) {
				userDao.deleteExtaLikeUserNo(e);//좋아요 내역 삭제
			}
			logger.info("좋아요 삭제");
		
			userDao.deleteExtaByUserNo(userNo);//extagram 내역 삭제	
			logger.info("extagram 삭제");
	
			for(Extagram e : extaList) {
				userDao.deleteFileByFileNo(e.getFileNo()); // 파일 삭제
			}
		}else {
			Extagram exta = new Extagram();
			exta.setUserNo(userNo);
			userDao.deleteCommByUserNo(exta);//댓글 내역 삭제
			userDao.deleteExtaLikeUserNo(exta);//좋아요 내역 삭제
		}
		logger.info("파일 삭제");
		logger.info("extagram 연결 요소 삭제 완료");
		
		cnt = userDao.selectLayerCntByUserNo2(userNo);
		
		if(cnt > 0) {
			logger.info("등록된 레이어링 존재");
			List<Layer> layerList = userDao.selectLayerListByUserNo(userNo);
			for(Layer l : layerList) {	
				userDao.deleteLayerLikeByUserNo(l); //레이어링 좋아요 삭제
			}
			logger.info("layering 연결 요소 모두 삭제");
			
			userDao.deleteLayerByUserNo(userNo); // 레이어링 삭제
			
		}else {
			logger.info("등록된 레이어링 없음");
			Layer ulayer = new Layer();
			ulayer.setUserNo(userNo);
			userDao.deleteLayerLikeByUserNo(ulayer); //레이어링 좋아요 삭제
		}
		
		logger.info("layering 연결 요소 삭제 완료");
		
		userDao.deleteNoteLikeByUserNo(userNo);//노트 좋아요 삭제
		userDao.deletePerfLikeByUserNo(userNo); // 향수 좋아요 삭제
		
		if(user.getIsAdmin().equals("A") || user.getIsAdmin().equals("S")) {
			//관리자
			userDao.deleteFaqByUserNo(userNo);// 자주묻는 질문 삭제
			userDao.deleteNoticeByUserNo(userNo); // 공지사항 삭제
		}
		
		int fileNo = user.getFileNo(); // 프로필 사진 정보
		
		//회원정보 삭제
		userDao.deleteUserByUserNo(userNo);
		
		if(fileNo != 91) {
			userDao.deleteFileByFileNo(user.getFileNo()); // 프로필 사진 삭제 (기본 프로필 제외)
		}
		
		cnt = userDao.selectUserCnt(user);
		
		logger.info("cnt : {}", cnt);
		if(cnt == 0) {
			logger.info("삭제 성공");
			return true;
		}
		return false;
	}

	@Override
	public User getUserInfo(User user) {
		logger.info("getUserInfo called");
		
		//회원의 세부정보 조회
		user = userDao.selectUserById(user);
		
		return user;
	}

	@Override
	public boolean searchId(User user) {
		System.out.println(user);
		int cnt = userDao.selectUserCnt(user);
		if(cnt == 0) {
			logger.info("매칭된 아이디 없음");
			return false;	
		}
		logger.info("아이디 중복");
		return true;
		
	}

	@Override
	public boolean searchEmail(User user) {
		int cnt = userDao.selectUserCnt(user);
		boolean isChecked = true;
		
		if(cnt == 0) {
			logger.info("매칭된 이메일 없음");
			 isChecked = false;	
		}else {
			logger.info("이메일 중복");
			isChecked = true;
		}
		
		if(user.getUserNo() != 0) {
			String email = user.getEmail();
			logger.info("email : {}", email);
			
			user = userDao.selectUserByUserno(user.getUserNo());
			
			if(!email.equals(user.getEmail()) || email.equals("")) {
				logger.info("비어있거나 형식에 맞지않는 이메일");
				isChecked = true;
			}else {
				logger.info("유효한 형식");
				isChecked = false;
			}
		}

		return isChecked;
	}

	@Override
	public boolean searchNick(User user) {
		int cnt = userDao.selectUserCnt(user);
		boolean isChecked = true;
		
		if(cnt == 0) {
			logger.info("매칭된 닉네임 없음");
			isChecked =  false;	
		}else {
			logger.info("닉네임 중복");
			isChecked = true;
		}
		
		if(user.getUserNo() != 0) {
			String nick = user.getNick();
			user = userDao.selectUserByUserno(user.getUserNo());
			if(!nick.equals(user.getNick()) || nick.equals("")) {
				logger.info("비어있거나 형식에 맞지않는 닉네임");
				isChecked = true;
			}else {
				logger.info("유효한 형식");
				isChecked = false;
			}
		}

		return isChecked;
	}

	@Override
	public FileUpload getFileInfo(User user) {
		logger.info("회원 프로필 파일정보 조회 {}", user.getFileNo());
		int fileNo = user.getFileNo();
		FileUpload file = userDao.selectFileByFileNo(fileNo);
		return file;
	}

	@Override
	public User getUserProfile(User user) {
		logger.info("getUserProfile called {}", user.getUserNo());
		int userNo = user.getUserNo();
		return userDao.selectUserByUserno(userNo);
	}

	@Override
	public FileUpload updateProfileFile(User user, MultipartFile fileUpload) {
		logger.info("유저 프로필 정보 수정");
		//유저 이전 정보 조회
		user = userDao.selectUserByUserno(user.getUserNo());
		logger.info("파일 크기 : {}", fileUpload.getSize() );
		
		if(fileUpload.getSize() <= 0) {
			logger.info("파일의 크기가 0, 처리 중단");
			logger.info("파일 없음");
			
			//기본 프로필 사진 파일 번호
			int fileNo = 91;
			
			//회원의 기존 프로필로 변경
			if(user.getFileNo() != 91) {
				fileNo = user.getFileNo();
			}
			
			return userDao.selectFileByFileNo(fileNo);
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		logger.info("upload realPath : {}", storedPath);
		
		//upload폴더가 없으면 생성
		File storedFolder = new File(storedPath);
		if(!storedFolder.exists()) {
			storedFolder.mkdir();
		}
		
		//저장될 파일의 이름 생성
		String filename = fileUpload.getOriginalFilename();
		filename += UUID.randomUUID().toString().split("-")[4];
		logger.info("filename: {}", filename);
				
		//저장될 파일의 정보 객체 - java.util.File
		File dest = new File(storedFolder, filename);
				
		try {
			//업로드된 파일을 저장
			fileUpload.transferTo(dest);
					
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
			
				
		//DB에 기록할 정보 객체 - DTO
		FileUpload file = new FileUpload();
		file.setOriginName(fileUpload.getOriginalFilename());
		file.setStoredName(filename);
		int size = (int) fileUpload.getSize();
		file.setFileSize(size);

		userDao.insertFile(file);
		
		file = userDao.selectFileByFileNo(file.getFileNo());
		
		return file;
	}

	@Override
	public boolean updateUserInfo(User param) {
		logger.info("updateUserInfo called");
		
		//정보 수정전 기록 조회
		User user = userDao.selectUserByUserno(param.getUserNo());
		
		logger.info("이전 기록 : {}", user);
		//정보 수정
		userDao.updateUserInfo(param);
		
		//이전 프로필 사진이 기본 프로필이 아닐때
		if(user.getFileNo() != 91) {
					
			//기존 프로필 사진 삭제
			userDao.deleteFileByFileNo(user.getFileNo());
			
			//파일정보 삭제 확인
			int cnt = userDao.selectFileCntByFileNo(user);
			
			if(cnt == 0) {
				logger.info("이전 기록 삭제 완료");
			}else {
				logger.info("파일이 없거나 삭제 실패");		
			}
		}
		return true;
	}

	@Override
	public User getUserInfoByEmail(User user) {
		int cnt = userDao.selectCntByEmail(user);
		if(cnt == 1) {
			user = userDao.selectUserByEmail(user);
		}
		return user;
	}

	@Override
	public PagingExtagram getExtaPaging(PagingExtagram paramData, User user) {
		logger.info("getExtaPaging called");
		HashMap<String, Object> map = new HashMap<>();
		map.put("paramData", paramData);
		map.put("user", user);
		
		int totalCount = userDao.selectExtaCntByUserNo(map);
		logger.info("totalCount : {}", totalCount);
		
		PagingExtagram paging = new PagingExtagram(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		logger.info("paging : {}", paging);
		return paging;
	}
	
	@Override
	public List<Map<String, Object>> getUserExtagramHistory(User user, PagingExtagram paramData) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user", user);
		map.put("paging", paramData);
		
		List<Map<String, Object>> list = userDao.selectExtaHistoryByUserNo(map);

		return list;
	}

	@Override
	public PagingExtagram getCommPaging(PagingExtagram paramData, User user) {
		logger.info("getCommPaging called");
		HashMap<String, Object> map = new HashMap<>();
		map.put("paramData", paramData);
		map.put("user", user);
		
		int totalCount = userDao.selectCommCntByUserNo(map);
		logger.info("totalCount : {}", totalCount);
		
		PagingExtagram paging = new PagingExtagram(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		logger.info("paging : {}", paging);
		return paging;
	}

	@Override
	public List<Map<String, Object>> getUsercommentHistory(User user, PagingExtagram paging) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user", user);
		map.put("paging", paging);
		
		logger.info("{}", map);
		
		List<Map<String, Object>> list = userDao.selectCommHistoryByUserNo(map);
		
		return list;
	}
	
	@Override
	public boolean isJoinUser(User user) {
		int cnt = userDao.selectCntByEmail(user);
		if(cnt == 0) {//id값 대조 - 소셜 로그인 유저 확인
			cnt = userDao.selectCntByEmail2(user);
		}
		if(cnt == 1) {
			return true;
		}
		return false;
	}

	@Override
	public PagingUser getPaging(PagingUser paramData) {
		
		//총 게시글 수 조회
		int totalCount = userDao.selectCntUserAll(paramData);

		//페이징 계산
		PagingUser pagingUser = new PagingUser(totalCount, paramData.getCurPage());
						
		return pagingUser;
	}

	@Override
	public List<HashMap<String, Object>> getUserList(PagingUser pagingUser) {
		return userDao.selectUserAll(pagingUser);
	}

	@Override
	public boolean getCheckReport(User user) {
		int cnt = userDao.selectReportCntByUserNo(user);
		if(cnt > 0) {
			logger.info("제재결과 존재");
			return true;
		}else {
			logger.info("제재결과 없음");
			return false;
		}
		
	}
	
	@Override
	public Report getReportInfo(User user, Report report) {
		List<Report> list = null;//리스트 초기화
		list = userDao.selectReportByUserNo(user); 
		
		report = list.get(0);
		
		return report;
	}

	@Override
	public PagingExtagram getLayerPaging(PagingExtagram paramData, User user) {
		logger.info("getLayerPaging called");
		HashMap<String, Object> map = new HashMap<>();
		map.put("paramData", paramData);
		map.put("user", user);
		
		int totalCount = userDao.selectLayerCntByUserNo(map);
		logger.info("totalCount : {}", totalCount);
		
		PagingExtagram paging = new PagingExtagram(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		logger.info("paging : {}", paging);
		return paging;
	}

	@Override
	public List<Map<String, Object>> getUserLayerHistory(User user, PagingExtagram paging) {
		logger.info("getUserLayerHistory called");
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("user", user);
		map.put("paging", paging);
		
		logger.info("{}", map);
		
		List<Map<String, Object>> list = userDao.selectLayerHistoryByUserNo(map);
		
		return list;
	}

	@Override
	public PagingUserHistory2 getCommPaging2(PagingUserHistory2 paramData, User user) {
		logger.info("getCommPaging called");
		HashMap<String, Object> map = new HashMap<>();
		map.put("paramData", paramData);
		map.put("user", user);
		
		int totalCount = userDao.selectCommCntByUserNo(map);
		logger.info("totalCount : {}", totalCount);
		
		PagingUserHistory2 paging = new PagingUserHistory2(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		logger.info("paging : {}", paging);
		return paging;
	}

	@Override
	public PagingUserHistory getExtaPaging2(PagingUserHistory paramData, User user) {
		logger.info("getExtaPaging called");
		HashMap<String, Object> map = new HashMap<>();
		map.put("paramData", paramData);
		map.put("user", user);
		
		int totalCount = userDao.selectExtaCntByUserNo(map);
		logger.info("totalCount : {}", totalCount);
		
		PagingUserHistory paging = new PagingUserHistory(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		logger.info("paging : {}", paging);
		return paging;
	}

	@Override
	public List<Map<String, Object>> getUserExtagramHistory2(User user, PagingUserHistory paging) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user", user);
		map.put("paging", paging);
		
		List<Map<String, Object>> list = userDao.selectExtaHistoryByUserNo(map);

		return list;
	}

	@Override
	public List<Map<String, Object>> getUsercommentHistory2(User user, PagingUserHistory2 paging) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user", user);
		map.put("paging", paging);
		
		logger.info("{}", map);
		
		List<Map<String, Object>> list = userDao.selectCommHistoryByUserNo(map);
		
		return list;
	}

	@Override
	public PagingUserHistory2 getLayerPaging2(PagingUserHistory2 paramData, User user) {
		logger.info("getLayerPaging called");
		HashMap<String, Object> map = new HashMap<>();
		map.put("paramData", paramData);
		map.put("user", user);
		
		int totalCount = userDao.selectLayerCntByUserNo(map);
		logger.info("totalCount : {}", totalCount);
		
		PagingUserHistory2 paging = new PagingUserHistory2(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());
		logger.info("paging : {}", paging);
		return paging;
	}

	@Override
	public List<Map<String, Object>> getUserLayerHistory2(User user, PagingUserHistory2 paging) {
		logger.info("getUserLayerHistory called");
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("user", user);
		map.put("paging", paging);
		
		logger.info("{}", map);
		
		List<Map<String, Object>> list = userDao.selectLayerHistoryByUserNo(map);
		
		return list;
	}
	@Autowired private JavaMailSenderImpl mailSender;
	@Override
	public boolean sendMailAuthKey(String mail, HttpSession session, Random random) {
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
            
            //인증키값이 있을 경우 삭제
            if(session.getAttribute("authKey") != null)
            	session.removeAttribute("authKey");
            
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

	@Override
	public boolean sendMailId(User user, int questionNo, String questionAnswer) {
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
	            logger.info("아이디 : {}", user.getId());
	 
	            return true;   
	        } catch (MessagingException e) {
	            e.printStackTrace();
	            return false;
	        }
        }

        logger.info("조회된 결과 없음 [ERROR]");
		return false;
	}

	@Override
	public boolean sendMailPw(User user, String id, int questionNo, String questionAnswer) {

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
	        boolean isUpdate = setUpdatePw(user, user.getPw());
	        
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

}
