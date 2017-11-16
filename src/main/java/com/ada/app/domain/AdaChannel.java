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
 * 渠道 Entity
 * @author Wanghl.cn By Code Generator
 */
@Entity
@Table(name = "ada_channel")
public class AdaChannel extends AbstractEntity<Integer> {
    /** 渠道ID */
	private Integer id;                    
    /** 站点ID */
	private Integer siteId;                    
    /** 渠道名称 */
	private String channelName;                    
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
	
	public String getChannelName(){
		return this.channelName;
	}
	
	public void setChannelName(String channelName){
		this.channelName = channelName;
	}
	
	public Timestamp getCreateTime(){
		return this.createTime;
	}
	
	public void setCreateTime(Timestamp createTime){
		this.createTime = createTime;
	}
	
	
}
