/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/11/17 18:25:36                          */
/*==============================================================*/


drop table if exists ada_channel;

drop table if exists ada_channel_link;

drop table if exists ada_channel_stat;

drop table if exists ada_site;

drop table if exists ada_site_stat;

drop table if exists ada_target_page;

drop table if exists ada_user;

/*==============================================================*/
/* Table: ada_channel                                           */
/*==============================================================*/
create table ada_channel
(
   id                   int(11) not null auto_increment comment '渠道ID',
   siteId               int(11) comment '站点ID',
   channelName          varchar(64) not null comment '渠道名称',
   createTime           datetime default NULL comment '创建时间',
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
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='渠道统计';

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
   id                   int(11) not null auto_increment comment '链接ID',
   siteId               int(11) comment '站点ID',
   url                  varchar(128) not null comment '网页地址',
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
   primary key (id)
)
ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COMMENT='用户';

