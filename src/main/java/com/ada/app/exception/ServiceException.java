package com.ada.app.exception;

import com.ada.app.constant.ErrorCode;

/**
 * 服务异常
 * @author wanghl.cn
 * @date 2016-11-11 下午4:42:54
 */
public class ServiceException extends RuntimeException{

	private static final long serialVersionUID = -5630584016648231396L;
	
	private Integer errorCode;
	private Object data;

	public ServiceException() {
		super();
		this.errorCode = ErrorCode.UnknownException.getCode();
	}
	
	public ServiceException(String message) {
		super(message);
		this.errorCode = ErrorCode.UnknownException.getCode();
	}
	
	public ServiceException(ErrorCode error) {
		super(error.getName());
		this.errorCode = error.getCode();
	}
	
	public ServiceException(ErrorCode error,String message) {
		super(message);
		this.errorCode = error.getCode();
	}
	
	public ServiceException(Integer errorCode) {
		super();
		this.errorCode = errorCode;
	}
	
	
	public ServiceException(Integer errorCode,String message) {
		super(message);
		this.errorCode = errorCode;
	}


	public Integer getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(Integer errorCode) {
		this.errorCode = errorCode;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
