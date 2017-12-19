package com.ada.app.bean;

import java.util.Date;

/**
 * 域名统计结果
 */
public class AdaDomainNotadTotalStat {
	
	private Date date;
	private Integer allIp;
	private Integer allPv;

	public AdaDomainNotadTotalStat() {
		super();
	}

	public AdaDomainNotadTotalStat(Date date, Integer allIp, Integer allPv) {
		super();
		this.date = date;
		this.allIp = allIp;
		this.allPv = allPv;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getAllIp() {
		return allIp;
	}

	public void setAllIp(Integer allIp) {
		this.allIp = allIp;
	}

	public Integer getAllPv() {
		return allPv;
	}

	public void setAllPv(Integer allPv) {
		this.allPv = allPv;
	}

	
	
	
	
}
