package web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

public class UserInterceptor implements HandlerInterceptor{

	//로그 객체
	private static final Logger logger = LoggerFactory.getLogger(UserInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("일반유저 인터셉터");
		HttpSession session = request.getSession();
		
		if (session.getAttribute("login") == null) {
			logger.info("비접속 상태");
			
			response.sendRedirect("/layer/error");
			return false;
		}
		
		logger.info("정상 로그인 상태");
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
