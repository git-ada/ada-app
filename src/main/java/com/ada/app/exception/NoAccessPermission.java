package com.ada.app.exception;

import cn.com.jiand.mvc.framework.exception.BusinessException;

/**
 * 无访问权限
 * @author wanghl.cn
 * @date 2016-11-24 下午9:46:39
 */
public class NoAccessPermission extends BusinessException{

	private static final long serialVersionUID = 7124922475277938308L;
	
	public NoAccessPermission() {
		super(405,"无访问权限");
	}

}
