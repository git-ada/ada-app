package com.ada.app.service;

import java.util.Set;

/**
 * 历史访问IP地址库，
 */
public interface IPSetService {

	/**
	 * 是否存在
	 * @param ipAddress
	 * @return
	 */
	public boolean exists(Integer domainId,String ipAddress);
	
	/**
	 * 添加一个
	 * @param domainId
	 * @param ipAddress
	 * @return
	 */
	public void add(Integer domainId,String ipAddress);
	
	/**
	 * 批量添加IP数据集
	 * @param domianId
	 * @param ipSet
	 * @return
	 */
	public void batchAdd(Integer domianId,Set<String> ipSet);
	
	
}
