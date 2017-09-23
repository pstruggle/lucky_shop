/*
Navicat MySQL Data Transfer

Source Server         : lucky
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : lucky

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-09-23 17:33:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lucky_admin
-- ----------------------------
DROP TABLE IF EXISTS `lucky_admin`;
CREATE TABLE `lucky_admin` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `auth_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限组id',
  `firstdate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '成为管理员时间',
  `overdate` int(11) NOT NULL DEFAULT '-1' COMMENT '过期时间 -1为不过期',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定该管理员',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除管理员状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `auth_id` (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lucky_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `lucky_auth_group`;
CREATE TABLE `lucky_auth_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限分组',
  `title` varchar(100) NOT NULL COMMENT '权限组名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '权限组状态',
  `rules` text NOT NULL COMMENT '权限组包含可访问id',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lucky_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `lucky_auth_rule`;
CREATE TABLE `lucky_auth_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '功能id',
  `action` varchar(100) NOT NULL COMMENT '功能标识以（模块-控制器-方法）格式',
  `title` varchar(50) NOT NULL COMMENT '功能中文概述',
  `relation` text NOT NULL COMMENT '关联功能id 以，分隔',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用该功能1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `action` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lucky_config
-- ----------------------------
DROP TABLE IF EXISTS `lucky_config`;
CREATE TABLE `lucky_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(3) unsigned NOT NULL COMMENT '配置分组id',
  `action` varchar(50) NOT NULL COMMENT '唯一配置标识',
  `value` text NOT NULL COMMENT '配置值',
  `desc` varchar(255) NOT NULL COMMENT '配置描述',
  `info` varchar(255) NOT NULL COMMENT '配置详情',
  PRIMARY KEY (`id`),
  UNIQUE KEY `action` (`action`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lucky_config_group
-- ----------------------------
DROP TABLE IF EXISTS `lucky_config_group`;
CREATE TABLE `lucky_config_group` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(50) NOT NULL COMMENT '配置组唯一标识',
  `title` varchar(50) NOT NULL COMMENT '配置组中文描述',
  `weight` smallint(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `action` (`action`),
  KEY `weight` (`weight`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lucky_mail_log
-- ----------------------------
DROP TABLE IF EXISTS `lucky_mail_log`;
CREATE TABLE `lucky_mail_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '邮件发送日志',
  `body` text NOT NULL COMMENT '邮件发送内容',
  `to` varchar(255) NOT NULL COMMENT '接收邮件邮箱',
  `subject` varchar(255) NOT NULL COMMENT '邮件主题',
  `name` varchar(255) NOT NULL COMMENT '用户称呼',
  `error` varchar(255) NOT NULL COMMENT '错误提示',
  `result` text NOT NULL COMMENT '发送结果',
  `send_time` int(11) NOT NULL COMMENT '邮件发送日志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lucky_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `lucky_sms_log`;
CREATE TABLE `lucky_sms_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '短信发送日志id',
  `out_id` char(20) NOT NULL COMMENT '短信的回执单号',
  `param` varchar(2555) NOT NULL COMMENT '短信参数',
  `temp` char(30) NOT NULL COMMENT '短信模板code',
  `sign_name` char(50) NOT NULL COMMENT '短信签名',
  `rec_num` char(11) NOT NULL COMMENT '接收短信号码',
  `message` char(20) NOT NULL COMMENT '消息发送状态',
  `code` char(20) NOT NULL COMMENT '短信发送回执状态',
  `result` varchar(2555) NOT NULL COMMENT '短信发送结果',
  `send_time` int(11) unsigned NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lucky_sms_temp
-- ----------------------------
DROP TABLE IF EXISTS `lucky_sms_temp`;
CREATE TABLE `lucky_sms_temp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '短信模板id',
  `temp_code` char(20) NOT NULL COMMENT '短信模板code',
  `sign_name` char(50) NOT NULL COMMENT '短信签名',
  `temp` varchar(255) NOT NULL COMMENT '短信模板',
  `param` varchar(255) NOT NULL COMMENT '模板参数序列以都好分割',
  `desc` varchar(255) NOT NULL COMMENT '模板简单描述(如：验证码模板）',
  `scene` char(20) NOT NULL COMMENT '短信模板场景',
  PRIMARY KEY (`id`),
  UNIQUE KEY `temp_code` (`temp_code`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lucky_users
-- ----------------------------
DROP TABLE IF EXISTS `lucky_users`;
CREATE TABLE `lucky_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `mobile` char(11) NOT NULL COMMENT '手机号码',
  `phone` char(20) NOT NULL COMMENT '用户电话号码',
  `email` varchar(100) NOT NULL COMMENT '邮件地址',
  `wechat` varchar(100) NOT NULL COMMENT '微信账号',
  `passwd` char(255) NOT NULL COMMENT '密码',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `regdate` int(11) unsigned NOT NULL COMMENT '注册时间',
  `regip` char(15) NOT NULL COMMENT '注册ip',
  `lastdate` int(11) unsigned NOT NULL COMMENT '最后登录时间',
  `lastip` varchar(255) NOT NULL COMMENT '最后一次登录ip',
  `islock` tinyint(1) unsigned NOT NULL COMMENT '用户是否锁定',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态软删除',
  `mail_verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '邮箱验证状态0未验证1验证',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lucky_user_access
-- ----------------------------
DROP TABLE IF EXISTS `lucky_user_access`;
CREATE TABLE `lucky_user_access` (
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id 0为未登录用户',
  `group_id` mediumint(5) NOT NULL COMMENT '权限组id',
  PRIMARY KEY (`uid`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
