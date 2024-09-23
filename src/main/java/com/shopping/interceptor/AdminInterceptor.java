package com.shopping.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// 사용자 인터셉터
// 인터셉터 기능을 갖는 클래스는 HandlerInterceptorAdapter 추상 클래스를 상속 받아야 한다
public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(); // 로그인 여부를 확인하기 위해
		
		System.out.println("preHandle");
		
		if(session.getAttribute("member_id") == null) { // 로그인 X
			response.sendRedirect("/admin/login");
			
			return false;
		}
		
		return true;
	}
}
