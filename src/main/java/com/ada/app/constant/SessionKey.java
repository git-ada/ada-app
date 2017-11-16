package com.ada.app.constant;

/**
 * Session常量,定义全部Session所有KEy
 *
 * @author wanghl.cn
 * @date 2016-11-28 下午3:30:05
 */
public enum SessionKey {

	CURRENT_SITE("_CURRENT_SITE","当前登录用户"),
	LOGIN_USER("_LOGIN_USER","当前登录用户"),
	
	;
	private String code;
	private String name;
	
	SessionKey(String code,String name){
		this.code = code;
		this.name = name;
	}

	public String code() {
		return code;
	}

	public String getName() {
		return name;
	}
}
