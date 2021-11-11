package web.service.impl;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import web.dao.face.UserDao;
import web.dto.ExComm;
import web.dto.Extagram;
import web.dto.User;
import web.service.face.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired UserDao userDao;
	
	private Logger logger = LoggerFactory.getLogger(UserService.class);
	
	@Override
	public boolean getLoginCheck(User param) {
		logger.info("getLoginChk called");
		
		int userCnt = userDao.selectUserCntById(param);
		
		if(userCnt == 1) {
			//아이디 매칭 성공
			User user = userDao.selectUserById(param);// 유저 정보 조회
			
			//해시값
			if(param.getPw().equals(user.getPw())) {
				//로그인 성공
				return true;
			}else {
				//로그인 실패
				return false;
			}
				
		}else {
			//로그인 실패
			return false;
		}

	}
	
	@Override
	public boolean getJoinCheck(User param) {
		
		logger.info("getJoinCheck called");
		
		int userCnt = userDao.selectUserCntById(param);
		
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
	public boolean getCheckPassword(String salt, int userno) {
		
		logger.info("getCheckPassword called");
		
		User user = userDao.selectUserByUserno(userno);
		
		if(salt.equals(user.getSalt())) {
			//비밀번호 일치
			return true;
		}else {
			//비밀번호 불일치
			return false;
		}
	}
	
	@Override
	public boolean setUpdatePw(String pw, String pwChk, int userno) {
		
		logger.info("setChangePw called");
		
		//변경값 확인
		if(pw == pwChk) {
			User user = userDao.selectUserByUserno(userno);
			//비밀번호 변경
			userDao.updatePw(user);
			
			return true;
		}else {
			//변경할 비밀번호와 확인값이 맞지 않음
			return false;
		}
	}
	
	@Override
	public void deleteUser(int userno) {
		logger.info("deleteUser called");
		
		//회원정보 삭제
		userDao.deleteUserByUserno(userno);
	}

	@Override
	public User getUserInfo(User user) {
		logger.info("getUserInfo called");
		
		//회원의 세부정보 조회
		user = userDao.selectUserById(user);
		
		return user;
	}

	@Override
	public List<Extagram> getExtaHistory(int userNo) {
		
		return userDao.selectExtraByUserNo(userNo);
	}

	@Override
	public List<Extagram> searchExtaHistory(String search, int userNo) {
		HashMap<String, Object> map = null; // dto 2개값 입력해서 전달
		return userDao.selectSearchExtaByUserNo(map);
	}

	@Override
	public List<ExComm> getHistory(int userNo) {
		
		return userDao.selectCommentByUserNo(userNo);
	}

	@Override
	public List<ExComm> searchCommentHistory(String search, int userNo) {
		HashMap<String, Object> map = null; // dto 2개값 입력해서 전달
		return userDao.selectCommentByUserNo(map);
	}
	
}
