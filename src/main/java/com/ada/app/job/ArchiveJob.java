package com.ada.app.job;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.ada.app.service.ArchiveService;

//@Service
public class ArchiveJob {
	
	private final static Log log = LogFactory.getLog(ArchiveJob.class);
	
	@Autowired
	private ArchiveService archiveService;
	
	/**
	 * 归档站点与域名
	 */
	@Scheduled(cron="0 29 10 * * ?")
	public void excute(){
		log.info("Starting excute Site and Domain archive task .");
		Long startTime = System.currentTimeMillis();
		archiveService.archive();
		Long endTime = System.currentTimeMillis();
		Long cost = endTime - startTime;
		
		log.info("End Site and Domain archive task ,used "+cost+" ms .");
	}
	
	/**
	 * 归档地域、广告地域、非广告地域
	 */
	@Scheduled(cron="0 30 4 * * ?")
	public void excute3(){
		log.info("Starting excute region archive task .");
		Long startTime = System.currentTimeMillis();
		archiveService.archiveRegion();
		Long endTime = System.currentTimeMillis();
		Long cost = endTime - startTime;
		
		log.info("End region archive task ,used "+cost+" ms .");
	}
	
	/**
	 * 归档昨日IPSet
	 */
//	@Scheduled(cron="0 21 11 * * ?")
	@Scheduled(cron="0 0 8 * * ?")
	public void excute4(){
		log.info("Starting excute IPSet archive task .");
		Long startTime = System.currentTimeMillis();
		archiveService.archiveIpAddress();
		Long endTime = System.currentTimeMillis();
		Long cost = endTime - startTime;
		
		log.info("End IPSet archive task ,used "+cost+" ms .");
	}
	
	/**
	 * 归档广告与非广告统计数据,每15分钟执行一次  
	 */
	@Scheduled(cron="5 0 */1 * * ?")
	public void excute2(){
		log.info("Starting excute Ad、NotAd、Ad15m、NotAd15m archive task .");
		Long startTime = System.currentTimeMillis();
//		archiveService.archiveDomainAdAndNotAd();
		
		archiveService.archive15m();
		Long endTime = System.currentTimeMillis();
		Long cost = endTime - startTime;
		
		log.info("End Ad、NotAd、Ad15m、NotAd15m archive task ,used "+cost+" ms .");
	}

}
