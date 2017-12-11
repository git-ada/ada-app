package com.ada.app.dao;

import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import java.math.BigDecimal;

import org.springframework.data.jpa.repository.Query;

import cn.com.jiand.mvc.framework.dao.jpa.EntityJpaDao;

import com.ada.app.domain.AdaDomainAd15mStat;
import com.ada.app.domain.AdaDomainAdStat;

/**
 * 域名广告入口统计 JPA Dao
 * @author Wanghl.cn By Code Generator
 */
public interface AdaDomainAdStatDao extends EntityJpaDao<AdaDomainAdStat, Integer> {

    /** 
     *通过ID查询
     */
    public AdaDomainAdStat findById(Integer id);
    
    @Query(value="select * from ada_domain_ad_stat where siteId=? and domainId=? order by createTime desc limit 1",nativeQuery=true)
    public AdaDomainAdStat findLast(Integer siteId,Integer domainId);
    
    @Query(value="select * from ada_domain_ad_stat where siteId=? and domainId=? and date=? order by createTime desc limit 1",nativeQuery=true)
    public AdaDomainAdStat findLastInDate(Integer siteId,Integer domainId,Timestamp date);
    /** 
     *通过站点ID查询
     */
	public List<AdaDomainAdStat> findBySiteId(Integer siteId);
    /** 
     *通过渠道ID查询
     */
	public List<AdaDomainAdStat> findByDomainId(Integer domainId);
    /** 
     *通过IP查询
     */
	public List<AdaDomainAdStat> findByIp(Integer ip);
    /** 
     *通过PV查询
     */
	public List<AdaDomainAdStat> findByPv(Integer pv);
    /** 
     *通过独立客户端查询
     */
	public List<AdaDomainAdStat> findByUv(Integer uv);
    /** 
     *通过老用户数量查询
     */
	public List<AdaDomainAdStat> findByOlduserip(Integer olduserip);
    /** 
     *通过登录用户数查询
     */
	public List<AdaDomainAdStat> findByLoginip(Integer loginip);
    /** 
     *通过老IP查询
     */
	public List<AdaDomainAdStat> findByOldip(Integer oldip);
    /** 
     *通过目标页访问查询
     */
	public List<AdaDomainAdStat> findByTargetpageip(Integer targetpageip);
    /** 
     *通过1-2次点击查询
     */
	public List<AdaDomainAdStat> findByClickip1(Integer clickip1);
    /** 
     *通过3-5次点击查询
     */
	public List<AdaDomainAdStat> findByClickip2(Integer clickip2);
    /** 
     *通过6-10次点击查询
     */
	public List<AdaDomainAdStat> findByClickip3(Integer clickip3);
    /** 
     *通过10+次点击查询
     */
	public List<AdaDomainAdStat> findByClickip4(Integer clickip4);
    /** 
     *通过停留时长0-5秒查询
     */
	public List<AdaDomainAdStat> findByStaytimeip1(Integer staytimeip1);
    /** 
     *通过停留时长6-10查询
     */
	public List<AdaDomainAdStat> findByStaytimeip2(Integer staytimeip2);
    /** 
     *通过停留时长11-15秒查询
     */
	public List<AdaDomainAdStat> findByStaytimeip3(Integer staytimeip3);
    /** 
     *通过停留时长16-30秒查询
     */
	public List<AdaDomainAdStat> findByStaytimeip4(Integer staytimeip4);
    /** 
     *通过1-2次滚动查询
     */
	public List<AdaDomainAdStat> findByScrollip1(Integer scrollip1);
    /** 
     *通过3-5次滚动查询
     */
	public List<AdaDomainAdStat> findByScrollip2(Integer scrollip2);
    /** 
     *通过6-10次滚动查询
     */
	public List<AdaDomainAdStat> findByScrollip3(Integer scrollip3);
    /** 
     *通过10+次滚动查询
     */
	public List<AdaDomainAdStat> findByScrollip4(Integer scrollip4);
    /** 
     *通过1-2次移动查询
     */
	public List<AdaDomainAdStat> findByMoveip1(Integer moveip1);
    /** 
     *通过3-5次移动查询
     */
	public List<AdaDomainAdStat> findByMoveip2(Integer moveip2);
    /** 
     *通过6-10次移动查询
     */
	public List<AdaDomainAdStat> findByMoveip3(Integer moveip3);
    /** 
     *通过10+次移动查询
     */
	public List<AdaDomainAdStat> findByMoveip4(Integer moveip4);
    /** 
     *通过日期查询
     */
	public List<AdaDomainAdStat> findByDate(Date date);
    /** 
     *通过创建时间查询
     */
	public List<AdaDomainAdStat> findByCreateTime(Timestamp createTime);


}
