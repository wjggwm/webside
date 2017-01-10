/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : webside

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-12-06 18:25:23
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
  `l_region` varchar(255) DEFAULT NULL,
  `l_province` varchar(255) DEFAULT NULL,
  `l_city` varchar(255) DEFAULT NULL,
  `l_login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=utf8;



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
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;



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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='资源表';

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
INSERT INTO `tb_resource` VALUES ('11', '3', '添加用户', 'user:add', '1', '/user/add.html', '3', null, '0', '添加用户', '2016-01-22 00:18:40', '2016-12-29 13:37:59');
INSERT INTO `tb_resource` VALUES ('12', '3', '编辑用户', 'user:edit', '1', '/user/edit.html', '3', null, '0', '编辑用户', '2016-01-22 00:18:40', '2016-12-29 13:37:49');
INSERT INTO `tb_resource` VALUES ('13', '3', '删除用户', 'user:deleteBatch', '1', '/user/deleteBatch.html', null, null, '0', '删除用户', '2016-02-05 15:26:32', '2016-12-29 13:38:38');
INSERT INTO `tb_resource` VALUES ('14', '3', '重置密码', 'user:resetPassword', '1', '/user/resetPassword.html', null, null, '0', '重置密码', '2016-02-27 23:55:13', '2016-06-30 20:54:45');
INSERT INTO `tb_resource` VALUES ('15', '4', '添加角色', 'role:add', '1', '/role/add.html', null, null, '0', '添加', '2016-02-27 23:56:52', '2016-12-29 13:37:34');
INSERT INTO `tb_resource` VALUES ('16', '4', '编辑角色', 'role:edit', '1', '/role/edit.html', null, null, '0', '编辑', '2016-02-27 23:57:35', '2016-12-29 13:37:22');
INSERT INTO `tb_resource` VALUES ('17', '4', '删除角色', 'role:deleteBatch', '1', '/role/deleteBatch.html', null, null, '0', '删除角色', '2016-02-27 23:58:02', '2017-01-03 17:25:42');
INSERT INTO `tb_resource` VALUES ('18', '4', '分配权限', 'role:permission', '1', '/role/permission.html', null, null, '0', '分配权限', '2016-02-27 23:59:20', '2016-06-30 20:54:48');
INSERT INTO `tb_resource` VALUES ('19', '5', '添加资源', 'resource:add', '1', '/resource/add.html', null, null, '0', '添加', '2016-02-28 00:01:15', '2016-12-29 13:37:07');
INSERT INTO `tb_resource` VALUES ('20', '5', '编辑资源', 'resource:edit', '1', '/resource/edit.html', null, null, '0', '编辑', '2016-02-28 00:02:01', '2017-01-03 17:18:22');
INSERT INTO `tb_resource` VALUES ('21', '5', '删除资源', 'resource:deleteBatch', '1', '/resource/deleteBatch.html', null, null, '0', '删除', '2016-02-28 00:03:03', '2016-12-29 13:40:13');
INSERT INTO `tb_resource` VALUES ('22', '9', '用户操作信息', 'loginfo:userOperation', '0', '/logInfo/listUI.html', null, 'fa  fa-sticky-note-o', '0', '用户操作信息', '2016-03-08 22:00:36', '2016-07-01 16:14:54');
INSERT INTO `tb_resource` VALUES ('24', null, '一级菜单', 'menu', '0', '', null, 'fa  fa-asterisk', '0', '一级菜单', '2016-06-30 19:51:57', '2016-06-30 19:51:57');
INSERT INTO `tb_resource` VALUES ('25', '24', '二级菜单', 'menu:menu1', '0', '', null, '', '0', '二级菜单', '2016-06-30 19:54:01', '2016-06-30 21:03:49');
INSERT INTO `tb_resource` VALUES ('26', '25', '三级菜单', 'menu:menu1:menu2', '0', '', null, 'fa  fa-cloud-download', '0', '三级菜单', '2016-06-30 19:54:29', '2016-07-01 10:26:48');
INSERT INTO `tb_resource` VALUES ('27', '26', '四级菜单', 'menu:menu1:menu2:menu3', '0', '/logInfo/listUI.html', null, 'fa  fa-line-chart', '0', '四级菜单', '2016-06-30 19:55:53', '2016-07-01 11:17:38');
INSERT INTO `tb_resource` VALUES ('28', '25', '三级菜单1', 'menu:menu1:menu21', '0', '/logInfo/listUI.html', null, 'fa  fa-balance-scale', '0', '三级菜单1', '2016-06-30 20:16:44', '2016-07-01 16:37:53');
INSERT INTO `tb_resource` VALUES ('29', '24', '二级菜单1', 'menu:menu11', '0', '/logInfo/listUI.html', null, 'fa  fa-comment', '0', '二级菜单1', '2016-07-01 15:41:44', '2016-07-01 15:42:05');
INSERT INTO `tb_resource` VALUES ('30', null, '计划任务管理', 'schedule', '0', '', null, 'fa  fa-list-ol', '0', '计划任务管理', '2016-07-17 01:09:27', '2016-07-20 16:01:08');
INSERT INTO `tb_resource` VALUES ('32', '38', '添加jobUI', 'schedule:addJobUI', '1', '/scheduleJob/addJobUI.html', null, null, '0', '添加任务', '2016-07-17 01:15:38', '2016-12-29 13:47:48');
INSERT INTO `tb_resource` VALUES ('34', '38', '删除job', 'schedule:deleteJob', '1', '/scheduleJob/deleteJob.html', null, null, '0', '删除任务', '2016-07-17 01:19:24', '2016-07-26 17:32:05');
INSERT INTO `tb_resource` VALUES ('35', '38', '执行job', 'schedule:executeJob', '1', '/scheduleJob/executeJob.html', null, null, '0', '立即执行一次', '2016-07-17 01:22:01', '2016-07-26 17:33:26');
INSERT INTO `tb_resource` VALUES ('36', '39', '暂停job', 'schedule:pauseJob', '1', '/scheduleJob/pauseJob.html', null, null, '0', '暂停任务', '2016-07-17 01:24:13', '2016-07-26 17:32:20');
INSERT INTO `tb_resource` VALUES ('37', '39', '恢复job', 'schedule:resumeJob', '1', '/scheduleJob/resumeJob.html', null, null, '0', '恢复任务', '2016-07-17 01:25:23', '2016-07-26 17:32:26');
INSERT INTO `tb_resource` VALUES ('38', '30', '计划中任务', 'schedule:planSchedule', '0', '/scheduleJob/planningJobListUI.html', null, 'fa  fa-hourglass', '0', '计划中任务', '2016-07-19 18:51:54', '2016-12-29 10:27:36');
INSERT INTO `tb_resource` VALUES ('39', '30', '运行中任务', 'schedule:runSchedule', '0', '/scheduleJob/runningJobListUI.html', null, 'fa  fa-hourglass-2', '0', '运行中任务', '2016-07-19 18:53:45', '2016-12-29 10:27:55');
INSERT INTO `tb_resource` VALUES ('40', '38', '触发器管理', 'schedule:trigger', '1', '/scheduleJob/jobTriggerListUI.html', null, null, '0', '查看触发器列表', '2016-07-21 21:19:57', '2016-12-29 10:34:05');
INSERT INTO `tb_resource` VALUES ('41', '40', '添加triggerUI', 'schedule:addTriggerUI', '1', '/scheduleJob/addTriggerUI.html', null, null, '0', '给当前job添加trigger页面', '2016-07-26 19:31:07', '2016-12-29 13:49:44');
INSERT INTO `tb_resource` VALUES ('42', '38', '暂停job', 'schedule:pauseJob', '1', '/scheduleJob/pauseJob.html', null, '', '0', '暂停job', '2016-07-26 19:32:15', '2016-07-26 19:32:15');
INSERT INTO `tb_resource` VALUES ('43', '38', '恢复job', 'schedule:resumeJob', '1', '/scheduleJob/resumeJob.html', null, '', '0', '恢复job', '2016-07-26 19:32:52', '2016-07-26 19:32:52');
INSERT INTO `tb_resource` VALUES ('44', '40', '编辑triggerUI', 'schedule:editTriggerUI', '1', '/scheduleJob/editTriggerUI.html', null, null, '0', '编辑trigger页面', '2016-07-26 19:34:44', '2016-12-29 14:04:06');
INSERT INTO `tb_resource` VALUES ('45', '40', '删除trigger', 'schedule:deleteTrigger', '1', '/scheduleJob/deleteTrigger.html', null, null, '0', '删除trigger', '2016-07-26 19:35:23', '2016-07-26 19:36:50');
INSERT INTO `tb_resource` VALUES ('46', '40', '暂停trigger', 'schedule:pauseTrigger', '1', '/scheduleJob/pauseTrigger.html', null, null, '0', '暂停trigger', '2016-07-26 19:36:37', '2017-01-03 17:50:15');
INSERT INTO `tb_resource` VALUES ('47', '40', '恢复trigger', 'schedule:resumeTrigger', '1', '/scheduleJob/resumeTrigger.html', null, '', '0', '恢复trigger', '2016-07-26 19:37:22', '2016-07-26 19:37:22');
INSERT INTO `tb_resource` VALUES ('48', '3', '锁定', 'user:lock', '1', '/user/lock.html', null, null, '0', '锁定用户账户', '2016-12-26 23:35:14', '2016-12-26 23:39:33');
INSERT INTO `tb_resource` VALUES ('49', '3', '解锁', 'user:unlock', '1', '/user/unlock.html', null, null, '0', '解锁账户', '2016-12-26 23:36:12', '2016-12-26 23:39:46');
INSERT INTO `tb_resource` VALUES ('50', '6', '在线用户', 'session', '0', '/session/listUI.html', null, 'fa  fa-heartbeat', '0', '在线用户', '2016-12-27 00:45:41', '2016-12-29 10:41:11');
INSERT INTO `tb_resource` VALUES ('51', '50', '踢出', 'session:kickout', '1', '/session/kickout.html', null, null, '0', '踢出在线用户', '2016-12-28 11:25:57', '2016-12-29 10:43:33');
INSERT INTO `tb_resource` VALUES ('52', '3', '用户列表', 'user:list', '1', '/user/list.html', null, null, '0', '用户列表', '2016-12-29 10:05:04', '2016-12-29 10:07:15');
INSERT INTO `tb_resource` VALUES ('53', '4', '角色列表', 'role:list', '1', '/role/list.html', null, 'fa  fa-reorder', '0', '角色列表', '2016-12-29 10:09:36', '2016-12-29 10:09:36');
INSERT INTO `tb_resource` VALUES ('54', '5', '资源列表', 'resource:list', '1', '/resource/list.html', null, 'fa  fa-reorder', '0', '资源列表', '2016-12-29 10:10:41', '2016-12-29 10:10:41');
INSERT INTO `tb_resource` VALUES ('55', '10', '登陆日志列表', 'loginInfo:list', '1', '/loginInfo/list.html', null, null, '0', '用户登陆列表', '2016-12-29 10:12:37', '2016-12-29 10:15:05');
INSERT INTO `tb_resource` VALUES ('56', '22', '操作日志列表', 'logInfo:list', '1', '/logInfo/list.html', null, 'fa  fa-bars', '0', '操作日志列表', '2016-12-29 10:14:50', '2016-12-29 10:14:50');
INSERT INTO `tb_resource` VALUES ('57', '38', '计划中任务列表', 'schedule:planScheduleList', '1', '/scheduleJob/planningJobList.html', null, 'fa  fa-bars', '0', '计划中任务列表', '2016-12-29 10:25:51', '2016-12-29 10:25:51');
INSERT INTO `tb_resource` VALUES ('58', '39', '运行中任务列表', 'schedule:runScheduleList', '1', '/scheduleJob/runningJobList.html', null, 'fa  fa-bars', '0', '运行中任务列表', '2016-12-29 10:29:46', '2016-12-29 10:29:46');
INSERT INTO `tb_resource` VALUES ('59', '40', '触发器列表', 'schedule:triggerList', '1', '/scheduleJob/jobTriggerList.html', null, 'fa  fa-bars', '0', '触发器列表', '2016-12-29 10:33:32', '2016-12-29 10:33:32');
INSERT INTO `tb_resource` VALUES ('60', '50', '在线用户列表', 'session:list', '1', '/session/list.html ', null, 'fa  fa-bars', '0', '在线用户列表', '2016-12-29 10:41:49', '2016-12-29 10:41:49');
INSERT INTO `tb_resource` VALUES ('61', '3', '添加用户UI', 'user:addUI', '1', '/user/addUI.html', null, '', '0', '添加用户页面', '2016-12-29 13:41:07', '2016-12-29 13:41:07');
INSERT INTO `tb_resource` VALUES ('62', '4', '添加角色UI', 'role:addUI', '1', '/role/addUI.html', null, '', '0', '添加角色页面', '2016-12-29 13:44:07', '2016-12-29 13:44:07');
INSERT INTO `tb_resource` VALUES ('63', '5', '添加资源UI', 'resource:addUI', '1', '/resource/addUI.html', null, '', '0', '添加资源页面', '2016-12-29 13:44:50', '2016-12-29 13:44:50');
INSERT INTO `tb_resource` VALUES ('64', '38', '添加job', 'schedule:addJob', '1', '/scheduleJob/addJob.html', null, '', '0', '添加job', '2016-12-29 13:48:19', '2016-12-29 13:48:19');
INSERT INTO `tb_resource` VALUES ('65', '40', '添加trigger', 'schedule:addTrigger', '1', '/scheduleJob/addTrigger.html', null, '', '0', '添加trigger', '2016-12-29 13:49:34', '2016-12-29 13:49:34');
INSERT INTO `tb_resource` VALUES ('66', '4', '分配权限UI', 'role:permissionUI', '1', '/role/permissionUI.html', null, '', '0', '分配权限页面', '2016-12-29 13:54:44', '2016-12-29 13:54:44');
INSERT INTO `tb_resource` VALUES ('67', '3', '编辑用户UI', 'user:editUI', '1', '/user/editUI.html', null, '', '0', '编辑用户页面', '2016-12-29 13:56:06', '2016-12-29 13:56:06');
INSERT INTO `tb_resource` VALUES ('68', '4', '编辑角色UI', 'role:editUI', '1', '/role/editUI.html', null, '', '0', '编辑角色页面', '2016-12-29 13:57:03', '2016-12-29 13:57:03');
INSERT INTO `tb_resource` VALUES ('69', '5', '编辑资源UI', 'resource:editUI', '1', '/resource/editUI.html', null, '', '0', '编辑资源页面', '2016-12-29 13:57:54', '2017-01-03 17:17:58');
INSERT INTO `tb_resource` VALUES ('70', '40', '编辑trigger', 'schedule:editTrigger', '1', '/scheduleJob/editTrigger.html', null, '', '0', '编辑trigger', '2016-12-29 14:03:47', '2016-12-29 14:03:47');
INSERT INTO `tb_resource` VALUES ('71', '50', '在线用户详情', 'session:info', '1', '/session/info.html', null, '', '0', '在线用户详情', '2016-12-30 17:49:32', '2016-12-30 17:49:32');
INSERT INTO `tb_resource` VALUES ('72', '3', '个人信息', 'user:infoUI', '1', '/user/infoUI.html', null, '', '0', '个人信息详页', '2017-01-03 18:03:06', '2017-01-03 18:03:06');
INSERT INTO `tb_resource` VALUES ('73', '3', '个人信息编辑', 'user:info', '1', '/user/info.html', null, '', '0', '个人信息编辑', '2017-01-03 18:03:51', '2017-01-03 18:03:51');
INSERT INTO `tb_resource` VALUES ('74', '3', '修改密码UI', 'user:passwork', '1', '/user/passwordUI.html', null, '', '0', '修改个人密码UI', '2017-01-03 18:05:13', '2017-01-03 18:05:13');
INSERT INTO `tb_resource` VALUES ('75', '3', '修改个人密码', 'user:password', '1', '/user/password.html', null, '', '0', '修改个人密码', '2017-01-03 18:05:58', '2017-01-03 18:05:58');

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
) ENGINE=InnoDB AUTO_INCREMENT=2300 DEFAULT CHARSET=utf8 COMMENT='角色权限映射表';

-- ----------------------------
-- Records of tb_resources_role
-- ----------------------------
INSERT INTO `tb_resources_role` VALUES ('173', '1', '3', '2016-02-28 17:11:47');
INSERT INTO `tb_resources_role` VALUES ('885', '3', '2', '2016-12-12 13:37:42');
INSERT INTO `tb_resources_role` VALUES ('886', '2', '2', '2016-12-12 13:37:42');
INSERT INTO `tb_resources_role` VALUES ('887', '9', '2', '2016-12-12 13:37:42');
INSERT INTO `tb_resources_role` VALUES ('888', '26', '2', '2016-12-12 13:37:42');
INSERT INTO `tb_resources_role` VALUES ('889', '25', '2', '2016-12-12 13:37:42');
INSERT INTO `tb_resources_role` VALUES ('890', '24', '2', '2016-12-12 13:37:42');
INSERT INTO `tb_resources_role` VALUES ('891', '11', '2', '2016-12-12 13:37:42');
INSERT INTO `tb_resources_role` VALUES ('892', '12', '2', '2016-12-12 13:37:42');
INSERT INTO `tb_resources_role` VALUES ('893', '13', '2', '2016-12-12 13:37:42');
INSERT INTO `tb_resources_role` VALUES ('894', '14', '2', '2016-12-12 13:37:42');
INSERT INTO `tb_resources_role` VALUES ('895', '10', '2', '2016-12-12 13:37:42');
INSERT INTO `tb_resources_role` VALUES ('896', '22', '2', '2016-12-12 13:37:42');
INSERT INTO `tb_resources_role` VALUES ('897', '27', '2', '2016-12-12 13:37:42');
INSERT INTO `tb_resources_role` VALUES ('898', '28', '2', '2016-12-12 13:37:42');
INSERT INTO `tb_resources_role` VALUES ('899', '29', '2', '2016-12-12 13:37:42');
INSERT INTO `tb_resources_role` VALUES ('2228', '3', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2229', '2', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2230', '4', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2231', '5', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2232', '6', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2233', '50', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2234', '10', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2235', '9', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2236', '22', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2237', '26', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2238', '25', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2239', '24', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2240', '38', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2241', '30', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2242', '40', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2243', '39', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2244', '1', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2245', '11', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2246', '12', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2247', '13', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2248', '14', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2249', '48', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2250', '49', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2251', '52', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2252', '61', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2253', '67', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2254', '72', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2255', '73', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2256', '74', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2257', '75', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2258', '15', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2259', '16', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2260', '17', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2261', '18', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2262', '53', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2263', '62', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2264', '66', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2265', '68', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2266', '19', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2267', '20', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2268', '21', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2269', '54', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2270', '63', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2271', '69', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2272', '7', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2273', '8', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2274', '51', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2275', '60', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2276', '71', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2277', '55', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2278', '56', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2279', '27', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2280', '28', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2281', '29', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2282', '32', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2283', '34', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2284', '35', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2285', '41', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2286', '44', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2287', '45', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2288', '46', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2289', '47', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2290', '59', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2291', '65', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2292', '70', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2293', '42', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2294', '43', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2295', '57', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2296', '64', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2297', '36', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2298', '37', '1', '2017-01-06 17:47:20');
INSERT INTO `tb_resources_role` VALUES ('2299', '58', '1', '2017-01-06 17:47:20');

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
INSERT INTO `tb_role` VALUES ('1', '超级管理员', 'administrator', '0', '超级管理员', '2016-01-05 12:07:42', '2016-10-06 04:00:55');
INSERT INTO `tb_role` VALUES ('2', '管理员', 'admin', '0', '管理员', '2016-01-05 12:07:42', '2016-02-27 22:30:22');
INSERT INTO `tb_role` VALUES ('3', '普通用户', 'user', '0', '普通用户而已', '2016-02-28 17:09:40', '2017-01-09 10:02:02');
INSERT INTO `tb_role` VALUES ('4', '华东部研发经理', 'admin', '0', '华东区域管理', '2016-07-05 19:07:45', '2016-12-08 17:30:19');

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
INSERT INTO `tb_user` VALUES ('4', 'superadmin', 'admin@webside.com', 'VIlO0st6mlpQF70XwXyiGA==', '0', '0', '超级管理员', '6ca87d4b7820b5fd90bd821b8af1ecbc', 'admin@webside.com', '2016-02-15 17:17:26', '2017-01-08 23:04:44');
INSERT INTO `tb_user` VALUES ('21', 'admin', '381543724@qq.com', '47QcL15n9By6ezreLCzngw==', '0', '0', 'admin', 'cf1be6a412005d72d4e5f10f30b212cc', 'admin@webside.com', '2016-07-05 18:57:53', '2017-01-04 14:52:25');
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
INSERT INTO `tb_user_info` VALUES ('4', '1', '2016-04-03', '15361427685', 'admin@webside.com', '江苏省无锡市国家软件园射手座', '2016-02-18 16:43:28');
INSERT INTO `tb_user_info` VALUES ('21', null, null, null, null, null, null);
INSERT INTO `tb_user_info` VALUES ('22', null, null, null, null, null, null);
