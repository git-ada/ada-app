package com.ada.app.dao;

import java.util.List;

import cn.com.jiand.mvc.framework.dao.jpa.EntityJpaDao;

import com.ada.app.domain.AdaChannel;
import com.ada.app.domain.AdaDomain;

/**
 * 
 * @author Zhao xiang
 * @since  2017/11/21
 * 
 */
public interface DomainlDao  extends EntityJpaDao<AdaDomain, Integer> {

	/**
	 * 通过站点ID查询下属所有域名
	 * @param siteId
	 * @return
	 */
	public List<AdaDomain> findBySiteId(Integer siteId);
	
	
}
