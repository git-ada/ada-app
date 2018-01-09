package com.ada.app.dao;

import java.util.List;
import java.sql.Timestamp;

import org.springframework.data.jpa.repository.Query;

import cn.com.jiand.mvc.framework.dao.jpa.EntityJpaDao;
import com.ada.app.domain.AdaRole;

/**
 * 站点 JPA Dao
 * @author Wanghl.cn By Code Generator
 */
public interface AdaRoleDao extends EntityJpaDao<AdaRole, Integer> {

    /** 
     *通过站点ID查询
     */
    public AdaRole findById(Integer id);
    /** 
     *通过创建时间查询
     */
	public List<AdaRole> findByCreateTime(Timestamp createTime);
	
	@Query(value="select * from  ada_role where id=(select roleId from  ada_user_role where userId = ? )",nativeQuery=true)
    public AdaRole findByUserId(Integer userId);


}
