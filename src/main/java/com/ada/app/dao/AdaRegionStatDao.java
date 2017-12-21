package com.ada.app.dao;

import java.util.List;
import java.util.Set;
import java.sql.Timestamp;
import java.util.Date;
import java.math.BigDecimal;

import org.springframework.data.jpa.repository.Query;

import cn.com.jiand.mvc.framework.dao.jpa.EntityJpaDao;

import com.ada.app.domain.AdaDomainAdStat;
import com.ada.app.domain.AdaRegionStat;

/**
 * 域名统计 JPA Dao
 * @author Wanghl.cn By Code Generator
 */
public interface AdaRegionStatDao extends EntityJpaDao<AdaRegionStat, Integer> {
    
    /** 
     *通过ID查询
     */
    public AdaRegionStat findById(Integer id);
    /** 
     *通过站点ID查询
     */
	public List<AdaRegionStat> findBySiteId(Integer siteId);
    /** 
     *通过渠道ID查询
     */
	public List<AdaRegionStat> findByDomainId(Integer domainId);
    /** 
     *通过IP查询
     */
	public List<AdaRegionStat> findByIp(Integer ip);
    /** 
     *通过PV查询
     */
	public List<AdaRegionStat> findByPv(Integer pv);
    /** 
     *通过1-2次点击查询
     */
	public List<AdaRegionStat> findByClickip1(Integer clickip1);
    /** 
     *通过3-5次点击查询
     */
	public List<AdaRegionStat> findByClickip2(Integer clickip2);
    /** 
     *通过6-10次点击查询
     */
	public List<AdaRegionStat> findByClickip3(Integer clickip3);
    /** 
     *通过10+次点击查询
     */
	public List<AdaRegionStat> findByClickip4(Integer clickip4);
    /** 
     *通过目标页访问查询
     */
	public List<AdaRegionStat> findByTargetpageip(Integer targetpageip);
    /** 
     *通过日期查询
     */
	public List<AdaRegionStat> findByDate(Date date);
    /** 
     *通过创建时间查询
     */
	public List<AdaRegionStat> findByCreateTime(Timestamp createTime);
	
	
	@Query(value="select * from ada_region_stat d,ada_region r where d.siteId=? and  d.regionId=r.id and  d.domainId=?  and r.fullname=? and d.date=?",nativeQuery=true)
	public AdaRegionStat loadDomainRegion(Integer siteId,Integer domainId, String cityName, Date date);
	
	@Query(value="select ip from ada_region_stat d,ada_region r where d.siteId=? and  d.regionId=r.id and  d.domainId=?  and r.fullname=? and d.date=?",nativeQuery=true)
	public Integer loadRegionIP(Integer siteId,Integer domainId, String cityName, Date date);
	
	@Query(value="select regionName from ada_region_stat d,ada_region r where d.siteId=? and d.regionId=r.id and  d.domainId=? and d.date=?",nativeQuery=true)
	public Set<String> loadRegionData(Integer siteId,Integer domainId,Date date);
	
//	@Query(value="select regionName from ada_region_ad_stat d,ada_region r where d.regionId=t.id and  d.domainId=? and d.date=?",nativeQuery=true)
//	public Set<String> loadRegionData(Integer domainId,String date);
	
//	@Query(value="select regionName from ada_region_notad_stat d,ada_region r where d.regionId=t.id and  d.domainId=? and d.date=?",nativeQuery=true)
//	public Set<String> loadRegionData(Integer domainId,String date);
	
	
	
	


}
