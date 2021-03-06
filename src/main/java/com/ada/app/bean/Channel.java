package com.ada.app.bean;

/** 
 * 渠道
 * @author ASUS
 *
 */
public class Channel {

    /** 渠道ID */
	private Integer id;                    
    /** 站点ID */
	private Integer siteId;
	/** 渠道名称*/
	private String channelName;
	
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
	public String getChannelName() {
		return channelName;
	}
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

}
