package com.ada.app.service.impl;

import org.springframework.stereotype.Service;

import cn.com.jiand.mvc.framework.service.EntityServiceImpl;
import com.ada.app.service.AdaUserService;
import com.ada.app.dao.AdaUserDao;
import com.ada.app.domain.AdaUser;

@Service("adaUserService")
public class AdaUserServiceImpl extends EntityServiceImpl<AdaUser, AdaUserDao> implements AdaUserService {

}
