package com.ada.app.bean;

import java.sql.Timestamp;
import java.util.Date;

public class SiteBaseStatBean {
	     
    /** IP */
	private Integer ip;                    
    /** PV */
	private Integer pv;
	/** 结束时间 */
	private Date date;
	
	
	
	public SiteBaseStatBean() {
		super();
	}
	public SiteBaseStatBean(Integer ip, Integer pv, Date date) {
		super();
		this.ip = ip;
		this.pv = pv;
		this.date = date;
	}
	public Integer getIp() {
		return ip;
	}
	public void setIp(Integer ip) {
		this.ip = ip;
	}
	public Integer getPv() {
		return pv;
	}
	public void setPv(Integer pv) {
		this.pv = pv;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
		
}
