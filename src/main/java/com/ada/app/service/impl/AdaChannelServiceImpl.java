package com.ada.app.service.impl;

import org.springframework.stereotype.Service;

import cn.com.jiand.mvc.framework.service.EntityServiceImpl;
import com.ada.app.service.AdaChannelService;
import com.ada.app.dao.AdaChannelDao;
import com.ada.app.domain.AdaChannel;

@Service("adaChannelService")
public class AdaChannelServiceImpl extends EntityServiceImpl<AdaChannel, AdaChannelDao> implements AdaChannelService {

}
