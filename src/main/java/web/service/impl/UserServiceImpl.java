package web.service.impl;


import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.UserDao;
import web.dto.ExComm;
import web.dto.Extagram;
import web.dto.FileUpload;
import web.dto.User;
import web.service.face.UserService;


@Service
public class UserServiceImpl implements UserService{
	
	@Autowired UserDao userDao;
	
	private Logger logger = LoggerFactory.getLogger(UserService.class);
	
	@Override
	public boolean getLoginCheck(User param) {
		logger.info("getLoginChk called");
		
		int userCnt = userDao.selectUserCnt(param);
		logger.info("userCnt : {}", userCnt);
		if(userCnt == 1) {
			//아이디 매칭 성공
			logger.info("아이디 매칭 성공");
			
			User user = userDao.selectUserById(param);// 유저 정보 조회
			logger.info("db : {}", user.getPw());
			logger.info("input : {}", param.getPw());
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
		logger.info("deleteUser called");
		//회원정보 삭제
		userDao.deleteUserByUserno(userNo);
		User user = new User();
		user.setUserNo(userNo);
		int cnt = userDao.selectUserCnt(user);
		
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
		if(cnt == 0) {
			logger.info("매칭된 이메일 없음");
			return false;	
		}
		logger.info("이메일 중복");
		return true;
	}

	@Override
	public boolean searchNick(User user) {
		int cnt = userDao.selectUserCnt(user);
		if(cnt == 0) {
			logger.info("매칭된 닉네임 없음");
			return false;	
		}
		logger.info("닉네임 중복");
		return true;
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
}
