package com.ada.app.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.jiand.mvc.framework.utils.MD5s;

import com.ada.app.constant.ErrorCode;
import com.ada.app.constant.SessionKey;
import com.ada.app.dao.AdaRoleDao;
import com.ada.app.dao.AdaSiteDao;
import com.ada.app.dao.AdaUserDao;
import com.ada.app.domain.AdaRole;
import com.ada.app.domain.AdaSite;
import com.ada.app.domain.AdaUser;
import com.ada.app.exception.BusinessException;
import com.ada.app.exception.NotLoginException;
import com.ada.app.service.SecurityService;
import com.ada.app.util.Cookies;
import com.ada.app.util.Sessions;


/**
 * 安全服务
 */
@Service
public class SecurityServiceImpl implements SecurityService{
	
	private final static Log log = LogFactory.getLog(SecurityServiceImpl.class);
	
	@Autowired private AdaUserDao userDao;
	
	private Integer loginExpireDays = 30; /** 默认30天登陆有效  **/
	
	@Autowired
	private AdaSiteDao siteDao;
	
	@Autowired
	private AdaRoleDao roleDao;
	
	
	/**
	 * 多入口登录
	 */
	@Override
	public void login(String username, String password, String verCode,Boolean  remember) {
		log.info("login username->"+username +",password->"+MD5s.encode(password));
		
		/** 检查用户名密码 **/
		AdaUser user = securityCheck(username,password);
		
		/** 记住我 **/
		if(remember){
			Cookies.setUserId(user.getId(), loginExpireDays);
		}
		
		
		/** 设置当前登陆人　**/
		Sessions.setAttribute(SessionKey.LOGIN_USER.code(), user);
		AdaRole role = roleDao.findByUserId(user.getId());
		Sessions.setAttribute("roleName", role.getRoleName());
		
		if(Sessions.getCurrentSite() == null){
			List<AdaSite> adaSites = siteDao.findByUserId(Sessions.getLoginUser().getId());
			if(adaSites!=null && !adaSites.isEmpty()){
				AdaSite currentSite = adaSites.get(0);
				/** 设置默认站点 **/
				Sessions.setCurrentSite(currentSite);
				log.info(Sessions.getLoginUser().getNickname() +" 登入，设置默认站点->"+currentSite.getId()+":" +currentSite.getSiteName());
			}
		}
		
	}
	public void logout() {
		for(SessionKey sessionKey:SessionKey.values()){
			HttpSession  session = Sessions.getSession();
			session.removeAttribute(sessionKey.code());
		}
		
		try {
			Cookies.removeUserId();
		} catch (Exception e) {
		}
	}
	
	/**
	 * 检查用户及密码
	 * @param username
	 * @param password
	 * @return
	 */
	protected AdaUser securityCheck(String username, String password) {
		AdaUser user = userDao.findByUsername(username);
		if(user == null){
			throw new BusinessException(ErrorCode.UserNotExist);
		}
		
		if(AdaUser.STATUS_DISABLE == user.getStatus()){
			throw new BusinessException(ErrorCode.UserDisable);
		}
		String encryptedPassword = MD5s.encode(password);
 
		if(!encryptedPassword.equalsIgnoreCase(user.getPassword())){
			log.error("密码错误 server Password->"+encryptedPassword+"user password->"+user.getPassword());
			throw new BusinessException(ErrorCode.PasswordError);
		}
	
		return user;
	}
	
	
	public Boolean isLogin(){
		return (Sessions.getSession().getAttribute(SessionKey.LOGIN_USER.code()) != null);
	}
	
	@Override
	public void checkLogin() {
		if(Sessions.getSession().getAttribute(SessionKey.LOGIN_USER.code()) == null){
			throw new NotLoginException();
		}
	}


	@Override
	public AdaUser loginByCookie() {
		Integer userId = Cookies.getUserId();
		
		try{
			if(userId!=null){
				AdaUser user = userDao.findById(userId);
				if(user == null){
					return null;
				}else{
					/** 用户被禁用,清除Cookie **/
					if(AdaUser.STATUS_DISABLE == user.getStatus()){
						Cookies.removeUserId();
						return null;
					}else{
						Sessions.setLoginUser(user);
						

						if(Sessions.getCurrentSite() == null){
							List<AdaSite> adaSites = siteDao.findByUserId(Sessions.getLoginUser().getId());
							if(adaSites!=null && !adaSites.isEmpty()){
								AdaSite currentSite = adaSites.get(0);
								/** 设置默认站点 **/
								Sessions.setCurrentSite(currentSite);
								log.info(Sessions.getLoginUser().getNickname() +" 登入，设置默认站点->"+currentSite.getId()+":" +currentSite.getSiteName());
							}
						}
						
						return user;
					}
				}
			}
		} catch (Exception e){
			log.error("Cookie登录失败,Msg->" + e.getMessage(),e);
		}
		return null;
	}

	@Override
	public void loginiByWeixin() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void changePassword(String oldPassword, String newPassword) {
		AdaUser user = (AdaUser) Sessions.getAttribute(SessionKey.LOGIN_USER.code());
		
		String encryptedPassword = MD5s.encode(oldPassword);
		 
		if(!encryptedPassword.equalsIgnoreCase(user.getPassword())){
			log.error("密码错误 server Password->"+encryptedPassword+"user password->"+user.getPassword());
			throw new BusinessException("原密码错误");
		}
		String newEncryptedPassword = MD5s.encode(newPassword);
		user.setPassword(newEncryptedPassword);
		
		
		AdaUser a2 = userDao.findById(user.getId());
		a2.setPassword(newEncryptedPassword);
		userDao.update(a2);
	}


}
