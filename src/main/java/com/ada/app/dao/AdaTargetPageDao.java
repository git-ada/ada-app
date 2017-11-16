package com.ada.app.dao;

import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import java.math.BigDecimal;
import cn.com.jiand.mvc.framework.dao.jpa.EntityJpaDao;
import com.ada.app.domain.AdaTargetPage;

/**
 * 目标页 JPA Dao
 * @author Wanghl.cn By Code Generator
 */
public interface AdaTargetPageDao extends EntityJpaDao<AdaTargetPage, Integer> {

    /** 
     *通过链接ID查询
     */
    public AdaTargetPage findById(Integer id);
    /** 
     *通过站点ID查询
     */
	public List<AdaTargetPage> findBySiteId(Integer siteId);
    /** 
     *通过网页地址查询
     */
	public List<AdaTargetPage> findByUrl(String url);
    /** 
     *通过创建时间查询
     */
	public List<AdaTargetPage> findByCreateTime(Timestamp createTime);


}
