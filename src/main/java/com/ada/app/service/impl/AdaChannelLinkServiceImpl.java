package com.ada.app.service.impl;

import org.springframework.stereotype.Service;

import cn.com.jiand.mvc.framework.service.EntityServiceImpl;
import com.ada.app.service.AdaChannelLinkService;
import com.ada.app.dao.AdaChannelLinkDao;
import com.ada.app.domain.AdaChannelLink;

@Service("adaChannelLinkService")
public class AdaChannelLinkServiceImpl extends EntityServiceImpl<AdaChannelLink, AdaChannelLinkDao> implements AdaChannelLinkService {

}
