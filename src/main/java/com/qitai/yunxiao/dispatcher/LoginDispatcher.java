package com.qitai.yunxiao.dispatcher;

import com.qitai.yunxiao.entity.Bread;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginDispatcher extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Bread user = (Bread) request.getSession().getAttribute("bread");
		if(user == null) {
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			return false;
		}
		else return true;
	}
	
}
