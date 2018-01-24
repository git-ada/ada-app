/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/1/24 11:41:33                           */
/*==============================================================*/


drop table if exists ada_access_log;

drop table if exists ada_ad_page;

drop table if exists ada_channel;

drop table if exists ada_channel_link;

drop table if exists ada_channel_stat;

drop table if exists ada_domain;

drop table if exists ada_domain_ad_15m_stat;

drop table if exists ada_domain_ad_stat;

drop table if exists ada_domain_notad_15m_stat;

drop table if exists ada_domain_notad_stat;

drop table if exists ada_domain_stat;

drop table if exists ada_event_log;

drop table if exists ada_region;

drop table if exists ada_region_ad_stat;

drop table if exists ada_region_notad_stat;

drop table if exists ada_region_stat;

drop table if exists ada_site;

drop table if exists ada_site_stat;

drop table if exists ada_target_page;

drop table if exists ada_user;

/*==============================================================*/
/* Table: ada_access_log                                        */
/*==============================================================*/
create table ada_access_log
(
   id                   int(11) not null auto_increment comment 'id',
   siteId               int(11) comment '站点ID',
   domainId             int(11) comment '域名ID',
   channelId            int(11) comment '渠道ID',
   adId                 int(11) comment '广告ID',
   ipAddress            varchar(24) comment 'IP地址',
   region               varchar(32) comment '地区',
   uuid                 varchar(32) comment '客户端ID',
   url                  varchar(128) comment '浏览页',
   useragent            varchar(256) comment '客户端头信息',
   os                   varchar(24) comment '操作系统',
   browser              varchar(24) comment '浏览器',
   screenSize           varchar(16) comment '屏幕大小',
   pageSize             varchar(16) comment '页面大小',
   referer              varchar(128) comment '引用页',
   iframe               int(11) comment '在Iframe中',
   firstTime            datetime comment '首次访问时间',
   todayTime            datetime comment '当天首次访问时间',
   requestTime          datetime comment '客户端请求时间',
   createTime           datetime comment '创建时间',
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='访问日志';

/*==============================================================*/
/* Table: ada_ad_page                                           */
/*==============================================================*/
create table ada_ad_page
(
   id                   int(11) not null auto_increment comment '渠道ID',
   siteId               int(11) comment '站点ID',
   matchContent         varchar(64) not null comment '渠道名称',
   channelKey           varchar(64) default NULL comment '创建时间',
   createTime           dateTime,
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='广告页';

/*==============================================================*/
/* Table: ada_channel                                           */
/*==============================================================*/
create table ada_channel
(
   id                   int(11) not null auto_increment comment '渠道ID',
   siteId               int(11) comment '站点ID',
   adId                 int(11),
   channelName          varchar(64) comment '渠道名称',
   channelStr           varchar(128),
   createTime           datetime default NULL comment '创建时间',
   domainId             int(11),
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='渠道';

/*==============================================================*/
/* Table: ada_channel_link                                      */
/*==============================================================*/
create table ada_channel_link
(
   id                   int(11) not null auto_increment comment '链接ID',
   siteId               int(11) comment '站点ID',
   channelId            int(11) not null comment '渠道ID',
   url                  varchar(64) not null comment '网页链接地址',
   parameter            varchar(64) comment '参数',
   createTime           datetime default NULL comment '创建时间',
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='渠道链接';

/*==============================================================*/
/* Table: ada_channel_stat                                      */
/*==============================================================*/
create table ada_channel_stat
(
   id                   int(11) not null auto_increment comment 'ID',
   siteId               int(11) comment '站点ID',
   channelId            int(11) comment '渠道ID',
   ip                   int(11) comment 'IP',
   pv                   int(11) comment 'PV',
   clickip1             int(11) comment '1-2次点击',
   clickip2             int(11) comment '3-5次点击',
   clickip3             int(11) comment '6-10次点击',
   clickip4             int(11) comment '10+次点击',
   targetpageip         int(11) comment '目标页访问',
   date                 date comment '日期',
   createTime           datetime default NULL comment '创建时间',
   staytimeip1          int(11),
   staytimeip2          int(11),
   staytimeip3          int(11),
   staytimeip4          int(11),
   scrollip1            int(11),
   scrollip2            int(11),
   scrollip3            int(11),
   scrollip4            int(11),
   moveip1              int(11),
   moveip2              int(11),
   moveip3              int(11),
   moveip4              int(11),
   olduserip            int(11),
   domainId             int(11),
   adId                 int(11),
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='渠道统计';

/*==============================================================*/
/* Table: ada_domain                                            */
/*==============================================================*/
create table ada_domain
(
   id                   int(11) not null auto_increment comment '链接ID',
   siteId               int(11) comment '站点ID',
   domain               varchar(64) not null comment '网页链接地址',
   createTime           datetime default NULL comment '创建时间',
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='域名';

/*==============================================================*/
/* Table: ada_domain_ad_15m_stat                                */
/*==============================================================*/
create table ada_domain_ad_15m_stat
(
   id                   int(11) not null auto_increment comment 'ID',
   siteId               int(11) comment '站点ID',
   domainId             int(11) comment '渠道ID',
   ip                   int(11) comment 'IP',
   pv                   int(11) comment 'PV',
   clickip1             int(11) comment '1-2次点击',
   clickip2             int(11) comment '3-5次点击',
   clickip3             int(11) comment '6-10次点击',
   clickip4             int(11) comment '10+次点击',
   targetpageip         int(11) comment '目标页访问',
   date                 date comment '日期',
   startTime            datetime comment '开始时间',
   endTime              datetime comment '结束时间',
   createTime           datetime default NULL comment '创建时间',
   staytimeip1          int(11),
   staytimeip2          int(11),
   staytimeip3          int(11),
   staytimeip4          int(11),
   scrollip1            int(11),
   scrollip2            int(11),
   scrollip3            int(11),
   scrollip4            int(11),
   moveip1              int(11),
   moveip2              int(11),
   moveip3              int(11),
   moveip4              int(11),
   olduserip            int(11),
   loginip              int(11),
   oldip                int(11),
   uv                   int(11),
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='域名统计';

/*==============================================================*/
/* Table: ada_domain_ad_stat                                    */
/*==============================================================*/
create table ada_domain_ad_stat
(
   id                   int(11) not null auto_increment comment 'ID',
   siteId               int(11) comment '站点ID',
   domainId             int(11) comment '渠道ID',
   ip                   int(11) comment 'IP',
   pv                   int(11) comment 'PV',
   clickip1             int(11) comment '1-2次点击',
   clickip2             int(11) comment '3-5次点击',
   clickip3             int(11) comment '6-10次点击',
   clickip4             int(11) comment '10+次点击',
   targetpageip         int(11) comment '目标页访问',
   date                 date comment '日期',
   createTime           datetime default NULL comment '创建时间',
   staytimeip1          int(11),
   staytimeip2          int(11),
   staytimeip3          int(11),
   staytimeip4          int(11),
   scrollip1            int(11),
   scrollip2            int(11),
   scrollip3            int(11),
   scrollip4            int(11),
   moveip1              int(11),
   moveip2              int(11),
   moveip3              int(11),
   moveip4              int(11),
   olduserip            int(11),
   loginip              int(11),
   oldip                int(11),
   uv                   int(11),
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='域名统计';

/*==============================================================*/
/* Table: ada_domain_notad_15m_stat                             */
/*==============================================================*/
create table ada_domain_notad_15m_stat
(
   id                   int(11) not null auto_increment comment 'ID',
   siteId               int(11) comment '站点ID',
   domainId             int(11) comment '渠道ID',
   ip                   int(11) comment 'IP',
   pv                   int(11) comment 'PV',
   clickip1             int(11) comment '1-2次点击',
   clickip2             int(11) comment '3-5次点击',
   clickip3             int(11) comment '6-10次点击',
   clickip4             int(11) comment '10+次点击',
   targetpageip         int(11) comment '目标页访问',
   date                 date comment '日期',
   startTime            datetime comment '开始时间',
   endTime              datetime comment '结束时间',
   createTime           datetime default NULL comment '创建时间',
   staytimeip1          int(11),
   staytimeip2          int(11),
   staytimeip3          int(11),
   staytimeip4          int(11),
   scrollip1            int(11),
   scrollip2            int(11),
   scrollip3            int(11),
   scrollip4            int(11),
   moveip1              int(11),
   moveip2              int(11),
   moveip3              int(11),
   moveip4              int(11),
   olduserip            int(11),
   loginip              int(11),
   oldip                int(11),
   uv                   int(11),
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='域名统计';

/*==============================================================*/
/* Table: ada_domain_notad_stat                                 */
/*==============================================================*/
create table ada_domain_notad_stat
(
   id                   int(11) not null auto_increment comment 'ID',
   siteId               int(11) comment '站点ID',
   domainId             int(11) comment '渠道ID',
   ip                   int(11) comment 'IP',
   pv                   int(11) comment 'PV',
   clickip1             int(11) comment '1-2次点击',
   clickip2             int(11) comment '3-5次点击',
   clickip3             int(11) comment '6-10次点击',
   clickip4             int(11) comment '10+次点击',
   targetpageip         int(11) comment '目标页访问',
   date                 date comment '日期',
   createTime           datetime default NULL comment '创建时间',
   staytimeip1          int(11),
   staytimeip2          int(11),
   staytimeip3          int(11),
   staytimeip4          int(11),
   scrollip1            int(11),
   scrollip2            int(11),
   scrollip3            int(11),
   scrollip4            int(11),
   moveip1              int(11),
   moveip2              int(11),
   moveip3              int(11),
   moveip4              int(11),
   olduserip            int(11),
   loginip              int(11),
   oldip                int(11),
   uv                   int(11),
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='域名统计';

/*==============================================================*/
/* Table: ada_domain_stat                                       */
/*==============================================================*/
create table ada_domain_stat
(
   id                   int(11) not null auto_increment comment 'ID',
   siteId               int(11) comment '站点ID',
   domainId             int(11) comment '渠道ID',
   ip                   int(11) comment 'IP',
   pv                   int(11) comment 'PV',
   clickip1             int(11) comment '1-2次点击',
   clickip2             int(11) comment '3-5次点击',
   clickip3             int(11) comment '6-10次点击',
   clickip4             int(11) comment '10+次点击',
   targetpageip         int(11) comment '目标页访问',
   date                 date comment '日期',
   createTime           datetime default NULL comment '创建时间',
   staytimeip1          int(11),
   staytimeip2          int(11),
   staytimeip3          int(11),
   staytimeip4          int(11),
   scrollip1            int(11),
   scrollip2            int(11),
   scrollip3            int(11),
   scrollip4            int(11),
   moveip1              int(11),
   moveip2              int(11),
   moveip3              int(11),
   moveip4              int(11),
   olduserip            int(11),
   oldip                int(11),
   loginip              int(11),
   uv                   int(11),
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='域名统计';

/*==============================================================*/
/* Table: ada_event_log                                         */
/*==============================================================*/
create table ada_event_log
(
   id                   int(11) not null auto_increment comment 'id',
   siteId               int(11) comment '站点ID',
   domainId             int(11) comment '域名ID',
   channelId            int(11) comment '渠道ID',
   adId                 int(11) comment '广告ID',
   ipAddress            varchar(24) comment 'IP地址',
   region               varchar(32) comment '地区',
   uuid                 varchar(32) comment '客户端ID',
   url                  varchar(128) comment '浏览页',
   event                varchar(24) comment '事件',
   args                 varchar(32) comment '参数',
   requestTime          datetime comment '客户端请求时间',
   createTime           datetime comment '创建时间',
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='事件日志';

/*==============================================================*/
/* Table: ada_region                                            */
/*==============================================================*/
create table ada_region
(
   id                   int(11) not null comment '地区ID',
   name                 varchar(24) default NULL comment '简称',
   fullname             varchar(64) default NULL comment '全称',
   level                int(11) not null comment '行政级别{1:省,2:市,3:区,4:街道}',
   jianpin              varchar(16) default NULL comment '简拼',
   pinyin               varchar(64) default NULL comment '全拼',
   zipCode              varchar(8) default NULL comment '邮政编码',
   sort                 int(11) default NULL comment '排序',
   isHot                int(11) default NULL comment '是否热点{1:是,0:否}',
   lng                  varchar(16) default NULL comment '经度',
   lat                  varchar(16) default NULL comment '纬度',
   parentId             int(11) default NULL comment '上级ID',
   countryId            int(11),
   countryName          varchar(32),
   provinceId           int(11) default NULL comment '所属省ID',
   provinceName         varchar(32) default NULL comment '所属省名称',
   cityId               int(11) default NULL comment '所属市ID',
   cityName             varchar(32) default NULL comment '所属市名称',
   districtId           int(11) default NULL comment '所属区县ID',
   districtName         varchar(32) default NULL comment '所属区名称',
   primary key (id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政地区';

alter table ada_region comment '地区';

/*==============================================================*/
/* Table: ada_region_ad_stat                                    */
/*==============================================================*/
create table ada_region_ad_stat
(
   id                   int(11) not null auto_increment comment 'ID',
   siteId               int(11) comment '站点ID',
   domainId             int(11) comment '渠道ID',
   region               varchar(100),
   ip                   int(11) comment 'IP',
   pv                   int(11) comment 'PV',
   clickip1             int(11) comment '1-2次点击',
   clickip2             int(11) comment '3-5次点击',
   clickip3             int(11) comment '6-10次点击',
   clickip4             int(11) comment '10+次点击',
   targetpageip         int(11) comment '目标页访问',
   date                 date comment '日期',
   createTime           datetime default NULL comment '创建时间',
   staytimeip1          int(11),
   staytimeip2          int(11),
   staytimeip3          int(11),
   staytimeip4          int(11),
   scrollip1            int(11),
   scrollip2            int(11),
   scrollip3            int(11),
   scrollip4            int(11),
   moveip1              int(11),
   moveip2              int(11),
   moveip3              int(11),
   moveip4              int(11),
   olduserip            int(11),
   oldip                int(11),
   loginip              int(11),
   uv                   int(11),
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='域名统计';

/*==============================================================*/
/* Table: ada_region_notad_stat                                 */
/*==============================================================*/
create table ada_region_notad_stat
(
   id                   int(11) not null auto_increment comment 'ID',
   siteId               int(11) comment '站点ID',
   domainId             int(11) comment '渠道ID',
   region               varchar(100),
   ip                   int(11) comment 'IP',
   pv                   int(11) comment 'PV',
   clickip1             int(11) comment '1-2次点击',
   clickip2             int(11) comment '3-5次点击',
   clickip3             int(11) comment '6-10次点击',
   clickip4             int(11) comment '10+次点击',
   targetpageip         int(11) comment '目标页访问',
   date                 date comment '日期',
   createTime           datetime default NULL comment '创建时间',
   staytimeip1          int(11),
   staytimeip2          int(11),
   staytimeip3          int(11),
   staytimeip4          int(11),
   scrollip1            int(11),
   scrollip2            int(11),
   scrollip3            int(11),
   scrollip4            int(11),
   moveip1              int(11),
   moveip2              int(11),
   moveip3              int(11),
   moveip4              int(11),
   olduserip            int(11),
   oldip                int(11),
   loginip              int(11),
   uv                   int(11),
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='域名统计';

/*==============================================================*/
/* Table: ada_region_stat                                       */
/*==============================================================*/
create table ada_region_stat
(
   id                   int(11) not null auto_increment comment 'ID',
   siteId               int(11) comment '站点ID',
   domainId             int(11) comment '渠道ID',
   region               varchar(100),
   ip                   int(11) comment 'IP',
   pv                   int(11) comment 'PV',
   clickip1             int(11) comment '1-2次点击',
   clickip2             int(11) comment '3-5次点击',
   clickip3             int(11) comment '6-10次点击',
   clickip4             int(11) comment '10+次点击',
   targetpageip         int(11) comment '目标页访问',
   date                 date comment '日期',
   createTime           datetime default NULL comment '创建时间',
   staytimeip1          int(11),
   staytimeip2          int(11),
   staytimeip3          int(11),
   staytimeip4          int(11),
   scrollip1            int(11),
   scrollip2            int(11),
   scrollip3            int(11),
   scrollip4            int(11),
   moveip1              int(11),
   moveip2              int(11),
   moveip3              int(11),
   moveip4              int(11),
   olduserip            int(11),
   oldip                int(11),
   loginip              int(11),
   uv                   int(11),
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='地域统计';

/*==============================================================*/
/* Table: ada_site                                              */
/*==============================================================*/
create table ada_site
(
   id                   int(11) not null comment '站点ID',
   userId               int(11) not null comment '用户ID',
   siteName             varchar(64) comment '站点名称',
   createTime           datetime default NULL comment '创建时间',
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='站点';

/*==============================================================*/
/* Table: ada_site_stat                                         */
/*==============================================================*/
create table ada_site_stat
(
   id                   int(11) not null auto_increment comment 'ID',
   siteId               int(11) comment '站点ID',
   ip                   int(11) comment 'IP',
   pv                   int(11) comment 'PV',
   uv                   int(11),
   adip                 int(11) comment 'IP',
   adpv                 int(11) comment 'PV',
   aduv                 int(11),
   notadip              int(11) comment 'IP',
   notadpv              int(11) comment 'PV',
   notaduv              int(11),
   date                 date comment '日期',
   createTime           datetime default NULL comment '创建时间',
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='站点统计';

/*==============================================================*/
/* Table: ada_target_page                                       */
/*==============================================================*/
create table ada_target_page
(
   id                   int not null auto_increment comment '链接ID',
   siteId               int comment '站点ID',
   url                  varchar(64) not null comment '网页地址',
   matchMode            int,
   pageName             varchar(64),
   createTime           datetime default NULL comment '创建时间',
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='目标页';

/*==============================================================*/
/* Table: ada_user                                              */
/*==============================================================*/
create table ada_user
(
   id                   int(11) not null auto_increment comment '用户ID',
   username             varchar(24) default NULL comment '用户名',
   password             varchar(32) default NULL comment '密码,MD5(Pwd)',
   nickname             varchar(64) comment '昵称',
   realname             varchar(24) default NULL comment '真名',
   idNo                 varchar(24) default NULL comment '身份证号码',
   email                varchar(128) default NULL comment '邮箱',
   phone                varchar(16) default NULL comment '手机',
   birthday             date default NULL comment '生日',
   sex                  int(11) default NULL comment '性别{1:男,2:女,0:未知}',
   headImgUrl           varchar(256) default NULL comment '头像URL',
   provinceId           int(11) default NULL comment '省ID',
   cityId               int(11) default NULL comment '城市ID',
   districtId           int(11) default NULL comment '地区ID',
   homeAddress          varchar(64) default NULL comment '家庭住址',
   status               int(11) default NULL comment '状态{1:正常,-1:禁用}',
   createTime           datetime default NULL comment '创建时间',
   isAdmin              int(1),
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='用户';

