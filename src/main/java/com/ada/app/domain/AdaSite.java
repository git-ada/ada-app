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
 * 站点 Entity
 * @author Wanghl.cn By Code Generator
 */
@Entity
@Table(name = "ada_site")
public class AdaSite extends AbstractEntity<Integer> {
    /** 站点ID */
	private Integer id;                    
    /** 用户ID */
	private Integer userId;                    
    /** 站点名称 */
	private String siteName;                    
    /** 创建时间 */
	private Timestamp createTime;                    
	
	@Id	
	@GeneratedValue
	public Integer getId(){
		return this.id;
	}
	
	public void setId(Integer id){
		this.id = id;
	}
	
	public Integer getUserId(){
		return this.userId;
	}
	
	public void setUserId(Integer userId){
		this.userId = userId;
	}
	
	public String getSiteName(){
		return this.siteName;
	}
	
	public void setSiteName(String siteName){
		this.siteName = siteName;
	}
	
	public Timestamp getCreateTime(){
		return this.createTime;
	}
	
	public void setCreateTime(Timestamp createTime){
		this.createTime = createTime;
	}
	
	
}
