package com.ada.app.service.impl;

import org.springframework.stereotype.Service;

import cn.com.jiand.mvc.framework.service.EntityServiceImpl;
import com.ada.app.service.AdaAccessLogService;
import com.ada.app.dao.AdaAccessLogDao;
import com.ada.app.domain.AdaAccessLog;

@Service("adaAccessLogService")
public class AdaAccessLogServiceImpl extends EntityServiceImpl<AdaAccessLog, AdaAccessLogDao> implements AdaAccessLogService {

}

