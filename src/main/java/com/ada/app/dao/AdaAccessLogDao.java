//package com.ada.app.dao;
//
//import java.util.List;
//import java.sql.Timestamp;
//import java.util.Date;
//import java.math.BigDecimal;
//import cn.com.jiand.mvc.framework.dao.jpa.EntityJpaDao;
//import com.ada.app.domain.AdaAccessLog;
//
///**
// * 访问日志 JPA Dao
// * @author Wanghl.cn By Code Generator
// */
//public interface AdaAccessLogDao extends EntityJpaDao<AdaAccessLog, Integer> {
//
//    /** 
//     *通过id查询
//     */
//    public AdaAccessLog findById(Long id);
//    /** 
//     *通过站点ID查询
//     */
//	public List<AdaAccessLog> findBySiteId(Integer siteId);
//    /** 
//     *通过域名ID查询
//     */
//	public List<AdaAccessLog> findByDomainId(Integer domainId);
//    /** 
//     *通过渠道ID查询
//     */
//	public List<AdaAccessLog> findByChannelId(Integer channelId);
//    /** 
//     *通过IP地址查询
//     */
//	public List<AdaAccessLog> findByIpAddress(String ipAddress);
//    /** 
//     *通过客户端ID查询
//     */
//	public List<AdaAccessLog> findByUuid(String uuid);
//    /** 
//     *通过浏览页查询
//     */
//	public List<AdaAccessLog> findByUrl(String url);
//    /** 
//     *通过客户端头信息查询
//     */
//	public List<AdaAccessLog> findByUseragent(String useragent);
//    /** 
//     *通过操作系统查询
//     */
//	public List<AdaAccessLog> findByOs(String os);
//    /** 
//     *通过浏览器查询
//     */
//	public List<AdaAccessLog> findByBrowser(String browser);
//    /** 
//     *通过屏幕大小查询
//     */
//	public List<AdaAccessLog> findByScreenSize(String screenSize);
//    /** 
//     *通过页面大小查询
//     */
//	public List<AdaAccessLog> findByPageSize(String pageSize);
//    /** 
//     *通过引用页查询
//     */
//	public List<AdaAccessLog> findByReferer(String referer);
//    /** 
//     *通过在Iframe中查询
//     */
//	public List<AdaAccessLog> findByIframe(Integer iframe);
//    /** 
//     *通过首次访问时间查询
//     */
//	public List<AdaAccessLog> findByFirstTime(Timestamp firstTime);
//    /** 
//     *通过当天首次访问时间查询
//     */
//	public List<AdaAccessLog> findByTodayTime(Timestamp todayTime);
//    /** 
//     *通过客户端请求时间查询
//     */
//	public List<AdaAccessLog> findByRequestTime(Timestamp requestTime);
//    /** 
//     *通过创建时间查询
//     */
//	public List<AdaAccessLog> findByCreateTime(Timestamp createTime);
//
//
//}
