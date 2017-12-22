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
	/** IP */
	private Integer uv; 
	/** IP */
	private Integer adIP;  
    /** PV */
	private Integer adPv;   
	/** PV */
	private Integer aduv;   
    /** PV */
	private Integer notAdIp;    
	/** IP */
	private Integer notAdPv;
	/** PV */
    private Integer notAdUv;  

    /** 日期 */
	private Date date;                    
    /** 创建时间 */
	private Timestamp createTime;

	public AdaSiteStat(Integer ip, Integer pv, Integer adIP,
			Integer adPv, Integer notAdIp, Integer notAdPv, Date date) {
		super();
		this.ip = ip;
		this.pv = pv;
		this.adIP = adIP;
		this.adPv = adPv;
		this.notAdIp = notAdIp;
		this.notAdPv = notAdPv;
		this.date = date;
	}


	public AdaSiteStat(Integer siteId, Integer ip, Integer pv, Integer uv,
			Integer adIP, Integer adPv, Integer aduv, Integer notAdIp,
			Integer notAdPv, Integer notAdUv, Date date) {
		super();
		this.siteId = siteId;
		this.ip = ip;
		this.pv = pv;
		this.uv = uv;
		this.adIP = adIP;
		this.adPv = adPv;
		this.aduv = aduv;
		this.notAdIp = notAdIp;
		this.notAdPv = notAdPv;
		this.notAdUv = notAdUv;
		this.date = date;
	}


	public AdaSiteStat() {
		super();
	}

	public Integer getUv() {
		return uv;
	}

	public void setUv(Integer uv) {
		this.uv = uv;
	}

	public Integer getAdIP() {
		return adIP;
	}

	public void setAdIP(Integer adIP) {
		this.adIP = adIP;
	}

	public Integer getAdPv() {
		return adPv;
	}

	public void setAdPv(Integer adPv) {
		this.adPv = adPv;
	}

	public Integer getAduv() {
		return aduv;
	}

	public void setAduv(Integer aduv) {
		this.aduv = aduv;
	}

	public Integer getNotAdIp() {
		return notAdIp;
	}

	public void setNotAdIp(Integer notAdIp) {
		this.notAdIp = notAdIp;
	}

	public Integer getNotAdPv() {
		return notAdPv;
	}

	public void setNotAdPv(Integer notAdPv) {
		this.notAdPv = notAdPv;
	}

	public Integer getNotAdUv() {
		return notAdUv;
	}

	public void setNotAdUv(Integer notAdUv) {
		this.notAdUv = notAdUv;
	}


	public AdaSiteStat(Integer siteId, Integer ip, Integer pv, Date date,Integer uv,Integer adIP,Integer adPv,Integer aduv) {
		super();
		this.siteId = siteId;
		this.ip = ip;
		this.pv = pv;
		this.date = date;
		this.uv = uv;
		this.adIP = adIP;
		this.adPv = adPv;
		this.aduv = aduv;
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
