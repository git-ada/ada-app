package com.ada.app.dao;

import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import java.math.BigDecimal;
import cn.com.jiand.mvc.framework.dao.jpa.EntityJpaDao;
import com.ada.app.domain.AdaAdPage;

/**
 * 广告页 JPA Dao
 * @author Wanghl.cn By Code Generator
 */
public interface AdaAdPageDao extends EntityJpaDao<AdaAdPage, Integer> {

    /** 
     *通过渠道ID查询
     */
    public AdaAdPage findById(Integer id);
    /** 
     *通过站点ID查询
     */
	public List<AdaAdPage> findBySiteId(Integer siteId);
    /** 
     *通过渠道名称查询
     */
	public List<AdaAdPage> findByMatchContent(String matchContent);
    /** 
     *通过创建时间查询
     */
	public List<AdaAdPage> findByChannelKey(String channelKey);
    /** 
     *通过createTime查询
     */
	public List<AdaAdPage> findByCreateTime(Timestamp createTime);


}
