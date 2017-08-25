package com.ssm.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
/**
 * 用于session验证的拦截器
 * @author Administrator
 *
 */
public class SessionInterceptor implements HandlerInterceptor{

	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object arg2, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object arg2, ModelAndView mav)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object arg2) throws Exception {
		System.out.println("preHandle()");
		HttpSession session = req.getSession();
		Object admin = session.getAttribute("email");
		if(admin == null){
			//没有登录，重定向到登录页面
			res.sendRedirect("index.do");
			return false;
		}
		//已经登录过，则继续向下执行。
		return true;
	}

}
