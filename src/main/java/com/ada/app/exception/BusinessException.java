package com.ada.app.exception;

import com.ada.app.constant.ErrorCode;

/**
 * 业务异常
 * @author wanghl.cn
 * @date 2016-11-11 下午4:42:15
 */
public class BusinessException extends RuntimeException{

	private static final long serialVersionUID = -8830536078197834710L;
	
	private Integer errorCode;
	private Object data;

	public BusinessException() {
		super();
		this.errorCode = ErrorCode.BusinessException.getCode();
	}
	
	public BusinessException(String message) {
		super(message);
		this.errorCode = ErrorCode.BusinessException.getCode();
	}
	
	public BusinessException(ErrorCode error) {
		super(error.getName());
		this.errorCode = error.getCode();
	}
	
	public BusinessException(ErrorCode error,String message) {
		super(message);
		this.errorCode = error.getCode();
	}
	
	public BusinessException(Integer errorCode) {
		super();
		this.errorCode = errorCode;
	}
	
	
	public BusinessException(Integer errorCode,String message) {
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
