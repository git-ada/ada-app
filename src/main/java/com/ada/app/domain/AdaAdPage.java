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
 * 广告页 Entity
 * @author Wanghl.cn By Code Generator
 */
@Entity
@Table(name = "ada_ad_page")
public class AdaAdPage extends AbstractEntity<Integer> {
    /** 渠道ID */
	private Integer id;                    
    /** 站点ID */
	private Integer siteId;                    
    /** 渠道名称 */
	private String matchContent;                    
    /** 创建时间 */
	private String channelKey;                    
    /** createTime */
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
	
	public String getMatchContent(){
		return this.matchContent;
	}
	
	public void setMatchContent(String matchContent){
		this.matchContent = matchContent;
	}
	
	public String getChannelKey(){
		return this.channelKey;
	}
	
	public void setChannelKey(String channelKey){
		this.channelKey = channelKey;
	}
	
	public Timestamp getCreateTime(){
		return this.createTime;
	}
	
	public void setCreateTime(Timestamp createTime){
		this.createTime = createTime;
	}
	
	
}
