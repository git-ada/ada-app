package com.ada.app.dao;

import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import java.math.BigDecimal;
import cn.com.jiand.mvc.framework.dao.jpa.EntityJpaDao;
import com.ada.app.domain.AdaChannelLink;

/**
 * 渠道链接 JPA Dao
 * @author Wanghl.cn By Code Generator
 */
public interface AdaChannelLinkDao extends EntityJpaDao<AdaChannelLink, Integer> {

    /** 
     *通过链接ID查询
     */
    public AdaChannelLink findById(Integer id);
    /** 
     *通过渠道ID查询
     */
	public List<AdaChannelLink> findByChannelId(Integer channelId);
    /** 
     *通过网页链接地址查询
     */
	public List<AdaChannelLink> findByUrl(String url);
    /** 
     *通过参数查询
     */
	public List<AdaChannelLink> findByParameter(String parameter);
    /** 
     *通过创建时间查询
     */
	public List<AdaChannelLink> findByCreateTime(Timestamp createTime);


}
