package com.ada.app.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import com.ada.app.bean.DomainAreaStat;
import com.ada.app.constant.RedisKeys;
import com.ada.app.dao.AdaDomainAd15mStatDao;
import com.ada.app.dao.AdaDomainNotAd15mStatDao;
import com.ada.app.domain.AdaChannelStat;
import com.ada.app.domain.AdaDomainAd15mStat;
import com.ada.app.domain.AdaDomainAdStat;
import com.ada.app.domain.AdaDomainNotad15mStat;
import com.ada.app.domain.AdaDomainNotadStat;
import com.ada.app.domain.AdaDomainStat;
import com.ada.app.domain.AdaSiteStat;
import com.ada.app.service.JedisPools;
import com.ada.app.service.StatService;

@Service
public class StatServiceImpl implements StatService{
	
	@Autowired
    private  JedisPools jedisPools;//自动切库,周一至周日每天一库
	
	@Autowired
	private AdaDomainNotAd15mStatDao adaDomainNotAd15mStatDao;
	@Autowired
	private AdaDomainAd15mStatDao adaDomainAd15mStatDao;
	
	public AdaSiteStat statSite(Integer site, Date date) {
		Jedis jedis = getJedis(date);
		Integer sitePV = 0;
		//取出站点PV
		String _SitePV = jedis.get(RedisKeys.SitePV.getKey()+site+"");
		if(_SitePV != null) sitePV = Integer.valueOf(_SitePV);
		//取出站点IPSet集合
		int siteIP = jedis.scard(RedisKeys.SiteIP.getKey()+site+"").intValue();
		returnResource(date,jedis);
		return new AdaSiteStat(site, siteIP, sitePV, date);
	}
	
	public AdaChannelStat statChannel(Integer siteId, Integer channelId, Date date) {
		Jedis jedis = getJedis(date);
		Integer site_ChannelPV = 0;
		Integer clickip1 = 0;
		Integer clickip2 = 0;
		Integer clickip3 = 0;
		Integer clickip4 = 0;
		Integer staytimeip1 = 0;
		Integer staytimeip2 = 0;
		Integer staytimeip3 = 0;
		Integer staytimeip4 = 0;
		Integer scrollip1 = 0;
		Integer scrollip2 = 0;
		Integer scrollip3 = 0;
		Integer scrollip4 = 0;
		Integer moveip1 = 0;
		Integer moveip2 = 0;
		Integer moveip3 = 0;
		Integer moveip4 = 0;
		
		//取出渠道IPSet集合
		int channelIP = jedis.scard(RedisKeys.ChannelIP.getKey()+channelId+"").intValue();
		//取出渠道PV 
		String ChannelPV = jedis.get(RedisKeys.ChannelPV.getKey()+channelId+"");
		if(ChannelPV != null) site_ChannelPV = Integer.valueOf(ChannelPV);
		//取出渠道进入目标页IP集合
		int targetpageIP  = jedis.scard(RedisKeys.ChannelTIP.getKey()+channelId+"").intValue();
		//取出渠道多个点击区间次数
		String ChannelC1IP = jedis.get(RedisKeys.ChannelC1IP.getKey()+channelId+"");
		if(ChannelC1IP != null) clickip1 = Integer.valueOf(ChannelC1IP);
		
		String ChannelC2IP = jedis.get(RedisKeys.ChannelC2IP.getKey()+channelId+"");
		if(ChannelC2IP != null) clickip2 = Integer.valueOf(ChannelC2IP);
		
		String ChannelC3IP = jedis.get(RedisKeys.ChannelC3IP.getKey()+channelId+"");
		if(ChannelC3IP != null) clickip3 = Integer.valueOf(ChannelC3IP);
		
		String ChannelC4IP = jedis.get(RedisKeys.ChannelC4IP.getKey()+channelId+"");
		if(ChannelC4IP != null) clickip4 = Integer.valueOf(ChannelC4IP);
		//取出渠道多个停留区间
		String Staytimeip1 = jedis.get(RedisKeys.ChannelStayTime1IP.getKey()+channelId+"");
		if(Staytimeip1 !=null) staytimeip1 = Integer.valueOf(Staytimeip1);
		
		String Staytimeip2 = jedis.get(RedisKeys.ChannelStayTime2IP.getKey()+channelId+"");
		if(Staytimeip2 !=null) staytimeip2 = Integer.valueOf(Staytimeip2);
		
		String Staytimeip3 = jedis.get(RedisKeys.ChannelStayTime3IP.getKey()+channelId+"");
		if(Staytimeip3 !=null) staytimeip3 = Integer.valueOf(Staytimeip3);
		
		String Staytimeip4 = jedis.get(RedisKeys.ChannelStayTime4IP.getKey()+channelId+"");
		if(Staytimeip4 !=null) staytimeip4 = Integer.valueOf(Staytimeip4);
		//取出渠道多个滚动区间
		String Scrollip1 = jedis.get(RedisKeys.ChannelScroll1IP.getKey()+channelId+"");
		if(Scrollip1 != null) scrollip1 = Integer.valueOf(Scrollip1);
		
		String Scrollip2 = jedis.get(RedisKeys.ChannelScroll2IP.getKey()+channelId+"");
		if(Scrollip2 != null) scrollip2 = Integer.valueOf(Scrollip2);
		
		String Scrollip3 = jedis.get(RedisKeys.ChannelScroll3IP.getKey()+channelId+"");
		if(Scrollip3 != null) scrollip3 = Integer.valueOf(Scrollip3);
		
		String Scrollip4 = jedis.get(RedisKeys.ChannelScroll4IP.getKey()+channelId+"");
		if(Scrollip4 != null) scrollip4 = Integer.valueOf(Scrollip4);
		//取出渠道多个移动区间
		String Moveip1 = jedis.get(RedisKeys.ChannelMouseMove1IP.getKey()+channelId+"");
		if(Moveip1 != null) moveip1 = Integer.valueOf(Moveip1);
		
		String Moveip2 = jedis.get(RedisKeys.ChannelMouseMove2IP.getKey()+channelId+"");
		if(Moveip2 != null) moveip2 = Integer.valueOf(Moveip2);
		
		String Moveip3 = jedis.get(RedisKeys.ChannelMouseMove3IP.getKey()+channelId+"");
		if(Moveip3 != null) moveip3 = Integer.valueOf(Moveip3);
		
		String Moveip4 = jedis.get(RedisKeys.ChannelMouseMove4IP.getKey()+channelId+"");
		if(Moveip4 != null) moveip4 = Integer.valueOf(Moveip4);
		//老用户数
		int olduserip = jedis.scard(RedisKeys.ChannelOldUserIP.getKey()+channelId+"").intValue();
		
		returnResource(date,jedis);
		return new AdaChannelStat(siteId, channelId, channelIP, site_ChannelPV, clickip1, clickip2, clickip3, clickip4, targetpageIP, date,staytimeip1,staytimeip2,staytimeip3,staytimeip4,
				scrollip1,scrollip2,scrollip3,scrollip4,moveip1,moveip2,moveip3,moveip4,olduserip);
	}
	
	
	@Override
	public Integer statDomainIP(Integer domainId,Date date) {
		Jedis jedis = getJedis(date);
		//取出域名IPSet集合
		int domainIP = jedis.scard(RedisKeys.DomainIP.getKey()+domainId+"").intValue();
		returnResource(date,jedis);
		return domainIP;
	}
	
	public AdaDomainStat statDomain(Integer siteId, Integer domainId, Date date) {
		Jedis jedis = getJedis(date);
		Integer site_domainPV = 0;
		Integer clickip1 = 0;
		Integer clickip2 = 0;
		Integer clickip3 = 0;
		Integer clickip4 = 0;
		Integer staytimeip1 = 0;
		Integer staytimeip2 = 0;
		Integer staytimeip3 = 0;
		Integer staytimeip4 = 0;
		Integer scrollip1 = 0;
		Integer scrollip2 = 0;
		Integer scrollip3 = 0;
		Integer scrollip4 = 0;
		Integer moveip1 = 0;
		Integer moveip2 = 0;
		Integer moveip3 = 0;
		Integer moveip4 = 0;
		Integer oldip = 0;
		Integer loginip = 0;
		Integer olduserip  = 0;
		Integer domainUV  = 0;
		Integer domainIP  = 0;
		Integer targetpageIP = 0;
		
		//取出域名IPSet集合
		domainIP = jedis.scard(RedisKeys.DomainIP.getKey()+domainId+"").intValue();
		if(domainIP != 0){
			//取出域名uv
			domainUV = jedis.scard(RedisKeys.DomainUV.getKey()+domainId+"").intValue();
			//取出域名PV 
			String domainPV = jedis.get(RedisKeys.DomainPV.getKey()+domainId+"");
			if(domainPV != null) site_domainPV = Integer.valueOf(domainPV);
			//老ip
			String oldIP = jedis.get(RedisKeys.DomainOldIP.getKey()+domainId+"");
			if(oldIP != null) oldip = Integer.valueOf(oldIP);
			//用户登录数
			String loginIP = jedis.get(RedisKeys.DomainLoginIp.getKey()+domainId+"");
			if(loginIP != null) loginip = Integer.valueOf(loginIP);
			//取出域名进入目标页IP集合
			targetpageIP  = jedis.scard(RedisKeys.DomainTIP.getKey()+domainId+"").intValue();
			//取出域名多个点击区间次数
			String domainC1IP = jedis.get(RedisKeys.DomainC1IP.getKey()+domainId+"");
			if(domainC1IP != null) clickip1 = Integer.valueOf(domainC1IP);
			
			String domainC2IP = jedis.get(RedisKeys.DomainC2IP.getKey()+domainId+"");
			if(domainC2IP != null) clickip2 = Integer.valueOf(domainC2IP);
			
			String domainC3IP = jedis.get(RedisKeys.DomainC3IP.getKey()+domainId+"");
			if(domainC3IP != null) clickip3 = Integer.valueOf(domainC3IP);
			
			String domainC4IP = jedis.get(RedisKeys.DomainC4IP.getKey()+domainId+"");
			if(domainC4IP != null) clickip4 = Integer.valueOf(domainC4IP);
			
			//取出渠道多个停留区间
			String Staytimeip1 = jedis.get(RedisKeys.DomainStayTime1IP.getKey()+domainId+"");
			if(Staytimeip1 !=null) staytimeip1 = Integer.valueOf(Staytimeip1);
			
			String Staytimeip2 = jedis.get(RedisKeys.DomainStayTime2IP.getKey()+domainId+"");
			if(Staytimeip2 !=null) staytimeip2 = Integer.valueOf(Staytimeip2);
			
			String Staytimeip3 = jedis.get(RedisKeys.DomainStayTime3IP.getKey()+domainId+"");
			if(Staytimeip3 !=null) staytimeip3 = Integer.valueOf(Staytimeip3);
			
			String Staytimeip4 = jedis.get(RedisKeys.DomainStayTime4IP.getKey()+domainId+"");
			if(Staytimeip4 !=null) staytimeip4 = Integer.valueOf(Staytimeip4);
			//取出渠道多个滚动区间
			String Scrollip1 = jedis.get(RedisKeys.DomainScroll1IP.getKey()+domainId+"");
			if(Scrollip1 != null) scrollip1 = Integer.valueOf(Scrollip1);
			
			String Scrollip2 = jedis.get(RedisKeys.DomainScroll2IP.getKey()+domainId+"");
			if(Scrollip2 != null) scrollip2 = Integer.valueOf(Scrollip2);
			
			String Scrollip3 = jedis.get(RedisKeys.DomainScroll3IP.getKey()+domainId+"");
			if(Scrollip3 != null) scrollip3 = Integer.valueOf(Scrollip3);
			
			String Scrollip4 = jedis.get(RedisKeys.DomainScroll4IP.getKey()+domainId+"");
			if(Scrollip4 != null) scrollip4 = Integer.valueOf(Scrollip4);
			//取出渠道多个移动区间
			String Moveip1 = jedis.get(RedisKeys.DomainMouseMove1IP.getKey()+domainId+"");
			if(Moveip1 != null) moveip1 = Integer.valueOf(Moveip1);
			
			String Moveip2 = jedis.get(RedisKeys.DomainMouseMove2IP.getKey()+domainId+"");
			if(Moveip2 != null) moveip2 = Integer.valueOf(Moveip2);
			
			String Moveip3 = jedis.get(RedisKeys.DomainMouseMove3IP.getKey()+domainId+"");
			if(Moveip3 != null) moveip3 = Integer.valueOf(Moveip3);
			
			String Moveip4 = jedis.get(RedisKeys.DomainMouseMove4IP.getKey()+domainId+"");
			if(Moveip4 != null) moveip4 = Integer.valueOf(Moveip4);
			//老用户数
			olduserip = jedis.scard(RedisKeys.DomainOldUserIP.getKey()+domainId+"").intValue();
		}
		returnResource(date,jedis);
		return new AdaDomainStat(siteId, domainId, domainIP, site_domainPV, clickip1, clickip2, clickip3, clickip4, targetpageIP, date,staytimeip1,staytimeip2,staytimeip3,staytimeip4,
				scrollip1,scrollip2,scrollip3,scrollip4,moveip1,moveip2,moveip3,moveip4,olduserip,oldip,loginip,domainUV);
//		return new AdaDomainStat(siteId, domainId, 4, 1, 2, 2, 2, 5, 5, date,5,5,5,5,
//				5,5,5,8,8,8,8,8,8,8,8,6);
	}
	
	@Override
	public AdaDomainAdStat statDomainAd(Integer siteId, Integer domainId, Date date) {
		Jedis jedis = getJedis(date);
		Integer site_domainPV = 0;
		Integer clickip1 = 0;
		Integer clickip2 = 0;
		Integer clickip3 = 0;
		Integer clickip4 = 0;
		Integer staytimeip1 = 0;
		Integer staytimeip2 = 0;
		Integer staytimeip3 = 0;
		Integer staytimeip4 = 0;
		Integer scrollip1 = 0;
		Integer scrollip2 = 0;
		Integer scrollip3 = 0;
		Integer scrollip4 = 0;
		Integer moveip1 = 0;
		Integer moveip2 = 0;
		Integer moveip3 = 0;
		Integer moveip4 = 0;
		Integer oldip = 0;
		Integer loginip = 0;
		Integer targetpageIP =0;
		Integer olduserip =0;
		Integer domainUV =0;
		Integer domainIP =0;
		//取出域名IPSet集合
		domainIP = jedis.scard(RedisKeys.DomainAdIP.getKey()+domainId+"").intValue();
		if(domainIP != 0){
			//取出域名uv
			domainUV = jedis.scard(RedisKeys.DomainAdUV.getKey()+domainId+"").intValue();
			//取出域名PV 
			String domainPV = jedis.get(RedisKeys.DomainAdPV.getKey()+domainId+"");
			if(domainPV != null) site_domainPV = Integer.valueOf(domainPV);
			//老ip
			String oldIP = jedis.get(RedisKeys.DomainAdOldIP.getKey()+domainId+"");
			if(oldIP != null) oldip = Integer.valueOf(oldIP);
			//用户登录数
			String loginIP = jedis.get(RedisKeys.DomainAdLoginIp.getKey()+domainId+"");
			if(loginIP != null) loginip = Integer.valueOf(loginIP);
			//取出域名进入目标页IP集合
			targetpageIP  = jedis.scard(RedisKeys.DomainAdTIP.getKey()+domainId+"").intValue();
			//取出域名多个点击区间次数
			String domainC1IP = jedis.get(RedisKeys.DomainAdC1IP.getKey()+domainId+"");
			if(domainC1IP != null) clickip1 = Integer.valueOf(domainC1IP);
			
			String domainC2IP = jedis.get(RedisKeys.DomainAdC2IP.getKey()+domainId+"");
			if(domainC2IP != null) clickip2 = Integer.valueOf(domainC2IP);
			
			String domainC3IP = jedis.get(RedisKeys.DomainAdC3IP.getKey()+domainId+"");
			if(domainC3IP != null) clickip3 = Integer.valueOf(domainC3IP);
			
			String domainC4IP = jedis.get(RedisKeys.DomainAdC4IP.getKey()+domainId+"");
			if(domainC4IP != null) clickip4 = Integer.valueOf(domainC4IP);
			
			//取出渠道多个停留区间
			String Staytimeip1 = jedis.get(RedisKeys.DomainAdStayTime1IP.getKey()+domainId+"");
			if(Staytimeip1 !=null) staytimeip1 = Integer.valueOf(Staytimeip1);
			
			String Staytimeip2 = jedis.get(RedisKeys.DomainAdStayTime2IP.getKey()+domainId+"");
			if(Staytimeip2 !=null) staytimeip2 = Integer.valueOf(Staytimeip2);
			
			String Staytimeip3 = jedis.get(RedisKeys.DomainAdStayTime3IP.getKey()+domainId+"");
			if(Staytimeip3 !=null) staytimeip3 = Integer.valueOf(Staytimeip3);
			
			String Staytimeip4 = jedis.get(RedisKeys.DomainAdStayTime4IP.getKey()+domainId+"");
			if(Staytimeip4 !=null) staytimeip4 = Integer.valueOf(Staytimeip4);
			//取出渠道多个滚动区间
			String Scrollip1 = jedis.get(RedisKeys.DomainAdScroll1IP.getKey()+domainId+"");
			if(Scrollip1 != null) scrollip1 = Integer.valueOf(Scrollip1);
			
			String Scrollip2 = jedis.get(RedisKeys.DomainAdScroll2IP.getKey()+domainId+"");
			if(Scrollip2 != null) scrollip2 = Integer.valueOf(Scrollip2);
			
			String Scrollip3 = jedis.get(RedisKeys.DomainAdScroll3IP.getKey()+domainId+"");
			if(Scrollip3 != null) scrollip3 = Integer.valueOf(Scrollip3);
			
			String Scrollip4 = jedis.get(RedisKeys.DomainAdScroll4IP.getKey()+domainId+"");
			if(Scrollip4 != null) scrollip4 = Integer.valueOf(Scrollip4);
			//取出渠道多个移动区间
			String Moveip1 = jedis.get(RedisKeys.DomainAdMouseMove1IP.getKey()+domainId+"");
			if(Moveip1 != null) moveip1 = Integer.valueOf(Moveip1);
			
			String Moveip2 = jedis.get(RedisKeys.DomainAdMouseMove2IP.getKey()+domainId+"");
			if(Moveip2 != null) moveip2 = Integer.valueOf(Moveip2);
			
			String Moveip3 = jedis.get(RedisKeys.DomainAdMouseMove3IP.getKey()+domainId+"");
			if(Moveip3 != null) moveip3 = Integer.valueOf(Moveip3);
			
			String Moveip4 = jedis.get(RedisKeys.DomainAdMouseMove4IP.getKey()+domainId+"");
			if(Moveip4 != null) moveip4 = Integer.valueOf(Moveip4);
			//老用户数
			olduserip = jedis.scard(RedisKeys.DomainAdOldUserIP.getKey()+domainId+"").intValue();
		}
		returnResource(date,jedis);
		return new AdaDomainAdStat(siteId, domainId, domainIP, site_domainPV, domainUV, olduserip, loginip, oldip, targetpageIP, clickip1, clickip2, 
				clickip3, clickip4, staytimeip1, staytimeip2, staytimeip3, staytimeip4, scrollip1, scrollip2, scrollip3, scrollip4, moveip1, moveip2, moveip3, moveip4, date);
//		return new AdaDomainAdStat(siteId, domainId, 1, 1, 1, 1, 1, 1, 2, 
//				1, 3, 2, 1, 1, 2, 2, 1, 4, 4,
//				6, 3, 2, 1, 4, 4, date);
	}

	@Override
	public AdaDomainNotadStat statDomainNotAd(Integer siteId, Integer domainId, Date date) {
		Integer site_domainPV = 0;
		Integer clickip1 = 0;
		Integer clickip2 = 0;
		Integer clickip3 = 0;
		Integer clickip4 = 0;
		Integer staytimeip1 = 0;
		Integer staytimeip2 = 0;
		Integer staytimeip3 = 0;
		Integer staytimeip4 = 0;
		Integer scrollip1 = 0;
		Integer scrollip2 = 0;
		Integer scrollip3 = 0;
		Integer scrollip4 = 0;
		Integer moveip1 = 0;
		Integer moveip2 = 0;
		Integer moveip3 = 0;
		Integer moveip4 = 0;
		Integer oldip = 0;
		Integer loginip = 0;
		Integer targetpageIP =0;
		Integer olduserip =0;
		Integer domainUV = 0;
		Integer domainIP  = 0;
		//当前汇总数据,包含广告与非广告
		AdaDomainStat statDomain = statDomain(siteId, domainId, date);
		//广告数据
		AdaDomainAdStat statDomainAd = statDomainAd(siteId, domainId, date);
		//非广告数据 = 总统计数据 - 广告数据
		
		domainIP = statDomain.getIp()-statDomainAd.getIp();
		if(domainIP != 0){
			site_domainPV = statDomain.getPv()- statDomainAd.getPv();
			domainUV = statDomain.getUv()- statDomainAd.getUv();
			targetpageIP = statDomain.getTargetpageip()- statDomainAd.getTargetpageip();
			loginip = statDomain.getLoginip()- statDomainAd.getLoginip();
			olduserip = statDomain.getOlduserip()- statDomainAd.getOlduserip();
			oldip = statDomain.getOldip()- statDomainAd.getOldip();
			clickip1  = statDomain.getClickip1()- statDomainAd.getClickip1();
			clickip2  = statDomain.getClickip2()- statDomainAd.getClickip2();
			clickip3  = statDomain.getClickip3()- statDomainAd.getClickip3();
			clickip4  = statDomain.getClickip4()- statDomainAd.getClickip4();
			staytimeip1 = statDomain.getStaytimeip1()- statDomainAd.getStaytimeip1();
			staytimeip2 = statDomain.getStaytimeip2()- statDomainAd.getStaytimeip2();
			staytimeip3 = statDomain.getStaytimeip3()- statDomainAd.getStaytimeip3();
			staytimeip4 = statDomain.getStaytimeip4()- statDomainAd.getStaytimeip4();
			scrollip1 = statDomain.getScrollip1()- statDomainAd.getScrollip1();
			scrollip1 = statDomain.getScrollip2()- statDomainAd.getScrollip2();
			scrollip1 = statDomain.getScrollip3()- statDomainAd.getScrollip3();
			scrollip1 = statDomain.getScrollip4()- statDomainAd.getScrollip4();
			moveip1 = statDomain.getMoveip1()- statDomainAd.getMoveip1();
			moveip2 = statDomain.getMoveip2()- statDomainAd.getMoveip2();
			moveip3 = statDomain.getMoveip3()- statDomainAd.getMoveip3();
			moveip4 = statDomain.getMoveip4()- statDomainAd.getMoveip4();
		}
		return new AdaDomainNotadStat(siteId, domainId, domainIP, site_domainPV, domainUV, olduserip, loginip, oldip, targetpageIP, clickip1, clickip2, 
				clickip3, clickip4, staytimeip1, staytimeip2, staytimeip3, staytimeip4, scrollip1, scrollip2, scrollip3, scrollip4, moveip1, moveip2, moveip3, moveip4, date);
//		return new AdaDomainNotadStat(siteId, domainId, 1, 1, 1, 1, 1, 1, 2, 
//				1, 3, 2, 1, 1, 2, 2, 1, 4, 4,
//				6, 3, 2, 1, 4, 4, date);
	}

	@Override
	public AdaDomainAd15mStat statDomainAd15m(Integer siteId, Integer domainId, Date date) {
		Integer site_domainPV = 0;
		Integer clickip1 = 0;
		Integer clickip2 = 0;
		Integer clickip3 = 0;
		Integer clickip4 = 0;
		Integer staytimeip1 = 0;
		Integer staytimeip2 = 0;
		Integer staytimeip3 = 0;
		Integer staytimeip4 = 0;
		Integer scrollip1 = 0;
		Integer scrollip2 = 0;
		Integer scrollip3 = 0;
		Integer scrollip4 = 0;
		Integer moveip1 = 0;
		Integer moveip2 = 0;
		Integer moveip3 = 0;
		Integer moveip4 = 0;
		Integer oldip = 0;
		Integer loginip = 0;
		Integer targetpageIP = 0;
		Integer olduserip =0;
		Integer domainUV = 0;
		Integer domainIP = 0;
		//当前累计广告统计数据
		AdaDomainAdStat currentAdStat = statDomainAd(siteId, domainId, date);
		//历史15分钟广告统计数据
		AdaDomainAd15mStat aDA15HS = adaDomainAd15mStatDao.findLast(siteId, domainId);
//		AdaDomainAd15mStat aDA15HS = adaDomainAd15mHistryStat(siteId, domainId);
		if(aDA15HS == null){
			aDA15HS= new AdaDomainAd15mStat(siteId, domainId, domainIP, site_domainPV, domainUV, olduserip, loginip, oldip, targetpageIP, clickip1, clickip2, clickip3, clickip4, staytimeip1, staytimeip2,
					staytimeip3, staytimeip4, scrollip1, scrollip2, scrollip3, scrollip4, moveip1, moveip2, moveip3, moveip4, date);
		}
		domainIP = currentAdStat.getIp()-aDA15HS.getIp();
		if(domainIP != 0){
			site_domainPV = currentAdStat.getPv()- aDA15HS.getPv();
			domainUV = currentAdStat.getUv()- aDA15HS.getUv();
			targetpageIP = currentAdStat.getTargetpageip()- aDA15HS.getTargetpageip();
			loginip = currentAdStat.getLoginip()- aDA15HS.getLoginip();
			olduserip = currentAdStat.getOlduserip()- aDA15HS.getOlduserip();
			oldip = currentAdStat.getOldip()- aDA15HS.getOldip();
			clickip1  = currentAdStat.getClickip1()- aDA15HS.getClickip1();
			clickip2  = currentAdStat.getClickip2()- aDA15HS.getClickip2();
			clickip3  = currentAdStat.getClickip3()- aDA15HS.getClickip3();
			clickip4  = currentAdStat.getClickip4()- aDA15HS.getClickip4();
			staytimeip1 = currentAdStat.getStaytimeip1()- aDA15HS.getStaytimeip1();
			staytimeip2 = currentAdStat.getStaytimeip2()- aDA15HS.getStaytimeip2();
			staytimeip3 = currentAdStat.getStaytimeip3()- aDA15HS.getStaytimeip3();
			staytimeip4 = currentAdStat.getStaytimeip4()- aDA15HS.getStaytimeip4();
			scrollip1 = currentAdStat.getScrollip1()- aDA15HS.getScrollip1();
			scrollip1 = currentAdStat.getScrollip2()- aDA15HS.getScrollip2();
			scrollip1 = currentAdStat.getScrollip3()- aDA15HS.getScrollip3();
			scrollip1 = currentAdStat.getScrollip4()- aDA15HS.getScrollip4();
			moveip1 = currentAdStat.getMoveip1()- aDA15HS.getMoveip1();
			moveip2 = currentAdStat.getMoveip2()- aDA15HS.getMoveip2();
			moveip3 = currentAdStat.getMoveip3()- aDA15HS.getMoveip3();
			moveip4 = currentAdStat.getMoveip4()- aDA15HS.getMoveip4();
		}
		return new AdaDomainAd15mStat(siteId, domainId, domainIP, site_domainPV, domainUV, olduserip, loginip, oldip, targetpageIP,
				clickip1, clickip2, clickip3, clickip4, staytimeip1, staytimeip2, staytimeip3, staytimeip4, scrollip1, scrollip2, 
				scrollip3, scrollip4, moveip1, moveip2, moveip3, moveip4, date);
//		return new AdaDomainAd15mStat(siteId, domainId, 1, 1, 1, 1, 1, 1, 2, 
//				1, 3, 2, 1, 1, 2, 2, 1, 4, 4,
//				6, 3, 2, 1, 4, 4, date);
	}
	
	@Override
	public AdaDomainNotad15mStat statDomainNotAd15m(Integer siteId,Integer domainId, Date date) {
		Integer site_domainPV = 0;
		Integer clickip1 = 0;
		Integer clickip2 = 0;
		Integer clickip3 = 0;
		Integer clickip4 = 0;
		Integer staytimeip1 = 0;
		Integer staytimeip2 = 0;
		Integer staytimeip3 = 0;
		Integer staytimeip4 = 0;
		Integer scrollip1 = 0;
		Integer scrollip2 = 0;
		Integer scrollip3 = 0;
		Integer scrollip4 = 0;
		Integer moveip1 = 0;
		Integer moveip2 = 0;
		Integer moveip3 = 0;
		Integer moveip4 = 0;
		Integer oldip = 0;
		Integer loginip = 0;
		Integer targetpageIP = 0;
		Integer olduserip =0;
		Integer domainUV = 0;
		Integer domainIP = 0;
		//当前累计非广告统计数据
		AdaDomainNotadStat currentNotAdStat = statDomainNotAd(siteId, domainId, date);
		//历史15分钟非广告统计数据
		AdaDomainNotad15mStat aDNA15HS = adaDomainNotAd15mStatDao.findLast(siteId, domainId);
//		AdaDomainNotad15mStat aDNA15HS = adaDomainNotAd15mHistryStat(siteId, domainId);
		if(aDNA15HS == null){
			aDNA15HS= new AdaDomainNotad15mStat(siteId, domainId, domainIP, site_domainPV, domainUV, olduserip, loginip, oldip, targetpageIP, clickip1, clickip2, clickip3, clickip4, staytimeip1, staytimeip2,
					staytimeip3, staytimeip4, scrollip1, scrollip2, scrollip3, scrollip4, moveip1, moveip2, moveip3, moveip4, date);
		}
		domainIP = currentNotAdStat.getIp()-aDNA15HS.getIp();
		if(domainIP != 0){
			site_domainPV = currentNotAdStat.getPv()- aDNA15HS.getPv();
			domainUV = currentNotAdStat.getUv()- aDNA15HS.getUv();
			targetpageIP = currentNotAdStat.getTargetpageip()- aDNA15HS.getTargetpageip();
			loginip = currentNotAdStat.getLoginip()- aDNA15HS.getLoginip();
			olduserip = currentNotAdStat.getOlduserip()- aDNA15HS.getOlduserip();
			oldip = currentNotAdStat.getOldip()- aDNA15HS.getOldip();
			clickip1  = currentNotAdStat.getClickip1()- aDNA15HS.getClickip1();
			clickip2  = currentNotAdStat.getClickip2()- aDNA15HS.getClickip2();
			clickip3  = currentNotAdStat.getClickip3()- aDNA15HS.getClickip3();
			clickip4  = currentNotAdStat.getClickip4()- aDNA15HS.getClickip4();
			staytimeip1 = currentNotAdStat.getStaytimeip1()- aDNA15HS.getStaytimeip1();
			staytimeip2 = currentNotAdStat.getStaytimeip2()- aDNA15HS.getStaytimeip2();
			staytimeip3 = currentNotAdStat.getStaytimeip3()- aDNA15HS.getStaytimeip3();
			staytimeip4 = currentNotAdStat.getStaytimeip4()- aDNA15HS.getStaytimeip4();
			scrollip1 = currentNotAdStat.getScrollip1()- aDNA15HS.getScrollip1();
			scrollip1 = currentNotAdStat.getScrollip2()- aDNA15HS.getScrollip2();
			scrollip1 = currentNotAdStat.getScrollip3()- aDNA15HS.getScrollip3();
			scrollip1 = currentNotAdStat.getScrollip4()- aDNA15HS.getScrollip4();
			moveip1 = currentNotAdStat.getMoveip1()- aDNA15HS.getMoveip1();
			moveip2 = currentNotAdStat.getMoveip2()- aDNA15HS.getMoveip2();
			moveip3 = currentNotAdStat.getMoveip3()- aDNA15HS.getMoveip3();
			moveip4 = currentNotAdStat.getMoveip4()- aDNA15HS.getMoveip4();
		}
		return new AdaDomainNotad15mStat(siteId, domainId, domainIP, site_domainPV, domainUV, olduserip, loginip, oldip, targetpageIP, 
				clickip1, clickip2, clickip3, clickip4, staytimeip1, staytimeip2, staytimeip3, staytimeip4, scrollip1, scrollip2,
				scrollip3, scrollip4, moveip1, moveip2, moveip3, moveip4, date);
//		return new AdaDomainNotad15mStat(siteId, domainId, 1, 1, 1, 1, 1, 1, 2, 
//				1, 3, 2, 1, 1, 2, 2, 1, 4, 4,
//				6, 3, 2, 1, 4, 4, date);
	}
	
	protected Jedis getJedis(Date date){	
		return jedisPools.getResource(date.getDay());
		
	}
	
	public void returnResource(Date date,Jedis jedis) {
		jedisPools.returnResource(date.getDay(),jedis);
    }

	@Override
	public DomainAreaStat statDomainRegionAd(Integer siteId,Integer domainId, Date date) {
		
		
		return null;
	}

	@Override
	public DomainAreaStat statDomainRegionNotAd(Integer siteId,Integer domainId, Date date) {
		
		
		return null;
	}

	/**
	 * 统计域名广告15分钟历史数据
	 * @param siteId
	 * @param domainId
	 * @param date
	 * @return
	 */
//	public AdaDomainAd15mStat adaDomainAd15mHistryStat(Integer siteId,Integer domainId) {
//		AdaDomainAd15mStat ad15mHStat = new AdaDomainAd15mStat();
//		Map<String, Object>  queryForMap = jdbcTemplate.queryForMap("select * from ada_domain_ad_15m_stat where siteId=? and domainId=? order by createTime desc limit 1",  siteId, domainId);
//		if(queryForMap !=null && queryForMap.size()>0){
//			ad15mHStat.setSiteId((Integer)queryForMap.get("siteId"));
//			ad15mHStat.setDomainId((Integer)queryForMap.get("domainId"));
//			ad15mHStat.setIp((Integer)queryForMap.get("ip"));
//			ad15mHStat.setPv((Integer)queryForMap.get("pv"));
//			ad15mHStat.setUv((Integer)queryForMap.get("uv"));
//			ad15mHStat.setOlduserip((Integer)queryForMap.get("olduserip"));
//			ad15mHStat.setLoginip((Integer)queryForMap.get("loginip"));
//			ad15mHStat.setOldip((Integer)queryForMap.get("oldip"));
//			ad15mHStat.setTargetpageip((Integer)queryForMap.get("targetpageip"));
//			ad15mHStat.setClickip1((Integer)queryForMap.get("clickip1"));
//			ad15mHStat.setClickip2((Integer)queryForMap.get("clickip2"));
//			ad15mHStat.setClickip3((Integer)queryForMap.get("clickip3"));
//			ad15mHStat.setClickip4((Integer)queryForMap.get("clickip4"));
//			ad15mHStat.setStaytimeip1((Integer)queryForMap.get("staytimeip1"));
//			ad15mHStat.setStaytimeip2((Integer)queryForMap.get("staytimeip2"));
//			ad15mHStat.setStaytimeip3((Integer)queryForMap.get("staytimeip3"));
//			ad15mHStat.setStaytimeip4((Integer)queryForMap.get("staytimeip4"));
//			ad15mHStat.setScrollip1((Integer)queryForMap.get("scrollip1"));
//			ad15mHStat.setScrollip2((Integer)queryForMap.get("scrollip3"));
//			ad15mHStat.setScrollip3((Integer)queryForMap.get("scrollip2"));
//			ad15mHStat.setScrollip4((Integer)queryForMap.get("scrollip4"));
//			ad15mHStat.setMoveip1((Integer)queryForMap.get("moveip1"));
//			ad15mHStat.setMoveip2((Integer)queryForMap.get("moveip2"));
//			ad15mHStat.setMoveip3((Integer)queryForMap.get("moveip3"));
//			ad15mHStat.setMoveip4((Integer)queryForMap.get("moveip4"));
//			ad15mHStat.setMoveip4((Integer)queryForMap.get("date"));
//		}
//		return ad15mHStat;
//	}
//	
	/**
	 * 统计域名非广告15分钟历史数据
	 * @param siteId
	 * @param domainId
	 * @param date
	 * @return
	 */
//	public AdaDomainNotad15mStat adaDomainNotAd15mHistryStat(Integer siteId,Integer domainId) {
//		AdaDomainNotad15mStat anad15mStat = new AdaDomainNotad15mStat();
//		Map<String, Object>  queryForMap = jdbcTemplate.queryForMap("select * from ada_domain_notad_15m_stat where siteId=? and domainId=? order by createTime desc limit 1",  siteId, domainId);
//		if(queryForMap !=null && queryForMap.size()>0){
//			anad15mStat.setSiteId((Integer)queryForMap.get("siteId"));
//			anad15mStat.setDomainId((Integer)queryForMap.get("domainId"));
//			anad15mStat.setIp((Integer)queryForMap.get("ip"));
//			anad15mStat.setPv((Integer)queryForMap.get("pv"));
//			anad15mStat.setUv((Integer)queryForMap.get("uv"));
//			anad15mStat.setOlduserip((Integer)queryForMap.get("olduserip"));
//			anad15mStat.setLoginip((Integer)queryForMap.get("loginip"));
//			anad15mStat.setOldip((Integer)queryForMap.get("oldip"));
//			anad15mStat.setTargetpageip((Integer)queryForMap.get("targetpageip"));
//			anad15mStat.setClickip1((Integer)queryForMap.get("clickip1"));
//			anad15mStat.setClickip2((Integer)queryForMap.get("clickip2"));
//			anad15mStat.setClickip3((Integer)queryForMap.get("clickip3"));
//			anad15mStat.setClickip4((Integer)queryForMap.get("clickip4"));
//			anad15mStat.setStaytimeip1((Integer)queryForMap.get("staytimeip1"));
//			anad15mStat.setStaytimeip2((Integer)queryForMap.get("staytimeip2"));
//			anad15mStat.setStaytimeip3((Integer)queryForMap.get("staytimeip3"));
//			anad15mStat.setStaytimeip4((Integer)queryForMap.get("staytimeip4"));
//			anad15mStat.setScrollip1((Integer)queryForMap.get("scrollip1"));
//			anad15mStat.setScrollip2((Integer)queryForMap.get("scrollip3"));
//			anad15mStat.setScrollip3((Integer)queryForMap.get("scrollip2"));
//			anad15mStat.setScrollip4((Integer)queryForMap.get("scrollip4"));
//			anad15mStat.setMoveip1((Integer)queryForMap.get("moveip1"));
//			anad15mStat.setMoveip2((Integer)queryForMap.get("moveip2"));
//			anad15mStat.setMoveip3((Integer)queryForMap.get("moveip3"));
//			anad15mStat.setMoveip4((Integer)queryForMap.get("moveip4"));
//			anad15mStat.setMoveip4((Integer)queryForMap.get("date"));
//		}
//		return anad15mStat;
//	}


}
