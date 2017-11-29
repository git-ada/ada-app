package com.ada.app.service.impl;

import org.springframework.stereotype.Service;

import cn.com.jiand.mvc.framework.service.EntityServiceImpl;
import com.ada.app.service.AdaAdPageService;
import com.ada.app.dao.AdaAdPageDao;
import com.ada.app.domain.AdaAdPage;

@Service("adaAdPageService")
public class AdaAdPageServiceImpl extends EntityServiceImpl<AdaAdPage, AdaAdPageDao> implements AdaAdPageService {

}
