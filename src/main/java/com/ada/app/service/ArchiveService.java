package com.ada.app.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ada.app.bean.DomainStat;
import com.ada.app.dao.AdaAdPageDao;
import com.ada.app.dao.AdaChannelDao;
import com.ada.app.dao.AdaChannelStatDao;
import com.ada.app.dao.AdaDomainAd15mStatDao;
import com.ada.app.dao.AdaDomainAdStatDao;
import com.ada.app.dao.AdaDomainNotAd15mStatDao;
import com.ada.app.dao.AdaDomainNotAdStatDao;
import com.ada.app.dao.AdaSiteDao;
import com.ada.app.dao.AdaSiteStatDao;
import com.ada.app.dao.AdaDomainDao;
import com.ada.app.dao.AdaDomainStatDao;
import com.ada.app.domain.AdaAdPage;
import com.ada.app.domain.AdaChannel;
import com.ada.app.domain.AdaChannelStat;
import com.ada.app.domain.AdaDomain;
import com.ada.app.domain.AdaDomainAd15mStat;
import com.ada.app.domain.AdaDomainAdStat;
import com.ada.app.domain.AdaDomainNotad15mStat;
import com.ada.app.domain.AdaDomainNotadStat;
import com.ada.app.domain.AdaDomainStat;
import com.ada.app.domain.AdaSite;
import com.ada.app.domain.AdaSiteStat;
import com.ada.app.util.Dates;

@Service
public class ArchiveService {
	
	private final static Log log = LogFactory.getLog(ArchiveService.class);
	
	@Autowired
	private StatService statService;

	@Autowired
	private AdaChannelStatDao adaChannelStatDao;
	
	@Autowired
	private AdaDomainStatDao adaDomainStatDao;
	
	@Autowired
	private AdaSiteStatDao adaSiteStatDao; 
	
	@Autowired
	private AdaChannelDao adaChannelDao;
	
	@Autowired
	private AdaDomainDao adaDomainDao;
	
	@Autowired
	private AdaSiteDao adaSiteDao;
	
	@Autowired
	private AdaDomainAd15mStatDao adaDomainAd15mStatDao;
	
	@Autowired
	private AdaDomainNotAd15mStatDao adaDomainNotAd15mStatDao;
	
	@Autowired
	private AdaDomainNotAdStatDao adaDomainNotadStatDao;
	
	@Autowired
	private AdaDomainAdStatDao adaDomainAdStatDao;
	
	private Calendar calendar = Calendar.getInstance();
	private SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
	
	/**
	 * 归档昨日站点统计数据
	 */
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED)
	public void archive() {
		Date yestoday = Dates.yestoday();
		
		List<AdaSite> sites = adaSiteDao.findAll();
		for(AdaSite site:sites){
			try {
				AdaSiteStat stat = statService.statSite(site.getId(), yestoday);
				stat.setCreateTime(Dates.now());
			    adaSiteStatDao.save(stat);
			    log.info("站点 "+site.getId()+":"+site.getSiteName() +" 归档成功");
			} catch (Exception e) {
				log.error("站点 "+site.getId()+":"+site.getSiteName() +" 归档失败,Msg->"+e.getMessage(),e);
			}
			 List<AdaChannel> channels = adaChannelDao.findBySiteId(site.getId());
			 for(AdaChannel channel:channels){
				try {
					AdaChannelStat channelStat =  statService.statChannel(site.getId(), channel.getId(), yestoday);
					channelStat.setDomainId(channel.getDomainId());
					channelStat.setAdId(channel.getAdId());
					if(channelStat.getIp()>0){
						channelStat.setCreateTime(Dates.now());
						adaChannelStatDao.save(channelStat);
					    log.info("渠道 "+channel.getId()+":"+channel.getChannelName()+" 归档成功");
					}
				} catch (Exception e) {
					log.error("渠道 "+channel.getId()+":"+channel.getChannelName()+" 归档失败,Msg->"+e.getMessage(),e);
				}
			 }
			 
			 List<AdaDomain> domains = adaDomainDao.findBySiteId(site.getId());
			 for(AdaDomain domain:domains){
				try {
					AdaDomainStat domainStat =  statService.statDomain(site.getId(), domain.getId(), yestoday);
					domainStat.setCreateTime(Dates.now());
					if(domainStat.getIp()>0){
						adaDomainStatDao.save(domainStat);
					    log.info("域名 "+domain.getId()+":"+domain.getDomain()+" 归档成功");
					}
				} catch (Exception e) {
					log.error("域名 "+domain.getId()+":"+domain.getDomain()+" 归档失败,Msg->"+e.getMessage(),e);
				}
			 }
		}
	}
	
	/**
	 * 归档广告与非广告数据,每15分钟执行一次  
	 */
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED)
	public void archiveDomainAdAndNotAd() {
		Timestamp ts = new Timestamp(System.currentTimeMillis());   
		Date date = new Date();
		calendar.add(Calendar.MINUTE, -15);
		String str = sdf.format(calendar.getTime());
		try {
            ts = Timestamp.valueOf(str);   
        } catch (Exception e) {   
        	log.error("字符串转为时间戳错误 : ---> "+str);
        }
		
		List<AdaSite> sites = adaSiteDao.findAll();
		for(AdaSite site:sites){
			List<AdaDomain> domains = adaDomainDao.findBySiteId(site.getId());
			for(AdaDomain domain:domains){
				try {
					
					
					/** 15m广告数据归档 **/
					AdaDomainAd15mStat statDomainAd15m = statService.statDomainAd15m(site.getId(), domain.getId(), date);
//					if(statDomainAd15m.getIp()>0){
						statDomainAd15m.setStartTime(ts);
						statDomainAd15m.setEndTime(Dates.now());
						statDomainAd15m.setCreateTime(Dates.now());
						adaDomainAd15mStatDao.save(statDomainAd15m);
						log.info("域名 :"+statDomainAd15m.getDomainId()+" 15m广告数据归档成功");
//					}
					/** 15m非广告数据归档 **/
					AdaDomainNotad15mStat statDomainNotAd15m = statService.statDomainNotAd15m(site.getId(),domain.getId(), date);
//					if(statDomainNotAd15m.getIp()>0){
						statDomainNotAd15m.setStartTime(ts);
						statDomainNotAd15m.setEndTime(Dates.now());
						statDomainNotAd15m.setCreateTime(Dates.now());
						adaDomainNotAd15mStatDao.save(statDomainNotAd15m);
						log.info("域名 :"+statDomainNotAd15m.getDomainId()+" 15m非广告数据归档成功");
//					}
						
					/** 广告数据归档 **/
					AdaDomainAdStat statDomainAd = statService.statDomainAd(site.getId(), domain.getId(), date);
//						if(statDomainAd.getIp()>0){
						statDomainAd.setCreateTime(Dates.now());
						adaDomainAdStatDao.save(statDomainAd);
						log.info("域名 :"+statDomainAd.getDomainId()+" 广告数据归档成功");
//						}
					/** 非广告数据归档 **/
					AdaDomainNotadStat statDomainNotAd = statService.statDomainNotAd(site.getId(), domain.getId(), date);
//						if(statDomainNotAd.getIp()>0){
						statDomainNotAd.setCreateTime(Dates.now());
						adaDomainNotadStatDao.save(statDomainNotAd);
						log.info("域名 :"+statDomainNotAd.getDomainId()+" 非广告数据归档成功");
//						}
				} catch (Exception e) {
					log.error("域名 "+domain.getId()+":"+domain.getDomain()+" 归档失败,Msg->"+e.getMessage(),e);
				}
			 }
		}
		calendar.clear();
	}

}


