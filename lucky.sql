/*
Navicat MySQL Data Transfer

Source Server         : lucky
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : lucky

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-05-24 15:41:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lucky_action
-- ----------------------------
DROP TABLE IF EXISTS `lucky_action`;
CREATE TABLE `lucky_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '功能id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `controller` char(20) NOT NULL DEFAULT '' COMMENT '控制器',
  `model` varchar(255) NOT NULL DEFAULT '' COMMENT '模块',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '功能',
  `params` varchar(255) NOT NULL DEFAULT '' COMMENT '参数格式  key/value',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '功能标题',
  `icon` varchar(255) NOT NULL COMMENT '图标代码',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '功能备注',
  `log_rules` varchar(255) NOT NULL COMMENT '日志规则',
  `validation_rules` varchar(255) NOT NULL DEFAULT '' COMMENT '验证规则',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示，默认否0',
  `is_api` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为api，默认否0',
  `is_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要登录，默认是1',
  `is_nose` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否前端功能，默认否0',
  `weight` int(11) unsigned NOT NULL COMMENT '排序',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最新更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of lucky_action
-- ----------------------------
INSERT INTO `lucky_action` VALUES ('1', '0', '', '', '', '', '系统设置', 'fa fa-rocket', '', '', '', '1', '0', '1', '0', '2', '1519796104', '1517487183');
INSERT INTO `lucky_action` VALUES ('2', '1', 'admin', 'index', 'table', '', '配送方式', '', '设置配送方式', '', '', '1', '0', '1', '0', '0', '1517628288', '1517487183');
INSERT INTO `lucky_action` VALUES ('3', '1', 'admin', 'system', 'index', '', '商城设置', '', '设置商城中的各项功能', '', '', '1', '0', '1', '0', '3', '1519796169', '1517542742');
INSERT INTO `lucky_action` VALUES ('4', '1', 'admin', 'index', 'index', '', '计划任务', '', '', '', '', '1', '0', '1', '0', '0', '1517628354', '1517628354');
INSERT INTO `lucky_action` VALUES ('5', '1', 'admin', 'index', 'index', '', '友情链接', '', '', '', '', '1', '0', '1', '0', '0', '1517628386', '1517628386');
INSERT INTO `lucky_action` VALUES ('6', '1', 'admin', 'system', 'listing', 'action/nav', '自定义导航栏', '', '', '', '', '1', '0', '1', '0', '0', '1517628464', '1517628433');
INSERT INTO `lucky_action` VALUES ('7', '1', 'admin', 'ad', 'index', '', '广告管理', '', '', '', '', '1', '0', '1', '0', '0', '1517628530', '1517628530');
INSERT INTO `lucky_action` VALUES ('8', '31', 'admin', 'system', 'listing', 'action/action', '功能设置', '', '', '', '', '1', '0', '1', '0', '0', '1517991284', '1517628769');
INSERT INTO `lucky_action` VALUES ('9', '1', 'admin', 'system', 'clear_cache', '', '清除缓存', '', '', '', '', '1', '0', '1', '0', '0', '1517629431', '1517629431');
INSERT INTO `lucky_action` VALUES ('10', '0', 'admin', 'goods', 'index', '', '商品管理', 'gi gi-airplane', '', '', '', '1', '0', '1', '0', '0', '1519718738', '1517629576');
INSERT INTO `lucky_action` VALUES ('11', '10', 'admin', 'goods', 'listing', 'action/category', '商品分类', '', '', '', '', '1', '0', '1', '0', '0', '1517629727', '1517629713');
INSERT INTO `lucky_action` VALUES ('12', '10', 'admin', 'goods', 'listing', 'action/brand', '品牌列表', '', '', '', '', '1', '0', '1', '0', '0', '1517629950', '1517629938');
INSERT INTO `lucky_action` VALUES ('13', '10', 'admin', 'goods', 'listing', 'action/goods', '商品列表', '', '', '', '', '1', '0', '1', '0', '0', '1517629990', '1517629990');
INSERT INTO `lucky_action` VALUES ('14', '10', 'admin', 'goods', 'stock_list', '', '库存日志', '', '', '', '', '1', '0', '1', '0', '0', '1517630060', '1517630041');
INSERT INTO `lucky_action` VALUES ('15', '10', 'admin', 'comment', 'index', '', '用户评论', '', '', '', '', '1', '0', '1', '0', '0', '1517630105', '1517630105');
INSERT INTO `lucky_action` VALUES ('16', '10', 'admin', 'comment', 'asc_list', '', '产品咨询', '', '', '', '', '1', '0', '1', '0', '0', '1517630172', '1517630172');
INSERT INTO `lucky_action` VALUES ('17', '0', 'admin', 'orders', 'index', '', '订单管理', 'gi gi-airplane', '', '', '', '1', '0', '1', '0', '0', '1519718763', '1517630222');
INSERT INTO `lucky_action` VALUES ('18', '17', 'admin', 'orders', 'listing', 'action/orders', '订单列表', '', '', '', '', '1', '0', '1', '0', '0', '1517630269', '1517630269');
INSERT INTO `lucky_action` VALUES ('19', '17', 'admin', 'index', 'index', '', '退款、退货、换货', '', '', '', '', '1', '0', '1', '0', '0', '1517630383', '1517630383');
INSERT INTO `lucky_action` VALUES ('20', '17', 'admin', 'orders', 'logs', '', '订单日志', '', '', '', '', '1', '0', '1', '0', '0', '1517630413', '1517630413');
INSERT INTO `lucky_action` VALUES ('21', '0', 'admin', 'index', 'index', '', '促销管理', 'gi gi-airplane', '', '', '', '1', '0', '1', '0', '0', '1519718792', '1517630529');
INSERT INTO `lucky_action` VALUES ('22', '21', 'admin', 'index', 'index', '', '抢购管理', '', '', '', '', '1', '0', '1', '0', '0', '1517630685', '1517630685');
INSERT INTO `lucky_action` VALUES ('23', '21', 'admin', 'index', 'index', '', '团购管理', '', '', '', '', '1', '0', '1', '0', '0', '1517630710', '1517630710');
INSERT INTO `lucky_action` VALUES ('24', '21', 'admin', 'index', 'index', '', '优惠管理', '', '', '', '', '1', '0', '1', '0', '0', '1517630753', '1517630753');
INSERT INTO `lucky_action` VALUES ('25', '21', 'admin', 'index', 'index', '', '订单促销', '', '', '', '', '1', '0', '1', '0', '0', '1517630811', '1517630811');
INSERT INTO `lucky_action` VALUES ('26', '21', 'admin', 'index', 'index', '', '拼团管理', '', '', '', '', '1', '0', '1', '0', '0', '1517630843', '1517630843');
INSERT INTO `lucky_action` VALUES ('27', '0', 'admin', 'users', 'index', '', '会员管理', 'gi gi-airplane', '', '', '', '1', '0', '1', '0', '0', '1519718806', '1517630921');
INSERT INTO `lucky_action` VALUES ('28', '27', 'admin', 'users', 'listing', 'action/userinfo', '会员列表', '', '', '', '', '1', '0', '1', '0', '0', '1520145576', '1517632128');
INSERT INTO `lucky_action` VALUES ('29', '27', 'admin', 'users', 'index', '', '充值列表', '', '', '', '', '1', '0', '1', '0', '0', '1517632177', '1517632177');
INSERT INTO `lucky_action` VALUES ('30', '27', 'admin', 'users', 'index', '', '会员等级设置', '', '', '', '', '1', '0', '1', '0', '0', '1517633506', '1517633506');
INSERT INTO `lucky_action` VALUES ('31', '0', 'admin', 'index', 'index', '', '权限管理', 'gi gi-airplane', '', '', '', '1', '0', '1', '0', '1', '1519962369', '1517633635');
INSERT INTO `lucky_action` VALUES ('32', '31', 'admin', 'auth', 'listing', 'action/admin', '管理员管理', '', '', '', '', '1', '0', '1', '0', '0', '1518345724', '1517633691');
INSERT INTO `lucky_action` VALUES ('33', '31', 'admin', 'auth', 'listing', 'action/roles', '角色管理', '', '', '', '', '1', '0', '1', '0', '0', '1517898057', '1517633747');
INSERT INTO `lucky_action` VALUES ('34', '0', 'admin', 'index', 'home', '', '概览', 'gi gi-compass', '', '', '', '1', '0', '1', '0', '30', '1527044696', '1517634080');
INSERT INTO `lucky_action` VALUES ('35', '31', 'admin', 'auth', 'listing', 'action/roleGroup', '角色组', '', '', '', '', '1', '0', '1', '0', '0', '1517895153', '1517895153');
INSERT INTO `lucky_action` VALUES ('36', '43', 'restrict', 'index', 'index', '', '用户登陆', '', '用户登陆的视图', '', '', '0', '0', '0', '1', '0', '1518418447', '1518329027');
INSERT INTO `lucky_action` VALUES ('37', '43', 'restrict', 'index', 'register', '', '用户注册', '', '用户注册显示视图', '', '', '0', '0', '0', '1', '0', '1518418460', '1518329795');
INSERT INTO `lucky_action` VALUES ('38', '36', 'restrict', 'index', 'checkcode', '', '验证图形验证码', '', '注册登录时严恒图形验证码是否正确', '', '', '0', '0', '0', '1', '0', '1518417403', '1518417403');
INSERT INTO `lucky_action` VALUES ('39', '37', 'restrict', 'index', 'create', '', '创建用户', '', '用户注册提交', '', '', '0', '0', '0', '1', '0', '1518417604', '1518417604');
INSERT INTO `lucky_action` VALUES ('40', '37', 'restrict', 'index', 'mailprove', '', '邮箱验证', '', '邮箱注册，验证邮箱', '', '', '0', '0', '0', '1', '0', '1518417687', '1518417687');
INSERT INTO `lucky_action` VALUES ('41', '36', 'restrict', 'index', 'sign', '', '用户登陆操作', '', '用户登陆信息提交', '', '', '0', '0', '0', '1', '0', '1518417769', '1518417769');
INSERT INTO `lucky_action` VALUES ('42', '43', 'restrict', 'sendsms', 'index', '', '短信发送', '', '提交发送短信', '', '', '0', '0', '0', '1', '0', '1518418436', '1518417913');
INSERT INTO `lucky_action` VALUES ('43', '0', '', '', '', '', '用户登陆注册', '', '用户的登陆注册可不选制作集合组', '', '', '0', '0', '0', '1', '0', '1518418052', '1518418052');
INSERT INTO `lucky_action` VALUES ('44', '0', 'index', 'index', 'index', '', '首页', '', '网站首页展示', '', '', '0', '0', '0', '1', '99', '1518424647', '1518423065');
INSERT INTO `lucky_action` VALUES ('45', '8', 'admin', 'system', 'edit_view', 'action/action', '功能编辑视图', '', '', '', '', '0', '0', '1', '0', '0', '1518423804', '1518423804');
INSERT INTO `lucky_action` VALUES ('46', '0', 'index', 'goods', 'details', '', '商品详情', '', '商品详情页', '', '', '0', '0', '0', '1', '0', '1518424536', '1518424536');
INSERT INTO `lucky_action` VALUES ('47', '8', 'admin', 'system', 'edit', 'action/action', '功能编辑操作', '', '功能编辑操作', '', '', '0', '0', '1', '0', '0', '1519482550', '1519482550');
INSERT INTO `lucky_action` VALUES ('48', '35', 'admin', 'auth', 'edit_view', 'action/roleGroup', '角色分组编辑视图', '', '角色分组视图展示', '', '', '0', '0', '1', '0', '0', '1519485086', '1519485086');
INSERT INTO `lucky_action` VALUES ('49', '33', 'admin', 'auth', 'grant', '', '赋予权限视图', '', '赋予权限视图', '', '', '0', '0', '1', '0', '0', '1519545895', '1519545895');
INSERT INTO `lucky_action` VALUES ('50', '33', 'admin', 'auth', 'edit', 'action/roles', '角色编辑操作', '', '以及配置赋予权限操作', '', '', '0', '0', '1', '0', '0', '1519795421', '1519546027');
INSERT INTO `lucky_action` VALUES ('51', '35', 'admin', 'auth', 'edit', 'action/roleGroup', '角色组编辑操作', '', '角色组编辑操作', '', '', '0', '0', '1', '0', '0', '1519546201', '1519546201');
INSERT INTO `lucky_action` VALUES ('52', '3', 'admin', 'system', 'index', 'config/basic', '商城基本配置', '', '商城基本配置', '', '', '0', '0', '1', '0', '0', '1519547220', '1519547220');
INSERT INTO `lucky_action` VALUES ('53', '3', 'admin', 'system', 'index', 'config/mall', '商城信息', '', '商城信息配置', '', '', '0', '0', '1', '0', '0', '1519549682', '1519549682');
INSERT INTO `lucky_action` VALUES ('54', '3', 'admin', 'system', 'index', 'config/trade', '购物流程', '', '商品购物流程的配置', '', '', '0', '0', '1', '0', '0', '1519549682', '1519549682');
INSERT INTO `lucky_action` VALUES ('55', '3', 'admin', 'system', 'index', 'config/wechat', '微信配置', '', '配置微信公众号对象信息', '', '', '0', '0', '1', '0', '0', '1519549682', '1519549682');
INSERT INTO `lucky_action` VALUES ('56', '3', 'admin', 'system', 'index', 'config/payment', '支付配置', '', '配置支付信息参数', '', '', '0', '0', '1', '0', '0', '1519549682', '1519549682');
INSERT INTO `lucky_action` VALUES ('57', '3', 'admin', 'system', 'index', 'config/sms', '短信配置', '', '配置短信参数', '', '', '0', '0', '1', '0', '0', '1519549682', '1519549682');
INSERT INTO `lucky_action` VALUES ('58', '3', 'admin', 'system', 'index', 'config/watermark', '水印配置', '', '配置水印位置等参数', '', '', '0', '0', '1', '0', '0', '1519549682', '1519549682');
INSERT INTO `lucky_action` VALUES ('59', '3', 'admin', 'system', 'index', 'config/push', '推送配置', '', '推送参数配置', '', '', '0', '0', '1', '0', '0', '1519549682', '1519549682');
INSERT INTO `lucky_action` VALUES ('60', '3', 'admin', 'system', 'index', 'config/email', '邮件配置', '', '邮件参数配置', '', '', '0', '0', '1', '0', '0', '1519549682', '1519549682');
INSERT INTO `lucky_action` VALUES ('61', '3', 'admin', 'system', 'edit', 'action/config', '配置提交操作', '', '配置提交操作', '', '', '0', '0', '1', '0', '0', '1519550661', '1519482550');
INSERT INTO `lucky_action` VALUES ('62', '32', 'admin', 'auth', 'edit_view', 'action/admin', '管理员编辑视图', '', '', '', '', '0', '0', '1', '0', '0', '1519795136', '1519795136');
INSERT INTO `lucky_action` VALUES ('63', '33', 'admin', 'auth', 'edit_view', 'action/roles', '角色编辑视图', '', '', '', '', '0', '0', '1', '0', '0', '1519795311', '1519795311');
INSERT INTO `lucky_action` VALUES ('64', '33', 'admin', 'auth', 'roles', '', '组下角色', '', '获取角色组下所有角色', '', '', '0', '1', '1', '0', '0', '1519795817', '1519795817');
INSERT INTO `lucky_action` VALUES ('65', '32', 'admin', 'auth', 'edit', 'action/admin', '管理员编辑操作', '', '', '', '', '0', '0', '1', '0', '0', '1519795914', '1519795914');
INSERT INTO `lucky_action` VALUES ('66', '11', 'admin', 'goods', 'edit_view', 'action/category', '修改分类视图', '', '修改分类视图', '', '', '0', '0', '1', '0', '0', '1519806840', '1519806840');
INSERT INTO `lucky_action` VALUES ('67', '11', 'admin', 'goods', 'edit', 'action/category', '分类编辑操作', '', '分类编辑操作修改等', '', '', '0', '0', '1', '0', '0', '1519807364', '1519807364');
INSERT INTO `lucky_action` VALUES ('68', '12', 'admin', 'goods', 'edit_view', 'action/brand', '品牌编辑视图', '', '', '', '', '0', '0', '1', '0', '0', '1519807555', '1519807555');
INSERT INTO `lucky_action` VALUES ('69', '12', 'admin', 'goods', 'edit', 'action/brand', '品牌编辑操作', '', '品牌编辑操作，修改', '', '', '0', '0', '1', '0', '0', '1519807654', '1519807654');
INSERT INTO `lucky_action` VALUES ('70', '13', 'admin', 'goods', 'edit_view', 'action/goods', '商品编辑视图', '', '商品编辑视图', '', '', '0', '0', '1', '0', '0', '1519807765', '1519807765');
INSERT INTO `lucky_action` VALUES ('71', '13', 'admin', 'goods', 'edit', 'action/goods', '商品编辑操作', '', '商品编辑操作修改', '', '', '0', '0', '1', '0', '0', '1519809173', '1519809173');
INSERT INTO `lucky_action` VALUES ('72', '70', 'admin', 'goods', 'ajax_brand', '', '异步品牌信息', '', '异步返回品牌数据', '', '', '0', '1', '1', '0', '0', '1519814617', '1519814617');
INSERT INTO `lucky_action` VALUES ('73', '70', 'admin', 'goods', 'ajax_logistics', '', '异步物流信息', '', '异步获取物流信息', '', '', '0', '1', '1', '0', '0', '1519814744', '1519814744');
INSERT INTO `lucky_action` VALUES ('74', '70', 'admin', 'goods', 'ajax_category', '', '异步获取分类信息', '', '异步获取分类信息详情', '', '', '0', '1', '1', '0', '0', '1519816050', '1519816050');
INSERT INTO `lucky_action` VALUES ('75', '70', 'admin', 'goods', 'ajax_spec', '', '异步获取商品规格', '', '异步获取商品规格信息', '', '', '0', '1', '1', '0', '0', '1519816536', '1519816536');
INSERT INTO `lucky_action` VALUES ('76', '46', 'index', 'goods', 'spec_group', '', '获取商品规格', '', '获取商品规格信息', '', '', '0', '1', '0', '1', '0', '1519986135', '1519986135');
INSERT INTO `lucky_action` VALUES ('77', '46', 'index', 'auction', 'buy_now', '', '直接购买商品', '', '用户选择商品直接购买', '', '', '0', '0', '1', '1', '0', '1519986791', '1519986791');
INSERT INTO `lucky_action` VALUES ('78', '0', 'index', 'member', 'index', '', '个人中心', '', '查看个人中心信息', '', '', '0', '0', '1', '1', '0', '1520152362', '1520152362');
INSERT INTO `lucky_action` VALUES ('79', '78', 'index', 'member', 'information', '', '个人信息', '', '查看个人信息', '', '', '0', '0', '1', '1', '0', '1520152667', '1520152667');
INSERT INTO `lucky_action` VALUES ('80', '78', 'index', 'member', 'safety', '', '安全设置', '', '', '', '', '0', '0', '1', '1', '0', '1520152711', '1520152711');
INSERT INTO `lucky_action` VALUES ('81', '78', 'index', 'member', 'address', '', '地址管理', '', '地址各项信息', '', '', '0', '0', '1', '1', '0', '1520152776', '1520152776');
INSERT INTO `lucky_action` VALUES ('82', '78', 'index', 'member', 'cardlist', '', '快捷支付', '', '查看快捷支付信息', '', '', '0', '0', '1', '1', '0', '1520152828', '1520152828');
INSERT INTO `lucky_action` VALUES ('83', '78', 'index', 'member', 'order', '', '订单管理', '', '查看订单列表信息', '', '', '0', '0', '1', '1', '0', '1520152888', '1520152888');
INSERT INTO `lucky_action` VALUES ('84', '78', 'index', 'member', 'change', '', '退款售后', '', '退款售后信息', '', '', '0', '0', '1', '1', '0', '1520152939', '1520152939');
INSERT INTO `lucky_action` VALUES ('85', '78', 'index', 'member', 'comment', '', '商品评价', '', '商品评价信息', '', '', '0', '0', '1', '1', '0', '1520152997', '1520152997');
INSERT INTO `lucky_action` VALUES ('86', '78', 'index', 'member', 'points', '', '我的积分', '', '', '', '', '0', '0', '1', '1', '0', '1520153044', '1520153044');
INSERT INTO `lucky_action` VALUES ('87', '78', 'index', 'member', 'coupon', '', '优惠券', '', '查看优惠券信息', '', '', '0', '0', '1', '1', '0', '1520153119', '1520153119');
INSERT INTO `lucky_action` VALUES ('88', '78', 'index', 'member', 'bonus', '', '红包', '', '红包', '', '', '0', '0', '1', '1', '0', '1520153162', '1520153162');
INSERT INTO `lucky_action` VALUES ('89', '78', 'index', 'member', 'walletlist', '', '账户余额', '', '账户余额查看', '', '', '0', '0', '1', '1', '0', '1520153216', '1520153216');
INSERT INTO `lucky_action` VALUES ('90', '78', 'index', 'member', 'bill', '', '账单明细', '', '账单明细', '', '', '0', '0', '1', '1', '0', '1520153275', '1520153275');
INSERT INTO `lucky_action` VALUES ('91', '78', 'index', 'member', 'collection', '', '我的收藏', '', '查看我的收藏详情', '', '', '0', '0', '1', '1', '0', '1520153333', '1520153333');
INSERT INTO `lucky_action` VALUES ('92', '78', 'index', 'member', 'foot', '', '足迹', '', '足迹（查看记录）', '', '', '0', '0', '1', '1', '0', '1520153385', '1520153385');
INSERT INTO `lucky_action` VALUES ('93', '78', 'index', 'member', 'consultation', '', '商品咨询', '', '商品咨询', '', '', '0', '0', '1', '1', '0', '1520153466', '1520153466');
INSERT INTO `lucky_action` VALUES ('94', '78', 'index', 'member', 'suggest', '', '意见反馈', '', '查看意见反馈', '', '', '0', '0', '1', '1', '0', '1520153511', '1520153511');
INSERT INTO `lucky_action` VALUES ('95', '78', 'index', 'member', 'news', '', '我的消息', '', '查看我的消息', '', '', '0', '0', '1', '1', '0', '1520153552', '1520153552');
INSERT INTO `lucky_action` VALUES ('96', '78', 'index', 'member', 'wallet', '', '账户余额', '', '账户余额查看', '', '', '0', '0', '1', '1', '0', '1520156966', '1520156966');
INSERT INTO `lucky_action` VALUES ('97', '78', 'index', 'member', 'pointnew', '', '我的积分', '', '我的积分', '', '', '0', '0', '1', '1', '0', '1520157284', '1520157284');
INSERT INTO `lucky_action` VALUES ('98', '78', 'index', 'member', 'password', '', '修改密码', '', '', '', '', '0', '0', '1', '1', '0', '1520222535', '1520222535');
INSERT INTO `lucky_action` VALUES ('99', '78', 'index', 'member', 'setpay', '', '设置支付密码', '', '', '', '', '0', '0', '1', '1', '0', '1520222586', '1520222586');
INSERT INTO `lucky_action` VALUES ('100', '78', 'index', 'member', 'bindphone', '', '绑定手机号码', '', '', '', '', '0', '0', '1', '1', '0', '1520222702', '1520222702');
INSERT INTO `lucky_action` VALUES ('101', '78', 'index', 'member', 'email', '', '绑定邮箱', '', '绑定邮箱', '', '', '0', '0', '1', '1', '0', '1520749616', '1520222792');
INSERT INTO `lucky_action` VALUES ('102', '78', 'index', 'member', 'idcard', '', '实名认证', '', '', '', '', '0', '0', '1', '1', '0', '1520222839', '1520222839');
INSERT INTO `lucky_action` VALUES ('103', '78', 'index', 'member', 'question', '', '安全问题', '', '', '', '', '0', '0', '1', '1', '0', '1520222872', '1520222872');
INSERT INTO `lucky_action` VALUES ('104', '78', 'index', 'member', 'cardmethod', '', '添加银行卡', '', '', '', '', '0', '0', '1', '1', '0', '1520237908', '1520237908');
INSERT INTO `lucky_action` VALUES ('105', '78', 'index', 'member', 'orderinfo', '', '订单详情', '', '', '', '', '0', '0', '1', '1', '0', '1520238237', '1520238237');
INSERT INTO `lucky_action` VALUES ('106', '78', 'index', 'member', 'logistics', '', '物流详情', '', '', '', '', '0', '0', '1', '1', '0', '1520238415', '1520238415');
INSERT INTO `lucky_action` VALUES ('107', '78', 'index', 'member', 'record', '', '钱款去向', '', '', '', '', '0', '0', '1', '1', '0', '1520238607', '1520238607');
INSERT INTO `lucky_action` VALUES ('108', '78', 'index', 'member', 'refund', '', '退换货', '', '', '', '', '0', '0', '1', '1', '0', '1520238959', '1520238959');
INSERT INTO `lucky_action` VALUES ('109', '78', 'index', 'member', 'billlist', '', '查看支出明细', '', '', '', '', '0', '0', '1', '1', '0', '1520239578', '1520239578');
INSERT INTO `lucky_action` VALUES ('110', '78', 'index', 'member', 'commentlist', '', '评论商品', '', '', '', '', '0', '0', '1', '1', '0', '1520240372', '1520240372');
INSERT INTO `lucky_action` VALUES ('111', '78', 'index', 'member', 'blog', '', '消息详情', '', '', '', '', '0', '0', '1', '1', '0', '1520477733', '1520477733');
INSERT INTO `lucky_action` VALUES ('112', '0', 'admin', 'test', 'index', '', '测试首页', '', '测试功能', '', '', '0', '0', '0', '0', '0', '1526957890', '1526957890');
INSERT INTO `lucky_action` VALUES ('113', '0', '', '', '', '', '上传文件', '', '', '', '', '0', '1', '1', '1', '0', '1527140434', '1527140231');
INSERT INTO `lucky_action` VALUES ('114', '113', 'api', 'upload', 'index', '', '文件上传操作', '', '', '', '', '0', '1', '1', '1', '0', '1527140550', '1527140550');
INSERT INTO `lucky_action` VALUES ('115', '57', 'admin', 'system', 'sms_log', '', '短信发送日志', '', '', '', '', '0', '0', '1', '0', '0', '1527146572', '1527146572');
INSERT INTO `lucky_action` VALUES ('116', '0', 'admin', 'system', 'mail_log', '', '邮件发送日志', '', '', '', '', '0', '0', '1', '0', '0', '1527146664', '1527146664');

-- ----------------------------
-- Table structure for lucky_ad
-- ----------------------------
DROP TABLE IF EXISTS `lucky_ad`;
CREATE TABLE `lucky_ad` (
  `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告表',
  `position` mediumint(6) unsigned NOT NULL DEFAULT '0' COMMENT '广告位置',
  `url` varchar(255) NOT NULL COMMENT '广告链接',
  `img_url` varchar(255) NOT NULL COMMENT '广告图片',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_title` varchar(255) NOT NULL COMMENT '广告标题',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `background` char(20) NOT NULL COMMENT '背景颜色',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示',
  `weight` int(11) NOT NULL DEFAULT '50' COMMENT '广告位置',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加广告时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_ad
-- ----------------------------
INSERT INTO `lucky_ad` VALUES ('1', '1', 'http://www.cjphp.com', '/upload/admin/image/20171006/1507276581131681.jpg', '测试', '以肉换肉，节后甩肉', '1507276497', '1601538908', '#ff9801', '1', '0', '1507340506');
INSERT INTO `lucky_ad` VALUES ('2', '1', 'http://www.cjphp.com', '/upload/admin/image/20171007/1507339085846435.jpg', '由内而外爱自己', '由内而外爱自己，买二付一分享闺蜜', '1507339050', '1569892653', '#55be59', '1', '50', '1507340547');
INSERT INTO `lucky_ad` VALUES ('3', '1', 'http://www.cjphp.com', '/upload/admin/image/20171007/1507339319286806.jpg', '吃货联盟', '吃货联盟 3.8折起', '1507339290', '1601515291', '#f44661', '1', '0', '1507340585');
INSERT INTO `lucky_ad` VALUES ('4', '1', 'http://www.cjphp.com', '/upload/admin/image/20171007/1507339424140769.jpg', '鲜货直达', '鲜货直达 满119减15', '1507339397', '1509413000', '#0f1024', '1', '0', '1507340617');

-- ----------------------------
-- Table structure for lucky_address
-- ----------------------------
DROP TABLE IF EXISTS `lucky_address`;
CREATE TABLE `lucky_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户收货地址',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `full_name` varchar(50) NOT NULL COMMENT '收件人姓名',
  `mobile` varchar(50) NOT NULL COMMENT '手机号码',
  `province` mediumint(5) unsigned NOT NULL COMMENT '省',
  `province_area` varchar(50) NOT NULL DEFAULT '' COMMENT '省名',
  `city` mediumint(5) unsigned NOT NULL COMMENT '市id',
  `city_area` varchar(50) NOT NULL DEFAULT '' COMMENT '城市名',
  `county` mediumint(5) unsigned NOT NULL COMMENT '县/区',
  `county_area` varchar(50) NOT NULL DEFAULT '' COMMENT '县/区名',
  `address` varchar(300) NOT NULL COMMENT '详细地址',
  `is_default` tinyint(1) unsigned NOT NULL COMMENT '是否默认',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_address
-- ----------------------------
INSERT INTO `lucky_address` VALUES ('1', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('2', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('3', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('4', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('5', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('6', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('7', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('8', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('9', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('10', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('11', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('12', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('13', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('14', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('15', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('16', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('17', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('18', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('19', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('20', '0', '', '', '0', '', '0', '', '0', '', '', '0', '0');
INSERT INTO `lucky_address` VALUES ('21', '0', '潘谋勇', '15879221657', '2376', '', '2377', '', '2380', '', '土地庙八号小区', '0', '0');
INSERT INTO `lucky_address` VALUES ('22', '17', '潘谋勇', '15879221657', '1237', '山西省', '1238', '太原市', '1242', '杏花岭区', '详细地址', '0', '1507863126');
INSERT INTO `lucky_address` VALUES ('23', '17', '潘谋勇', '15879221657', '1501', '辽宁省', '1529', '鞍山市', '1533', '立山区', '地址', '1', '1507861938');
INSERT INTO `lucky_address` VALUES ('24', '17', '潘谋勇', '15879221657', '2272', '福建省', '2296', '莆田市', '2301', '秀屿区', '土地庙', '0', '1507861898');
INSERT INTO `lucky_address` VALUES ('25', '17', '潘谋勇', '15879221657', '1630', '吉林省', '1662', '辽源市', '1666', '东丰县', '市辖区', '0', '1507861823');
INSERT INTO `lucky_address` VALUES ('26', '17', '潘谋勇', '15879221657', '1021', '天津市', '1038', '市辖县', '1040', '静海县', '土地庙', '0', '1507861767');
INSERT INTO `lucky_address` VALUES ('27', '17', '潘谋勇', '15879221657', '2376', '江西省', '2377', '南昌市', '2380', '西湖区', '土地庙八号小区', '0', '1507858451');
INSERT INTO `lucky_address` VALUES ('28', '18', '潘谋勇', '15879221657', '1000', '北京市', '1018', '市辖县', '1020', '延庆县', '详细地址', '1', '1514019704');

-- ----------------------------
-- Table structure for lucky_admin
-- ----------------------------
DROP TABLE IF EXISTS `lucky_admin`;
CREATE TABLE `lucky_admin` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `group_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色组id',
  `role_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  `firstdate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '成为管理员时间',
  `overdate` int(11) NOT NULL DEFAULT '0' COMMENT '过期时间 0为不过期',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定该管理员',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除管理员状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_admin
-- ----------------------------
INSERT INTO `lucky_admin` VALUES ('1', '17', '1', '1', '1518259108', '1519814314', '0', '0', '1519870834', '0');
INSERT INTO `lucky_admin` VALUES ('2', '26', '2', '2', '0', '0', '0', '0', '1519970363', '1518260856');
INSERT INTO `lucky_admin` VALUES ('3', '27', '0', '0', '0', '0', '0', '0', '1518319839', '1518318931');

-- ----------------------------
-- Table structure for lucky_ad_position
-- ----------------------------
DROP TABLE IF EXISTS `lucky_ad_position`;
CREATE TABLE `lucky_ad_position` (
  `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告位置id',
  `position_name` varchar(50) NOT NULL COMMENT '广告位置名称',
  `mark` char(50) NOT NULL COMMENT '广告位置标识',
  `desc` varchar(255) NOT NULL COMMENT '广告位简要描述',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '广告位添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mark` (`mark`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_ad_position
-- ----------------------------
INSERT INTO `lucky_ad_position` VALUES ('1', 'PC首页轮播广告', 'pc_home', 'PC端首页轮播广告', '1507261776');
INSERT INTO `lucky_ad_position` VALUES ('2', '', '', '', '1517049304');

-- ----------------------------
-- Table structure for lucky_area
-- ----------------------------
DROP TABLE IF EXISTS `lucky_area`;
CREATE TABLE `lucky_area` (
  `id` mediumint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '地区id',
  `pid` int(5) unsigned NOT NULL COMMENT '地址父id 区分省市',
  `area` varchar(50) NOT NULL COMMENT '地区',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4842 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_area
-- ----------------------------
INSERT INTO `lucky_area` VALUES ('1000', '0', '北京市');
INSERT INTO `lucky_area` VALUES ('1001', '1000', '市辖区');
INSERT INTO `lucky_area` VALUES ('1002', '1001', '东城区');
INSERT INTO `lucky_area` VALUES ('1003', '1001', '西城区');
INSERT INTO `lucky_area` VALUES ('1004', '1001', '崇文区');
INSERT INTO `lucky_area` VALUES ('1005', '1001', '宣武区');
INSERT INTO `lucky_area` VALUES ('1006', '1001', '朝阳区');
INSERT INTO `lucky_area` VALUES ('1007', '1001', '丰台区');
INSERT INTO `lucky_area` VALUES ('1008', '1001', '石景山区');
INSERT INTO `lucky_area` VALUES ('1009', '1001', '海淀区');
INSERT INTO `lucky_area` VALUES ('1010', '1001', '门头沟区');
INSERT INTO `lucky_area` VALUES ('1011', '1001', '房山区');
INSERT INTO `lucky_area` VALUES ('1012', '1001', '通州区');
INSERT INTO `lucky_area` VALUES ('1013', '1001', '顺义区');
INSERT INTO `lucky_area` VALUES ('1014', '1001', '昌平区');
INSERT INTO `lucky_area` VALUES ('1015', '1001', '大兴区');
INSERT INTO `lucky_area` VALUES ('1016', '1001', '怀柔区');
INSERT INTO `lucky_area` VALUES ('1017', '1001', '平谷区');
INSERT INTO `lucky_area` VALUES ('1018', '1000', '市辖县');
INSERT INTO `lucky_area` VALUES ('1019', '1018', '密云县');
INSERT INTO `lucky_area` VALUES ('1020', '1018', '延庆县');
INSERT INTO `lucky_area` VALUES ('1021', '0', '天津市');
INSERT INTO `lucky_area` VALUES ('1022', '1021', '市辖区');
INSERT INTO `lucky_area` VALUES ('1023', '1022', '和平区');
INSERT INTO `lucky_area` VALUES ('1024', '1022', '河东区');
INSERT INTO `lucky_area` VALUES ('1025', '1022', '河西区');
INSERT INTO `lucky_area` VALUES ('1026', '1022', '南开区');
INSERT INTO `lucky_area` VALUES ('1027', '1022', '河北区');
INSERT INTO `lucky_area` VALUES ('1028', '1022', '红桥区');
INSERT INTO `lucky_area` VALUES ('1029', '1022', '塘沽区');
INSERT INTO `lucky_area` VALUES ('1030', '1022', '汉沽区');
INSERT INTO `lucky_area` VALUES ('1031', '1022', '大港区');
INSERT INTO `lucky_area` VALUES ('1032', '1022', '东丽区');
INSERT INTO `lucky_area` VALUES ('1033', '1022', '西青区');
INSERT INTO `lucky_area` VALUES ('1034', '1022', '津南区');
INSERT INTO `lucky_area` VALUES ('1035', '1022', '北辰区');
INSERT INTO `lucky_area` VALUES ('1036', '1022', '武清区');
INSERT INTO `lucky_area` VALUES ('1037', '1022', '宝坻区');
INSERT INTO `lucky_area` VALUES ('1038', '1021', '市辖县');
INSERT INTO `lucky_area` VALUES ('1039', '1038', '宁河县');
INSERT INTO `lucky_area` VALUES ('1040', '1038', '静海县');
INSERT INTO `lucky_area` VALUES ('1041', '1038', '蓟县');
INSERT INTO `lucky_area` VALUES ('1042', '0', '河北省');
INSERT INTO `lucky_area` VALUES ('1043', '1042', '石家庄市');
INSERT INTO `lucky_area` VALUES ('1044', '1043', '市辖区');
INSERT INTO `lucky_area` VALUES ('1045', '1043', '长安区');
INSERT INTO `lucky_area` VALUES ('1046', '1043', '桥东区');
INSERT INTO `lucky_area` VALUES ('1047', '1043', '桥西区');
INSERT INTO `lucky_area` VALUES ('1048', '1043', '新华区');
INSERT INTO `lucky_area` VALUES ('1049', '1043', '井陉矿区');
INSERT INTO `lucky_area` VALUES ('1050', '1043', '裕华区');
INSERT INTO `lucky_area` VALUES ('1051', '1043', '井陉县');
INSERT INTO `lucky_area` VALUES ('1052', '1043', '正定县');
INSERT INTO `lucky_area` VALUES ('1053', '1043', '栾城县');
INSERT INTO `lucky_area` VALUES ('1054', '1043', '行唐县');
INSERT INTO `lucky_area` VALUES ('1055', '1043', '灵寿县');
INSERT INTO `lucky_area` VALUES ('1056', '1043', '高邑县');
INSERT INTO `lucky_area` VALUES ('1057', '1043', '深泽县');
INSERT INTO `lucky_area` VALUES ('1058', '1043', '赞皇县');
INSERT INTO `lucky_area` VALUES ('1059', '1043', '无极县');
INSERT INTO `lucky_area` VALUES ('1060', '1043', '平山县');
INSERT INTO `lucky_area` VALUES ('1061', '1043', '元氏县');
INSERT INTO `lucky_area` VALUES ('1062', '1043', '赵县');
INSERT INTO `lucky_area` VALUES ('1063', '1043', '辛集市');
INSERT INTO `lucky_area` VALUES ('1064', '1043', '藁城市');
INSERT INTO `lucky_area` VALUES ('1065', '1043', '晋州市');
INSERT INTO `lucky_area` VALUES ('1066', '1043', '新乐市');
INSERT INTO `lucky_area` VALUES ('1067', '1043', '鹿泉市');
INSERT INTO `lucky_area` VALUES ('1068', '1042', '唐山市');
INSERT INTO `lucky_area` VALUES ('1069', '1068', '市辖区');
INSERT INTO `lucky_area` VALUES ('1070', '1068', '路南区');
INSERT INTO `lucky_area` VALUES ('1071', '1068', '路北区');
INSERT INTO `lucky_area` VALUES ('1072', '1068', '古冶区');
INSERT INTO `lucky_area` VALUES ('1073', '1068', '开平区');
INSERT INTO `lucky_area` VALUES ('1074', '1068', '丰南区');
INSERT INTO `lucky_area` VALUES ('1075', '1068', '丰润区');
INSERT INTO `lucky_area` VALUES ('1076', '1068', '滦县');
INSERT INTO `lucky_area` VALUES ('1077', '1068', '滦南县');
INSERT INTO `lucky_area` VALUES ('1078', '1068', '乐亭县');
INSERT INTO `lucky_area` VALUES ('1079', '1068', '迁西县');
INSERT INTO `lucky_area` VALUES ('1080', '1068', '玉田县');
INSERT INTO `lucky_area` VALUES ('1081', '1068', '唐海县');
INSERT INTO `lucky_area` VALUES ('1082', '1068', '遵化市');
INSERT INTO `lucky_area` VALUES ('1083', '1068', '迁安市');
INSERT INTO `lucky_area` VALUES ('1084', '1042', '秦皇岛市');
INSERT INTO `lucky_area` VALUES ('1085', '1084', '市辖区');
INSERT INTO `lucky_area` VALUES ('1086', '1084', '海港区');
INSERT INTO `lucky_area` VALUES ('1087', '1084', '山海关区');
INSERT INTO `lucky_area` VALUES ('1088', '1084', '北戴河区');
INSERT INTO `lucky_area` VALUES ('1089', '1084', '青龙满族自治县');
INSERT INTO `lucky_area` VALUES ('1090', '1084', '昌黎县');
INSERT INTO `lucky_area` VALUES ('1091', '1084', '抚宁县');
INSERT INTO `lucky_area` VALUES ('1092', '1084', '卢龙县');
INSERT INTO `lucky_area` VALUES ('1093', '1042', '邯郸市');
INSERT INTO `lucky_area` VALUES ('1094', '1093', '市辖区');
INSERT INTO `lucky_area` VALUES ('1095', '1093', '邯山区');
INSERT INTO `lucky_area` VALUES ('1096', '1093', '丛台区');
INSERT INTO `lucky_area` VALUES ('1097', '1093', '复兴区');
INSERT INTO `lucky_area` VALUES ('1098', '1093', '峰峰矿区');
INSERT INTO `lucky_area` VALUES ('1099', '1093', '邯郸县');
INSERT INTO `lucky_area` VALUES ('1100', '1093', '临漳县');
INSERT INTO `lucky_area` VALUES ('1101', '1093', '成安县');
INSERT INTO `lucky_area` VALUES ('1102', '1093', '大名县');
INSERT INTO `lucky_area` VALUES ('1103', '1093', '涉县');
INSERT INTO `lucky_area` VALUES ('1104', '1093', '磁县');
INSERT INTO `lucky_area` VALUES ('1105', '1093', '肥乡县');
INSERT INTO `lucky_area` VALUES ('1106', '1093', '永年县');
INSERT INTO `lucky_area` VALUES ('1107', '1093', '邱县');
INSERT INTO `lucky_area` VALUES ('1108', '1093', '鸡泽县');
INSERT INTO `lucky_area` VALUES ('1109', '1093', '广平县');
INSERT INTO `lucky_area` VALUES ('1110', '1093', '馆陶县');
INSERT INTO `lucky_area` VALUES ('1111', '1093', '魏县');
INSERT INTO `lucky_area` VALUES ('1112', '1093', '曲周县');
INSERT INTO `lucky_area` VALUES ('1113', '1093', '武安市');
INSERT INTO `lucky_area` VALUES ('1114', '1042', '邢台市');
INSERT INTO `lucky_area` VALUES ('1115', '1114', '市辖区');
INSERT INTO `lucky_area` VALUES ('1116', '1114', '桥东区');
INSERT INTO `lucky_area` VALUES ('1117', '1114', '桥西区');
INSERT INTO `lucky_area` VALUES ('1118', '1114', '邢台县');
INSERT INTO `lucky_area` VALUES ('1119', '1114', '临城县');
INSERT INTO `lucky_area` VALUES ('1120', '1114', '内丘县');
INSERT INTO `lucky_area` VALUES ('1121', '1114', '柏乡县');
INSERT INTO `lucky_area` VALUES ('1122', '1114', '隆尧县');
INSERT INTO `lucky_area` VALUES ('1123', '1114', '任县');
INSERT INTO `lucky_area` VALUES ('1124', '1114', '南和县');
INSERT INTO `lucky_area` VALUES ('1125', '1114', '宁晋县');
INSERT INTO `lucky_area` VALUES ('1126', '1114', '巨鹿县');
INSERT INTO `lucky_area` VALUES ('1127', '1114', '新河县');
INSERT INTO `lucky_area` VALUES ('1128', '1114', '广宗县');
INSERT INTO `lucky_area` VALUES ('1129', '1114', '平乡县');
INSERT INTO `lucky_area` VALUES ('1130', '1114', '威县');
INSERT INTO `lucky_area` VALUES ('1131', '1114', '清河县');
INSERT INTO `lucky_area` VALUES ('1132', '1114', '临西县');
INSERT INTO `lucky_area` VALUES ('1133', '1114', '南宫市');
INSERT INTO `lucky_area` VALUES ('1134', '1114', '沙河市');
INSERT INTO `lucky_area` VALUES ('1135', '1042', '保定市');
INSERT INTO `lucky_area` VALUES ('1136', '1135', '市辖区');
INSERT INTO `lucky_area` VALUES ('1137', '1135', '新市区');
INSERT INTO `lucky_area` VALUES ('1138', '1135', '北市区');
INSERT INTO `lucky_area` VALUES ('1139', '1135', '南市区');
INSERT INTO `lucky_area` VALUES ('1140', '1135', '满城县');
INSERT INTO `lucky_area` VALUES ('1141', '1135', '清苑县');
INSERT INTO `lucky_area` VALUES ('1142', '1135', '涞水县');
INSERT INTO `lucky_area` VALUES ('1143', '1135', '阜平县');
INSERT INTO `lucky_area` VALUES ('1144', '1135', '徐水县');
INSERT INTO `lucky_area` VALUES ('1145', '1135', '定兴县');
INSERT INTO `lucky_area` VALUES ('1146', '1135', '唐县');
INSERT INTO `lucky_area` VALUES ('1147', '1135', '高阳县');
INSERT INTO `lucky_area` VALUES ('1148', '1135', '容城县');
INSERT INTO `lucky_area` VALUES ('1149', '1135', '涞源县');
INSERT INTO `lucky_area` VALUES ('1150', '1135', '望都县');
INSERT INTO `lucky_area` VALUES ('1151', '1135', '安新县');
INSERT INTO `lucky_area` VALUES ('1152', '1135', '易县');
INSERT INTO `lucky_area` VALUES ('1153', '1135', '曲阳县');
INSERT INTO `lucky_area` VALUES ('1154', '1135', '蠡县');
INSERT INTO `lucky_area` VALUES ('1155', '1135', '顺平县');
INSERT INTO `lucky_area` VALUES ('1156', '1135', '博野县');
INSERT INTO `lucky_area` VALUES ('1157', '1135', '雄县');
INSERT INTO `lucky_area` VALUES ('1158', '1135', '涿州市');
INSERT INTO `lucky_area` VALUES ('1159', '1135', '定州市');
INSERT INTO `lucky_area` VALUES ('1160', '1135', '安国市');
INSERT INTO `lucky_area` VALUES ('1161', '1135', '高碑店市');
INSERT INTO `lucky_area` VALUES ('1162', '1042', '张家口市');
INSERT INTO `lucky_area` VALUES ('1163', '1162', '市辖区');
INSERT INTO `lucky_area` VALUES ('1164', '1162', '桥东区');
INSERT INTO `lucky_area` VALUES ('1165', '1162', '桥西区');
INSERT INTO `lucky_area` VALUES ('1166', '1162', '宣化区');
INSERT INTO `lucky_area` VALUES ('1167', '1162', '下花园区');
INSERT INTO `lucky_area` VALUES ('1168', '1162', '宣化县');
INSERT INTO `lucky_area` VALUES ('1169', '1162', '张北县');
INSERT INTO `lucky_area` VALUES ('1170', '1162', '康保县');
INSERT INTO `lucky_area` VALUES ('1171', '1162', '沽源县');
INSERT INTO `lucky_area` VALUES ('1172', '1162', '尚义县');
INSERT INTO `lucky_area` VALUES ('1173', '1162', '蔚县');
INSERT INTO `lucky_area` VALUES ('1174', '1162', '阳原县');
INSERT INTO `lucky_area` VALUES ('1175', '1162', '怀安县');
INSERT INTO `lucky_area` VALUES ('1176', '1162', '万全县');
INSERT INTO `lucky_area` VALUES ('1177', '1162', '怀来县');
INSERT INTO `lucky_area` VALUES ('1178', '1162', '涿鹿县');
INSERT INTO `lucky_area` VALUES ('1179', '1162', '赤城县');
INSERT INTO `lucky_area` VALUES ('1180', '1162', '崇礼县');
INSERT INTO `lucky_area` VALUES ('1181', '1042', '承德市');
INSERT INTO `lucky_area` VALUES ('1182', '1181', '市辖区');
INSERT INTO `lucky_area` VALUES ('1183', '1181', '双桥区');
INSERT INTO `lucky_area` VALUES ('1184', '1181', '双滦区');
INSERT INTO `lucky_area` VALUES ('1185', '1181', '鹰手营子矿区');
INSERT INTO `lucky_area` VALUES ('1186', '1181', '承德县');
INSERT INTO `lucky_area` VALUES ('1187', '1181', '兴隆县');
INSERT INTO `lucky_area` VALUES ('1188', '1181', '平泉县');
INSERT INTO `lucky_area` VALUES ('1189', '1181', '滦平县');
INSERT INTO `lucky_area` VALUES ('1190', '1181', '隆化县');
INSERT INTO `lucky_area` VALUES ('1191', '1181', '丰宁满族自治县');
INSERT INTO `lucky_area` VALUES ('1192', '1181', '宽城满族自治县');
INSERT INTO `lucky_area` VALUES ('1193', '1181', '围场满族蒙古族自治县');
INSERT INTO `lucky_area` VALUES ('1194', '1042', '沧州市');
INSERT INTO `lucky_area` VALUES ('1195', '1194', '市辖区');
INSERT INTO `lucky_area` VALUES ('1196', '1194', '新华区');
INSERT INTO `lucky_area` VALUES ('1197', '1194', '运河区');
INSERT INTO `lucky_area` VALUES ('1198', '1194', '沧县');
INSERT INTO `lucky_area` VALUES ('1199', '1194', '青县');
INSERT INTO `lucky_area` VALUES ('1200', '1194', '东光县');
INSERT INTO `lucky_area` VALUES ('1201', '1194', '海兴县');
INSERT INTO `lucky_area` VALUES ('1202', '1194', '盐山县');
INSERT INTO `lucky_area` VALUES ('1203', '1194', '肃宁县');
INSERT INTO `lucky_area` VALUES ('1204', '1194', '南皮县');
INSERT INTO `lucky_area` VALUES ('1205', '1194', '吴桥县');
INSERT INTO `lucky_area` VALUES ('1206', '1194', '献县');
INSERT INTO `lucky_area` VALUES ('1207', '1194', '孟村回族自治县');
INSERT INTO `lucky_area` VALUES ('1208', '1194', '泊头市');
INSERT INTO `lucky_area` VALUES ('1209', '1194', '任丘市');
INSERT INTO `lucky_area` VALUES ('1210', '1194', '黄骅市');
INSERT INTO `lucky_area` VALUES ('1211', '1194', '河间市');
INSERT INTO `lucky_area` VALUES ('1212', '1042', '廊坊市');
INSERT INTO `lucky_area` VALUES ('1213', '1212', '市辖区');
INSERT INTO `lucky_area` VALUES ('1214', '1212', '安次区');
INSERT INTO `lucky_area` VALUES ('1215', '1212', '广阳区');
INSERT INTO `lucky_area` VALUES ('1216', '1212', '固安县');
INSERT INTO `lucky_area` VALUES ('1217', '1212', '永清县');
INSERT INTO `lucky_area` VALUES ('1218', '1212', '香河县');
INSERT INTO `lucky_area` VALUES ('1219', '1212', '大城县');
INSERT INTO `lucky_area` VALUES ('1220', '1212', '文安县');
INSERT INTO `lucky_area` VALUES ('1221', '1212', '大厂回族自治县');
INSERT INTO `lucky_area` VALUES ('1222', '1212', '霸州市');
INSERT INTO `lucky_area` VALUES ('1223', '1212', '三河市');
INSERT INTO `lucky_area` VALUES ('1224', '1042', '衡水市');
INSERT INTO `lucky_area` VALUES ('1225', '1224', '市辖区');
INSERT INTO `lucky_area` VALUES ('1226', '1224', '桃城区');
INSERT INTO `lucky_area` VALUES ('1227', '1224', '枣强县');
INSERT INTO `lucky_area` VALUES ('1228', '1224', '武邑县');
INSERT INTO `lucky_area` VALUES ('1229', '1224', '武强县');
INSERT INTO `lucky_area` VALUES ('1230', '1224', '饶阳县');
INSERT INTO `lucky_area` VALUES ('1231', '1224', '安平县');
INSERT INTO `lucky_area` VALUES ('1232', '1224', '故城县');
INSERT INTO `lucky_area` VALUES ('1233', '1224', '景县');
INSERT INTO `lucky_area` VALUES ('1234', '1224', '阜城县');
INSERT INTO `lucky_area` VALUES ('1235', '1224', '冀州市');
INSERT INTO `lucky_area` VALUES ('1236', '1224', '深州市');
INSERT INTO `lucky_area` VALUES ('1237', '0', '山西省');
INSERT INTO `lucky_area` VALUES ('1238', '1237', '太原市');
INSERT INTO `lucky_area` VALUES ('1239', '1238', '市辖区');
INSERT INTO `lucky_area` VALUES ('1240', '1238', '小店区');
INSERT INTO `lucky_area` VALUES ('1241', '1238', '迎泽区');
INSERT INTO `lucky_area` VALUES ('1242', '1238', '杏花岭区');
INSERT INTO `lucky_area` VALUES ('1243', '1238', '尖草坪区');
INSERT INTO `lucky_area` VALUES ('1244', '1238', '万柏林区');
INSERT INTO `lucky_area` VALUES ('1245', '1238', '晋源区');
INSERT INTO `lucky_area` VALUES ('1246', '1238', '清徐县');
INSERT INTO `lucky_area` VALUES ('1247', '1238', '阳曲县');
INSERT INTO `lucky_area` VALUES ('1248', '1238', '娄烦县');
INSERT INTO `lucky_area` VALUES ('1249', '1238', '古交市');
INSERT INTO `lucky_area` VALUES ('1250', '1237', '大同市');
INSERT INTO `lucky_area` VALUES ('1251', '1250', '市辖区');
INSERT INTO `lucky_area` VALUES ('1252', '1250', '城区');
INSERT INTO `lucky_area` VALUES ('1253', '1250', '矿区');
INSERT INTO `lucky_area` VALUES ('1254', '1250', '南郊区');
INSERT INTO `lucky_area` VALUES ('1255', '1250', '新荣区');
INSERT INTO `lucky_area` VALUES ('1256', '1250', '阳高县');
INSERT INTO `lucky_area` VALUES ('1257', '1250', '天镇县');
INSERT INTO `lucky_area` VALUES ('1258', '1250', '广灵县');
INSERT INTO `lucky_area` VALUES ('1259', '1250', '灵丘县');
INSERT INTO `lucky_area` VALUES ('1260', '1250', '浑源县');
INSERT INTO `lucky_area` VALUES ('1261', '1250', '左云县');
INSERT INTO `lucky_area` VALUES ('1262', '1250', '大同县');
INSERT INTO `lucky_area` VALUES ('1263', '1237', '阳泉市');
INSERT INTO `lucky_area` VALUES ('1264', '1263', '市辖区');
INSERT INTO `lucky_area` VALUES ('1265', '1263', '城区');
INSERT INTO `lucky_area` VALUES ('1266', '1263', '矿区');
INSERT INTO `lucky_area` VALUES ('1267', '1263', '郊区');
INSERT INTO `lucky_area` VALUES ('1268', '1263', '平定县');
INSERT INTO `lucky_area` VALUES ('1269', '1263', '盂县');
INSERT INTO `lucky_area` VALUES ('1270', '1237', '长治市');
INSERT INTO `lucky_area` VALUES ('1271', '1270', '市辖区');
INSERT INTO `lucky_area` VALUES ('1272', '1270', '城区');
INSERT INTO `lucky_area` VALUES ('1273', '1270', '郊区');
INSERT INTO `lucky_area` VALUES ('1274', '1270', '长治县');
INSERT INTO `lucky_area` VALUES ('1275', '1270', '襄垣县');
INSERT INTO `lucky_area` VALUES ('1276', '1270', '屯留县');
INSERT INTO `lucky_area` VALUES ('1277', '1270', '平顺县');
INSERT INTO `lucky_area` VALUES ('1278', '1270', '黎城县');
INSERT INTO `lucky_area` VALUES ('1279', '1270', '壶关县');
INSERT INTO `lucky_area` VALUES ('1280', '1270', '长子县');
INSERT INTO `lucky_area` VALUES ('1281', '1270', '武乡县');
INSERT INTO `lucky_area` VALUES ('1282', '1270', '沁县');
INSERT INTO `lucky_area` VALUES ('1283', '1270', '沁源县');
INSERT INTO `lucky_area` VALUES ('1284', '1270', '潞城市');
INSERT INTO `lucky_area` VALUES ('1285', '1237', '晋城市');
INSERT INTO `lucky_area` VALUES ('1286', '1285', '市辖区');
INSERT INTO `lucky_area` VALUES ('1287', '1285', '城区');
INSERT INTO `lucky_area` VALUES ('1288', '1285', '沁水县');
INSERT INTO `lucky_area` VALUES ('1289', '1285', '阳城县');
INSERT INTO `lucky_area` VALUES ('1290', '1285', '陵川县');
INSERT INTO `lucky_area` VALUES ('1291', '1285', '泽州县');
INSERT INTO `lucky_area` VALUES ('1292', '1285', '高平市');
INSERT INTO `lucky_area` VALUES ('1293', '1237', '朔州市');
INSERT INTO `lucky_area` VALUES ('1294', '1293', '市辖区');
INSERT INTO `lucky_area` VALUES ('1295', '1293', '朔城区');
INSERT INTO `lucky_area` VALUES ('1296', '1293', '平鲁区');
INSERT INTO `lucky_area` VALUES ('1297', '1293', '山阴县');
INSERT INTO `lucky_area` VALUES ('1298', '1293', '应县');
INSERT INTO `lucky_area` VALUES ('1299', '1293', '右玉县');
INSERT INTO `lucky_area` VALUES ('1300', '1293', '怀仁县');
INSERT INTO `lucky_area` VALUES ('1301', '1237', '晋中市');
INSERT INTO `lucky_area` VALUES ('1302', '1301', '市辖区');
INSERT INTO `lucky_area` VALUES ('1303', '1301', '榆次区');
INSERT INTO `lucky_area` VALUES ('1304', '1301', '榆社县');
INSERT INTO `lucky_area` VALUES ('1305', '1301', '左权县');
INSERT INTO `lucky_area` VALUES ('1306', '1301', '和顺县');
INSERT INTO `lucky_area` VALUES ('1307', '1301', '昔阳县');
INSERT INTO `lucky_area` VALUES ('1308', '1301', '寿阳县');
INSERT INTO `lucky_area` VALUES ('1309', '1301', '太谷县');
INSERT INTO `lucky_area` VALUES ('1310', '1301', '祁县');
INSERT INTO `lucky_area` VALUES ('1311', '1301', '平遥县');
INSERT INTO `lucky_area` VALUES ('1312', '1301', '灵石县');
INSERT INTO `lucky_area` VALUES ('1313', '1301', '介休市');
INSERT INTO `lucky_area` VALUES ('1314', '1237', '运城市');
INSERT INTO `lucky_area` VALUES ('1315', '1314', '市辖区');
INSERT INTO `lucky_area` VALUES ('1316', '1314', '盐湖区');
INSERT INTO `lucky_area` VALUES ('1317', '1314', '临猗县');
INSERT INTO `lucky_area` VALUES ('1318', '1314', '万荣县');
INSERT INTO `lucky_area` VALUES ('1319', '1314', '闻喜县');
INSERT INTO `lucky_area` VALUES ('1320', '1314', '稷山县');
INSERT INTO `lucky_area` VALUES ('1321', '1314', '新绛县');
INSERT INTO `lucky_area` VALUES ('1322', '1314', '绛县');
INSERT INTO `lucky_area` VALUES ('1323', '1314', '垣曲县');
INSERT INTO `lucky_area` VALUES ('1324', '1314', '夏县');
INSERT INTO `lucky_area` VALUES ('1325', '1314', '平陆县');
INSERT INTO `lucky_area` VALUES ('1326', '1314', '芮城县');
INSERT INTO `lucky_area` VALUES ('1327', '1314', '永济市');
INSERT INTO `lucky_area` VALUES ('1328', '1314', '河津市');
INSERT INTO `lucky_area` VALUES ('1329', '1237', '忻州市');
INSERT INTO `lucky_area` VALUES ('1330', '1329', '市辖区');
INSERT INTO `lucky_area` VALUES ('1331', '1329', '忻府区');
INSERT INTO `lucky_area` VALUES ('1332', '1329', '定襄县');
INSERT INTO `lucky_area` VALUES ('1333', '1329', '五台县');
INSERT INTO `lucky_area` VALUES ('1334', '1329', '代县');
INSERT INTO `lucky_area` VALUES ('1335', '1329', '繁峙县');
INSERT INTO `lucky_area` VALUES ('1336', '1329', '宁武县');
INSERT INTO `lucky_area` VALUES ('1337', '1329', '静乐县');
INSERT INTO `lucky_area` VALUES ('1338', '1329', '神池县');
INSERT INTO `lucky_area` VALUES ('1339', '1329', '五寨县');
INSERT INTO `lucky_area` VALUES ('1340', '1329', '岢岚县');
INSERT INTO `lucky_area` VALUES ('1341', '1329', '河曲县');
INSERT INTO `lucky_area` VALUES ('1342', '1329', '保德县');
INSERT INTO `lucky_area` VALUES ('1343', '1329', '偏关县');
INSERT INTO `lucky_area` VALUES ('1344', '1329', '原平市');
INSERT INTO `lucky_area` VALUES ('1345', '1237', '临汾市');
INSERT INTO `lucky_area` VALUES ('1346', '1345', '市辖区');
INSERT INTO `lucky_area` VALUES ('1347', '1345', '尧都区');
INSERT INTO `lucky_area` VALUES ('1348', '1345', '曲沃县');
INSERT INTO `lucky_area` VALUES ('1349', '1345', '翼城县');
INSERT INTO `lucky_area` VALUES ('1350', '1345', '襄汾县');
INSERT INTO `lucky_area` VALUES ('1351', '1345', '洪洞县');
INSERT INTO `lucky_area` VALUES ('1352', '1345', '古县');
INSERT INTO `lucky_area` VALUES ('1353', '1345', '安泽县');
INSERT INTO `lucky_area` VALUES ('1354', '1345', '浮山县');
INSERT INTO `lucky_area` VALUES ('1355', '1345', '吉县');
INSERT INTO `lucky_area` VALUES ('1356', '1345', '乡宁县');
INSERT INTO `lucky_area` VALUES ('1357', '1345', '大宁县');
INSERT INTO `lucky_area` VALUES ('1358', '1345', '隰县');
INSERT INTO `lucky_area` VALUES ('1359', '1345', '永和县');
INSERT INTO `lucky_area` VALUES ('1360', '1345', '蒲县');
INSERT INTO `lucky_area` VALUES ('1361', '1345', '汾西县');
INSERT INTO `lucky_area` VALUES ('1362', '1345', '侯马市');
INSERT INTO `lucky_area` VALUES ('1363', '1345', '霍州市');
INSERT INTO `lucky_area` VALUES ('1364', '1237', '吕梁市');
INSERT INTO `lucky_area` VALUES ('1365', '1364', '市辖区');
INSERT INTO `lucky_area` VALUES ('1366', '1364', '离石区');
INSERT INTO `lucky_area` VALUES ('1367', '1364', '文水县');
INSERT INTO `lucky_area` VALUES ('1368', '1364', '交城县');
INSERT INTO `lucky_area` VALUES ('1369', '1364', '兴县');
INSERT INTO `lucky_area` VALUES ('1370', '1364', '临县');
INSERT INTO `lucky_area` VALUES ('1371', '1364', '柳林县');
INSERT INTO `lucky_area` VALUES ('1372', '1364', '石楼县');
INSERT INTO `lucky_area` VALUES ('1373', '1364', '岚县');
INSERT INTO `lucky_area` VALUES ('1374', '1364', '方山县');
INSERT INTO `lucky_area` VALUES ('1375', '1364', '中阳县');
INSERT INTO `lucky_area` VALUES ('1376', '1364', '交口县');
INSERT INTO `lucky_area` VALUES ('1377', '1364', '孝义市');
INSERT INTO `lucky_area` VALUES ('1378', '1364', '汾阳市');
INSERT INTO `lucky_area` VALUES ('1379', '0', '内蒙古自治区');
INSERT INTO `lucky_area` VALUES ('1380', '1379', '呼和浩特市');
INSERT INTO `lucky_area` VALUES ('1381', '1380', '市辖区');
INSERT INTO `lucky_area` VALUES ('1382', '1380', '新城区');
INSERT INTO `lucky_area` VALUES ('1383', '1380', '回民区');
INSERT INTO `lucky_area` VALUES ('1384', '1380', '玉泉区');
INSERT INTO `lucky_area` VALUES ('1385', '1380', '赛罕区');
INSERT INTO `lucky_area` VALUES ('1386', '1380', '土默特左旗');
INSERT INTO `lucky_area` VALUES ('1387', '1380', '托克托县');
INSERT INTO `lucky_area` VALUES ('1388', '1380', '和林格尔县');
INSERT INTO `lucky_area` VALUES ('1389', '1380', '清水河县');
INSERT INTO `lucky_area` VALUES ('1390', '1380', '武川县');
INSERT INTO `lucky_area` VALUES ('1391', '1379', '包头市');
INSERT INTO `lucky_area` VALUES ('1392', '1391', '市辖区');
INSERT INTO `lucky_area` VALUES ('1393', '1391', '东河区');
INSERT INTO `lucky_area` VALUES ('1394', '1391', '昆都仑区');
INSERT INTO `lucky_area` VALUES ('1395', '1391', '青山区');
INSERT INTO `lucky_area` VALUES ('1396', '1391', '石拐区');
INSERT INTO `lucky_area` VALUES ('1397', '1391', '白云矿区');
INSERT INTO `lucky_area` VALUES ('1398', '1391', '九原区');
INSERT INTO `lucky_area` VALUES ('1399', '1391', '土默特右旗');
INSERT INTO `lucky_area` VALUES ('1400', '1391', '固阳县');
INSERT INTO `lucky_area` VALUES ('1401', '1391', '达尔罕茂明安联合旗');
INSERT INTO `lucky_area` VALUES ('1402', '1379', '乌海市');
INSERT INTO `lucky_area` VALUES ('1403', '1402', '市辖区');
INSERT INTO `lucky_area` VALUES ('1404', '1402', '海勃湾区');
INSERT INTO `lucky_area` VALUES ('1405', '1402', '海南区');
INSERT INTO `lucky_area` VALUES ('1406', '1402', '乌达区');
INSERT INTO `lucky_area` VALUES ('1407', '1379', '赤峰市');
INSERT INTO `lucky_area` VALUES ('1408', '1407', '市辖区');
INSERT INTO `lucky_area` VALUES ('1409', '1407', '红山区');
INSERT INTO `lucky_area` VALUES ('1410', '1407', '元宝山区');
INSERT INTO `lucky_area` VALUES ('1411', '1407', '松山区');
INSERT INTO `lucky_area` VALUES ('1412', '1407', '阿鲁科尔沁旗');
INSERT INTO `lucky_area` VALUES ('1413', '1407', '巴林左旗');
INSERT INTO `lucky_area` VALUES ('1414', '1407', '巴林右旗');
INSERT INTO `lucky_area` VALUES ('1415', '1407', '林西县');
INSERT INTO `lucky_area` VALUES ('1416', '1407', '克什克腾旗');
INSERT INTO `lucky_area` VALUES ('1417', '1407', '翁牛特旗');
INSERT INTO `lucky_area` VALUES ('1418', '1407', '喀喇沁旗');
INSERT INTO `lucky_area` VALUES ('1419', '1407', '宁城县');
INSERT INTO `lucky_area` VALUES ('1420', '1407', '敖汉旗');
INSERT INTO `lucky_area` VALUES ('1421', '1379', '通辽市');
INSERT INTO `lucky_area` VALUES ('1422', '1421', '市辖区');
INSERT INTO `lucky_area` VALUES ('1423', '1421', '科尔沁区');
INSERT INTO `lucky_area` VALUES ('1424', '1421', '科尔沁左翼中旗');
INSERT INTO `lucky_area` VALUES ('1425', '1421', '科尔沁左翼后旗');
INSERT INTO `lucky_area` VALUES ('1426', '1421', '开鲁县');
INSERT INTO `lucky_area` VALUES ('1427', '1421', '库伦旗');
INSERT INTO `lucky_area` VALUES ('1428', '1421', '奈曼旗');
INSERT INTO `lucky_area` VALUES ('1429', '1421', '扎鲁特旗');
INSERT INTO `lucky_area` VALUES ('1430', '1421', '霍林郭勒市');
INSERT INTO `lucky_area` VALUES ('1431', '1379', '鄂尔多斯市');
INSERT INTO `lucky_area` VALUES ('1432', '1431', '东胜区');
INSERT INTO `lucky_area` VALUES ('1433', '1431', '达拉特旗');
INSERT INTO `lucky_area` VALUES ('1434', '1431', '准格尔旗');
INSERT INTO `lucky_area` VALUES ('1435', '1431', '鄂托克前旗');
INSERT INTO `lucky_area` VALUES ('1436', '1431', '鄂托克旗');
INSERT INTO `lucky_area` VALUES ('1437', '1431', '杭锦旗');
INSERT INTO `lucky_area` VALUES ('1438', '1431', '乌审旗');
INSERT INTO `lucky_area` VALUES ('1439', '1431', '伊金霍洛旗');
INSERT INTO `lucky_area` VALUES ('1440', '1379', '呼伦贝尔市');
INSERT INTO `lucky_area` VALUES ('1441', '1440', '市辖区');
INSERT INTO `lucky_area` VALUES ('1442', '1440', '海拉尔区');
INSERT INTO `lucky_area` VALUES ('1443', '1440', '阿荣旗');
INSERT INTO `lucky_area` VALUES ('1444', '1440', '莫力达瓦达斡尔族自治旗');
INSERT INTO `lucky_area` VALUES ('1445', '1440', '鄂伦春自治旗');
INSERT INTO `lucky_area` VALUES ('1446', '1440', '鄂温克族自治旗');
INSERT INTO `lucky_area` VALUES ('1447', '1440', '陈巴尔虎旗');
INSERT INTO `lucky_area` VALUES ('1448', '1440', '新巴尔虎左旗');
INSERT INTO `lucky_area` VALUES ('1449', '1440', '新巴尔虎右旗');
INSERT INTO `lucky_area` VALUES ('1450', '1440', '满洲里市');
INSERT INTO `lucky_area` VALUES ('1451', '1440', '牙克石市');
INSERT INTO `lucky_area` VALUES ('1452', '1440', '扎兰屯市');
INSERT INTO `lucky_area` VALUES ('1453', '1440', '额尔古纳市');
INSERT INTO `lucky_area` VALUES ('1454', '1440', '根河市');
INSERT INTO `lucky_area` VALUES ('1455', '1379', '巴彦淖尔市');
INSERT INTO `lucky_area` VALUES ('1456', '1455', '市辖区');
INSERT INTO `lucky_area` VALUES ('1457', '1455', '临河区');
INSERT INTO `lucky_area` VALUES ('1458', '1455', '五原县');
INSERT INTO `lucky_area` VALUES ('1459', '1455', '磴口县');
INSERT INTO `lucky_area` VALUES ('1460', '1455', '乌拉特前旗');
INSERT INTO `lucky_area` VALUES ('1461', '1455', '乌拉特中旗');
INSERT INTO `lucky_area` VALUES ('1462', '1455', '乌拉特后旗');
INSERT INTO `lucky_area` VALUES ('1463', '1455', '杭锦后旗');
INSERT INTO `lucky_area` VALUES ('1464', '1379', '乌兰察布市');
INSERT INTO `lucky_area` VALUES ('1465', '1464', '市辖区');
INSERT INTO `lucky_area` VALUES ('1466', '1464', '集宁区');
INSERT INTO `lucky_area` VALUES ('1467', '1464', '卓资县');
INSERT INTO `lucky_area` VALUES ('1468', '1464', '化德县');
INSERT INTO `lucky_area` VALUES ('1469', '1464', '商都县');
INSERT INTO `lucky_area` VALUES ('1470', '1464', '兴和县');
INSERT INTO `lucky_area` VALUES ('1471', '1464', '凉城县');
INSERT INTO `lucky_area` VALUES ('1472', '1464', '察哈尔右翼前旗');
INSERT INTO `lucky_area` VALUES ('1473', '1464', '察哈尔右翼中旗');
INSERT INTO `lucky_area` VALUES ('1474', '1464', '察哈尔右翼后旗');
INSERT INTO `lucky_area` VALUES ('1475', '1464', '四子王旗');
INSERT INTO `lucky_area` VALUES ('1476', '1464', '丰镇市');
INSERT INTO `lucky_area` VALUES ('1477', '1379', '兴安盟');
INSERT INTO `lucky_area` VALUES ('1478', '1477', '乌兰浩特市');
INSERT INTO `lucky_area` VALUES ('1479', '1477', '阿尔山市');
INSERT INTO `lucky_area` VALUES ('1480', '1477', '科尔沁右翼前旗');
INSERT INTO `lucky_area` VALUES ('1481', '1477', '科尔沁右翼中旗');
INSERT INTO `lucky_area` VALUES ('1482', '1477', '扎赉特旗');
INSERT INTO `lucky_area` VALUES ('1483', '1477', '突泉县');
INSERT INTO `lucky_area` VALUES ('1484', '1379', '锡林郭勒盟');
INSERT INTO `lucky_area` VALUES ('1485', '1484', '二连浩特市');
INSERT INTO `lucky_area` VALUES ('1486', '1484', '锡林浩特市');
INSERT INTO `lucky_area` VALUES ('1487', '1484', '阿巴嘎旗');
INSERT INTO `lucky_area` VALUES ('1488', '1484', '苏尼特左旗');
INSERT INTO `lucky_area` VALUES ('1489', '1484', '苏尼特右旗');
INSERT INTO `lucky_area` VALUES ('1490', '1484', '东乌珠穆沁旗');
INSERT INTO `lucky_area` VALUES ('1491', '1484', '西乌珠穆沁旗');
INSERT INTO `lucky_area` VALUES ('1492', '1484', '太仆寺旗');
INSERT INTO `lucky_area` VALUES ('1493', '1484', '镶黄旗');
INSERT INTO `lucky_area` VALUES ('1494', '1484', '正镶白旗');
INSERT INTO `lucky_area` VALUES ('1495', '1484', '正蓝旗');
INSERT INTO `lucky_area` VALUES ('1496', '1484', '多伦县');
INSERT INTO `lucky_area` VALUES ('1497', '1379', '阿拉善盟');
INSERT INTO `lucky_area` VALUES ('1498', '1497', '阿拉善左旗');
INSERT INTO `lucky_area` VALUES ('1499', '1497', '阿拉善右旗');
INSERT INTO `lucky_area` VALUES ('1500', '1497', '额济纳旗');
INSERT INTO `lucky_area` VALUES ('1501', '0', '辽宁省');
INSERT INTO `lucky_area` VALUES ('1502', '1501', '沈阳市');
INSERT INTO `lucky_area` VALUES ('1503', '1502', '市辖区');
INSERT INTO `lucky_area` VALUES ('1504', '1502', '和平区');
INSERT INTO `lucky_area` VALUES ('1505', '1502', '沈河区');
INSERT INTO `lucky_area` VALUES ('1506', '1502', '大东区');
INSERT INTO `lucky_area` VALUES ('1507', '1502', '皇姑区');
INSERT INTO `lucky_area` VALUES ('1508', '1502', '铁西区');
INSERT INTO `lucky_area` VALUES ('1509', '1502', '苏家屯区');
INSERT INTO `lucky_area` VALUES ('1510', '1502', '东陵区');
INSERT INTO `lucky_area` VALUES ('1511', '1502', '新城子区');
INSERT INTO `lucky_area` VALUES ('1512', '1502', '于洪区');
INSERT INTO `lucky_area` VALUES ('1513', '1502', '辽中县');
INSERT INTO `lucky_area` VALUES ('1514', '1502', '康平县');
INSERT INTO `lucky_area` VALUES ('1515', '1502', '法库县');
INSERT INTO `lucky_area` VALUES ('1516', '1502', '新民市');
INSERT INTO `lucky_area` VALUES ('1517', '1501', '大连市');
INSERT INTO `lucky_area` VALUES ('1518', '1517', '市辖区');
INSERT INTO `lucky_area` VALUES ('1519', '1517', '中山区');
INSERT INTO `lucky_area` VALUES ('1520', '1517', '西岗区');
INSERT INTO `lucky_area` VALUES ('1521', '1517', '沙河口区');
INSERT INTO `lucky_area` VALUES ('1522', '1517', '甘井子区');
INSERT INTO `lucky_area` VALUES ('1523', '1517', '旅顺口区');
INSERT INTO `lucky_area` VALUES ('1524', '1517', '金州区');
INSERT INTO `lucky_area` VALUES ('1525', '1517', '长海县');
INSERT INTO `lucky_area` VALUES ('1526', '1517', '瓦房店市');
INSERT INTO `lucky_area` VALUES ('1527', '1517', '普兰店市');
INSERT INTO `lucky_area` VALUES ('1528', '1517', '庄河市');
INSERT INTO `lucky_area` VALUES ('1529', '1501', '鞍山市');
INSERT INTO `lucky_area` VALUES ('1530', '1529', '市辖区');
INSERT INTO `lucky_area` VALUES ('1531', '1529', '铁东区');
INSERT INTO `lucky_area` VALUES ('1532', '1529', '铁西区');
INSERT INTO `lucky_area` VALUES ('1533', '1529', '立山区');
INSERT INTO `lucky_area` VALUES ('1534', '1529', '千山区');
INSERT INTO `lucky_area` VALUES ('1535', '1529', '台安县');
INSERT INTO `lucky_area` VALUES ('1536', '1529', '岫岩满族自治县');
INSERT INTO `lucky_area` VALUES ('1537', '1529', '海城市');
INSERT INTO `lucky_area` VALUES ('1538', '1501', '抚顺市');
INSERT INTO `lucky_area` VALUES ('1539', '1538', '市辖区');
INSERT INTO `lucky_area` VALUES ('1540', '1538', '新抚区');
INSERT INTO `lucky_area` VALUES ('1541', '1538', '东洲区');
INSERT INTO `lucky_area` VALUES ('1542', '1538', '望花区');
INSERT INTO `lucky_area` VALUES ('1543', '1538', '顺城区');
INSERT INTO `lucky_area` VALUES ('1544', '1538', '抚顺县');
INSERT INTO `lucky_area` VALUES ('1545', '1538', '新宾满族自治县');
INSERT INTO `lucky_area` VALUES ('1546', '1538', '清原满族自治县');
INSERT INTO `lucky_area` VALUES ('1547', '1501', '本溪市');
INSERT INTO `lucky_area` VALUES ('1548', '1547', '市辖区');
INSERT INTO `lucky_area` VALUES ('1549', '1547', '平山区');
INSERT INTO `lucky_area` VALUES ('1550', '1547', '溪湖区');
INSERT INTO `lucky_area` VALUES ('1551', '1547', '明山区');
INSERT INTO `lucky_area` VALUES ('1552', '1547', '南芬区');
INSERT INTO `lucky_area` VALUES ('1553', '1547', '本溪满族自治县');
INSERT INTO `lucky_area` VALUES ('1554', '1547', '桓仁满族自治县');
INSERT INTO `lucky_area` VALUES ('1555', '1501', '丹东市');
INSERT INTO `lucky_area` VALUES ('1556', '1555', '市辖区');
INSERT INTO `lucky_area` VALUES ('1557', '1555', '元宝区');
INSERT INTO `lucky_area` VALUES ('1558', '1555', '振兴区');
INSERT INTO `lucky_area` VALUES ('1559', '1555', '振安区');
INSERT INTO `lucky_area` VALUES ('1560', '1555', '宽甸满族自治县');
INSERT INTO `lucky_area` VALUES ('1561', '1555', '东港市');
INSERT INTO `lucky_area` VALUES ('1562', '1555', '凤城市');
INSERT INTO `lucky_area` VALUES ('1563', '1501', '锦州市');
INSERT INTO `lucky_area` VALUES ('1564', '1563', '市辖区');
INSERT INTO `lucky_area` VALUES ('1565', '1563', '古塔区');
INSERT INTO `lucky_area` VALUES ('1566', '1563', '凌河区');
INSERT INTO `lucky_area` VALUES ('1567', '1563', '太和区');
INSERT INTO `lucky_area` VALUES ('1568', '1563', '黑山县');
INSERT INTO `lucky_area` VALUES ('1569', '1563', '义县');
INSERT INTO `lucky_area` VALUES ('1570', '1563', '凌海市');
INSERT INTO `lucky_area` VALUES ('1571', '1563', '北宁市');
INSERT INTO `lucky_area` VALUES ('1572', '1501', '营口市');
INSERT INTO `lucky_area` VALUES ('1573', '1572', '市辖区');
INSERT INTO `lucky_area` VALUES ('1574', '1572', '站前区');
INSERT INTO `lucky_area` VALUES ('1575', '1572', '西市区');
INSERT INTO `lucky_area` VALUES ('1576', '1572', '鲅鱼圈区');
INSERT INTO `lucky_area` VALUES ('1577', '1572', '老边区');
INSERT INTO `lucky_area` VALUES ('1578', '1572', '盖州市');
INSERT INTO `lucky_area` VALUES ('1579', '1572', '大石桥市');
INSERT INTO `lucky_area` VALUES ('1580', '1501', '阜新市');
INSERT INTO `lucky_area` VALUES ('1581', '1580', '市辖区');
INSERT INTO `lucky_area` VALUES ('1582', '1580', '海州区');
INSERT INTO `lucky_area` VALUES ('1583', '1580', '新邱区');
INSERT INTO `lucky_area` VALUES ('1584', '1580', '太平区');
INSERT INTO `lucky_area` VALUES ('1585', '1580', '清河门区');
INSERT INTO `lucky_area` VALUES ('1586', '1580', '细河区');
INSERT INTO `lucky_area` VALUES ('1587', '1580', '阜新蒙古族自治县');
INSERT INTO `lucky_area` VALUES ('1588', '1580', '彰武县');
INSERT INTO `lucky_area` VALUES ('1589', '1501', '辽阳市');
INSERT INTO `lucky_area` VALUES ('1590', '1589', '市辖区');
INSERT INTO `lucky_area` VALUES ('1591', '1589', '白塔区');
INSERT INTO `lucky_area` VALUES ('1592', '1589', '文圣区');
INSERT INTO `lucky_area` VALUES ('1593', '1589', '宏伟区');
INSERT INTO `lucky_area` VALUES ('1594', '1589', '弓长岭区');
INSERT INTO `lucky_area` VALUES ('1595', '1589', '太子河区');
INSERT INTO `lucky_area` VALUES ('1596', '1589', '辽阳县');
INSERT INTO `lucky_area` VALUES ('1597', '1589', '灯塔市');
INSERT INTO `lucky_area` VALUES ('1598', '1501', '盘锦市');
INSERT INTO `lucky_area` VALUES ('1599', '1598', '市辖区');
INSERT INTO `lucky_area` VALUES ('1600', '1598', '双台子区');
INSERT INTO `lucky_area` VALUES ('1601', '1598', '兴隆台区');
INSERT INTO `lucky_area` VALUES ('1602', '1598', '大洼县');
INSERT INTO `lucky_area` VALUES ('1603', '1598', '盘山县');
INSERT INTO `lucky_area` VALUES ('1604', '1501', '铁岭市');
INSERT INTO `lucky_area` VALUES ('1605', '1604', '市辖区');
INSERT INTO `lucky_area` VALUES ('1606', '1604', '银州区');
INSERT INTO `lucky_area` VALUES ('1607', '1604', '清河区');
INSERT INTO `lucky_area` VALUES ('1608', '1604', '铁岭县');
INSERT INTO `lucky_area` VALUES ('1609', '1604', '西丰县');
INSERT INTO `lucky_area` VALUES ('1610', '1604', '昌图县');
INSERT INTO `lucky_area` VALUES ('1611', '1604', '调兵山市');
INSERT INTO `lucky_area` VALUES ('1612', '1604', '开原市');
INSERT INTO `lucky_area` VALUES ('1613', '1501', '朝阳市');
INSERT INTO `lucky_area` VALUES ('1614', '1613', '市辖区');
INSERT INTO `lucky_area` VALUES ('1615', '1613', '双塔区');
INSERT INTO `lucky_area` VALUES ('1616', '1613', '龙城区');
INSERT INTO `lucky_area` VALUES ('1617', '1613', '朝阳县');
INSERT INTO `lucky_area` VALUES ('1618', '1613', '建平县');
INSERT INTO `lucky_area` VALUES ('1619', '1613', '喀喇沁左翼蒙古族自治县');
INSERT INTO `lucky_area` VALUES ('1620', '1613', '北票市');
INSERT INTO `lucky_area` VALUES ('1621', '1613', '凌源市');
INSERT INTO `lucky_area` VALUES ('1622', '1501', '葫芦岛市');
INSERT INTO `lucky_area` VALUES ('1623', '1622', '市辖区');
INSERT INTO `lucky_area` VALUES ('1624', '1622', '连山区');
INSERT INTO `lucky_area` VALUES ('1625', '1622', '龙港区');
INSERT INTO `lucky_area` VALUES ('1626', '1622', '南票区');
INSERT INTO `lucky_area` VALUES ('1627', '1622', '绥中县');
INSERT INTO `lucky_area` VALUES ('1628', '1622', '建昌县');
INSERT INTO `lucky_area` VALUES ('1629', '1622', '兴城市');
INSERT INTO `lucky_area` VALUES ('1630', '0', '吉林省');
INSERT INTO `lucky_area` VALUES ('1631', '1630', '长春市');
INSERT INTO `lucky_area` VALUES ('1632', '1631', '市辖区');
INSERT INTO `lucky_area` VALUES ('1633', '1631', '南关区');
INSERT INTO `lucky_area` VALUES ('1634', '1631', '宽城区');
INSERT INTO `lucky_area` VALUES ('1635', '1631', '朝阳区');
INSERT INTO `lucky_area` VALUES ('1636', '1631', '二道区');
INSERT INTO `lucky_area` VALUES ('1637', '1631', '绿园区');
INSERT INTO `lucky_area` VALUES ('1638', '1631', '双阳区');
INSERT INTO `lucky_area` VALUES ('1639', '1631', '农安县');
INSERT INTO `lucky_area` VALUES ('1640', '1631', '九台市');
INSERT INTO `lucky_area` VALUES ('1641', '1631', '榆树市');
INSERT INTO `lucky_area` VALUES ('1642', '1631', '德惠市');
INSERT INTO `lucky_area` VALUES ('1643', '1630', '吉林市');
INSERT INTO `lucky_area` VALUES ('1644', '1643', '市辖区');
INSERT INTO `lucky_area` VALUES ('1645', '1643', '昌邑区');
INSERT INTO `lucky_area` VALUES ('1646', '1643', '龙潭区');
INSERT INTO `lucky_area` VALUES ('1647', '1643', '船营区');
INSERT INTO `lucky_area` VALUES ('1648', '1643', '丰满区');
INSERT INTO `lucky_area` VALUES ('1649', '1643', '永吉县');
INSERT INTO `lucky_area` VALUES ('1650', '1643', '蛟河市');
INSERT INTO `lucky_area` VALUES ('1651', '1643', '桦甸市');
INSERT INTO `lucky_area` VALUES ('1652', '1643', '舒兰市');
INSERT INTO `lucky_area` VALUES ('1653', '1643', '磐石市');
INSERT INTO `lucky_area` VALUES ('1654', '1630', '四平市');
INSERT INTO `lucky_area` VALUES ('1655', '1654', '市辖区');
INSERT INTO `lucky_area` VALUES ('1656', '1654', '铁西区');
INSERT INTO `lucky_area` VALUES ('1657', '1654', '铁东区');
INSERT INTO `lucky_area` VALUES ('1658', '1654', '梨树县');
INSERT INTO `lucky_area` VALUES ('1659', '1654', '伊通满族自治县');
INSERT INTO `lucky_area` VALUES ('1660', '1654', '公主岭市');
INSERT INTO `lucky_area` VALUES ('1661', '1654', '双辽市');
INSERT INTO `lucky_area` VALUES ('1662', '1630', '辽源市');
INSERT INTO `lucky_area` VALUES ('1663', '1662', '市辖区');
INSERT INTO `lucky_area` VALUES ('1664', '1662', '龙山区');
INSERT INTO `lucky_area` VALUES ('1665', '1662', '西安区');
INSERT INTO `lucky_area` VALUES ('1666', '1662', '东丰县');
INSERT INTO `lucky_area` VALUES ('1667', '1662', '东辽县');
INSERT INTO `lucky_area` VALUES ('1668', '1630', '通化市');
INSERT INTO `lucky_area` VALUES ('1669', '1668', '市辖区');
INSERT INTO `lucky_area` VALUES ('1670', '1668', '东昌区');
INSERT INTO `lucky_area` VALUES ('1671', '1668', '二道江区');
INSERT INTO `lucky_area` VALUES ('1672', '1668', '通化县');
INSERT INTO `lucky_area` VALUES ('1673', '1668', '辉南县');
INSERT INTO `lucky_area` VALUES ('1674', '1668', '柳河县');
INSERT INTO `lucky_area` VALUES ('1675', '1668', '梅河口市');
INSERT INTO `lucky_area` VALUES ('1676', '1668', '集安市');
INSERT INTO `lucky_area` VALUES ('1677', '1630', '白山市');
INSERT INTO `lucky_area` VALUES ('1678', '1677', '市辖区');
INSERT INTO `lucky_area` VALUES ('1679', '1677', '八道江区');
INSERT INTO `lucky_area` VALUES ('1680', '1677', '抚松县');
INSERT INTO `lucky_area` VALUES ('1681', '1677', '靖宇县');
INSERT INTO `lucky_area` VALUES ('1682', '1677', '长白朝鲜族自治县');
INSERT INTO `lucky_area` VALUES ('1683', '1677', '江源县');
INSERT INTO `lucky_area` VALUES ('1684', '1677', '临江市');
INSERT INTO `lucky_area` VALUES ('1685', '1630', '松原市');
INSERT INTO `lucky_area` VALUES ('1686', '1685', '市辖区');
INSERT INTO `lucky_area` VALUES ('1687', '1685', '宁江区');
INSERT INTO `lucky_area` VALUES ('1688', '1685', '前郭尔罗斯蒙古族自治县');
INSERT INTO `lucky_area` VALUES ('1689', '1685', '长岭县');
INSERT INTO `lucky_area` VALUES ('1690', '1685', '乾安县');
INSERT INTO `lucky_area` VALUES ('1691', '1685', '扶余县');
INSERT INTO `lucky_area` VALUES ('1692', '1630', '白城市');
INSERT INTO `lucky_area` VALUES ('1693', '1692', '市辖区');
INSERT INTO `lucky_area` VALUES ('1694', '1692', '洮北区');
INSERT INTO `lucky_area` VALUES ('1695', '1692', '镇赉县');
INSERT INTO `lucky_area` VALUES ('1696', '1692', '通榆县');
INSERT INTO `lucky_area` VALUES ('1697', '1692', '洮南市');
INSERT INTO `lucky_area` VALUES ('1698', '1692', '大安市');
INSERT INTO `lucky_area` VALUES ('1699', '1630', '延边朝鲜族自治州');
INSERT INTO `lucky_area` VALUES ('1700', '1699', '延吉市');
INSERT INTO `lucky_area` VALUES ('1701', '1699', '图们市');
INSERT INTO `lucky_area` VALUES ('1702', '1699', '敦化市');
INSERT INTO `lucky_area` VALUES ('1703', '1699', '珲春市');
INSERT INTO `lucky_area` VALUES ('1704', '1699', '龙井市');
INSERT INTO `lucky_area` VALUES ('1705', '1699', '和龙市');
INSERT INTO `lucky_area` VALUES ('1706', '1699', '汪清县');
INSERT INTO `lucky_area` VALUES ('1707', '1699', '安图县');
INSERT INTO `lucky_area` VALUES ('1708', '0', '黑龙江省');
INSERT INTO `lucky_area` VALUES ('1709', '1708', '哈尔滨市');
INSERT INTO `lucky_area` VALUES ('1710', '1709', '市辖区');
INSERT INTO `lucky_area` VALUES ('1711', '1709', '道里区');
INSERT INTO `lucky_area` VALUES ('1712', '1709', '南岗区');
INSERT INTO `lucky_area` VALUES ('1713', '1709', '道外区');
INSERT INTO `lucky_area` VALUES ('1714', '1709', '香坊区');
INSERT INTO `lucky_area` VALUES ('1715', '1709', '动力区');
INSERT INTO `lucky_area` VALUES ('1716', '1709', '平房区');
INSERT INTO `lucky_area` VALUES ('1717', '1709', '松北区');
INSERT INTO `lucky_area` VALUES ('1718', '1709', '呼兰区');
INSERT INTO `lucky_area` VALUES ('1719', '1709', '依兰县');
INSERT INTO `lucky_area` VALUES ('1720', '1709', '方正县');
INSERT INTO `lucky_area` VALUES ('1721', '1709', '宾县');
INSERT INTO `lucky_area` VALUES ('1722', '1709', '巴彦县');
INSERT INTO `lucky_area` VALUES ('1723', '1709', '木兰县');
INSERT INTO `lucky_area` VALUES ('1724', '1709', '通河县');
INSERT INTO `lucky_area` VALUES ('1725', '1709', '延寿县');
INSERT INTO `lucky_area` VALUES ('1726', '1709', '阿城市');
INSERT INTO `lucky_area` VALUES ('1727', '1709', '双城市');
INSERT INTO `lucky_area` VALUES ('1728', '1709', '尚志市');
INSERT INTO `lucky_area` VALUES ('1729', '1709', '五常市');
INSERT INTO `lucky_area` VALUES ('1730', '1708', '齐齐哈尔市');
INSERT INTO `lucky_area` VALUES ('1731', '1730', '市辖区');
INSERT INTO `lucky_area` VALUES ('1732', '1730', '龙沙区');
INSERT INTO `lucky_area` VALUES ('1733', '1730', '建华区');
INSERT INTO `lucky_area` VALUES ('1734', '1730', '铁锋区');
INSERT INTO `lucky_area` VALUES ('1735', '1730', '昂昂溪区');
INSERT INTO `lucky_area` VALUES ('1736', '1730', '富拉尔基区');
INSERT INTO `lucky_area` VALUES ('1737', '1730', '碾子山区');
INSERT INTO `lucky_area` VALUES ('1738', '1730', '梅里斯达斡尔族区');
INSERT INTO `lucky_area` VALUES ('1739', '1730', '龙江县');
INSERT INTO `lucky_area` VALUES ('1740', '1730', '依安县');
INSERT INTO `lucky_area` VALUES ('1741', '1730', '泰来县');
INSERT INTO `lucky_area` VALUES ('1742', '1730', '甘南县');
INSERT INTO `lucky_area` VALUES ('1743', '1730', '富裕县');
INSERT INTO `lucky_area` VALUES ('1744', '1730', '克山县');
INSERT INTO `lucky_area` VALUES ('1745', '1730', '克东县');
INSERT INTO `lucky_area` VALUES ('1746', '1730', '拜泉县');
INSERT INTO `lucky_area` VALUES ('1747', '1730', '讷河市');
INSERT INTO `lucky_area` VALUES ('1748', '1708', '鸡西市');
INSERT INTO `lucky_area` VALUES ('1749', '1748', '市辖区');
INSERT INTO `lucky_area` VALUES ('1750', '1748', '鸡冠区');
INSERT INTO `lucky_area` VALUES ('1751', '1748', '恒山区');
INSERT INTO `lucky_area` VALUES ('1752', '1748', '滴道区');
INSERT INTO `lucky_area` VALUES ('1753', '1748', '梨树区');
INSERT INTO `lucky_area` VALUES ('1754', '1748', '城子河区');
INSERT INTO `lucky_area` VALUES ('1755', '1748', '麻山区');
INSERT INTO `lucky_area` VALUES ('1756', '1748', '鸡东县');
INSERT INTO `lucky_area` VALUES ('1757', '1748', '虎林市');
INSERT INTO `lucky_area` VALUES ('1758', '1748', '密山市');
INSERT INTO `lucky_area` VALUES ('1759', '1708', '鹤岗市');
INSERT INTO `lucky_area` VALUES ('1760', '1759', '市辖区');
INSERT INTO `lucky_area` VALUES ('1761', '1759', '向阳区');
INSERT INTO `lucky_area` VALUES ('1762', '1759', '工农区');
INSERT INTO `lucky_area` VALUES ('1763', '1759', '南山区');
INSERT INTO `lucky_area` VALUES ('1764', '1759', '兴安区');
INSERT INTO `lucky_area` VALUES ('1765', '1759', '东山区');
INSERT INTO `lucky_area` VALUES ('1766', '1759', '兴山区');
INSERT INTO `lucky_area` VALUES ('1767', '1759', '萝北县');
INSERT INTO `lucky_area` VALUES ('1768', '1759', '绥滨县');
INSERT INTO `lucky_area` VALUES ('1769', '1708', '双鸭山市');
INSERT INTO `lucky_area` VALUES ('1770', '1769', '市辖区');
INSERT INTO `lucky_area` VALUES ('1771', '1769', '尖山区');
INSERT INTO `lucky_area` VALUES ('1772', '1769', '岭东区');
INSERT INTO `lucky_area` VALUES ('1773', '1769', '四方台区');
INSERT INTO `lucky_area` VALUES ('1774', '1769', '宝山区');
INSERT INTO `lucky_area` VALUES ('1775', '1769', '集贤县');
INSERT INTO `lucky_area` VALUES ('1776', '1769', '友谊县');
INSERT INTO `lucky_area` VALUES ('1777', '1769', '宝清县');
INSERT INTO `lucky_area` VALUES ('1778', '1769', '饶河县');
INSERT INTO `lucky_area` VALUES ('1779', '1708', '大庆市');
INSERT INTO `lucky_area` VALUES ('1780', '1779', '市辖区');
INSERT INTO `lucky_area` VALUES ('1781', '1779', '萨尔图区');
INSERT INTO `lucky_area` VALUES ('1782', '1779', '龙凤区');
INSERT INTO `lucky_area` VALUES ('1783', '1779', '让胡路区');
INSERT INTO `lucky_area` VALUES ('1784', '1779', '红岗区');
INSERT INTO `lucky_area` VALUES ('1785', '1779', '大同区');
INSERT INTO `lucky_area` VALUES ('1786', '1779', '肇州县');
INSERT INTO `lucky_area` VALUES ('1787', '1779', '肇源县');
INSERT INTO `lucky_area` VALUES ('1788', '1779', '林甸县');
INSERT INTO `lucky_area` VALUES ('1789', '1779', '杜尔伯特蒙古族自治县');
INSERT INTO `lucky_area` VALUES ('1790', '1708', '伊春市');
INSERT INTO `lucky_area` VALUES ('1791', '1790', '市辖区');
INSERT INTO `lucky_area` VALUES ('1792', '1790', '伊春区');
INSERT INTO `lucky_area` VALUES ('1793', '1790', '南岔区');
INSERT INTO `lucky_area` VALUES ('1794', '1790', '友好区');
INSERT INTO `lucky_area` VALUES ('1795', '1790', '西林区');
INSERT INTO `lucky_area` VALUES ('1796', '1790', '翠峦区');
INSERT INTO `lucky_area` VALUES ('1797', '1790', '新青区');
INSERT INTO `lucky_area` VALUES ('1798', '1790', '美溪区');
INSERT INTO `lucky_area` VALUES ('1799', '1790', '金山屯区');
INSERT INTO `lucky_area` VALUES ('1800', '1790', '五营区');
INSERT INTO `lucky_area` VALUES ('1801', '1790', '乌马河区');
INSERT INTO `lucky_area` VALUES ('1802', '1790', '汤旺河区');
INSERT INTO `lucky_area` VALUES ('1803', '1790', '带岭区');
INSERT INTO `lucky_area` VALUES ('1804', '1790', '乌伊岭区');
INSERT INTO `lucky_area` VALUES ('1805', '1790', '红星区');
INSERT INTO `lucky_area` VALUES ('1806', '1790', '上甘岭区');
INSERT INTO `lucky_area` VALUES ('1807', '1790', '嘉荫县');
INSERT INTO `lucky_area` VALUES ('1808', '1790', '铁力市');
INSERT INTO `lucky_area` VALUES ('1809', '1708', '佳木斯市');
INSERT INTO `lucky_area` VALUES ('1810', '1809', '市辖区');
INSERT INTO `lucky_area` VALUES ('1811', '1809', '永红区');
INSERT INTO `lucky_area` VALUES ('1812', '1809', '向阳区');
INSERT INTO `lucky_area` VALUES ('1813', '1809', '前进区');
INSERT INTO `lucky_area` VALUES ('1814', '1809', '东风区');
INSERT INTO `lucky_area` VALUES ('1815', '1809', '郊区');
INSERT INTO `lucky_area` VALUES ('1816', '1809', '桦南县');
INSERT INTO `lucky_area` VALUES ('1817', '1809', '桦川县');
INSERT INTO `lucky_area` VALUES ('1818', '1809', '汤原县');
INSERT INTO `lucky_area` VALUES ('1819', '1809', '抚远县');
INSERT INTO `lucky_area` VALUES ('1820', '1809', '同江市');
INSERT INTO `lucky_area` VALUES ('1821', '1809', '富锦市');
INSERT INTO `lucky_area` VALUES ('1822', '1708', '七台河市');
INSERT INTO `lucky_area` VALUES ('1823', '1822', '市辖区');
INSERT INTO `lucky_area` VALUES ('1824', '1822', '新兴区');
INSERT INTO `lucky_area` VALUES ('1825', '1822', '桃山区');
INSERT INTO `lucky_area` VALUES ('1826', '1822', '茄子河区');
INSERT INTO `lucky_area` VALUES ('1827', '1822', '勃利县');
INSERT INTO `lucky_area` VALUES ('1828', '1708', '牡丹江市');
INSERT INTO `lucky_area` VALUES ('1829', '1828', '市辖区');
INSERT INTO `lucky_area` VALUES ('1830', '1828', '东安区');
INSERT INTO `lucky_area` VALUES ('1831', '1828', '阳明区');
INSERT INTO `lucky_area` VALUES ('1832', '1828', '爱民区');
INSERT INTO `lucky_area` VALUES ('1833', '1828', '西安区');
INSERT INTO `lucky_area` VALUES ('1834', '1828', '东宁县');
INSERT INTO `lucky_area` VALUES ('1835', '1828', '林口县');
INSERT INTO `lucky_area` VALUES ('1836', '1828', '绥芬河市');
INSERT INTO `lucky_area` VALUES ('1837', '1828', '海林市');
INSERT INTO `lucky_area` VALUES ('1838', '1828', '宁安市');
INSERT INTO `lucky_area` VALUES ('1839', '1828', '穆棱市');
INSERT INTO `lucky_area` VALUES ('1840', '1708', '黑河市');
INSERT INTO `lucky_area` VALUES ('1841', '1840', '市辖区');
INSERT INTO `lucky_area` VALUES ('1842', '1840', '爱辉区');
INSERT INTO `lucky_area` VALUES ('1843', '1840', '嫩江县');
INSERT INTO `lucky_area` VALUES ('1844', '1840', '逊克县');
INSERT INTO `lucky_area` VALUES ('1845', '1840', '孙吴县');
INSERT INTO `lucky_area` VALUES ('1846', '1840', '北安市');
INSERT INTO `lucky_area` VALUES ('1847', '1840', '五大连池市');
INSERT INTO `lucky_area` VALUES ('1848', '1708', '绥化市');
INSERT INTO `lucky_area` VALUES ('1849', '1848', '市辖区');
INSERT INTO `lucky_area` VALUES ('1850', '1848', '北林区');
INSERT INTO `lucky_area` VALUES ('1851', '1848', '望奎县');
INSERT INTO `lucky_area` VALUES ('1852', '1848', '兰西县');
INSERT INTO `lucky_area` VALUES ('1853', '1848', '青冈县');
INSERT INTO `lucky_area` VALUES ('1854', '1848', '庆安县');
INSERT INTO `lucky_area` VALUES ('1855', '1848', '明水县');
INSERT INTO `lucky_area` VALUES ('1856', '1848', '绥棱县');
INSERT INTO `lucky_area` VALUES ('1857', '1848', '安达市');
INSERT INTO `lucky_area` VALUES ('1858', '1848', '肇东市');
INSERT INTO `lucky_area` VALUES ('1859', '1848', '海伦市');
INSERT INTO `lucky_area` VALUES ('1860', '1708', '大兴安岭地区');
INSERT INTO `lucky_area` VALUES ('1861', '1860', '呼玛县');
INSERT INTO `lucky_area` VALUES ('1862', '1860', '塔河县');
INSERT INTO `lucky_area` VALUES ('1863', '1860', '漠河县');
INSERT INTO `lucky_area` VALUES ('1864', '0', '上海市');
INSERT INTO `lucky_area` VALUES ('1865', '1864', '市辖区');
INSERT INTO `lucky_area` VALUES ('1866', '1865', '黄浦区');
INSERT INTO `lucky_area` VALUES ('1867', '1865', '卢湾区');
INSERT INTO `lucky_area` VALUES ('1868', '1865', '徐汇区');
INSERT INTO `lucky_area` VALUES ('1869', '1865', '长宁区');
INSERT INTO `lucky_area` VALUES ('1870', '1865', '静安区');
INSERT INTO `lucky_area` VALUES ('1871', '1865', '普陀区');
INSERT INTO `lucky_area` VALUES ('1872', '1865', '闸北区');
INSERT INTO `lucky_area` VALUES ('1873', '1865', '虹口区');
INSERT INTO `lucky_area` VALUES ('1874', '1865', '杨浦区');
INSERT INTO `lucky_area` VALUES ('1875', '1865', '闵行区');
INSERT INTO `lucky_area` VALUES ('1876', '1865', '宝山区');
INSERT INTO `lucky_area` VALUES ('1877', '1865', '嘉定区');
INSERT INTO `lucky_area` VALUES ('1878', '1865', '浦东新区');
INSERT INTO `lucky_area` VALUES ('1879', '1865', '金山区');
INSERT INTO `lucky_area` VALUES ('1880', '1865', '松江区');
INSERT INTO `lucky_area` VALUES ('1881', '1865', '青浦区');
INSERT INTO `lucky_area` VALUES ('1882', '1865', '南汇区');
INSERT INTO `lucky_area` VALUES ('1883', '1865', '奉贤区');
INSERT INTO `lucky_area` VALUES ('1884', '1864', '市辖县');
INSERT INTO `lucky_area` VALUES ('1885', '1884', '崇明县');
INSERT INTO `lucky_area` VALUES ('1886', '0', '江苏省');
INSERT INTO `lucky_area` VALUES ('1887', '1886', '南京市');
INSERT INTO `lucky_area` VALUES ('1888', '1887', '市辖区');
INSERT INTO `lucky_area` VALUES ('1889', '1887', '玄武区');
INSERT INTO `lucky_area` VALUES ('1890', '1887', '白下区');
INSERT INTO `lucky_area` VALUES ('1891', '1887', '秦淮区');
INSERT INTO `lucky_area` VALUES ('1892', '1887', '建邺区');
INSERT INTO `lucky_area` VALUES ('1893', '1887', '鼓楼区');
INSERT INTO `lucky_area` VALUES ('1894', '1887', '下关区');
INSERT INTO `lucky_area` VALUES ('1895', '1887', '浦口区');
INSERT INTO `lucky_area` VALUES ('1896', '1887', '栖霞区');
INSERT INTO `lucky_area` VALUES ('1897', '1887', '雨花台区');
INSERT INTO `lucky_area` VALUES ('1898', '1887', '江宁区');
INSERT INTO `lucky_area` VALUES ('1899', '1887', '六合区');
INSERT INTO `lucky_area` VALUES ('1900', '1887', '溧水县');
INSERT INTO `lucky_area` VALUES ('1901', '1887', '高淳县');
INSERT INTO `lucky_area` VALUES ('1902', '1886', '无锡市');
INSERT INTO `lucky_area` VALUES ('1903', '1902', '市辖区');
INSERT INTO `lucky_area` VALUES ('1904', '1902', '崇安区');
INSERT INTO `lucky_area` VALUES ('1905', '1902', '南长区');
INSERT INTO `lucky_area` VALUES ('1906', '1902', '北塘区');
INSERT INTO `lucky_area` VALUES ('1907', '1902', '锡山区');
INSERT INTO `lucky_area` VALUES ('1908', '1902', '惠山区');
INSERT INTO `lucky_area` VALUES ('1909', '1902', '滨湖区');
INSERT INTO `lucky_area` VALUES ('1910', '1902', '江阴市');
INSERT INTO `lucky_area` VALUES ('1911', '1902', '宜兴市');
INSERT INTO `lucky_area` VALUES ('1912', '1886', '徐州市');
INSERT INTO `lucky_area` VALUES ('1913', '1912', '市辖区');
INSERT INTO `lucky_area` VALUES ('1914', '1912', '鼓楼区');
INSERT INTO `lucky_area` VALUES ('1915', '1912', '云龙区');
INSERT INTO `lucky_area` VALUES ('1916', '1912', '九里区');
INSERT INTO `lucky_area` VALUES ('1917', '1912', '贾汪区');
INSERT INTO `lucky_area` VALUES ('1918', '1912', '泉山区');
INSERT INTO `lucky_area` VALUES ('1919', '1912', '丰县');
INSERT INTO `lucky_area` VALUES ('1920', '1912', '沛县');
INSERT INTO `lucky_area` VALUES ('1921', '1912', '铜山县');
INSERT INTO `lucky_area` VALUES ('1922', '1912', '睢宁县');
INSERT INTO `lucky_area` VALUES ('1923', '1912', '新沂市');
INSERT INTO `lucky_area` VALUES ('1924', '1912', '邳州市');
INSERT INTO `lucky_area` VALUES ('1925', '1886', '常州市');
INSERT INTO `lucky_area` VALUES ('1926', '1925', '市辖区');
INSERT INTO `lucky_area` VALUES ('1927', '1925', '天宁区');
INSERT INTO `lucky_area` VALUES ('1928', '1925', '钟楼区');
INSERT INTO `lucky_area` VALUES ('1929', '1925', '戚墅堰区');
INSERT INTO `lucky_area` VALUES ('1930', '1925', '新北区');
INSERT INTO `lucky_area` VALUES ('1931', '1925', '武进区');
INSERT INTO `lucky_area` VALUES ('1932', '1925', '溧阳市');
INSERT INTO `lucky_area` VALUES ('1933', '1925', '金坛市');
INSERT INTO `lucky_area` VALUES ('1934', '1886', '苏州市');
INSERT INTO `lucky_area` VALUES ('1935', '1934', '市辖区');
INSERT INTO `lucky_area` VALUES ('1936', '1934', '沧浪区');
INSERT INTO `lucky_area` VALUES ('1937', '1934', '平江区');
INSERT INTO `lucky_area` VALUES ('1938', '1934', '金阊区');
INSERT INTO `lucky_area` VALUES ('1939', '1934', '虎丘区');
INSERT INTO `lucky_area` VALUES ('1940', '1934', '吴中区');
INSERT INTO `lucky_area` VALUES ('1941', '1934', '相城区');
INSERT INTO `lucky_area` VALUES ('1942', '1934', '常熟市');
INSERT INTO `lucky_area` VALUES ('1943', '1934', '张家港市');
INSERT INTO `lucky_area` VALUES ('1944', '1934', '昆山市');
INSERT INTO `lucky_area` VALUES ('1945', '1934', '吴江市');
INSERT INTO `lucky_area` VALUES ('1946', '1934', '太仓市');
INSERT INTO `lucky_area` VALUES ('1947', '1886', '南通市');
INSERT INTO `lucky_area` VALUES ('1948', '1947', '市辖区');
INSERT INTO `lucky_area` VALUES ('1949', '1947', '崇川区');
INSERT INTO `lucky_area` VALUES ('1950', '1947', '港闸区');
INSERT INTO `lucky_area` VALUES ('1951', '1947', '海安县');
INSERT INTO `lucky_area` VALUES ('1952', '1947', '如东县');
INSERT INTO `lucky_area` VALUES ('1953', '1947', '启东市');
INSERT INTO `lucky_area` VALUES ('1954', '1947', '如皋市');
INSERT INTO `lucky_area` VALUES ('1955', '1947', '通州市');
INSERT INTO `lucky_area` VALUES ('1956', '1947', '海门市');
INSERT INTO `lucky_area` VALUES ('1957', '1886', '连云港市');
INSERT INTO `lucky_area` VALUES ('1958', '1957', '市辖区');
INSERT INTO `lucky_area` VALUES ('1959', '1957', '连云区');
INSERT INTO `lucky_area` VALUES ('1960', '1957', '新浦区');
INSERT INTO `lucky_area` VALUES ('1961', '1957', '海州区');
INSERT INTO `lucky_area` VALUES ('1962', '1957', '赣榆县');
INSERT INTO `lucky_area` VALUES ('1963', '1957', '东海县');
INSERT INTO `lucky_area` VALUES ('1964', '1957', '灌云县');
INSERT INTO `lucky_area` VALUES ('1965', '1957', '灌南县');
INSERT INTO `lucky_area` VALUES ('1966', '1886', '淮安市');
INSERT INTO `lucky_area` VALUES ('1967', '1966', '市辖区');
INSERT INTO `lucky_area` VALUES ('1968', '1966', '清河区');
INSERT INTO `lucky_area` VALUES ('1969', '1966', '楚州区');
INSERT INTO `lucky_area` VALUES ('1970', '1966', '淮阴区');
INSERT INTO `lucky_area` VALUES ('1971', '1966', '清浦区');
INSERT INTO `lucky_area` VALUES ('1972', '1966', '涟水县');
INSERT INTO `lucky_area` VALUES ('1973', '1966', '洪泽县');
INSERT INTO `lucky_area` VALUES ('1974', '1966', '盱眙县');
INSERT INTO `lucky_area` VALUES ('1975', '1966', '金湖县');
INSERT INTO `lucky_area` VALUES ('1976', '1886', '盐城市');
INSERT INTO `lucky_area` VALUES ('1977', '1976', '市辖区');
INSERT INTO `lucky_area` VALUES ('1978', '1976', '亭湖区');
INSERT INTO `lucky_area` VALUES ('1979', '1976', '盐都区');
INSERT INTO `lucky_area` VALUES ('1980', '1976', '响水县');
INSERT INTO `lucky_area` VALUES ('1981', '1976', '滨海县');
INSERT INTO `lucky_area` VALUES ('1982', '1976', '阜宁县');
INSERT INTO `lucky_area` VALUES ('1983', '1976', '射阳县');
INSERT INTO `lucky_area` VALUES ('1984', '1976', '建湖县');
INSERT INTO `lucky_area` VALUES ('1985', '1976', '东台市');
INSERT INTO `lucky_area` VALUES ('1986', '1976', '大丰市');
INSERT INTO `lucky_area` VALUES ('1987', '1886', '扬州市');
INSERT INTO `lucky_area` VALUES ('1988', '1987', '市辖区');
INSERT INTO `lucky_area` VALUES ('1989', '1987', '广陵区');
INSERT INTO `lucky_area` VALUES ('1990', '1987', '邗江区');
INSERT INTO `lucky_area` VALUES ('1991', '1987', '维扬区');
INSERT INTO `lucky_area` VALUES ('1992', '1987', '宝应县');
INSERT INTO `lucky_area` VALUES ('1993', '1987', '仪征市');
INSERT INTO `lucky_area` VALUES ('1994', '1987', '高邮市');
INSERT INTO `lucky_area` VALUES ('1995', '1987', '江都市');
INSERT INTO `lucky_area` VALUES ('1996', '1886', '镇江市');
INSERT INTO `lucky_area` VALUES ('1997', '1996', '市辖区');
INSERT INTO `lucky_area` VALUES ('1998', '1996', '京口区');
INSERT INTO `lucky_area` VALUES ('1999', '1996', '润州区');
INSERT INTO `lucky_area` VALUES ('2000', '1996', '丹徒区');
INSERT INTO `lucky_area` VALUES ('2001', '1996', '丹阳市');
INSERT INTO `lucky_area` VALUES ('2002', '1996', '扬中市');
INSERT INTO `lucky_area` VALUES ('2003', '1996', '句容市');
INSERT INTO `lucky_area` VALUES ('2004', '1886', '泰州市');
INSERT INTO `lucky_area` VALUES ('2005', '2004', '市辖区');
INSERT INTO `lucky_area` VALUES ('2006', '2004', '海陵区');
INSERT INTO `lucky_area` VALUES ('2007', '2004', '高港区');
INSERT INTO `lucky_area` VALUES ('2008', '2004', '兴化市');
INSERT INTO `lucky_area` VALUES ('2009', '2004', '靖江市');
INSERT INTO `lucky_area` VALUES ('2010', '2004', '泰兴市');
INSERT INTO `lucky_area` VALUES ('2011', '2004', '姜堰市');
INSERT INTO `lucky_area` VALUES ('2012', '1886', '宿迁市');
INSERT INTO `lucky_area` VALUES ('2013', '2012', '市辖区');
INSERT INTO `lucky_area` VALUES ('2014', '2012', '宿城区');
INSERT INTO `lucky_area` VALUES ('2015', '2012', '宿豫区');
INSERT INTO `lucky_area` VALUES ('2016', '2012', '沭阳县');
INSERT INTO `lucky_area` VALUES ('2017', '2012', '泗阳县');
INSERT INTO `lucky_area` VALUES ('2018', '2012', '泗洪县');
INSERT INTO `lucky_area` VALUES ('2019', '0', '浙江省');
INSERT INTO `lucky_area` VALUES ('2020', '2019', '杭州市');
INSERT INTO `lucky_area` VALUES ('2021', '2020', '市辖区');
INSERT INTO `lucky_area` VALUES ('2022', '2020', '上城区');
INSERT INTO `lucky_area` VALUES ('2023', '2020', '下城区');
INSERT INTO `lucky_area` VALUES ('2024', '2020', '江干区');
INSERT INTO `lucky_area` VALUES ('2025', '2020', '拱墅区');
INSERT INTO `lucky_area` VALUES ('2026', '2020', '西湖区');
INSERT INTO `lucky_area` VALUES ('2027', '2020', '滨江区');
INSERT INTO `lucky_area` VALUES ('2028', '2020', '萧山区');
INSERT INTO `lucky_area` VALUES ('2029', '2020', '余杭区');
INSERT INTO `lucky_area` VALUES ('2030', '2020', '桐庐县');
INSERT INTO `lucky_area` VALUES ('2031', '2020', '淳安县');
INSERT INTO `lucky_area` VALUES ('2032', '2020', '建德市');
INSERT INTO `lucky_area` VALUES ('2033', '2020', '富阳市');
INSERT INTO `lucky_area` VALUES ('2034', '2020', '临安市');
INSERT INTO `lucky_area` VALUES ('2035', '2019', '宁波市');
INSERT INTO `lucky_area` VALUES ('2036', '2035', '市辖区');
INSERT INTO `lucky_area` VALUES ('2037', '2035', '海曙区');
INSERT INTO `lucky_area` VALUES ('2038', '2035', '江东区');
INSERT INTO `lucky_area` VALUES ('2039', '2035', '江北区');
INSERT INTO `lucky_area` VALUES ('2040', '2035', '北仑区');
INSERT INTO `lucky_area` VALUES ('2041', '2035', '镇海区');
INSERT INTO `lucky_area` VALUES ('2042', '2035', '鄞州区');
INSERT INTO `lucky_area` VALUES ('2043', '2035', '象山县');
INSERT INTO `lucky_area` VALUES ('2044', '2035', '宁海县');
INSERT INTO `lucky_area` VALUES ('2045', '2035', '余姚市');
INSERT INTO `lucky_area` VALUES ('2046', '2035', '慈溪市');
INSERT INTO `lucky_area` VALUES ('2047', '2035', '奉化市');
INSERT INTO `lucky_area` VALUES ('2048', '2019', '温州市');
INSERT INTO `lucky_area` VALUES ('2049', '2048', '市辖区');
INSERT INTO `lucky_area` VALUES ('2050', '2048', '鹿城区');
INSERT INTO `lucky_area` VALUES ('2051', '2048', '龙湾区');
INSERT INTO `lucky_area` VALUES ('2052', '2048', '瓯海区');
INSERT INTO `lucky_area` VALUES ('2053', '2048', '洞头县');
INSERT INTO `lucky_area` VALUES ('2054', '2048', '永嘉县');
INSERT INTO `lucky_area` VALUES ('2055', '2048', '平阳县');
INSERT INTO `lucky_area` VALUES ('2056', '2048', '苍南县');
INSERT INTO `lucky_area` VALUES ('2057', '2048', '文成县');
INSERT INTO `lucky_area` VALUES ('2058', '2048', '泰顺县');
INSERT INTO `lucky_area` VALUES ('2059', '2048', '瑞安市');
INSERT INTO `lucky_area` VALUES ('2060', '2048', '乐清市');
INSERT INTO `lucky_area` VALUES ('2061', '2019', '嘉兴市');
INSERT INTO `lucky_area` VALUES ('2062', '2061', '市辖区');
INSERT INTO `lucky_area` VALUES ('2063', '2061', '秀城区');
INSERT INTO `lucky_area` VALUES ('2064', '2061', '秀洲区');
INSERT INTO `lucky_area` VALUES ('2065', '2061', '嘉善县');
INSERT INTO `lucky_area` VALUES ('2066', '2061', '海盐县');
INSERT INTO `lucky_area` VALUES ('2067', '2061', '海宁市');
INSERT INTO `lucky_area` VALUES ('2068', '2061', '平湖市');
INSERT INTO `lucky_area` VALUES ('2069', '2061', '桐乡市');
INSERT INTO `lucky_area` VALUES ('2070', '2019', '湖州市');
INSERT INTO `lucky_area` VALUES ('2071', '2070', '市辖区');
INSERT INTO `lucky_area` VALUES ('2072', '2070', '吴兴区');
INSERT INTO `lucky_area` VALUES ('2073', '2070', '南浔区');
INSERT INTO `lucky_area` VALUES ('2074', '2070', '德清县');
INSERT INTO `lucky_area` VALUES ('2075', '2070', '长兴县');
INSERT INTO `lucky_area` VALUES ('2076', '2070', '安吉县');
INSERT INTO `lucky_area` VALUES ('2077', '2019', '绍兴市');
INSERT INTO `lucky_area` VALUES ('2078', '2077', '市辖区');
INSERT INTO `lucky_area` VALUES ('2079', '2077', '越城区');
INSERT INTO `lucky_area` VALUES ('2080', '2077', '绍兴县');
INSERT INTO `lucky_area` VALUES ('2081', '2077', '新昌县');
INSERT INTO `lucky_area` VALUES ('2082', '2077', '诸暨市');
INSERT INTO `lucky_area` VALUES ('2083', '2077', '上虞市');
INSERT INTO `lucky_area` VALUES ('2084', '2077', '嵊州市');
INSERT INTO `lucky_area` VALUES ('2085', '2019', '金华市');
INSERT INTO `lucky_area` VALUES ('2086', '2085', '市辖区');
INSERT INTO `lucky_area` VALUES ('2087', '2085', '婺城区');
INSERT INTO `lucky_area` VALUES ('2088', '2085', '金东区');
INSERT INTO `lucky_area` VALUES ('2089', '2085', '武义县');
INSERT INTO `lucky_area` VALUES ('2090', '2085', '浦江县');
INSERT INTO `lucky_area` VALUES ('2091', '2085', '磐安县');
INSERT INTO `lucky_area` VALUES ('2092', '2085', '兰溪市');
INSERT INTO `lucky_area` VALUES ('2093', '2085', '义乌市');
INSERT INTO `lucky_area` VALUES ('2094', '2085', '东阳市');
INSERT INTO `lucky_area` VALUES ('2095', '2085', '永康市');
INSERT INTO `lucky_area` VALUES ('2096', '2019', '衢州市');
INSERT INTO `lucky_area` VALUES ('2097', '2096', '市辖区');
INSERT INTO `lucky_area` VALUES ('2098', '2096', '柯城区');
INSERT INTO `lucky_area` VALUES ('2099', '2096', '衢江区');
INSERT INTO `lucky_area` VALUES ('2100', '2096', '常山县');
INSERT INTO `lucky_area` VALUES ('2101', '2096', '开化县');
INSERT INTO `lucky_area` VALUES ('2102', '2096', '龙游县');
INSERT INTO `lucky_area` VALUES ('2103', '2096', '江山市');
INSERT INTO `lucky_area` VALUES ('2104', '2019', '舟山市');
INSERT INTO `lucky_area` VALUES ('2105', '2104', '市辖区');
INSERT INTO `lucky_area` VALUES ('2106', '2104', '定海区');
INSERT INTO `lucky_area` VALUES ('2107', '2104', '普陀区');
INSERT INTO `lucky_area` VALUES ('2108', '2104', '岱山县');
INSERT INTO `lucky_area` VALUES ('2109', '2104', '嵊泗县');
INSERT INTO `lucky_area` VALUES ('2110', '2019', '台州市');
INSERT INTO `lucky_area` VALUES ('2111', '2110', '市辖区');
INSERT INTO `lucky_area` VALUES ('2112', '2110', '椒江区');
INSERT INTO `lucky_area` VALUES ('2113', '2110', '黄岩区');
INSERT INTO `lucky_area` VALUES ('2114', '2110', '路桥区');
INSERT INTO `lucky_area` VALUES ('2115', '2110', '玉环县');
INSERT INTO `lucky_area` VALUES ('2116', '2110', '三门县');
INSERT INTO `lucky_area` VALUES ('2117', '2110', '天台县');
INSERT INTO `lucky_area` VALUES ('2118', '2110', '仙居县');
INSERT INTO `lucky_area` VALUES ('2119', '2110', '温岭市');
INSERT INTO `lucky_area` VALUES ('2120', '2110', '临海市');
INSERT INTO `lucky_area` VALUES ('2121', '2019', '丽水市');
INSERT INTO `lucky_area` VALUES ('2122', '2121', '市辖区');
INSERT INTO `lucky_area` VALUES ('2123', '2121', '莲都区');
INSERT INTO `lucky_area` VALUES ('2124', '2121', '青田县');
INSERT INTO `lucky_area` VALUES ('2125', '2121', '缙云县');
INSERT INTO `lucky_area` VALUES ('2126', '2121', '遂昌县');
INSERT INTO `lucky_area` VALUES ('2127', '2121', '松阳县');
INSERT INTO `lucky_area` VALUES ('2128', '2121', '云和县');
INSERT INTO `lucky_area` VALUES ('2129', '2121', '庆元县');
INSERT INTO `lucky_area` VALUES ('2130', '2121', '景宁畲族自治县');
INSERT INTO `lucky_area` VALUES ('2131', '2121', '龙泉市');
INSERT INTO `lucky_area` VALUES ('2132', '0', '安徽省');
INSERT INTO `lucky_area` VALUES ('2133', '2132', '合肥市');
INSERT INTO `lucky_area` VALUES ('2134', '2133', '市辖区');
INSERT INTO `lucky_area` VALUES ('2135', '2133', '瑶海区');
INSERT INTO `lucky_area` VALUES ('2136', '2133', '庐阳区');
INSERT INTO `lucky_area` VALUES ('2137', '2133', '蜀山区');
INSERT INTO `lucky_area` VALUES ('2138', '2133', '包河区');
INSERT INTO `lucky_area` VALUES ('2139', '2133', '长丰县');
INSERT INTO `lucky_area` VALUES ('2140', '2133', '肥东县');
INSERT INTO `lucky_area` VALUES ('2141', '2133', '肥西县');
INSERT INTO `lucky_area` VALUES ('2142', '2132', '芜湖市');
INSERT INTO `lucky_area` VALUES ('2143', '2142', '市辖区');
INSERT INTO `lucky_area` VALUES ('2144', '2142', '镜湖区');
INSERT INTO `lucky_area` VALUES ('2145', '2142', '弋江区');
INSERT INTO `lucky_area` VALUES ('2146', '2142', '鸠江区');
INSERT INTO `lucky_area` VALUES ('2147', '2142', '三山区');
INSERT INTO `lucky_area` VALUES ('2148', '2142', '芜湖县');
INSERT INTO `lucky_area` VALUES ('2149', '2142', '繁昌县');
INSERT INTO `lucky_area` VALUES ('2150', '2142', '南陵县');
INSERT INTO `lucky_area` VALUES ('2151', '2132', '蚌埠市');
INSERT INTO `lucky_area` VALUES ('2152', '2151', '市辖区');
INSERT INTO `lucky_area` VALUES ('2153', '2151', '龙子湖区');
INSERT INTO `lucky_area` VALUES ('2154', '2151', '蚌山区');
INSERT INTO `lucky_area` VALUES ('2155', '2151', '禹会区');
INSERT INTO `lucky_area` VALUES ('2156', '2151', '淮上区');
INSERT INTO `lucky_area` VALUES ('2157', '2151', '怀远县');
INSERT INTO `lucky_area` VALUES ('2158', '2151', '五河县');
INSERT INTO `lucky_area` VALUES ('2159', '2151', '固镇县');
INSERT INTO `lucky_area` VALUES ('2160', '2132', '淮南市');
INSERT INTO `lucky_area` VALUES ('2161', '2160', '市辖区');
INSERT INTO `lucky_area` VALUES ('2162', '2160', '大通区');
INSERT INTO `lucky_area` VALUES ('2163', '2160', '田家庵区');
INSERT INTO `lucky_area` VALUES ('2164', '2160', '谢家集区');
INSERT INTO `lucky_area` VALUES ('2165', '2160', '八公山区');
INSERT INTO `lucky_area` VALUES ('2166', '2160', '潘集区');
INSERT INTO `lucky_area` VALUES ('2167', '2160', '凤台县');
INSERT INTO `lucky_area` VALUES ('2168', '2132', '马鞍山市');
INSERT INTO `lucky_area` VALUES ('2169', '2168', '市辖区');
INSERT INTO `lucky_area` VALUES ('2170', '2168', '金家庄区');
INSERT INTO `lucky_area` VALUES ('2171', '2168', '花山区');
INSERT INTO `lucky_area` VALUES ('2172', '2168', '雨山区');
INSERT INTO `lucky_area` VALUES ('2173', '2168', '当涂县');
INSERT INTO `lucky_area` VALUES ('2174', '2132', '淮北市');
INSERT INTO `lucky_area` VALUES ('2175', '2174', '市辖区');
INSERT INTO `lucky_area` VALUES ('2176', '2174', '杜集区');
INSERT INTO `lucky_area` VALUES ('2177', '2174', '相山区');
INSERT INTO `lucky_area` VALUES ('2178', '2174', '烈山区');
INSERT INTO `lucky_area` VALUES ('2179', '2174', '濉溪县');
INSERT INTO `lucky_area` VALUES ('2180', '2132', '铜陵市');
INSERT INTO `lucky_area` VALUES ('2181', '2180', '市辖区');
INSERT INTO `lucky_area` VALUES ('2182', '2180', '铜官山区');
INSERT INTO `lucky_area` VALUES ('2183', '2180', '狮子山区');
INSERT INTO `lucky_area` VALUES ('2184', '2180', '郊区');
INSERT INTO `lucky_area` VALUES ('2185', '2180', '铜陵县');
INSERT INTO `lucky_area` VALUES ('2186', '2132', '安庆市');
INSERT INTO `lucky_area` VALUES ('2187', '2186', '市辖区');
INSERT INTO `lucky_area` VALUES ('2188', '2186', '迎江区');
INSERT INTO `lucky_area` VALUES ('2189', '2186', '大观区');
INSERT INTO `lucky_area` VALUES ('2190', '2186', '宜秀区');
INSERT INTO `lucky_area` VALUES ('2191', '2186', '怀宁县');
INSERT INTO `lucky_area` VALUES ('2192', '2186', '枞阳县');
INSERT INTO `lucky_area` VALUES ('2193', '2186', '潜山县');
INSERT INTO `lucky_area` VALUES ('2194', '2186', '太湖县');
INSERT INTO `lucky_area` VALUES ('2195', '2186', '宿松县');
INSERT INTO `lucky_area` VALUES ('2196', '2186', '望江县');
INSERT INTO `lucky_area` VALUES ('2197', '2186', '岳西县');
INSERT INTO `lucky_area` VALUES ('2198', '2186', '桐城市');
INSERT INTO `lucky_area` VALUES ('2199', '2132', '黄山市');
INSERT INTO `lucky_area` VALUES ('2200', '2199', '市辖区');
INSERT INTO `lucky_area` VALUES ('2201', '2199', '屯溪区');
INSERT INTO `lucky_area` VALUES ('2202', '2199', '黄山区');
INSERT INTO `lucky_area` VALUES ('2203', '2199', '徽州区');
INSERT INTO `lucky_area` VALUES ('2204', '2199', '歙县');
INSERT INTO `lucky_area` VALUES ('2205', '2199', '休宁县');
INSERT INTO `lucky_area` VALUES ('2206', '2199', '黟县');
INSERT INTO `lucky_area` VALUES ('2207', '2199', '祁门县');
INSERT INTO `lucky_area` VALUES ('2208', '2132', '滁州市');
INSERT INTO `lucky_area` VALUES ('2209', '2208', '市辖区');
INSERT INTO `lucky_area` VALUES ('2210', '2208', '琅琊区');
INSERT INTO `lucky_area` VALUES ('2211', '2208', '南谯区');
INSERT INTO `lucky_area` VALUES ('2212', '2208', '来安县');
INSERT INTO `lucky_area` VALUES ('2213', '2208', '全椒县');
INSERT INTO `lucky_area` VALUES ('2214', '2208', '定远县');
INSERT INTO `lucky_area` VALUES ('2215', '2208', '凤阳县');
INSERT INTO `lucky_area` VALUES ('2216', '2208', '天长市');
INSERT INTO `lucky_area` VALUES ('2217', '2208', '明光市');
INSERT INTO `lucky_area` VALUES ('2218', '2132', '阜阳市');
INSERT INTO `lucky_area` VALUES ('2219', '2218', '市辖区');
INSERT INTO `lucky_area` VALUES ('2220', '2218', '颍州区');
INSERT INTO `lucky_area` VALUES ('2221', '2218', '颍东区');
INSERT INTO `lucky_area` VALUES ('2222', '2218', '颍泉区');
INSERT INTO `lucky_area` VALUES ('2223', '2218', '临泉县');
INSERT INTO `lucky_area` VALUES ('2224', '2218', '太和县');
INSERT INTO `lucky_area` VALUES ('2225', '2218', '阜南县');
INSERT INTO `lucky_area` VALUES ('2226', '2218', '颍上县');
INSERT INTO `lucky_area` VALUES ('2227', '2218', '界首市');
INSERT INTO `lucky_area` VALUES ('2228', '2132', '宿州市');
INSERT INTO `lucky_area` VALUES ('2229', '2228', '市辖区');
INSERT INTO `lucky_area` VALUES ('2230', '2228', '埇桥区');
INSERT INTO `lucky_area` VALUES ('2231', '2228', '砀山县');
INSERT INTO `lucky_area` VALUES ('2232', '2228', '萧县');
INSERT INTO `lucky_area` VALUES ('2233', '2228', '灵璧县');
INSERT INTO `lucky_area` VALUES ('2234', '2228', '泗县');
INSERT INTO `lucky_area` VALUES ('2235', '2132', '巢湖市');
INSERT INTO `lucky_area` VALUES ('2236', '2235', '市辖区');
INSERT INTO `lucky_area` VALUES ('2237', '2235', '居巢区');
INSERT INTO `lucky_area` VALUES ('2238', '2235', '庐江县');
INSERT INTO `lucky_area` VALUES ('2239', '2235', '无为县');
INSERT INTO `lucky_area` VALUES ('2240', '2235', '含山县');
INSERT INTO `lucky_area` VALUES ('2241', '2235', '和县');
INSERT INTO `lucky_area` VALUES ('2242', '2132', '六安市');
INSERT INTO `lucky_area` VALUES ('2243', '2242', '市辖区');
INSERT INTO `lucky_area` VALUES ('2244', '2242', '金安区');
INSERT INTO `lucky_area` VALUES ('2245', '2242', '裕安区');
INSERT INTO `lucky_area` VALUES ('2246', '2242', '寿县');
INSERT INTO `lucky_area` VALUES ('2247', '2242', '霍邱县');
INSERT INTO `lucky_area` VALUES ('2248', '2242', '舒城县');
INSERT INTO `lucky_area` VALUES ('2249', '2242', '金寨县');
INSERT INTO `lucky_area` VALUES ('2250', '2242', '霍山县');
INSERT INTO `lucky_area` VALUES ('2251', '2132', '亳州市');
INSERT INTO `lucky_area` VALUES ('2252', '2251', '市辖区');
INSERT INTO `lucky_area` VALUES ('2253', '2251', '谯城区');
INSERT INTO `lucky_area` VALUES ('2254', '2251', '涡阳县');
INSERT INTO `lucky_area` VALUES ('2255', '2251', '蒙城县');
INSERT INTO `lucky_area` VALUES ('2256', '2251', '利辛县');
INSERT INTO `lucky_area` VALUES ('2257', '2132', '池州市');
INSERT INTO `lucky_area` VALUES ('2258', '2257', '市辖区');
INSERT INTO `lucky_area` VALUES ('2259', '2257', '贵池区');
INSERT INTO `lucky_area` VALUES ('2260', '2257', '东至县');
INSERT INTO `lucky_area` VALUES ('2261', '2257', '石台县');
INSERT INTO `lucky_area` VALUES ('2262', '2257', '青阳县');
INSERT INTO `lucky_area` VALUES ('2263', '2132', '宣城市');
INSERT INTO `lucky_area` VALUES ('2264', '2263', '市辖区');
INSERT INTO `lucky_area` VALUES ('2265', '2263', '宣州区');
INSERT INTO `lucky_area` VALUES ('2266', '2263', '郎溪县');
INSERT INTO `lucky_area` VALUES ('2267', '2263', '广德县');
INSERT INTO `lucky_area` VALUES ('2268', '2263', '泾县');
INSERT INTO `lucky_area` VALUES ('2269', '2263', '绩溪县');
INSERT INTO `lucky_area` VALUES ('2270', '2263', '旌德县');
INSERT INTO `lucky_area` VALUES ('2271', '2263', '宁国市');
INSERT INTO `lucky_area` VALUES ('2272', '0', '福建省');
INSERT INTO `lucky_area` VALUES ('2273', '2272', '福州市');
INSERT INTO `lucky_area` VALUES ('2274', '2273', '市辖区');
INSERT INTO `lucky_area` VALUES ('2275', '2273', '鼓楼区');
INSERT INTO `lucky_area` VALUES ('2276', '2273', '台江区');
INSERT INTO `lucky_area` VALUES ('2277', '2273', '仓山区');
INSERT INTO `lucky_area` VALUES ('2278', '2273', '马尾区');
INSERT INTO `lucky_area` VALUES ('2279', '2273', '晋安区');
INSERT INTO `lucky_area` VALUES ('2280', '2273', '闽侯县');
INSERT INTO `lucky_area` VALUES ('2281', '2273', '连江县');
INSERT INTO `lucky_area` VALUES ('2282', '2273', '罗源县');
INSERT INTO `lucky_area` VALUES ('2283', '2273', '闽清县');
INSERT INTO `lucky_area` VALUES ('2284', '2273', '永泰县');
INSERT INTO `lucky_area` VALUES ('2285', '2273', '平潭县');
INSERT INTO `lucky_area` VALUES ('2286', '2273', '福清市');
INSERT INTO `lucky_area` VALUES ('2287', '2273', '长乐市');
INSERT INTO `lucky_area` VALUES ('2288', '2272', '厦门市');
INSERT INTO `lucky_area` VALUES ('2289', '2288', '市辖区');
INSERT INTO `lucky_area` VALUES ('2290', '2288', '思明区');
INSERT INTO `lucky_area` VALUES ('2291', '2288', '海沧区');
INSERT INTO `lucky_area` VALUES ('2292', '2288', '湖里区');
INSERT INTO `lucky_area` VALUES ('2293', '2288', '集美区');
INSERT INTO `lucky_area` VALUES ('2294', '2288', '同安区');
INSERT INTO `lucky_area` VALUES ('2295', '2288', '翔安区');
INSERT INTO `lucky_area` VALUES ('2296', '2272', '莆田市');
INSERT INTO `lucky_area` VALUES ('2297', '2296', '市辖区');
INSERT INTO `lucky_area` VALUES ('2298', '2296', '城厢区');
INSERT INTO `lucky_area` VALUES ('2299', '2296', '涵江区');
INSERT INTO `lucky_area` VALUES ('2300', '2296', '荔城区');
INSERT INTO `lucky_area` VALUES ('2301', '2296', '秀屿区');
INSERT INTO `lucky_area` VALUES ('2302', '2296', '仙游县');
INSERT INTO `lucky_area` VALUES ('2303', '2272', '三明市');
INSERT INTO `lucky_area` VALUES ('2304', '2303', '市辖区');
INSERT INTO `lucky_area` VALUES ('2305', '2303', '梅列区');
INSERT INTO `lucky_area` VALUES ('2306', '2303', '三元区');
INSERT INTO `lucky_area` VALUES ('2307', '2303', '明溪县');
INSERT INTO `lucky_area` VALUES ('2308', '2303', '清流县');
INSERT INTO `lucky_area` VALUES ('2309', '2303', '宁化县');
INSERT INTO `lucky_area` VALUES ('2310', '2303', '大田县');
INSERT INTO `lucky_area` VALUES ('2311', '2303', '尤溪县');
INSERT INTO `lucky_area` VALUES ('2312', '2303', '沙县');
INSERT INTO `lucky_area` VALUES ('2313', '2303', '将乐县');
INSERT INTO `lucky_area` VALUES ('2314', '2303', '泰宁县');
INSERT INTO `lucky_area` VALUES ('2315', '2303', '建宁县');
INSERT INTO `lucky_area` VALUES ('2316', '2303', '永安市');
INSERT INTO `lucky_area` VALUES ('2317', '2272', '泉州市');
INSERT INTO `lucky_area` VALUES ('2318', '2317', '市辖区');
INSERT INTO `lucky_area` VALUES ('2319', '2317', '鲤城区');
INSERT INTO `lucky_area` VALUES ('2320', '2317', '丰泽区');
INSERT INTO `lucky_area` VALUES ('2321', '2317', '洛江区');
INSERT INTO `lucky_area` VALUES ('2322', '2317', '泉港区');
INSERT INTO `lucky_area` VALUES ('2323', '2317', '惠安县');
INSERT INTO `lucky_area` VALUES ('2324', '2317', '安溪县');
INSERT INTO `lucky_area` VALUES ('2325', '2317', '永春县');
INSERT INTO `lucky_area` VALUES ('2326', '2317', '德化县');
INSERT INTO `lucky_area` VALUES ('2327', '2317', '金门县');
INSERT INTO `lucky_area` VALUES ('2328', '2317', '石狮市');
INSERT INTO `lucky_area` VALUES ('2329', '2317', '晋江市');
INSERT INTO `lucky_area` VALUES ('2330', '2317', '南安市');
INSERT INTO `lucky_area` VALUES ('2331', '2272', '漳州市');
INSERT INTO `lucky_area` VALUES ('2332', '2331', '市辖区');
INSERT INTO `lucky_area` VALUES ('2333', '2331', '芗城区');
INSERT INTO `lucky_area` VALUES ('2334', '2331', '龙文区');
INSERT INTO `lucky_area` VALUES ('2335', '2331', '云霄县');
INSERT INTO `lucky_area` VALUES ('2336', '2331', '漳浦县');
INSERT INTO `lucky_area` VALUES ('2337', '2331', '诏安县');
INSERT INTO `lucky_area` VALUES ('2338', '2331', '长泰县');
INSERT INTO `lucky_area` VALUES ('2339', '2331', '东山县');
INSERT INTO `lucky_area` VALUES ('2340', '2331', '南靖县');
INSERT INTO `lucky_area` VALUES ('2341', '2331', '平和县');
INSERT INTO `lucky_area` VALUES ('2342', '2331', '华安县');
INSERT INTO `lucky_area` VALUES ('2343', '2331', '龙海市');
INSERT INTO `lucky_area` VALUES ('2344', '2272', '南平市');
INSERT INTO `lucky_area` VALUES ('2345', '2344', '市辖区');
INSERT INTO `lucky_area` VALUES ('2346', '2344', '延平区');
INSERT INTO `lucky_area` VALUES ('2347', '2344', '顺昌县');
INSERT INTO `lucky_area` VALUES ('2348', '2344', '浦城县');
INSERT INTO `lucky_area` VALUES ('2349', '2344', '光泽县');
INSERT INTO `lucky_area` VALUES ('2350', '2344', '松溪县');
INSERT INTO `lucky_area` VALUES ('2351', '2344', '政和县');
INSERT INTO `lucky_area` VALUES ('2352', '2344', '邵武市');
INSERT INTO `lucky_area` VALUES ('2353', '2344', '武夷山市');
INSERT INTO `lucky_area` VALUES ('2354', '2344', '建瓯市');
INSERT INTO `lucky_area` VALUES ('2355', '2344', '建阳市');
INSERT INTO `lucky_area` VALUES ('2356', '2272', '龙岩市');
INSERT INTO `lucky_area` VALUES ('2357', '2356', '市辖区');
INSERT INTO `lucky_area` VALUES ('2358', '2356', '新罗区');
INSERT INTO `lucky_area` VALUES ('2359', '2356', '长汀县');
INSERT INTO `lucky_area` VALUES ('2360', '2356', '永定县');
INSERT INTO `lucky_area` VALUES ('2361', '2356', '上杭县');
INSERT INTO `lucky_area` VALUES ('2362', '2356', '武平县');
INSERT INTO `lucky_area` VALUES ('2363', '2356', '连城县');
INSERT INTO `lucky_area` VALUES ('2364', '2356', '漳平市');
INSERT INTO `lucky_area` VALUES ('2365', '2272', '宁德市');
INSERT INTO `lucky_area` VALUES ('2366', '2365', '市辖区');
INSERT INTO `lucky_area` VALUES ('2367', '2365', '蕉城区');
INSERT INTO `lucky_area` VALUES ('2368', '2365', '霞浦县');
INSERT INTO `lucky_area` VALUES ('2369', '2365', '古田县');
INSERT INTO `lucky_area` VALUES ('2370', '2365', '屏南县');
INSERT INTO `lucky_area` VALUES ('2371', '2365', '寿宁县');
INSERT INTO `lucky_area` VALUES ('2372', '2365', '周宁县');
INSERT INTO `lucky_area` VALUES ('2373', '2365', '柘荣县');
INSERT INTO `lucky_area` VALUES ('2374', '2365', '福安市');
INSERT INTO `lucky_area` VALUES ('2375', '2365', '福鼎市');
INSERT INTO `lucky_area` VALUES ('2376', '0', '江西省');
INSERT INTO `lucky_area` VALUES ('2377', '2376', '南昌市');
INSERT INTO `lucky_area` VALUES ('2378', '2377', '市辖区');
INSERT INTO `lucky_area` VALUES ('2379', '2377', '东湖区');
INSERT INTO `lucky_area` VALUES ('2380', '2377', '西湖区');
INSERT INTO `lucky_area` VALUES ('2381', '2377', '青云谱区');
INSERT INTO `lucky_area` VALUES ('2382', '2377', '湾里区');
INSERT INTO `lucky_area` VALUES ('2383', '2377', '青山湖区');
INSERT INTO `lucky_area` VALUES ('2384', '2377', '南昌县');
INSERT INTO `lucky_area` VALUES ('2385', '2377', '高新区');
INSERT INTO `lucky_area` VALUES ('2386', '2377', '新建县');
INSERT INTO `lucky_area` VALUES ('2387', '2377', '安义县');
INSERT INTO `lucky_area` VALUES ('2388', '2377', '进贤县');
INSERT INTO `lucky_area` VALUES ('2389', '2376', '景德镇市');
INSERT INTO `lucky_area` VALUES ('2390', '2389', '市辖区');
INSERT INTO `lucky_area` VALUES ('2391', '2389', '昌江区');
INSERT INTO `lucky_area` VALUES ('2392', '2389', '珠山区');
INSERT INTO `lucky_area` VALUES ('2393', '2389', '浮梁县');
INSERT INTO `lucky_area` VALUES ('2394', '2389', '乐平市');
INSERT INTO `lucky_area` VALUES ('2395', '2376', '萍乡市');
INSERT INTO `lucky_area` VALUES ('2396', '2395', '市辖区');
INSERT INTO `lucky_area` VALUES ('2397', '2395', '安源区');
INSERT INTO `lucky_area` VALUES ('2398', '2395', '湘东区');
INSERT INTO `lucky_area` VALUES ('2399', '2395', '莲花县');
INSERT INTO `lucky_area` VALUES ('2400', '2395', '上栗县');
INSERT INTO `lucky_area` VALUES ('2401', '2395', '芦溪县');
INSERT INTO `lucky_area` VALUES ('2402', '2376', '九江市');
INSERT INTO `lucky_area` VALUES ('2403', '2402', '市辖区');
INSERT INTO `lucky_area` VALUES ('2404', '2402', '庐山区');
INSERT INTO `lucky_area` VALUES ('2405', '2402', '浔阳区');
INSERT INTO `lucky_area` VALUES ('2406', '2402', '九江县');
INSERT INTO `lucky_area` VALUES ('2407', '2402', '武宁县');
INSERT INTO `lucky_area` VALUES ('2408', '2402', '修水县');
INSERT INTO `lucky_area` VALUES ('2409', '2402', '永修县');
INSERT INTO `lucky_area` VALUES ('2410', '2402', '德安县');
INSERT INTO `lucky_area` VALUES ('2411', '2402', '星子县');
INSERT INTO `lucky_area` VALUES ('2412', '2402', '都昌县');
INSERT INTO `lucky_area` VALUES ('2413', '2402', '湖口县');
INSERT INTO `lucky_area` VALUES ('2414', '2402', '彭泽县');
INSERT INTO `lucky_area` VALUES ('2415', '2402', '瑞昌市');
INSERT INTO `lucky_area` VALUES ('2416', '2376', '新余市');
INSERT INTO `lucky_area` VALUES ('2417', '2416', '市辖区');
INSERT INTO `lucky_area` VALUES ('2418', '2416', '渝水区');
INSERT INTO `lucky_area` VALUES ('2419', '2416', '分宜县');
INSERT INTO `lucky_area` VALUES ('2420', '2376', '鹰潭市');
INSERT INTO `lucky_area` VALUES ('2421', '2420', '市辖区');
INSERT INTO `lucky_area` VALUES ('2422', '2420', '月湖区');
INSERT INTO `lucky_area` VALUES ('2423', '2420', '余江县');
INSERT INTO `lucky_area` VALUES ('2424', '2420', '贵溪市');
INSERT INTO `lucky_area` VALUES ('2425', '2376', '赣州市');
INSERT INTO `lucky_area` VALUES ('2426', '2425', '市辖区');
INSERT INTO `lucky_area` VALUES ('2427', '2425', '章贡区');
INSERT INTO `lucky_area` VALUES ('2428', '2425', '赣县');
INSERT INTO `lucky_area` VALUES ('2429', '2425', '信丰县');
INSERT INTO `lucky_area` VALUES ('2430', '2425', '大余县');
INSERT INTO `lucky_area` VALUES ('2431', '2425', '上犹县');
INSERT INTO `lucky_area` VALUES ('2432', '2425', '崇义县');
INSERT INTO `lucky_area` VALUES ('2433', '2425', '安远县');
INSERT INTO `lucky_area` VALUES ('2434', '2425', '龙南县');
INSERT INTO `lucky_area` VALUES ('2435', '2425', '定南县');
INSERT INTO `lucky_area` VALUES ('2436', '2425', '全南县');
INSERT INTO `lucky_area` VALUES ('2437', '2425', '宁都县');
INSERT INTO `lucky_area` VALUES ('2438', '2425', '于都县');
INSERT INTO `lucky_area` VALUES ('2439', '2425', '兴国县');
INSERT INTO `lucky_area` VALUES ('2440', '2425', '会昌县');
INSERT INTO `lucky_area` VALUES ('2441', '2425', '寻乌县');
INSERT INTO `lucky_area` VALUES ('2442', '2425', '石城县');
INSERT INTO `lucky_area` VALUES ('2443', '2425', '瑞金市');
INSERT INTO `lucky_area` VALUES ('2444', '2425', '南康市');
INSERT INTO `lucky_area` VALUES ('2445', '2376', '吉安市');
INSERT INTO `lucky_area` VALUES ('2446', '2445', '市辖区');
INSERT INTO `lucky_area` VALUES ('2447', '2445', '吉州区');
INSERT INTO `lucky_area` VALUES ('2448', '2445', '青原区');
INSERT INTO `lucky_area` VALUES ('2449', '2445', '吉安县');
INSERT INTO `lucky_area` VALUES ('2450', '2445', '吉水县');
INSERT INTO `lucky_area` VALUES ('2451', '2445', '峡江县');
INSERT INTO `lucky_area` VALUES ('2452', '2445', '新干县');
INSERT INTO `lucky_area` VALUES ('2453', '2445', '永丰县');
INSERT INTO `lucky_area` VALUES ('2454', '2445', '泰和县');
INSERT INTO `lucky_area` VALUES ('2455', '2445', '遂川县');
INSERT INTO `lucky_area` VALUES ('2456', '2445', '万安县');
INSERT INTO `lucky_area` VALUES ('2457', '2445', '安福县');
INSERT INTO `lucky_area` VALUES ('2458', '2445', '永新县');
INSERT INTO `lucky_area` VALUES ('2459', '2445', '井冈山市');
INSERT INTO `lucky_area` VALUES ('2460', '2376', '宜春市');
INSERT INTO `lucky_area` VALUES ('2461', '2460', '市辖区');
INSERT INTO `lucky_area` VALUES ('2462', '2460', '袁州区');
INSERT INTO `lucky_area` VALUES ('2463', '2460', '奉新县');
INSERT INTO `lucky_area` VALUES ('2464', '2460', '万载县');
INSERT INTO `lucky_area` VALUES ('2465', '2460', '上高县');
INSERT INTO `lucky_area` VALUES ('2466', '2460', '宜丰县');
INSERT INTO `lucky_area` VALUES ('2467', '2460', '靖安县');
INSERT INTO `lucky_area` VALUES ('2468', '2460', '铜鼓县');
INSERT INTO `lucky_area` VALUES ('2469', '2460', '丰城市');
INSERT INTO `lucky_area` VALUES ('2470', '2460', '樟树市');
INSERT INTO `lucky_area` VALUES ('2471', '2460', '高安市');
INSERT INTO `lucky_area` VALUES ('2472', '2376', '抚州市');
INSERT INTO `lucky_area` VALUES ('2473', '2472', '市辖区');
INSERT INTO `lucky_area` VALUES ('2474', '2472', '临川区');
INSERT INTO `lucky_area` VALUES ('2475', '2472', '南城县');
INSERT INTO `lucky_area` VALUES ('2476', '2472', '黎川县');
INSERT INTO `lucky_area` VALUES ('2477', '2472', '南丰县');
INSERT INTO `lucky_area` VALUES ('2478', '2472', '崇仁县');
INSERT INTO `lucky_area` VALUES ('2479', '2472', '乐安县');
INSERT INTO `lucky_area` VALUES ('2480', '2472', '宜黄县');
INSERT INTO `lucky_area` VALUES ('2481', '2472', '金溪县');
INSERT INTO `lucky_area` VALUES ('2482', '2472', '资溪县');
INSERT INTO `lucky_area` VALUES ('2483', '2472', '东乡县');
INSERT INTO `lucky_area` VALUES ('2484', '2472', '广昌县');
INSERT INTO `lucky_area` VALUES ('2485', '2376', '上饶市');
INSERT INTO `lucky_area` VALUES ('2486', '2485', '市辖区');
INSERT INTO `lucky_area` VALUES ('2487', '2485', '信州区');
INSERT INTO `lucky_area` VALUES ('2488', '2485', '上饶县');
INSERT INTO `lucky_area` VALUES ('2489', '2485', '广丰县');
INSERT INTO `lucky_area` VALUES ('2490', '2485', '玉山县');
INSERT INTO `lucky_area` VALUES ('2491', '2485', '铅山县');
INSERT INTO `lucky_area` VALUES ('2492', '2485', '横峰县');
INSERT INTO `lucky_area` VALUES ('2493', '2485', '弋阳县');
INSERT INTO `lucky_area` VALUES ('2494', '2485', '余干县');
INSERT INTO `lucky_area` VALUES ('2495', '2485', '鄱阳县');
INSERT INTO `lucky_area` VALUES ('2496', '2485', '万年县');
INSERT INTO `lucky_area` VALUES ('2497', '2485', '婺源县');
INSERT INTO `lucky_area` VALUES ('2498', '2485', '德兴市');
INSERT INTO `lucky_area` VALUES ('2499', '0', '山东省');
INSERT INTO `lucky_area` VALUES ('2500', '2499', '济南市');
INSERT INTO `lucky_area` VALUES ('2501', '2500', '市辖区');
INSERT INTO `lucky_area` VALUES ('2502', '2500', '历下区');
INSERT INTO `lucky_area` VALUES ('2503', '2500', '市中区');
INSERT INTO `lucky_area` VALUES ('2504', '2500', '槐荫区');
INSERT INTO `lucky_area` VALUES ('2505', '2500', '天桥区');
INSERT INTO `lucky_area` VALUES ('2506', '2500', '历城区');
INSERT INTO `lucky_area` VALUES ('2507', '2500', '长清区');
INSERT INTO `lucky_area` VALUES ('2508', '2500', '平阴县');
INSERT INTO `lucky_area` VALUES ('2509', '2500', '济阳县');
INSERT INTO `lucky_area` VALUES ('2510', '2500', '商河县');
INSERT INTO `lucky_area` VALUES ('2511', '2500', '章丘市');
INSERT INTO `lucky_area` VALUES ('2512', '2499', '青岛市');
INSERT INTO `lucky_area` VALUES ('2513', '2512', '市辖区');
INSERT INTO `lucky_area` VALUES ('2514', '2512', '市南区');
INSERT INTO `lucky_area` VALUES ('2515', '2512', '市北区');
INSERT INTO `lucky_area` VALUES ('2516', '2512', '四方区');
INSERT INTO `lucky_area` VALUES ('2517', '2512', '黄岛区');
INSERT INTO `lucky_area` VALUES ('2518', '2512', '崂山区');
INSERT INTO `lucky_area` VALUES ('2519', '2512', '李沧区');
INSERT INTO `lucky_area` VALUES ('2520', '2512', '城阳区');
INSERT INTO `lucky_area` VALUES ('2521', '2512', '胶州市');
INSERT INTO `lucky_area` VALUES ('2522', '2512', '即墨市');
INSERT INTO `lucky_area` VALUES ('2523', '2512', '平度市');
INSERT INTO `lucky_area` VALUES ('2524', '2512', '胶南市');
INSERT INTO `lucky_area` VALUES ('2525', '2512', '莱西市');
INSERT INTO `lucky_area` VALUES ('2526', '2499', '淄博市');
INSERT INTO `lucky_area` VALUES ('2527', '2526', '市辖区');
INSERT INTO `lucky_area` VALUES ('2528', '2526', '淄川区');
INSERT INTO `lucky_area` VALUES ('2529', '2526', '张店区');
INSERT INTO `lucky_area` VALUES ('2530', '2526', '博山区');
INSERT INTO `lucky_area` VALUES ('2531', '2526', '临淄区');
INSERT INTO `lucky_area` VALUES ('2532', '2526', '周村区');
INSERT INTO `lucky_area` VALUES ('2533', '2526', '桓台县');
INSERT INTO `lucky_area` VALUES ('2534', '2526', '高青县');
INSERT INTO `lucky_area` VALUES ('2535', '2526', '沂源县');
INSERT INTO `lucky_area` VALUES ('2536', '2499', '枣庄市');
INSERT INTO `lucky_area` VALUES ('2537', '2536', '市辖区');
INSERT INTO `lucky_area` VALUES ('2538', '2536', '市中区');
INSERT INTO `lucky_area` VALUES ('2539', '2536', '薛城区');
INSERT INTO `lucky_area` VALUES ('2540', '2536', '峄城区');
INSERT INTO `lucky_area` VALUES ('2541', '2536', '台儿庄区');
INSERT INTO `lucky_area` VALUES ('2542', '2536', '山亭区');
INSERT INTO `lucky_area` VALUES ('2543', '2536', '滕州市');
INSERT INTO `lucky_area` VALUES ('2544', '2499', '东营市');
INSERT INTO `lucky_area` VALUES ('2545', '2544', '市辖区');
INSERT INTO `lucky_area` VALUES ('2546', '2544', '东营区');
INSERT INTO `lucky_area` VALUES ('2547', '2544', '河口区');
INSERT INTO `lucky_area` VALUES ('2548', '2544', '垦利县');
INSERT INTO `lucky_area` VALUES ('2549', '2544', '利津县');
INSERT INTO `lucky_area` VALUES ('2550', '2544', '广饶县');
INSERT INTO `lucky_area` VALUES ('2551', '2499', '烟台市');
INSERT INTO `lucky_area` VALUES ('2552', '2551', '市辖区');
INSERT INTO `lucky_area` VALUES ('2553', '2551', '芝罘区');
INSERT INTO `lucky_area` VALUES ('2554', '2551', '福山区');
INSERT INTO `lucky_area` VALUES ('2555', '2551', '牟平区');
INSERT INTO `lucky_area` VALUES ('2556', '2551', '莱山区');
INSERT INTO `lucky_area` VALUES ('2557', '2551', '长岛县');
INSERT INTO `lucky_area` VALUES ('2558', '2551', '龙口市');
INSERT INTO `lucky_area` VALUES ('2559', '2551', '莱阳市');
INSERT INTO `lucky_area` VALUES ('2560', '2551', '莱州市');
INSERT INTO `lucky_area` VALUES ('2561', '2551', '蓬莱市');
INSERT INTO `lucky_area` VALUES ('2562', '2551', '招远市');
INSERT INTO `lucky_area` VALUES ('2563', '2551', '栖霞市');
INSERT INTO `lucky_area` VALUES ('2564', '2551', '海阳市');
INSERT INTO `lucky_area` VALUES ('2565', '2499', '潍坊市');
INSERT INTO `lucky_area` VALUES ('2566', '2565', '市辖区');
INSERT INTO `lucky_area` VALUES ('2567', '2565', '潍城区');
INSERT INTO `lucky_area` VALUES ('2568', '2565', '寒亭区');
INSERT INTO `lucky_area` VALUES ('2569', '2565', '坊子区');
INSERT INTO `lucky_area` VALUES ('2570', '2565', '奎文区');
INSERT INTO `lucky_area` VALUES ('2571', '2565', '临朐县');
INSERT INTO `lucky_area` VALUES ('2572', '2565', '昌乐县');
INSERT INTO `lucky_area` VALUES ('2573', '2565', '青州市');
INSERT INTO `lucky_area` VALUES ('2574', '2565', '诸城市');
INSERT INTO `lucky_area` VALUES ('2575', '2565', '寿光市');
INSERT INTO `lucky_area` VALUES ('2576', '2565', '安丘市');
INSERT INTO `lucky_area` VALUES ('2577', '2565', '高密市');
INSERT INTO `lucky_area` VALUES ('2578', '2565', '昌邑市');
INSERT INTO `lucky_area` VALUES ('2579', '2499', '济宁市');
INSERT INTO `lucky_area` VALUES ('2580', '2579', '市辖区');
INSERT INTO `lucky_area` VALUES ('2581', '2579', '市中区');
INSERT INTO `lucky_area` VALUES ('2582', '2579', '任城区');
INSERT INTO `lucky_area` VALUES ('2583', '2579', '微山县');
INSERT INTO `lucky_area` VALUES ('2584', '2579', '鱼台县');
INSERT INTO `lucky_area` VALUES ('2585', '2579', '金乡县');
INSERT INTO `lucky_area` VALUES ('2586', '2579', '嘉祥县');
INSERT INTO `lucky_area` VALUES ('2587', '2579', '汶上县');
INSERT INTO `lucky_area` VALUES ('2588', '2579', '泗水县');
INSERT INTO `lucky_area` VALUES ('2589', '2579', '梁山县');
INSERT INTO `lucky_area` VALUES ('2590', '2579', '曲阜市');
INSERT INTO `lucky_area` VALUES ('2591', '2579', '兖州市');
INSERT INTO `lucky_area` VALUES ('2592', '2579', '邹城市');
INSERT INTO `lucky_area` VALUES ('2593', '2499', '泰安市');
INSERT INTO `lucky_area` VALUES ('2594', '2593', '市辖区');
INSERT INTO `lucky_area` VALUES ('2595', '2593', '泰山区');
INSERT INTO `lucky_area` VALUES ('2596', '2593', '岱岳区');
INSERT INTO `lucky_area` VALUES ('2597', '2593', '宁阳县');
INSERT INTO `lucky_area` VALUES ('2598', '2593', '东平县');
INSERT INTO `lucky_area` VALUES ('2599', '2593', '新泰市');
INSERT INTO `lucky_area` VALUES ('2600', '2593', '肥城市');
INSERT INTO `lucky_area` VALUES ('2601', '2499', '威海市');
INSERT INTO `lucky_area` VALUES ('2602', '2601', '市辖区');
INSERT INTO `lucky_area` VALUES ('2603', '2601', '环翠区');
INSERT INTO `lucky_area` VALUES ('2604', '2601', '文登市');
INSERT INTO `lucky_area` VALUES ('2605', '2601', '荣成市');
INSERT INTO `lucky_area` VALUES ('2606', '2601', '乳山市');
INSERT INTO `lucky_area` VALUES ('2607', '2499', '日照市');
INSERT INTO `lucky_area` VALUES ('2608', '2607', '市辖区');
INSERT INTO `lucky_area` VALUES ('2609', '2607', '东港区');
INSERT INTO `lucky_area` VALUES ('2610', '2607', '岚山区');
INSERT INTO `lucky_area` VALUES ('2611', '2607', '五莲县');
INSERT INTO `lucky_area` VALUES ('2612', '2607', '莒县');
INSERT INTO `lucky_area` VALUES ('2613', '2499', '莱芜市');
INSERT INTO `lucky_area` VALUES ('2614', '2613', '市辖区');
INSERT INTO `lucky_area` VALUES ('2615', '2613', '莱城区');
INSERT INTO `lucky_area` VALUES ('2616', '2613', '钢城区');
INSERT INTO `lucky_area` VALUES ('2617', '2499', '临沂市');
INSERT INTO `lucky_area` VALUES ('2618', '2617', '市辖区');
INSERT INTO `lucky_area` VALUES ('2619', '2617', '兰山区');
INSERT INTO `lucky_area` VALUES ('2620', '2617', '罗庄区');
INSERT INTO `lucky_area` VALUES ('2621', '2617', '河东区');
INSERT INTO `lucky_area` VALUES ('2622', '2617', '沂南县');
INSERT INTO `lucky_area` VALUES ('2623', '2617', '郯城县');
INSERT INTO `lucky_area` VALUES ('2624', '2617', '沂水县');
INSERT INTO `lucky_area` VALUES ('2625', '2617', '苍山县');
INSERT INTO `lucky_area` VALUES ('2626', '2617', '费县');
INSERT INTO `lucky_area` VALUES ('2627', '2617', '平邑县');
INSERT INTO `lucky_area` VALUES ('2628', '2617', '莒南县');
INSERT INTO `lucky_area` VALUES ('2629', '2617', '蒙阴县');
INSERT INTO `lucky_area` VALUES ('2630', '2617', '临沭县');
INSERT INTO `lucky_area` VALUES ('2631', '2499', '德州市');
INSERT INTO `lucky_area` VALUES ('2632', '2631', '市辖区');
INSERT INTO `lucky_area` VALUES ('2633', '2631', '德城区');
INSERT INTO `lucky_area` VALUES ('2634', '2631', '陵县');
INSERT INTO `lucky_area` VALUES ('2635', '2631', '宁津县');
INSERT INTO `lucky_area` VALUES ('2636', '2631', '庆云县');
INSERT INTO `lucky_area` VALUES ('2637', '2631', '临邑县');
INSERT INTO `lucky_area` VALUES ('2638', '2631', '齐河县');
INSERT INTO `lucky_area` VALUES ('2639', '2631', '平原县');
INSERT INTO `lucky_area` VALUES ('2640', '2631', '夏津县');
INSERT INTO `lucky_area` VALUES ('2641', '2631', '武城县');
INSERT INTO `lucky_area` VALUES ('2642', '2631', '乐陵市');
INSERT INTO `lucky_area` VALUES ('2643', '2631', '禹城市');
INSERT INTO `lucky_area` VALUES ('2644', '2499', '聊城市');
INSERT INTO `lucky_area` VALUES ('2645', '2644', '市辖区');
INSERT INTO `lucky_area` VALUES ('2646', '2644', '东昌府区');
INSERT INTO `lucky_area` VALUES ('2647', '2644', '阳谷县');
INSERT INTO `lucky_area` VALUES ('2648', '2644', '莘县');
INSERT INTO `lucky_area` VALUES ('2649', '2644', '茌平县');
INSERT INTO `lucky_area` VALUES ('2650', '2644', '东阿县');
INSERT INTO `lucky_area` VALUES ('2651', '2644', '冠县');
INSERT INTO `lucky_area` VALUES ('2652', '2644', '高唐县');
INSERT INTO `lucky_area` VALUES ('2653', '2644', '临清市');
INSERT INTO `lucky_area` VALUES ('2654', '2499', '滨州市');
INSERT INTO `lucky_area` VALUES ('2655', '2654', '市辖区');
INSERT INTO `lucky_area` VALUES ('2656', '2654', '滨城区');
INSERT INTO `lucky_area` VALUES ('2657', '2654', '惠民县');
INSERT INTO `lucky_area` VALUES ('2658', '2654', '阳信县');
INSERT INTO `lucky_area` VALUES ('2659', '2654', '无棣县');
INSERT INTO `lucky_area` VALUES ('2660', '2654', '沾化县');
INSERT INTO `lucky_area` VALUES ('2661', '2654', '博兴县');
INSERT INTO `lucky_area` VALUES ('2662', '2654', '邹平县');
INSERT INTO `lucky_area` VALUES ('2663', '2499', '菏泽市');
INSERT INTO `lucky_area` VALUES ('2664', '2663', '市辖区');
INSERT INTO `lucky_area` VALUES ('2665', '2663', '牡丹区');
INSERT INTO `lucky_area` VALUES ('2666', '2663', '曹县');
INSERT INTO `lucky_area` VALUES ('2667', '2663', '单县');
INSERT INTO `lucky_area` VALUES ('2668', '2663', '成武县');
INSERT INTO `lucky_area` VALUES ('2669', '2663', '巨野县');
INSERT INTO `lucky_area` VALUES ('2670', '2663', '郓城县');
INSERT INTO `lucky_area` VALUES ('2671', '2663', '鄄城县');
INSERT INTO `lucky_area` VALUES ('2672', '2663', '定陶县');
INSERT INTO `lucky_area` VALUES ('2673', '2663', '东明县');
INSERT INTO `lucky_area` VALUES ('2674', '0', '河南省');
INSERT INTO `lucky_area` VALUES ('2675', '2674', '郑州市');
INSERT INTO `lucky_area` VALUES ('2676', '2675', '市辖区');
INSERT INTO `lucky_area` VALUES ('2677', '2675', '中原区');
INSERT INTO `lucky_area` VALUES ('2678', '2675', '二七区');
INSERT INTO `lucky_area` VALUES ('2679', '2675', '管城回族区');
INSERT INTO `lucky_area` VALUES ('2680', '2675', '金水区');
INSERT INTO `lucky_area` VALUES ('2681', '2675', '上街区');
INSERT INTO `lucky_area` VALUES ('2682', '2675', '惠济区');
INSERT INTO `lucky_area` VALUES ('2683', '2675', '中牟县');
INSERT INTO `lucky_area` VALUES ('2684', '2675', '巩义市');
INSERT INTO `lucky_area` VALUES ('2685', '2675', '荥阳市');
INSERT INTO `lucky_area` VALUES ('2686', '2675', '新密市');
INSERT INTO `lucky_area` VALUES ('2687', '2675', '新郑市');
INSERT INTO `lucky_area` VALUES ('2688', '2675', '登封市');
INSERT INTO `lucky_area` VALUES ('2689', '2674', '开封市');
INSERT INTO `lucky_area` VALUES ('2690', '2689', '市辖区');
INSERT INTO `lucky_area` VALUES ('2691', '2689', '龙亭区');
INSERT INTO `lucky_area` VALUES ('2692', '2689', '顺河回族区');
INSERT INTO `lucky_area` VALUES ('2693', '2689', '鼓楼区');
INSERT INTO `lucky_area` VALUES ('2694', '2689', '禹王台区');
INSERT INTO `lucky_area` VALUES ('2695', '2689', '金明区');
INSERT INTO `lucky_area` VALUES ('2696', '2689', '杞县');
INSERT INTO `lucky_area` VALUES ('2697', '2689', '通许县');
INSERT INTO `lucky_area` VALUES ('2698', '2689', '尉氏县');
INSERT INTO `lucky_area` VALUES ('2699', '2689', '开封县');
INSERT INTO `lucky_area` VALUES ('2700', '2689', '兰考县');
INSERT INTO `lucky_area` VALUES ('2701', '2674', '洛阳市');
INSERT INTO `lucky_area` VALUES ('2702', '2701', '市辖区');
INSERT INTO `lucky_area` VALUES ('2703', '2701', '老城区');
INSERT INTO `lucky_area` VALUES ('2704', '2701', '西工区');
INSERT INTO `lucky_area` VALUES ('2705', '2701', '廛河回族区');
INSERT INTO `lucky_area` VALUES ('2706', '2701', '涧西区');
INSERT INTO `lucky_area` VALUES ('2707', '2701', '吉利区');
INSERT INTO `lucky_area` VALUES ('2708', '2701', '洛龙区');
INSERT INTO `lucky_area` VALUES ('2709', '2701', '孟津县');
INSERT INTO `lucky_area` VALUES ('2710', '2701', '新安县');
INSERT INTO `lucky_area` VALUES ('2711', '2701', '栾川县');
INSERT INTO `lucky_area` VALUES ('2712', '2701', '嵩县');
INSERT INTO `lucky_area` VALUES ('2713', '2701', '汝阳县');
INSERT INTO `lucky_area` VALUES ('2714', '2701', '宜阳县');
INSERT INTO `lucky_area` VALUES ('2715', '2701', '洛宁县');
INSERT INTO `lucky_area` VALUES ('2716', '2701', '伊川县');
INSERT INTO `lucky_area` VALUES ('2717', '2701', '偃师市');
INSERT INTO `lucky_area` VALUES ('2718', '2674', '平顶山市');
INSERT INTO `lucky_area` VALUES ('2719', '2718', '市辖区');
INSERT INTO `lucky_area` VALUES ('2720', '2718', '新华区');
INSERT INTO `lucky_area` VALUES ('2721', '2718', '卫东区');
INSERT INTO `lucky_area` VALUES ('2722', '2718', '石龙区');
INSERT INTO `lucky_area` VALUES ('2723', '2718', '湛河区');
INSERT INTO `lucky_area` VALUES ('2724', '2718', '宝丰县');
INSERT INTO `lucky_area` VALUES ('2725', '2718', '叶县');
INSERT INTO `lucky_area` VALUES ('2726', '2718', '鲁山县');
INSERT INTO `lucky_area` VALUES ('2727', '2718', '郏县');
INSERT INTO `lucky_area` VALUES ('2728', '2718', '舞钢市');
INSERT INTO `lucky_area` VALUES ('2729', '2718', '汝州市');
INSERT INTO `lucky_area` VALUES ('2730', '2674', '安阳市');
INSERT INTO `lucky_area` VALUES ('2731', '2730', '市辖区');
INSERT INTO `lucky_area` VALUES ('2732', '2730', '文峰区');
INSERT INTO `lucky_area` VALUES ('2733', '2730', '北关区');
INSERT INTO `lucky_area` VALUES ('2734', '2730', '殷都区');
INSERT INTO `lucky_area` VALUES ('2735', '2730', '龙安区');
INSERT INTO `lucky_area` VALUES ('2736', '2730', '安阳县');
INSERT INTO `lucky_area` VALUES ('2737', '2730', '汤阴县');
INSERT INTO `lucky_area` VALUES ('2738', '2730', '滑县');
INSERT INTO `lucky_area` VALUES ('2739', '2730', '内黄县');
INSERT INTO `lucky_area` VALUES ('2740', '2730', '林州市');
INSERT INTO `lucky_area` VALUES ('2741', '2674', '鹤壁市');
INSERT INTO `lucky_area` VALUES ('2742', '2741', '市辖区');
INSERT INTO `lucky_area` VALUES ('2743', '2741', '鹤山区');
INSERT INTO `lucky_area` VALUES ('2744', '2741', '山城区');
INSERT INTO `lucky_area` VALUES ('2745', '2741', '淇滨区');
INSERT INTO `lucky_area` VALUES ('2746', '2741', '浚县');
INSERT INTO `lucky_area` VALUES ('2747', '2741', '淇县');
INSERT INTO `lucky_area` VALUES ('2748', '2674', '新乡市');
INSERT INTO `lucky_area` VALUES ('2749', '2748', '市辖区');
INSERT INTO `lucky_area` VALUES ('2750', '2748', '红旗区');
INSERT INTO `lucky_area` VALUES ('2751', '2748', '卫滨区');
INSERT INTO `lucky_area` VALUES ('2752', '2748', '凤泉区');
INSERT INTO `lucky_area` VALUES ('2753', '2748', '牧野区');
INSERT INTO `lucky_area` VALUES ('2754', '2748', '新乡县');
INSERT INTO `lucky_area` VALUES ('2755', '2748', '获嘉县');
INSERT INTO `lucky_area` VALUES ('2756', '2748', '原阳县');
INSERT INTO `lucky_area` VALUES ('2757', '2748', '延津县');
INSERT INTO `lucky_area` VALUES ('2758', '2748', '封丘县');
INSERT INTO `lucky_area` VALUES ('2759', '2748', '长垣县');
INSERT INTO `lucky_area` VALUES ('2760', '2748', '卫辉市');
INSERT INTO `lucky_area` VALUES ('2761', '2748', '辉县市');
INSERT INTO `lucky_area` VALUES ('2762', '2674', '焦作市');
INSERT INTO `lucky_area` VALUES ('2763', '2762', '市辖区');
INSERT INTO `lucky_area` VALUES ('2764', '2762', '解放区');
INSERT INTO `lucky_area` VALUES ('2765', '2762', '中站区');
INSERT INTO `lucky_area` VALUES ('2766', '2762', '马村区');
INSERT INTO `lucky_area` VALUES ('2767', '2762', '山阳区');
INSERT INTO `lucky_area` VALUES ('2768', '2762', '修武县');
INSERT INTO `lucky_area` VALUES ('2769', '2762', '博爱县');
INSERT INTO `lucky_area` VALUES ('2770', '2762', '武陟县');
INSERT INTO `lucky_area` VALUES ('2771', '2762', '温县');
INSERT INTO `lucky_area` VALUES ('2772', '2762', '济源市');
INSERT INTO `lucky_area` VALUES ('2773', '2762', '沁阳市');
INSERT INTO `lucky_area` VALUES ('2774', '2762', '孟州市');
INSERT INTO `lucky_area` VALUES ('2775', '2674', '濮阳市');
INSERT INTO `lucky_area` VALUES ('2776', '2775', '市辖区');
INSERT INTO `lucky_area` VALUES ('2777', '2775', '华龙区');
INSERT INTO `lucky_area` VALUES ('2778', '2775', '清丰县');
INSERT INTO `lucky_area` VALUES ('2779', '2775', '南乐县');
INSERT INTO `lucky_area` VALUES ('2780', '2775', '范县');
INSERT INTO `lucky_area` VALUES ('2781', '2775', '台前县');
INSERT INTO `lucky_area` VALUES ('2782', '2775', '濮阳县');
INSERT INTO `lucky_area` VALUES ('2783', '2674', '许昌市');
INSERT INTO `lucky_area` VALUES ('2784', '2783', '市辖区');
INSERT INTO `lucky_area` VALUES ('2785', '2783', '魏都区');
INSERT INTO `lucky_area` VALUES ('2786', '2783', '许昌县');
INSERT INTO `lucky_area` VALUES ('2787', '2783', '鄢陵县');
INSERT INTO `lucky_area` VALUES ('2788', '2783', '襄城县');
INSERT INTO `lucky_area` VALUES ('2789', '2783', '禹州市');
INSERT INTO `lucky_area` VALUES ('2790', '2783', '长葛市');
INSERT INTO `lucky_area` VALUES ('2791', '2674', '漯河市');
INSERT INTO `lucky_area` VALUES ('2792', '2791', '市辖区');
INSERT INTO `lucky_area` VALUES ('2793', '2791', '源汇区');
INSERT INTO `lucky_area` VALUES ('2794', '2791', '郾城区');
INSERT INTO `lucky_area` VALUES ('2795', '2791', '召陵区');
INSERT INTO `lucky_area` VALUES ('2796', '2791', '舞阳县');
INSERT INTO `lucky_area` VALUES ('2797', '2791', '临颍县');
INSERT INTO `lucky_area` VALUES ('2798', '2674', '三门峡市');
INSERT INTO `lucky_area` VALUES ('2799', '2798', '市辖区');
INSERT INTO `lucky_area` VALUES ('2800', '2798', '湖滨区');
INSERT INTO `lucky_area` VALUES ('2801', '2798', '渑池县');
INSERT INTO `lucky_area` VALUES ('2802', '2798', '陕县');
INSERT INTO `lucky_area` VALUES ('2803', '2798', '卢氏县');
INSERT INTO `lucky_area` VALUES ('2804', '2798', '义马市');
INSERT INTO `lucky_area` VALUES ('2805', '2798', '灵宝市');
INSERT INTO `lucky_area` VALUES ('2806', '2674', '南阳市');
INSERT INTO `lucky_area` VALUES ('2807', '2806', '市辖区');
INSERT INTO `lucky_area` VALUES ('2808', '2806', '宛城区');
INSERT INTO `lucky_area` VALUES ('2809', '2806', '卧龙区');
INSERT INTO `lucky_area` VALUES ('2810', '2806', '南召县');
INSERT INTO `lucky_area` VALUES ('2811', '2806', '方城县');
INSERT INTO `lucky_area` VALUES ('2812', '2806', '西峡县');
INSERT INTO `lucky_area` VALUES ('2813', '2806', '镇平县');
INSERT INTO `lucky_area` VALUES ('2814', '2806', '内乡县');
INSERT INTO `lucky_area` VALUES ('2815', '2806', '淅川县');
INSERT INTO `lucky_area` VALUES ('2816', '2806', '社旗县');
INSERT INTO `lucky_area` VALUES ('2817', '2806', '唐河县');
INSERT INTO `lucky_area` VALUES ('2818', '2806', '新野县');
INSERT INTO `lucky_area` VALUES ('2819', '2806', '桐柏县');
INSERT INTO `lucky_area` VALUES ('2820', '2806', '邓州市');
INSERT INTO `lucky_area` VALUES ('2821', '2674', '商丘市');
INSERT INTO `lucky_area` VALUES ('2822', '2821', '市辖区');
INSERT INTO `lucky_area` VALUES ('2823', '2821', '梁园区');
INSERT INTO `lucky_area` VALUES ('2824', '2821', '睢阳区');
INSERT INTO `lucky_area` VALUES ('2825', '2821', '民权县');
INSERT INTO `lucky_area` VALUES ('2826', '2821', '睢县');
INSERT INTO `lucky_area` VALUES ('2827', '2821', '宁陵县');
INSERT INTO `lucky_area` VALUES ('2828', '2821', '柘城县');
INSERT INTO `lucky_area` VALUES ('2829', '2821', '虞城县');
INSERT INTO `lucky_area` VALUES ('2830', '2821', '夏邑县');
INSERT INTO `lucky_area` VALUES ('2831', '2821', '永城市');
INSERT INTO `lucky_area` VALUES ('2832', '2674', '信阳市');
INSERT INTO `lucky_area` VALUES ('2833', '2832', '市辖区');
INSERT INTO `lucky_area` VALUES ('2834', '2832', '浉河区');
INSERT INTO `lucky_area` VALUES ('2835', '2832', '平桥区');
INSERT INTO `lucky_area` VALUES ('2836', '2832', '罗山县');
INSERT INTO `lucky_area` VALUES ('2837', '2832', '光山县');
INSERT INTO `lucky_area` VALUES ('2838', '2832', '新县');
INSERT INTO `lucky_area` VALUES ('2839', '2832', '商城县');
INSERT INTO `lucky_area` VALUES ('2840', '2832', '固始县');
INSERT INTO `lucky_area` VALUES ('2841', '2832', '潢川县');
INSERT INTO `lucky_area` VALUES ('2842', '2832', '淮滨县');
INSERT INTO `lucky_area` VALUES ('2843', '2832', '息县');
INSERT INTO `lucky_area` VALUES ('2844', '2674', '周口市');
INSERT INTO `lucky_area` VALUES ('2845', '2844', '市辖区');
INSERT INTO `lucky_area` VALUES ('2846', '2844', '川汇区');
INSERT INTO `lucky_area` VALUES ('2847', '2844', '扶沟县');
INSERT INTO `lucky_area` VALUES ('2848', '2844', '西华县');
INSERT INTO `lucky_area` VALUES ('2849', '2844', '商水县');
INSERT INTO `lucky_area` VALUES ('2850', '2844', '沈丘县');
INSERT INTO `lucky_area` VALUES ('2851', '2844', '郸城县');
INSERT INTO `lucky_area` VALUES ('2852', '2844', '淮阳县');
INSERT INTO `lucky_area` VALUES ('2853', '2844', '太康县');
INSERT INTO `lucky_area` VALUES ('2854', '2844', '鹿邑县');
INSERT INTO `lucky_area` VALUES ('2855', '2844', '项城市');
INSERT INTO `lucky_area` VALUES ('2856', '2674', '驻马店市');
INSERT INTO `lucky_area` VALUES ('2857', '2856', '市辖区');
INSERT INTO `lucky_area` VALUES ('2858', '2856', '驿城区');
INSERT INTO `lucky_area` VALUES ('2859', '2856', '西平县');
INSERT INTO `lucky_area` VALUES ('2860', '2856', '上蔡县');
INSERT INTO `lucky_area` VALUES ('2861', '2856', '平舆县');
INSERT INTO `lucky_area` VALUES ('2862', '2856', '正阳县');
INSERT INTO `lucky_area` VALUES ('2863', '2856', '确山县');
INSERT INTO `lucky_area` VALUES ('2864', '2856', '泌阳县');
INSERT INTO `lucky_area` VALUES ('2865', '2856', '汝南县');
INSERT INTO `lucky_area` VALUES ('2866', '2856', '遂平县');
INSERT INTO `lucky_area` VALUES ('2867', '2856', '新蔡县');
INSERT INTO `lucky_area` VALUES ('2868', '0', '湖北省');
INSERT INTO `lucky_area` VALUES ('2869', '2868', '武汉市');
INSERT INTO `lucky_area` VALUES ('2870', '2869', '市辖区');
INSERT INTO `lucky_area` VALUES ('2871', '2869', '江岸区');
INSERT INTO `lucky_area` VALUES ('2872', '2869', '江汉区');
INSERT INTO `lucky_area` VALUES ('2873', '2869', '硚口区');
INSERT INTO `lucky_area` VALUES ('2874', '2869', '汉阳区');
INSERT INTO `lucky_area` VALUES ('2875', '2869', '武昌区');
INSERT INTO `lucky_area` VALUES ('2876', '2869', '青山区');
INSERT INTO `lucky_area` VALUES ('2877', '2869', '洪山区');
INSERT INTO `lucky_area` VALUES ('2878', '2869', '东西湖区');
INSERT INTO `lucky_area` VALUES ('2879', '2869', '汉南区');
INSERT INTO `lucky_area` VALUES ('2880', '2869', '蔡甸区');
INSERT INTO `lucky_area` VALUES ('2881', '2869', '江夏区');
INSERT INTO `lucky_area` VALUES ('2882', '2869', '黄陂区');
INSERT INTO `lucky_area` VALUES ('2883', '2869', '新洲区');
INSERT INTO `lucky_area` VALUES ('2884', '2868', '黄石市');
INSERT INTO `lucky_area` VALUES ('2885', '2884', '市辖区');
INSERT INTO `lucky_area` VALUES ('2886', '2884', '黄石港区');
INSERT INTO `lucky_area` VALUES ('2887', '2884', '西塞山区');
INSERT INTO `lucky_area` VALUES ('2888', '2884', '下陆区');
INSERT INTO `lucky_area` VALUES ('2889', '2884', '铁山区');
INSERT INTO `lucky_area` VALUES ('2890', '2884', '阳新县');
INSERT INTO `lucky_area` VALUES ('2891', '2884', '大冶市');
INSERT INTO `lucky_area` VALUES ('2892', '2868', '十堰市');
INSERT INTO `lucky_area` VALUES ('2893', '2892', '市辖区');
INSERT INTO `lucky_area` VALUES ('2894', '2892', '茅箭区');
INSERT INTO `lucky_area` VALUES ('2895', '2892', '张湾区');
INSERT INTO `lucky_area` VALUES ('2896', '2892', '郧县');
INSERT INTO `lucky_area` VALUES ('2897', '2892', '郧西县');
INSERT INTO `lucky_area` VALUES ('2898', '2892', '竹山县');
INSERT INTO `lucky_area` VALUES ('2899', '2892', '竹溪县');
INSERT INTO `lucky_area` VALUES ('2900', '2892', '房县');
INSERT INTO `lucky_area` VALUES ('2901', '2892', '丹江口市');
INSERT INTO `lucky_area` VALUES ('2902', '2868', '宜昌市');
INSERT INTO `lucky_area` VALUES ('2903', '2902', '市辖区');
INSERT INTO `lucky_area` VALUES ('2904', '2902', '西陵区');
INSERT INTO `lucky_area` VALUES ('2905', '2902', '伍家岗区');
INSERT INTO `lucky_area` VALUES ('2906', '2902', '点军区');
INSERT INTO `lucky_area` VALUES ('2907', '2902', '猇亭区');
INSERT INTO `lucky_area` VALUES ('2908', '2902', '夷陵区');
INSERT INTO `lucky_area` VALUES ('2909', '2902', '远安县');
INSERT INTO `lucky_area` VALUES ('2910', '2902', '兴山县');
INSERT INTO `lucky_area` VALUES ('2911', '2902', '秭归县');
INSERT INTO `lucky_area` VALUES ('2912', '2902', '长阳土家族自治县');
INSERT INTO `lucky_area` VALUES ('2913', '2902', '五峰土家族自治县');
INSERT INTO `lucky_area` VALUES ('2914', '2902', '宜都市');
INSERT INTO `lucky_area` VALUES ('2915', '2902', '当阳市');
INSERT INTO `lucky_area` VALUES ('2916', '2902', '枝江市');
INSERT INTO `lucky_area` VALUES ('2917', '2868', '襄樊市');
INSERT INTO `lucky_area` VALUES ('2918', '2917', '市辖区');
INSERT INTO `lucky_area` VALUES ('2919', '2917', '襄城区');
INSERT INTO `lucky_area` VALUES ('2920', '2917', '樊城区');
INSERT INTO `lucky_area` VALUES ('2921', '2917', '襄阳区');
INSERT INTO `lucky_area` VALUES ('2922', '2917', '南漳县');
INSERT INTO `lucky_area` VALUES ('2923', '2917', '谷城县');
INSERT INTO `lucky_area` VALUES ('2924', '2917', '保康县');
INSERT INTO `lucky_area` VALUES ('2925', '2917', '老河口市');
INSERT INTO `lucky_area` VALUES ('2926', '2917', '枣阳市');
INSERT INTO `lucky_area` VALUES ('2927', '2917', '宜城市');
INSERT INTO `lucky_area` VALUES ('2928', '2868', '鄂州市');
INSERT INTO `lucky_area` VALUES ('2929', '2928', '市辖区');
INSERT INTO `lucky_area` VALUES ('2930', '2928', '梁子湖区');
INSERT INTO `lucky_area` VALUES ('2931', '2928', '华容区');
INSERT INTO `lucky_area` VALUES ('2932', '2928', '鄂城区');
INSERT INTO `lucky_area` VALUES ('2933', '2868', '荆门市');
INSERT INTO `lucky_area` VALUES ('2934', '2933', '市辖区');
INSERT INTO `lucky_area` VALUES ('2935', '2933', '东宝区');
INSERT INTO `lucky_area` VALUES ('2936', '2933', '掇刀区');
INSERT INTO `lucky_area` VALUES ('2937', '2933', '京山县');
INSERT INTO `lucky_area` VALUES ('2938', '2933', '沙洋县');
INSERT INTO `lucky_area` VALUES ('2939', '2933', '钟祥市');
INSERT INTO `lucky_area` VALUES ('2940', '2868', '孝感市');
INSERT INTO `lucky_area` VALUES ('2941', '2940', '市辖区');
INSERT INTO `lucky_area` VALUES ('2942', '2940', '孝南区');
INSERT INTO `lucky_area` VALUES ('2943', '2940', '孝昌县');
INSERT INTO `lucky_area` VALUES ('2944', '2940', '大悟县');
INSERT INTO `lucky_area` VALUES ('2945', '2940', '云梦县');
INSERT INTO `lucky_area` VALUES ('2946', '2940', '应城市');
INSERT INTO `lucky_area` VALUES ('2947', '2940', '安陆市');
INSERT INTO `lucky_area` VALUES ('2948', '2940', '汉川市');
INSERT INTO `lucky_area` VALUES ('2949', '2868', '荆州市');
INSERT INTO `lucky_area` VALUES ('2950', '2949', '市辖区');
INSERT INTO `lucky_area` VALUES ('2951', '2949', '沙市区');
INSERT INTO `lucky_area` VALUES ('2952', '2949', '荆州区');
INSERT INTO `lucky_area` VALUES ('2953', '2949', '公安县');
INSERT INTO `lucky_area` VALUES ('2954', '2949', '监利县');
INSERT INTO `lucky_area` VALUES ('2955', '2949', '江陵县');
INSERT INTO `lucky_area` VALUES ('2956', '2949', '石首市');
INSERT INTO `lucky_area` VALUES ('2957', '2949', '洪湖市');
INSERT INTO `lucky_area` VALUES ('2958', '2949', '松滋市');
INSERT INTO `lucky_area` VALUES ('2959', '2868', '黄冈市');
INSERT INTO `lucky_area` VALUES ('2960', '2959', '市辖区');
INSERT INTO `lucky_area` VALUES ('2961', '2959', '黄州区');
INSERT INTO `lucky_area` VALUES ('2962', '2959', '团风县');
INSERT INTO `lucky_area` VALUES ('2963', '2959', '红安县');
INSERT INTO `lucky_area` VALUES ('2964', '2959', '罗田县');
INSERT INTO `lucky_area` VALUES ('2965', '2959', '英山县');
INSERT INTO `lucky_area` VALUES ('2966', '2959', '浠水县');
INSERT INTO `lucky_area` VALUES ('2967', '2959', '蕲春县');
INSERT INTO `lucky_area` VALUES ('2968', '2959', '黄梅县');
INSERT INTO `lucky_area` VALUES ('2969', '2959', '麻城市');
INSERT INTO `lucky_area` VALUES ('2970', '2959', '武穴市');
INSERT INTO `lucky_area` VALUES ('2971', '2868', '咸宁市');
INSERT INTO `lucky_area` VALUES ('2972', '2971', '市辖区');
INSERT INTO `lucky_area` VALUES ('2973', '2971', '咸安区');
INSERT INTO `lucky_area` VALUES ('2974', '2971', '嘉鱼县');
INSERT INTO `lucky_area` VALUES ('2975', '2971', '通城县');
INSERT INTO `lucky_area` VALUES ('2976', '2971', '崇阳县');
INSERT INTO `lucky_area` VALUES ('2977', '2971', '通山县');
INSERT INTO `lucky_area` VALUES ('2978', '2971', '赤壁市');
INSERT INTO `lucky_area` VALUES ('2979', '2868', '随州市');
INSERT INTO `lucky_area` VALUES ('2980', '2979', '市辖区');
INSERT INTO `lucky_area` VALUES ('2981', '2979', '曾都区');
INSERT INTO `lucky_area` VALUES ('2982', '2979', '广水市');
INSERT INTO `lucky_area` VALUES ('2983', '2868', '恩施土家族苗族自治州');
INSERT INTO `lucky_area` VALUES ('2984', '2983', '恩施市');
INSERT INTO `lucky_area` VALUES ('2985', '2983', '利川市');
INSERT INTO `lucky_area` VALUES ('2986', '2983', '建始县');
INSERT INTO `lucky_area` VALUES ('2987', '2983', '巴东县');
INSERT INTO `lucky_area` VALUES ('2988', '2983', '宣恩县');
INSERT INTO `lucky_area` VALUES ('2989', '2983', '咸丰县');
INSERT INTO `lucky_area` VALUES ('2990', '2983', '来凤县');
INSERT INTO `lucky_area` VALUES ('2991', '2983', '鹤峰县');
INSERT INTO `lucky_area` VALUES ('2992', '2868', '省直辖行政单位');
INSERT INTO `lucky_area` VALUES ('2993', '2992', '仙桃市');
INSERT INTO `lucky_area` VALUES ('2994', '2992', '潜江市');
INSERT INTO `lucky_area` VALUES ('2995', '2992', '天门市');
INSERT INTO `lucky_area` VALUES ('2996', '2992', '神农架林区');
INSERT INTO `lucky_area` VALUES ('2997', '0', '湖南省');
INSERT INTO `lucky_area` VALUES ('2998', '2997', '长沙市');
INSERT INTO `lucky_area` VALUES ('2999', '2998', '市辖区');
INSERT INTO `lucky_area` VALUES ('3000', '2998', '芙蓉区');
INSERT INTO `lucky_area` VALUES ('3001', '2998', '天心区');
INSERT INTO `lucky_area` VALUES ('3002', '2998', '岳麓区');
INSERT INTO `lucky_area` VALUES ('3003', '2998', '开福区');
INSERT INTO `lucky_area` VALUES ('3004', '2998', '雨花区');
INSERT INTO `lucky_area` VALUES ('3005', '2998', '长沙县');
INSERT INTO `lucky_area` VALUES ('3006', '2998', '望城县');
INSERT INTO `lucky_area` VALUES ('3007', '2998', '宁乡县');
INSERT INTO `lucky_area` VALUES ('3008', '2998', '浏阳市');
INSERT INTO `lucky_area` VALUES ('3009', '2997', '株洲市');
INSERT INTO `lucky_area` VALUES ('3010', '3009', '市辖区');
INSERT INTO `lucky_area` VALUES ('3011', '3009', '荷塘区');
INSERT INTO `lucky_area` VALUES ('3012', '3009', '芦淞区');
INSERT INTO `lucky_area` VALUES ('3013', '3009', '石峰区');
INSERT INTO `lucky_area` VALUES ('3014', '3009', '天元区');
INSERT INTO `lucky_area` VALUES ('3015', '3009', '株洲县');
INSERT INTO `lucky_area` VALUES ('3016', '3009', '攸县');
INSERT INTO `lucky_area` VALUES ('3017', '3009', '茶陵县');
INSERT INTO `lucky_area` VALUES ('3018', '3009', '炎陵县');
INSERT INTO `lucky_area` VALUES ('3019', '3009', '醴陵市');
INSERT INTO `lucky_area` VALUES ('3020', '2997', '湘潭市');
INSERT INTO `lucky_area` VALUES ('3021', '3020', '市辖区');
INSERT INTO `lucky_area` VALUES ('3022', '3020', '雨湖区');
INSERT INTO `lucky_area` VALUES ('3023', '3020', '岳塘区');
INSERT INTO `lucky_area` VALUES ('3024', '3020', '湘潭县');
INSERT INTO `lucky_area` VALUES ('3025', '3020', '湘乡市');
INSERT INTO `lucky_area` VALUES ('3026', '3020', '韶山市');
INSERT INTO `lucky_area` VALUES ('3027', '2997', '衡阳市');
INSERT INTO `lucky_area` VALUES ('3028', '3027', '市辖区');
INSERT INTO `lucky_area` VALUES ('3029', '3027', '珠晖区');
INSERT INTO `lucky_area` VALUES ('3030', '3027', '雁峰区');
INSERT INTO `lucky_area` VALUES ('3031', '3027', '石鼓区');
INSERT INTO `lucky_area` VALUES ('3032', '3027', '蒸湘区');
INSERT INTO `lucky_area` VALUES ('3033', '3027', '南岳区');
INSERT INTO `lucky_area` VALUES ('3034', '3027', '衡阳县');
INSERT INTO `lucky_area` VALUES ('3035', '3027', '衡南县');
INSERT INTO `lucky_area` VALUES ('3036', '3027', '衡山县');
INSERT INTO `lucky_area` VALUES ('3037', '3027', '衡东县');
INSERT INTO `lucky_area` VALUES ('3038', '3027', '祁东县');
INSERT INTO `lucky_area` VALUES ('3039', '3027', '耒阳市');
INSERT INTO `lucky_area` VALUES ('3040', '3027', '常宁市');
INSERT INTO `lucky_area` VALUES ('3041', '2997', '邵阳市');
INSERT INTO `lucky_area` VALUES ('3042', '3041', '市辖区');
INSERT INTO `lucky_area` VALUES ('3043', '3041', '双清区');
INSERT INTO `lucky_area` VALUES ('3044', '3041', '大祥区');
INSERT INTO `lucky_area` VALUES ('3045', '3041', '北塔区');
INSERT INTO `lucky_area` VALUES ('3046', '3041', '邵东县');
INSERT INTO `lucky_area` VALUES ('3047', '3041', '新邵县');
INSERT INTO `lucky_area` VALUES ('3048', '3041', '邵阳县');
INSERT INTO `lucky_area` VALUES ('3049', '3041', '隆回县');
INSERT INTO `lucky_area` VALUES ('3050', '3041', '洞口县');
INSERT INTO `lucky_area` VALUES ('3051', '3041', '绥宁县');
INSERT INTO `lucky_area` VALUES ('3052', '3041', '新宁县');
INSERT INTO `lucky_area` VALUES ('3053', '3041', '城步苗族自治县');
INSERT INTO `lucky_area` VALUES ('3054', '3041', '武冈市');
INSERT INTO `lucky_area` VALUES ('3055', '2997', '岳阳市');
INSERT INTO `lucky_area` VALUES ('3056', '3055', '市辖区');
INSERT INTO `lucky_area` VALUES ('3057', '3055', '岳阳楼区');
INSERT INTO `lucky_area` VALUES ('3058', '3055', '云溪区');
INSERT INTO `lucky_area` VALUES ('3059', '3055', '君山区');
INSERT INTO `lucky_area` VALUES ('3060', '3055', '岳阳县');
INSERT INTO `lucky_area` VALUES ('3061', '3055', '华容县');
INSERT INTO `lucky_area` VALUES ('3062', '3055', '湘阴县');
INSERT INTO `lucky_area` VALUES ('3063', '3055', '平江县');
INSERT INTO `lucky_area` VALUES ('3064', '3055', '汨罗市');
INSERT INTO `lucky_area` VALUES ('3065', '3055', '临湘市');
INSERT INTO `lucky_area` VALUES ('3066', '2997', '常德市');
INSERT INTO `lucky_area` VALUES ('3067', '3066', '市辖区');
INSERT INTO `lucky_area` VALUES ('3068', '3066', '武陵区');
INSERT INTO `lucky_area` VALUES ('3069', '3066', '鼎城区');
INSERT INTO `lucky_area` VALUES ('3070', '3066', '安乡县');
INSERT INTO `lucky_area` VALUES ('3071', '3066', '汉寿县');
INSERT INTO `lucky_area` VALUES ('3072', '3066', '澧县');
INSERT INTO `lucky_area` VALUES ('3073', '3066', '临澧县');
INSERT INTO `lucky_area` VALUES ('3074', '3066', '桃源县');
INSERT INTO `lucky_area` VALUES ('3075', '3066', '石门县');
INSERT INTO `lucky_area` VALUES ('3076', '3066', '津市市');
INSERT INTO `lucky_area` VALUES ('3077', '2997', '张家界市');
INSERT INTO `lucky_area` VALUES ('3078', '3077', '市辖区');
INSERT INTO `lucky_area` VALUES ('3079', '3077', '永定区');
INSERT INTO `lucky_area` VALUES ('3080', '3077', '武陵源区');
INSERT INTO `lucky_area` VALUES ('3081', '3077', '慈利县');
INSERT INTO `lucky_area` VALUES ('3082', '3077', '桑植县');
INSERT INTO `lucky_area` VALUES ('3083', '2997', '益阳市');
INSERT INTO `lucky_area` VALUES ('3084', '3083', '市辖区');
INSERT INTO `lucky_area` VALUES ('3085', '3083', '资阳区');
INSERT INTO `lucky_area` VALUES ('3086', '3083', '赫山区');
INSERT INTO `lucky_area` VALUES ('3087', '3083', '南县');
INSERT INTO `lucky_area` VALUES ('3088', '3083', '桃江县');
INSERT INTO `lucky_area` VALUES ('3089', '3083', '安化县');
INSERT INTO `lucky_area` VALUES ('3090', '3083', '沅江市');
INSERT INTO `lucky_area` VALUES ('3091', '2997', '郴州市');
INSERT INTO `lucky_area` VALUES ('3092', '3091', '市辖区');
INSERT INTO `lucky_area` VALUES ('3093', '3091', '北湖区');
INSERT INTO `lucky_area` VALUES ('3094', '3091', '苏仙区');
INSERT INTO `lucky_area` VALUES ('3095', '3091', '桂阳县');
INSERT INTO `lucky_area` VALUES ('3096', '3091', '宜章县');
INSERT INTO `lucky_area` VALUES ('3097', '3091', '永兴县');
INSERT INTO `lucky_area` VALUES ('3098', '3091', '嘉禾县');
INSERT INTO `lucky_area` VALUES ('3099', '3091', '临武县');
INSERT INTO `lucky_area` VALUES ('3100', '3091', '汝城县');
INSERT INTO `lucky_area` VALUES ('3101', '3091', '桂东县');
INSERT INTO `lucky_area` VALUES ('3102', '3091', '安仁县');
INSERT INTO `lucky_area` VALUES ('3103', '3091', '资兴市');
INSERT INTO `lucky_area` VALUES ('3104', '2997', '永州市');
INSERT INTO `lucky_area` VALUES ('3105', '3104', '市辖区');
INSERT INTO `lucky_area` VALUES ('3106', '3104', '零陵区');
INSERT INTO `lucky_area` VALUES ('3107', '3104', '冷水滩区');
INSERT INTO `lucky_area` VALUES ('3108', '3104', '祁阳县');
INSERT INTO `lucky_area` VALUES ('3109', '3104', '东安县');
INSERT INTO `lucky_area` VALUES ('3110', '3104', '双牌县');
INSERT INTO `lucky_area` VALUES ('3111', '3104', '道县');
INSERT INTO `lucky_area` VALUES ('3112', '3104', '江永县');
INSERT INTO `lucky_area` VALUES ('3113', '3104', '宁远县');
INSERT INTO `lucky_area` VALUES ('3114', '3104', '蓝山县');
INSERT INTO `lucky_area` VALUES ('3115', '3104', '新田县');
INSERT INTO `lucky_area` VALUES ('3116', '3104', '江华瑶族自治县');
INSERT INTO `lucky_area` VALUES ('3117', '2997', '怀化市');
INSERT INTO `lucky_area` VALUES ('3118', '3117', '市辖区');
INSERT INTO `lucky_area` VALUES ('3119', '3117', '鹤城区');
INSERT INTO `lucky_area` VALUES ('3120', '3117', '中方县');
INSERT INTO `lucky_area` VALUES ('3121', '3117', '沅陵县');
INSERT INTO `lucky_area` VALUES ('3122', '3117', '辰溪县');
INSERT INTO `lucky_area` VALUES ('3123', '3117', '溆浦县');
INSERT INTO `lucky_area` VALUES ('3124', '3117', '会同县');
INSERT INTO `lucky_area` VALUES ('3125', '3117', '麻阳苗族自治县');
INSERT INTO `lucky_area` VALUES ('3126', '3117', '新晃侗族自治县');
INSERT INTO `lucky_area` VALUES ('3127', '3117', '芷江侗族自治县');
INSERT INTO `lucky_area` VALUES ('3128', '3117', '靖州苗族侗族自治县');
INSERT INTO `lucky_area` VALUES ('3129', '3117', '通道侗族自治县');
INSERT INTO `lucky_area` VALUES ('3130', '3117', '洪江市');
INSERT INTO `lucky_area` VALUES ('3131', '2997', '娄底市');
INSERT INTO `lucky_area` VALUES ('3132', '3131', '市辖区');
INSERT INTO `lucky_area` VALUES ('3133', '3131', '娄星区');
INSERT INTO `lucky_area` VALUES ('3134', '3131', '双峰县');
INSERT INTO `lucky_area` VALUES ('3135', '3131', '新化县');
INSERT INTO `lucky_area` VALUES ('3136', '3131', '冷水江市');
INSERT INTO `lucky_area` VALUES ('3137', '3131', '涟源市');
INSERT INTO `lucky_area` VALUES ('3138', '2997', '湘西土家族苗族自治州');
INSERT INTO `lucky_area` VALUES ('3139', '3138', '吉首市');
INSERT INTO `lucky_area` VALUES ('3140', '3138', '泸溪县');
INSERT INTO `lucky_area` VALUES ('3141', '3138', '凤凰县');
INSERT INTO `lucky_area` VALUES ('3142', '3138', '花垣县');
INSERT INTO `lucky_area` VALUES ('3143', '3138', '保靖县');
INSERT INTO `lucky_area` VALUES ('3144', '3138', '古丈县');
INSERT INTO `lucky_area` VALUES ('3145', '3138', '永顺县');
INSERT INTO `lucky_area` VALUES ('3146', '3138', '龙山县');
INSERT INTO `lucky_area` VALUES ('3147', '0', '广东省');
INSERT INTO `lucky_area` VALUES ('3148', '3147', '广州市');
INSERT INTO `lucky_area` VALUES ('3149', '3148', '市辖区');
INSERT INTO `lucky_area` VALUES ('3150', '3148', '荔湾区');
INSERT INTO `lucky_area` VALUES ('3151', '3148', '越秀区');
INSERT INTO `lucky_area` VALUES ('3152', '3148', '海珠区');
INSERT INTO `lucky_area` VALUES ('3153', '3148', '天河区');
INSERT INTO `lucky_area` VALUES ('3154', '3148', '白云区');
INSERT INTO `lucky_area` VALUES ('3155', '3148', '黄埔区');
INSERT INTO `lucky_area` VALUES ('3156', '3148', '番禺区');
INSERT INTO `lucky_area` VALUES ('3157', '3148', '花都区');
INSERT INTO `lucky_area` VALUES ('3158', '3148', '南沙区');
INSERT INTO `lucky_area` VALUES ('3159', '3148', '萝岗区');
INSERT INTO `lucky_area` VALUES ('3160', '3148', '增城市');
INSERT INTO `lucky_area` VALUES ('3161', '3148', '从化市');
INSERT INTO `lucky_area` VALUES ('3162', '3147', '韶关市');
INSERT INTO `lucky_area` VALUES ('3163', '3162', '市辖区');
INSERT INTO `lucky_area` VALUES ('3164', '3162', '武江区');
INSERT INTO `lucky_area` VALUES ('3165', '3162', '浈江区');
INSERT INTO `lucky_area` VALUES ('3166', '3162', '曲江区');
INSERT INTO `lucky_area` VALUES ('3167', '3162', '始兴县');
INSERT INTO `lucky_area` VALUES ('3168', '3162', '仁化县');
INSERT INTO `lucky_area` VALUES ('3169', '3162', '翁源县');
INSERT INTO `lucky_area` VALUES ('3170', '3162', '乳源瑶族自治县');
INSERT INTO `lucky_area` VALUES ('3171', '3162', '新丰县');
INSERT INTO `lucky_area` VALUES ('3172', '3162', '乐昌市');
INSERT INTO `lucky_area` VALUES ('3173', '3162', '南雄市');
INSERT INTO `lucky_area` VALUES ('3174', '3147', '深圳市');
INSERT INTO `lucky_area` VALUES ('3175', '3174', '市辖区');
INSERT INTO `lucky_area` VALUES ('3176', '3174', '罗湖区');
INSERT INTO `lucky_area` VALUES ('3177', '3174', '福田区');
INSERT INTO `lucky_area` VALUES ('3178', '3174', '南山区');
INSERT INTO `lucky_area` VALUES ('3179', '3174', '宝安区');
INSERT INTO `lucky_area` VALUES ('3180', '3174', '龙岗区');
INSERT INTO `lucky_area` VALUES ('3181', '3174', '盐田区');
INSERT INTO `lucky_area` VALUES ('3182', '3147', '珠海市');
INSERT INTO `lucky_area` VALUES ('3183', '3182', '市辖区');
INSERT INTO `lucky_area` VALUES ('3184', '3182', '香洲区');
INSERT INTO `lucky_area` VALUES ('3185', '3182', '斗门区');
INSERT INTO `lucky_area` VALUES ('3186', '3182', '金湾区');
INSERT INTO `lucky_area` VALUES ('3187', '3147', '汕头市');
INSERT INTO `lucky_area` VALUES ('3188', '3187', '市辖区');
INSERT INTO `lucky_area` VALUES ('3189', '3187', '龙湖区');
INSERT INTO `lucky_area` VALUES ('3190', '3187', '金平区');
INSERT INTO `lucky_area` VALUES ('3191', '3187', '濠江区');
INSERT INTO `lucky_area` VALUES ('3192', '3187', '潮阳区');
INSERT INTO `lucky_area` VALUES ('3193', '3187', '潮南区');
INSERT INTO `lucky_area` VALUES ('3194', '3187', '澄海区');
INSERT INTO `lucky_area` VALUES ('3195', '3187', '南澳县');
INSERT INTO `lucky_area` VALUES ('3196', '3147', '佛山市');
INSERT INTO `lucky_area` VALUES ('3197', '3196', '市辖区');
INSERT INTO `lucky_area` VALUES ('3198', '3196', '禅城区');
INSERT INTO `lucky_area` VALUES ('3199', '3196', '南海区');
INSERT INTO `lucky_area` VALUES ('3200', '3196', '顺德区');
INSERT INTO `lucky_area` VALUES ('3201', '3196', '三水区');
INSERT INTO `lucky_area` VALUES ('3202', '3196', '高明区');
INSERT INTO `lucky_area` VALUES ('3203', '3147', '江门市');
INSERT INTO `lucky_area` VALUES ('3204', '3203', '市辖区');
INSERT INTO `lucky_area` VALUES ('3205', '3203', '蓬江区');
INSERT INTO `lucky_area` VALUES ('3206', '3203', '江海区');
INSERT INTO `lucky_area` VALUES ('3207', '3203', '新会区');
INSERT INTO `lucky_area` VALUES ('3208', '3203', '台山市');
INSERT INTO `lucky_area` VALUES ('3209', '3203', '开平市');
INSERT INTO `lucky_area` VALUES ('3210', '3203', '鹤山市');
INSERT INTO `lucky_area` VALUES ('3211', '3203', '恩平市');
INSERT INTO `lucky_area` VALUES ('3212', '3147', '湛江市');
INSERT INTO `lucky_area` VALUES ('3213', '3212', '市辖区');
INSERT INTO `lucky_area` VALUES ('3214', '3212', '赤坎区');
INSERT INTO `lucky_area` VALUES ('3215', '3212', '霞山区');
INSERT INTO `lucky_area` VALUES ('3216', '3212', '坡头区');
INSERT INTO `lucky_area` VALUES ('3217', '3212', '麻章区');
INSERT INTO `lucky_area` VALUES ('3218', '3212', '遂溪县');
INSERT INTO `lucky_area` VALUES ('3219', '3212', '徐闻县');
INSERT INTO `lucky_area` VALUES ('3220', '3212', '廉江市');
INSERT INTO `lucky_area` VALUES ('3221', '3212', '雷州市');
INSERT INTO `lucky_area` VALUES ('3222', '3212', '吴川市');
INSERT INTO `lucky_area` VALUES ('3223', '3147', '茂名市');
INSERT INTO `lucky_area` VALUES ('3224', '3223', '市辖区');
INSERT INTO `lucky_area` VALUES ('3225', '3223', '茂南区');
INSERT INTO `lucky_area` VALUES ('3226', '3223', '茂港区');
INSERT INTO `lucky_area` VALUES ('3227', '3223', '电白县');
INSERT INTO `lucky_area` VALUES ('3228', '3223', '高州市');
INSERT INTO `lucky_area` VALUES ('3229', '3223', '化州市');
INSERT INTO `lucky_area` VALUES ('3230', '3223', '信宜市');
INSERT INTO `lucky_area` VALUES ('3231', '3147', '肇庆市');
INSERT INTO `lucky_area` VALUES ('3232', '3231', '市辖区');
INSERT INTO `lucky_area` VALUES ('3233', '3231', '端州区');
INSERT INTO `lucky_area` VALUES ('3234', '3231', '鼎湖区');
INSERT INTO `lucky_area` VALUES ('3235', '3231', '广宁县');
INSERT INTO `lucky_area` VALUES ('3236', '3231', '怀集县');
INSERT INTO `lucky_area` VALUES ('3237', '3231', '封开县');
INSERT INTO `lucky_area` VALUES ('3238', '3231', '德庆县');
INSERT INTO `lucky_area` VALUES ('3239', '3231', '高要市');
INSERT INTO `lucky_area` VALUES ('3240', '3231', '四会市');
INSERT INTO `lucky_area` VALUES ('3241', '3147', '惠州市');
INSERT INTO `lucky_area` VALUES ('3242', '3241', '市辖区');
INSERT INTO `lucky_area` VALUES ('3243', '3241', '惠城区');
INSERT INTO `lucky_area` VALUES ('3244', '3241', '惠阳区');
INSERT INTO `lucky_area` VALUES ('3245', '3241', '博罗县');
INSERT INTO `lucky_area` VALUES ('3246', '3241', '惠东县');
INSERT INTO `lucky_area` VALUES ('3247', '3241', '龙门县');
INSERT INTO `lucky_area` VALUES ('3248', '3147', '梅州市');
INSERT INTO `lucky_area` VALUES ('3249', '3248', '市辖区');
INSERT INTO `lucky_area` VALUES ('3250', '3248', '梅江区');
INSERT INTO `lucky_area` VALUES ('3251', '3248', '梅县');
INSERT INTO `lucky_area` VALUES ('3252', '3248', '大埔县');
INSERT INTO `lucky_area` VALUES ('3253', '3248', '丰顺县');
INSERT INTO `lucky_area` VALUES ('3254', '3248', '五华县');
INSERT INTO `lucky_area` VALUES ('3255', '3248', '平远县');
INSERT INTO `lucky_area` VALUES ('3256', '3248', '蕉岭县');
INSERT INTO `lucky_area` VALUES ('3257', '3248', '兴宁市');
INSERT INTO `lucky_area` VALUES ('3258', '3147', '汕尾市');
INSERT INTO `lucky_area` VALUES ('3259', '3258', '市辖区');
INSERT INTO `lucky_area` VALUES ('3260', '3258', '城区');
INSERT INTO `lucky_area` VALUES ('3261', '3258', '海丰县');
INSERT INTO `lucky_area` VALUES ('3262', '3258', '陆河县');
INSERT INTO `lucky_area` VALUES ('3263', '3258', '陆丰市');
INSERT INTO `lucky_area` VALUES ('3264', '3147', '河源市');
INSERT INTO `lucky_area` VALUES ('3265', '3264', '市辖区');
INSERT INTO `lucky_area` VALUES ('3266', '3264', '源城区');
INSERT INTO `lucky_area` VALUES ('3267', '3264', '紫金县');
INSERT INTO `lucky_area` VALUES ('3268', '3264', '龙川县');
INSERT INTO `lucky_area` VALUES ('3269', '3264', '连平县');
INSERT INTO `lucky_area` VALUES ('3270', '3264', '和平县');
INSERT INTO `lucky_area` VALUES ('3271', '3264', '东源县');
INSERT INTO `lucky_area` VALUES ('3272', '3147', '阳江市');
INSERT INTO `lucky_area` VALUES ('3273', '3272', '市辖区');
INSERT INTO `lucky_area` VALUES ('3274', '3272', '江城区');
INSERT INTO `lucky_area` VALUES ('3275', '3272', '阳西县');
INSERT INTO `lucky_area` VALUES ('3276', '3272', '阳东县');
INSERT INTO `lucky_area` VALUES ('3277', '3272', '阳春市');
INSERT INTO `lucky_area` VALUES ('3278', '3147', '清远市');
INSERT INTO `lucky_area` VALUES ('3279', '3278', '市辖区');
INSERT INTO `lucky_area` VALUES ('3280', '3278', '清城区');
INSERT INTO `lucky_area` VALUES ('3281', '3278', '佛冈县');
INSERT INTO `lucky_area` VALUES ('3282', '3278', '阳山县');
INSERT INTO `lucky_area` VALUES ('3283', '3278', '连山壮族瑶族自治县');
INSERT INTO `lucky_area` VALUES ('3284', '3278', '连南瑶族自治县');
INSERT INTO `lucky_area` VALUES ('3285', '3278', '清新县');
INSERT INTO `lucky_area` VALUES ('3286', '3278', '英德市');
INSERT INTO `lucky_area` VALUES ('3287', '3278', '连州市');
INSERT INTO `lucky_area` VALUES ('3288', '3147', '东莞市');
INSERT INTO `lucky_area` VALUES ('3289', '3147', '中山市');
INSERT INTO `lucky_area` VALUES ('3290', '3147', '潮州市');
INSERT INTO `lucky_area` VALUES ('3291', '3290', '市辖区');
INSERT INTO `lucky_area` VALUES ('3292', '3290', '湘桥区');
INSERT INTO `lucky_area` VALUES ('3293', '3290', '潮安县');
INSERT INTO `lucky_area` VALUES ('3294', '3290', '饶平县');
INSERT INTO `lucky_area` VALUES ('3295', '3147', '揭阳市');
INSERT INTO `lucky_area` VALUES ('3296', '3295', '市辖区');
INSERT INTO `lucky_area` VALUES ('3297', '3295', '榕城区');
INSERT INTO `lucky_area` VALUES ('3298', '3295', '揭东县');
INSERT INTO `lucky_area` VALUES ('3299', '3295', '揭西县');
INSERT INTO `lucky_area` VALUES ('3300', '3295', '惠来县');
INSERT INTO `lucky_area` VALUES ('3301', '3295', '普宁市');
INSERT INTO `lucky_area` VALUES ('3302', '3147', '云浮市');
INSERT INTO `lucky_area` VALUES ('3303', '3302', '市辖区');
INSERT INTO `lucky_area` VALUES ('3304', '3302', '云城区');
INSERT INTO `lucky_area` VALUES ('3305', '3302', '新兴县');
INSERT INTO `lucky_area` VALUES ('3306', '3302', '郁南县');
INSERT INTO `lucky_area` VALUES ('3307', '3302', '云安县');
INSERT INTO `lucky_area` VALUES ('3308', '3302', '罗定市');
INSERT INTO `lucky_area` VALUES ('3309', '0', '广西壮族自治区');
INSERT INTO `lucky_area` VALUES ('3310', '3309', '南宁市');
INSERT INTO `lucky_area` VALUES ('3311', '3310', '市辖区');
INSERT INTO `lucky_area` VALUES ('3312', '3310', '兴宁区');
INSERT INTO `lucky_area` VALUES ('3313', '3310', '青秀区');
INSERT INTO `lucky_area` VALUES ('3314', '3310', '江南区');
INSERT INTO `lucky_area` VALUES ('3315', '3310', '西乡塘区');
INSERT INTO `lucky_area` VALUES ('3316', '3310', '良庆区');
INSERT INTO `lucky_area` VALUES ('3317', '3310', '邕宁区');
INSERT INTO `lucky_area` VALUES ('3318', '3310', '武鸣县');
INSERT INTO `lucky_area` VALUES ('3319', '3310', '隆安县');
INSERT INTO `lucky_area` VALUES ('3320', '3310', '马山县');
INSERT INTO `lucky_area` VALUES ('3321', '3310', '上林县');
INSERT INTO `lucky_area` VALUES ('3322', '3310', '宾阳县');
INSERT INTO `lucky_area` VALUES ('3323', '3310', '横县');
INSERT INTO `lucky_area` VALUES ('3324', '3309', '柳州市');
INSERT INTO `lucky_area` VALUES ('3325', '3324', '市辖区');
INSERT INTO `lucky_area` VALUES ('3326', '3324', '城中区');
INSERT INTO `lucky_area` VALUES ('3327', '3324', '鱼峰区');
INSERT INTO `lucky_area` VALUES ('3328', '3324', '柳南区');
INSERT INTO `lucky_area` VALUES ('3329', '3324', '柳北区');
INSERT INTO `lucky_area` VALUES ('3330', '3324', '柳江县');
INSERT INTO `lucky_area` VALUES ('3331', '3324', '柳城县');
INSERT INTO `lucky_area` VALUES ('3332', '3324', '鹿寨县');
INSERT INTO `lucky_area` VALUES ('3333', '3324', '融安县');
INSERT INTO `lucky_area` VALUES ('3334', '3324', '融水苗族自治县');
INSERT INTO `lucky_area` VALUES ('3335', '3324', '三江侗族自治县');
INSERT INTO `lucky_area` VALUES ('3336', '3309', '桂林市');
INSERT INTO `lucky_area` VALUES ('3337', '3336', '市辖区');
INSERT INTO `lucky_area` VALUES ('3338', '3336', '秀峰区');
INSERT INTO `lucky_area` VALUES ('3339', '3336', '叠彩区');
INSERT INTO `lucky_area` VALUES ('3340', '3336', '象山区');
INSERT INTO `lucky_area` VALUES ('3341', '3336', '七星区');
INSERT INTO `lucky_area` VALUES ('3342', '3336', '雁山区');
INSERT INTO `lucky_area` VALUES ('3343', '3336', '阳朔县');
INSERT INTO `lucky_area` VALUES ('3344', '3336', '临桂县');
INSERT INTO `lucky_area` VALUES ('3345', '3336', '灵川县');
INSERT INTO `lucky_area` VALUES ('3346', '3336', '全州县');
INSERT INTO `lucky_area` VALUES ('3347', '3336', '兴安县');
INSERT INTO `lucky_area` VALUES ('3348', '3336', '永福县');
INSERT INTO `lucky_area` VALUES ('3349', '3336', '灌阳县');
INSERT INTO `lucky_area` VALUES ('3350', '3336', '龙胜各族自治县');
INSERT INTO `lucky_area` VALUES ('3351', '3336', '资源县');
INSERT INTO `lucky_area` VALUES ('3352', '3336', '平乐县');
INSERT INTO `lucky_area` VALUES ('3353', '3336', '荔蒲县');
INSERT INTO `lucky_area` VALUES ('3354', '3336', '恭城瑶族自治县');
INSERT INTO `lucky_area` VALUES ('3355', '3309', '梧州市');
INSERT INTO `lucky_area` VALUES ('3356', '3355', '市辖区');
INSERT INTO `lucky_area` VALUES ('3357', '3355', '万秀区');
INSERT INTO `lucky_area` VALUES ('3358', '3355', '蝶山区');
INSERT INTO `lucky_area` VALUES ('3359', '3355', '长洲区');
INSERT INTO `lucky_area` VALUES ('3360', '3355', '苍梧县');
INSERT INTO `lucky_area` VALUES ('3361', '3355', '藤县');
INSERT INTO `lucky_area` VALUES ('3362', '3355', '蒙山县');
INSERT INTO `lucky_area` VALUES ('3363', '3355', '岑溪市');
INSERT INTO `lucky_area` VALUES ('3364', '3309', '北海市');
INSERT INTO `lucky_area` VALUES ('3365', '3364', '市辖区');
INSERT INTO `lucky_area` VALUES ('3366', '3364', '海城区');
INSERT INTO `lucky_area` VALUES ('3367', '3364', '银海区');
INSERT INTO `lucky_area` VALUES ('3368', '3364', '铁山港区');
INSERT INTO `lucky_area` VALUES ('3369', '3364', '合浦县');
INSERT INTO `lucky_area` VALUES ('3370', '3309', '防城港市');
INSERT INTO `lucky_area` VALUES ('3371', '3370', '市辖区');
INSERT INTO `lucky_area` VALUES ('3372', '3370', '港口区');
INSERT INTO `lucky_area` VALUES ('3373', '3370', '防城区');
INSERT INTO `lucky_area` VALUES ('3374', '3370', '上思县');
INSERT INTO `lucky_area` VALUES ('3375', '3370', '东兴市');
INSERT INTO `lucky_area` VALUES ('3376', '3309', '钦州市');
INSERT INTO `lucky_area` VALUES ('3377', '3376', '市辖区');
INSERT INTO `lucky_area` VALUES ('3378', '3376', '钦南区');
INSERT INTO `lucky_area` VALUES ('3379', '3376', '钦北区');
INSERT INTO `lucky_area` VALUES ('3380', '3376', '灵山县');
INSERT INTO `lucky_area` VALUES ('3381', '3376', '浦北县');
INSERT INTO `lucky_area` VALUES ('3382', '3309', '贵港市');
INSERT INTO `lucky_area` VALUES ('3383', '3382', '市辖区');
INSERT INTO `lucky_area` VALUES ('3384', '3382', '港北区');
INSERT INTO `lucky_area` VALUES ('3385', '3382', '港南区');
INSERT INTO `lucky_area` VALUES ('3386', '3382', '覃塘区');
INSERT INTO `lucky_area` VALUES ('3387', '3382', '平南县');
INSERT INTO `lucky_area` VALUES ('3388', '3382', '桂平市');
INSERT INTO `lucky_area` VALUES ('3389', '3309', '玉林市');
INSERT INTO `lucky_area` VALUES ('3390', '3389', '市辖区');
INSERT INTO `lucky_area` VALUES ('3391', '3389', '玉州区');
INSERT INTO `lucky_area` VALUES ('3392', '3389', '容县');
INSERT INTO `lucky_area` VALUES ('3393', '3389', '陆川县');
INSERT INTO `lucky_area` VALUES ('3394', '3389', '博白县');
INSERT INTO `lucky_area` VALUES ('3395', '3389', '兴业县');
INSERT INTO `lucky_area` VALUES ('3396', '3389', '北流市');
INSERT INTO `lucky_area` VALUES ('3397', '3309', '百色市');
INSERT INTO `lucky_area` VALUES ('3398', '3397', '市辖区');
INSERT INTO `lucky_area` VALUES ('3399', '3397', '右江区');
INSERT INTO `lucky_area` VALUES ('3400', '3397', '田阳县');
INSERT INTO `lucky_area` VALUES ('3401', '3397', '田东县');
INSERT INTO `lucky_area` VALUES ('3402', '3397', '平果县');
INSERT INTO `lucky_area` VALUES ('3403', '3397', '德保县');
INSERT INTO `lucky_area` VALUES ('3404', '3397', '靖西县');
INSERT INTO `lucky_area` VALUES ('3405', '3397', '那坡县');
INSERT INTO `lucky_area` VALUES ('3406', '3397', '凌云县');
INSERT INTO `lucky_area` VALUES ('3407', '3397', '乐业县');
INSERT INTO `lucky_area` VALUES ('3408', '3397', '田林县');
INSERT INTO `lucky_area` VALUES ('3409', '3397', '西林县');
INSERT INTO `lucky_area` VALUES ('3410', '3397', '隆林各族自治县');
INSERT INTO `lucky_area` VALUES ('3411', '3309', '贺州市');
INSERT INTO `lucky_area` VALUES ('3412', '3411', '市辖区');
INSERT INTO `lucky_area` VALUES ('3413', '3411', '八步区');
INSERT INTO `lucky_area` VALUES ('3414', '3411', '昭平县');
INSERT INTO `lucky_area` VALUES ('3415', '3411', '钟山县');
INSERT INTO `lucky_area` VALUES ('3416', '3411', '富川瑶族自治县');
INSERT INTO `lucky_area` VALUES ('3417', '3309', '河池市');
INSERT INTO `lucky_area` VALUES ('3418', '3417', '市辖区');
INSERT INTO `lucky_area` VALUES ('3419', '3417', '金城江区');
INSERT INTO `lucky_area` VALUES ('3420', '3417', '南丹县');
INSERT INTO `lucky_area` VALUES ('3421', '3417', '天峨县');
INSERT INTO `lucky_area` VALUES ('3422', '3417', '凤山县');
INSERT INTO `lucky_area` VALUES ('3423', '3417', '东兰县');
INSERT INTO `lucky_area` VALUES ('3424', '3417', '罗城仫佬族自治县');
INSERT INTO `lucky_area` VALUES ('3425', '3417', '环江毛南族自治县');
INSERT INTO `lucky_area` VALUES ('3426', '3417', '巴马瑶族自治县');
INSERT INTO `lucky_area` VALUES ('3427', '3417', '都安瑶族自治县');
INSERT INTO `lucky_area` VALUES ('3428', '3417', '大化瑶族自治县');
INSERT INTO `lucky_area` VALUES ('3429', '3417', '宜州市');
INSERT INTO `lucky_area` VALUES ('3430', '3309', '来宾市');
INSERT INTO `lucky_area` VALUES ('3431', '3430', '市辖区');
INSERT INTO `lucky_area` VALUES ('3432', '3430', '兴宾区');
INSERT INTO `lucky_area` VALUES ('3433', '3430', '忻城县');
INSERT INTO `lucky_area` VALUES ('3434', '3430', '象州县');
INSERT INTO `lucky_area` VALUES ('3435', '3430', '武宣县');
INSERT INTO `lucky_area` VALUES ('3436', '3430', '金秀瑶族自治县');
INSERT INTO `lucky_area` VALUES ('3437', '3430', '合山市');
INSERT INTO `lucky_area` VALUES ('3438', '3309', '崇左市');
INSERT INTO `lucky_area` VALUES ('3439', '3438', '市辖区');
INSERT INTO `lucky_area` VALUES ('3440', '3438', '江洲区');
INSERT INTO `lucky_area` VALUES ('3441', '3438', '扶绥县');
INSERT INTO `lucky_area` VALUES ('3442', '3438', '宁明县');
INSERT INTO `lucky_area` VALUES ('3443', '3438', '龙州县');
INSERT INTO `lucky_area` VALUES ('3444', '3438', '大新县');
INSERT INTO `lucky_area` VALUES ('3445', '3438', '天等县');
INSERT INTO `lucky_area` VALUES ('3446', '3438', '凭祥市');
INSERT INTO `lucky_area` VALUES ('3447', '0', '海南省');
INSERT INTO `lucky_area` VALUES ('3448', '3447', '海口市');
INSERT INTO `lucky_area` VALUES ('3449', '3448', '市辖区');
INSERT INTO `lucky_area` VALUES ('3450', '3448', '秀英区');
INSERT INTO `lucky_area` VALUES ('3451', '3448', '龙华区');
INSERT INTO `lucky_area` VALUES ('3452', '3448', '琼山区');
INSERT INTO `lucky_area` VALUES ('3453', '3448', '美兰区');
INSERT INTO `lucky_area` VALUES ('3454', '3447', '三亚市');
INSERT INTO `lucky_area` VALUES ('3455', '3454', '市辖区');
INSERT INTO `lucky_area` VALUES ('3456', '3447', '省直辖县级行政单位');
INSERT INTO `lucky_area` VALUES ('3457', '3456', '五指山市');
INSERT INTO `lucky_area` VALUES ('3458', '3456', '琼海市');
INSERT INTO `lucky_area` VALUES ('3459', '3456', '儋州市');
INSERT INTO `lucky_area` VALUES ('3460', '3456', '文昌市');
INSERT INTO `lucky_area` VALUES ('3461', '3456', '万宁市');
INSERT INTO `lucky_area` VALUES ('3462', '3456', '东方市');
INSERT INTO `lucky_area` VALUES ('3463', '3456', '定安县');
INSERT INTO `lucky_area` VALUES ('3464', '3456', '屯昌县');
INSERT INTO `lucky_area` VALUES ('3465', '3456', '澄迈县');
INSERT INTO `lucky_area` VALUES ('3466', '3456', '临高县');
INSERT INTO `lucky_area` VALUES ('3467', '3456', '白沙黎族自治县');
INSERT INTO `lucky_area` VALUES ('3468', '3456', '昌江黎族自治县');
INSERT INTO `lucky_area` VALUES ('3469', '3456', '乐东黎族自治县');
INSERT INTO `lucky_area` VALUES ('3470', '3456', '陵水黎族自治县');
INSERT INTO `lucky_area` VALUES ('3471', '3456', '保亭黎族苗族自治县');
INSERT INTO `lucky_area` VALUES ('3472', '3456', '琼中黎族苗族自治县');
INSERT INTO `lucky_area` VALUES ('3473', '3456', '西沙群岛');
INSERT INTO `lucky_area` VALUES ('3474', '3456', '南沙群岛');
INSERT INTO `lucky_area` VALUES ('3475', '3456', '中沙群岛的岛礁及其海域');
INSERT INTO `lucky_area` VALUES ('3476', '0', '重庆市');
INSERT INTO `lucky_area` VALUES ('3477', '3476', '市辖区');
INSERT INTO `lucky_area` VALUES ('3478', '3477', '万州区');
INSERT INTO `lucky_area` VALUES ('3479', '3477', '涪陵区');
INSERT INTO `lucky_area` VALUES ('3480', '3477', '渝中区');
INSERT INTO `lucky_area` VALUES ('3481', '3477', '大渡口区');
INSERT INTO `lucky_area` VALUES ('3482', '3477', '江北区');
INSERT INTO `lucky_area` VALUES ('3483', '3477', '沙坪坝区');
INSERT INTO `lucky_area` VALUES ('3484', '3477', '九龙坡区');
INSERT INTO `lucky_area` VALUES ('3485', '3477', '南岸区');
INSERT INTO `lucky_area` VALUES ('3486', '3477', '北碚区');
INSERT INTO `lucky_area` VALUES ('3487', '3477', '万盛区');
INSERT INTO `lucky_area` VALUES ('3488', '3477', '双桥区');
INSERT INTO `lucky_area` VALUES ('3489', '3477', '渝北区');
INSERT INTO `lucky_area` VALUES ('3490', '3477', '巴南区');
INSERT INTO `lucky_area` VALUES ('3491', '3477', '黔江区');
INSERT INTO `lucky_area` VALUES ('3492', '3477', '长寿区');
INSERT INTO `lucky_area` VALUES ('3493', '3476', '市辖县');
INSERT INTO `lucky_area` VALUES ('3494', '3493', '綦江县');
INSERT INTO `lucky_area` VALUES ('3495', '3493', '潼南县');
INSERT INTO `lucky_area` VALUES ('3496', '3493', '铜梁县');
INSERT INTO `lucky_area` VALUES ('3497', '3493', '大足县');
INSERT INTO `lucky_area` VALUES ('3498', '3493', '荣昌县');
INSERT INTO `lucky_area` VALUES ('3499', '3493', '璧山县');
INSERT INTO `lucky_area` VALUES ('3500', '3493', '梁平县');
INSERT INTO `lucky_area` VALUES ('3501', '3493', '城口县');
INSERT INTO `lucky_area` VALUES ('3502', '3493', '丰都县');
INSERT INTO `lucky_area` VALUES ('3503', '3493', '垫江县');
INSERT INTO `lucky_area` VALUES ('3504', '3493', '武隆县');
INSERT INTO `lucky_area` VALUES ('3505', '3493', '忠县');
INSERT INTO `lucky_area` VALUES ('3506', '3493', '开县');
INSERT INTO `lucky_area` VALUES ('3507', '3493', '云阳县');
INSERT INTO `lucky_area` VALUES ('3508', '3493', '奉节县');
INSERT INTO `lucky_area` VALUES ('3509', '3493', '巫山县');
INSERT INTO `lucky_area` VALUES ('3510', '3493', '巫溪县');
INSERT INTO `lucky_area` VALUES ('3511', '3493', '石柱土家族自治县');
INSERT INTO `lucky_area` VALUES ('3512', '3493', '秀山土家族苗族自治县');
INSERT INTO `lucky_area` VALUES ('3513', '3493', '酉阳土家族苗族自治县');
INSERT INTO `lucky_area` VALUES ('3514', '3493', '彭水苗族土家族自治县');
INSERT INTO `lucky_area` VALUES ('3515', '3476', '县级市');
INSERT INTO `lucky_area` VALUES ('3516', '3515', '江津市');
INSERT INTO `lucky_area` VALUES ('3517', '3515', '合川市');
INSERT INTO `lucky_area` VALUES ('3518', '3515', '永川市');
INSERT INTO `lucky_area` VALUES ('3519', '3515', '南川市');
INSERT INTO `lucky_area` VALUES ('3520', '0', '四川省');
INSERT INTO `lucky_area` VALUES ('3521', '3520', '成都市');
INSERT INTO `lucky_area` VALUES ('3522', '3521', '市辖区');
INSERT INTO `lucky_area` VALUES ('3523', '3521', '锦江区');
INSERT INTO `lucky_area` VALUES ('3524', '3521', '青羊区');
INSERT INTO `lucky_area` VALUES ('3525', '3521', '金牛区');
INSERT INTO `lucky_area` VALUES ('3526', '3521', '武侯区');
INSERT INTO `lucky_area` VALUES ('3527', '3521', '成华区');
INSERT INTO `lucky_area` VALUES ('3528', '3521', '龙泉驿区');
INSERT INTO `lucky_area` VALUES ('3529', '3521', '青白江区');
INSERT INTO `lucky_area` VALUES ('3530', '3521', '新都区');
INSERT INTO `lucky_area` VALUES ('3531', '3521', '温江区');
INSERT INTO `lucky_area` VALUES ('3532', '3521', '金堂县');
INSERT INTO `lucky_area` VALUES ('3533', '3521', '双流县');
INSERT INTO `lucky_area` VALUES ('3534', '3521', '郫县');
INSERT INTO `lucky_area` VALUES ('3535', '3521', '大邑县');
INSERT INTO `lucky_area` VALUES ('3536', '3521', '蒲江县');
INSERT INTO `lucky_area` VALUES ('3537', '3521', '新津县');
INSERT INTO `lucky_area` VALUES ('3538', '3521', '都江堰市');
INSERT INTO `lucky_area` VALUES ('3539', '3521', '彭州市');
INSERT INTO `lucky_area` VALUES ('3540', '3521', '邛崃市');
INSERT INTO `lucky_area` VALUES ('3541', '3521', '崇州市');
INSERT INTO `lucky_area` VALUES ('3542', '3520', '自贡市');
INSERT INTO `lucky_area` VALUES ('3543', '3542', '市辖区');
INSERT INTO `lucky_area` VALUES ('3544', '3542', '自流井区');
INSERT INTO `lucky_area` VALUES ('3545', '3542', '贡井区');
INSERT INTO `lucky_area` VALUES ('3546', '3542', '大安区');
INSERT INTO `lucky_area` VALUES ('3547', '3542', '沿滩区');
INSERT INTO `lucky_area` VALUES ('3548', '3542', '荣县');
INSERT INTO `lucky_area` VALUES ('3549', '3542', '富顺县');
INSERT INTO `lucky_area` VALUES ('3550', '3520', '攀枝花市');
INSERT INTO `lucky_area` VALUES ('3551', '3550', '市辖区');
INSERT INTO `lucky_area` VALUES ('3552', '3550', '东区');
INSERT INTO `lucky_area` VALUES ('3553', '3550', '西区');
INSERT INTO `lucky_area` VALUES ('3554', '3550', '仁和区');
INSERT INTO `lucky_area` VALUES ('3555', '3550', '米易县');
INSERT INTO `lucky_area` VALUES ('3556', '3550', '盐边县');
INSERT INTO `lucky_area` VALUES ('3557', '3520', '泸州市');
INSERT INTO `lucky_area` VALUES ('3558', '3557', '市辖区');
INSERT INTO `lucky_area` VALUES ('3559', '3557', '江阳区');
INSERT INTO `lucky_area` VALUES ('3560', '3557', '纳溪区');
INSERT INTO `lucky_area` VALUES ('3561', '3557', '龙马潭区');
INSERT INTO `lucky_area` VALUES ('3562', '3557', '泸县');
INSERT INTO `lucky_area` VALUES ('3563', '3557', '合江县');
INSERT INTO `lucky_area` VALUES ('3564', '3557', '叙永县');
INSERT INTO `lucky_area` VALUES ('3565', '3557', '古蔺县');
INSERT INTO `lucky_area` VALUES ('3566', '3520', '德阳市');
INSERT INTO `lucky_area` VALUES ('3567', '3566', '市辖区');
INSERT INTO `lucky_area` VALUES ('3568', '3566', '旌阳区');
INSERT INTO `lucky_area` VALUES ('3569', '3566', '中江县');
INSERT INTO `lucky_area` VALUES ('3570', '3566', '罗江县');
INSERT INTO `lucky_area` VALUES ('3571', '3566', '广汉市');
INSERT INTO `lucky_area` VALUES ('3572', '3566', '什邡市');
INSERT INTO `lucky_area` VALUES ('3573', '3566', '绵竹市');
INSERT INTO `lucky_area` VALUES ('3574', '3520', '绵阳市');
INSERT INTO `lucky_area` VALUES ('3575', '3574', '市辖区');
INSERT INTO `lucky_area` VALUES ('3576', '3574', '涪城区');
INSERT INTO `lucky_area` VALUES ('3577', '3574', '游仙区');
INSERT INTO `lucky_area` VALUES ('3578', '3574', '三台县');
INSERT INTO `lucky_area` VALUES ('3579', '3574', '盐亭县');
INSERT INTO `lucky_area` VALUES ('3580', '3574', '安县');
INSERT INTO `lucky_area` VALUES ('3581', '3574', '梓潼县');
INSERT INTO `lucky_area` VALUES ('3582', '3574', '北川羌族自治县');
INSERT INTO `lucky_area` VALUES ('3583', '3574', '平武县');
INSERT INTO `lucky_area` VALUES ('3584', '3574', '江油市');
INSERT INTO `lucky_area` VALUES ('3585', '3520', '广元市');
INSERT INTO `lucky_area` VALUES ('3586', '3585', '市辖区');
INSERT INTO `lucky_area` VALUES ('3587', '3585', '市中区');
INSERT INTO `lucky_area` VALUES ('3588', '3585', '元坝区');
INSERT INTO `lucky_area` VALUES ('3589', '3585', '朝天区');
INSERT INTO `lucky_area` VALUES ('3590', '3585', '旺苍县');
INSERT INTO `lucky_area` VALUES ('3591', '3585', '青川县');
INSERT INTO `lucky_area` VALUES ('3592', '3585', '剑阁县');
INSERT INTO `lucky_area` VALUES ('3593', '3585', '苍溪县');
INSERT INTO `lucky_area` VALUES ('3594', '3520', '遂宁市');
INSERT INTO `lucky_area` VALUES ('3595', '3594', '市辖区');
INSERT INTO `lucky_area` VALUES ('3596', '3594', '船山区');
INSERT INTO `lucky_area` VALUES ('3597', '3594', '安居区');
INSERT INTO `lucky_area` VALUES ('3598', '3594', '蓬溪县');
INSERT INTO `lucky_area` VALUES ('3599', '3594', '射洪县');
INSERT INTO `lucky_area` VALUES ('3600', '3594', '大英县');
INSERT INTO `lucky_area` VALUES ('3601', '3520', '内江市');
INSERT INTO `lucky_area` VALUES ('3602', '3601', '市辖区');
INSERT INTO `lucky_area` VALUES ('3603', '3601', '市中区');
INSERT INTO `lucky_area` VALUES ('3604', '3601', '东兴区');
INSERT INTO `lucky_area` VALUES ('3605', '3601', '威远县');
INSERT INTO `lucky_area` VALUES ('3606', '3601', '资中县');
INSERT INTO `lucky_area` VALUES ('3607', '3601', '隆昌县');
INSERT INTO `lucky_area` VALUES ('3608', '3520', '乐山市');
INSERT INTO `lucky_area` VALUES ('3609', '3608', '市辖区');
INSERT INTO `lucky_area` VALUES ('3610', '3608', '市中区');
INSERT INTO `lucky_area` VALUES ('3611', '3608', '沙湾区');
INSERT INTO `lucky_area` VALUES ('3612', '3608', '五通桥区');
INSERT INTO `lucky_area` VALUES ('3613', '3608', '金口河区');
INSERT INTO `lucky_area` VALUES ('3614', '3608', '犍为县');
INSERT INTO `lucky_area` VALUES ('3615', '3608', '井研县');
INSERT INTO `lucky_area` VALUES ('3616', '3608', '夹江县');
INSERT INTO `lucky_area` VALUES ('3617', '3608', '沐川县');
INSERT INTO `lucky_area` VALUES ('3618', '3608', '峨边彝族自治县');
INSERT INTO `lucky_area` VALUES ('3619', '3608', '马边彝族自治县');
INSERT INTO `lucky_area` VALUES ('3620', '3608', '峨眉山市');
INSERT INTO `lucky_area` VALUES ('3621', '3520', '南充市');
INSERT INTO `lucky_area` VALUES ('3622', '3621', '市辖区');
INSERT INTO `lucky_area` VALUES ('3623', '3621', '顺庆区');
INSERT INTO `lucky_area` VALUES ('3624', '3621', '高坪区');
INSERT INTO `lucky_area` VALUES ('3625', '3621', '嘉陵区');
INSERT INTO `lucky_area` VALUES ('3626', '3621', '南部县');
INSERT INTO `lucky_area` VALUES ('3627', '3621', '营山县');
INSERT INTO `lucky_area` VALUES ('3628', '3621', '蓬安县');
INSERT INTO `lucky_area` VALUES ('3629', '3621', '仪陇县');
INSERT INTO `lucky_area` VALUES ('3630', '3621', '西充县');
INSERT INTO `lucky_area` VALUES ('3631', '3621', '阆中市');
INSERT INTO `lucky_area` VALUES ('3632', '3520', '眉山市');
INSERT INTO `lucky_area` VALUES ('3633', '3632', '市辖区');
INSERT INTO `lucky_area` VALUES ('3634', '3632', '东坡区');
INSERT INTO `lucky_area` VALUES ('3635', '3632', '仁寿县');
INSERT INTO `lucky_area` VALUES ('3636', '3632', '彭山县');
INSERT INTO `lucky_area` VALUES ('3637', '3632', '洪雅县');
INSERT INTO `lucky_area` VALUES ('3638', '3632', '丹棱县');
INSERT INTO `lucky_area` VALUES ('3639', '3632', '青神县');
INSERT INTO `lucky_area` VALUES ('3640', '3520', '宜宾市');
INSERT INTO `lucky_area` VALUES ('3641', '3640', '市辖区');
INSERT INTO `lucky_area` VALUES ('3642', '3640', '翠屏区');
INSERT INTO `lucky_area` VALUES ('3643', '3640', '宜宾县');
INSERT INTO `lucky_area` VALUES ('3644', '3640', '南溪县');
INSERT INTO `lucky_area` VALUES ('3645', '3640', '江安县');
INSERT INTO `lucky_area` VALUES ('3646', '3640', '长宁县');
INSERT INTO `lucky_area` VALUES ('3647', '3640', '高县');
INSERT INTO `lucky_area` VALUES ('3648', '3640', '珙县');
INSERT INTO `lucky_area` VALUES ('3649', '3640', '筠连县');
INSERT INTO `lucky_area` VALUES ('3650', '3640', '兴文县');
INSERT INTO `lucky_area` VALUES ('3651', '3640', '屏山县');
INSERT INTO `lucky_area` VALUES ('3652', '3520', '广安市');
INSERT INTO `lucky_area` VALUES ('3653', '3652', '市辖区');
INSERT INTO `lucky_area` VALUES ('3654', '3652', '广安区');
INSERT INTO `lucky_area` VALUES ('3655', '3652', '岳池县');
INSERT INTO `lucky_area` VALUES ('3656', '3652', '武胜县');
INSERT INTO `lucky_area` VALUES ('3657', '3652', '邻水县');
INSERT INTO `lucky_area` VALUES ('3658', '3652', '华蓥市');
INSERT INTO `lucky_area` VALUES ('3659', '3520', '达州市');
INSERT INTO `lucky_area` VALUES ('3660', '3659', '市辖区');
INSERT INTO `lucky_area` VALUES ('3661', '3659', '通川区');
INSERT INTO `lucky_area` VALUES ('3662', '3659', '达县');
INSERT INTO `lucky_area` VALUES ('3663', '3659', '宣汉县');
INSERT INTO `lucky_area` VALUES ('3664', '3659', '开江县');
INSERT INTO `lucky_area` VALUES ('3665', '3659', '大竹县');
INSERT INTO `lucky_area` VALUES ('3666', '3659', '渠县');
INSERT INTO `lucky_area` VALUES ('3667', '3659', '万源市');
INSERT INTO `lucky_area` VALUES ('3668', '3520', '雅安市');
INSERT INTO `lucky_area` VALUES ('3669', '3668', '市辖区');
INSERT INTO `lucky_area` VALUES ('3670', '3668', '雨城区');
INSERT INTO `lucky_area` VALUES ('3671', '3668', '名山县');
INSERT INTO `lucky_area` VALUES ('3672', '3668', '荥经县');
INSERT INTO `lucky_area` VALUES ('3673', '3668', '汉源县');
INSERT INTO `lucky_area` VALUES ('3674', '3668', '石棉县');
INSERT INTO `lucky_area` VALUES ('3675', '3668', '天全县');
INSERT INTO `lucky_area` VALUES ('3676', '3668', '芦山县');
INSERT INTO `lucky_area` VALUES ('3677', '3668', '宝兴县');
INSERT INTO `lucky_area` VALUES ('3678', '3520', '巴中市');
INSERT INTO `lucky_area` VALUES ('3679', '3678', '市辖区');
INSERT INTO `lucky_area` VALUES ('3680', '3678', '巴州区');
INSERT INTO `lucky_area` VALUES ('3681', '3678', '通江县');
INSERT INTO `lucky_area` VALUES ('3682', '3678', '南江县');
INSERT INTO `lucky_area` VALUES ('3683', '3678', '平昌县');
INSERT INTO `lucky_area` VALUES ('3684', '3520', '资阳市');
INSERT INTO `lucky_area` VALUES ('3685', '3684', '市辖区');
INSERT INTO `lucky_area` VALUES ('3686', '3684', '雁江区');
INSERT INTO `lucky_area` VALUES ('3687', '3684', '安岳县');
INSERT INTO `lucky_area` VALUES ('3688', '3684', '乐至县');
INSERT INTO `lucky_area` VALUES ('3689', '3684', '简阳市');
INSERT INTO `lucky_area` VALUES ('3690', '3520', '阿坝藏族羌族自治州');
INSERT INTO `lucky_area` VALUES ('3691', '3690', '汶川县');
INSERT INTO `lucky_area` VALUES ('3692', '3690', '理县');
INSERT INTO `lucky_area` VALUES ('3693', '3690', '茂县');
INSERT INTO `lucky_area` VALUES ('3694', '3690', '松潘县');
INSERT INTO `lucky_area` VALUES ('3695', '3690', '九寨沟县');
INSERT INTO `lucky_area` VALUES ('3696', '3690', '金川县');
INSERT INTO `lucky_area` VALUES ('3697', '3690', '小金县');
INSERT INTO `lucky_area` VALUES ('3698', '3690', '黑水县');
INSERT INTO `lucky_area` VALUES ('3699', '3690', '马尔康县');
INSERT INTO `lucky_area` VALUES ('3700', '3690', '壤塘县');
INSERT INTO `lucky_area` VALUES ('3701', '3690', '阿坝县');
INSERT INTO `lucky_area` VALUES ('3702', '3690', '若尔盖县');
INSERT INTO `lucky_area` VALUES ('3703', '3690', '红原县');
INSERT INTO `lucky_area` VALUES ('3704', '3520', '甘孜藏族自治州');
INSERT INTO `lucky_area` VALUES ('3705', '3704', '康定县');
INSERT INTO `lucky_area` VALUES ('3706', '3704', '泸定县');
INSERT INTO `lucky_area` VALUES ('3707', '3704', '丹巴县');
INSERT INTO `lucky_area` VALUES ('3708', '3704', '九龙县');
INSERT INTO `lucky_area` VALUES ('3709', '3704', '雅江县');
INSERT INTO `lucky_area` VALUES ('3710', '3704', '道孚县');
INSERT INTO `lucky_area` VALUES ('3711', '3704', '炉霍县');
INSERT INTO `lucky_area` VALUES ('3712', '3704', '甘孜县');
INSERT INTO `lucky_area` VALUES ('3713', '3704', '新龙县');
INSERT INTO `lucky_area` VALUES ('3714', '3704', '德格县');
INSERT INTO `lucky_area` VALUES ('3715', '3704', '白玉县');
INSERT INTO `lucky_area` VALUES ('3716', '3704', '石渠县');
INSERT INTO `lucky_area` VALUES ('3717', '3704', '色达县');
INSERT INTO `lucky_area` VALUES ('3718', '3704', '理塘县');
INSERT INTO `lucky_area` VALUES ('3719', '3704', '巴塘县');
INSERT INTO `lucky_area` VALUES ('3720', '3704', '乡城县');
INSERT INTO `lucky_area` VALUES ('3721', '3704', '稻城县');
INSERT INTO `lucky_area` VALUES ('3722', '3704', '得荣县');
INSERT INTO `lucky_area` VALUES ('3723', '3520', '凉山彝族自治州');
INSERT INTO `lucky_area` VALUES ('3724', '3723', '西昌市');
INSERT INTO `lucky_area` VALUES ('3725', '3723', '木里藏族自治县');
INSERT INTO `lucky_area` VALUES ('3726', '3723', '盐源县');
INSERT INTO `lucky_area` VALUES ('3727', '3723', '德昌县');
INSERT INTO `lucky_area` VALUES ('3728', '3723', '会理县');
INSERT INTO `lucky_area` VALUES ('3729', '3723', '会东县');
INSERT INTO `lucky_area` VALUES ('3730', '3723', '宁南县');
INSERT INTO `lucky_area` VALUES ('3731', '3723', '普格县');
INSERT INTO `lucky_area` VALUES ('3732', '3723', '布拖县');
INSERT INTO `lucky_area` VALUES ('3733', '3723', '金阳县');
INSERT INTO `lucky_area` VALUES ('3734', '3723', '昭觉县');
INSERT INTO `lucky_area` VALUES ('3735', '3723', '喜德县');
INSERT INTO `lucky_area` VALUES ('3736', '3723', '冕宁县');
INSERT INTO `lucky_area` VALUES ('3737', '3723', '越西县');
INSERT INTO `lucky_area` VALUES ('3738', '3723', '甘洛县');
INSERT INTO `lucky_area` VALUES ('3739', '3723', '美姑县');
INSERT INTO `lucky_area` VALUES ('3740', '3723', '雷波县');
INSERT INTO `lucky_area` VALUES ('3741', '0', '贵州省');
INSERT INTO `lucky_area` VALUES ('3742', '3741', '贵阳市');
INSERT INTO `lucky_area` VALUES ('3743', '3742', '市辖区');
INSERT INTO `lucky_area` VALUES ('3744', '3742', '南明区');
INSERT INTO `lucky_area` VALUES ('3745', '3742', '云岩区');
INSERT INTO `lucky_area` VALUES ('3746', '3742', '花溪区');
INSERT INTO `lucky_area` VALUES ('3747', '3742', '乌当区');
INSERT INTO `lucky_area` VALUES ('3748', '3742', '白云区');
INSERT INTO `lucky_area` VALUES ('3749', '3742', '小河区');
INSERT INTO `lucky_area` VALUES ('3750', '3742', '开阳县');
INSERT INTO `lucky_area` VALUES ('3751', '3742', '息烽县');
INSERT INTO `lucky_area` VALUES ('3752', '3742', '修文县');
INSERT INTO `lucky_area` VALUES ('3753', '3742', '清镇市');
INSERT INTO `lucky_area` VALUES ('3754', '3741', '六盘水市');
INSERT INTO `lucky_area` VALUES ('3755', '3754', '钟山区');
INSERT INTO `lucky_area` VALUES ('3756', '3754', '六枝特区');
INSERT INTO `lucky_area` VALUES ('3757', '3754', '水城县');
INSERT INTO `lucky_area` VALUES ('3758', '3754', '盘县');
INSERT INTO `lucky_area` VALUES ('3759', '3741', '遵义市');
INSERT INTO `lucky_area` VALUES ('3760', '3759', '市辖区');
INSERT INTO `lucky_area` VALUES ('3761', '3759', '红花岗区');
INSERT INTO `lucky_area` VALUES ('3762', '3759', '汇川区');
INSERT INTO `lucky_area` VALUES ('3763', '3759', '遵义县');
INSERT INTO `lucky_area` VALUES ('3764', '3759', '桐梓县');
INSERT INTO `lucky_area` VALUES ('3765', '3759', '绥阳县');
INSERT INTO `lucky_area` VALUES ('3766', '3759', '正安县');
INSERT INTO `lucky_area` VALUES ('3767', '3759', '道真仡佬族苗族自治县');
INSERT INTO `lucky_area` VALUES ('3768', '3759', '务川仡佬族苗族自治县');
INSERT INTO `lucky_area` VALUES ('3769', '3759', '凤冈县');
INSERT INTO `lucky_area` VALUES ('3770', '3759', '湄潭县');
INSERT INTO `lucky_area` VALUES ('3771', '3759', '余庆县');
INSERT INTO `lucky_area` VALUES ('3772', '3759', '习水县');
INSERT INTO `lucky_area` VALUES ('3773', '3759', '赤水市');
INSERT INTO `lucky_area` VALUES ('3774', '3759', '仁怀市');
INSERT INTO `lucky_area` VALUES ('3775', '3741', '安顺市');
INSERT INTO `lucky_area` VALUES ('3776', '3775', '市辖区');
INSERT INTO `lucky_area` VALUES ('3777', '3775', '西秀区');
INSERT INTO `lucky_area` VALUES ('3778', '3775', '平坝县');
INSERT INTO `lucky_area` VALUES ('3779', '3775', '普定县');
INSERT INTO `lucky_area` VALUES ('3780', '3775', '镇宁布依族苗族自治县');
INSERT INTO `lucky_area` VALUES ('3781', '3775', '关岭布依族苗族自治县');
INSERT INTO `lucky_area` VALUES ('3782', '3775', '紫云苗族布依族自治县');
INSERT INTO `lucky_area` VALUES ('3783', '3741', '铜仁地区');
INSERT INTO `lucky_area` VALUES ('3784', '3783', '铜仁市');
INSERT INTO `lucky_area` VALUES ('3785', '3783', '江口县');
INSERT INTO `lucky_area` VALUES ('3786', '3783', '玉屏侗族自治县');
INSERT INTO `lucky_area` VALUES ('3787', '3783', '石阡县');
INSERT INTO `lucky_area` VALUES ('3788', '3783', '思南县');
INSERT INTO `lucky_area` VALUES ('3789', '3783', '印江土家族苗族自治县');
INSERT INTO `lucky_area` VALUES ('3790', '3783', '德江县');
INSERT INTO `lucky_area` VALUES ('3791', '3783', '沿河土家族自治县');
INSERT INTO `lucky_area` VALUES ('3792', '3783', '松桃苗族自治县');
INSERT INTO `lucky_area` VALUES ('3793', '3783', '万山特区');
INSERT INTO `lucky_area` VALUES ('3794', '3741', '黔西南布依族苗族自治州');
INSERT INTO `lucky_area` VALUES ('3795', '3794', '兴义市');
INSERT INTO `lucky_area` VALUES ('3796', '3794', '兴仁县');
INSERT INTO `lucky_area` VALUES ('3797', '3794', '普安县');
INSERT INTO `lucky_area` VALUES ('3798', '3794', '晴隆县');
INSERT INTO `lucky_area` VALUES ('3799', '3794', '贞丰县');
INSERT INTO `lucky_area` VALUES ('3800', '3794', '望谟县');
INSERT INTO `lucky_area` VALUES ('3801', '3794', '册亨县');
INSERT INTO `lucky_area` VALUES ('3802', '3794', '安龙县');
INSERT INTO `lucky_area` VALUES ('3803', '3741', '毕节地区');
INSERT INTO `lucky_area` VALUES ('3804', '3803', '毕节市');
INSERT INTO `lucky_area` VALUES ('3805', '3803', '大方县');
INSERT INTO `lucky_area` VALUES ('3806', '3803', '黔西县');
INSERT INTO `lucky_area` VALUES ('3807', '3803', '金沙县');
INSERT INTO `lucky_area` VALUES ('3808', '3803', '织金县');
INSERT INTO `lucky_area` VALUES ('3809', '3803', '纳雍县');
INSERT INTO `lucky_area` VALUES ('3810', '3803', '威宁彝族回族苗族自治县');
INSERT INTO `lucky_area` VALUES ('3811', '3803', '赫章县');
INSERT INTO `lucky_area` VALUES ('3812', '3741', '黔东南苗族侗族自治州');
INSERT INTO `lucky_area` VALUES ('3813', '3812', '凯里市');
INSERT INTO `lucky_area` VALUES ('3814', '3812', '黄平县');
INSERT INTO `lucky_area` VALUES ('3815', '3812', '施秉县');
INSERT INTO `lucky_area` VALUES ('3816', '3812', '三穗县');
INSERT INTO `lucky_area` VALUES ('3817', '3812', '镇远县');
INSERT INTO `lucky_area` VALUES ('3818', '3812', '岑巩县');
INSERT INTO `lucky_area` VALUES ('3819', '3812', '天柱县');
INSERT INTO `lucky_area` VALUES ('3820', '3812', '锦屏县');
INSERT INTO `lucky_area` VALUES ('3821', '3812', '剑河县');
INSERT INTO `lucky_area` VALUES ('3822', '3812', '台江县');
INSERT INTO `lucky_area` VALUES ('3823', '3812', '黎平县');
INSERT INTO `lucky_area` VALUES ('3824', '3812', '榕江县');
INSERT INTO `lucky_area` VALUES ('3825', '3812', '从江县');
INSERT INTO `lucky_area` VALUES ('3826', '3812', '雷山县');
INSERT INTO `lucky_area` VALUES ('3827', '3812', '麻江县');
INSERT INTO `lucky_area` VALUES ('3828', '3812', '丹寨县');
INSERT INTO `lucky_area` VALUES ('3829', '3741', '黔南布依族苗族自治州');
INSERT INTO `lucky_area` VALUES ('3830', '3829', '都匀市');
INSERT INTO `lucky_area` VALUES ('3831', '3829', '福泉市');
INSERT INTO `lucky_area` VALUES ('3832', '3829', '荔波县');
INSERT INTO `lucky_area` VALUES ('3833', '3829', '贵定县');
INSERT INTO `lucky_area` VALUES ('3834', '3829', '瓮安县');
INSERT INTO `lucky_area` VALUES ('3835', '3829', '独山县');
INSERT INTO `lucky_area` VALUES ('3836', '3829', '平塘县');
INSERT INTO `lucky_area` VALUES ('3837', '3829', '罗甸县');
INSERT INTO `lucky_area` VALUES ('3838', '3829', '长顺县');
INSERT INTO `lucky_area` VALUES ('3839', '3829', '龙里县');
INSERT INTO `lucky_area` VALUES ('3840', '3829', '惠水县');
INSERT INTO `lucky_area` VALUES ('3841', '3829', '三都水族自治县');
INSERT INTO `lucky_area` VALUES ('3842', '0', '云南省');
INSERT INTO `lucky_area` VALUES ('3843', '3842', '昆明市');
INSERT INTO `lucky_area` VALUES ('3844', '3843', '市辖区');
INSERT INTO `lucky_area` VALUES ('3845', '3843', '五华区');
INSERT INTO `lucky_area` VALUES ('3846', '3843', '盘龙区');
INSERT INTO `lucky_area` VALUES ('3847', '3843', '官渡区');
INSERT INTO `lucky_area` VALUES ('3848', '3843', '西山区');
INSERT INTO `lucky_area` VALUES ('3849', '3843', '东川区');
INSERT INTO `lucky_area` VALUES ('3850', '3843', '呈贡县');
INSERT INTO `lucky_area` VALUES ('3851', '3843', '晋宁县');
INSERT INTO `lucky_area` VALUES ('3852', '3843', '富民县');
INSERT INTO `lucky_area` VALUES ('3853', '3843', '宜良县');
INSERT INTO `lucky_area` VALUES ('3854', '3843', '石林彝族自治县');
INSERT INTO `lucky_area` VALUES ('3855', '3843', '嵩明县');
INSERT INTO `lucky_area` VALUES ('3856', '3843', '禄劝彝族苗族自治县');
INSERT INTO `lucky_area` VALUES ('3857', '3843', '寻甸回族彝族自治县');
INSERT INTO `lucky_area` VALUES ('3858', '3843', '安宁市');
INSERT INTO `lucky_area` VALUES ('3859', '3842', '曲靖市');
INSERT INTO `lucky_area` VALUES ('3860', '3859', '市辖区');
INSERT INTO `lucky_area` VALUES ('3861', '3859', '麒麟区');
INSERT INTO `lucky_area` VALUES ('3862', '3859', '马龙县');
INSERT INTO `lucky_area` VALUES ('3863', '3859', '陆良县');
INSERT INTO `lucky_area` VALUES ('3864', '3859', '师宗县');
INSERT INTO `lucky_area` VALUES ('3865', '3859', '罗平县');
INSERT INTO `lucky_area` VALUES ('3866', '3859', '富源县');
INSERT INTO `lucky_area` VALUES ('3867', '3859', '会泽县');
INSERT INTO `lucky_area` VALUES ('3868', '3859', '沾益县');
INSERT INTO `lucky_area` VALUES ('3869', '3859', '宣威市');
INSERT INTO `lucky_area` VALUES ('3870', '3842', '玉溪市');
INSERT INTO `lucky_area` VALUES ('3871', '3870', '市辖区');
INSERT INTO `lucky_area` VALUES ('3872', '3870', '红塔区');
INSERT INTO `lucky_area` VALUES ('3873', '3870', '江川县');
INSERT INTO `lucky_area` VALUES ('3874', '3870', '澄江县');
INSERT INTO `lucky_area` VALUES ('3875', '3870', '通海县');
INSERT INTO `lucky_area` VALUES ('3876', '3870', '华宁县');
INSERT INTO `lucky_area` VALUES ('3877', '3870', '易门县');
INSERT INTO `lucky_area` VALUES ('3878', '3870', '峨山彝族自治县');
INSERT INTO `lucky_area` VALUES ('3879', '3870', '新平彝族傣族自治县');
INSERT INTO `lucky_area` VALUES ('3880', '3870', '元江哈尼族彝族傣族自治县');
INSERT INTO `lucky_area` VALUES ('3881', '3842', '保山市');
INSERT INTO `lucky_area` VALUES ('3882', '3881', '市辖区');
INSERT INTO `lucky_area` VALUES ('3883', '3881', '隆阳区');
INSERT INTO `lucky_area` VALUES ('3884', '3881', '施甸县');
INSERT INTO `lucky_area` VALUES ('3885', '3881', '腾冲县');
INSERT INTO `lucky_area` VALUES ('3886', '3881', '龙陵县');
INSERT INTO `lucky_area` VALUES ('3887', '3881', '昌宁县');
INSERT INTO `lucky_area` VALUES ('3888', '3842', '昭通市');
INSERT INTO `lucky_area` VALUES ('3889', '3888', '市辖区');
INSERT INTO `lucky_area` VALUES ('3890', '3888', '昭阳区');
INSERT INTO `lucky_area` VALUES ('3891', '3888', '鲁甸县');
INSERT INTO `lucky_area` VALUES ('3892', '3888', '巧家县');
INSERT INTO `lucky_area` VALUES ('3893', '3888', '盐津县');
INSERT INTO `lucky_area` VALUES ('3894', '3888', '大关县');
INSERT INTO `lucky_area` VALUES ('3895', '3888', '永善县');
INSERT INTO `lucky_area` VALUES ('3896', '3888', '绥江县');
INSERT INTO `lucky_area` VALUES ('3897', '3888', '镇雄县');
INSERT INTO `lucky_area` VALUES ('3898', '3888', '彝良县');
INSERT INTO `lucky_area` VALUES ('3899', '3888', '威信县');
INSERT INTO `lucky_area` VALUES ('3900', '3888', '水富县');
INSERT INTO `lucky_area` VALUES ('3901', '3842', '丽江市');
INSERT INTO `lucky_area` VALUES ('3902', '3901', '市辖区');
INSERT INTO `lucky_area` VALUES ('3903', '3901', '古城区');
INSERT INTO `lucky_area` VALUES ('3904', '3901', '玉龙纳西族自治县');
INSERT INTO `lucky_area` VALUES ('3905', '3901', '永胜县');
INSERT INTO `lucky_area` VALUES ('3906', '3901', '华坪县');
INSERT INTO `lucky_area` VALUES ('3907', '3901', '宁蒗彝族自治县');
INSERT INTO `lucky_area` VALUES ('3908', '3842', '思茅市');
INSERT INTO `lucky_area` VALUES ('3909', '3908', '市辖区');
INSERT INTO `lucky_area` VALUES ('3910', '3908', '翠云区');
INSERT INTO `lucky_area` VALUES ('3911', '3908', '普洱哈尼族彝族自治县');
INSERT INTO `lucky_area` VALUES ('3912', '3908', '墨江哈尼族自治县');
INSERT INTO `lucky_area` VALUES ('3913', '3908', '景东彝族自治县');
INSERT INTO `lucky_area` VALUES ('3914', '3908', '景谷傣族彝族自治县');
INSERT INTO `lucky_area` VALUES ('3915', '3908', '镇沅彝族哈尼族拉祜族自治县');
INSERT INTO `lucky_area` VALUES ('3916', '3908', '江城哈尼族彝族自治县');
INSERT INTO `lucky_area` VALUES ('3917', '3908', '孟连傣族拉祜族佤族自治县');
INSERT INTO `lucky_area` VALUES ('3918', '3908', '澜沧拉祜族自治县');
INSERT INTO `lucky_area` VALUES ('3919', '3908', '西盟佤族自治县');
INSERT INTO `lucky_area` VALUES ('3920', '3842', '临沧市');
INSERT INTO `lucky_area` VALUES ('3921', '3920', '市辖区');
INSERT INTO `lucky_area` VALUES ('3922', '3920', '临翔区');
INSERT INTO `lucky_area` VALUES ('3923', '3920', '凤庆县');
INSERT INTO `lucky_area` VALUES ('3924', '3920', '云县');
INSERT INTO `lucky_area` VALUES ('3925', '3920', '永德县');
INSERT INTO `lucky_area` VALUES ('3926', '3920', '镇康县');
INSERT INTO `lucky_area` VALUES ('3927', '3920', '双江拉祜族佤族布朗族傣族自治县');
INSERT INTO `lucky_area` VALUES ('3928', '3920', '耿马傣族佤族自治县');
INSERT INTO `lucky_area` VALUES ('3929', '3920', '沧源佤族自治县');
INSERT INTO `lucky_area` VALUES ('3930', '3842', '楚雄彝族自治州');
INSERT INTO `lucky_area` VALUES ('3931', '3930', '楚雄市');
INSERT INTO `lucky_area` VALUES ('3932', '3930', '双柏县');
INSERT INTO `lucky_area` VALUES ('3933', '3930', '牟定县');
INSERT INTO `lucky_area` VALUES ('3934', '3930', '南华县');
INSERT INTO `lucky_area` VALUES ('3935', '3930', '姚安县');
INSERT INTO `lucky_area` VALUES ('3936', '3930', '大姚县');
INSERT INTO `lucky_area` VALUES ('3937', '3930', '永仁县');
INSERT INTO `lucky_area` VALUES ('3938', '3930', '元谋县');
INSERT INTO `lucky_area` VALUES ('3939', '3930', '武定县');
INSERT INTO `lucky_area` VALUES ('3940', '3930', '禄丰县');
INSERT INTO `lucky_area` VALUES ('3941', '3842', '红河哈尼族彝族自治州');
INSERT INTO `lucky_area` VALUES ('3942', '3941', '个旧市');
INSERT INTO `lucky_area` VALUES ('3943', '3941', '开远市');
INSERT INTO `lucky_area` VALUES ('3944', '3941', '蒙自县');
INSERT INTO `lucky_area` VALUES ('3945', '3941', '屏边苗族自治县');
INSERT INTO `lucky_area` VALUES ('3946', '3941', '建水县');
INSERT INTO `lucky_area` VALUES ('3947', '3941', '石屏县');
INSERT INTO `lucky_area` VALUES ('3948', '3941', '弥勒县');
INSERT INTO `lucky_area` VALUES ('3949', '3941', '泸西县');
INSERT INTO `lucky_area` VALUES ('3950', '3941', '元阳县');
INSERT INTO `lucky_area` VALUES ('3951', '3941', '红河县');
INSERT INTO `lucky_area` VALUES ('3952', '3941', '金平苗族瑶族傣族自治县');
INSERT INTO `lucky_area` VALUES ('3953', '3941', '绿春县');
INSERT INTO `lucky_area` VALUES ('3954', '3941', '河口瑶族自治县');
INSERT INTO `lucky_area` VALUES ('3955', '3842', '文山壮族苗族自治州');
INSERT INTO `lucky_area` VALUES ('3956', '3955', '文山县');
INSERT INTO `lucky_area` VALUES ('3957', '3955', '砚山县');
INSERT INTO `lucky_area` VALUES ('3958', '3955', '西畴县');
INSERT INTO `lucky_area` VALUES ('3959', '3955', '麻栗坡县');
INSERT INTO `lucky_area` VALUES ('3960', '3955', '马关县');
INSERT INTO `lucky_area` VALUES ('3961', '3955', '丘北县');
INSERT INTO `lucky_area` VALUES ('3962', '3955', '广南县');
INSERT INTO `lucky_area` VALUES ('3963', '3955', '富宁县');
INSERT INTO `lucky_area` VALUES ('3964', '3842', '西双版纳傣族自治州');
INSERT INTO `lucky_area` VALUES ('3965', '3964', '景洪市');
INSERT INTO `lucky_area` VALUES ('3966', '3964', '勐海县');
INSERT INTO `lucky_area` VALUES ('3967', '3964', '勐腊县');
INSERT INTO `lucky_area` VALUES ('3968', '3842', '大理白族自治州');
INSERT INTO `lucky_area` VALUES ('3969', '3968', '大理市');
INSERT INTO `lucky_area` VALUES ('3970', '3968', '漾濞彝族自治县');
INSERT INTO `lucky_area` VALUES ('3971', '3968', '祥云县');
INSERT INTO `lucky_area` VALUES ('3972', '3968', '宾川县');
INSERT INTO `lucky_area` VALUES ('3973', '3968', '弥渡县');
INSERT INTO `lucky_area` VALUES ('3974', '3968', '南涧彝族自治县');
INSERT INTO `lucky_area` VALUES ('3975', '3968', '巍山彝族回族自治县');
INSERT INTO `lucky_area` VALUES ('3976', '3968', '永平县');
INSERT INTO `lucky_area` VALUES ('3977', '3968', '云龙县');
INSERT INTO `lucky_area` VALUES ('3978', '3968', '洱源县');
INSERT INTO `lucky_area` VALUES ('3979', '3968', '剑川县');
INSERT INTO `lucky_area` VALUES ('3980', '3968', '鹤庆县');
INSERT INTO `lucky_area` VALUES ('3981', '3842', '德宏傣族景颇族自治州');
INSERT INTO `lucky_area` VALUES ('3982', '3981', '瑞丽市');
INSERT INTO `lucky_area` VALUES ('3983', '3981', '潞西市');
INSERT INTO `lucky_area` VALUES ('3984', '3981', '梁河县');
INSERT INTO `lucky_area` VALUES ('3985', '3981', '盈江县');
INSERT INTO `lucky_area` VALUES ('3986', '3981', '陇川县');
INSERT INTO `lucky_area` VALUES ('3987', '3842', '怒江傈僳族自治州');
INSERT INTO `lucky_area` VALUES ('3988', '3987', '泸水县');
INSERT INTO `lucky_area` VALUES ('3989', '3987', '福贡县');
INSERT INTO `lucky_area` VALUES ('3990', '3987', '贡山独龙族怒族自治县');
INSERT INTO `lucky_area` VALUES ('3991', '3987', '兰坪白族普米族自治县');
INSERT INTO `lucky_area` VALUES ('3992', '3842', '迪庆藏族自治州');
INSERT INTO `lucky_area` VALUES ('3993', '3992', '香格里拉县');
INSERT INTO `lucky_area` VALUES ('3994', '3992', '德钦县');
INSERT INTO `lucky_area` VALUES ('3995', '3992', '维西傈僳族自治县');
INSERT INTO `lucky_area` VALUES ('3996', '0', '西藏自治区');
INSERT INTO `lucky_area` VALUES ('3997', '3996', '拉萨市');
INSERT INTO `lucky_area` VALUES ('3998', '3997', '市辖区');
INSERT INTO `lucky_area` VALUES ('3999', '3997', '城关区');
INSERT INTO `lucky_area` VALUES ('4000', '3997', '林周县');
INSERT INTO `lucky_area` VALUES ('4001', '3997', '当雄县');
INSERT INTO `lucky_area` VALUES ('4002', '3997', '尼木县');
INSERT INTO `lucky_area` VALUES ('4003', '3997', '曲水县');
INSERT INTO `lucky_area` VALUES ('4004', '3997', '堆龙德庆县');
INSERT INTO `lucky_area` VALUES ('4005', '3997', '达孜县');
INSERT INTO `lucky_area` VALUES ('4006', '3997', '墨竹工卡县');
INSERT INTO `lucky_area` VALUES ('4007', '3996', '昌都地区');
INSERT INTO `lucky_area` VALUES ('4008', '4007', '昌都县');
INSERT INTO `lucky_area` VALUES ('4009', '4007', '江达县');
INSERT INTO `lucky_area` VALUES ('4010', '4007', '贡觉县');
INSERT INTO `lucky_area` VALUES ('4011', '4007', '类乌齐县');
INSERT INTO `lucky_area` VALUES ('4012', '4007', '丁青县');
INSERT INTO `lucky_area` VALUES ('4013', '4007', '察雅县');
INSERT INTO `lucky_area` VALUES ('4014', '4007', '八宿县');
INSERT INTO `lucky_area` VALUES ('4015', '4007', '左贡县');
INSERT INTO `lucky_area` VALUES ('4016', '4007', '芒康县');
INSERT INTO `lucky_area` VALUES ('4017', '4007', '洛隆县');
INSERT INTO `lucky_area` VALUES ('4018', '4007', '边坝县');
INSERT INTO `lucky_area` VALUES ('4019', '3996', '山南地区');
INSERT INTO `lucky_area` VALUES ('4020', '4019', '乃东县');
INSERT INTO `lucky_area` VALUES ('4021', '4019', '扎囊县');
INSERT INTO `lucky_area` VALUES ('4022', '4019', '贡嘎县');
INSERT INTO `lucky_area` VALUES ('4023', '4019', '桑日县');
INSERT INTO `lucky_area` VALUES ('4024', '4019', '琼结县');
INSERT INTO `lucky_area` VALUES ('4025', '4019', '曲松县');
INSERT INTO `lucky_area` VALUES ('4026', '4019', '措美县');
INSERT INTO `lucky_area` VALUES ('4027', '4019', '洛扎县');
INSERT INTO `lucky_area` VALUES ('4028', '4019', '加查县');
INSERT INTO `lucky_area` VALUES ('4029', '4019', '隆子县');
INSERT INTO `lucky_area` VALUES ('4030', '4019', '错那县');
INSERT INTO `lucky_area` VALUES ('4031', '4019', '浪卡子县');
INSERT INTO `lucky_area` VALUES ('4032', '3996', '日喀则地区');
INSERT INTO `lucky_area` VALUES ('4033', '4032', '日喀则市');
INSERT INTO `lucky_area` VALUES ('4034', '4032', '南木林县');
INSERT INTO `lucky_area` VALUES ('4035', '4032', '江孜县');
INSERT INTO `lucky_area` VALUES ('4036', '4032', '定日县');
INSERT INTO `lucky_area` VALUES ('4037', '4032', '萨迦县');
INSERT INTO `lucky_area` VALUES ('4038', '4032', '拉孜县');
INSERT INTO `lucky_area` VALUES ('4039', '4032', '昂仁县');
INSERT INTO `lucky_area` VALUES ('4040', '4032', '谢通门县');
INSERT INTO `lucky_area` VALUES ('4041', '4032', '白朗县');
INSERT INTO `lucky_area` VALUES ('4042', '4032', '仁布县');
INSERT INTO `lucky_area` VALUES ('4043', '4032', '康马县');
INSERT INTO `lucky_area` VALUES ('4044', '4032', '定结县');
INSERT INTO `lucky_area` VALUES ('4045', '4032', '仲巴县');
INSERT INTO `lucky_area` VALUES ('4046', '4032', '亚东县');
INSERT INTO `lucky_area` VALUES ('4047', '4032', '吉隆县');
INSERT INTO `lucky_area` VALUES ('4048', '4032', '聂拉木县');
INSERT INTO `lucky_area` VALUES ('4049', '4032', '萨嘎县');
INSERT INTO `lucky_area` VALUES ('4050', '4032', '岗巴县');
INSERT INTO `lucky_area` VALUES ('4051', '3996', '那曲地区');
INSERT INTO `lucky_area` VALUES ('4052', '4051', '那曲县');
INSERT INTO `lucky_area` VALUES ('4053', '4051', '嘉黎县');
INSERT INTO `lucky_area` VALUES ('4054', '4051', '比如县');
INSERT INTO `lucky_area` VALUES ('4055', '4051', '聂荣县');
INSERT INTO `lucky_area` VALUES ('4056', '4051', '安多县');
INSERT INTO `lucky_area` VALUES ('4057', '4051', '申扎县');
INSERT INTO `lucky_area` VALUES ('4058', '4051', '索县');
INSERT INTO `lucky_area` VALUES ('4059', '4051', '班戈县');
INSERT INTO `lucky_area` VALUES ('4060', '4051', '巴青县');
INSERT INTO `lucky_area` VALUES ('4061', '4051', '尼玛县');
INSERT INTO `lucky_area` VALUES ('4062', '3996', '阿里地区');
INSERT INTO `lucky_area` VALUES ('4063', '4062', '普兰县');
INSERT INTO `lucky_area` VALUES ('4064', '4062', '札达县');
INSERT INTO `lucky_area` VALUES ('4065', '4062', '噶尔县');
INSERT INTO `lucky_area` VALUES ('4066', '4062', '日土县');
INSERT INTO `lucky_area` VALUES ('4067', '4062', '革吉县');
INSERT INTO `lucky_area` VALUES ('4068', '4062', '改则县');
INSERT INTO `lucky_area` VALUES ('4069', '4062', '措勤县');
INSERT INTO `lucky_area` VALUES ('4070', '3996', '林芝地区');
INSERT INTO `lucky_area` VALUES ('4071', '4070', '林芝县');
INSERT INTO `lucky_area` VALUES ('4072', '4070', '工布江达县');
INSERT INTO `lucky_area` VALUES ('4073', '4070', '米林县');
INSERT INTO `lucky_area` VALUES ('4074', '4070', '墨脱县');
INSERT INTO `lucky_area` VALUES ('4075', '4070', '波密县');
INSERT INTO `lucky_area` VALUES ('4076', '4070', '察隅县');
INSERT INTO `lucky_area` VALUES ('4077', '4070', '朗县');
INSERT INTO `lucky_area` VALUES ('4078', '0', '陕西省');
INSERT INTO `lucky_area` VALUES ('4079', '4078', '西安市');
INSERT INTO `lucky_area` VALUES ('4080', '4079', '市辖区');
INSERT INTO `lucky_area` VALUES ('4081', '4079', '新城区');
INSERT INTO `lucky_area` VALUES ('4082', '4079', '碑林区');
INSERT INTO `lucky_area` VALUES ('4083', '4079', '莲湖区');
INSERT INTO `lucky_area` VALUES ('4084', '4079', '灞桥区');
INSERT INTO `lucky_area` VALUES ('4085', '4079', '未央区');
INSERT INTO `lucky_area` VALUES ('4086', '4079', '雁塔区');
INSERT INTO `lucky_area` VALUES ('4087', '4079', '阎良区');
INSERT INTO `lucky_area` VALUES ('4088', '4079', '临潼区');
INSERT INTO `lucky_area` VALUES ('4089', '4079', '长安区');
INSERT INTO `lucky_area` VALUES ('4090', '4079', '蓝田县');
INSERT INTO `lucky_area` VALUES ('4091', '4079', '周至县');
INSERT INTO `lucky_area` VALUES ('4092', '4079', '户县');
INSERT INTO `lucky_area` VALUES ('4093', '4079', '高陵县');
INSERT INTO `lucky_area` VALUES ('4094', '4078', '铜川市');
INSERT INTO `lucky_area` VALUES ('4095', '4094', '市辖区');
INSERT INTO `lucky_area` VALUES ('4096', '4094', '王益区');
INSERT INTO `lucky_area` VALUES ('4097', '4094', '印台区');
INSERT INTO `lucky_area` VALUES ('4098', '4094', '耀州区');
INSERT INTO `lucky_area` VALUES ('4099', '4094', '宜君县');
INSERT INTO `lucky_area` VALUES ('4100', '4078', '宝鸡市');
INSERT INTO `lucky_area` VALUES ('4101', '4100', '市辖区');
INSERT INTO `lucky_area` VALUES ('4102', '4100', '渭滨区');
INSERT INTO `lucky_area` VALUES ('4103', '4100', '金台区');
INSERT INTO `lucky_area` VALUES ('4104', '4100', '陈仓区');
INSERT INTO `lucky_area` VALUES ('4105', '4100', '凤翔县');
INSERT INTO `lucky_area` VALUES ('4106', '4100', '岐山县');
INSERT INTO `lucky_area` VALUES ('4107', '4100', '扶风县');
INSERT INTO `lucky_area` VALUES ('4108', '4100', '眉县');
INSERT INTO `lucky_area` VALUES ('4109', '4100', '陇县');
INSERT INTO `lucky_area` VALUES ('4110', '4100', '千阳县');
INSERT INTO `lucky_area` VALUES ('4111', '4100', '麟游县');
INSERT INTO `lucky_area` VALUES ('4112', '4100', '凤县');
INSERT INTO `lucky_area` VALUES ('4113', '4100', '太白县');
INSERT INTO `lucky_area` VALUES ('4114', '4078', '咸阳市');
INSERT INTO `lucky_area` VALUES ('4115', '4114', '市辖区');
INSERT INTO `lucky_area` VALUES ('4116', '4114', '秦都区');
INSERT INTO `lucky_area` VALUES ('4117', '4114', '杨凌区');
INSERT INTO `lucky_area` VALUES ('4118', '4114', '渭城区');
INSERT INTO `lucky_area` VALUES ('4119', '4114', '三原县');
INSERT INTO `lucky_area` VALUES ('4120', '4114', '泾阳县');
INSERT INTO `lucky_area` VALUES ('4121', '4114', '乾县');
INSERT INTO `lucky_area` VALUES ('4122', '4114', '礼泉县');
INSERT INTO `lucky_area` VALUES ('4123', '4114', '永寿县');
INSERT INTO `lucky_area` VALUES ('4124', '4114', '彬县');
INSERT INTO `lucky_area` VALUES ('4125', '4114', '长武县');
INSERT INTO `lucky_area` VALUES ('4126', '4114', '旬邑县');
INSERT INTO `lucky_area` VALUES ('4127', '4114', '淳化县');
INSERT INTO `lucky_area` VALUES ('4128', '4114', '武功县');
INSERT INTO `lucky_area` VALUES ('4129', '4114', '兴平市');
INSERT INTO `lucky_area` VALUES ('4130', '4078', '渭南市');
INSERT INTO `lucky_area` VALUES ('4131', '4130', '市辖区');
INSERT INTO `lucky_area` VALUES ('4132', '4130', '临渭区');
INSERT INTO `lucky_area` VALUES ('4133', '4130', '华县');
INSERT INTO `lucky_area` VALUES ('4134', '4130', '潼关县');
INSERT INTO `lucky_area` VALUES ('4135', '4130', '大荔县');
INSERT INTO `lucky_area` VALUES ('4136', '4130', '合阳县');
INSERT INTO `lucky_area` VALUES ('4137', '4130', '澄城县');
INSERT INTO `lucky_area` VALUES ('4138', '4130', '蒲城县');
INSERT INTO `lucky_area` VALUES ('4139', '4130', '白水县');
INSERT INTO `lucky_area` VALUES ('4140', '4130', '富平县');
INSERT INTO `lucky_area` VALUES ('4141', '4130', '韩城市');
INSERT INTO `lucky_area` VALUES ('4142', '4130', '华阴市');
INSERT INTO `lucky_area` VALUES ('4143', '4078', '延安市');
INSERT INTO `lucky_area` VALUES ('4144', '4143', '市辖区');
INSERT INTO `lucky_area` VALUES ('4145', '4143', '宝塔区');
INSERT INTO `lucky_area` VALUES ('4146', '4143', '延长县');
INSERT INTO `lucky_area` VALUES ('4147', '4143', '延川县');
INSERT INTO `lucky_area` VALUES ('4148', '4143', '子长县');
INSERT INTO `lucky_area` VALUES ('4149', '4143', '安塞县');
INSERT INTO `lucky_area` VALUES ('4150', '4143', '志丹县');
INSERT INTO `lucky_area` VALUES ('4151', '4143', '吴起县');
INSERT INTO `lucky_area` VALUES ('4152', '4143', '甘泉县');
INSERT INTO `lucky_area` VALUES ('4153', '4143', '富县');
INSERT INTO `lucky_area` VALUES ('4154', '4143', '洛川县');
INSERT INTO `lucky_area` VALUES ('4155', '4143', '宜川县');
INSERT INTO `lucky_area` VALUES ('4156', '4143', '黄龙县');
INSERT INTO `lucky_area` VALUES ('4157', '4143', '黄陵县');
INSERT INTO `lucky_area` VALUES ('4158', '4078', '汉中市');
INSERT INTO `lucky_area` VALUES ('4159', '4158', '市辖区');
INSERT INTO `lucky_area` VALUES ('4160', '4158', '汉台区');
INSERT INTO `lucky_area` VALUES ('4161', '4158', '南郑县');
INSERT INTO `lucky_area` VALUES ('4162', '4158', '城固县');
INSERT INTO `lucky_area` VALUES ('4163', '4158', '洋县');
INSERT INTO `lucky_area` VALUES ('4164', '4158', '西乡县');
INSERT INTO `lucky_area` VALUES ('4165', '4158', '勉县');
INSERT INTO `lucky_area` VALUES ('4166', '4158', '宁强县');
INSERT INTO `lucky_area` VALUES ('4167', '4158', '略阳县');
INSERT INTO `lucky_area` VALUES ('4168', '4158', '镇巴县');
INSERT INTO `lucky_area` VALUES ('4169', '4158', '留坝县');
INSERT INTO `lucky_area` VALUES ('4170', '4158', '佛坪县');
INSERT INTO `lucky_area` VALUES ('4171', '4078', '榆林市');
INSERT INTO `lucky_area` VALUES ('4172', '4171', '市辖区');
INSERT INTO `lucky_area` VALUES ('4173', '4171', '榆阳区');
INSERT INTO `lucky_area` VALUES ('4174', '4171', '神木县');
INSERT INTO `lucky_area` VALUES ('4175', '4171', '府谷县');
INSERT INTO `lucky_area` VALUES ('4176', '4171', '横山县');
INSERT INTO `lucky_area` VALUES ('4177', '4171', '靖边县');
INSERT INTO `lucky_area` VALUES ('4178', '4171', '定边县');
INSERT INTO `lucky_area` VALUES ('4179', '4171', '绥德县');
INSERT INTO `lucky_area` VALUES ('4180', '4171', '米脂县');
INSERT INTO `lucky_area` VALUES ('4181', '4171', '佳县');
INSERT INTO `lucky_area` VALUES ('4182', '4171', '吴堡县');
INSERT INTO `lucky_area` VALUES ('4183', '4171', '清涧县');
INSERT INTO `lucky_area` VALUES ('4184', '4171', '子洲县');
INSERT INTO `lucky_area` VALUES ('4185', '4078', '安康市');
INSERT INTO `lucky_area` VALUES ('4186', '4185', '市辖区');
INSERT INTO `lucky_area` VALUES ('4187', '4185', '汉滨区');
INSERT INTO `lucky_area` VALUES ('4188', '4185', '汉阴县');
INSERT INTO `lucky_area` VALUES ('4189', '4185', '石泉县');
INSERT INTO `lucky_area` VALUES ('4190', '4185', '宁陕县');
INSERT INTO `lucky_area` VALUES ('4191', '4185', '紫阳县');
INSERT INTO `lucky_area` VALUES ('4192', '4185', '岚皋县');
INSERT INTO `lucky_area` VALUES ('4193', '4185', '平利县');
INSERT INTO `lucky_area` VALUES ('4194', '4185', '镇坪县');
INSERT INTO `lucky_area` VALUES ('4195', '4185', '旬阳县');
INSERT INTO `lucky_area` VALUES ('4196', '4185', '白河县');
INSERT INTO `lucky_area` VALUES ('4197', '4078', '商洛市');
INSERT INTO `lucky_area` VALUES ('4198', '4197', '市辖区');
INSERT INTO `lucky_area` VALUES ('4199', '4197', '商州区');
INSERT INTO `lucky_area` VALUES ('4200', '4197', '洛南县');
INSERT INTO `lucky_area` VALUES ('4201', '4197', '丹凤县');
INSERT INTO `lucky_area` VALUES ('4202', '4197', '商南县');
INSERT INTO `lucky_area` VALUES ('4203', '4197', '山阳县');
INSERT INTO `lucky_area` VALUES ('4204', '4197', '镇安县');
INSERT INTO `lucky_area` VALUES ('4205', '4197', '柞水县');
INSERT INTO `lucky_area` VALUES ('4206', '0', '甘肃省');
INSERT INTO `lucky_area` VALUES ('4207', '4206', '兰州市');
INSERT INTO `lucky_area` VALUES ('4208', '4207', '市辖区');
INSERT INTO `lucky_area` VALUES ('4209', '4207', '城关区');
INSERT INTO `lucky_area` VALUES ('4210', '4207', '七里河区');
INSERT INTO `lucky_area` VALUES ('4211', '4207', '西固区');
INSERT INTO `lucky_area` VALUES ('4212', '4207', '安宁区');
INSERT INTO `lucky_area` VALUES ('4213', '4207', '红古区');
INSERT INTO `lucky_area` VALUES ('4214', '4207', '永登县');
INSERT INTO `lucky_area` VALUES ('4215', '4207', '皋兰县');
INSERT INTO `lucky_area` VALUES ('4216', '4207', '榆中县');
INSERT INTO `lucky_area` VALUES ('4217', '4206', '嘉峪关市');
INSERT INTO `lucky_area` VALUES ('4218', '4217', '市辖区');
INSERT INTO `lucky_area` VALUES ('4219', '4206', '金昌市');
INSERT INTO `lucky_area` VALUES ('4220', '4219', '市辖区');
INSERT INTO `lucky_area` VALUES ('4221', '4219', '金川区');
INSERT INTO `lucky_area` VALUES ('4222', '4219', '永昌县');
INSERT INTO `lucky_area` VALUES ('4223', '4206', '白银市');
INSERT INTO `lucky_area` VALUES ('4224', '4223', '市辖区');
INSERT INTO `lucky_area` VALUES ('4225', '4223', '白银区');
INSERT INTO `lucky_area` VALUES ('4226', '4223', '平川区');
INSERT INTO `lucky_area` VALUES ('4227', '4223', '靖远县');
INSERT INTO `lucky_area` VALUES ('4228', '4223', '会宁县');
INSERT INTO `lucky_area` VALUES ('4229', '4223', '景泰县');
INSERT INTO `lucky_area` VALUES ('4230', '4206', '天水市');
INSERT INTO `lucky_area` VALUES ('4231', '4230', '市辖区');
INSERT INTO `lucky_area` VALUES ('4232', '4230', '秦城区');
INSERT INTO `lucky_area` VALUES ('4233', '4230', '北道区');
INSERT INTO `lucky_area` VALUES ('4234', '4230', '清水县');
INSERT INTO `lucky_area` VALUES ('4235', '4230', '秦安县');
INSERT INTO `lucky_area` VALUES ('4236', '4230', '甘谷县');
INSERT INTO `lucky_area` VALUES ('4237', '4230', '武山县');
INSERT INTO `lucky_area` VALUES ('4238', '4230', '张家川回族自治县');
INSERT INTO `lucky_area` VALUES ('4239', '4206', '武威市');
INSERT INTO `lucky_area` VALUES ('4240', '4239', '市辖区');
INSERT INTO `lucky_area` VALUES ('4241', '4239', '凉州区');
INSERT INTO `lucky_area` VALUES ('4242', '4239', '民勤县');
INSERT INTO `lucky_area` VALUES ('4243', '4239', '古浪县');
INSERT INTO `lucky_area` VALUES ('4244', '4239', '天祝藏族自治县');
INSERT INTO `lucky_area` VALUES ('4245', '4206', '张掖市');
INSERT INTO `lucky_area` VALUES ('4246', '4245', '市辖区');
INSERT INTO `lucky_area` VALUES ('4247', '4245', '甘州区');
INSERT INTO `lucky_area` VALUES ('4248', '4245', '肃南裕固族自治县');
INSERT INTO `lucky_area` VALUES ('4249', '4245', '民乐县');
INSERT INTO `lucky_area` VALUES ('4250', '4245', '临泽县');
INSERT INTO `lucky_area` VALUES ('4251', '4245', '高台县');
INSERT INTO `lucky_area` VALUES ('4252', '4245', '山丹县');
INSERT INTO `lucky_area` VALUES ('4253', '4206', '平凉市');
INSERT INTO `lucky_area` VALUES ('4254', '4253', '市辖区');
INSERT INTO `lucky_area` VALUES ('4255', '4253', '崆峒区');
INSERT INTO `lucky_area` VALUES ('4256', '4253', '泾川县');
INSERT INTO `lucky_area` VALUES ('4257', '4253', '灵台县');
INSERT INTO `lucky_area` VALUES ('4258', '4253', '崇信县');
INSERT INTO `lucky_area` VALUES ('4259', '4253', '华亭县');
INSERT INTO `lucky_area` VALUES ('4260', '4253', '庄浪县');
INSERT INTO `lucky_area` VALUES ('4261', '4253', '静宁县');
INSERT INTO `lucky_area` VALUES ('4262', '4206', '酒泉市');
INSERT INTO `lucky_area` VALUES ('4263', '4262', '市辖区');
INSERT INTO `lucky_area` VALUES ('4264', '4262', '肃州区');
INSERT INTO `lucky_area` VALUES ('4265', '4262', '金塔县');
INSERT INTO `lucky_area` VALUES ('4266', '4262', '安西县');
INSERT INTO `lucky_area` VALUES ('4267', '4262', '肃北蒙古族自治县');
INSERT INTO `lucky_area` VALUES ('4268', '4262', '阿克塞哈萨克族自治县');
INSERT INTO `lucky_area` VALUES ('4269', '4262', '玉门市');
INSERT INTO `lucky_area` VALUES ('4270', '4262', '敦煌市');
INSERT INTO `lucky_area` VALUES ('4271', '4206', '庆阳市');
INSERT INTO `lucky_area` VALUES ('4272', '4271', '市辖区');
INSERT INTO `lucky_area` VALUES ('4273', '4271', '西峰区');
INSERT INTO `lucky_area` VALUES ('4274', '4271', '庆城县');
INSERT INTO `lucky_area` VALUES ('4275', '4271', '环县');
INSERT INTO `lucky_area` VALUES ('4276', '4271', '华池县');
INSERT INTO `lucky_area` VALUES ('4277', '4271', '合水县');
INSERT INTO `lucky_area` VALUES ('4278', '4271', '正宁县');
INSERT INTO `lucky_area` VALUES ('4279', '4271', '宁县');
INSERT INTO `lucky_area` VALUES ('4280', '4271', '镇原县');
INSERT INTO `lucky_area` VALUES ('4281', '4206', '定西市');
INSERT INTO `lucky_area` VALUES ('4282', '4281', '市辖区');
INSERT INTO `lucky_area` VALUES ('4283', '4281', '安定区');
INSERT INTO `lucky_area` VALUES ('4284', '4281', '通渭县');
INSERT INTO `lucky_area` VALUES ('4285', '4281', '陇西县');
INSERT INTO `lucky_area` VALUES ('4286', '4281', '渭源县');
INSERT INTO `lucky_area` VALUES ('4287', '4281', '临洮县');
INSERT INTO `lucky_area` VALUES ('4288', '4281', '漳县');
INSERT INTO `lucky_area` VALUES ('4289', '4281', '岷县');
INSERT INTO `lucky_area` VALUES ('4290', '4206', '陇南市');
INSERT INTO `lucky_area` VALUES ('4291', '4290', '市辖区');
INSERT INTO `lucky_area` VALUES ('4292', '4290', '武都区');
INSERT INTO `lucky_area` VALUES ('4293', '4290', '成县');
INSERT INTO `lucky_area` VALUES ('4294', '4290', '文县');
INSERT INTO `lucky_area` VALUES ('4295', '4290', '宕昌县');
INSERT INTO `lucky_area` VALUES ('4296', '4290', '康县');
INSERT INTO `lucky_area` VALUES ('4297', '4290', '西和县');
INSERT INTO `lucky_area` VALUES ('4298', '4290', '礼县');
INSERT INTO `lucky_area` VALUES ('4299', '4290', '徽县');
INSERT INTO `lucky_area` VALUES ('4300', '4290', '两当县');
INSERT INTO `lucky_area` VALUES ('4301', '4206', '临夏回族自治州');
INSERT INTO `lucky_area` VALUES ('4302', '4301', '临夏市');
INSERT INTO `lucky_area` VALUES ('4303', '4301', '临夏县');
INSERT INTO `lucky_area` VALUES ('4304', '4301', '康乐县');
INSERT INTO `lucky_area` VALUES ('4305', '4301', '永靖县');
INSERT INTO `lucky_area` VALUES ('4306', '4301', '广河县');
INSERT INTO `lucky_area` VALUES ('4307', '4301', '和政县');
INSERT INTO `lucky_area` VALUES ('4308', '4301', '东乡族自治县');
INSERT INTO `lucky_area` VALUES ('4309', '4301', '积石山保安族东乡族撒拉族自治县');
INSERT INTO `lucky_area` VALUES ('4310', '4206', '甘南藏族自治州');
INSERT INTO `lucky_area` VALUES ('4311', '4310', '合作市');
INSERT INTO `lucky_area` VALUES ('4312', '4310', '临潭县');
INSERT INTO `lucky_area` VALUES ('4313', '4310', '卓尼县');
INSERT INTO `lucky_area` VALUES ('4314', '4310', '舟曲县');
INSERT INTO `lucky_area` VALUES ('4315', '4310', '迭部县');
INSERT INTO `lucky_area` VALUES ('4316', '4310', '玛曲县');
INSERT INTO `lucky_area` VALUES ('4317', '4310', '碌曲县');
INSERT INTO `lucky_area` VALUES ('4318', '4310', '夏河县');
INSERT INTO `lucky_area` VALUES ('4319', '0', '青海省');
INSERT INTO `lucky_area` VALUES ('4320', '4319', '西宁市');
INSERT INTO `lucky_area` VALUES ('4321', '4320', '市辖区');
INSERT INTO `lucky_area` VALUES ('4322', '4320', '城东区');
INSERT INTO `lucky_area` VALUES ('4323', '4320', '城中区');
INSERT INTO `lucky_area` VALUES ('4324', '4320', '城西区');
INSERT INTO `lucky_area` VALUES ('4325', '4320', '城北区');
INSERT INTO `lucky_area` VALUES ('4326', '4320', '大通回族土族自治县');
INSERT INTO `lucky_area` VALUES ('4327', '4320', '湟中县');
INSERT INTO `lucky_area` VALUES ('4328', '4320', '湟源县');
INSERT INTO `lucky_area` VALUES ('4329', '4319', '海东地区');
INSERT INTO `lucky_area` VALUES ('4330', '4329', '平安县');
INSERT INTO `lucky_area` VALUES ('4331', '4329', '民和回族土族自治县');
INSERT INTO `lucky_area` VALUES ('4332', '4329', '乐都县');
INSERT INTO `lucky_area` VALUES ('4333', '4329', '互助土族自治县');
INSERT INTO `lucky_area` VALUES ('4334', '4329', '化隆回族自治县');
INSERT INTO `lucky_area` VALUES ('4335', '4329', '循化撒拉族自治县');
INSERT INTO `lucky_area` VALUES ('4336', '4319', '海北藏族自治州');
INSERT INTO `lucky_area` VALUES ('4337', '4336', '门源回族自治县');
INSERT INTO `lucky_area` VALUES ('4338', '4336', '祁连县');
INSERT INTO `lucky_area` VALUES ('4339', '4336', '海晏县');
INSERT INTO `lucky_area` VALUES ('4340', '4336', '刚察县');
INSERT INTO `lucky_area` VALUES ('4341', '4319', '黄南藏族自治州');
INSERT INTO `lucky_area` VALUES ('4342', '4341', '同仁县');
INSERT INTO `lucky_area` VALUES ('4343', '4341', '尖扎县');
INSERT INTO `lucky_area` VALUES ('4344', '4341', '泽库县');
INSERT INTO `lucky_area` VALUES ('4345', '4341', '河南蒙古族自治县');
INSERT INTO `lucky_area` VALUES ('4346', '4319', '海南藏族自治州');
INSERT INTO `lucky_area` VALUES ('4347', '4346', '共和县');
INSERT INTO `lucky_area` VALUES ('4348', '4346', '同德县');
INSERT INTO `lucky_area` VALUES ('4349', '4346', '贵德县');
INSERT INTO `lucky_area` VALUES ('4350', '4346', '兴海县');
INSERT INTO `lucky_area` VALUES ('4351', '4346', '贵南县');
INSERT INTO `lucky_area` VALUES ('4352', '4319', '果洛藏族自治州');
INSERT INTO `lucky_area` VALUES ('4353', '4352', '玛沁县');
INSERT INTO `lucky_area` VALUES ('4354', '4352', '班玛县');
INSERT INTO `lucky_area` VALUES ('4355', '4352', '甘德县');
INSERT INTO `lucky_area` VALUES ('4356', '4352', '达日县');
INSERT INTO `lucky_area` VALUES ('4357', '4352', '久治县');
INSERT INTO `lucky_area` VALUES ('4358', '4352', '玛多县');
INSERT INTO `lucky_area` VALUES ('4359', '4319', '玉树藏族自治州');
INSERT INTO `lucky_area` VALUES ('4360', '4359', '玉树县');
INSERT INTO `lucky_area` VALUES ('4361', '4359', '杂多县');
INSERT INTO `lucky_area` VALUES ('4362', '4359', '称多县');
INSERT INTO `lucky_area` VALUES ('4363', '4359', '治多县');
INSERT INTO `lucky_area` VALUES ('4364', '4359', '囊谦县');
INSERT INTO `lucky_area` VALUES ('4365', '4359', '曲麻莱县');
INSERT INTO `lucky_area` VALUES ('4366', '4319', '海西蒙古族藏族自治州');
INSERT INTO `lucky_area` VALUES ('4367', '4366', '格尔木市');
INSERT INTO `lucky_area` VALUES ('4368', '4366', '德令哈市');
INSERT INTO `lucky_area` VALUES ('4369', '4366', '乌兰县');
INSERT INTO `lucky_area` VALUES ('4370', '4366', '都兰县');
INSERT INTO `lucky_area` VALUES ('4371', '4366', '天峻县');
INSERT INTO `lucky_area` VALUES ('4372', '0', '宁夏回族自治区');
INSERT INTO `lucky_area` VALUES ('4373', '4372', '银川市');
INSERT INTO `lucky_area` VALUES ('4374', '4373', '市辖区');
INSERT INTO `lucky_area` VALUES ('4375', '4373', '兴庆区');
INSERT INTO `lucky_area` VALUES ('4376', '4373', '西夏区');
INSERT INTO `lucky_area` VALUES ('4377', '4373', '金凤区');
INSERT INTO `lucky_area` VALUES ('4378', '4373', '永宁县');
INSERT INTO `lucky_area` VALUES ('4379', '4373', '贺兰县');
INSERT INTO `lucky_area` VALUES ('4380', '4373', '灵武市');
INSERT INTO `lucky_area` VALUES ('4381', '4372', '石嘴山市');
INSERT INTO `lucky_area` VALUES ('4382', '4381', '市辖区');
INSERT INTO `lucky_area` VALUES ('4383', '4381', '大武口区');
INSERT INTO `lucky_area` VALUES ('4384', '4381', '惠农区');
INSERT INTO `lucky_area` VALUES ('4385', '4381', '平罗县');
INSERT INTO `lucky_area` VALUES ('4386', '4372', '吴忠市');
INSERT INTO `lucky_area` VALUES ('4387', '4386', '市辖区');
INSERT INTO `lucky_area` VALUES ('4388', '4386', '利通区');
INSERT INTO `lucky_area` VALUES ('4389', '4386', '盐池县');
INSERT INTO `lucky_area` VALUES ('4390', '4386', '同心县');
INSERT INTO `lucky_area` VALUES ('4391', '4386', '青铜峡市');
INSERT INTO `lucky_area` VALUES ('4392', '4372', '固原市');
INSERT INTO `lucky_area` VALUES ('4393', '4392', '市辖区');
INSERT INTO `lucky_area` VALUES ('4394', '4392', '原州区');
INSERT INTO `lucky_area` VALUES ('4395', '4392', '西吉县');
INSERT INTO `lucky_area` VALUES ('4396', '4392', '隆德县');
INSERT INTO `lucky_area` VALUES ('4397', '4392', '泾源县');
INSERT INTO `lucky_area` VALUES ('4398', '4392', '彭阳县');
INSERT INTO `lucky_area` VALUES ('4399', '4372', '中卫市');
INSERT INTO `lucky_area` VALUES ('4400', '4399', '市辖区');
INSERT INTO `lucky_area` VALUES ('4401', '4399', '沙坡头区');
INSERT INTO `lucky_area` VALUES ('4402', '4399', '中宁县');
INSERT INTO `lucky_area` VALUES ('4403', '4399', '海原县');
INSERT INTO `lucky_area` VALUES ('4404', '0', '新疆维吾尔自治区');
INSERT INTO `lucky_area` VALUES ('4405', '4404', '乌鲁木齐市');
INSERT INTO `lucky_area` VALUES ('4406', '4405', '市辖区');
INSERT INTO `lucky_area` VALUES ('4407', '4405', '天山区');
INSERT INTO `lucky_area` VALUES ('4408', '4405', '沙依巴克区');
INSERT INTO `lucky_area` VALUES ('4409', '4405', '新市区');
INSERT INTO `lucky_area` VALUES ('4410', '4405', '水磨沟区');
INSERT INTO `lucky_area` VALUES ('4411', '4405', '头屯河区');
INSERT INTO `lucky_area` VALUES ('4412', '4405', '达坂城区');
INSERT INTO `lucky_area` VALUES ('4413', '4405', '东山区');
INSERT INTO `lucky_area` VALUES ('4414', '4405', '乌鲁木齐县');
INSERT INTO `lucky_area` VALUES ('4415', '4404', '克拉玛依市');
INSERT INTO `lucky_area` VALUES ('4416', '4415', '市辖区');
INSERT INTO `lucky_area` VALUES ('4417', '4415', '独山子区');
INSERT INTO `lucky_area` VALUES ('4418', '4415', '克拉玛依区');
INSERT INTO `lucky_area` VALUES ('4419', '4415', '白碱滩区');
INSERT INTO `lucky_area` VALUES ('4420', '4415', '乌尔禾区');
INSERT INTO `lucky_area` VALUES ('4421', '4404', '吐鲁番地区');
INSERT INTO `lucky_area` VALUES ('4422', '4421', '吐鲁番市');
INSERT INTO `lucky_area` VALUES ('4423', '4421', '鄯善县');
INSERT INTO `lucky_area` VALUES ('4424', '4421', '托克逊县');
INSERT INTO `lucky_area` VALUES ('4425', '4404', '哈密地区');
INSERT INTO `lucky_area` VALUES ('4426', '4425', '哈密市');
INSERT INTO `lucky_area` VALUES ('4427', '4425', '巴里坤哈萨克自治县');
INSERT INTO `lucky_area` VALUES ('4428', '4425', '伊吾县');
INSERT INTO `lucky_area` VALUES ('4429', '4404', '昌吉回族自治州');
INSERT INTO `lucky_area` VALUES ('4430', '4429', '昌吉市');
INSERT INTO `lucky_area` VALUES ('4431', '4429', '阜康市');
INSERT INTO `lucky_area` VALUES ('4432', '4429', '米泉市');
INSERT INTO `lucky_area` VALUES ('4433', '4429', '呼图壁县');
INSERT INTO `lucky_area` VALUES ('4434', '4429', '玛纳斯县');
INSERT INTO `lucky_area` VALUES ('4435', '4429', '奇台县');
INSERT INTO `lucky_area` VALUES ('4436', '4429', '吉木萨尔县');
INSERT INTO `lucky_area` VALUES ('4437', '4429', '木垒哈萨克自治县');
INSERT INTO `lucky_area` VALUES ('4438', '4404', '博尔塔拉蒙古自治州');
INSERT INTO `lucky_area` VALUES ('4439', '4438', '博乐市');
INSERT INTO `lucky_area` VALUES ('4440', '4438', '精河县');
INSERT INTO `lucky_area` VALUES ('4441', '4438', '温泉县');
INSERT INTO `lucky_area` VALUES ('4442', '4404', '巴音郭楞蒙古自治州');
INSERT INTO `lucky_area` VALUES ('4443', '4442', '库尔勒市');
INSERT INTO `lucky_area` VALUES ('4444', '4442', '轮台县');
INSERT INTO `lucky_area` VALUES ('4445', '4442', '尉犁县');
INSERT INTO `lucky_area` VALUES ('4446', '4442', '若羌县');
INSERT INTO `lucky_area` VALUES ('4447', '4442', '且末县');
INSERT INTO `lucky_area` VALUES ('4448', '4442', '焉耆回族自治县');
INSERT INTO `lucky_area` VALUES ('4449', '4442', '和静县');
INSERT INTO `lucky_area` VALUES ('4450', '4442', '和硕县');
INSERT INTO `lucky_area` VALUES ('4451', '4442', '博湖县');
INSERT INTO `lucky_area` VALUES ('4452', '4404', '阿克苏地区');
INSERT INTO `lucky_area` VALUES ('4453', '4452', '阿克苏市');
INSERT INTO `lucky_area` VALUES ('4454', '4452', '温宿县');
INSERT INTO `lucky_area` VALUES ('4455', '4452', '库车县');
INSERT INTO `lucky_area` VALUES ('4456', '4452', '沙雅县');
INSERT INTO `lucky_area` VALUES ('4457', '4452', '新和县');
INSERT INTO `lucky_area` VALUES ('4458', '4452', '拜城县');
INSERT INTO `lucky_area` VALUES ('4459', '4452', '乌什县');
INSERT INTO `lucky_area` VALUES ('4460', '4452', '阿瓦提县');
INSERT INTO `lucky_area` VALUES ('4461', '4452', '柯坪县');
INSERT INTO `lucky_area` VALUES ('4462', '4404', '克孜勒苏柯尔克孜自治州');
INSERT INTO `lucky_area` VALUES ('4463', '4462', '阿图什市');
INSERT INTO `lucky_area` VALUES ('4464', '4462', '阿克陶县');
INSERT INTO `lucky_area` VALUES ('4465', '4462', '阿合奇县');
INSERT INTO `lucky_area` VALUES ('4466', '4462', '乌恰县');
INSERT INTO `lucky_area` VALUES ('4467', '4404', '喀什地区');
INSERT INTO `lucky_area` VALUES ('4468', '4467', '喀什市');
INSERT INTO `lucky_area` VALUES ('4469', '4467', '疏附县');
INSERT INTO `lucky_area` VALUES ('4470', '4467', '疏勒县');
INSERT INTO `lucky_area` VALUES ('4471', '4467', '英吉沙县');
INSERT INTO `lucky_area` VALUES ('4472', '4467', '泽普县');
INSERT INTO `lucky_area` VALUES ('4473', '4467', '莎车县');
INSERT INTO `lucky_area` VALUES ('4474', '4467', '叶城县');
INSERT INTO `lucky_area` VALUES ('4475', '4467', '麦盖提县');
INSERT INTO `lucky_area` VALUES ('4476', '4467', '岳普湖县');
INSERT INTO `lucky_area` VALUES ('4477', '4467', '伽师县');
INSERT INTO `lucky_area` VALUES ('4478', '4467', '巴楚县');
INSERT INTO `lucky_area` VALUES ('4479', '4467', '塔什库尔干塔吉克自治县');
INSERT INTO `lucky_area` VALUES ('4480', '4404', '和田地区');
INSERT INTO `lucky_area` VALUES ('4481', '4480', '和田市');
INSERT INTO `lucky_area` VALUES ('4482', '4480', '和田县');
INSERT INTO `lucky_area` VALUES ('4483', '4480', '墨玉县');
INSERT INTO `lucky_area` VALUES ('4484', '4480', '皮山县');
INSERT INTO `lucky_area` VALUES ('4485', '4480', '洛浦县');
INSERT INTO `lucky_area` VALUES ('4486', '4480', '策勒县');
INSERT INTO `lucky_area` VALUES ('4487', '4480', '于田县');
INSERT INTO `lucky_area` VALUES ('4488', '4480', '民丰县');
INSERT INTO `lucky_area` VALUES ('4489', '4404', '伊犁哈萨克自治州');
INSERT INTO `lucky_area` VALUES ('4490', '4489', '伊宁市');
INSERT INTO `lucky_area` VALUES ('4491', '4489', '奎屯市');
INSERT INTO `lucky_area` VALUES ('4492', '4489', '伊宁县');
INSERT INTO `lucky_area` VALUES ('4493', '4489', '察布查尔锡伯自治县');
INSERT INTO `lucky_area` VALUES ('4494', '4489', '霍城县');
INSERT INTO `lucky_area` VALUES ('4495', '4489', '巩留县');
INSERT INTO `lucky_area` VALUES ('4496', '4489', '新源县');
INSERT INTO `lucky_area` VALUES ('4497', '4489', '昭苏县');
INSERT INTO `lucky_area` VALUES ('4498', '4489', '特克斯县');
INSERT INTO `lucky_area` VALUES ('4499', '4489', '尼勒克县');
INSERT INTO `lucky_area` VALUES ('4500', '4404', '塔城地区');
INSERT INTO `lucky_area` VALUES ('4501', '4500', '塔城市');
INSERT INTO `lucky_area` VALUES ('4502', '4500', '乌苏市');
INSERT INTO `lucky_area` VALUES ('4503', '4500', '额敏县');
INSERT INTO `lucky_area` VALUES ('4504', '4500', '沙湾县');
INSERT INTO `lucky_area` VALUES ('4505', '4500', '托里县');
INSERT INTO `lucky_area` VALUES ('4506', '4500', '裕民县');
INSERT INTO `lucky_area` VALUES ('4507', '4500', '和布克赛尔蒙古自治县');
INSERT INTO `lucky_area` VALUES ('4508', '4404', '阿勒泰地区');
INSERT INTO `lucky_area` VALUES ('4509', '4508', '阿勒泰市');
INSERT INTO `lucky_area` VALUES ('4510', '4508', '布尔津县');
INSERT INTO `lucky_area` VALUES ('4511', '4508', '富蕴县');
INSERT INTO `lucky_area` VALUES ('4512', '4508', '福海县');
INSERT INTO `lucky_area` VALUES ('4513', '4508', '哈巴河县');
INSERT INTO `lucky_area` VALUES ('4514', '4508', '青河县');
INSERT INTO `lucky_area` VALUES ('4515', '4508', '吉木乃县');
INSERT INTO `lucky_area` VALUES ('4516', '4404', '省直辖行政单位');
INSERT INTO `lucky_area` VALUES ('4517', '4516', '石河子市');
INSERT INTO `lucky_area` VALUES ('4518', '4516', '阿拉尔市');
INSERT INTO `lucky_area` VALUES ('4519', '4516', '图木舒克市');
INSERT INTO `lucky_area` VALUES ('4520', '4516', '五家渠市');
INSERT INTO `lucky_area` VALUES ('4521', '0', '香港特别行政区');
INSERT INTO `lucky_area` VALUES ('4522', '4521', '香港');
INSERT INTO `lucky_area` VALUES ('4523', '4522', '香港特别行政区');
INSERT INTO `lucky_area` VALUES ('4524', '0', '澳门特别行政区');
INSERT INTO `lucky_area` VALUES ('4525', '4524', '澳门');
INSERT INTO `lucky_area` VALUES ('4526', '4525', '澳门特别行政区');
INSERT INTO `lucky_area` VALUES ('4527', '0', '台湾省');
INSERT INTO `lucky_area` VALUES ('4528', '4527', '台北市');
INSERT INTO `lucky_area` VALUES ('4529', '4528', '中正区');
INSERT INTO `lucky_area` VALUES ('4530', '4528', '大同区');
INSERT INTO `lucky_area` VALUES ('4531', '4528', '中山区');
INSERT INTO `lucky_area` VALUES ('4532', '4528', '松山区');
INSERT INTO `lucky_area` VALUES ('4533', '4528', '大安区');
INSERT INTO `lucky_area` VALUES ('4534', '4528', '万华区');
INSERT INTO `lucky_area` VALUES ('4535', '4528', '信义区');
INSERT INTO `lucky_area` VALUES ('4536', '4528', '士林区');
INSERT INTO `lucky_area` VALUES ('4537', '4528', '北投区');
INSERT INTO `lucky_area` VALUES ('4538', '4528', '内湖区');
INSERT INTO `lucky_area` VALUES ('4539', '4528', '南港区');
INSERT INTO `lucky_area` VALUES ('4540', '4528', '文山区');
INSERT INTO `lucky_area` VALUES ('4541', '4527', '高雄市');
INSERT INTO `lucky_area` VALUES ('4542', '4541', '新兴区');
INSERT INTO `lucky_area` VALUES ('4543', '4541', '前金区');
INSERT INTO `lucky_area` VALUES ('4544', '4541', '芩雅区');
INSERT INTO `lucky_area` VALUES ('4545', '4541', '盐埕区');
INSERT INTO `lucky_area` VALUES ('4546', '4541', '鼓山区');
INSERT INTO `lucky_area` VALUES ('4547', '4541', '旗津区');
INSERT INTO `lucky_area` VALUES ('4548', '4541', '前镇区');
INSERT INTO `lucky_area` VALUES ('4549', '4541', '三民区');
INSERT INTO `lucky_area` VALUES ('4550', '4541', '左营区');
INSERT INTO `lucky_area` VALUES ('4551', '4541', '楠梓区');
INSERT INTO `lucky_area` VALUES ('4552', '4541', '小港区');
INSERT INTO `lucky_area` VALUES ('4553', '4527', '基隆市');
INSERT INTO `lucky_area` VALUES ('4554', '4553', '仁爱区');
INSERT INTO `lucky_area` VALUES ('4555', '4553', '信义区');
INSERT INTO `lucky_area` VALUES ('4556', '4553', '中正区');
INSERT INTO `lucky_area` VALUES ('4557', '4553', '中山区');
INSERT INTO `lucky_area` VALUES ('4558', '4553', '安乐区');
INSERT INTO `lucky_area` VALUES ('4559', '4553', '暖暖区');
INSERT INTO `lucky_area` VALUES ('4560', '4553', '七堵区');
INSERT INTO `lucky_area` VALUES ('4561', '4527', '台中市');
INSERT INTO `lucky_area` VALUES ('4562', '4561', '中区');
INSERT INTO `lucky_area` VALUES ('4563', '4561', '东区');
INSERT INTO `lucky_area` VALUES ('4564', '4561', '南区');
INSERT INTO `lucky_area` VALUES ('4565', '4561', '西区');
INSERT INTO `lucky_area` VALUES ('4566', '4561', '北区');
INSERT INTO `lucky_area` VALUES ('4567', '4561', '北屯区');
INSERT INTO `lucky_area` VALUES ('4568', '4561', '西屯区');
INSERT INTO `lucky_area` VALUES ('4569', '4561', '南屯区');
INSERT INTO `lucky_area` VALUES ('4570', '4527', '台南市');
INSERT INTO `lucky_area` VALUES ('4571', '4570', '中西区');
INSERT INTO `lucky_area` VALUES ('4572', '4570', '东区');
INSERT INTO `lucky_area` VALUES ('4573', '4570', '南区');
INSERT INTO `lucky_area` VALUES ('4574', '4570', '北区');
INSERT INTO `lucky_area` VALUES ('4575', '4570', '安平区');
INSERT INTO `lucky_area` VALUES ('4576', '4570', '安南区');
INSERT INTO `lucky_area` VALUES ('4577', '4527', '新竹市');
INSERT INTO `lucky_area` VALUES ('4578', '4577', '东区');
INSERT INTO `lucky_area` VALUES ('4579', '4577', '北区');
INSERT INTO `lucky_area` VALUES ('4580', '4577', '香山区');
INSERT INTO `lucky_area` VALUES ('4581', '4527', '嘉义市');
INSERT INTO `lucky_area` VALUES ('4582', '4581', '东区');
INSERT INTO `lucky_area` VALUES ('4583', '4581', '西区');
INSERT INTO `lucky_area` VALUES ('4584', '4527', '县');
INSERT INTO `lucky_area` VALUES ('4585', '4584', '台北县(板桥市)');
INSERT INTO `lucky_area` VALUES ('4586', '4584', '宜兰县(宜兰市)');
INSERT INTO `lucky_area` VALUES ('4587', '4584', '新竹县(竹北市)');
INSERT INTO `lucky_area` VALUES ('4588', '4584', '桃园县(桃园市)');
INSERT INTO `lucky_area` VALUES ('4589', '4584', '苗栗县(苗栗市)');
INSERT INTO `lucky_area` VALUES ('4590', '4584', '台中县(丰原市)');
INSERT INTO `lucky_area` VALUES ('4591', '4584', '彰化县(彰化市)');
INSERT INTO `lucky_area` VALUES ('4592', '4584', '南投县(南投市)');
INSERT INTO `lucky_area` VALUES ('4593', '4584', '嘉义县(太保市)');
INSERT INTO `lucky_area` VALUES ('4594', '4584', '云林县(斗六市)');
INSERT INTO `lucky_area` VALUES ('4595', '4584', '台南县(新营市)');
INSERT INTO `lucky_area` VALUES ('4596', '4584', '高雄县(凤山市)');
INSERT INTO `lucky_area` VALUES ('4597', '4584', '屏东县(屏东市)');
INSERT INTO `lucky_area` VALUES ('4598', '4584', '台东县(台东市)');
INSERT INTO `lucky_area` VALUES ('4599', '4584', '花莲县(花莲市)');
INSERT INTO `lucky_area` VALUES ('4600', '4584', '澎湖县(马公市)');
INSERT INTO `lucky_area` VALUES ('4601', '0', '其它');
INSERT INTO `lucky_area` VALUES ('4602', '4601', '亚洲');
INSERT INTO `lucky_area` VALUES ('4603', '4602', '阿富汗');
INSERT INTO `lucky_area` VALUES ('4604', '4602', '巴林');
INSERT INTO `lucky_area` VALUES ('4605', '4602', '孟加拉国');
INSERT INTO `lucky_area` VALUES ('4606', '4602', '不丹');
INSERT INTO `lucky_area` VALUES ('4607', '4602', '文莱');
INSERT INTO `lucky_area` VALUES ('4608', '4602', '缅甸');
INSERT INTO `lucky_area` VALUES ('4609', '4602', '塞浦路斯');
INSERT INTO `lucky_area` VALUES ('4610', '4602', '印度');
INSERT INTO `lucky_area` VALUES ('4611', '4602', '印度尼西亚');
INSERT INTO `lucky_area` VALUES ('4612', '4602', '伊朗');
INSERT INTO `lucky_area` VALUES ('4613', '4602', '伊拉克');
INSERT INTO `lucky_area` VALUES ('4614', '4602', '日本');
INSERT INTO `lucky_area` VALUES ('4615', '4602', '约旦');
INSERT INTO `lucky_area` VALUES ('4616', '4602', '朝鲜');
INSERT INTO `lucky_area` VALUES ('4617', '4602', '科威特');
INSERT INTO `lucky_area` VALUES ('4618', '4602', '老挝');
INSERT INTO `lucky_area` VALUES ('4619', '4602', '马尔代夫');
INSERT INTO `lucky_area` VALUES ('4620', '4602', '黎巴嫩');
INSERT INTO `lucky_area` VALUES ('4621', '4602', '马来西亚');
INSERT INTO `lucky_area` VALUES ('4622', '4602', '以色列');
INSERT INTO `lucky_area` VALUES ('4623', '4602', '蒙古');
INSERT INTO `lucky_area` VALUES ('4624', '4602', '尼泊尔');
INSERT INTO `lucky_area` VALUES ('4625', '4602', '阿曼');
INSERT INTO `lucky_area` VALUES ('4626', '4602', '巴基斯坦');
INSERT INTO `lucky_area` VALUES ('4627', '4602', '巴勒斯坦');
INSERT INTO `lucky_area` VALUES ('4628', '4602', '菲律宾');
INSERT INTO `lucky_area` VALUES ('4629', '4602', '沙特阿拉伯');
INSERT INTO `lucky_area` VALUES ('4630', '4602', '新加坡');
INSERT INTO `lucky_area` VALUES ('4631', '4602', '斯里兰卡');
INSERT INTO `lucky_area` VALUES ('4632', '4602', '叙利亚');
INSERT INTO `lucky_area` VALUES ('4633', '4602', '泰国');
INSERT INTO `lucky_area` VALUES ('4634', '4602', '柬埔寨');
INSERT INTO `lucky_area` VALUES ('4635', '4602', '土耳其');
INSERT INTO `lucky_area` VALUES ('4636', '4602', '阿联酋');
INSERT INTO `lucky_area` VALUES ('4637', '4602', '越南');
INSERT INTO `lucky_area` VALUES ('4638', '4602', '也门');
INSERT INTO `lucky_area` VALUES ('4639', '4602', '韩国');
INSERT INTO `lucky_area` VALUES ('4640', '4602', '中国');
INSERT INTO `lucky_area` VALUES ('4641', '4602', '中国香港');
INSERT INTO `lucky_area` VALUES ('4642', '4602', '中国澳门');
INSERT INTO `lucky_area` VALUES ('4643', '4602', '中国台湾');
INSERT INTO `lucky_area` VALUES ('4644', '4601', '非洲');
INSERT INTO `lucky_area` VALUES ('4645', '4644', '阿尔及利亚');
INSERT INTO `lucky_area` VALUES ('4646', '4644', '安哥拉');
INSERT INTO `lucky_area` VALUES ('4647', '4644', '厄里特里亚');
INSERT INTO `lucky_area` VALUES ('4648', '4644', '法罗群鸟');
INSERT INTO `lucky_area` VALUES ('4649', '4644', '加那利群岛(西)(拉斯帕尔马斯)');
INSERT INTO `lucky_area` VALUES ('4650', '4644', '贝宁');
INSERT INTO `lucky_area` VALUES ('4651', '4644', '博茨瓦纳');
INSERT INTO `lucky_area` VALUES ('4652', '4644', '布基纳法索');
INSERT INTO `lucky_area` VALUES ('4653', '4644', '布隆迪');
INSERT INTO `lucky_area` VALUES ('4654', '4644', '喀麦隆');
INSERT INTO `lucky_area` VALUES ('4655', '4644', '加那利群岛(西)(圣克鲁斯)');
INSERT INTO `lucky_area` VALUES ('4656', '4644', '佛得角');
INSERT INTO `lucky_area` VALUES ('4657', '4644', '中非');
INSERT INTO `lucky_area` VALUES ('4658', '4644', '乍得');
INSERT INTO `lucky_area` VALUES ('4659', '4644', '科摩罗');
INSERT INTO `lucky_area` VALUES ('4660', '4644', '刚果');
INSERT INTO `lucky_area` VALUES ('4661', '4644', '吉布提');
INSERT INTO `lucky_area` VALUES ('4662', '4644', '埃及');
INSERT INTO `lucky_area` VALUES ('4663', '4644', '埃塞俄比亚');
INSERT INTO `lucky_area` VALUES ('4664', '4644', '赤道几内亚');
INSERT INTO `lucky_area` VALUES ('4665', '4644', '加蓬');
INSERT INTO `lucky_area` VALUES ('4666', '4644', '冈比亚');
INSERT INTO `lucky_area` VALUES ('4667', '4644', '加纳');
INSERT INTO `lucky_area` VALUES ('4668', '4644', '几内亚');
INSERT INTO `lucky_area` VALUES ('4669', '4644', '南非');
INSERT INTO `lucky_area` VALUES ('4670', '4644', '几内亚比绍');
INSERT INTO `lucky_area` VALUES ('4671', '4644', '科特迪瓦');
INSERT INTO `lucky_area` VALUES ('4672', '4644', '肯尼亚');
INSERT INTO `lucky_area` VALUES ('4673', '4644', '莱索托');
INSERT INTO `lucky_area` VALUES ('4674', '4644', '利比里亚');
INSERT INTO `lucky_area` VALUES ('4675', '4644', '利比亚');
INSERT INTO `lucky_area` VALUES ('4676', '4644', '马达加斯加');
INSERT INTO `lucky_area` VALUES ('4677', '4644', '马拉维');
INSERT INTO `lucky_area` VALUES ('4678', '4644', '马里');
INSERT INTO `lucky_area` VALUES ('4679', '4644', '毛里塔尼亚');
INSERT INTO `lucky_area` VALUES ('4680', '4644', '毛里求斯');
INSERT INTO `lucky_area` VALUES ('4681', '4644', '摩洛哥');
INSERT INTO `lucky_area` VALUES ('4682', '4644', '莫桑比克');
INSERT INTO `lucky_area` VALUES ('4683', '4644', '尼日尔');
INSERT INTO `lucky_area` VALUES ('4684', '4644', '尼日利亚');
INSERT INTO `lucky_area` VALUES ('4685', '4644', '留尼旺岛');
INSERT INTO `lucky_area` VALUES ('4686', '4644', '卢旺达');
INSERT INTO `lucky_area` VALUES ('4687', '4644', '塞内加尔');
INSERT INTO `lucky_area` VALUES ('4688', '4644', '塞舌尔');
INSERT INTO `lucky_area` VALUES ('4689', '4644', '塞拉利昂');
INSERT INTO `lucky_area` VALUES ('4690', '4644', '索马里');
INSERT INTO `lucky_area` VALUES ('4691', '4644', '苏丹');
INSERT INTO `lucky_area` VALUES ('4692', '4644', '斯威士兰');
INSERT INTO `lucky_area` VALUES ('4693', '4644', '坦桑尼亚');
INSERT INTO `lucky_area` VALUES ('4694', '4644', '圣赤勒拿');
INSERT INTO `lucky_area` VALUES ('4695', '4644', '多哥');
INSERT INTO `lucky_area` VALUES ('4696', '4644', '突尼斯');
INSERT INTO `lucky_area` VALUES ('4697', '4644', '乌干达');
INSERT INTO `lucky_area` VALUES ('4698', '4644', '扎伊尔');
INSERT INTO `lucky_area` VALUES ('4699', '4644', '赞比亚');
INSERT INTO `lucky_area` VALUES ('4700', '4644', '津巴布韦');
INSERT INTO `lucky_area` VALUES ('4701', '4644', '纳米比亚');
INSERT INTO `lucky_area` VALUES ('4702', '4644', '迪戈加西亚');
INSERT INTO `lucky_area` VALUES ('4703', '4644', '桑给巴尔');
INSERT INTO `lucky_area` VALUES ('4704', '4644', '马约特岛');
INSERT INTO `lucky_area` VALUES ('4705', '4644', '圣多美和普林西比');
INSERT INTO `lucky_area` VALUES ('4706', '4601', '欧洲');
INSERT INTO `lucky_area` VALUES ('4707', '4706', '阿尔巴尼亚');
INSERT INTO `lucky_area` VALUES ('4708', '4706', '安道尔');
INSERT INTO `lucky_area` VALUES ('4709', '4706', '奥地利');
INSERT INTO `lucky_area` VALUES ('4710', '4706', '比利时');
INSERT INTO `lucky_area` VALUES ('4711', '4706', '保加利亚');
INSERT INTO `lucky_area` VALUES ('4712', '4706', '捷克');
INSERT INTO `lucky_area` VALUES ('4713', '4706', '丹麦');
INSERT INTO `lucky_area` VALUES ('4714', '4706', '芬兰');
INSERT INTO `lucky_area` VALUES ('4715', '4706', '法国');
INSERT INTO `lucky_area` VALUES ('4716', '4706', '德国');
INSERT INTO `lucky_area` VALUES ('4717', '4706', '直布罗陀(英)');
INSERT INTO `lucky_area` VALUES ('4718', '4706', '希腊');
INSERT INTO `lucky_area` VALUES ('4719', '4706', '匈牙利');
INSERT INTO `lucky_area` VALUES ('4720', '4706', '冰岛');
INSERT INTO `lucky_area` VALUES ('4721', '4706', '爱尔兰');
INSERT INTO `lucky_area` VALUES ('4722', '4706', '意大利');
INSERT INTO `lucky_area` VALUES ('4723', '4706', '列支敦士登');
INSERT INTO `lucky_area` VALUES ('4724', '4706', '斯洛伐克');
INSERT INTO `lucky_area` VALUES ('4725', '4706', '卢森堡');
INSERT INTO `lucky_area` VALUES ('4726', '4706', '马耳他');
INSERT INTO `lucky_area` VALUES ('4727', '4706', '摩纳哥');
INSERT INTO `lucky_area` VALUES ('4728', '4706', '荷兰');
INSERT INTO `lucky_area` VALUES ('4729', '4706', '挪威');
INSERT INTO `lucky_area` VALUES ('4730', '4706', '波兰');
INSERT INTO `lucky_area` VALUES ('4731', '4706', '葡萄牙');
INSERT INTO `lucky_area` VALUES ('4732', '4706', '马其顿');
INSERT INTO `lucky_area` VALUES ('4733', '4706', '罗马尼亚');
INSERT INTO `lucky_area` VALUES ('4734', '4706', '南斯拉夫');
INSERT INTO `lucky_area` VALUES ('4735', '4706', '圣马力诺');
INSERT INTO `lucky_area` VALUES ('4736', '4706', '西班牙');
INSERT INTO `lucky_area` VALUES ('4737', '4706', '瑞典');
INSERT INTO `lucky_area` VALUES ('4738', '4706', '瑞士');
INSERT INTO `lucky_area` VALUES ('4739', '4706', '英国');
INSERT INTO `lucky_area` VALUES ('4740', '4706', '科罗地亚');
INSERT INTO `lucky_area` VALUES ('4741', '4706', '斯洛文尼亚');
INSERT INTO `lucky_area` VALUES ('4742', '4706', '梵蒂冈');
INSERT INTO `lucky_area` VALUES ('4743', '4706', '波斯尼亚和塞哥维那');
INSERT INTO `lucky_area` VALUES ('4744', '4706', '俄罗斯联邦');
INSERT INTO `lucky_area` VALUES ('4745', '4706', '亚美尼亚共和国');
INSERT INTO `lucky_area` VALUES ('4746', '4706', '白俄罗斯共和国');
INSERT INTO `lucky_area` VALUES ('4747', '4706', '格鲁吉亚共和国');
INSERT INTO `lucky_area` VALUES ('4748', '4706', '哈萨克斯坦共和国');
INSERT INTO `lucky_area` VALUES ('4749', '4706', '吉尔吉斯坦共和国');
INSERT INTO `lucky_area` VALUES ('4750', '4706', '乌兹别克斯坦共和国');
INSERT INTO `lucky_area` VALUES ('4751', '4706', '塔吉克斯坦共和国');
INSERT INTO `lucky_area` VALUES ('4752', '4706', '土库曼斯坦共和国');
INSERT INTO `lucky_area` VALUES ('4753', '4706', '乌克兰');
INSERT INTO `lucky_area` VALUES ('4754', '4706', '立陶宛');
INSERT INTO `lucky_area` VALUES ('4755', '4706', '拉脱维亚');
INSERT INTO `lucky_area` VALUES ('4756', '4706', '爱沙尼亚');
INSERT INTO `lucky_area` VALUES ('4757', '4706', '摩尔多瓦');
INSERT INTO `lucky_area` VALUES ('4758', '4706', '阿塞拜疆');
INSERT INTO `lucky_area` VALUES ('4759', '4601', '美洲');
INSERT INTO `lucky_area` VALUES ('4760', '4759', '安圭拉岛');
INSERT INTO `lucky_area` VALUES ('4761', '4759', '安提瓜和巴布达');
INSERT INTO `lucky_area` VALUES ('4762', '4759', '阿根廷');
INSERT INTO `lucky_area` VALUES ('4763', '4759', '阿鲁巴岛');
INSERT INTO `lucky_area` VALUES ('4764', '4759', '阿森松');
INSERT INTO `lucky_area` VALUES ('4765', '4759', '巴哈马');
INSERT INTO `lucky_area` VALUES ('4766', '4759', '巴巴多斯');
INSERT INTO `lucky_area` VALUES ('4767', '4759', '伯利兹');
INSERT INTO `lucky_area` VALUES ('4768', '4759', '百慕大群岛');
INSERT INTO `lucky_area` VALUES ('4769', '4759', '玻利维亚');
INSERT INTO `lucky_area` VALUES ('4770', '4759', '巴西');
INSERT INTO `lucky_area` VALUES ('4771', '4759', '加拿大');
INSERT INTO `lucky_area` VALUES ('4772', '4759', '开曼群岛');
INSERT INTO `lucky_area` VALUES ('4773', '4759', '智利');
INSERT INTO `lucky_area` VALUES ('4774', '4759', '哥伦比亚');
INSERT INTO `lucky_area` VALUES ('4775', '4759', '多米尼加联邦');
INSERT INTO `lucky_area` VALUES ('4776', '4759', '哥斯达黎加');
INSERT INTO `lucky_area` VALUES ('4777', '4759', '古巴');
INSERT INTO `lucky_area` VALUES ('4778', '4759', '多米尼加共和国');
INSERT INTO `lucky_area` VALUES ('4779', '4759', '厄瓜多尔');
INSERT INTO `lucky_area` VALUES ('4780', '4759', '萨尔瓦多');
INSERT INTO `lucky_area` VALUES ('4781', '4759', '法属圭亚那');
INSERT INTO `lucky_area` VALUES ('4782', '4759', '格林纳达');
INSERT INTO `lucky_area` VALUES ('4783', '4759', '危地马拉');
INSERT INTO `lucky_area` VALUES ('4784', '4759', '圭亚那');
INSERT INTO `lucky_area` VALUES ('4785', '4759', '海地');
INSERT INTO `lucky_area` VALUES ('4786', '4759', '洪都拉斯');
INSERT INTO `lucky_area` VALUES ('4787', '4759', '牙买加');
INSERT INTO `lucky_area` VALUES ('4788', '4759', '马提尼克(法)');
INSERT INTO `lucky_area` VALUES ('4789', '4759', '墨西哥');
INSERT INTO `lucky_area` VALUES ('4790', '4759', '蒙特塞拉特岛');
INSERT INTO `lucky_area` VALUES ('4791', '4759', '荷属安的列斯群岛');
INSERT INTO `lucky_area` VALUES ('4792', '4759', '尼加拉瓜');
INSERT INTO `lucky_area` VALUES ('4793', '4759', '巴拿马');
INSERT INTO `lucky_area` VALUES ('4794', '4759', '巴拉圭');
INSERT INTO `lucky_area` VALUES ('4795', '4759', '秘鲁');
INSERT INTO `lucky_area` VALUES ('4796', '4759', '波多黎哥');
INSERT INTO `lucky_area` VALUES ('4797', '4759', '圣皮埃尔岛密克隆岛(法)');
INSERT INTO `lucky_area` VALUES ('4798', '4759', '圣克里斯托弗和尼维斯');
INSERT INTO `lucky_area` VALUES ('4799', '4759', '圣卢西亚');
INSERT INTO `lucky_area` VALUES ('4800', '4759', '福克兰群岛');
INSERT INTO `lucky_area` VALUES ('4801', '4759', '维尔京群岛(英)');
INSERT INTO `lucky_area` VALUES ('4802', '4759', '圣文森特岛(英)');
INSERT INTO `lucky_area` VALUES ('4803', '4759', '维尔京群岛(美)');
INSERT INTO `lucky_area` VALUES ('4804', '4759', '苏里南');
INSERT INTO `lucky_area` VALUES ('4805', '4759', '特立尼达和多巴哥');
INSERT INTO `lucky_area` VALUES ('4806', '4759', '乌拉圭');
INSERT INTO `lucky_area` VALUES ('4807', '4759', '美国');
INSERT INTO `lucky_area` VALUES ('4808', '4759', '委内瑞拉');
INSERT INTO `lucky_area` VALUES ('4809', '4759', '格陵兰岛');
INSERT INTO `lucky_area` VALUES ('4810', '4759', '特克斯和凯科斯群岛');
INSERT INTO `lucky_area` VALUES ('4811', '4759', '瓜多罗普');
INSERT INTO `lucky_area` VALUES ('4812', '4601', '大洋洲');
INSERT INTO `lucky_area` VALUES ('4813', '4812', '澳大利亚');
INSERT INTO `lucky_area` VALUES ('4814', '4812', '科克群岛');
INSERT INTO `lucky_area` VALUES ('4815', '4812', '斐济');
INSERT INTO `lucky_area` VALUES ('4816', '4812', '法属波里尼西亚、塔希提');
INSERT INTO `lucky_area` VALUES ('4817', '4812', '瓦努阿图');
INSERT INTO `lucky_area` VALUES ('4818', '4812', '关岛');
INSERT INTO `lucky_area` VALUES ('4819', '4812', '基里巴斯');
INSERT INTO `lucky_area` VALUES ('4820', '4812', '马里亚纳群岛');
INSERT INTO `lucky_area` VALUES ('4821', '4812', '中途岛');
INSERT INTO `lucky_area` VALUES ('4822', '4812', '瑙鲁');
INSERT INTO `lucky_area` VALUES ('4823', '4812', '新咯里多尼亚群岛');
INSERT INTO `lucky_area` VALUES ('4824', '4812', '新西兰');
INSERT INTO `lucky_area` VALUES ('4825', '4812', '巴布亚新几内亚');
INSERT INTO `lucky_area` VALUES ('4826', '4812', '东萨摩亚');
INSERT INTO `lucky_area` VALUES ('4827', '4812', '西萨摩亚');
INSERT INTO `lucky_area` VALUES ('4828', '4812', '所罗门群岛');
INSERT INTO `lucky_area` VALUES ('4829', '4812', '汤加');
INSERT INTO `lucky_area` VALUES ('4830', '4812', '对诞岛');
INSERT INTO `lucky_area` VALUES ('4831', '4812', '威克岛');
INSERT INTO `lucky_area` VALUES ('4832', '4812', '科科斯岛');
INSERT INTO `lucky_area` VALUES ('4833', '4812', '夏威夷');
INSERT INTO `lucky_area` VALUES ('4834', '4812', '诺福克岛');
INSERT INTO `lucky_area` VALUES ('4835', '4812', '帕劳');
INSERT INTO `lucky_area` VALUES ('4836', '4812', '纽埃岛');
INSERT INTO `lucky_area` VALUES ('4837', '4812', '图瓦卢');
INSERT INTO `lucky_area` VALUES ('4838', '4812', '托克鲁');
INSERT INTO `lucky_area` VALUES ('4839', '4812', '密克罗尼西亚');
INSERT INTO `lucky_area` VALUES ('4840', '4812', '马绍尔群岛');
INSERT INTO `lucky_area` VALUES ('4841', '4812', '瓦里斯加富士那群岛');

-- ----------------------------
-- Table structure for lucky_brand
-- ----------------------------
DROP TABLE IF EXISTS `lucky_brand`;
CREATE TABLE `lucky_brand` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '品牌表',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `logo` varchar(80) NOT NULL DEFAULT '' COMMENT '品牌logo',
  `desc` text NOT NULL COMMENT '品牌描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌地址',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `initial` char(1) DEFAULT '' COMMENT '首字母',
  `cat_name` varchar(128) DEFAULT '' COMMENT '品牌分类',
  `top_cat_id` int(11) unsigned DEFAULT NULL COMMENT '品牌所属分类',
  `parent_cat_id` int(11) DEFAULT '0' COMMENT '分类id',
  `cat_id` int(10) DEFAULT '0' COMMENT '分类id',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_brand
-- ----------------------------
INSERT INTO `lucky_brand` VALUES ('1', '华为/HUAWEI', '/upload/admin/image/20170926/1506397624110991.jpg', '华为/HUAWEI 描述', '', '20', 'H', '瑞士卷', '1', '3', '15', '1');
INSERT INTO `lucky_brand` VALUES ('2', '摩托罗拉/MOTOROLA', '/upload/admin/image/20170926/1506397941855084.jpg', '', '', '10', 'M', '软面包', '5', '58', '70', '0');

-- ----------------------------
-- Table structure for lucky_cart
-- ----------------------------
DROP TABLE IF EXISTS `lucky_cart`;
CREATE TABLE `lucky_cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `order_id` int(11) unsigned NOT NULL COMMENT '订单id',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(255) NOT NULL COMMENT '商品名',
  `original_img` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `spec_group` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '规格组id',
  `specs_name` varchar(2555) NOT NULL DEFAULT '' COMMENT '规格组合文字',
  `shop_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品售出价格',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `goods_sn` varchar(255) NOT NULL DEFAULT '' COMMENT '商品编号',
  `freight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `sum` smallint(3) NOT NULL DEFAULT '0' COMMENT '数量',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`),
  KEY `spec_group` (`spec_group`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_cart
-- ----------------------------
INSERT INTO `lucky_cart` VALUES ('6', '17', '1', '13', '', '/upload/admin/image/20171008/1507452031116697.png', '434', '颜色: 黑色,大小: 大号,尺寸: S,深浅: 30cm', '123.00', '132.00', 'lucky12345', '10.00', '1', '1508208724');
INSERT INTO `lucky_cart` VALUES ('7', '17', '2', '13', '', '/upload/admin/image/20171008/1507452031116697.png', '434', '颜色: 黑色,大小: 大号,尺寸: S,深浅: 30cm', '123.00', '132.00', 'lucky12345', '10.00', '1', '1508208757');
INSERT INTO `lucky_cart` VALUES ('9', '17', '3', '13', '', '/upload/admin/image/20171008/1507452031116697.png', '434', '颜色: 黑色,大小: 大号,尺寸: S,深浅: 30cm', '123.00', '132.00', 'lucky12345', '10.00', '1', '1508209073');
INSERT INTO `lucky_cart` VALUES ('10', '17', '4', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '434', '颜色: 黑色,大小: 大号,尺寸: S,深浅: 30cm', '123.00', '132.00', 'lucky12345', '10.00', '1', '1508212699');
INSERT INTO `lucky_cart` VALUES ('11', '17', '5', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '434', '颜色: 黑色,大小: 大号,尺寸: S,深浅: 30cm', '123.00', '132.00', 'lucky12345', '10.00', '1', '1508212906');
INSERT INTO `lucky_cart` VALUES ('12', '17', '6', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '434', '颜色: 黑色,大小: 大号,尺寸: S,深浅: 30cm', '123.00', '132.00', 'lucky12345', '10.00', '1', '1508212924');
INSERT INTO `lucky_cart` VALUES ('13', '17', '7', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '434', '颜色: 黑色,大小: 大号,尺寸: S,深浅: 30cm', '123.00', '132.00', 'lucky12345', '10.00', '1', '1508212947');
INSERT INTO `lucky_cart` VALUES ('14', '17', '8', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '434', '颜色: 黑色,大小: 大号,尺寸: S,深浅: 30cm', '123.00', '132.00', 'lucky12345', '10.00', '1', '1508212963');
INSERT INTO `lucky_cart` VALUES ('15', '17', '9', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '434', '颜色: 黑色,大小: 大号,尺寸: S,深浅: 30cm', '123.00', '132.00', 'lucky12345', '10.00', '1', '1508213016');
INSERT INTO `lucky_cart` VALUES ('16', '17', '10', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '434', '颜色: 黑色,大小: 大号,尺寸: S,深浅: 30cm', '123.00', '132.00', 'lucky12345', '10.00', '1', '1508218715');
INSERT INTO `lucky_cart` VALUES ('18', '17', '12', '21', '精品蛋糕', '/upload/admin/image/20171008/1507454933182024.png', '0', '', '123.00', '132.00', 'lucky12345', '10.00', '1', '1508220997');
INSERT INTO `lucky_cart` VALUES ('20', '17', '13', '21', '精品蛋糕', '/upload/admin/image/20171008/1507454933182024.png', '0', '', '123.00', '132.00', 'lucky12345', '10.00', '1', '1508221229');
INSERT INTO `lucky_cart` VALUES ('37', '17', '0', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '446', '颜色: 白色,大小: 大号,尺寸: M,深浅: 30cm', '123.23', '132.00', 'lucky12345', '10.00', '2', '1508570240');
INSERT INTO `lucky_cart` VALUES ('38', '17', '0', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '446', '颜色: 白色,大小: 大号,尺寸: M,深浅: 30cm', '123.23', '132.00', 'lucky12345', '10.00', '1', '1508570242');
INSERT INTO `lucky_cart` VALUES ('39', '17', '0', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '446', '颜色: 白色,大小: 大号,尺寸: M,深浅: 30cm', '123.23', '132.00', 'lucky12345', '10.00', '1', '1508570243');
INSERT INTO `lucky_cart` VALUES ('40', '17', '0', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '434', '颜色: 黑色,大小: 大号,尺寸: S,深浅: 30cm', '123.23', '132.00', 'lucky12345', '10.00', '9', '1508570243');
INSERT INTO `lucky_cart` VALUES ('41', '17', '16', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '446', '颜色: 白色,大小: 大号,尺寸: M,深浅: 30cm', '123.23', '132.00', 'lucky12345', '10.00', '4', '1508570245');
INSERT INTO `lucky_cart` VALUES ('42', '17', '15', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '446', '颜色: 白色,大小: 大号,尺寸: M,深浅: 30cm', '123.23', '132.00', 'lucky12345', '10.00', '4', '1508570247');
INSERT INTO `lucky_cart` VALUES ('43', '17', '15', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '447', '颜色: 白色,大小: 大号,尺寸: M,深浅: 50cm', '123.23', '132.00', 'lucky12345', '10.00', '2', '1508570229');
INSERT INTO `lucky_cart` VALUES ('44', '17', '14', '14', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '463', '颜色: 黑色,大小: 大号', '123.23', '132.00', 'lucky12345', '10.00', '2', '1508570252');
INSERT INTO `lucky_cart` VALUES ('46', '17', '14', '14', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '465', '颜色: 白色,大小: 大号', '123.23', '132.00', 'lucky12345', '10.00', '2', '1508570253');
INSERT INTO `lucky_cart` VALUES ('47', '17', '14', '14', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '463', '颜色: 黑色,大小: 大号', '123.23', '132.00', 'lucky12345', '10.00', '2', '1508570254');
INSERT INTO `lucky_cart` VALUES ('48', '17', '14', '14', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '466', '颜色: 白色,大小: 小号', '123.23', '132.00', 'lucky12345', '10.00', '1', '1508570257');
INSERT INTO `lucky_cart` VALUES ('49', '17', '14', '14', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '465', '颜色: 白色,大小: 大号', '123.23', '132.00', 'lucky12345', '10.00', '2', '1508570259');
INSERT INTO `lucky_cart` VALUES ('53', '18', '17', '2', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '0', '', '123.00', '132.00', 'lucky12345', '10.00', '4', '1514019736');
INSERT INTO `lucky_cart` VALUES ('54', '18', '18', '2', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '0', '', '123.00', '132.00', 'lucky12345', '10.00', '4', '1514019748');
INSERT INTO `lucky_cart` VALUES ('55', '18', '19', '2', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '0', '', '123.00', '132.00', 'lucky12345', '10.00', '4', '1514019761');
INSERT INTO `lucky_cart` VALUES ('58', '18', '20', '12', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '467', '颜色: 黑色', '123.23', '0.00', 'lucky12345', '10.00', '3', '1514517820');

-- ----------------------------
-- Table structure for lucky_category
-- ----------------------------
DROP TABLE IF EXISTS `lucky_category`;
CREATE TABLE `lucky_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品分类id',
  `pid` int(11) unsigned NOT NULL COMMENT '商品父id',
  `name` varchar(100) NOT NULL COMMENT '分类名称',
  `mobile_name` varchar(100) NOT NULL COMMENT '手机名称',
  `desc` varchar(255) NOT NULL COMMENT '分类描述',
  `is_show` tinyint(1) unsigned NOT NULL COMMENT '是否导航显示',
  `is_home` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否首页推荐',
  `image` varchar(255) NOT NULL COMMENT '分类图片',
  `weight` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_category
-- ----------------------------
INSERT INTO `lucky_category` VALUES ('1', '0', '点心/蛋糕', '点心蛋糕', '每一道甜品都有一个故事', '1', '1', '/upload/admin/image/20170930/1506770469769795.png', '1', '1506326961');
INSERT INTO `lucky_category` VALUES ('2', '0', '饼干/膨化', '饼干/膨化', '饼干果实', '1', '1', '/upload/admin/image/20170930/1506770447567417.png', '2', '1506326973');
INSERT INTO `lucky_category` VALUES ('3', '1', '蛋糕', '蛋糕', '', '1', '0', '', '0', '1506345249');
INSERT INTO `lucky_category` VALUES ('4', '3', '蒸蛋糕', '蒸蛋糕', '', '1', '1', '', '0', '1506350097');
INSERT INTO `lucky_category` VALUES ('5', '0', '熟食/肉类', '熟食/肉类', '你的熟食我的优惠', '1', '1', '/upload/admin/image/20170930/1506770492283966.png', '3', '1506770494');
INSERT INTO `lucky_category` VALUES ('6', '0', '素食/卤味', '素食/卤味', '', '1', '0', '/upload/admin/image/20170930/1506770517104778.png', '4', '1506770520');
INSERT INTO `lucky_category` VALUES ('7', '0', '坚果/炒货', '坚果/炒货', '', '1', '0', '/upload/admin/image/20170930/1506770561122765.png', '5', '1506770566');
INSERT INTO `lucky_category` VALUES ('8', '0', '糖果/蜜饯', '糖果/蜜饯', '', '1', '0', '/upload/admin/image/20170930/1506770640769365.png', '6', '1506770645');
INSERT INTO `lucky_category` VALUES ('9', '0', '巧克力', '巧克力', '', '1', '0', '/upload/admin/image/20170930/1506770673704688.png', '7', '1506770675');
INSERT INTO `lucky_category` VALUES ('10', '0', '海味/河鲜', '海味/河鲜', '', '1', '0', '/upload/admin/image/20170930/1506770833353721.png', '8', '1506770836');
INSERT INTO `lucky_category` VALUES ('11', '0', '花茶/果茶', '花茶/果茶', '', '1', '0', '/upload/admin/image/20170930/1506770855109765.png', '9', '1506770858');
INSERT INTO `lucky_category` VALUES ('12', '0', '品牌/礼包', '品牌/礼包', '', '1', '0', '/upload/admin/image/20170930/1506770880316799.png', '10', '1506770883');
INSERT INTO `lucky_category` VALUES ('13', '1', '点心', '点心', '', '1', '0', '', '2', '1506771061');
INSERT INTO `lucky_category` VALUES ('14', '3', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('15', '3', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('16', '3', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('17', '3', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('18', '3', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('19', '3', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('20', '3', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('21', '3', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('22', '13', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('23', '13', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('24', '13', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('25', '13', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('26', '13', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('27', '13', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('28', '13', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('29', '13', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('30', '2', '饼干', '饼干', '', '1', '0', '', '0', '1506771711');
INSERT INTO `lucky_category` VALUES ('31', '2', '薯片', '薯片', '', '1', '0', '', '0', '1506772490');
INSERT INTO `lucky_category` VALUES ('32', '2', '虾条', '虾条', '', '1', '0', '', '0', '1506772565');
INSERT INTO `lucky_category` VALUES ('33', '30', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('34', '30', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('35', '30', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('36', '30', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('37', '30', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('38', '30', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('39', '30', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('40', '30', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('41', '31', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('42', '31', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('43', '31', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('44', '31', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('45', '31', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('46', '31', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('47', '31', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('48', '31', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('49', '32', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('50', '32', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('51', '32', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('52', '32', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('53', '32', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('54', '32', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('55', '32', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('56', '32', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('57', '5', '猪肉脯', '猪肉脯', '', '1', '0', '', '0', '1506780406');
INSERT INTO `lucky_category` VALUES ('58', '5', '牛肉丝', '牛肉丝', '', '1', '0', '', '0', '1506780425');
INSERT INTO `lucky_category` VALUES ('59', '5', '小香肠', '小香肠', '', '1', '0', '', '0', '1506780444');
INSERT INTO `lucky_category` VALUES ('60', '57', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('61', '57', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('62', '57', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('63', '57', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('64', '57', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('65', '57', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('66', '57', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('67', '57', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('68', '58', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('69', '58', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('70', '58', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('71', '58', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('72', '58', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('73', '58', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('74', '58', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('75', '58', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('76', '59', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('77', '59', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('78', '59', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('79', '59', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('80', '59', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('81', '59', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('82', '59', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('83', '59', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('84', '6', '豆干', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('85', '6', '干笋', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('86', '6', '鸭脖', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('87', '84', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('88', '84', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('89', '84', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('90', '84', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('91', '84', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('92', '84', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('93', '84', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('94', '84', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('95', '85', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('96', '85', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('97', '85', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('98', '85', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('99', '85', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('100', '85', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('101', '85', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('102', '85', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('103', '86', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('104', '86', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('105', '86', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('106', '86', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('107', '86', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('108', '86', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('109', '86', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('110', '86', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('111', '7', '坚果', '坚果', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('112', '7', '锅巴', '锅巴', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('113', '8', '糖果', '糖果', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('114', '8', '蜜饯', '蜜饯', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('115', '9', '巧克力', '巧克力', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('116', '9', '果冻', '果冻', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('117', '10', '海带丝', '海带丝', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('118', '10', '小鱼干', '小鱼干', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('119', '11', '小鱼干', '小鱼干', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('120', '12', '小鱼干', '小鱼干', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('121', '111', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('122', '111', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('123', '111', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('124', '111', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('125', '111', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('126', '111', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('127', '111', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('128', '111', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('129', '112', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('130', '112', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('131', '112', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('132', '112', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('133', '112', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('134', '112', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('135', '112', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('136', '112', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('137', '113', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('138', '113', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('139', '113', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('140', '113', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('141', '113', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('142', '113', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('143', '113', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('144', '113', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('145', '114', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('146', '114', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('147', '114', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('148', '114', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('149', '114', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('150', '114', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('151', '114', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('152', '114', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('153', '115', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('154', '115', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('155', '115', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('156', '115', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('157', '115', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('158', '115', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('159', '115', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('160', '115', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('161', '116', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('162', '116', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('163', '116', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('164', '116', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('165', '116', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('166', '116', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('167', '116', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('168', '116', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('169', '117', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('170', '117', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('171', '117', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('172', '117', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('173', '117', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('174', '117', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('175', '117', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('176', '117', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('177', '118', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('178', '118', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('179', '118', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('180', '118', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('181', '118', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('182', '118', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('183', '118', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('184', '118', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('185', '119', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('186', '119', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('187', '119', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('188', '119', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('189', '119', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('190', '119', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('191', '119', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('192', '119', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');
INSERT INTO `lucky_category` VALUES ('193', '120', '脱水蛋糕', '脱水蛋糕', '', '1', '0', '', '0', '1506771116');
INSERT INTO `lucky_category` VALUES ('194', '120', '瑞士卷', '瑞士卷', '', '1', '0', '', '0', '1506771172');
INSERT INTO `lucky_category` VALUES ('195', '120', '软面包', '软面包', '', '1', '0', '', '0', '1506771200');
INSERT INTO `lucky_category` VALUES ('196', '120', '马卡龙', '马卡龙', '', '1', '0', '', '0', '1506771261');
INSERT INTO `lucky_category` VALUES ('197', '120', '千层饼', '千层饼', '', '1', '0', '', '0', '1506771289');
INSERT INTO `lucky_category` VALUES ('198', '120', '甜甜圈', '甜甜圈', '', '1', '0', '', '0', '1506771315');
INSERT INTO `lucky_category` VALUES ('199', '120', '蒸三明治', '蒸三明治', '', '1', '0', '', '0', '1506771352');
INSERT INTO `lucky_category` VALUES ('200', '120', '铜锣烧', '铜锣烧', '', '1', '0', '', '0', '1506771381');

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

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
INSERT INTO `lucky_config` VALUES ('24', '6', 'ytf_partner', '738513346376621', '云通付支付PID', '该PID从云通付支付平台获取，适用于个人支付');
INSERT INTO `lucky_config` VALUES ('25', '6', 'ytf_user_seller', '385469', '商户号', '该商户号从云通付支付平台获取，适用于个人支付');
INSERT INTO `lucky_config` VALUES ('26', '6', 'ytf_key', 'JHeP76Kzd8aMQv8GZxZ3Gi8NgI2gfgAW', 'KEY码', '云通付KEY码');
INSERT INTO `lucky_config` VALUES ('27', '3', 'not_login', '36', '未登录跳转的默认页面', '未登录跳转的默认页面');
INSERT INTO `lucky_config` VALUES ('28', '3', 'default', '44', '网站首页', '网站默认页面');
INSERT INTO `lucky_config` VALUES ('29', '3', 'initial_role', '3', '用户初始角色', '注册用户初始角色');
INSERT INTO `lucky_config` VALUES ('30', '3', 'admin_role', '1', '超级管理员角色', '拥有最高权限的角色');
INSERT INTO `lucky_config` VALUES ('31', '3', 'admin_index', '34', '管理员首页', '每个管理员权限中必须拥有的功能');
INSERT INTO `lucky_config` VALUES ('32', '3', 'register_page', '37', '注册页面', '用户注册账号页面');

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
-- Table structure for lucky_coupon
-- ----------------------------
DROP TABLE IF EXISTS `lucky_coupon`;
CREATE TABLE `lucky_coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '优惠券id',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '优惠券标题',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `style` tinyint(2) NOT NULL DEFAULT '0' COMMENT '类型',
  `rule` text NOT NULL COMMENT '优惠券规则',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '优惠券状态，默认1正常状态',
  `active_start_time` int(11) NOT NULL DEFAULT '0' COMMENT '有效起始时间',
  `active_end_time` int(11) NOT NULL DEFAULT '0' COMMENT '有效结束时间',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of lucky_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for lucky_favorite
-- ----------------------------
DROP TABLE IF EXISTS `lucky_favorite`;
CREATE TABLE `lucky_favorite` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户收藏夹',
  `uid` int(11) unsigned NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goods_name` varchar(120) NOT NULL,
  `original_img` varchar(255) NOT NULL COMMENT '展示图片',
  `shop_price` decimal(10,2) NOT NULL COMMENT '出售价格',
  `market_price` decimal(10,2) NOT NULL COMMENT '市场价格',
  `last_time` int(11) NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid_goods_id` (`uid`,`goods_id`) USING BTREE,
  KEY `uid` (`uid`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_favorite
-- ----------------------------
INSERT INTO `lucky_favorite` VALUES ('1', '17', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '123.00', '132.00', '1508487542');
INSERT INTO `lucky_favorite` VALUES ('2', '17', '21', '精品蛋糕', '/upload/admin/image/20171008/1507454933182024.png', '123.00', '132.00', '1508487549');
INSERT INTO `lucky_favorite` VALUES ('3', '17', '18', '精品蛋糕', '/upload/admin/image/20171008/1507454702820616.png', '123.00', '132.00', '1508487555');
INSERT INTO `lucky_favorite` VALUES ('4', '17', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '123.00', '132.00', '1508487566');
INSERT INTO `lucky_favorite` VALUES ('5', '17', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '123.00', '132.00', '1508487570');
INSERT INTO `lucky_favorite` VALUES ('6', '17', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '123.00', '132.00', '1508488901');
INSERT INTO `lucky_favorite` VALUES ('7', '17', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '123.00', '132.00', '1508488929');
INSERT INTO `lucky_favorite` VALUES ('8', '17', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '123.00', '132.00', '1508488929');
INSERT INTO `lucky_favorite` VALUES ('9', '17', '14', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '123.00', '132.00', '1508555140');
INSERT INTO `lucky_favorite` VALUES ('10', '18', '13', '精品蛋糕', '/upload/admin/image/20171008/1507452031116697.png', '123.00', '132.00', '1514517759');

-- ----------------------------
-- Table structure for lucky_files
-- ----------------------------
DROP TABLE IF EXISTS `lucky_files`;
CREATE TABLE `lucky_files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件序号',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_md5` char(32) NOT NULL DEFAULT '' COMMENT '文件MD5 散列',
  `file_sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件sha1散列',
  `file_name` varchar(50) NOT NULL DEFAULT '' COMMENT '文件名',
  `size` int(11) NOT NULL DEFAULT '0' COMMENT '文件字节大小',
  `file_type` varchar(255) NOT NULL DEFAULT '' COMMENT '文件类型',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '文件服务器路径',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `size` (`size`),
  KEY `link` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_files
-- ----------------------------

-- ----------------------------
-- Table structure for lucky_goods
-- ----------------------------
DROP TABLE IF EXISTS `lucky_goods`;
CREATE TABLE `lucky_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `top_cat_id` int(11) NOT NULL COMMENT '顶级分类id',
  `pcat_id` int(11) NOT NULL COMMENT '二级分类id',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `extend_cat_id` int(11) DEFAULT '0' COMMENT '扩展分类id',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品编号',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `store_count` smallint(5) unsigned NOT NULL DEFAULT '10' COMMENT '库存数量',
  `comment_count` smallint(5) DEFAULT '0' COMMENT '商品评论数',
  `weight` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品重量克为单位',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '本店价',
  `cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品成本价',
  `price_ladder` text COMMENT '价格阶梯',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键词',
  `goods_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简单描述',
  `goods_content` longtext COMMENT '商品详细描述',
  `original_img` varchar(255) NOT NULL DEFAULT '' COMMENT '商品上传原始图',
  `goods_img` text NOT NULL COMMENT '商品相册',
  `is_real` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为实物',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否上架',
  `is_free_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否包邮0否1是',
  `on_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品上架时间',
  `sort` smallint(4) unsigned NOT NULL DEFAULT '50' COMMENT '商品排序',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否新品',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否热卖',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `goods_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品所属类型id，取值表goods_type的cat_id',
  `spec_type` smallint(5) DEFAULT '0' COMMENT '商品规格类型，取值表goods_type的cat_id',
  `give_integral` mediumint(8) DEFAULT '0' COMMENT '购买商品赠送积分',
  `exchange_integral` int(10) NOT NULL DEFAULT '0' COMMENT '积分兑换：0不参与积分兑换，积分和现金的兑换比例见后台配置',
  `suppliers_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '供货商ID',
  `sales_sum` int(11) DEFAULT '0' COMMENT '商品销量',
  `prom_type` tinyint(1) DEFAULT '0' COMMENT '0 普通订单,1 限时抢购, 2 团购 , 3 促销优惠,4预售',
  `prom_id` int(11) DEFAULT '0' COMMENT '优惠活动id',
  `commission` decimal(10,2) DEFAULT '0.00' COMMENT '佣金用于分销分成',
  `spu` varchar(128) DEFAULT '' COMMENT 'SPU',
  `sku` varchar(128) DEFAULT '' COMMENT 'SKU',
  `shipping_area_ids` int(11) NOT NULL DEFAULT '0' COMMENT '配送物流shipping_area_id,以逗号分隔',
  PRIMARY KEY (`goods_id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`cat_id`),
  KEY `last_update` (`last_update`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_number` (`store_count`),
  KEY `goods_weight` (`weight`),
  KEY `sort_order` (`sort`),
  KEY `top_cat_id` (`top_cat_id`),
  KEY `pcat_id` (`pcat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_goods
-- ----------------------------
INSERT INTO `lucky_goods` VALUES ('1', '1', '3', '4', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '100.00', null, '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507452031116697.png', '/upload/admin/image/20171010/1507606073802973.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507607295595344.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507620668', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('2', '1', '3', '4', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '100.00', null, '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507452031116697.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '0', '0', '0', '20', '30', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('3', '1', '3', '4', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '100.00', null, '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507452031116697.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '0', '0', '0', '20', '30', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('4', '1', '3', '4', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '100.00', null, '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507452031116697.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '0', '0', '0', '20', '30', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('5', '1', '3', '4', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '100.00', null, '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507452031116697.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '0', '0', '0', '20', '30', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('6', '1', '3', '4', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '100.00', null, '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507452031116697.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '0', '0', '0', '20', '30', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('7', '1', '3', '4', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '100.00', null, '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507452031116697.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '0', '0', '0', '20', '30', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('8', '1', '3', '4', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '100.00', null, '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507452031116697.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '0', '0', '0', '20', '30', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('9', '1', '3', '4', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '100.00', null, '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507452031116697.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '0', '0', '0', '20', '30', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('10', '1', '3', '4', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '100.00', null, '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507452031116697.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '0', '0', '0', '20', '30', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('11', '1', '3', '4', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '100.00', null, '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507452031116697.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '0', '0', '0', '20', '30', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('12', '1', '3', '4', '0', 'lucky12345', '精品蛋糕', '0', '1', '40', '0', '20', '132.00', '123.00', '100.00', null, '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507452031116697.png', '/upload/admin/image/20171010/1507606073802973.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507607295595344.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507883744', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('13', '1', '3', '4', '0', 'lucky12345', '精品蛋糕', '0', '1', '822', '0', '20', '132.00', '123.00', '100.00', null, '关键字', '草莓蛋糕 ', '<p><img src=\"/static/amz/images/tw1.jpg\"/><img src=\"/static/amz/images/tw2.jpg\"/><img src=\"/static/amz/images/tw4.jpg\"/> \r\n &nbsp;<img src=\"/static/amz/images/tw7.jpg\"/></p>', '/upload/admin/image/20171008/1507452031116697.png', '/upload/admin/image/20171010/1507606073802973.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507607295595344.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507883659', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('14', '1', '3', '4', '0', 'lucky12345', '精品蛋糕', '0', '1', '60', '0', '20', '132.00', '123.00', '100.00', null, '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507452031116697.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507883726', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('15', '2', '30', '33', '0', 'lucky12345', '精品蛋糕', '0', '1', '40', '0', '20', '132.00', '123.00', '120.00', null, '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507454702820616.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507883169', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('16', '2', '30', '33', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '120.00', '', '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507454702820616.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507454704', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('17', '2', '30', '33', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '120.00', '', '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507454702820616.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507454704', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('18', '2', '30', '33', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '120.00', '', '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507454702820616.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507454704', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('19', '5', '57', '60', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '120.00', '', '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507454933182024.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507454934', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('20', '5', '57', '60', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '120.00', '', '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507454933182024.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507454934', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('21', '5', '57', '60', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '120.00', '', '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507454933182024.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507454934', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('22', '5', '57', '60', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '120.00', '', '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507454933182024.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507454934', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('23', '5', '57', '60', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '120.00', '', '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507454933182024.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507454934', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('24', '5', '57', '60', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '120.00', '', '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507454933182024.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507454934', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('25', '2', '30', '33', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '120.00', '', '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507454702820616.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507454704', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('26', '2', '30', '33', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '120.00', '', '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507454702820616.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507454704', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('27', '2', '30', '33', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '120.00', '', '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507454702820616.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507454704', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('28', '2', '30', '33', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '120.00', '', '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507454702820616.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507454704', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');
INSERT INTO `lucky_goods` VALUES ('29', '2', '30', '33', '0', 'lucky12345', '精品蛋糕', '0', '1', '20', '0', '20', '132.00', '123.00', '120.00', '', '关键字', '草莓蛋糕', '<p>描述详情</p>', '/upload/admin/image/20171008/1507454702820616.png', '/upload/admin/image/20171010/1507607295595344.jpg,/upload/admin/image/20171010/1507607295875997.jpg,/upload/admin/image/20171010/1507606073802973.jpg', '1', '1', '0', '0', '50', '0', '0', '0', '1507454704', '0', '0', '20', '20', '0', '0', '0', '0', '0.00', '', '', '1');

-- ----------------------------
-- Table structure for lucky_logistics
-- ----------------------------
DROP TABLE IF EXISTS `lucky_logistics`;
CREATE TABLE `lucky_logistics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '配送方式模板id',
  `name` varchar(255) NOT NULL COMMENT '模板名',
  `is_free_shipping` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否包邮0不1',
  `price` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '计价方式1件，2重量，3，体积',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_logistics
-- ----------------------------
INSERT INTO `lucky_logistics` VALUES ('1', '普通运费', '0', '10.00');
INSERT INTO `lucky_logistics` VALUES ('2', '普通运费模板', '0', '20.00');
INSERT INTO `lucky_logistics` VALUES ('3', '测试模板', '0', '0.00');

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
-- Table structure for lucky_nav
-- ----------------------------
DROP TABLE IF EXISTS `lucky_nav`;
CREATE TABLE `lucky_nav` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '导航',
  `position` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '导航位置id',
  `name` varchar(50) NOT NULL COMMENT '导航名称',
  `url` varchar(255) NOT NULL COMMENT '导航链接',
  `img_url` varchar(255) DEFAULT '' COMMENT '导航图片',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示',
  `weight` int(6) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `addtime` int(11) NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_nav
-- ----------------------------
INSERT INTO `lucky_nav` VALUES ('1', '1', '首页', 'http://www.cjphp.com', '', '1', '30', '1507431450');
INSERT INTO `lucky_nav` VALUES ('2', '1', '闪购', 'http://www.cjphp.com', '', '1', '20', '1507360413');
INSERT INTO `lucky_nav` VALUES ('3', '1', '限时抢购', 'http://www.cjphp.com', '', '1', '19', '1507362766');
INSERT INTO `lucky_nav` VALUES ('4', '1', '团购', 'http://www.cjphp.com', '', '1', '18', '1507362773');
INSERT INTO `lucky_nav` VALUES ('5', '1', '大包装', 'http://www.cjphp.com', '', '1', '17', '1507362780');
INSERT INTO `lucky_nav` VALUES ('6', '2', '商品分类', 'http://www.cjphp.com', '/upload/admin/image/20171008/1507428887220322.jpg', '1', '20', '1507428895');
INSERT INTO `lucky_nav` VALUES ('7', '2', '大聚惠', 'http://www.cjphp.com', '/upload/admin/image/20171008/1507428955360176.jpg', '1', '4', '1507429004');
INSERT INTO `lucky_nav` VALUES ('8', '2', '个人中心', 'http://www.cjphp.com', '/upload/admin/image/20171008/1507428983123152.jpg', '1', '3', '1507428998');
INSERT INTO `lucky_nav` VALUES ('9', '2', '投资理财', 'http://www.cjphp.com', '/upload/admin/image/20171008/1507429057272993.jpg', '1', '1', '1507429066');
INSERT INTO `lucky_nav` VALUES ('10', '3', '首页', 'http://www.cjphp.com', '', '1', '10', '1508230241');
INSERT INTO `lucky_nav` VALUES ('11', '3', '分类', '', '', '1', '9', '1508230292');
INSERT INTO `lucky_nav` VALUES ('12', '3', '购物车', 'http://www.cjphp.com/index/goods/shop_cart.html', '', '1', '5', '1508230427');
INSERT INTO `lucky_nav` VALUES ('13', '3', '我的', 'http://www.cjphp.com', '', '1', '1', '1508230510');

-- ----------------------------
-- Table structure for lucky_nav_position
-- ----------------------------
DROP TABLE IF EXISTS `lucky_nav_position`;
CREATE TABLE `lucky_nav_position` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '导航位置',
  `mark` varchar(50) NOT NULL COMMENT '导航标识',
  `position` varchar(50) NOT NULL COMMENT '位置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_nav_position
-- ----------------------------
INSERT INTO `lucky_nav_position` VALUES ('1', 'pc_nav', '电脑端首页导航');
INSERT INTO `lucky_nav_position` VALUES ('2', 'm_nav', '手机端首页导航');
INSERT INTO `lucky_nav_position` VALUES ('3', 'foot_nav', '手机底部导航');

-- ----------------------------
-- Table structure for lucky_orders
-- ----------------------------
DROP TABLE IF EXISTS `lucky_orders`;
CREATE TABLE `lucky_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单表',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `serial` char(20) NOT NULL DEFAULT '' COMMENT '订单序列号',
  `pay_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `market_price` decimal(10,2) unsigned NOT NULL COMMENT '市场价格 可算出优惠价格',
  `freight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `discount` mediumint(9) unsigned NOT NULL DEFAULT '0' COMMENT '优惠方式',
  `consignee` varchar(2555) NOT NULL DEFAULT '' COMMENT '收货人信息json',
  `integral` int(10) unsigned NOT NULL COMMENT '订单获得积分',
  `payment` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付方式',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态 0：未支付，1：已支付',
  `delivery_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发货流通状态0：未发货，1：已发货（待收货）,2：确认收货',
  `refund_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '退款状态 0：未退款 ，1：申请退款，2：退款成功，3：退款失败',
  `logistics` varchar(50) NOT NULL COMMENT '物流公司',
  `waybillnum` char(30) NOT NULL COMMENT '运单号',
  `remark` varchar(255) NOT NULL COMMENT '用户订单备注',
  `give_up` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该订单是否为弃单0否1是',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `place_time` int(11) NOT NULL DEFAULT '0' COMMENT '下单时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '订单更新时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '订单创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_orders
-- ----------------------------
INSERT INTO `lucky_orders` VALUES ('1', '17', 'p20872453369', '123.00', '132.00', '0.00', '0', '', '0', '1', '0', '0', '0', '', '', '', '0', '0', '1508208724', '0', '0');
INSERT INTO `lucky_orders` VALUES ('2', '17', 'p20875742669', '123.00', '132.00', '0.00', '0', '', '0', '1', '0', '0', '0', '', '', '', '0', '0', '1508208757', '0', '0');
INSERT INTO `lucky_orders` VALUES ('3', '17', 'p20907328997', '123.00', '132.00', '0.00', '0', '{\"id\":22,\"uid\":17,\"full_name\":\"\\u6f58\\u8c0b\\u52c7\",\"mobile\":\"15879221657\",\"province\":1237,\"province_area\":\"\\u5c71\\u897f\\u7701\",\"city\":1238,\"city_area\":\"\\u592a\\u539f\\u5e02\",\"county\":1242,\"county_area\":\"\\u674f\\u82b1\\u5cad\\u533a\",\"address\":\"\\u8be6\\u7ec6\\u5730\\u5740\",\"is_default\":1,\"addtime\":1507863126}', '0', '1', '0', '0', '0', '', '', '', '0', '0', '1508209073', '0', '0');
INSERT INTO `lucky_orders` VALUES ('4', '17', 'p21269914972', '133.00', '142.00', '0.00', '0', '{\"id\":22,\"uid\":17,\"full_name\":\"\\u6f58\\u8c0b\\u52c7\",\"mobile\":\"15879221657\",\"province\":1237,\"province_area\":\"\\u5c71\\u897f\\u7701\",\"city\":1238,\"city_area\":\"\\u592a\\u539f\\u5e02\",\"county\":1242,\"county_area\":\"\\u674f\\u82b1\\u5cad\\u533a\",\"address\":\"\\u8be6\\u7ec6\\u5730\\u5740\",\"is_default\":1,\"addtime\":1507863126}', '0', '1', '0', '0', '0', '', '', '', '0', '0', '1508212699', '0', '0');
INSERT INTO `lucky_orders` VALUES ('5', '17', 'p21290639011', '133.00', '142.00', '0.00', '0', '{\"id\":22,\"uid\":17,\"full_name\":\"\\u6f58\\u8c0b\\u52c7\",\"mobile\":\"15879221657\",\"province\":1237,\"province_area\":\"\\u5c71\\u897f\\u7701\",\"city\":1238,\"city_area\":\"\\u592a\\u539f\\u5e02\",\"county\":1242,\"county_area\":\"\\u674f\\u82b1\\u5cad\\u533a\",\"address\":\"\\u8be6\\u7ec6\\u5730\\u5740\",\"is_default\":1,\"addtime\":1507863126}', '0', '1', '0', '0', '0', '', '', '', '0', '0', '1508212906', '0', '0');
INSERT INTO `lucky_orders` VALUES ('6', '17', 'p21292450510', '133.00', '142.00', '0.00', '0', '{\"id\":22,\"uid\":17,\"full_name\":\"\\u6f58\\u8c0b\\u52c7\",\"mobile\":\"15879221657\",\"province\":1237,\"province_area\":\"\\u5c71\\u897f\\u7701\",\"city\":1238,\"city_area\":\"\\u592a\\u539f\\u5e02\",\"county\":1242,\"county_area\":\"\\u674f\\u82b1\\u5cad\\u533a\",\"address\":\"\\u8be6\\u7ec6\\u5730\\u5740\",\"is_default\":1,\"addtime\":1507863126}', '0', '1', '0', '0', '0', '', '', '', '0', '0', '1508212924', '0', '0');
INSERT INTO `lucky_orders` VALUES ('7', '17', 'p21294723166', '133.00', '142.00', '0.00', '0', '{\"id\":22,\"uid\":17,\"full_name\":\"\\u6f58\\u8c0b\\u52c7\",\"mobile\":\"15879221657\",\"province\":1237,\"province_area\":\"\\u5c71\\u897f\\u7701\",\"city\":1238,\"city_area\":\"\\u592a\\u539f\\u5e02\",\"county\":1242,\"county_area\":\"\\u674f\\u82b1\\u5cad\\u533a\",\"address\":\"\\u8be6\\u7ec6\\u5730\\u5740\",\"is_default\":1,\"addtime\":1507863126}', '0', '1', '0', '0', '0', '', '', '', '0', '0', '1508212947', '0', '0');
INSERT INTO `lucky_orders` VALUES ('8', '17', 'p21296388699', '133.00', '142.00', '0.00', '0', '{\"id\":22,\"uid\":17,\"full_name\":\"\\u6f58\\u8c0b\\u52c7\",\"mobile\":\"15879221657\",\"province\":1237,\"province_area\":\"\\u5c71\\u897f\\u7701\",\"city\":1238,\"city_area\":\"\\u592a\\u539f\\u5e02\",\"county\":1242,\"county_area\":\"\\u674f\\u82b1\\u5cad\\u533a\",\"address\":\"\\u8be6\\u7ec6\\u5730\\u5740\",\"is_default\":1,\"addtime\":1507863126}', '0', '1', '0', '0', '0', '', '', '', '0', '0', '1508212963', '0', '0');
INSERT INTO `lucky_orders` VALUES ('9', '17', 'p21301665434', '133.00', '142.00', '0.00', '0', '{\"id\":22,\"uid\":17,\"full_name\":\"\\u6f58\\u8c0b\\u52c7\",\"mobile\":\"15879221657\",\"province\":1237,\"province_area\":\"\\u5c71\\u897f\\u7701\",\"city\":1238,\"city_area\":\"\\u592a\\u539f\\u5e02\",\"county\":1242,\"county_area\":\"\\u674f\\u82b1\\u5cad\\u533a\",\"address\":\"\\u8be6\\u7ec6\\u5730\\u5740\",\"is_default\":1,\"addtime\":1507863126}', '0', '1', '0', '0', '0', '', '', '', '0', '0', '1508213016', '0', '0');
INSERT INTO `lucky_orders` VALUES ('10', '17', 'p21871565878', '133.00', '142.00', '0.00', '0', '{\"id\":22,\"uid\":17,\"full_name\":\"\\u6f58\\u8c0b\\u52c7\",\"mobile\":\"15879221657\",\"province\":1237,\"province_area\":\"\\u5c71\\u897f\\u7701\",\"city\":1238,\"city_area\":\"\\u592a\\u539f\\u5e02\",\"county\":1242,\"county_area\":\"\\u674f\\u82b1\\u5cad\\u533a\",\"address\":\"\\u8be6\\u7ec6\\u5730\\u5740\",\"is_default\":1,\"addtime\":1507863126}', '0', '1', '0', '0', '0', '', '', '', '0', '0', '1508218715', '0', '0');
INSERT INTO `lucky_orders` VALUES ('11', '17', 'p22088021074', '133.00', '142.00', '0.00', '0', '{\"id\":22,\"uid\":17,\"full_name\":\"\\u6f58\\u8c0b\\u52c7\",\"mobile\":\"15879221657\",\"province\":1237,\"province_area\":\"\\u5c71\\u897f\\u7701\",\"city\":1238,\"city_area\":\"\\u592a\\u539f\\u5e02\",\"county\":1242,\"county_area\":\"\\u674f\\u82b1\\u5cad\\u533a\",\"address\":\"\\u8be6\\u7ec6\\u5730\\u5740\",\"is_default\":1,\"addtime\":1507863126}', '0', '1', '0', '0', '0', '', '', '', '0', '0', '1508220880', '0', '0');
INSERT INTO `lucky_orders` VALUES ('12', '17', 'p22099759664', '133.00', '142.00', '0.00', '0', '{\"id\":22,\"uid\":17,\"full_name\":\"\\u6f58\\u8c0b\\u52c7\",\"mobile\":\"15879221657\",\"province\":1237,\"province_area\":\"\\u5c71\\u897f\\u7701\",\"city\":1238,\"city_area\":\"\\u592a\\u539f\\u5e02\",\"county\":1242,\"county_area\":\"\\u674f\\u82b1\\u5cad\\u533a\",\"address\":\"\\u8be6\\u7ec6\\u5730\\u5740\",\"is_default\":1,\"addtime\":1507863126}', '0', '1', '0', '0', '0', '', '', '', '0', '0', '1508220997', '0', '0');
INSERT INTO `lucky_orders` VALUES ('13', '17', 'p22122914399', '133.00', '142.00', '0.00', '0', '{\"id\":22,\"uid\":17,\"full_name\":\"\\u6f58\\u8c0b\\u52c7\",\"mobile\":\"15879221657\",\"province\":1237,\"province_area\":\"\\u5c71\\u897f\\u7701\",\"city\":1238,\"city_area\":\"\\u592a\\u539f\\u5e02\",\"county\":1242,\"county_area\":\"\\u674f\\u82b1\\u5cad\\u533a\",\"address\":\"\\u8be6\\u7ec6\\u5730\\u5740\",\"is_default\":1,\"addtime\":1507863126}', '0', '1', '0', '0', '0', '', '', '留言你要看哦', '0', '0', '1508221229', '0', '0');
INSERT INTO `lucky_orders` VALUES ('14', '17', 'p57516429278', '1119.07', '1198.00', '0.00', '0', '{\"id\":23,\"uid\":17,\"full_name\":\"\\u6f58\\u8c0b\\u52c7\",\"mobile\":\"15879221657\",\"province\":1501,\"province_area\":\"\\u8fbd\\u5b81\\u7701\",\"city\":1529,\"city_area\":\"\\u978d\\u5c71\\u5e02\",\"county\":1533,\"county_area\":\"\\u7acb\\u5c71\\u533a\",\"address\":\"\\u5730\\u5740\",\"is_default\":1,\"addtime\":1507861938}', '0', '1', '0', '0', '0', '', '', '', '0', '0', '1508575164', '0', '0');
INSERT INTO `lucky_orders` VALUES ('15', '17', 'p73680315933', '739.38', '792.00', '10.00', '0', '{\"id\":23,\"uid\":17,\"full_name\":\"\\u6f58\\u8c0b\\u52c7\",\"mobile\":\"15879221657\",\"province\":1501,\"province_area\":\"\\u8fbd\\u5b81\\u7701\",\"city\":1529,\"city_area\":\"\\u978d\\u5c71\\u5e02\",\"county\":1533,\"county_area\":\"\\u7acb\\u5c71\\u533a\",\"address\":\"\\u5730\\u5740\",\"is_default\":1,\"addtime\":1507861938}', '0', '1', '0', '0', '0', '', '', '', '0', '0', '1508736803', '0', '0');
INSERT INTO `lucky_orders` VALUES ('16', '17', 'p73860566046', '492.92', '528.00', '10.00', '0', '{\"id\":23,\"uid\":17,\"full_name\":\"\\u6f58\\u8c0b\\u52c7\",\"mobile\":\"15879221657\",\"province\":1501,\"province_area\":\"\\u8fbd\\u5b81\\u7701\",\"city\":1529,\"city_area\":\"\\u978d\\u5c71\\u5e02\",\"county\":1533,\"county_area\":\"\\u7acb\\u5c71\\u533a\",\"address\":\"\\u5730\\u5740\",\"is_default\":1,\"addtime\":1507861938}', '0', '1', '0', '0', '0', '', '', '', '0', '0', '1508738605', '0', '0');
INSERT INTO `lucky_orders` VALUES ('17', '18', 'p01973684516', '492.00', '528.00', '10.00', '0', '{\"id\":28,\"uid\":18,\"full_name\":\"\\u6f58\\u8c0b\\u52c7\",\"mobile\":\"15879221657\",\"province\":1000,\"province_area\":\"\\u5317\\u4eac\\u5e02\",\"city\":1018,\"city_area\":\"\\u5e02\\u8f96\\u53bf\",\"county\":1020,\"county_area\":\"\\u5ef6\\u5e86\\u53bf\",\"address\":\"\\u8be6\\u7ec6\\u5730\\u5740\",\"is_default\":1,\"addtime\":1514019704}', '0', '0', '0', '0', '0', '', '', '', '0', '0', '1514019736', '0', '0');
INSERT INTO `lucky_orders` VALUES ('18', '18', 'p01974860809', '492.00', '528.00', '10.00', '0', '{\"id\":28,\"uid\":18,\"full_name\":\"\\u6f58\\u8c0b\\u52c7\",\"mobile\":\"15879221657\",\"province\":1000,\"province_area\":\"\\u5317\\u4eac\\u5e02\",\"city\":1018,\"city_area\":\"\\u5e02\\u8f96\\u53bf\",\"county\":1020,\"county_area\":\"\\u5ef6\\u5e86\\u53bf\",\"address\":\"\\u8be6\\u7ec6\\u5730\\u5740\",\"is_default\":1,\"addtime\":1514019704}', '0', '0', '0', '0', '0', '', '', '', '0', '0', '1514019748', '0', '0');
INSERT INTO `lucky_orders` VALUES ('19', '18', 'p01976198479', '492.00', '528.00', '10.00', '0', '{\"id\":28,\"uid\":18,\"full_name\":\"\\u6f58\\u8c0b\\u52c7\",\"mobile\":\"15879221657\",\"province\":1000,\"province_area\":\"\\u5317\\u4eac\\u5e02\",\"city\":1018,\"city_area\":\"\\u5e02\\u8f96\\u53bf\",\"county\":1020,\"county_area\":\"\\u5ef6\\u5e86\\u53bf\",\"address\":\"\\u8be6\\u7ec6\\u5730\\u5740\",\"is_default\":1,\"addtime\":1514019704}', '0', '0', '0', '0', '0', '', '', '', '0', '0', '1514019761', '0', '0');
INSERT INTO `lucky_orders` VALUES ('20', '18', 'p51782060348', '369.69', '0.00', '10.00', '0', '{\"id\":28,\"uid\":18,\"full_name\":\"\\u6f58\\u8c0b\\u52c7\",\"mobile\":\"15879221657\",\"province\":1000,\"province_area\":\"\\u5317\\u4eac\\u5e02\",\"city\":1018,\"city_area\":\"\\u5e02\\u8f96\\u53bf\",\"county\":1020,\"county_area\":\"\\u5ef6\\u5e86\\u53bf\",\"address\":\"\\u8be6\\u7ec6\\u5730\\u5740\",\"is_default\":1,\"addtime\":1514019704}', '0', '0', '0', '0', '0', '', '', '', '0', '0', '1514517820', '0', '0');

-- ----------------------------
-- Table structure for lucky_order_log
-- ----------------------------
DROP TABLE IF EXISTS `lucky_order_log`;
CREATE TABLE `lucky_order_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单操作日志',
  `uid` int(11) unsigned NOT NULL COMMENT '操作用户',
  `uname` varchar(50) NOT NULL COMMENT '订单操作用户名',
  `utype` tinyint(2) unsigned NOT NULL COMMENT '用户类型',
  `order_id` int(11) unsigned NOT NULL COMMENT '订单id',
  `explain` varchar(300) NOT NULL COMMENT '订单操作说明',
  `remark` varchar(300) NOT NULL COMMENT '操作员备注',
  `op_time` int(11) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_order_log
-- ----------------------------

-- ----------------------------
-- Table structure for lucky_roles
-- ----------------------------
DROP TABLE IF EXISTS `lucky_roles`;
CREATE TABLE `lucky_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组id',
  `role_name` varchar(50) NOT NULL DEFAULT '' COMMENT '角色名',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `auths` text NOT NULL COMMENT '功能id',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of lucky_roles
-- ----------------------------
INSERT INTO `lucky_roles` VALUES ('1', '1', '超级管理员', '超级管理员，拥有最高权限的角色', '34,1,3,52,53,54,55,56,57,58,59,60,61,2,4,5,6,7,9,31,8,45,47,32,62,65,33,49,50,63,64,35,48,51,10,11,66,67,12,68,69,13,70,72,73,74,75,71,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30', '1520059905', '1517903510');
INSERT INTO `lucky_roles` VALUES ('2', '2', '市场人员', '管理市场部门工作', '34,1,3,52', '1519797004', '1519795555');
INSERT INTO `lucky_roles` VALUES ('3', '3', '普通会员', '平台注册用户', '44,43,36,38,41,37,39,40,42,46,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111', '1520478800', '1519888895');

-- ----------------------------
-- Table structure for lucky_role_group
-- ----------------------------
DROP TABLE IF EXISTS `lucky_role_group`;
CREATE TABLE `lucky_role_group` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色组id',
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分组名称',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of lucky_role_group
-- ----------------------------
INSERT INTO `lucky_role_group` VALUES ('1', '超级管理员', '该管理员拥有最高权限，无所不能', '1517991794', '1517888806');
INSERT INTO `lucky_role_group` VALUES ('2', '市场部', '市场人员所在组', '1517893603', '1517893603');
INSERT INTO `lucky_role_group` VALUES ('3', '客户', '该组为客户组，即为普通用户组，该组的角色可以为普通用户设置各项前端权限', '1518060838', '1518060838');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

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
INSERT INTO `lucky_sms_log` VALUES ('11', 'sms98956015372', '{\"code\":\"73675\",\"product\":\"\"}', 'SMS_73920020', '小惠猫', '15879221657', 'OK', 'OK', '{\"Message\":\"OK\",\"RequestId\":\"2910365B-DBE2-4CDF-A723-C0359934F886\",\"BizId\":\"829512717989561299^0\",\"Code\":\"OK\"}', '1517989560');
INSERT INTO `lucky_sms_log` VALUES ('12', 'sms99065211348', '{\"code\":\"11596\",\"product\":\"\"}', 'SMS_73920020', '小惠猫', '15879221657', 'OK', 'OK', '{\"Message\":\"OK\",\"RequestId\":\"1252729D-BD57-42E2-B788-96E4C709A5D6\",\"BizId\":\"791925117990653574^0\",\"Code\":\"OK\"}', '1517990652');

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
-- Table structure for lucky_spec
-- ----------------------------
DROP TABLE IF EXISTS `lucky_spec`;
CREATE TABLE `lucky_spec` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `good_id` int(11) unsigned NOT NULL COMMENT '商品id',
  `pid` int(11) unsigned NOT NULL COMMENT 'pid',
  `spec` varchar(60) NOT NULL COMMENT '规格属性名',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `good_id` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_spec
-- ----------------------------
INSERT INTO `lucky_spec` VALUES ('1', '6', '0', '颜色');
INSERT INTO `lucky_spec` VALUES ('2', '6', '1', '黑色');
INSERT INTO `lucky_spec` VALUES ('3', '6', '1', '白色');
INSERT INTO `lucky_spec` VALUES ('10', '0', '0', '颜色');
INSERT INTO `lucky_spec` VALUES ('11', '0', '10', '黑色');
INSERT INTO `lucky_spec` VALUES ('12', '0', '10', '白色');
INSERT INTO `lucky_spec` VALUES ('13', '7', '0', '颜色');
INSERT INTO `lucky_spec` VALUES ('14', '7', '13', '黑色');
INSERT INTO `lucky_spec` VALUES ('15', '7', '13', '白色');
INSERT INTO `lucky_spec` VALUES ('16', '8', '0', '颜色');
INSERT INTO `lucky_spec` VALUES ('17', '8', '16', '黑色');
INSERT INTO `lucky_spec` VALUES ('18', '8', '16', '白色');
INSERT INTO `lucky_spec` VALUES ('19', '9', '0', '颜色');
INSERT INTO `lucky_spec` VALUES ('20', '9', '19', '黑色');
INSERT INTO `lucky_spec` VALUES ('21', '9', '19', '白色');
INSERT INTO `lucky_spec` VALUES ('22', '10', '0', '颜色');
INSERT INTO `lucky_spec` VALUES ('23', '10', '22', '黑色');
INSERT INTO `lucky_spec` VALUES ('24', '10', '22', '白色');
INSERT INTO `lucky_spec` VALUES ('25', '11', '0', '颜色');
INSERT INTO `lucky_spec` VALUES ('26', '11', '25', '黑色');
INSERT INTO `lucky_spec` VALUES ('27', '11', '25', '白色');
INSERT INTO `lucky_spec` VALUES ('127', '15', '0', '颜色');
INSERT INTO `lucky_spec` VALUES ('128', '15', '127', '黑色');
INSERT INTO `lucky_spec` VALUES ('129', '15', '127', '白色');
INSERT INTO `lucky_spec` VALUES ('256', '13', '0', '颜色');
INSERT INTO `lucky_spec` VALUES ('257', '13', '256', '黑色');
INSERT INTO `lucky_spec` VALUES ('258', '13', '256', '白色');
INSERT INTO `lucky_spec` VALUES ('259', '13', '0', '大小');
INSERT INTO `lucky_spec` VALUES ('260', '13', '259', '大号');
INSERT INTO `lucky_spec` VALUES ('261', '13', '259', '小号');
INSERT INTO `lucky_spec` VALUES ('262', '13', '0', '尺寸');
INSERT INTO `lucky_spec` VALUES ('263', '13', '262', 'M');
INSERT INTO `lucky_spec` VALUES ('264', '13', '262', 'L');
INSERT INTO `lucky_spec` VALUES ('265', '13', '262', 'S');
INSERT INTO `lucky_spec` VALUES ('266', '13', '0', '深浅');
INSERT INTO `lucky_spec` VALUES ('267', '13', '266', '20cm');
INSERT INTO `lucky_spec` VALUES ('268', '13', '266', '30cm');
INSERT INTO `lucky_spec` VALUES ('269', '13', '266', '50cm');
INSERT INTO `lucky_spec` VALUES ('270', '14', '0', '颜色');
INSERT INTO `lucky_spec` VALUES ('271', '14', '270', '黑色');
INSERT INTO `lucky_spec` VALUES ('272', '14', '270', '白色');
INSERT INTO `lucky_spec` VALUES ('273', '14', '0', '大小');
INSERT INTO `lucky_spec` VALUES ('274', '14', '273', '大号');
INSERT INTO `lucky_spec` VALUES ('275', '14', '273', '小号');
INSERT INTO `lucky_spec` VALUES ('276', '12', '0', '颜色');
INSERT INTO `lucky_spec` VALUES ('277', '12', '276', '黑色');
INSERT INTO `lucky_spec` VALUES ('278', '12', '276', '白色');

-- ----------------------------
-- Table structure for lucky_spec_group
-- ----------------------------
DROP TABLE IF EXISTS `lucky_spec_group`;
CREATE TABLE `lucky_spec_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格组合表',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `specs` varchar(2556) NOT NULL COMMENT '规格组合逗号分隔',
  `specs_name` varchar(2555) NOT NULL DEFAULT '' COMMENT '组合字符串',
  `market_price` decimal(10,2) NOT NULL COMMENT '市场价',
  `shop_price` decimal(10,2) NOT NULL COMMENT '本店出售价',
  `store_count` int(5) NOT NULL COMMENT '库存数',
  `goods_sn` varchar(100) NOT NULL COMMENT '商品号',
  PRIMARY KEY (`id`),
  KEY `specs` (`specs`(255)),
  KEY `good_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=469 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_spec_group
-- ----------------------------
INSERT INTO `lucky_spec_group` VALUES ('101', '15', '128', '颜色: 黑色', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('102', '15', '129', '颜色: 白色', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('427', '13', '257,260,263,267', '颜色: 黑色,大小: 大号,尺寸: M,深浅: 20cm', '132.00', '123.23', '0', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('428', '13', '257,260,263,268', '颜色: 黑色,大小: 大号,尺寸: M,深浅: 30cm', '132.00', '123.23', '0', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('429', '13', '257,260,263,269', '颜色: 黑色,大小: 大号,尺寸: M,深浅: 50cm', '132.00', '123.23', '0', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('430', '13', '257,260,264,267', '颜色: 黑色,大小: 大号,尺寸: L,深浅: 20cm', '132.00', '123.23', '0', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('431', '13', '257,260,264,268', '颜色: 黑色,大小: 大号,尺寸: L,深浅: 30cm', '132.00', '123.23', '0', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('432', '13', '257,260,264,269', '颜色: 黑色,大小: 大号,尺寸: L,深浅: 50cm', '132.00', '123.23', '0', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('433', '13', '257,260,265,267', '颜色: 黑色,大小: 大号,尺寸: S,深浅: 20cm', '132.00', '123.23', '201', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('434', '13', '257,260,265,268', '颜色: 黑色,大小: 大号,尺寸: S,深浅: 30cm', '132.00', '123.23', '201', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('435', '13', '257,260,265,269', '颜色: 黑色,大小: 大号,尺寸: S,深浅: 50cm', '132.00', '123.23', '0', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('436', '13', '257,261,263,267', '颜色: 黑色,大小: 小号,尺寸: M,深浅: 20cm', '132.00', '123.23', '0', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('437', '13', '257,261,263,268', '颜色: 黑色,大小: 小号,尺寸: M,深浅: 30cm', '132.00', '123.23', '0', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('438', '13', '257,261,263,269', '颜色: 黑色,大小: 小号,尺寸: M,深浅: 50cm', '132.00', '123.23', '0', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('439', '13', '257,261,264,267', '颜色: 黑色,大小: 小号,尺寸: L,深浅: 20cm', '132.00', '123.23', '0', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('440', '13', '257,261,264,268', '颜色: 黑色,大小: 小号,尺寸: L,深浅: 30cm', '132.00', '123.23', '0', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('441', '13', '257,261,264,269', '颜色: 黑色,大小: 小号,尺寸: L,深浅: 50cm', '132.00', '123.23', '0', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('442', '13', '257,261,265,267', '颜色: 黑色,大小: 小号,尺寸: S,深浅: 20cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('443', '13', '257,261,265,268', '颜色: 黑色,大小: 小号,尺寸: S,深浅: 30cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('444', '13', '257,261,265,269', '颜色: 黑色,大小: 小号,尺寸: S,深浅: 50cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('445', '13', '258,260,263,267', '颜色: 白色,大小: 大号,尺寸: M,深浅: 20cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('446', '13', '258,260,263,268', '颜色: 白色,大小: 大号,尺寸: M,深浅: 30cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('447', '13', '258,260,263,269', '颜色: 白色,大小: 大号,尺寸: M,深浅: 50cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('448', '13', '258,260,264,267', '颜色: 白色,大小: 大号,尺寸: L,深浅: 20cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('449', '13', '258,260,264,268', '颜色: 白色,大小: 大号,尺寸: L,深浅: 30cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('450', '13', '258,260,264,269', '颜色: 白色,大小: 大号,尺寸: L,深浅: 50cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('451', '13', '258,260,265,267', '颜色: 白色,大小: 大号,尺寸: S,深浅: 20cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('452', '13', '258,260,265,268', '颜色: 白色,大小: 大号,尺寸: S,深浅: 30cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('453', '13', '258,260,265,269', '颜色: 白色,大小: 大号,尺寸: S,深浅: 50cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('454', '13', '258,261,263,267', '颜色: 白色,大小: 小号,尺寸: M,深浅: 20cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('455', '13', '258,261,263,268', '颜色: 白色,大小: 小号,尺寸: M,深浅: 30cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('456', '13', '258,261,263,269', '颜色: 白色,大小: 小号,尺寸: M,深浅: 50cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('457', '13', '258,261,264,267', '颜色: 白色,大小: 小号,尺寸: L,深浅: 20cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('458', '13', '258,261,264,268', '颜色: 白色,大小: 小号,尺寸: L,深浅: 30cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('459', '13', '258,261,264,269', '颜色: 白色,大小: 小号,尺寸: L,深浅: 50cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('460', '13', '258,261,265,267', '颜色: 白色,大小: 小号,尺寸: S,深浅: 20cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('461', '13', '258,261,265,268', '颜色: 白色,大小: 小号,尺寸: S,深浅: 30cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('462', '13', '258,261,265,269', '颜色: 白色,大小: 小号,尺寸: S,深浅: 50cm', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('463', '14', '271,274', '颜色: 黑色,大小: 大号', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('464', '14', '271,275', '颜色: 黑色,大小: 小号', '132.00', '123.23', '0', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('465', '14', '272,274', '颜色: 白色,大小: 大号', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('466', '14', '272,275', '颜色: 白色,大小: 小号', '132.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('467', '12', '277', '颜色: 黑色', '0.00', '123.23', '20', 'lucky12345');
INSERT INTO `lucky_spec_group` VALUES ('468', '12', '278', '颜色: 白色', '0.00', '123.23', '20', 'lucky12345');

-- ----------------------------
-- Table structure for lucky_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `lucky_userinfo`;
CREATE TABLE `lucky_userinfo` (
  `id` int(10) unsigned NOT NULL COMMENT '用户信息表，用户id',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_group_id` int(11) unsigned NOT NULL COMMENT '角色组id',
  `user_role_id` int(11) unsigned NOT NULL COMMENT '角色id',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '增加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of lucky_userinfo
-- ----------------------------
INSERT INTO `lucky_userinfo` VALUES ('20', '17', '3', '3', '0', '0');

-- ----------------------------
-- Table structure for lucky_users
-- ----------------------------
DROP TABLE IF EXISTS `lucky_users`;
CREATE TABLE `lucky_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `phone` char(20) NOT NULL DEFAULT '' COMMENT '用户电话号码',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮件地址',
  `wechat` varchar(100) NOT NULL DEFAULT '' COMMENT '微信账号',
  `passwd` char(255) NOT NULL DEFAULT '' COMMENT '密码',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `regip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `lastdate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `lastip` varchar(255) NOT NULL DEFAULT '' COMMENT '最后一次登录ip',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户是否锁定',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态软删除',
  `mail_verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '邮箱验证状态0未验证1验证',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为管理员，1为是',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建（注册）时间',
  PRIMARY KEY (`id`),
  KEY `nickname` (`nickname`),
  KEY `phone` (`phone`),
  KEY `email` (`email`),
  KEY `passwd` (`passwd`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lucky_users
-- ----------------------------
INSERT INTO `lucky_users` VALUES ('17', 'test', 'test1', '', '15879221654', '1767158841@qq.com', '', '14e1b600b1fd579f47433b88e8d85291', '0', '127.0.0.1', '1527147138', '', '0', '1', '1', '1', '1527147138', '0');
INSERT INTO `lucky_users` VALUES ('19', '', '123a', '', '', '', '', '14e1b600b1fd579f47433b88e8d85291', '0', '127.0.0.1', '0', '', '0', '1', '0', '0', '0', '0');
INSERT INTO `lucky_users` VALUES ('26', '任你花', 'test', '', '15879221657', '532170416@qq.com', '', '14e1b600b1fd579f47433b88e8d85291', '0', '127.0.0.1', '1519970144', '', '0', '0', '0', '1', '1519970363', '1518260856');
INSERT INTO `lucky_users` VALUES ('27', '测试2', 'name', '', '15879221659', '1737511215@qq.com', '', '14e1b600b1fd579f47433b88e8d85291', '0', '127.0.0.1', '0', '', '0', '0', '0', '1', '1518319839', '1518318931');

-- ----------------------------
-- Table structure for lucky_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `lucky_user_coupon`;
CREATE TABLE `lucky_user_coupon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户拥有的优惠券',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `coupon` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券id',
  `active_start_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '有效开始时间',
  `active_end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '有效结束时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `coupon` (`coupon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of lucky_user_coupon
-- ----------------------------
