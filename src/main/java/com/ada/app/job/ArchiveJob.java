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

	@Scheduled(cron="0 30 4 * * ?")
	public void excute(){
		log.info("开始执行归档作业");
		Long startTime = System.currentTimeMillis();
		archiveService.archive();
		Long endTime = System.currentTimeMillis();
		Long cost = endTime - startTime;
		
		log.info("结束归档作业，用时"+cost+"ms");
	}
	
	@Scheduled(cron="0/60 * * * * ?")
//	@Scheduled(cron="0 51 22 * * ?")
	public void excute3(){
		log.info("开始执行地域归档作业");
		Long startTime = System.currentTimeMillis();
		archiveService.archiveRegion();
		Long endTime = System.currentTimeMillis();
		Long cost = endTime - startTime;
		log.info("结束地域归档作业，用时"+cost+"ms");
	}
	
	/**
	 * 归档广告与非广告统计数据,每15分钟执行一次  
	 */
	@Scheduled(cron="5 0 */1 * * ?")   //每15分钟执行一次  
	public void excute2(){
		log.info("开始执行广告、非广告、广告15m、非广告15m归档作业");
		Long startTime = System.currentTimeMillis();
//		archiveService.archiveDomainAdAndNotAd();
		
		archiveService.archive15m();
		Long endTime = System.currentTimeMillis();
		Long cost = endTime - startTime;
		
		log.info("结束广告、非广告、广告15m、非广告15m归档作业，用时"+cost+"ms");
	}

}
