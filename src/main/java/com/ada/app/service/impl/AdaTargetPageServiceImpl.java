package com.ada.app.service.impl;

import org.springframework.stereotype.Service;

import cn.com.jiand.mvc.framework.service.EntityServiceImpl;
import com.ada.app.service.AdaTargetPageService;
import com.ada.app.dao.AdaTargetPageDao;
import com.ada.app.domain.AdaTargetPage;

@Service("adaTargetPageService")
public class AdaTargetPageServiceImpl extends EntityServiceImpl<AdaTargetPage, AdaTargetPageDao> implements AdaTargetPageService {

}
