package com.ada.app.web.support;

import java.io.IOException;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ada.app.domain.AdaUser;
import com.ada.app.service.SecurityService;
import com.ada.app.util.Sessions;
import com.alibaba.fastjson.JSON;


/**
 * 
 * 安全检查,包含检查登录状况,以及访问页面的权限
 * @author wanghl.cn
 */
public class SecurityHandler implements HandlerInterceptor{
	private final static Log log = LogFactory.getLog(SecurityHandler.class);
	
	@Autowired
	private SecurityService securityService;
	
	private String loginPage = "/login.jhtm"; 
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) {
		log.debug("checking");
		
		AdaUser loginUser =  Sessions.getLoginUser();
		
		if(loginUser == null){
			loginUser = securityService.loginByCookie();
			if(loginUser != null){
				log.info("Cookie登录->"+JSON.toJSONString(loginUser));
				return true;
			}
		}else{
			/** 已登陆,跳出　**/
			return true;
		}
		
		HandlerMethod methodHandler = (HandlerMethod)handler;
		NotNeedLogin notNeedLogin = AnnotationUtils.findAnnotation(methodHandler.getMethod(), NotNeedLogin.class);
		if(notNeedLogin != null){
			return true;
		}else{
			try {
				securityService.checkLogin();
			} catch (Exception e) {
				try {
					log.debug("跳转登录 ");
					response.sendRedirect(request.getContextPath()+loginPage);
					return false;
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		}
		
		log.debug("passcheck");
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request,HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

	/**
	 * 不需要登录的方法标记
	 * @author wanghl.cn
	 * @date 2016-11-13 下午10:30:33
	 */
	@Target(ElementType.METHOD)
	@Retention(RetentionPolicy.RUNTIME)
	@Documented
	public static @interface NotNeedLogin {
	}
}
