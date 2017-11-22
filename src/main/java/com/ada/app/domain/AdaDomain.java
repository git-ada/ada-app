package com.ada.app.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/** 
 * 域名
 * @author ASUS
 *
 */
@Entity
@Table(name = "ada_domain")
public class AdaDomain {

    /** 域名ID */
	private Integer id;                    
    /** 站点ID */
	private Integer siteId;
	/** domain*/
	private String domain;
	
	@Id	
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public Integer getSiteId() {
		return siteId;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	

}
