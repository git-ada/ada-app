package com.ada.app.dao;

import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import java.math.BigDecimal;
import cn.com.jiand.mvc.framework.dao.jpa.EntityJpaDao;
import com.ada.app.domain.AdaUser;

/**
 * 用户 JPA Dao
 * @author Wanghl.cn By Code Generator
 */
public interface AdaUserDao extends EntityJpaDao<AdaUser, Integer> {

    /** 
     *通过用户ID查询
     */
    public AdaUser findById(Integer id);
    /** 
     *通过用户名查询
     */
	public AdaUser findByUsername(String username);
	public AdaUser findByUsernameAndIsAdmin(String username,Integer isAdmin);
    /** 
     *通过密码,MD5查询
     */
	public List<AdaUser> findByPassword(String password);
    /** 
     *通过昵称查询
     */
	public List<AdaUser> findByNickname(String nickname);
    /** 
     *通过真名查询
     */
	public List<AdaUser> findByRealname(String realname);
    /** 
     *通过身份证号码查询
     */
	public List<AdaUser> findByIdNo(String idNo);
    /** 
     *通过邮箱查询
     */
	public List<AdaUser> findByEmail(String email);
    /** 
     *通过手机查询
     */
	public List<AdaUser> findByPhone(String phone);
    /** 
     *通过生日查询
     */
	public List<AdaUser> findByBirthday(Date birthday);
    /** 
     *通过性别查询
     */
	public List<AdaUser> findBySex(Integer sex);
    /** 
     *通过头像URL查询
     */
	public List<AdaUser> findByHeadImgUrl(String headImgUrl);
    /** 
     *通过省ID查询
     */
	public List<AdaUser> findByProvinceId(Integer provinceId);
    /** 
     *通过城市ID查询
     */
	public List<AdaUser> findByCityId(Integer cityId);
    /** 
     *通过地区ID查询
     */
	public List<AdaUser> findByDistrictId(Integer districtId);
    /** 
     *通过家庭住址查询
     */
	public List<AdaUser> findByHomeAddress(String homeAddress);
    /** 
     *通过状态查询
     */
	public List<AdaUser> findByStatus(Integer status);
    /** 
     *通过创建时间查询
     */
	public List<AdaUser> findByCreateTime(Timestamp createTime);


}
