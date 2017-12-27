package com.ada.app.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ada.app.bean.BaseStat;
import com.ada.app.bean.DomainAreaStat;
import com.ada.app.dao.AdaChannelDao;
import com.ada.app.dao.AdaChannelStatDao;
import com.ada.app.dao.AdaDomainAd15mStatDao;
import com.ada.app.dao.AdaDomainAdStatDao;
import com.ada.app.dao.AdaDomainDao;
import com.ada.app.dao.AdaDomainNotAd15mStatDao;
import com.ada.app.dao.AdaDomainNotAdStatDao;
import com.ada.app.dao.AdaDomainStatDao;
import com.ada.app.dao.AdaRegionAdStatDao;
import com.ada.app.dao.AdaRegionDao;
import com.ada.app.dao.AdaRegionNotAdStatDao;
import com.ada.app.dao.AdaRegionStatDao;
import com.ada.app.dao.AdaSiteDao;
import com.ada.app.dao.AdaSiteStatDao;
import com.ada.app.domain.AdaChannel;
import com.ada.app.domain.AdaChannelStat;
import com.ada.app.domain.AdaDomain;
import com.ada.app.domain.AdaDomainAd15mStat;
import com.ada.app.domain.AdaDomainAdStat;
import com.ada.app.domain.AdaDomainNotad15mStat;
import com.ada.app.domain.AdaDomainNotadStat;
import com.ada.app.domain.AdaDomainStat;
import com.ada.app.domain.AdaRegion;
import com.ada.app.domain.AdaRegionAdStat;
import com.ada.app.domain.AdaRegionNotAdStat;
import com.ada.app.domain.AdaRegionStat;
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
	private AdaRegionDao adaRegionDao;
	
	@Autowired
	private AdaDomainAd15mStatDao adaDomainAd15mStatDao;
	
	@Autowired
	private AdaDomainNotAd15mStatDao adaDomainNotAd15mStatDao;
	
	@Autowired
	private AdaDomainNotAdStatDao adaDomainNotadStatDao;
	
	@Autowired
	private AdaDomainAdStatDao adaDomainAdStatDao;
	
	@Autowired
	private AdaDomainNotAdStatDao adaDomainNotAdStatDao;
	
	@Autowired
	private AdaRegionStatDao  adaRegionStatDao;
	@Autowired
	private AdaRegionAdStatDao  adaRegionAdStatDao;
	@Autowired
	private AdaRegionNotAdStatDao  adaRegionNotAdStatDao;
	
	private Calendar calendar = Calendar.getInstance();
	private SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
	
	/**
	 * 归档昨日站点统计数据
	 */
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED)
	public void archive() {
		Date yestoday = Dates.yestoday();
		
		List<AdaSite> sites = adaSiteDao.findAll();
		List<AdaRegion> regions = adaRegionDao.findAll();
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
		calendar.add(Calendar.MINUTE, -5);
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
	
	/**
	 * 归档全部地域数据
	 */
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED)
	public void archiveRegion() {
		Date yestoday = Dates.yestoday();
		List<AdaSite> sites = adaSiteDao.findAll();
		
		List<AdaRegion> regions = adaRegionDao.findAll();
		for(AdaSite site:sites){
			List<AdaDomain> domains = adaDomainDao.findBySiteId(site.getId());
			for(AdaDomain domain:domains){
				Set<String> cityList = statService.getCityList(domain.getId(), yestoday);
				for (String city : cityList) {  
					try {
						archiveAllRegion(domain,city,yestoday);
					} catch (Exception e) {
						log.error("地域 "+city+" 归档失败,Msg->"+e.getMessage(),e);
						continue;
					}
				}
//				for(AdaRegion region:regions){
//					try {
//						archiveAllRegion(domain,region,yestoday);
//					} catch (Exception e) {
//						log.error("地域 "+region.getId()+":"+region.getFullname()+" 归档失败,Msg->"+e.getMessage(),e);
//						continue;
//					}
//				}
			}
		}
	}
	
	/**
	 * 归档广告与非广告数据,每15分钟执行一次  
	 */
	private Timestamp lastTime = null;
	
	@Transactional(readOnly=false,propagation=Propagation.REQUIRED)
	public void archive15m() {
		Timestamp startTime = lastTime;
		Timestamp endTime = Dates.now();
		lastTime =  endTime;
		List<AdaSite> sites = adaSiteDao.findAll();
		for(AdaSite site:sites){
			List<AdaDomain> domains = adaDomainDao.findBySiteId(site.getId());
			for(AdaDomain domain:domains){
				try {
					archiveDomain15m(domain,startTime,endTime);
				} catch (Exception e) {
					log.error("归档失败->"+domain.getDomain()+":"+domain.getId(),e);
					continue;
				}
				
			}
		}
	}
	
	
	public void archiveAllRegion(AdaDomain domain,String region,Date yestoday) {
		Integer siteId = domain.getSiteId();
		Integer domainId = domain.getId();
		AdaRegionStat statRegion = statService.statRegion(region, domain.getId(), yestoday);
		AdaRegionAdStat statRegionAd = statService.statRegionAd(region, domain.getId(), yestoday);
		AdaRegionNotAdStat statRegionNotAd = reduct(statRegion, statRegionAd, AdaRegionNotAdStat.class);
		
		statRegion.setSiteId(siteId);
		statRegion.setDomainId(domainId);
		statRegion.setRegion(region);
		statRegion.setDate(yestoday);
		statRegion.setCreateTime(Dates.now());
		
		statRegionAd.setSiteId(siteId);
		statRegionAd.setDomainId(domainId);
		statRegionAd.setRegion(region);
		statRegionAd.setDate(yestoday);
		statRegionAd.setCreateTime(Dates.now());
		
		statRegionNotAd.setSiteId(siteId);
		statRegionNotAd.setDomainId(domainId);
		statRegionNotAd.setRegion(region);
		statRegionNotAd.setDate(yestoday);
		statRegionNotAd.setCreateTime(Dates.now());
		
//		if(statRegion.getIp()>0){
			adaRegionStatDao.save(statRegion);
//		}
//		if(statRegionAd.getIp()>0){
			adaRegionAdStatDao.save(statRegionAd);
//		}
//		if(statRegionNotAd.getIp()>0){
			adaRegionNotAdStatDao.save(statRegionNotAd);
//		}
	}
	
//	@Transactional(readOnly=false,propagation=Propagation.REQUIRED)
	public void archiveDomain15m(AdaDomain domain,Timestamp startTime,Timestamp endTime) {
		Integer siteId = domain.getSiteId();
		Integer domainId = domain.getId();
		AdaDomainAdStat newad = statService.statDomainAd(siteId, domainId, endTime);//广告新数据
		AdaDomainStat newall = statService.statDomain(siteId, domainId, endTime);//全部新数据
		if(newall.getPv()<10){
			return;
		}
		
		update(newad);
		update(newall);
		
		AdaDomainNotadStat newnotad = reduct(newall, newad, AdaDomainNotadStat.class);//非广告入口新数据=全部-非广告的
		newnotad.setSiteId(siteId);
		newnotad.setDomainId(domainId);
		
		Timestamp now = Dates.now();
		Timestamp today = Dates.todayStart();
		
		AdaDomainAdStat oldad = adaDomainAdStatDao.findLastInDate(siteId, domainId,today);//广告入口老数据
		AdaDomainNotadStat oldnotad = adaDomainNotAdStatDao.findLastInDate(siteId, domainId,today);//非广告入口数据
		
		if(oldad!=null){
			adaDomainAdStatDao.delete(oldad);
		}else{
			oldad = initStat(AdaDomainAdStat.class);
		}
		if(oldnotad!=null){
			adaDomainNotadStatDao.delete(oldnotad);
		}else{
			oldnotad = initStat(AdaDomainNotadStat.class);
		}
		
		AdaDomainAd15mStat ad15m = reduct(newad, oldad, AdaDomainAd15mStat.class);//变化数据，=新广告数据-老广告数据
		AdaDomainNotad15mStat notad15m= reduct(newnotad, oldnotad, AdaDomainNotad15mStat.class);//变化数据，=新广告数据-老广告数据
		
		newad.setDate(today);
		newad.setCreateTime(now);
		newnotad.setDate(today);
		newnotad.setCreateTime(now);
		
		ad15m.setSiteId(siteId);
		ad15m.setDomainId(domainId);
		ad15m.setStartTime(startTime);
		ad15m.setEndTime(endTime);
		ad15m.setDate(today);
		ad15m.setCreateTime(now);
		
		notad15m.setSiteId(siteId);
		notad15m.setDomainId(domainId);
		notad15m.setStartTime(startTime);
		notad15m.setEndTime(endTime);
		notad15m.setDate(today);
		notad15m.setCreateTime(now);
		
		
		
		adaDomainAdStatDao.save(newad);//保存广告数据
		adaDomainNotadStatDao.save(newnotad);//保存非广告数据
		
		adaDomainAd15mStatDao.save(ad15m);//保存15分钟数据
		adaDomainNotAd15mStatDao.save(notad15m);//保存15分钟数据
	}
	
	protected <T> T reduct(BaseStat a,BaseStat b,Class<T> clazz){
		 BaseStat result = null;
			try {
				result = (BaseStat) clazz.newInstance();
			} catch (Exception e) {
			}
		
			 result.setIp             ((a.getIp()            < b.getIp()          )?0:(a.getIp()            - b.getIp()          ));  
			 result.setPv             ((a.getPv()            < b.getPv()          )?0:(a.getPv()            - b.getPv()          ));
			 result.setUv             ((a.getUv()            < b.getUv()          )?0:(a.getUv()            - b.getUv()          ));
			 result.setOlduserip      ((a.getOlduserip()     < b.getOlduserip()   )?0:(a.getOlduserip()     - b.getOlduserip()   ));
			 result.setOldip          ((a.getOldip()         < b.getOldip()       )?0:(a.getOldip()         - b.getOldip()       ));
			 result.setLoginip        ((a.getLoginip()       < b.getLoginip()     )?0:(a.getLoginip()       - b.getLoginip()     ));
			 result.setTargetpageip   ((a.getTargetpageip()  < b.getTargetpageip())?0:(a.getTargetpageip()  - b.getTargetpageip()));
			 result.setClickip1       ((a.getClickip1()      < b.getClickip1()    )?0:(a.getClickip1()      - b.getClickip1()    ));
			 result.setClickip2       ((a.getClickip2()      < b.getClickip2()    )?0:(a.getClickip2()      - b.getClickip2()    ));
			 result.setClickip3       ((a.getClickip3()      < b.getClickip3()    )?0:(a.getClickip3()      - b.getClickip3()    ));
			 result.setClickip4       ((a.getClickip4()      < b.getClickip4()    )?0:(a.getClickip4()      - b.getClickip4()    ));
			 result.setStaytimeip1    ((a.getStaytimeip1()   < b.getStaytimeip1() )?0:(a.getStaytimeip1()   - b.getStaytimeip1() ));
			 result.setStaytimeip2    ((a.getStaytimeip2()   < b.getStaytimeip2() )?0:(a.getStaytimeip2()   - b.getStaytimeip2() ));
			 result.setStaytimeip3    ((a.getStaytimeip3()   < b.getStaytimeip3() )?0:(a.getStaytimeip3()   - b.getStaytimeip3() ));
			 result.setStaytimeip4    ((a.getStaytimeip4()   < b.getStaytimeip4() )?0:(a.getStaytimeip4()   - b.getStaytimeip4() ));
			 result.setScrollip1      ((a.getScrollip1()     < b.getScrollip1()   )?0:(a.getScrollip1()     - b.getScrollip1()   ));
			 result.setScrollip2      ((a.getScrollip2()     < b.getScrollip2()   )?0:(a.getScrollip2()     - b.getScrollip2()   ));
			 result.setScrollip3      ((a.getScrollip3()     < b.getScrollip3()   )?0:(a.getScrollip3()     - b.getScrollip3()   ));
			 result.setScrollip4      ((a.getScrollip4()     < b.getScrollip4()   )?0:(a.getScrollip4()     - b.getScrollip4()   ));
			 result.setMoveip1        ((a.getMoveip1()       < b.getMoveip1()     )?0:(a.getMoveip1()       - b.getMoveip1()     ));
			 result.setMoveip2        ((a.getMoveip2()       < b.getMoveip2()     )?0:(a.getMoveip2()       - b.getMoveip2()     ));
			 result.setMoveip3        ((a.getMoveip3()       < b.getMoveip3()     )?0:(a.getMoveip3()       - b.getMoveip3()     ));
			 result.setMoveip4        ((a.getMoveip4()       < b.getMoveip4()     )?0:(a.getMoveip4()       - b.getMoveip4()     )); 
		 return (T) result;
	}
	
	protected void update(BaseStat result){
		Integer c1=result.getClickip1()-result.getClickip2(); Integer c2=result.getClickip2()-result.getClickip3(); Integer c3=result.getClickip3()-result.getClickip4();
		result.setClickip1(c1);result.setClickip2(c2);result.setClickip3(c3);
		
		Integer st1=result.getStaytimeip1()-result.getStaytimeip2(); Integer st2=result.getStaytimeip2()-result.getStaytimeip3(); Integer st3=result.getStaytimeip3()-result.getStaytimeip4();
		result.setStaytimeip1(st1);result.setStaytimeip2(st2);result.setStaytimeip3(st3);
		
		Integer sc1=result.getScrollip1()-result.getScrollip2(); Integer sc2=result.getScrollip2()-result.getScrollip3(); Integer sc3=result.getScrollip3()-result.getScrollip4();
		result.setScrollip1(sc1);result.setScrollip2(sc2);result.setScrollip3(sc3);
		
		Integer mo1=result.getMoveip1()-result.getMoveip2(); Integer mo2=result.getMoveip2()-result.getMoveip3(); Integer mo3=result.getMoveip3()-result.getMoveip4();
		result.setMoveip1(mo1);result.setMoveip2(mo2);result.setMoveip3(mo3);
	}

	protected <T> T initStat(Class<T> clazz){
		BaseStat result = null;
		try {
			result = (BaseStat) clazz.newInstance();
		} catch (Exception e) {
		}
		 result.setIp             (0);
		 result.setPv             (0);
		 result.setUv             (0);
		 result.setOlduserip      (0);
		 result.setOldip          (0);
		 result.setLoginip        (0);
		 result.setTargetpageip   (0);
		 result.setClickip1       (0);
		 result.setClickip2       (0);
		 result.setClickip3       (0);
		 result.setClickip4       (0);
		 result.setStaytimeip1    (0);
		 result.setStaytimeip2    (0);
		 result.setStaytimeip3    (0);
		 result.setStaytimeip4    (0);
		 result.setScrollip1      (0);
		 result.setScrollip2      (0);
		 result.setScrollip3      (0);
		 result.setScrollip4      (0);
		 result.setMoveip1        (0);
		 result.setMoveip2        (0);
		 result.setMoveip3        (0);
		 result.setMoveip4        (0);
		return (T) result;
		
	}
}


