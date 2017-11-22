package com.ada.app.domain;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import cn.com.jiand.mvc.framework.domain.AbstractEntity;

/**
 * 域名统计结果
 */
@Entity
@Table(name = "ada_domain_stat")
public class AdaDomainStat extends AbstractEntity<Integer>{

	/** ID */
	private Integer id; 
	private Integer siteId;
	private Integer domainId;
	private Integer ip;
	private Integer pv;
	private Integer clickip1;
	private Integer clickip2;
	private Integer clickip3;
	private Integer clickip4;
	private Integer targetpageip;
	private Date date;
	/** 创建时间 */
	private Timestamp createTime;

	public AdaDomainStat() {
		super();
	}

	@Id	
	@GeneratedValue
	public Integer getSiteId() {
		return siteId;
	}

	

	public Integer getIp() {
		return ip;
	}

	public Integer getPv() {
		return pv;
	}

	public Integer getClickip1() {
		return clickip1;
	}

	public Integer getClickip2() {
		return clickip2;
	}

	public Integer getClickip3() {
		return clickip3;
	}

	public Integer getClickip4() {
		return clickip4;
	}

	public Integer getTargetpageip() {
		return targetpageip;
	}

	public Integer getDomainId() {
		return domainId;
	}

	public void setDomainId(Integer domainId) {
		this.domainId = domainId;
	}

	public Date getDate() {
		return date;
	}

	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
	}

	

	public void setIp(Integer ip) {
		this.ip = ip;
	}

	public void setPv(Integer pv) {
		this.pv = pv;
	}

	public void setClickip1(Integer clickip1) {
		this.clickip1 = clickip1;
	}

	public void setClickip2(Integer clickip2) {
		this.clickip2 = clickip2;
	}

	public void setClickip3(Integer clickip3) {
		this.clickip3 = clickip3;
	}

	public void setClickip4(Integer clickip4) {
		this.clickip4 = clickip4;
	}

	public void setTargetpageip(Integer targetpageip) {
		this.targetpageip = targetpageip;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	private AdaDomain adaDomain;


	@ManyToOne(cascade = CascadeType.REFRESH, targetEntity = AdaChannel.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "domainId", insertable = false, updatable = false)
	@NotFound(action=NotFoundAction.IGNORE)
	public AdaDomain getAdaDomain() {
		return adaDomain;
	}

	public void setAdaDomain(AdaDomain adaDomain) {
		this.adaDomain = adaDomain;
	}
	
}
