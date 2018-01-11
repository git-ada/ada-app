package com.ada.app.constant;

/**
 * 错误码列表
 * @author wanghl.cn
 * @date 2016-11-11 下午4:40:53
 */
public enum ErrorCode {

	RequesetError(400,"请求错误"),
	UnAuthorized(401,"请鉴权异常"),
	ParameterError(402,"参数错误"),
	TokenInvalid(403,"TOKEN失效"),
	
	BusinessException(450,"业务异常"),
	VerifyCodeInvalid(452,"验证码错误"),
	UserNotExist(454,"用户不存在"),
	UserNotPower(457,"权限不足, 请联系管理员"),
	UserDisable(455,"用户已禁用"),
	PasswordError(456,"密码错误"),
	VerifyCodeSendError(463,"发送验证码失败"),
	
	UnknownException(500,"未知异常"),
	ServeException(503,"服务异常");

	private Integer code;
	private String name;
	
	public Integer getCode() {
		return code;
	}
	
	public String getName() {
		return name;
	}

	ErrorCode(Integer code,String name){
		this.code = code;
		this.name = name;
	}
	
	public static ErrorCode findByCode(Integer code){
		for(ErrorCode item:ErrorCode.values()){
			if(item.getCode().equals(code)){
				return item;
			}
		}
		return null;
	}
	
	public static String findNameByCode(Integer code){
		for(ErrorCode item:ErrorCode.values()){
			if(item.getCode().equals(code)){
				return item.getName();
			}
		}
		return null;
	}


}
