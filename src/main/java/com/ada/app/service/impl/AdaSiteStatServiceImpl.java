package com.ada.app.service.impl;

import org.springframework.stereotype.Service;

import cn.com.jiand.mvc.framework.service.EntityServiceImpl;
import com.ada.app.service.AdaSiteStatService;
import com.ada.app.dao.AdaSiteStatDao;
import com.ada.app.domain.AdaSiteStat;

@Service("adaSiteStatService")
public class AdaSiteStatServiceImpl extends EntityServiceImpl<AdaSiteStat, AdaSiteStatDao> implements AdaSiteStatService {

}
