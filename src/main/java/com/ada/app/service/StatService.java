package com.ada.app.service;

import java.util.Date;
import java.util.Set;

import com.ada.app.bean.DomainAreaStat;
import com.ada.app.domain.AdaChannelStat;
import com.ada.app.domain.AdaDomainAd15mStat;
import com.ada.app.domain.AdaDomainAdStat;
import com.ada.app.domain.AdaDomainNotad15mStat;
import com.ada.app.domain.AdaDomainNotadStat;
import com.ada.app.domain.AdaDomainStat;
import com.ada.app.domain.AdaSiteStat;

/**
 * 统计数据
 * @author ASUS
 *
 */
public interface StatService {
	/**
	 * 统计站点
	 * @param site
	 * @return
	 */
	public AdaSiteStat statSite(Integer site,Date date);
	
	/**
	 * 统计域名
	 * @param channelId
	 * @return
	 */
	public AdaDomainStat statDomain(Integer siteId,Integer domainId,Date date);
	
	/**
	 * 统计域名广告
	 * @param channelId
	 * @return
	 */
	public AdaDomainAdStat statDomainAd(Integer siteId,Integer domainId,Date date);
	
	/**
	 * 统计域名非广告
	 * @param channelId
	 * @return
	 */
	public AdaDomainNotadStat statDomainNotAd(Integer siteId,Integer domainId,Date date);
	
	/**
	 * 统计域名广告15分钟数据
	 * @param channelId
	 * @return
	 */
	public AdaDomainAd15mStat statDomainAd15m(Integer siteId,Integer domainId,Date date);
	
	/**
	 * 统计域名非广告15分钟数据
	 * @param channelId
	 * @return
	 */
	public AdaDomainNotad15mStat statDomainNotAd15m(Integer siteId,Integer domainId,Date date);

	/**
	 * 统计渠道
	 * @param channelId
	 * @return
	 */
	public AdaChannelStat statChannel(Integer siteId,Integer channelId,Date date);
	
	/**
	 * 统计域名IP数
	 * @param siteId
	 * @param domainId
	 * @param date
	 * @return
	 */
	public Integer statDomainIP(Integer domainId,Date date);
	/**
	 * 统计 域名 地域
	 * @param regionName
	 * @param domainId
	 * @param date
	 * @return
	 */
	public DomainAreaStat statDomainRegion(String regionName,Integer domainId,Date date);
	
	/**
	 * 统计域名地域广告入口
	 * @param siteId
	 * @param domainId
	 * @param date
	 * @return
	 */
	public DomainAreaStat statDomainRegionAd(String regionName,Integer domainId,Date date);
	
	/**
	 * 统计域名地域非广告入口
	 * @param siteId
	 * @param domainId
	 * @param date
	 * @return
	 */
	public DomainAreaStat statDomainRegionNotAd(String regionName,Integer domainId,Date date);
	
	/**
	 * 获取当天城市列表
	 * @param domainId
	 * @param date
	 * @return
	 */
	public Set<String> getCityList(Integer domainId,Date date);
	

}
