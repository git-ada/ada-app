package com.ada.app.domain;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.com.jiand.mvc.framework.domain.AbstractEntity;

/**
 * 渠道链接 Entity
 * @author Wanghl.cn By Code Generator
 */
@Entity
@Table(name = "ada_channel_link")
public class AdaChannelLink extends AbstractEntity<Integer> {

	private static final long serialVersionUID = 3764301133934411588L;
	
	/** 链接ID */
	private Integer id;     
	/** 站点ID */
	private Integer siteId;
	/** 渠道ID */
	private Integer channelId;                    
    /** 网页链接地址 */
	private String url;                    
    /** 参数 */
	private String parameter;                    
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
    public Integer getSiteId() {
		return siteId;
	}

	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
	}
	
	public Integer getChannelId(){
		return this.channelId;
	}
	
	public void setChannelId(Integer channelId){
		this.channelId = channelId;
	}
	
	public String getUrl(){
		return this.url;
	}
	
	public void setUrl(String url){
		this.url = url;
	}
	
	public String getParameter(){
		return this.parameter;
	}
	
	public void setParameter(String parameter){
		this.parameter = parameter;
	}
	
	public Timestamp getCreateTime(){
		return this.createTime;
	}
	
	public void setCreateTime(Timestamp createTime){
		this.createTime = createTime;
	}
	
	
}
