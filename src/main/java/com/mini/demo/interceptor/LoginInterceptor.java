package com.mini.demo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mini.demo.vo.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
			HttpSession session = request.getSession();
		
			UserVO uservo = (UserVO)session.getAttribute("member");
		
			if(uservo == null || uservo.getUSER_NUM() == null) {
				response.sendRedirect("/login"); 
				return false;
			} else {
				return true;
			}
	}
	
}
