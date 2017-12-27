package com.ada.app.dao;

import java.util.List;
import java.util.Set;
import java.sql.Timestamp;
import java.util.Date;
import java.math.BigDecimal;

import org.springframework.data.jpa.repository.Query;

import cn.com.jiand.mvc.framework.dao.jpa.EntityJpaDao;

import com.ada.app.domain.AdaRegionAdStat;
import com.ada.app.domain.AdaRegionStat;

/**
 * 域名统计 JPA Dao
 * @author Wanghl.cn By Code Generator
 */
public interface AdaRegionAdStatDao extends EntityJpaDao<AdaRegionAdStat, Integer> {
    
    /** 
     *通过ID查询
     */
    public AdaRegionAdStat findById(Integer id);
    /** 
     *通过站点ID查询
     */
	public List<AdaRegionAdStat> findBySiteId(Integer siteId);
    /** 
     *通过渠道ID查询
     */
	public List<AdaRegionAdStat> findByDomainId(Integer domainId);
    /** 
     *通过IP查询
     */
	public List<AdaRegionAdStat> findByIp(Integer ip);
    /** 
     *通过PV查询
     */
	public List<AdaRegionAdStat> findByPv(Integer pv);
    /** 
     *通过1-2次点击查询
     */
	public List<AdaRegionAdStat> findByClickip1(Integer clickip1);
    /** 
     *通过3-5次点击查询
     */
	public List<AdaRegionAdStat> findByClickip2(Integer clickip2);
    /** 
     *通过6-10次点击查询
     */
	public List<AdaRegionAdStat> findByClickip3(Integer clickip3);
    /** 
     *通过10+次点击查询
     */
	public List<AdaRegionAdStat> findByClickip4(Integer clickip4);
    /** 
     *通过目标页访问查询
     */
	public List<AdaRegionAdStat> findByTargetpageip(Integer targetpageip);
    /** 
     *通过日期查询
     */
	public List<AdaRegionAdStat> findByDate(Date date);
    /** 
     *通过创建时间查询
     */
	public List<AdaRegionAdStat> findByCreateTime(Timestamp createTime);
	
	@Query(value="select d.*  from ada_region_ad_stat d where d.siteId=? and d.domainId=?    and d.date=? and d.ip>50 order by ip desc limit ?",nativeQuery=true)
	public List<AdaRegionAdStat> loadDomainRegionAd(Integer siteId,Integer domainId,String date,Integer top);

	
	
	
	


}
