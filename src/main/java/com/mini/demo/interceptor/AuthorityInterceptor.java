package com.mini.demo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mini.demo.vo.UserVO;

public class AuthorityInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		UserVO uservo = (UserVO)session.getAttribute("member");
		if(uservo ==  null || uservo.getAUTHORITY() == null || uservo.getAUTHORITY() == "") { //관리자 계정이 아닌 경우
			System.out.println("관리자권한 없음");
			response.sendRedirect("/mtsystem/individualStatusList");  //메인페이지 리다이렉트
			return false;
		} else {
			
			return true; // 관리자 계정 로그인 경우(uservo != null && uservo.getAdminCk() == AUTHORITY)
		}
	}

}
