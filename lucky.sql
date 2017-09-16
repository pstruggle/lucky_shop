/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : lucky

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-09-15 16:26:55
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
-- Records of lucky_admin
-- ----------------------------

-- ----------------------------
-- Table structure for lucky_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `lucky_auth_group`;
CREATE TABLE `lucky_auth_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限分组',
  `title` varchar(100) NOT NULL COMMENT '权限组名称',
  `status` tinyint(1) NOT NULL COMMENT '权限组状态',
  `rules` text NOT NULL COMMENT '权限组包含可访问id',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_auth_group
-- ----------------------------

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
-- Records of lucky_auth_rule
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_config
-- ----------------------------
INSERT INTO `lucky_config` VALUES ('1', '1', 'send_mode', '1', '选择短信平台', '选择短信发送平台');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_config_group
-- ----------------------------
INSERT INTO `lucky_config_group` VALUES ('1', 'sms', '短信配置', '0');

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
  `passwd` char(64) NOT NULL,
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `regdate` int(11) unsigned NOT NULL COMMENT '注册时间',
  `regip` char(15) NOT NULL COMMENT '注册ip',
  `lastdate` int(11) unsigned NOT NULL COMMENT '最后登录时间',
  `lastip` varchar(255) NOT NULL COMMENT '最后一次登录ip',
  `islock` tinyint(1) unsigned NOT NULL COMMENT '用户是否锁定',
  `status` tinyint(1) NOT NULL COMMENT '用户状态软删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_users
-- ----------------------------
