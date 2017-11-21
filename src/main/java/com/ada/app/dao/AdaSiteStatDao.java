package com.ada.app.dao;

import java.util.List;
import java.sql.Timestamp;
import java.util.Date;

import org.springframework.data.jpa.repository.Query;

import cn.com.jiand.mvc.framework.dao.jpa.EntityJpaDao;

import com.ada.app.domain.AdaSiteStat;

/**
 * 站点统计 JPA Dao
 * @author Wanghl.cn By Code Generator
 */
public interface AdaSiteStatDao extends EntityJpaDao<AdaSiteStat, Integer> {

    /** 
     *通过ID查询
     */
    public AdaSiteStat findById(Integer id);
    /** 
     *通过站点ID查询
     */
	public List<AdaSiteStat> findBySiteId(Integer siteId);
    /** 
     *通过IP查询
     */
	public List<AdaSiteStat> findByIp(Integer ip);
    /** 
     *通过PV查询
     */
	public List<AdaSiteStat> findByPv(Integer pv);
    /** 
     *通过日期查询
     */
	public List<AdaSiteStat> findByDate(Date date);
    /** 
     *通过创建时间查询
     */
	public List<AdaSiteStat> findByCreateTime(Timestamp createTime);

	@Query(value="select " +
			"t.date as date," +
			"if(s.id is null,t.id,s.id) as id," +
			"if(s.siteId is null,0,s.siteId) as siteId," +
			"if(s.ip is null,0,s.ip) as ip," +
			"if(s.pv is null,0,s.pv) as pv," +
			"if(s.createTime is null,now(),s.createTime) as createTime " +
			"from calendar t left join ada_site_stat s on t.date = s.date and s.siteId = ? where t.date < now() order by t.date desc limit ?,30",nativeQuery=true)
	
	
	public List<AdaSiteStat> findBySiteIdOrderByDate(Integer siteId,Integer pageStart);
}
