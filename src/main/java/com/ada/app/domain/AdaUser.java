package com.ada.app.domain;

import java.io.Serializable;
import java.util.Date;
import java.sql.Timestamp;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import cn.com.jiand.mvc.framework.domain.AbstractEntity;

/**
 * 用户 Entity
 * @author Wanghl.cn By Code Generator
 */
@Entity
@Table(name = "ada_user")
public class AdaUser extends AbstractEntity<Integer> {
    /** 用户ID */
	private Integer id;                    
    /** 用户名 */
	private String username;                    
    /** 密码,MD5 */
	private String password;                    
    /** 昵称 */
	private String nickname;                    
    /** 真名 */
	private String realname;                    
    /** 身份证号码 */
	private String idNo;                    
    /** 邮箱 */
	private String email;                    
    /** 手机 */
	private String phone;                    
    /** 生日 */
	private Date birthday;                    
    /** 性别 */
	private Integer sex;                    
    /** 头像URL */
	private String headImgUrl;                    
    /** 省ID */
	private Integer provinceId;                    
    /** 城市ID */
	private Integer cityId;                    
    /** 地区ID */
	private Integer districtId;                    
    /** 家庭住址 */
	private String homeAddress;                    
    /** 状态 */
	private Integer status;                    
    /** 创建时间 */
	private Timestamp createTime;
	/** 用户角色 */
	private String userRole;//user:普通用户   admin:管理用户
	
	public final static Integer STATUS_DISABLE = -1;
	
	@Id	
	@GeneratedValue
	public Integer getId(){
		return this.id;
	}
	
	public void setId(Integer id){
		this.id = id;
	}
	
	public String getUsername(){
		return this.username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public String getPassword(){
		return this.password;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public String getNickname(){
		return this.nickname;
	}
	
	public void setNickname(String nickname){
		this.nickname = nickname;
	}
	
	public String getRealname(){
		return this.realname;
	}
	
	public void setRealname(String realname){
		this.realname = realname;
	}
	
	public String getIdNo(){
		return this.idNo;
	}
	
	public void setIdNo(String idNo){
		this.idNo = idNo;
	}
	
	public String getEmail(){
		return this.email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getPhone(){
		return this.phone;
	}
	
	public void setPhone(String phone){
		this.phone = phone;
	}
	
	public Date getBirthday(){
		return this.birthday;
	}
	
	public void setBirthday(Date birthday){
		this.birthday = birthday;
	}
	
	public Integer getSex(){
		return this.sex;
	}
	
	public void setSex(Integer sex){
		this.sex = sex;
	}
	
	public String getHeadImgUrl(){
		return this.headImgUrl;
	}
	
	public void setHeadImgUrl(String headImgUrl){
		this.headImgUrl = headImgUrl;
	}
	
	public Integer getProvinceId(){
		return this.provinceId;
	}
	
	public void setProvinceId(Integer provinceId){
		this.provinceId = provinceId;
	}
	
	public Integer getCityId(){
		return this.cityId;
	}
	
	public void setCityId(Integer cityId){
		this.cityId = cityId;
	}
	
	public Integer getDistrictId(){
		return this.districtId;
	}
	
	public void setDistrictId(Integer districtId){
		this.districtId = districtId;
	}
	
	public String getHomeAddress(){
		return this.homeAddress;
	}
	
	public void setHomeAddress(String homeAddress){
		this.homeAddress = homeAddress;
	}
	
	public Integer getStatus(){
		return this.status;
	}
	
	public void setStatus(Integer status){
		this.status = status;
	}
	
	public Timestamp getCreateTime(){
		return this.createTime;
	}
	
	public void setCreateTime(Timestamp createTime){
		this.createTime = createTime;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	
	
}
