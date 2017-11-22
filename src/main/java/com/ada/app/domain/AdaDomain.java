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
 * 域名 Entity
 * @author Wanghl.cn By Code Generator
 */
@Entity
@Table(name = "ada_domain")
public class AdaDomain extends AbstractEntity<Integer> {
    /** 链接ID */
	private Integer id;                    
    /** 站点ID */
	private Integer siteId;                    
    /** 网页链接地址 */
	private String domain;                    
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
	
	public Integer getSiteId(){
		return this.siteId;
	}
	
	public void setSiteId(Integer siteId){
		this.siteId = siteId;
	}
	
	public String getDomain(){
		return this.domain;
	}
	
	public void setDomain(String domain){
		this.domain = domain;
	}
	
	public Timestamp getCreateTime(){
		return this.createTime;
	}
	
	public void setCreateTime(Timestamp createTime){
		this.createTime = createTime;
	}
	
	
}
