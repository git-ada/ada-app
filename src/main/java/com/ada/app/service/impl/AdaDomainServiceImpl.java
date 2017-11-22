package com.ada.app.service.impl;

import org.springframework.stereotype.Service;

import cn.com.jiand.mvc.framework.service.EntityServiceImpl;
import com.ada.app.service.AdaDomainService;
import com.ada.app.dao.AdaDomainDao;
import com.ada.app.domain.AdaDomain;

@Service("adaDomainService")
public class AdaDomainServiceImpl extends EntityServiceImpl<AdaDomain, AdaDomainDao> implements AdaDomainService {

}
