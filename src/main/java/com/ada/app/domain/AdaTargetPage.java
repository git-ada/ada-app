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
 * 目标页 Entity
 * @author Wanghl.cn By Code Generator
 */
@Entity
@Table(name = "ada_target_page")
public class AdaTargetPage extends AbstractEntity<Integer> {
    /** 链接ID */
	private Integer id;                    
    /** 站点ID */
	private Integer siteId;                    
    /** 网页地址 */
	private String url;                    
    /** 创建时间 */
	private Timestamp createTime;
	/** 匹配模式 1全匹配 2前缀匹配 3模糊匹配（包含）**/
	private Integer matchMode;
	/** 目标页名称*/
	private String pageName;
	
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
	
	public String getUrl(){
		return this.url;
	}
	
	public void setUrl(String url){
		this.url = url;
	}
	
	public Timestamp getCreateTime(){
		return this.createTime;
	}
	
	public void setCreateTime(Timestamp createTime){
		this.createTime = createTime;
	}

	public Integer getMatchMode() {
		return matchMode;
	}

	public void setMatchMode(Integer matchMode) {
		this.matchMode = matchMode;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}


	
	
}
