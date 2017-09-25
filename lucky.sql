/*
Navicat MySQL Data Transfer

Source Server         : lucky
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : lucky

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-09-25 23:06:09
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
  `overdate` int(11) NOT NULL DEFAULT '0' COMMENT '过期时间 0为不过期',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定该管理员',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除管理员状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `auth_id` (`auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_admin
-- ----------------------------
INSERT INTO `lucky_admin` VALUES ('1', '17', '0', '0', '0', '0', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_auth_group
-- ----------------------------
INSERT INTO `lucky_auth_group` VALUES ('1', '游客访问权限', '1', '3,4,5,6,7,8,9', '0');

-- ----------------------------
-- Table structure for lucky_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `lucky_auth_rule`;
CREATE TABLE `lucky_auth_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '功能id',
  `module` varchar(100) NOT NULL COMMENT '模块',
  `controller` varchar(100) NOT NULL COMMENT '控制器',
  `action` varchar(100) NOT NULL COMMENT '操作',
  `title` varchar(50) NOT NULL COMMENT '功能中文概述',
  `relation` text NOT NULL COMMENT '关联功能id 以，分隔',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用该功能1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `action` (`action`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_auth_rule
-- ----------------------------
INSERT INTO `lucky_auth_rule` VALUES ('1', '', '', 'admin_index_index', '首页', '', '1');
INSERT INTO `lucky_auth_rule` VALUES ('2', '', '', 'admin_system_index', '系统设置', '', '1');
INSERT INTO `lucky_auth_rule` VALUES ('3', '', '', 'restrict_index_index', '用户登录', '', '1');
INSERT INTO `lucky_auth_rule` VALUES ('4', '', '', 'restrict_index_test', '功能测试', '', '1');
INSERT INTO `lucky_auth_rule` VALUES ('5', '', '', 'restrict_index_register', '用户注册', '', '1');
INSERT INTO `lucky_auth_rule` VALUES ('6', '', '', 'restrict_index_checkcode', '验证图形验证码是否正确', '', '1');
INSERT INTO `lucky_auth_rule` VALUES ('7', '', '', 'restrict_index_create', '创建用户', '', '1');
INSERT INTO `lucky_auth_rule` VALUES ('8', '', '', 'restrict_index_mailprove', '邮箱验证', '', '1');
INSERT INTO `lucky_auth_rule` VALUES ('9', '', '', 'restrict_index_sign', '登录验证', '', '1');

-- ----------------------------
-- Table structure for lucky_category
-- ----------------------------
DROP TABLE IF EXISTS `lucky_category`;
CREATE TABLE `lucky_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品分类id',
  `pid` int(11) unsigned NOT NULL COMMENT '商品父id',
  `name` varchar(100) NOT NULL COMMENT '分类名称',
  `mobile_name` varchar(100) NOT NULL COMMENT '手机名称',
  `is_show` tinyint(1) unsigned NOT NULL COMMENT '是否导航显示',
  `image` varchar(255) NOT NULL COMMENT '分类图片',
  `weight` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_category
-- ----------------------------
INSERT INTO `lucky_category` VALUES ('1', '0', '点心/蛋糕', '点心蛋糕', '0', '', '0', '1506326961');
INSERT INTO `lucky_category` VALUES ('2', '0', '点心/蛋糕', '点心蛋糕', '0', '', '0', '1506326973');
INSERT INTO `lucky_category` VALUES ('3', '1', '蛋糕', '蛋糕', '1', '', '0', '1506345249');
INSERT INTO `lucky_category` VALUES ('4', '3', '蒸蛋糕', '蒸蛋糕', '0', '', '0', '1506350097');

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_config
-- ----------------------------
INSERT INTO `lucky_config` VALUES ('1', '1', 'send_mode', 'aliyun', '选择短信平台', '选择短信发送平台');
INSERT INTO `lucky_config` VALUES ('2', '1', 'scene_reg', '1', '注册短信验证', '选择是否开启');
INSERT INTO `lucky_config` VALUES ('3', '1', 'sms_appkey', 'LTAI3zVfvEg9cdBW', '短信平台[appkey]', '该短信平台[appkey]应从短信平台内获取');
INSERT INTO `lucky_config` VALUES ('4', '1', 'sms_secretKey', 'uNDDVOZX0lF6jAjnn9pk24gtsoD9M6', '短信平台[secretKey]', '该短信平台[secretKey]应从短信平台内获取');
INSERT INTO `lucky_config` VALUES ('7', '9', 'host', 'smtp.163.com', '邮件服务器名称', '服务器名称如（smtp.163.com）');
INSERT INTO `lucky_config` VALUES ('8', '9', 'username', 'cjphp1018@163.com', '您的邮箱名', '请输入您的邮箱名');
INSERT INTO `lucky_config` VALUES ('9', '9', 'from', 'cjphp1018@163.com', '发件人地址', '请输入发件人邮箱地址');
INSERT INTO `lucky_config` VALUES ('10', '9', 'fromname', '幸运商城', '发件人名称', '请输入发件人名称（如：公司简称）');
INSERT INTO `lucky_config` VALUES ('11', '9', 'password', 'cjphp1018', '邮箱密码', '请输入您的邮箱密码');
INSERT INTO `lucky_config` VALUES ('12', '2', 'mall_name', '幸运商城', '商城名称', '商城名称');
INSERT INTO `lucky_config` VALUES ('13', '3', 'encrypt_key', 'lucky', '加密key', '网站的加密密钥（不要随意改动）');
INSERT INTO `lucky_config` VALUES ('14', '2', 'record_no', '备案信息', '备案信息', '网站备案号网站备案号，将显示在前台底部欢迎信息等位置');
INSERT INTO `lucky_config` VALUES ('15', '2', 'store_title', '幸运商城', '网站标题', '网站标题，将显示在前台顶部欢迎信息等位置');
INSERT INTO `lucky_config` VALUES ('16', '2', 'store_desc', '自营商场', '网站描述', '网站描述，将显示在前台顶部欢迎信息等位置');
INSERT INTO `lucky_config` VALUES ('17', '2', 'store_keyword', '商城', '网站关键字', '网站关键字，便于SEO');
INSERT INTO `lucky_config` VALUES ('18', '2', 'contact', '纯简', '联系人', '网站显示联系人');
INSERT INTO `lucky_config` VALUES ('19', '2', 'phone', '1234567891', '联系人电话', '网站的联系人电话');
INSERT INTO `lucky_config` VALUES ('20', '2', 'address', '具体地址', '具体地址', '具体地址');
INSERT INTO `lucky_config` VALUES ('21', '2', 'qq', '1234567891', '客服QQ1', '商家中心右下侧显示，方便商家遇到问题时咨询');
INSERT INTO `lucky_config` VALUES ('22', '2', 'qq1', '1234567895', '客服QQ2', '商家中心右下侧显示，方便商家遇到问题时咨询');
INSERT INTO `lucky_config` VALUES ('23', '2', 'qq2', '1234567896', '客服QQ3', '商家中心右下侧显示，方便商家遇到问题时咨询');

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
-- Records of lucky_config_group
-- ----------------------------
INSERT INTO `lucky_config_group` VALUES ('1', 'sms', '短信配置', '6');
INSERT INTO `lucky_config_group` VALUES ('2', 'mall', '商城信息', '1');
INSERT INTO `lucky_config_group` VALUES ('3', 'basic', '基本配置', '2');
INSERT INTO `lucky_config_group` VALUES ('4', 'trade', '购物流程', '3');
INSERT INTO `lucky_config_group` VALUES ('5', 'wechat', '微信配置', '4');
INSERT INTO `lucky_config_group` VALUES ('6', 'payment', '支付配置', '5');
INSERT INTO `lucky_config_group` VALUES ('7', 'watermark', '水印配置', '7');
INSERT INTO `lucky_config_group` VALUES ('8', 'push', '推送配置', '8');
INSERT INTO `lucky_config_group` VALUES ('9', 'email', '邮件配置', '9');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_mail_log
-- ----------------------------
INSERT INTO `lucky_mail_log` VALUES ('1', '<div>\r\n<span class=\"genEmailNicker\">\r\n\r\n</span>\r\n<br>\r\n<span class=\"genEmailContent\">\r\n          <br>\r\n尊敬的用户 ：\r\n<br>\r\n<br>\r\n&nbsp;&nbsp; &nbsp; &nbsp; 您好！恭喜您注册成为%s。\r\n<br>\r\n<br>\r\n&nbsp;&nbsp; &nbsp; &nbsp; 这是一封注册认证邮件，请点击以下链接确认：\r\n<br>\r\n&nbsp;&nbsp; &nbsp; &nbsp; <a href=\"%s\" target=\"_blank\">%s</a> \r\n<br>\r\n<br>\r\n&nbsp;&nbsp; &nbsp; &nbsp; 如果链接不能点击，请复制地址到浏览器，然后直接打开。\r\n<br>\r\n<br>\r\n&nbsp;&nbsp; &nbsp; &nbsp; 上述链接48小时内有效。如果激活链接失效，请您登录网站\r\n<a target=\"_blank\" href=\"%s\"> %s</a>\r\n重新申请认证。\r\n<br>\r\n<br>\r\n&nbsp;&nbsp; &nbsp; &nbsp; 感谢您注册%s！\r\n<br>\r\n<br>\r\n&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; %s项目组\r\n<br>\r\n<br>\r\n&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\">%s</span>\r\n</span>\r\n<br>\r\n<span class=\"genEmailTail\">\r\n\r\n</span>\r\n</div>', '1767158841@qq.com', '幸运商城-注册认证', '1767158841@qq.com', '发送成功', '{\"errorCode\":true,\"error\":\"\\u53d1\\u9001\\u6210\\u529f\"}', '1506004536');
INSERT INTO `lucky_mail_log` VALUES ('2', '<div><span class=\"genEmailNicker\"></span><br><span class=\"genEmailContent\"><br>尊敬的用户 ：<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 您好！恭喜您注册成为幸运商城。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 这是一封注册认证邮件，请点击以下链接确认：<br>&nbsp;&nbsp; &nbsp; &nbsp; <a href=\"http://www.cjphp.com/restrict/index/mailprove.html?checkcode=8a8dF77dTkf90TD+o+0b2gNR/8tFF35bIu6uMWhpgZ61rrZeqaZxY1hnNOunYswn9j5ZdiJo8w\" target=\"_blank\">http://www.cjphp.com/restrict/index/mailprove.html?checkcode=8a8dF77dTkf90TD+o+0b2gNR/8tFF35bIu6uMWhpgZ61rrZeqaZxY1hnNOunYswn9j5ZdiJo8w</a> <br><br>&nbsp;&nbsp; &nbsp; &nbsp; 如果链接不能点击，请复制地址到浏览器，然后直接打开。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 上述链接48小时内有效。如果激活链接失效，请您登录网站<a target=\"_blank\" href=\"http://www.cjphp.com\"> http://www.cjphp.com</a>重新申请认证。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 感谢您注册%s！<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 幸运商城项目组<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\">幸运商城</span></span><br><span class=\"genEmailTail\"></span></div>', '1767158841@qq.com', '幸运商城-注册认证', '1767158841@qq.com', '发送成功', '{\"errorCode\":true,\"error\":\"\\u53d1\\u9001\\u6210\\u529f\"}', '1506006873');
INSERT INTO `lucky_mail_log` VALUES ('3', '<div><span class=\"genEmailNicker\"></span><br><span class=\"genEmailContent\"><br>尊敬的用户 ：<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 您好！恭喜您注册成为幸运商城。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 这是一封注册认证邮件，请点击以下链接确认：<br>&nbsp;&nbsp; &nbsp; &nbsp; <a href=\"/restrict/index/mailprove.html?checkcode=8475YlXb/49V0Mf0x7oQ606GcewM4uUDnFydEpYbZ/Qm0OO3HSyiQGMiXgkxTwqDnhb5LFiJrQ\" target=\"_blank\">/restrict/index/mailprove.html?checkcode=8475YlXb/49V0Mf0x7oQ606GcewM4uUDnFydEpYbZ/Qm0OO3HSyiQGMiXgkxTwqDnhb5LFiJrQ</a> <br><br>&nbsp;&nbsp; &nbsp; &nbsp; 如果链接不能点击，请复制地址到浏览器，然后直接打开。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 上述链接48小时内有效。如果激活链接失效，请您登录网站<a target=\"_blank\" href=\"\"> </a>重新申请认证。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 感谢您注册%s！<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 幸运商城项目组<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\">幸运商城</span></span><br><span class=\"genEmailTail\"></span></div>', '1767158841@qq.com', '幸运商城-注册认证', '1767158841@qq.com', '发送成功', '{\"errorCode\":true,\"error\":\"\\u53d1\\u9001\\u6210\\u529f\"}', '1506036912');
INSERT INTO `lucky_mail_log` VALUES ('4', '<div><span class=\"genEmailNicker\"></span><br><span class=\"genEmailContent\"><br>尊敬的用户 ：<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 您好！恭喜您注册成为幸运商城。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 这是一封注册认证邮件，请点击以下链接确认：<br>&nbsp;&nbsp; &nbsp; &nbsp; <a href=\"http://www.cjphp.com/restrict/index/mailprove.html?checkcode=9350/Of5zkkOp7wVMwE6gL9EWYYbk3NcTBQnuC5FlAXhHWjW1bOcaWLbiHJK4e0EeWIYg5xQpA\" target=\"_blank\">http://www.cjphp.com/restrict/index/mailprove.html?checkcode=9350/Of5zkkOp7wVMwE6gL9EWYYbk3NcTBQnuC5FlAXhHWjW1bOcaWLbiHJK4e0EeWIYg5xQpA</a> <br><br>&nbsp;&nbsp; &nbsp; &nbsp; 如果链接不能点击，请复制地址到浏览器，然后直接打开。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 上述链接48小时内有效。如果激活链接失效，请您登录网站<a target=\"_blank\" href=\"http://www.cjphp.com\"> http://www.cjphp.com</a>重新申请认证。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 感谢您注册%s！<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 幸运商城项目组<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\">幸运商城</span></span><br><span class=\"genEmailTail\"></span></div>', '1767158841@qq.com', '幸运商城-注册认证', '1767158841@qq.com', '发送成功', '{\"errorCode\":true,\"error\":\"\\u53d1\\u9001\\u6210\\u529f\"}', '1506037290');
INSERT INTO `lucky_mail_log` VALUES ('5', '<div><span class=\"genEmailNicker\"></span><br><span class=\"genEmailContent\"><br>尊敬的用户 ：<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 您好！恭喜您注册成为幸运商城。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 这是一封注册认证邮件，请点击以下链接确认：<br>&nbsp;&nbsp; &nbsp; &nbsp; <a href=\"http://www.cjphp.com/restrict/index/mailprove.html?checkcode=33a203WH5GEajcqy+pBSFAazDBJgzjncCvEFG5SQIYwavSnbBV43TtgZ9tIrry3N4fKQ2wzWXRR32c5fW5jpE4mMSAOToemLUX67nbITYL+quGXcgJ9+72LSrm/oPqhT\" target=\"_blank\">http://www.cjphp.com/restrict/index/mailprove.html?checkcode=33a203WH5GEajcqy+pBSFAazDBJgzjncCvEFG5SQIYwavSnbBV43TtgZ9tIrry3N4fKQ2wzWXRR32c5fW5jpE4mMSAOToemLUX67nbITYL+quGXcgJ9+72LSrm/oPqhT</a> <br><br>&nbsp;&nbsp; &nbsp; &nbsp; 如果链接不能点击，请复制地址到浏览器，然后直接打开。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 上述链接48小时内有效。如果激活链接失效，请您登录网站<a target=\"_blank\" href=\"http://www.cjphp.com\"> http://www.cjphp.com</a>重新申请认证。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 感谢您注册%s！<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 幸运商城项目组<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\">幸运商城</span></span><br><span class=\"genEmailTail\"></span></div>', '1767158841@qq.com', '幸运商城-注册认证', '1767158841@qq.com', '发送成功', '{\"errorCode\":true,\"error\":\"\\u53d1\\u9001\\u6210\\u529f\"}', '1506038632');
INSERT INTO `lucky_mail_log` VALUES ('6', '<div><span class=\"genEmailNicker\"></span><br><span class=\"genEmailContent\"><br>尊敬的用户 ：<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 您好！恭喜您注册成为幸运商城。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 这是一封注册认证邮件，请点击以下链接确认：<br>&nbsp;&nbsp; &nbsp; &nbsp; <a href=\"http://www.cjphp.com/restrict/index/mailprove.html?checkcode=fbf2U6K5kkGQEZQfDG60zxvex1fl9eXKaCFmDDF%2FM1SAYS6mbg%2FXuI0ctQewYe0KPeb%2BzR24Co8YkbWpZulQ5Y%2FV%2BeMixqChIP1IMKvdp03qIAGAA6hqKBjtyj%2BBEDVh\" target=\"_blank\">http://www.cjphp.com/restrict/index/mailprove.html?checkcode=fbf2U6K5kkGQEZQfDG60zxvex1fl9eXKaCFmDDF%2FM1SAYS6mbg%2FXuI0ctQewYe0KPeb%2BzR24Co8YkbWpZulQ5Y%2FV%2BeMixqChIP1IMKvdp03qIAGAA6hqKBjtyj%2BBEDVh</a> <br><br>&nbsp;&nbsp; &nbsp; &nbsp; 如果链接不能点击，请复制地址到浏览器，然后直接打开。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 上述链接48小时内有效。如果激活链接失效，请您登录网站<a target=\"_blank\" href=\"http://www.cjphp.com\"> http://www.cjphp.com</a>重新申请认证。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 感谢您注册%s！<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 幸运商城项目组<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\">幸运商城</span></span><br><span class=\"genEmailTail\"></span></div>', '1767158841@qq.com', '幸运商城-注册认证', '1767158841@qq.com', '发送成功', '{\"errorCode\":true,\"error\":\"\\u53d1\\u9001\\u6210\\u529f\"}', '1506080179');
INSERT INTO `lucky_mail_log` VALUES ('7', '<div><span class=\"genEmailNicker\"></span><br><span class=\"genEmailContent\"><br>尊敬的用户 ：<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 您好！恭喜您注册成为幸运商城。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 这是一封注册认证邮件，请点击以下链接确认：<br>&nbsp;&nbsp; &nbsp; &nbsp; <a href=\"http://www.cjphp.com/restrict/index/mailprove.html?checkcode=b87fWrtfurvZ0Jx7qUvIHZrVtrjz%2FIoCI7FmBF4NMSufsoo4e276GkKbxLK2hArTKf0QjhJLQGug3b%2Bv68r%2FxHQ34i68OaKDtjBn%2BFlVL2lHz1oQ%2FtjZlg%2BjHjmX0lHa\" target=\"_blank\">http://www.cjphp.com/restrict/index/mailprove.html?checkcode=b87fWrtfurvZ0Jx7qUvIHZrVtrjz%2FIoCI7FmBF4NMSufsoo4e276GkKbxLK2hArTKf0QjhJLQGug3b%2Bv68r%2FxHQ34i68OaKDtjBn%2BFlVL2lHz1oQ%2FtjZlg%2BjHjmX0lHa</a> <br><br>&nbsp;&nbsp; &nbsp; &nbsp; 如果链接不能点击，请复制地址到浏览器，然后直接打开。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 上述链接48小时内有效。如果激活链接失效，请您登录网站<a target=\"_blank\" href=\"http://www.cjphp.com\"> http://www.cjphp.com</a>重新申请认证。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 感谢您注册%s！<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 幸运商城项目组<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\">幸运商城</span></span><br><span class=\"genEmailTail\"></span></div>', '1767158841@qq.com', '幸运商城-注册认证', '1767158841@qq.com', '发送成功', '{\"errorCode\":true,\"error\":\"\\u53d1\\u9001\\u6210\\u529f\"}', '1506080594');
INSERT INTO `lucky_mail_log` VALUES ('8', '<div><span class=\"genEmailNicker\"></span><br><span class=\"genEmailContent\"><br>尊敬的用户 ：<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 您好！恭喜您注册成为幸运商城。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 这是一封注册认证邮件，请点击以下链接确认：<br>&nbsp;&nbsp; &nbsp; &nbsp; <a href=\"http://www.cjphp.com/restrict/index/mailprove.html?checkcode=2eef1QJr1QInP31Qy12CR75ePzabspyoQOxBwwfh8Fu7JQqLCL%2FljKoV%2Bj1FYnwy83IAMxln84uTX%2BNAxy40GEzdSxNpGZtlxjTpBCc2Zxcb\" target=\"_blank\">http://www.cjphp.com/restrict/index/mailprove.html?checkcode=2eef1QJr1QInP31Qy12CR75ePzabspyoQOxBwwfh8Fu7JQqLCL%2FljKoV%2Bj1FYnwy83IAMxln84uTX%2BNAxy40GEzdSxNpGZtlxjTpBCc2Zxcb</a> <br><br>&nbsp;&nbsp; &nbsp; &nbsp; 如果链接不能点击，请复制地址到浏览器，然后直接打开。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 上述链接48小时内有效。如果激活链接失效，请您登录网站<a target=\"_blank\" href=\"http://www.cjphp.com\"> http://www.cjphp.com</a>重新申请认证。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 感谢您注册%s！<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 幸运商城项目组<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\">幸运商城</span></span><br><span class=\"genEmailTail\"></span></div>', '1767158841@qq.com', '幸运商城-注册认证', '1767158841@qq.com', '发送成功', '{\"errorCode\":true,\"error\":\"\\u53d1\\u9001\\u6210\\u529f\"}', '1506080835');
INSERT INTO `lucky_mail_log` VALUES ('9', '<div><span class=\"genEmailNicker\"></span><br><span class=\"genEmailContent\"><br>尊敬的用户 ：<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 您好！恭喜您注册成为幸运商城。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 这是一封注册认证邮件，请点击以下链接确认：<br>&nbsp;&nbsp; &nbsp; &nbsp; <a href=\"http://www.cjphp.com/restrict/index/mailprove.html?checkcode=d5e5pOlgJm52G7vg9mvRnYrR%2BBPevytklM4jHTTme%2FgMyXIsKMbTanMO7fUPLG7BIKhtS8mCOQ\" target=\"_blank\">http://www.cjphp.com/restrict/index/mailprove.html?checkcode=d5e5pOlgJm52G7vg9mvRnYrR%2BBPevytklM4jHTTme%2FgMyXIsKMbTanMO7fUPLG7BIKhtS8mCOQ</a> <br><br>&nbsp;&nbsp; &nbsp; &nbsp; 如果链接不能点击，请复制地址到浏览器，然后直接打开。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 上述链接48小时内有效。如果激活链接失效，请您登录网站<a target=\"_blank\" href=\"http://www.cjphp.com\"> http://www.cjphp.com</a>重新申请认证。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 感谢您注册%s！<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 幸运商城项目组<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\">幸运商城</span></span><br><span class=\"genEmailTail\"></span></div>', '1767158841@qq.com', '幸运商城-注册认证', '1767158841@qq.com', '发送成功', '{\"errorCode\":true,\"error\":\"\\u53d1\\u9001\\u6210\\u529f\"}', '1506080915');
INSERT INTO `lucky_mail_log` VALUES ('10', '<div><span class=\"genEmailNicker\"></span><br><span class=\"genEmailContent\"><br>尊敬的用户 ：<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 您好！恭喜您注册成为幸运商城。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 这是一封注册认证邮件，请点击以下链接确认：<br>&nbsp;&nbsp; &nbsp; &nbsp; <a href=\"http://www.cjphp.com/restrict/index/mailprove.html?checkcode=234fDgsxyn9N2BBcL8dQLeEtibfkvKR1Oh1aJ90KDGyfwewMmqNaFE3zd8Run6E6x28f69S84y2kU4qCO6EUmwKiry%2Bg5KqU3EmJA7y80OjP\" target=\"_blank\">http://www.cjphp.com/restrict/index/mailprove.html?checkcode=234fDgsxyn9N2BBcL8dQLeEtibfkvKR1Oh1aJ90KDGyfwewMmqNaFE3zd8Run6E6x28f69S84y2kU4qCO6EUmwKiry%2Bg5KqU3EmJA7y80OjP</a> <br><br>&nbsp;&nbsp; &nbsp; &nbsp; 如果链接不能点击，请复制地址到浏览器，然后直接打开。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 上述链接48小时内有效。如果激活链接失效，请您登录网站<a target=\"_blank\" href=\"http://www.cjphp.com\"> http://www.cjphp.com</a>重新申请认证。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 感谢您注册%s！<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 幸运商城项目组<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\">幸运商城</span></span><br><span class=\"genEmailTail\"></span></div>', '1767158841@qq.com', '幸运商城-注册认证', '1767158841@qq.com', '发送成功', '{\"errorCode\":true,\"error\":\"\\u53d1\\u9001\\u6210\\u529f\"}', '1506081011');
INSERT INTO `lucky_mail_log` VALUES ('11', '<div><span class=\"genEmailNicker\"></span><br><span class=\"genEmailContent\"><br>尊敬的用户 ：<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 您好！恭喜您注册成为幸运商城。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 这是一封注册认证邮件，请点击以下链接确认：<br>&nbsp;&nbsp; &nbsp; &nbsp; <a href=\"http://www.cjphp.com/restrict/index/mailprove.html?checkcode=0c7dDp0m4hWYp1x0PDMSvtxcN4nKnDbKgT280bkCiJJqw%2FIsSdnRlA1uptssBrODo8pShwk%2BjMq7F6e04rAywQPAwfbYhkGJZtz64RPyRIP2\" target=\"_blank\">http://www.cjphp.com/restrict/index/mailprove.html?checkcode=0c7dDp0m4hWYp1x0PDMSvtxcN4nKnDbKgT280bkCiJJqw%2FIsSdnRlA1uptssBrODo8pShwk%2BjMq7F6e04rAywQPAwfbYhkGJZtz64RPyRIP2</a> <br><br>&nbsp;&nbsp; &nbsp; &nbsp; 如果链接不能点击，请复制地址到浏览器，然后直接打开。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 上述链接48小时内有效。如果激活链接失效，请您登录网站<a target=\"_blank\" href=\"http://www.cjphp.com\"> http://www.cjphp.com</a>重新申请认证。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 感谢您注册%s！<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 幸运商城项目组<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\">幸运商城</span></span><br><span class=\"genEmailTail\"></span></div>', '1767158841@qq.com', '幸运商城-注册认证', '1767158841@qq.com', '发送成功', '{\"errorCode\":true,\"error\":\"\\u53d1\\u9001\\u6210\\u529f\"}', '1506081270');
INSERT INTO `lucky_mail_log` VALUES ('12', '<div><span class=\"genEmailNicker\"></span><br><span class=\"genEmailContent\"><br>尊敬的用户 ：<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 您好！恭喜您注册成为幸运商城。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 这是一封注册认证邮件，请点击以下链接确认：<br>&nbsp;&nbsp; &nbsp; &nbsp; <a href=\"http://www.cjphp.com/restrict/index/mailprove.html?checkcode=1e7dY1KT22dR8%2FaxJOojia0QDpjZ9mm%2FR%2Fi5gwoNM2mPThs1O9GV5Tgxi9s6O2R142Tiur22BDQdDN1O2DAuf7mxPDnSu1Bwe0cRObwBAQtH\" target=\"_blank\">http://www.cjphp.com/restrict/index/mailprove.html?checkcode=1e7dY1KT22dR8%2FaxJOojia0QDpjZ9mm%2FR%2Fi5gwoNM2mPThs1O9GV5Tgxi9s6O2R142Tiur22BDQdDN1O2DAuf7mxPDnSu1Bwe0cRObwBAQtH</a> <br><br>&nbsp;&nbsp; &nbsp; &nbsp; 如果链接不能点击，请复制地址到浏览器，然后直接打开。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 上述链接48小时内有效。如果激活链接失效，请您登录网站<a target=\"_blank\" href=\"http://www.cjphp.com\"> http://www.cjphp.com</a>重新申请认证。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 感谢您注册%s！<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 幸运商城项目组<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\">幸运商城</span></span><br><span class=\"genEmailTail\"></span></div>', '1767158841@qq.com', '幸运商城-注册认证', '1767158841@qq.com', '发送成功', '{\"errorCode\":true,\"error\":\"\\u53d1\\u9001\\u6210\\u529f\"}', '1506081383');
INSERT INTO `lucky_mail_log` VALUES ('13', '<div><span class=\"genEmailNicker\"></span><br><span class=\"genEmailContent\"><br>尊敬的用户 ：<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 您好！恭喜您注册成为幸运商城。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 这是一封注册认证邮件，请点击以下链接确认：<br>&nbsp;&nbsp; &nbsp; &nbsp; <a href=\"http://www.cjphp.com/restrict/index/mailprove.html?checkcode=a9edV2zwFkb2%2FzWonMwUvMZyB3M%2F112zfAeiwEFw7oMff%2Bnlc%2B7PxOhcYCpESlABetZJRb3Lr8uan5DteGVbtE1Ady7bpDdkmOlmHo6hpmFT\" target=\"_blank\">http://www.cjphp.com/restrict/index/mailprove.html?checkcode=a9edV2zwFkb2%2FzWonMwUvMZyB3M%2F112zfAeiwEFw7oMff%2Bnlc%2B7PxOhcYCpESlABetZJRb3Lr8uan5DteGVbtE1Ady7bpDdkmOlmHo6hpmFT</a> <br><br>&nbsp;&nbsp; &nbsp; &nbsp; 如果链接不能点击，请复制地址到浏览器，然后直接打开。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 上述链接48小时内有效。如果激活链接失效，请您登录网站<a target=\"_blank\" href=\"http://www.cjphp.com\"> http://www.cjphp.com</a>重新申请认证。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 感谢您注册%s！<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 幸运商城项目组<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\">幸运商城</span></span><br><span class=\"genEmailTail\"></span></div>', '1767158841@qq.com', '幸运商城-注册认证', '1767158841@qq.com', '发送成功', '{\"errorCode\":true,\"error\":\"\\u53d1\\u9001\\u6210\\u529f\"}', '1506081568');
INSERT INTO `lucky_mail_log` VALUES ('14', '<div><span class=\"genEmailNicker\"></span><br><span class=\"genEmailContent\"><br>尊敬的用户 ：<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 您好！恭喜您注册成为幸运商城。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 这是一封注册认证邮件，请点击以下链接确认：<br>&nbsp;&nbsp; &nbsp; &nbsp; <a href=\"http://www.cjphp.com/restrict/index/mailprove.html?checkcode=af2f4YWXntk54k88iVPUPG42sKCUZXpwfhkRc1OxlkiiZcMPmd5L7n7de%2B15CX%2F1xqC9xSCzmOVTeEK8lt5zEpdRXnk0qNy8q65AmlBlIw4n\" target=\"_blank\">http://www.cjphp.com/restrict/index/mailprove.html?checkcode=af2f4YWXntk54k88iVPUPG42sKCUZXpwfhkRc1OxlkiiZcMPmd5L7n7de%2B15CX%2F1xqC9xSCzmOVTeEK8lt5zEpdRXnk0qNy8q65AmlBlIw4n</a> <br><br>&nbsp;&nbsp; &nbsp; &nbsp; 如果链接不能点击，请复制地址到浏览器，然后直接打开。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 上述链接48小时内有效。如果激活链接失效，请您登录网站<a target=\"_blank\" href=\"http://www.cjphp.com\"> http://www.cjphp.com</a>重新申请认证。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 感谢您注册%s！<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 幸运商城项目组<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\">幸运商城</span></span><br><span class=\"genEmailTail\"></span></div>', '1767158841@qq.com', '幸运商城-注册认证', '1767158841@qq.com', '发送成功', '{\"errorCode\":true,\"error\":\"\\u53d1\\u9001\\u6210\\u529f\"}', '1506083250');
INSERT INTO `lucky_mail_log` VALUES ('15', '<div><span class=\"genEmailNicker\"></span><br><span class=\"genEmailContent\"><br>尊敬的用户 ：<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 您好！恭喜您注册成为幸运商城。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 这是一封注册认证邮件，请点击以下链接确认：<br>&nbsp;&nbsp; &nbsp; &nbsp; <a href=\"http://www.cjphp.com/restrict/index/mailprove.html?checkcode=43f2FabeUhe255rc8Fyj2l45M%2B1b3v5o3lX4MWpbjR0%2FtApnHaKDEgEGUbxGxEHr0cVVIfresJGx4nR1RRmPUatU2y%2B%2B7VMiwe0RfHJZ1F39\" target=\"_blank\">http://www.cjphp.com/restrict/index/mailprove.html?checkcode=43f2FabeUhe255rc8Fyj2l45M%2B1b3v5o3lX4MWpbjR0%2FtApnHaKDEgEGUbxGxEHr0cVVIfresJGx4nR1RRmPUatU2y%2B%2B7VMiwe0RfHJZ1F39</a> <br><br>&nbsp;&nbsp; &nbsp; &nbsp; 如果链接不能点击，请复制地址到浏览器，然后直接打开。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 上述链接48小时内有效。如果激活链接失效，请您登录网站<a target=\"_blank\" href=\"http://www.cjphp.com\"> http://www.cjphp.com</a>重新申请认证。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 感谢您注册%s！<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 幸运商城项目组<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\">幸运商城</span></span><br><span class=\"genEmailTail\"></span></div>', '1767158841@qq.com', '幸运商城-注册认证', '1767158841@qq.com', '发送成功', '{\"errorCode\":true,\"error\":\"\\u53d1\\u9001\\u6210\\u529f\"}', '1506084194');
INSERT INTO `lucky_mail_log` VALUES ('16', '邮件内容很隐秘哦', '1767158841@qq.com', '测试邮件', '', '发送成功', '{\"errorCode\":true,\"error\":\"\\u53d1\\u9001\\u6210\\u529f\"}', '1506230055');
INSERT INTO `lucky_mail_log` VALUES ('17', '邮件内容很隐秘哦', '1767158841@qq.com', '测试邮件', '', '发送成功', '{\"errorCode\":true,\"error\":\"\\u53d1\\u9001\\u6210\\u529f\"}', '1506230129');
INSERT INTO `lucky_mail_log` VALUES ('18', '邮件内容很隐秘哦', '1767158841@qq.com', '测试邮件', '', '发送成功', '{\"errorCode\":true,\"error\":\"\\u53d1\\u9001\\u6210\\u529f\"}', '1506233330');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_sms_log
-- ----------------------------
INSERT INTO `lucky_sms_log` VALUES ('1', 'sms0549997984', '{\"code\":\"27501\",\"product\":\"\"}', 'SMS_73920020', '小惠猫', '15879221657', 'OK', 'OK', '{\"Message\":\"OK\",\"RequestId\":\"585D38B5-FD46-4EBE-8E00-6ACFFBA5E558\",\"BizId\":\"767118705905522389^0\",\"Code\":\"OK\"}', '1505905499');
INSERT INTO `lucky_sms_log` VALUES ('2', 'sms0573822586', '{\"code\":\"66887\",\"product\":\"\"}', 'SMS_73920020', '小惠猫', '15879221657', 'OK', 'OK', '{\"Message\":\"OK\",\"RequestId\":\"35A32339-9B77-462D-843D-DC0725DE13EC\",\"BizId\":\"154710905905761659^0\",\"Code\":\"OK\"}', '1505905738');
INSERT INTO `lucky_sms_log` VALUES ('3', 'sms0573953575', '{\"code\":\"41880\",\"product\":\"\"}', 'SMS_73920020', '小惠猫', '15879221657', '触发分钟级流控Permits:1', 'isv.BUSINESS_LIMIT_C', '{\"Message\":\"\\u89e6\\u53d1\\u5206\\u949f\\u7ea7\\u6d41\\u63a7Permits:1\",\"RequestId\":\"182046D2-1D3E-45EC-83EB-07B7ABAE09A3\",\"Code\":\"isv.BUSINESS_LIMIT_CONTROL\"}', '1505905739');
INSERT INTO `lucky_sms_log` VALUES ('4', 'sms0596160498', '{\"code\":\"64122\",\"product\":\"\"}', 'SMS_73920020', '小惠猫', '15879221657', 'OK', 'OK', '{\"Message\":\"OK\",\"RequestId\":\"B6E0B20E-59D2-4097-952B-DFF10D03E39D\",\"BizId\":\"981205405905985078^0\",\"Code\":\"OK\"}', '1505905962');
INSERT INTO `lucky_sms_log` VALUES ('5', 'sms0615186057', '{\"code\":\"73857\",\"product\":\"\"}', 'SMS_73920020', '小惠猫', '15879221657', 'OK', 'OK', '{\"Message\":\"OK\",\"RequestId\":\"F41E8F55-4E94-4645-B236-C8C195A6F6B9\",\"BizId\":\"910018705906174780^0\",\"Code\":\"OK\"}', '1505906151');
INSERT INTO `lucky_sms_log` VALUES ('6', 'sms8820989342', '{\"code\":\"18164\",\"product\":\"\"}', 'SMS_73920020', '小惠猫', '15879221657', 'OK', 'OK', '{\"Message\":\"OK\",\"RequestId\":\"BB77BD6A-4143-42A7-BFE7-494B349A2B18\",\"BizId\":\"963922906088235164^0\",\"Code\":\"OK\"}', '1506088209');
INSERT INTO `lucky_sms_log` VALUES ('7', 'sms8935957897', '{\"code\":\"48063\",\"product\":\"\"}', 'SMS_73920020', '小惠猫', '15879221657', 'OK', 'OK', '{\"Message\":\"OK\",\"RequestId\":\"93C5AF7A-2B5D-46DC-9397-1AEEA0DE356F\",\"BizId\":\"286411906089384988^0\",\"Code\":\"OK\"}', '1506089359');
INSERT INTO `lucky_sms_log` VALUES ('8', 'sms8953146091', '{\"code\":\"09472\",\"product\":\"\"}', 'SMS_73920020', '小惠猫', '15879221657', 'OK', 'OK', '{\"Message\":\"OK\",\"RequestId\":\"BFB4EA62-D5FD-41E8-A568-67666C67A7CB\",\"BizId\":\"227819006089556673^0\",\"Code\":\"OK\"}', '1506089531');
INSERT INTO `lucky_sms_log` VALUES ('9', 'sms8984973073', '{\"code\":\"71184\",\"product\":\"\"}', 'SMS_73920020', '小惠猫', '15879221657', 'OK', 'OK', '{\"Message\":\"OK\",\"RequestId\":\"07972E30-716E-451B-98E3-DD0A143D8C03\",\"BizId\":\"352723706089875054^0\",\"Code\":\"OK\"}', '1506089849');
INSERT INTO `lucky_sms_log` VALUES ('10', 'sms9179036855', '{\"code\":\"31038\",\"product\":\"\"}', 'SMS_73920020', '小惠猫', '15879221657', 'OK', 'OK', '{\"Message\":\"OK\",\"RequestId\":\"9B1A43CA-65EB-4112-8D39-E0FE62E8048A\",\"BizId\":\"573302506091816152^0\",\"Code\":\"OK\"}', '1506091790');

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
-- Records of lucky_sms_temp
-- ----------------------------
INSERT INTO `lucky_sms_temp` VALUES ('14', 'SMS_73920020', '小惠猫', '验证码${code}，您正在注册成为${product}用户，感谢您的支持！', 'code,product', '当用户注册时使用该模板', 'scene_reg');

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
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为管理员，1为是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_users
-- ----------------------------
INSERT INTO `lucky_users` VALUES ('17', '', '', '', '', '1767158841@qq.com', '', 'e10adc3949ba59abbe56e057f20f883e', '0', '1506084193', '127.0.0.1', '0', '', '0', '1', '1', '1');
INSERT INTO `lucky_users` VALUES ('18', '', '', '', '15879221657', '', '', 'e10adc3949ba59abbe56e057f20f883e', '0', '1506092599', '127.0.0.1', '0', '', '0', '1', '0', '1');
INSERT INTO `lucky_users` VALUES ('19', '', '123a', '', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', '0', '1506094075', '127.0.0.1', '0', '', '0', '1', '0', '0');

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

-- ----------------------------
-- Records of lucky_user_access
-- ----------------------------
INSERT INTO `lucky_user_access` VALUES ('0', '1');
