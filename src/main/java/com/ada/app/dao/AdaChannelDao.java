package com.ada.app.dao;

import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import java.math.BigDecimal;
import cn.com.jiand.mvc.framework.dao.jpa.EntityJpaDao;
import com.ada.app.domain.AdaChannel;

/**
 * 渠道 JPA Dao
 * @author Wanghl.cn By Code Generator
 */
public interface AdaChannelDao extends EntityJpaDao<AdaChannel, Integer> {

    /** 
     *通过渠道ID查询
     */
    public AdaChannel findById(Integer id);
    /** 
     *通过站点ID查询
     */
	public List<AdaChannel> findBySiteId(Integer siteId);
    /** 
     *通过渠道名称查询
     */
	public List<AdaChannel> findByChannelName(String channelName);
    /** 
     *通过创建时间查询
     */
	public List<AdaChannel> findByCreateTime(Timestamp createTime);


}
