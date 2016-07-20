/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : webside

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-07-13 14:33:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_login_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_login_info`;
CREATE TABLE `tb_login_info` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `u_account_name` varchar(255) DEFAULT NULL,
  `l_ip` varchar(255) DEFAULT NULL,
  `l_login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=748 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tb_log_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_log_info`;
CREATE TABLE `tb_log_info` (
  `l_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `u_id` bigint(20) NOT NULL,
  `l_account_name` varchar(100) DEFAULT NULL,
  `l_operation` varchar(255) DEFAULT NULL COMMENT '用户所做的操作',
  `l_content` varchar(1000) DEFAULT NULL COMMENT '日志内容',
  `l_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tb_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_resource`;
CREATE TABLE `tb_resource` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源id',
  `s_parent_id` int(11) DEFAULT NULL COMMENT '资源父id',
  `s_name` varchar(100) NOT NULL COMMENT '资源名称',
  `s_source_key` varchar(100) NOT NULL COMMENT '资源唯一标识',
  `s_type` int(11) NOT NULL COMMENT '资源类型,0:目录;1:菜单;2:按钮',
  `s_source_url` varchar(500) DEFAULT NULL COMMENT '资源url',
  `s_level` int(11) DEFAULT NULL COMMENT '层级',
  `s_icon` varchar(100) DEFAULT '' COMMENT '图标',
  `s_is_hide` int(11) DEFAULT '0' COMMENT '是否隐藏',
  `s_description` varchar(100) DEFAULT NULL COMMENT '描述',
  `s_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `s_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of tb_resource
-- ----------------------------
INSERT INTO `tb_resource` VALUES ('1', null, '控制台', 'desktop', '0', '/welcome.jsp', '1', 'fa fa-tachometer', '0', '控制台', '2016-01-12 17:08:55', '2016-02-25 14:07:48');
INSERT INTO `tb_resource` VALUES ('2', null, '系统基础管理', 'system', '0', '', '1', 'fa fa-list', '0', '系统基础管理', '2016-01-05 12:11:12', '2016-02-25 14:07:48');
INSERT INTO `tb_resource` VALUES ('3', '2', '用户管理', 'system:user', '0', '/user/listUI.html', '2', '', '0', '用户管理', '2016-01-08 12:37:10', '2016-06-30 20:53:36');
INSERT INTO `tb_resource` VALUES ('4', '2', '角色管理', 'system:role', '0', '/role/listUI.html', '2', '', '0', '角色管理', '2016-01-11 22:51:07', '2016-06-30 20:53:38');
INSERT INTO `tb_resource` VALUES ('5', '2', '资源管理', 'system:resource', '0', '/resource/listUI.html', '2', '', '0', '资源管理', '2016-01-11 22:51:55', '2016-06-30 20:53:40');
INSERT INTO `tb_resource` VALUES ('6', null, '系统监控管理', 'monitor', '0', '', '1', 'fa fa-pencil-square-o', '0', '系统监控管理', '2016-01-05 12:11:12', '2016-02-25 14:07:48');
INSERT INTO `tb_resource` VALUES ('7', '6', 'Sirona监控', 'monitor:sirona', '0', '/sirona', '2', '', '0', 'Sirona监控', '2016-01-05 12:11:12', '2016-06-30 20:53:41');
INSERT INTO `tb_resource` VALUES ('8', '6', 'Druid监控', 'monitor:druid', '0', '/druid', '2', '', '0', 'Druid监控', '2016-01-11 22:45:27', '2016-06-30 20:53:44');
INSERT INTO `tb_resource` VALUES ('9', null, '日志信息管理', 'logininfo', '0', '', '1', 'fa fa-tag', '0', '日志信息管理', '2016-01-11 22:46:39', '2016-02-25 14:07:48');
INSERT INTO `tb_resource` VALUES ('10', '9', '用户登录信息', 'logininfo:userLogin', '0', '/loginInfo/listUI.html', '2', '', '0', '用户登录信息', '2016-01-11 22:47:41', '2016-02-25 14:07:48');
INSERT INTO `tb_resource` VALUES ('11', '3', '添加', 'user:add', '1', '/user/add.html', '3', '', '0', '添加用户', '2016-01-22 00:18:40', '2016-06-30 20:54:42');
INSERT INTO `tb_resource` VALUES ('12', '3', '编辑', 'user:edit', '1', '/user/edit.html', '3', '', '0', '编辑用户', '2016-01-22 00:18:40', '2016-06-30 20:54:43');
INSERT INTO `tb_resource` VALUES ('13', '3', '删除', 'user:deleteBatch', '1', '/user/deleteBatch.html', null, null, '0', '删除用户', '2016-02-05 15:26:32', '2016-06-30 20:54:44');
INSERT INTO `tb_resource` VALUES ('14', '3', '重置密码', 'user:resetPassword', '1', '/user/resetPassword.html', null, null, '0', '重置密码', '2016-02-27 23:55:13', '2016-06-30 20:54:45');
INSERT INTO `tb_resource` VALUES ('15', '4', '添加', 'role:add', '1', '/role/add.html', null, null, '0', '添加', '2016-02-27 23:56:52', '2016-06-30 20:54:46');
INSERT INTO `tb_resource` VALUES ('16', '4', '编辑', 'role:edit', '1', '/role/edit.html', null, null, '0', '编辑', '2016-02-27 23:57:35', '2016-06-30 20:54:47');
INSERT INTO `tb_resource` VALUES ('17', '4', '删除', 'role:deleteBatch', '1', '/role/deleteBatch.html ', null, null, '0', '删除', '2016-02-27 23:58:02', '2016-06-30 20:54:48');
INSERT INTO `tb_resource` VALUES ('18', '4', '分配权限', 'role:permission', '1', '/role/permission.html', null, null, '0', '分配权限', '2016-02-27 23:59:20', '2016-06-30 20:54:48');
INSERT INTO `tb_resource` VALUES ('19', '5', '添加', 'resource:add', '1', '/resource/add.html', null, null, '0', '添加', '2016-02-28 00:01:15', '2016-06-30 20:54:49');
INSERT INTO `tb_resource` VALUES ('20', '5', '编辑', 'resource:edit', '1', '/resource/edit.html', null, null, '0', '编辑', '2016-02-28 00:02:01', '2016-06-30 20:54:50');
INSERT INTO `tb_resource` VALUES ('21', '5', '删除', 'resource:deleteBatch', '1', '/resource/deleteBatch.html', null, null, '0', '删除', '2016-02-28 00:03:03', '2016-06-30 20:54:51');
INSERT INTO `tb_resource` VALUES ('22', '9', '用户操作信息', 'loginfo:userOperation', '0', '/logInfo/listUI.html', null, 'fa  fa-sticky-note-o', '0', '用户操作信息', '2016-03-08 22:00:36', '2016-07-01 16:14:54');
INSERT INTO `tb_resource` VALUES ('24', null, '一级菜单', 'menu', '0', '', null, 'fa  fa-asterisk', '0', '一级菜单', '2016-06-30 19:51:57', '2016-06-30 19:51:57');
INSERT INTO `tb_resource` VALUES ('25', '24', '二级菜单', 'menu:menu1', '0', '', null, '', '0', '二级菜单', '2016-06-30 19:54:01', '2016-06-30 21:03:49');
INSERT INTO `tb_resource` VALUES ('26', '25', '三级菜单', 'menu:menu1:menu2', '0', '', null, 'fa  fa-cloud-download', '0', '三级菜单', '2016-06-30 19:54:29', '2016-07-01 10:26:48');
INSERT INTO `tb_resource` VALUES ('27', '26', '四级菜单', 'menu:menu1:menu2:menu3', '0', '/logInfo/listUI.html', null, 'fa  fa-line-chart', '0', '四级菜单', '2016-06-30 19:55:53', '2016-07-01 11:17:38');
INSERT INTO `tb_resource` VALUES ('28', '25', '三级菜单1', 'menu:menu1:menu21', '0', '/logInfo/listUI.html', null, 'fa  fa-balance-scale', '0', '三级菜单1', '2016-06-30 20:16:44', '2016-07-01 16:37:53');
INSERT INTO `tb_resource` VALUES ('29', '24', '二级菜单1', 'menu:menu11', '0', '/logInfo/listUI.html', null, 'fa  fa-comment', '0', '二级菜单1', '2016-07-01 15:41:44', '2016-07-01 15:42:05');

-- ----------------------------
-- Table structure for tb_resources_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_resources_role`;
CREATE TABLE `tb_resources_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) DEFAULT NULL COMMENT '资源id',
  `r_id` int(11) DEFAULT NULL COMMENT '角色id',
  `t_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `FK_r_resource_role` (`s_id`),
  KEY `FK_r_role_resource` (`r_id`),
  CONSTRAINT `FK_r_resource_role` FOREIGN KEY (`s_id`) REFERENCES `tb_resource` (`s_id`),
  CONSTRAINT `FK_r_role_resource` FOREIGN KEY (`r_id`) REFERENCES `tb_role` (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8 COMMENT='角色权限映射表';

-- ----------------------------
-- Records of tb_resources_role
-- ----------------------------
INSERT INTO `tb_resources_role` VALUES ('173', '1', '3', '2016-02-28 17:11:47');
INSERT INTO `tb_resources_role` VALUES ('219', '3', '2', '2016-03-08 22:55:56');
INSERT INTO `tb_resources_role` VALUES ('220', '2', '2', '2016-03-08 22:55:56');
INSERT INTO `tb_resources_role` VALUES ('221', '9', '2', '2016-03-08 22:55:56');
INSERT INTO `tb_resources_role` VALUES ('222', '1', '2', '2016-03-08 22:55:56');
INSERT INTO `tb_resources_role` VALUES ('223', '11', '2', '2016-03-08 22:55:56');
INSERT INTO `tb_resources_role` VALUES ('224', '12', '2', '2016-03-08 22:55:56');
INSERT INTO `tb_resources_role` VALUES ('225', '13', '2', '2016-03-08 22:55:56');
INSERT INTO `tb_resources_role` VALUES ('226', '14', '2', '2016-03-08 22:55:56');
INSERT INTO `tb_resources_role` VALUES ('227', '10', '2', '2016-03-08 22:55:56');
INSERT INTO `tb_resources_role` VALUES ('228', '22', '2', '2016-03-08 22:55:56');
INSERT INTO `tb_resources_role` VALUES ('413', '3', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('414', '2', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('415', '4', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('416', '5', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('417', '6', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('418', '9', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('419', '26', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('420', '25', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('421', '24', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('422', '1', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('423', '11', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('424', '12', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('425', '13', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('426', '14', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('427', '15', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('428', '16', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('429', '17', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('430', '18', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('431', '19', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('432', '20', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('433', '21', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('434', '7', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('435', '8', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('436', '10', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('437', '22', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('438', '27', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('439', '28', '1', '2016-07-07 17:07:14');
INSERT INTO `tb_resources_role` VALUES ('440', '29', '1', '2016-07-07 17:07:14');

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `r_name` varchar(50) NOT NULL COMMENT '角色名称',
  `r_key` varchar(50) NOT NULL COMMENT '角色key',
  `r_status` int(11) DEFAULT '0' COMMENT '角色状态,0：正常；1：删除',
  `r_description` varchar(100) DEFAULT NULL COMMENT '角色描述',
  `r_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `r_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '超级管理员', 'administrator', '0', '超级管理员', '2016-01-05 12:07:42', '2016-02-27 22:30:15');
INSERT INTO `tb_role` VALUES ('2', '管理员', 'admin', '0', '管理员', '2016-01-05 12:07:42', '2016-02-27 22:30:22');
INSERT INTO `tb_role` VALUES ('3', '普通用户', 'customer', '0', '普通用户', '2016-02-28 17:09:40', '2016-03-08 22:55:36');
INSERT INTO `tb_role` VALUES ('4', '华东部研发经理', 'HDPM', '0', '华东区域管理1', '2016-07-05 19:07:45', '2016-07-12 20:16:12');

-- ----------------------------
-- Table structure for tb_role_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_user`;
CREATE TABLE `tb_role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `r_id` int(11) DEFAULT NULL COMMENT '角色id',
  `u_id` int(11) DEFAULT NULL COMMENT '用户id',
  `t_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `FK_r_role_user` (`r_id`),
  KEY `FK_r_user_role` (`u_id`),
  CONSTRAINT `FK_r_role_user` FOREIGN KEY (`r_id`) REFERENCES `tb_role` (`r_id`),
  CONSTRAINT `FK_r_user_role` FOREIGN KEY (`u_id`) REFERENCES `tb_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='用户角色映射表';

-- ----------------------------
-- Records of tb_role_user
-- ----------------------------
INSERT INTO `tb_role_user` VALUES ('1', '1', '4', '2016-01-05 12:07:15');
INSERT INTO `tb_role_user` VALUES ('17', '2', '21', '2016-07-05 18:57:53');
INSERT INTO `tb_role_user` VALUES ('18', '3', '22', '2016-07-05 19:06:40');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `u_name` varchar(100) NOT NULL COMMENT '真实姓名',
  `u_account_name` varchar(100) NOT NULL COMMENT '账户名称',
  `u_password` varchar(100) NOT NULL COMMENT '用户密码',
  `u_delete_status` int(11) DEFAULT '0' COMMENT '逻辑删除状态',
  `u_locked` int(11) DEFAULT '0' COMMENT '是否锁定',
  `u_description` varchar(200) DEFAULT NULL COMMENT '用户描述',
  `u_credentials_salt` varchar(500) NOT NULL COMMENT '加密盐',
  `u_creator_name` varchar(100) NOT NULL COMMENT '创建者',
  `u_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `u_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_account_name_unique` (`u_account_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='用户账户表';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('4', 'superadmin', 'admin@webside.com', 'VaNoSnm8zZFL6eIckR9nkQ==', '0', '0', '超级管理员', '6b8c008bd7d242f1b60d713f8e3b7422', 'admin@webside.com', '2016-02-15 17:17:26', '2016-07-12 19:55:04');
INSERT INTO `tb_user` VALUES ('21', 'admin', '381543724@qq.com', 'cZCgAgosgWa42QtD2xiQxw==', '0', '0', 'admin', '40af745c825f0a72e64f53ea42f8f1a5', 'admin@webside.com', '2016-07-05 18:57:53', '2016-07-06 15:12:43');
INSERT INTO `tb_user` VALUES ('22', '小三', '254813870@qq.com', 'mlotfbqQOEtgz/nR1JZ3+A==', '0', '0', '小三', '29d357932f0d62c73184411d86a4af22', '381543724@qq.com', '2016-07-05 19:06:40', '2016-07-05 19:06:40');

-- ----------------------------
-- Table structure for tb_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_info`;
CREATE TABLE `tb_user_info` (
  `u_id` int(11) NOT NULL COMMENT '用户id',
  `u_sex` int(11) DEFAULT NULL COMMENT '性别',
  `u_birthday` date DEFAULT NULL COMMENT '出生日期',
  `u_telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `u_email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `u_address` varchar(200) DEFAULT NULL COMMENT '住址',
  `u_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`u_id`),
  CONSTRAINT `FK_r_user_info` FOREIGN KEY (`u_id`) REFERENCES `tb_user` (`u_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户扩展信息表';

-- ----------------------------
-- Records of tb_user_info
-- ----------------------------
INSERT INTO `tb_user_info` VALUES ('4', '1', '2016-04-29', '15361427685', 'admin@webside.com', '江苏省无锡市国家软件园射手座', '2016-02-18 16:43:28');
INSERT INTO `tb_user_info` VALUES ('21', null, null, null, null, null, null);
INSERT INTO `tb_user_info` VALUES ('22', null, null, null, null, null, null);
