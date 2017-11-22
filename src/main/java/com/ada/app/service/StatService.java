package com.ada.app.service;

import java.util.Date;

import com.ada.app.bean.ChannelStat;
import com.ada.app.bean.DomainStat;
import com.ada.app.bean.SiteStat;

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
	public SiteStat statSite(Integer site,Date date);
	
	/**
	 * 统计域名
	 * @param channelId
	 * @return
	 */
	public DomainStat statDomain(Integer siteId,Integer domainId,Date date);

	/**
	 * 统计渠道
	 * @param channelId
	 * @return
	 */
	public ChannelStat statChannel(Integer siteId,Integer channelId,Date date);

}
