package com.ada.app.service.impl;

import org.springframework.stereotype.Service;

import cn.com.jiand.mvc.framework.service.EntityServiceImpl;
import com.ada.app.service.AdaDomainStatService;
import com.ada.app.dao.AdaDomainStatDao;
import com.ada.app.domain.AdaDomainStat;

@Service("adaDomainStatService")
public class AdaDomainStatServiceImpl extends EntityServiceImpl<AdaDomainStat, AdaDomainStatDao> implements AdaDomainStatService {

}
