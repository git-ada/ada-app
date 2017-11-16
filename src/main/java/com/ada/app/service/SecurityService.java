package com.ada.app.service;

import com.ada.app.domain.AdaUser;

/**
 * 安全服务
 *
 * @author wanghl.cn
 * @date 2016-11-24 下午4:54:14
 */
public interface SecurityService {

	/**
	 * 登录
	 * @param username
	 * @param password
	 */
	
	public AdaUser loginByCookie();
	
	
	/**
	 * 微信登陆
	 */
	public void loginiByWeixin();
	
	/**
	 * 登录
	 * @param username
	 * @param password
	 * @param loginEntry 登陆入口@LoginEntry
	 */
	public void login(String username,String password,String verCode,Boolean  remember);
	
	
	public void changePassword(String oldPassword,String newPassword);
	
	/**
	 * 判断是否登陆
	 * @return
	 */
	public Boolean isLogin();
	
	/**
	 * 登出
	 */
	public void logout();
	
	/**
	 * 检查登录状态
	 */
	public void checkLogin();
}
