package com.ada.app.util;

import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.ada.app.constant.SessionKey;
import com.ada.app.domain.AdaSite;
import com.ada.app.domain.AdaUser;

/**
 * Session工具类
 * @author wanghl.cn
 */
public class Sessions {

	public static Object getAttribute(String key ) {
		return getSession().getAttribute(key);
	}
	
	public static void setAttribute(String key,Object value) {
		getSession().setAttribute(key, value);
	}

	public static void removeAttribute(String key){
		getSession().removeAttribute(key);
	}
	
	public static HttpSession getSession(){
		return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest().getSession();
	}
	
	public static AdaUser getLoginUser(){
		return (AdaUser)getAttribute(SessionKey.LOGIN_USER.code());
	}
	
	public static void setLoginUser(AdaUser user){
		setAttribute(SessionKey.LOGIN_USER.code(), user);
	}
	
	public static AdaSite getCurrentSite(){
		return (AdaSite)getAttribute(SessionKey.CURRENT_SITE.code());
	}
	
	public static void setCurrentSite(AdaSite site){
		setAttribute(SessionKey.CURRENT_SITE.code(), site);
	}

}
