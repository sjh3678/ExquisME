package web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

public class JoinIntercepter implements HandlerInterceptor{
	private Logger logger = LoggerFactory.getLogger(JoinIntercepter.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("login") != null) {
			logger.info("로그인 상태로 회원가입 페이지 접속");
			session.invalidate();
			response.sendRedirect("/user/login");
			return false;
		}
		
		logger.info("정상 비로그인 상태");

		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
