package com.ada.app.dao;

import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import java.math.BigDecimal;
import cn.com.jiand.mvc.framework.dao.jpa.EntityJpaDao;
import com.ada.app.domain.AdaDomainStat;

/**
 * 域名统计 JPA Dao
 * @author Wanghl.cn By Code Generator
 */
public interface AdaDomainStatDao extends EntityJpaDao<AdaDomainStat, Integer> {

    /** 
     *通过ID查询
     */
    public AdaDomainStat findById(Integer id);
    /** 
     *通过站点ID查询
     */
	public List<AdaDomainStat> findBySiteId(Integer siteId);
    /** 
     *通过渠道ID查询
     */
	public List<AdaDomainStat> findByDomainId(Integer domainId);
    /** 
     *通过IP查询
     */
	public List<AdaDomainStat> findByIp(Integer ip);
    /** 
     *通过PV查询
     */
	public List<AdaDomainStat> findByPv(Integer pv);
    /** 
     *通过1-2次点击查询
     */
	public List<AdaDomainStat> findByClickip1(Integer clickip1);
    /** 
     *通过3-5次点击查询
     */
	public List<AdaDomainStat> findByClickip2(Integer clickip2);
    /** 
     *通过6-10次点击查询
     */
	public List<AdaDomainStat> findByClickip3(Integer clickip3);
    /** 
     *通过10+次点击查询
     */
	public List<AdaDomainStat> findByClickip4(Integer clickip4);
    /** 
     *通过目标页访问查询
     */
	public List<AdaDomainStat> findByTargetpageip(Integer targetpageip);
    /** 
     *通过日期查询
     */
	public List<AdaDomainStat> findByDate(Date date);
    /** 
     *通过创建时间查询
     */
	public List<AdaDomainStat> findByCreateTime(Timestamp createTime);


}
