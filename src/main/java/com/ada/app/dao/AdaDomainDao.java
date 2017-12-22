package com.ada.app.dao;

import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import java.math.BigDecimal;

import org.springframework.data.jpa.repository.Query;

import cn.com.jiand.mvc.framework.dao.jpa.EntityJpaDao;
import com.ada.app.domain.AdaDomain;

/**
 * 域名 JPA Dao
 * @author Wanghl.cn By Code Generator
 */
public interface AdaDomainDao extends EntityJpaDao<AdaDomain, Integer> {

    /** 
     *通过链接ID查询
     */
    public AdaDomain findById(Integer id);
    /** 
     *通过站点ID查询
     */
	public List<AdaDomain> findBySiteId(Integer siteId);
    /** 
     *通过网页链接地址查询
     */
	public List<AdaDomain> findByDomain(String domain);
    /** 
     *通过创建时间查询
     */
	public List<AdaDomain> findByCreateTime(Timestamp createTime);
	@Query(value="select obj from AdaDomain obj where obj.siteId=? and obj.domain like concat('%',?,'%')")
	public List<AdaDomain> findBySiteIdAndLikeDomain(Integer siteId,String domain);

}
