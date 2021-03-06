package com.ada.app.dao;

import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import java.math.BigDecimal;

import org.springframework.data.jpa.repository.Query;

import cn.com.jiand.mvc.framework.dao.jpa.EntityJpaDao;
import com.ada.app.domain.AdaChannelStat;

/**
 * 渠道统计 JPA Dao
 * @author Wanghl.cn By Code Generator
 */
public interface AdaChannelStatDao extends EntityJpaDao<AdaChannelStat, Integer> {

    /** 
     *通过ID查询
     */
    public AdaChannelStat findById(Integer id);
    /** 
     *通过站点ID查询
     */
	public List<AdaChannelStat> findBySiteId(Integer siteId);
    /** 
     *通过渠道ID查询
     */
	public List<AdaChannelStat> findByChannelId(Integer channelId);
    /** 
     *通过IP查询
     */
	public List<AdaChannelStat> findByIp(Integer ip);
    /** 
     *通过PV查询
     */
	public List<AdaChannelStat> findByPv(Integer pv);
    /** 
     *通过1-2次点击查询
     */
	public List<AdaChannelStat> findByClickip1(Integer clickip1);
    /** 
     *通过3-5次点击查询
     */
	public List<AdaChannelStat> findByClickip2(Integer clickip2);
    /** 
     *通过6-10次点击查询
     */
	public List<AdaChannelStat> findByClickip3(Integer clickip3);
    /** 
     *通过10+次点击查询
     */
	public List<AdaChannelStat> findByClickip4(Integer clickip4);
    /** 
     *通过日期查询
     */
	public List<AdaChannelStat> findByDate(Date date);
    /** 
     *通过创建时间查询
     */
	public List<AdaChannelStat> findByCreateTime(Timestamp createTime);
	
	@Query(value="select * from ada_channel_stat where siteId=? and date=? order by ip desc",nativeQuery=true)
	public List<AdaChannelStat> findBySiteIdandDate(Integer siteId,String date);
	
	@Query(value="select ads.* from ada_channel_stat ads left join ada_channel d " +
			"on ads.channelId=d.id where ads.siteId=? and ads.date=? and d.channelName like concat('%',?,'%') order by ads.ip desc",nativeQuery=true)
	public List<AdaChannelStat> findBySiteIdandDateAndChannelname(Integer siteId,String date,String channelName);

	@Query(value="select * from ada_channel_stat where domainId=? and date=?",nativeQuery=true)
	public List<AdaChannelStat> findByDomainIdAndDate(Integer domainId,String date);

}
