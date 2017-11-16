package com.ada.app.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.ada.app.web.support.RequestContext;

import cn.com.jiand.mvc.framework.utils.AES;
import cn.com.jiand.mvc.framework.utils.Requests;

public class Cookies {
	private final static Log log = LogFactory.getLog(Cookies.class);
	
	private final static String COOKIE_RECOMMEND_ID_KEY = "D89D8906";
	private final static String COOKEY_USER_ID_KEY = "365A55CE" ;
	
	
	public static Integer getRecommendId(){
		String v = getAttribute(COOKIE_RECOMMEND_ID_KEY);
		if(v!=null){
			return Integer.valueOf(v);
		}else{
			return null;
		}
	}
	
	public static void setRecommendId(Integer recommendId,Integer expireDays){
		setAttribute(COOKIE_RECOMMEND_ID_KEY,recommendId.toString(),expireDays*24*60*60);
	}
	
	public static void removeRecommendId(){
		removeAttribute(COOKIE_RECOMMEND_ID_KEY);
	}

	public static void setUserId(Integer userId,Integer expireDays){
		setAttribute(COOKEY_USER_ID_KEY,userId.toString(),60*60*24*expireDays);
	}

	public static Integer getUserId(){
		String v = getAttribute(COOKEY_USER_ID_KEY);
		if(v!=null){
			return Integer.valueOf(v);
		}else{
			return null;
		}
	}
	
	public static void removeUserId(){
		removeAttribute(COOKEY_USER_ID_KEY);
	}
	
	public static String getAttribute(String key){
		try {
			Cookie[] cookies = Requests.getRequest().getCookies();
			if (cookies != null && cookies.length > 0) {
				for (Cookie cookie : cookies) {
					if(key.equals(cookie.getName())) {
						return AES.decrypt(cookie.getValue());
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static void setAttribute(String key,String value,Integer maxAge){
		try {
			Cookie cookie=new Cookie(key,AES.encrypt(value));
			cookie.setPath("/");
			cookie.setMaxAge(maxAge);
			HttpServletResponse response = RequestContext.getResponse();
			response.addCookie(cookie);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public static void removeAttribute(String key){
		try {
			HttpServletRequest request = RequestContext.getRequest();
			HttpServletResponse response = RequestContext.getResponse();
			for(Cookie cookie: request.getCookies()){
				if(key.equals(cookie.getName())) {
					cookie.setMaxAge(0); 
					cookie.setPath("/");
					response.addCookie(cookie);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
