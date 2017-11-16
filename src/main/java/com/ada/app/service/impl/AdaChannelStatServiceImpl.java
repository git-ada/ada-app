package com.ada.app.service.impl;

import org.springframework.stereotype.Service;

import cn.com.jiand.mvc.framework.service.EntityServiceImpl;
import com.ada.app.service.AdaChannelStatService;
import com.ada.app.dao.AdaChannelStatDao;
import com.ada.app.domain.AdaChannelStat;

@Service("adaChannelStatService")
public class AdaChannelStatServiceImpl extends EntityServiceImpl<AdaChannelStat, AdaChannelStatDao> implements AdaChannelStatService {

}
