package com.ada.app.dao;

import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import java.math.BigDecimal;
import cn.com.jiand.mvc.framework.dao.jpa.EntityJpaDao;
import com.ada.app.domain.AdaSite;

/**
 * 站点 JPA Dao
 * @author Wanghl.cn By Code Generator
 */
public interface AdaSiteDao extends EntityJpaDao<AdaSite, Integer> {

    /** 
     *通过站点ID查询
     */
    public AdaSite findById(Integer id);
    /** 
     *通过用户ID查询
     */
	public List<AdaSite> findByUserId(Integer userId);
    /** 
     *通过站点名称查询
     */
	public List<AdaSite> findBySiteName(String siteName);
    /** 
     *通过创建时间查询
     */
	public List<AdaSite> findByCreateTime(Timestamp createTime);


}
