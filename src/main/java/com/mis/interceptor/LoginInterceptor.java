package com.mis.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mis.domain.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String Login = "login"; // 로그인 정보를 저장할 key이름
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	// UserVO 객체 확인(로그인 가능한지 아닌지) 후 HttpSession 저장
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object memberVO = modelMap.get("vo");

		if (memberVO != null) {

			logger.info("new login success");
			session.setAttribute(Login, memberVO);

			MemberVO checkAuth = (MemberVO) memberVO;
			// response.sendRedirect("/");

			if (checkAuth.getGrade().equals("1"))// 관리자
			{
				logger.info("adminmain...........");

				response.sendRedirect("/admin/main");

			} else {// 사용자 logger.info("usermain...........");
				response.sendRedirect("/user/main");

			}
		}

		// 사용자가 로그인 전에 보고 있던 경로 = dest
		/*
		 * Object dest = session.getAttribute("dest"); response.sendRedirect(dest !=
		 * null ? (String) dest : "/");
		 */
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// 로그인이 실행 되기 전 기존 session 객체 정리하도록 재정의

		// 1) session정보 가져오기
		HttpSession session = request.getSession();

		// 2) session 정보에 로그인 정보 있는지 확인
		if (session.getAttribute(Login) != null) {

			// 3) 로그인 정보 삭제
			logger.info("clear login data before");
			session.removeAttribute(Login);
		}

		return true;
	}

}