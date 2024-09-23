package com.shopping.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// 사용자 인터셉터
// 인터셉터 기능을 갖는 클래스는 HandlerInterceptorAdapter 추상 클래스를 상속 받아야 한다
public class UserInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(); // 로그인 여부를 확인하기 위해
		
		System.out.println("preHandle");
		
		if(session.getAttribute("member_id") == null) { // 로그인 X
			saveDest(request);
			
			response.sendRedirect("/member/login");
			
			return false;
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		System.out.println("postHandle");
		
		HttpSession session = request.getSession();
		Object dest = session.getAttribute("dest");
		
		System.out.println("dest : " + (String)dest);
		
		session.removeAttribute("dest");
		
		if(dest != null) {
			response.sendRedirect((String)dest);
		} else {
			response.sendRedirect("/");
		}
		 
		
//		response.sendRedirect(dest != null ? (String)dest : "/");
	}

	// 로그인이 되어있는 경우에만 사용할 수 있는 주소를 요청 시 원래 요청 주소를 저장하는 기능
	// 로그인이 되지 않았을 경우 로그인 페이지로 이동하고 로그인 완료했을 경우 저장해뒀던 주소로 이동
	private void saveDest(HttpServletRequest req) {
		String uri = req.getRequestURI(); // 사용자가 원래 요청했던 주소
		String query = req.getQueryString(); // 주소 이후에(?name=value&...) 존재하는 쿼리 스트링

		if (query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}

//		if (req.getMethod().equals("GET"))
			req.getSession().setAttribute("dest", uri + query); // 사용자가 요청한 주소+쿼리 스트링을 session에 저장
	}
}
