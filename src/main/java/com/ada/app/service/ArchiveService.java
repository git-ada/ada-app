package com.ada.app.service;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.ada.app.dao.AdaChannelDao;
import com.ada.app.dao.AdaChannelStatDao;
import com.ada.app.dao.AdaSiteDao;
import com.ada.app.dao.AdaSiteStatDao;
import com.ada.app.dao.AdaDomainDao;
import com.ada.app.dao.AdaDomainStatDao;
import com.ada.app.domain.AdaChannel;
import com.ada.app.domain.AdaChannelStat;
import com.ada.app.domain.AdaDomain;
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
					channelStat.setCreateTime(Dates.now());
					adaChannelStatDao.save(channelStat);
				    log.info("渠道 "+channel.getId()+":"+channel.getChannelName()+" 归档成功");
				} catch (Exception e) {
					log.info("渠道 "+channel.getId()+":"+channel.getChannelName()+" 归档失败,Msg->"+e.getMessage(),e);
				}
			 }
			 
			 
			 List<AdaDomain> domains = adaDomainDao.findBySiteId(site.getId());
			 for(AdaDomain domain:domains){
				try {
					AdaDomainStat domainStat =  statService.statDomain(site.getId(), domain.getId(), yestoday);
					domainStat.setCreateTime(Dates.now());
					adaDomainStatDao.save(domainStat);
				    log.info("域名 "+domain.getId()+":"+domain.getDomain()+" 归档成功");
				} catch (Exception e) {
					log.info("域名 "+domain.getId()+":"+domain.getDomain()+" 归档失败,Msg->"+e.getMessage(),e);
				}
			 }
		}
	}

}
