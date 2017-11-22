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
 * 域名统计 Entity
 * @author Wanghl.cn By Code Generator
 */
@Entity
@Table(name = "ada_domain_stat")
public class AdaDomainStat extends AbstractEntity<Integer> {
    /** ID */
	private Integer id;                    
    /** 站点ID */
	private Integer siteId;                    
    /** 渠道ID */
	private Integer domainId;                    
    /** IP */
	private Integer ip;                    
    /** PV */
	private Integer pv;                    
    /** 1-2次点击 */
	private Integer clickip1;                    
    /** 3-5次点击 */
	private Integer clickip2;                    
    /** 6-10次点击 */
	private Integer clickip3;                    
    /** 10+次点击 */
	private Integer clickip4;                    
    /** 目标页访问 */
	private Integer targetpageip;                    
    /** 日期 */
	private Date date;                    
    /** 创建时间 */
	private Timestamp createTime;
	
	
	public AdaDomainStat() {
		super();
	}

	public AdaDomainStat(Integer siteId, Integer domainId, Integer ip,
			Integer pv, Integer clickip1, Integer clickip2, Integer clickip3,
			Integer clickip4, Integer targetpageip, Date date) {
		super();
		this.siteId = siteId;
		this.domainId = domainId;
		this.ip = ip;
		this.pv = pv;
		this.clickip1 = clickip1;
		this.clickip2 = clickip2;
		this.clickip3 = clickip3;
		this.clickip4 = clickip4;
		this.targetpageip = targetpageip;
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
	
	public Integer getDomainId(){
		return this.domainId;
	}
	
	public void setDomainId(Integer domainId){
		this.domainId = domainId;
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
	
	public Integer getClickip1(){
		return this.clickip1;
	}
	
	public void setClickip1(Integer clickip1){
		this.clickip1 = clickip1;
	}
	
	public Integer getClickip2(){
		return this.clickip2;
	}
	
	public void setClickip2(Integer clickip2){
		this.clickip2 = clickip2;
	}
	
	public Integer getClickip3(){
		return this.clickip3;
	}
	
	public void setClickip3(Integer clickip3){
		this.clickip3 = clickip3;
	}
	
	public Integer getClickip4(){
		return this.clickip4;
	}
	
	public void setClickip4(Integer clickip4){
		this.clickip4 = clickip4;
	}
	
	public Integer getTargetpageip(){
		return this.targetpageip;
	}
	
	public void setTargetpageip(Integer targetpageip){
		this.targetpageip = targetpageip;
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
