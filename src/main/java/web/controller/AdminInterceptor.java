package web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import web.dto.User;
import web.service.face.UserService;

public class AdminInterceptor implements HandlerInterceptor{

	//로그 객체
	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	
	@Autowired UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info(" * * * ADMIN INTERCEPTOR * * * ");
		HttpSession session = request.getSession();
		
		//비로그인 상태
		if (session.getAttribute("login") == null) {
			logger.info(" * * * NO LOGIN * * * ");
			
			response.sendRedirect("/");
			return false;
		
		//로그인 상태
		} else {			
			logger.info(" * * * LOGIN * * * ");
			
			//isAdmin 값을 가져 올 객체와 메소드
			User user = new User();
			user.setUserNo((Integer)session.getAttribute("userNo"));
			String isAdmin = userService.getUserNickByUserno(user).getIsAdmin();
			
			//isAdmin의 값이 S가 아니며, M도 아닌 상태 == N == 일반 사용자
			if( !"S".equals(isAdmin) && !"M".equals(isAdmin) ) {
				logger.info(" * * * N USER * * * ");
				
				response.sendRedirect("/");
				return false;
			}
		}
		
		//로그인 상태이며 isAdmin의 값이 S 또는 M인 경우
		logger.info(" * * * ADMIN * * * ");
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
