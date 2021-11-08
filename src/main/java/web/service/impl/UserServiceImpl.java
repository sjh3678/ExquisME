package web.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.UserDao;
import web.dto.User;
import web.service.face.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired UserDao userDao;
	private Logger logger = LoggerFactory.getLogger(UserService.class);
	@Override
	public boolean getLoginChk(User param) {
		logger.info("getLoginChk called");
		int userCnt = userDao.selectCntById(param);
		if(userCnt == 1) {
			//아이디 매칭 성공
			User user = userDao.selectById(param);// 유저 정보 조회
			
			if(param.getSalt().equals(user.getSalt())) {
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
	public boolean getJoinChk(User param) {
		int userCnt = userDao.selectCntById(param);
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
	public boolean setChangePw(String pw, String pwChk) {
		
		return false;
	}
	@Override
	public boolean deleteUser(int userno) {
		
		return false;
	}
	@Override
	public boolean getCheckPassword(String pw) {
		
		return false;
	}	
	
}
