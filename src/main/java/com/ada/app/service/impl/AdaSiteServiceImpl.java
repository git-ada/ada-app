package com.ada.app.service.impl;

import org.springframework.stereotype.Service;

import cn.com.jiand.mvc.framework.service.EntityServiceImpl;
import com.ada.app.service.AdaSiteService;
import com.ada.app.dao.AdaSiteDao;
import com.ada.app.domain.AdaSite;

@Service("adaSiteService")
public class AdaSiteServiceImpl extends EntityServiceImpl<AdaSite, AdaSiteDao> implements AdaSiteService {

}
