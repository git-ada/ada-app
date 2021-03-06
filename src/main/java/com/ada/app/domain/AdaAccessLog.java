//package com.ada.app.domain;
//
//import java.io.Serializable;
//import java.util.Date;
//import java.sql.Timestamp;
//import java.math.BigDecimal;
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.Id;
//import javax.persistence.Table;
//import cn.com.jiand.mvc.framework.domain.AbstractEntity;
//
///**
// * 访问日志 Entity
// * @author Wanghl.cn By Code Generator
// */
//@Entity
//@Table(name = "ada_access_log")
//public class AdaAccessLog extends AbstractEntity<Integer> {
//    /** id */
//	private Integer id;                    
//    /** 站点ID */
//	private Integer siteId;                    
//    /** 域名ID */
//	private Integer domainId;                    
//    /** 渠道ID */
//	private Integer channelId;                    
//    /** IP地址 */
//	private String ipAddress;                    
//    /** 客户端ID */
//	private String uuid;                    
//    /** 浏览页 */
//	private String url;                    
//    /** 客户端头信息 */
//	private String useragent;                    
//    /** 操作系统 */
//	private String os;                    
//    /** 浏览器 */
//	private String browser;                    
//    /** 屏幕大小 */
//	private String screenSize;                    
//    /** 页面大小 */
//	private String pageSize;                    
//    /** 引用页 */
//	private String referer;                    
//    /** 在Iframe中 */
//	private Integer iframe;                    
//    /** 首次访问时间 */
//	private Timestamp firstTime;                    
//    /** 当天首次访问时间 */
//	private Timestamp todayTime;                    
//    /** 客户端请求时间 */
//	private Timestamp requestTime;                    
//    /** 创建时间 */
//	private Timestamp createTime;                    
//	
//	@Id	
//	@GeneratedValue
//	public Integer getId(){
//		return this.id;
//	}
//	
//	public void setId(Integer id){
//		this.id = id;
//	}
//	
//	public Integer getSiteId(){
//		return this.siteId;
//	}
//	
//	public void setSiteId(Integer siteId){
//		this.siteId = siteId;
//	}
//	
//	public Integer getDomainId(){
//		return this.domainId;
//	}
//	
//	public void setDomainId(Integer domainId){
//		this.domainId = domainId;
//	}
//	
//	public Integer getChannelId(){
//		return this.channelId;
//	}
//	
//	public void setChannelId(Integer channelId){
//		this.channelId = channelId;
//	}
//	
//	public String getIpAddress(){
//		return this.ipAddress;
//	}
//	
//	public void setIpAddress(String ipAddress){
//		this.ipAddress = ipAddress;
//	}
//	
//	public String getUuid(){
//		return this.uuid;
//	}
//	
//	public void setUuid(String uuid){
//		this.uuid = uuid;
//	}
//	
//	public String getUrl(){
//		return this.url;
//	}
//	
//	public void setUrl(String url){
//		this.url = url;
//	}
//	
//	public String getUseragent(){
//		return this.useragent;
//	}
//	
//	public void setUseragent(String useragent){
//		this.useragent = useragent;
//	}
//	
//	public String getOs(){
//		return this.os;
//	}
//	
//	public void setOs(String os){
//		this.os = os;
//	}
//	
//	public String getBrowser(){
//		return this.browser;
//	}
//	
//	public void setBrowser(String browser){
//		this.browser = browser;
//	}
//	
//	public String getScreenSize(){
//		return this.screenSize;
//	}
//	
//	public void setScreenSize(String screenSize){
//		this.screenSize = screenSize;
//	}
//	
//	public String getPageSize(){
//		return this.pageSize;
//	}
//	
//	public void setPageSize(String pageSize){
//		this.pageSize = pageSize;
//	}
//	
//	public String getReferer(){
//		return this.referer;
//	}
//	
//	public void setReferer(String referer){
//		this.referer = referer;
//	}
//	
//	public Integer getIframe(){
//		return this.iframe;
//	}
//	
//	public void setIframe(Integer iframe){
//		this.iframe = iframe;
//	}
//	
//	public Timestamp getFirstTime(){
//		return this.firstTime;
//	}
//	
//	public void setFirstTime(Timestamp firstTime){
//		this.firstTime = firstTime;
//	}
//	
//	public Timestamp getTodayTime(){
//		return this.todayTime;
//	}
//	
//	public void setTodayTime(Timestamp todayTime){
//		this.todayTime = todayTime;
//	}
//	
//	public Timestamp getRequestTime(){
//		return this.requestTime;
//	}
//	
//	public void setRequestTime(Timestamp requestTime){
//		this.requestTime = requestTime;
//	}
//	
//	public Timestamp getCreateTime(){
//		return this.createTime;
//	}
//	
//	public void setCreateTime(Timestamp createTime){
//		this.createTime = createTime;
//	}
//	
//	
//}
