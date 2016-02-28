/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : webside

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-02-29 00:13:46
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
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for tb_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_resource`;
CREATE TABLE `tb_resource` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源id',
  `a_id` int(11) DEFAULT NULL COMMENT '权限id',
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
  `s_update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`s_id`),
  KEY `FK_r_authority_resource` (`a_id`),
  CONSTRAINT `FK_r_authority_resource` FOREIGN KEY (`a_id`) REFERENCES `tb_resource_button` (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of tb_resource
-- ----------------------------
INSERT INTO `tb_resource` VALUES ('1', null, null, '控制台', 'desktop', '0', '/welcome.jsp', '1', 'fa fa-tachometer', '0', '控制台', '2016-01-12 17:08:55', '2016-01-21 11:12:49');
INSERT INTO `tb_resource` VALUES ('2', null, null, '系统基础管理', 'system', '0', '', '1', 'fa fa-list', '0', '系统基础管理', '2016-01-05 12:11:12', '2016-02-25 14:07:46');
INSERT INTO `tb_resource` VALUES ('3', null, '2', '用户管理', 'system:user', '0', '/user/listUI.html', '2', '', '0', '用户管理', '2016-01-08 12:37:10', '2016-01-22 11:06:59');
INSERT INTO `tb_resource` VALUES ('4', null, '2', '角色管理', 'system:role', '0', '/role/listUI.html', '2', '', '0', '角色管理', '2016-01-11 22:51:07', '2016-01-22 11:07:04');
INSERT INTO `tb_resource` VALUES ('5', null, '2', '资源管理', 'system:resource', '0', '/resource/listUI.html', '2', '', '0', '资源管理', '2016-01-11 22:51:55', '2016-01-22 11:07:10');
INSERT INTO `tb_resource` VALUES ('6', null, null, '系统监控管理', 'monitor', '0', '', '1', 'fa fa-pencil-square-o', '0', '系统监控管理', '2016-01-05 12:11:12', '2016-02-25 14:07:48');
INSERT INTO `tb_resource` VALUES ('7', null, '6', '实时监控', 'monitor:realtime', '0', '/role/listUI.html', '2', '', '0', '实时监控', '2016-01-05 12:11:12', '2016-01-22 11:05:50');
INSERT INTO `tb_resource` VALUES ('8', null, '6', '告警列表', 'monitor:warning', '0', '/role/listUI.html', '2', '', '0', '告警列表', '2016-01-11 22:45:27', '2016-01-22 11:05:55');
INSERT INTO `tb_resource` VALUES ('9', null, null, '登录信息管理', 'logininfo', '0', '', '1', 'fa fa-tag', '0', '登录信息管理', '2016-01-11 22:46:39', '2016-02-25 14:07:51');
INSERT INTO `tb_resource` VALUES ('10', null, '9', '用户登录信息', 'logininfo:user', '0', '/loginInfo/listUI.html', '2', '', '0', '用户登录信息', '2016-01-11 22:47:41', '2016-01-22 11:06:10');
INSERT INTO `tb_resource` VALUES ('11', null, '3', '添加', 'user:add', '1', '/user/add.html', '3', '', '0', '添加用户', '2016-01-22 00:18:40', '2016-01-22 11:06:13');
INSERT INTO `tb_resource` VALUES ('12', null, '3', '编辑', 'user:edit', '1', '/user/edit.html', '3', '', '0', '编辑用户', '2016-01-22 00:18:40', '2016-01-22 11:06:22');
INSERT INTO `tb_resource` VALUES ('13', null, '3', '删除', 'user:deleteBatch', '1', '/user/deleteBatch.html', null, null, '0', '删除用户', '2016-02-05 15:26:32', '2016-02-25 15:27:51');
INSERT INTO `tb_resource` VALUES ('14', null, '3', '重置密码', 'user:resetPassword', '1', '/user/resetPassword.html', null, null, '0', '重置密码', '2016-02-27 23:55:13', '0000-00-00 00:00:00');
INSERT INTO `tb_resource` VALUES ('15', null, '4', '添加', 'role:add', '1', '/role/add.html', null, null, '0', '添加', '2016-02-27 23:56:52', '0000-00-00 00:00:00');
INSERT INTO `tb_resource` VALUES ('16', null, '4', '编辑', 'role:edit', '1', '/role/edit.html', null, null, '0', '编辑', '2016-02-27 23:57:35', '0000-00-00 00:00:00');
INSERT INTO `tb_resource` VALUES ('17', null, '4', '删除', 'role:deleteBatch', '1', '/role/deleteBatch.html ', null, null, '0', '删除', '2016-02-27 23:58:02', '0000-00-00 00:00:00');
INSERT INTO `tb_resource` VALUES ('18', null, '4', '分配权限', 'role:permission', '1', '/role/permission.html', null, null, '0', '分配权限', '2016-02-27 23:59:20', '0000-00-00 00:00:00');
INSERT INTO `tb_resource` VALUES ('19', null, '5', '添加', 'resource:add', '1', '/resource/add.html', null, null, '0', '添加', '2016-02-28 00:01:15', '0000-00-00 00:00:00');
INSERT INTO `tb_resource` VALUES ('20', null, '5', '编辑', 'resource:edit', '1', '/resource/edit.html', null, null, '0', '编辑', '2016-02-28 00:02:01', '0000-00-00 00:00:00');
INSERT INTO `tb_resource` VALUES ('21', null, '5', '删除', 'resource:deleteBatch', '1', '/resource/deleteBatch.html', null, null, '0', '删除', '2016-02-28 00:03:03', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COMMENT='角色权限映射表';

-- ----------------------------
-- Records of tb_resources_role
-- ----------------------------
INSERT INTO `tb_resources_role` VALUES ('133', '3', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('134', '2', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('135', '6', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('136', '9', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('137', '4', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('138', '5', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('139', '1', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('140', '11', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('141', '12', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('142', '13', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('143', '7', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('144', '8', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('145', '10', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('146', '14', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('147', '15', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('148', '16', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('149', '17', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('150', '18', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('151', '19', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('152', '20', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('153', '21', '1', '2016-02-28 00:10:17');
INSERT INTO `tb_resources_role` VALUES ('164', '9', '2', '2016-02-28 17:11:28');
INSERT INTO `tb_resources_role` VALUES ('165', '2', '2', '2016-02-28 17:11:28');
INSERT INTO `tb_resources_role` VALUES ('166', '3', '2', '2016-02-28 17:11:28');
INSERT INTO `tb_resources_role` VALUES ('167', '1', '2', '2016-02-28 17:11:28');
INSERT INTO `tb_resources_role` VALUES ('168', '10', '2', '2016-02-28 17:11:28');
INSERT INTO `tb_resources_role` VALUES ('169', '11', '2', '2016-02-28 17:11:28');
INSERT INTO `tb_resources_role` VALUES ('170', '12', '2', '2016-02-28 17:11:28');
INSERT INTO `tb_resources_role` VALUES ('171', '13', '2', '2016-02-28 17:11:28');
INSERT INTO `tb_resources_role` VALUES ('172', '14', '2', '2016-02-28 17:11:28');
INSERT INTO `tb_resources_role` VALUES ('173', '1', '3', '2016-02-28 17:11:47');

-- ----------------------------
-- Table structure for tb_resource_button
-- ----------------------------
DROP TABLE IF EXISTS `tb_resource_button`;
CREATE TABLE `tb_resource_button` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `a_name` varchar(100) NOT NULL COMMENT '权限名称',
  `a_element` varchar(500) NOT NULL COMMENT '权限元素',
  `a_description` varchar(500) DEFAULT NULL COMMENT '权限描述',
  `s_delete_status` int(11) DEFAULT NULL COMMENT '逻辑删除状态',
  `a_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of tb_resource_button
-- ----------------------------

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
  `r_update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '超级管理员', 'administrator', '0', '超级管理员', '2016-01-05 12:07:42', '2016-02-27 22:30:15');
INSERT INTO `tb_role` VALUES ('2', '管理员', 'admin', '0', '管理员', '2016-01-05 12:07:42', '2016-02-27 22:30:22');
INSERT INTO `tb_role` VALUES ('3', '普通用户', 'customer', '0', '普通用户', '2016-02-28 17:09:40', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户角色映射表';

-- ----------------------------
-- Records of tb_role_user
-- ----------------------------
INSERT INTO `tb_role_user` VALUES ('1', '1', '4', '2016-01-05 12:07:15');
INSERT INTO `tb_role_user` VALUES ('5', '2', '9', '2016-02-28 17:40:08');
INSERT INTO `tb_role_user` VALUES ('6', '3', '10', '2016-02-28 20:10:05');

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
  `u_update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_account_name_unique` (`u_account_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户账户表';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('4', '高刚', 'wjggwm@126.com', '0tWdIYohJmQrWlF4VsO9uA==', '0', '0', null, 'b7c1b2ecb3c06a2e766afb516917f10e', 'wjggwm', '2016-02-15 17:17:26', '2016-02-26 17:26:29');
INSERT INTO `tb_user` VALUES ('9', '高刚', '254813870@qq.com', 'UcsN9eTNVUpNuWqA4FZ9Ng==', '0', '0', ' 管理员', '563f0ff44bbd15b70daec5355701f363', 'wjggwm', '2016-02-28 17:39:31', '2016-02-28 19:46:04');
INSERT INTO `tb_user` VALUES ('10', '普通用户', '381543724@qq.com', '3kC8GTcGYkARWJG5du22+A==', '0', '0', '普通用户', '1ec5ba267bbefb7c405c95b20e815738', '高刚', '2016-02-28 20:10:05', '2016-02-28 20:11:45');

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
INSERT INTO `tb_user_info` VALUES ('4', '1', '2016-02-10', '15161527385', 'wjggwm@126.com', '江苏省无锡市新区', '2016-02-18 16:43:28');
INSERT INTO `tb_user_info` VALUES ('9', null, null, null, null, null, null);
INSERT INTO `tb_user_info` VALUES ('10', '1', '2016-02-03', '15161527385', '381543724@qq.com', '江苏省无锡市新区', null);
