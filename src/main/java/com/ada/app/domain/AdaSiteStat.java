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
 * 站点统计 Entity
 * @author Wanghl.cn By Code Generator
 */
@Entity
@Table(name = "ada_site_stat")
public class AdaSiteStat extends AbstractEntity<Integer> {
    /** ID */
	private Integer id;                    
    /** 站点ID */
	private Integer siteId;                    
    /** IP */
	private Integer ip;                    
    /** PV */
	private Integer pv;                    
    /** 日期 */
	private Date date;                    
    /** 创建时间 */
	private Timestamp createTime;
	
	public AdaSiteStat() {
		super();
	}

	public AdaSiteStat(Integer siteId, Integer ip, Integer pv, Date date) {
		super();
		this.siteId = siteId;
		this.ip = ip;
		this.pv = pv;
		this.date = date;
	}

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
	
	public Integer getIp(){
		return this.ip;
	}
	
	public void setIp(Integer ip){
		this.ip = ip;
	}
	
	public Integer getPv(){
		return this.pv;
	}
	
	public void setPv(Integer pv){
		this.pv = pv;
	}
	
	public Date getDate(){
		return this.date;
	}
	
	public void setDate(Date date){
		this.date = date;
	}
	
	public Timestamp getCreateTime(){
		return this.createTime;
	}
	
	public void setCreateTime(Timestamp createTime){
		this.createTime = createTime;
	}
	
	
}
