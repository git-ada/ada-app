package com.ada.app.exception;


/**
 * 未登录异常
 * @author wanghl.cn
 * @date 2016-11-24 下午9:46:27
 */
public class NotLoginException  extends BusinessException{

	private static final long serialVersionUID = 7732907884469788272L;

	public NotLoginException() {
		super(401,"未登录");
	}
}
