package com.ada.app.dao;

import java.util.List;
import java.util.Map;
import java.sql.Timestamp;
import java.util.Date;
import java.math.BigDecimal;

import org.springframework.data.jpa.repository.Query;

import cn.com.jiand.mvc.framework.dao.jpa.EntityJpaDao;

import com.ada.app.bean.AdaDomainNotadTotalStat;
import com.ada.app.domain.AdaDomainAdStat;
import com.ada.app.domain.AdaDomainNotadStat;
import com.ada.app.domain.AdaDomainStat;
import com.ada.app.domain.AdaSiteStat;

/**
 * 域名非广告入口统计 JPA Dao
 * @author Wanghl.cn By Code Generator
 */
public interface AdaDomainNotAdStatDao extends EntityJpaDao<AdaDomainNotadStat, Integer> {

    /** 
     *通过ID查询
     */
    public AdaDomainNotadStat findById(Integer id);
    @Query(value="select * from ada_domain_notad_stat where siteId=? and domainId=? order by createTime desc limit 1",nativeQuery=true)
    public AdaDomainNotadStat findLast(Integer siteId,Integer domainId);
    
    @Query(value="select * from ada_domain_notad_stat where siteId=? and domainId=? and date=?",nativeQuery=true)
    public AdaDomainNotadStat findByIdHistry(Integer SiteId,Integer domainId,String date);
    
    @Query(value="select * from ada_domain_notad_stat where siteId=? and domainId=? and date=? order by createTime desc limit 1",nativeQuery=true)
    public AdaDomainNotadStat findLastInDate(Integer siteId,Integer domainId,Timestamp date);
    /** 
     *通过站点ID查询
     */
	public List<AdaDomainNotadStat> findBySiteId(Integer siteId);
    /** 
     *通过渠道ID查询
     */
	public List<AdaDomainNotadStat> findByDomainId(Integer domainId);
    /** 
     *通过IP查询
     */
	public List<AdaDomainNotadStat> findByIp(Integer ip);
    /** 
     *通过PV查询
     */
	public List<AdaDomainNotadStat> findByPv(Integer pv);
    /** 
     *通过独立客户端查询
     */
	public List<AdaDomainNotadStat> findByUv(Integer uv);
    /** 
     *通过老用户数量查询
     */
	public List<AdaDomainNotadStat> findByOlduserip(Integer olduserip);
    /** 
     *通过登录用户数查询
     */
	public List<AdaDomainNotadStat> findByLoginip(Integer loginip);
    /** 
     *通过老IP查询
     */
	public List<AdaDomainNotadStat> findByOldip(Integer oldip);
    /** 
     *通过1-2次点击查询
     */
	public List<AdaDomainNotadStat> findByClickip1(Integer clickip1);
    /** 
     *通过3-5次点击查询
     */
	public List<AdaDomainNotadStat> findByClickip2(Integer clickip2);
    /** 
     *通过6-10次点击查询
     */
	public List<AdaDomainNotadStat> findByClickip3(Integer clickip3);
    /** 
     *通过10+次点击查询
     */
	public List<AdaDomainNotadStat> findByClickip4(Integer clickip4);
    /** 
     *通过目标页访问查询
     */
	public List<AdaDomainNotadStat> findByTargetpageip(Integer targetpageip);
    /** 
     *通过停留时长0-5秒查询
     */
	public List<AdaDomainNotadStat> findByStaytimeip1(Integer staytimeip1);
    /** 
     *通过停留时长6-10查询
     */
	public List<AdaDomainNotadStat> findByStaytimeip2(Integer staytimeip2);
    /** 
     *通过停留时长11-15秒查询
     */
	public List<AdaDomainNotadStat> findByStaytimeip3(Integer staytimeip3);
    /** 
     *通过停留时长16-30秒查询
     */
	public List<AdaDomainNotadStat> findByStaytimeip4(Integer staytimeip4);
    /** 
     *通过1-2次滚动查询
     */
	public List<AdaDomainNotadStat> findByScrollip1(Integer scrollip1);
    /** 
     *通过3-5次滚动查询
     */
	public List<AdaDomainNotadStat> findByScrollip2(Integer scrollip2);
    /** 
     *通过6-10次滚动查询
     */
	public List<AdaDomainNotadStat> findByScrollip3(Integer scrollip3);
    /** 
     *通过10+次滚动查询
     */
	public List<AdaDomainNotadStat> findByScrollip4(Integer scrollip4);
    /** 
     *通过1-2次移动查询
     */
	public List<AdaDomainNotadStat> findByMoveip1(Integer moveip1);
    /** 
     *通过3-5次移动查询
     */
	public List<AdaDomainNotadStat> findByMoveip2(Integer moveip2);
    /** 
     *通过6-10次移动查询
     */
	public List<AdaDomainNotadStat> findByMoveip3(Integer moveip3);
    /** 
     *通过10+次移动查询
     */
	public List<AdaDomainNotadStat> findByMoveip4(Integer moveip4);
    /** 
     *通过日期查询
     */
	public List<AdaDomainNotadStat> findByDate(Date date);
    /** 
     *通过创建时间查询
     */
	public List<AdaDomainNotadStat> findByCreateTime(Timestamp createTime);


}
