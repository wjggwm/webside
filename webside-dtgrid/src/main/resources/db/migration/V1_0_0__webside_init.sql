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
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_login_info
-- ----------------------------
INSERT INTO `tb_login_info` VALUES ('167', '4', 'admin@webside.com', '0:0:0:0:0:0:0:1', '未分配或者内网IP|0|0|0|0', '0', '0', '2016-12-06 18:20:21');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_log_info
-- ----------------------------
INSERT INTO `tb_log_info` VALUES ('1', '4', 'admin@webside.com', 'update', 'resetPassword[参数1，类型：UserEntity，值：(getUserName : admin)(getPassword : onubLCR5m1wongM4hJiIvw==)(getCredentialsSalt : 16a8ce0ac394eef994e9b91ef43c91e2)(getAccountName : 381543724@qq.com)]', '2016-09-25 22:30:21');
INSERT INTO `tb_log_info` VALUES ('2', '4', 'admin@webside.com', 'update', 'resetPassword[参数1，类型：UserEntity，值：(getUserName : admin)(getAccountName : 381543724@qq.com)(getPassword : 8pN8x7U4RrG8VmgN+zBjRg==)(getCredentialsSalt : 76b96d1cf779911fec71bc422185eae8)]', '2016-09-25 22:34:35');
INSERT INTO `tb_log_info` VALUES ('3', '4', 'admin@webside.com', 'update', 'password[参数1，类型：UserEntity，值：(getUserName : superadmin)(getAccountName : admin@webside.com)(getPassword : hBTttvmLmBb0Xe4NnKNq3g==)(getCredentialsSalt : d6f20fa13a79a33ec25cc72a8d688319)]', '2016-09-25 22:38:08');
INSERT INTO `tb_log_info` VALUES ('4', '4', 'admin@webside.com', 'update', 'resetPassword[参数1，类型：UserEntity，值：(getPassword : rHntAIgqHL75WmGC135rXg==)(getUserName : admin)(getCredentialsSalt : cd94f6246418f1f959191ba721c73691)(getAccountName : 381543724@qq.com)]', '2016-09-25 23:01:37');
INSERT INTO `tb_log_info` VALUES ('5', '4', 'admin@webside.com', 'update', 'resetPassword[参数1，类型：UserEntity，值：(getPassword : ztCFqUAMkHGpIeDOeLQ/eA==)(getUserName : admin)(getCredentialsSalt : 041a3c3664b831ed66a45bc5ebbeef10)(getAccountName : 381543724@qq.com)]', '2016-09-25 23:04:25');
INSERT INTO `tb_log_info` VALUES ('6', '4', 'admin@webside.com', 'update', 'resetPassword[参数1，类型：UserEntity，值：(getPassword : mg923xUOhYut1Qs7uT7JfQ==)(getUserName : admin)(getCredentialsSalt : 3d01f585c0b9fb4c84bddc59191279b2)(getAccountName : 381543724@qq.com)]', '2016-09-25 23:06:21');
INSERT INTO `tb_log_info` VALUES ('7', '4', 'admin@webside.com', 'update', 'resetPassword[参数1，类型：UserEntity，值：(getUserName : admin)(getPassword : 7TLkgE7QDmY6aqxuFN/eig==)(getCredentialsSalt : ed607b498cfb97736f4be1f9f3a6fa1a)(getAccountName : 381543724@qq.com)]', '2016-10-06 00:22:55');
INSERT INTO `tb_log_info` VALUES ('8', '4', 'admin@webside.com', 'update', 'resetPassword[参数1，类型：UserEntity，值：(getUserName : admin)(getPassword : HtarMCuDwDaYhZunYiVtEw==)(getAccountName : 381543724@qq.com)(getCredentialsSalt : 2e6515be55d8bce6a9880495283f0ebc)]', '2016-10-06 00:40:43');
INSERT INTO `tb_log_info` VALUES ('9', '4', 'admin@webside.com', 'update', 'resetPassword[参数1，类型：UserEntity，值：(getPassword : htBkkLrRpXHaZ8kz2b7Fgg==)(getUserName : admin)(getCredentialsSalt : d89125638c10df2a6ee53cc6afb16902)(getAccountName : 381543724@qq.com)]', '2016-10-06 00:45:12');
INSERT INTO `tb_log_info` VALUES ('10', '21', '381543724@qq.com', 'update', 'password[参数1，类型：UserEntity，值：(getPassword : vwggiKioK8IT3vbTO5yOdA==)(getUserName : admin)(getCredentialsSalt : cdcb443f872e99d44491f2b4510c9198)(getAccountName : 381543724@qq.com)]', '2016-10-06 00:54:01');
INSERT INTO `tb_log_info` VALUES ('11', '21', '381543724@qq.com', 'update', 'password[参数1，类型：UserEntity，值：(getPassword : Yuag/+p+WZ3wVuNxa7diww==)(getUserName : admin)(getCredentialsSalt : 7f2d13690beea5a2bb6642d43d0be9b1)(getAccountName : 381543724@qq.com)]', '2016-10-06 01:57:21');
INSERT INTO `tb_log_info` VALUES ('12', '21', '381543724@qq.com', 'update', 'password[参数1，类型：UserEntity，值：(getPassword : 5MLeneNCueeDZufj9D09gQ==)(getUserName : admin)(getCredentialsSalt : 58b5198679a86f0b7074f0b0902ee444)(getAccountName : 381543724@qq.com)]', '2016-10-06 02:14:47');
INSERT INTO `tb_log_info` VALUES ('13', '21', '381543724@qq.com', 'update', 'password[参数1，类型：UserEntity，值：(getPassword : gNpq5tRSAgpSnjW5VpLXnA==)(getUserName : admin)(getCredentialsSalt : f6ed47f0ee117f4416257973a3932a2c)(getAccountName : 381543724@qq.com)]', '2016-10-06 02:17:20');
INSERT INTO `tb_log_info` VALUES ('14', '21', '381543724@qq.com', 'update', 'password[参数1，类型：UserEntity，值：(getUserName : admin)(getAccountName : 381543724@qq.com)(getPassword : JOCrJ6TWY3aA6xj2ogF+eA==)(getCredentialsSalt : 0869437fa68ef9a347cea6d3ff601529)]', '2016-10-06 02:41:34');
INSERT INTO `tb_log_info` VALUES ('15', '21', '381543724@qq.com', 'update', 'password[参数1，类型：UserEntity，值：(getUserName : admin)(getPassword : eVg3d5VHipp4eC86qKFzyQ==)(getCredentialsSalt : e904fdf321fc383438b9473797a9a23e)(getAccountName : 381543724@qq.com)]', '2016-10-06 02:49:36');
INSERT INTO `tb_log_info` VALUES ('16', '21', '381543724@qq.com', 'update', 'password[参数1，类型：UserEntity，值：(getUserName : admin)(getPassword : 2mqwiRrX3L0KPFn0gnAM8w==)(getAccountName : 381543724@qq.com)(getCredentialsSalt : 5ef9553384f7bf29e5f072b1dbd3e77e)]', '2016-10-06 03:17:47');
INSERT INTO `tb_log_info` VALUES ('17', '21', '381543724@qq.com', 'update', 'update[参数1，类型：UserEntity，值：(getUserInfo : UserInfo [id=22, sex=null, birthday=null, telephone=null, email=null, address=null, createTime=null])(getDescription : 小三)(getRole : RoleEntity [id=3, name=null, key=null, status=null, description=null, createTime=null, updateTime=null, userList=null])(getUserName : 小三)(getAccountName : 254813870@qq.com)(getCreatorName : 381543724@qq.com)]', '2016-10-06 03:20:57');
INSERT INTO `tb_log_info` VALUES ('18', '4', 'admin@webside.com', 'update', 'update[参数1，类型：RoleEntity，值：(getName : 华东部研发经理)(getKey : admin)(getDescription : 华东区域管理1)]', '2016-10-06 03:47:49');
INSERT INTO `tb_log_info` VALUES ('19', '4', 'admin@webside.com', 'update', 'update[参数1，类型：RoleEntity，值：(getName : 普通用户)(getKey : user)(getDescription : 普通用户)]', '2016-10-06 03:48:00');
INSERT INTO `tb_log_info` VALUES ('20', '4', 'admin@webside.com', 'update', 'update[参数1，类型：RoleEntity，值：(getName : 超级管理员)(getKey : administrator)(getDescription : 超级管理员1)]', '2016-10-06 04:00:47');
INSERT INTO `tb_log_info` VALUES ('21', '4', 'admin@webside.com', 'update', 'update[参数1，类型：RoleEntity，值：(getName : 超级管理员)(getKey : administrator)(getDescription : 超级管理员)]', '2016-10-06 04:00:56');
INSERT INTO `tb_log_info` VALUES ('22', '4', 'admin@webside.com', 'insert', 'add[参数1，类型：ResourceEntity，值：(getName : 二级菜单2)(getType : 0)(getDescription : sss)(getChildren : [])(getCreateTime : Sat Nov 19 00:43:16 CST 2016)(getParentId : 24)(getIsHide : 0)(getIsExpanded : false)(getIsLeaf : false)(getLoaded : true)(getSelected : false)(getIcon : fa  fa-bell-o)(getSourceUrl : http://www.baidu.com)(getSourceKey : test:test)]', '2016-11-19 00:43:17');
INSERT INTO `tb_log_info` VALUES ('23', '4', 'admin@webside.com', 'permission', 'permission[参数1，类型：Integer，值：][参数2，类型：String，值：(getBytes : [B@497eea04)]', '2016-11-19 02:41:41');
INSERT INTO `tb_log_info` VALUES ('24', '4', 'admin@webside.com', 'delete', 'deleteBatch[参数1，类型:String，值:(id:48)', '2016-11-19 02:42:16');
INSERT INTO `tb_log_info` VALUES ('25', '4', 'admin@webside.com', 'insert', 'add[参数1，类型：ResourceEntity，值：(getName : 二级菜单)(getType : 0)(getDescription : )(getChildren : [])(getCreateTime : Sat Nov 19 02:42:52 CST 2016)(getParentId : 24)(getIsHide : 0)(getIsExpanded : false)(getIsLeaf : false)(getLoaded : true)(getSelected : false)(getIcon : fa  fa-battery-1)(getSourceUrl : h)(getSourceKey : test)]', '2016-11-19 02:42:53');
INSERT INTO `tb_log_info` VALUES ('26', '4', 'admin@webside.com', 'permission', 'permission[参数1，类型：Integer，值：][参数2，类型：String，值：(getBytes : [B@4b51bc21)]', '2016-11-19 02:43:12');
INSERT INTO `tb_log_info` VALUES ('27', '4', 'admin@webside.com', 'delete', 'deleteBatch[参数1，类型:String，值:(id:49)', '2016-11-19 02:44:36');
INSERT INTO `tb_log_info` VALUES ('28', '4', 'admin@webside.com', 'permission', 'permission[参数1，类型：Integer，值：][参数2，类型：String，值：(getBytes : [B@519753ec)]', '2016-12-01 16:09:59');
INSERT INTO `tb_log_info` VALUES ('29', '4', 'admin@webside.com', 'permission', 'permission[参数1，类型：Integer，值：][参数2，类型：String，值：(getBytes : [B@685008c3)]', '2016-12-01 16:10:23');
INSERT INTO `tb_log_info` VALUES ('30', '4', 'admin@webside.com', 'delete', 'deleteBatch[参数1，类型:String，值:(id:33)', '2016-12-01 16:11:46');

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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='资源表';

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
INSERT INTO `tb_resource` VALUES ('30', null, '计划任务管理', 'schedule', '0', '', null, 'fa  fa-list-ol', '0', '计划任务管理', '2016-07-17 01:09:27', '2016-07-20 16:01:08');
INSERT INTO `tb_resource` VALUES ('32', '38', '添加job', 'schedule:addJob', '1', '/scheduleJob/addJobUI.html', null, null, '0', '添加任务', '2016-07-17 01:15:38', '2016-07-26 17:33:06');
INSERT INTO `tb_resource` VALUES ('34', '38', '删除job', 'schedule:deleteJob', '1', '/scheduleJob/deleteJob.html', null, null, '0', '删除任务', '2016-07-17 01:19:24', '2016-07-26 17:32:05');
INSERT INTO `tb_resource` VALUES ('35', '38', '执行job', 'schedule:executeJob', '1', '/scheduleJob/executeJob.html', null, null, '0', '立即执行一次', '2016-07-17 01:22:01', '2016-07-26 17:33:26');
INSERT INTO `tb_resource` VALUES ('36', '39', '暂停job', 'schedule:pauseJob', '1', '/scheduleJob/pauseJob.html', null, null, '0', '暂停任务', '2016-07-17 01:24:13', '2016-07-26 17:32:20');
INSERT INTO `tb_resource` VALUES ('37', '39', '恢复job', 'schedule:resumeJob', '1', '/scheduleJob/resumeJob.html', null, null, '0', '恢复任务', '2016-07-17 01:25:23', '2016-07-26 17:32:26');
INSERT INTO `tb_resource` VALUES ('38', '30', '计划中任务', 'schedule:planScheduleList', '0', '/scheduleJob/planningJobListUI.html', null, 'fa  fa-hourglass', '0', '计划中任务', '2016-07-19 18:51:54', '2016-07-26 18:02:14');
INSERT INTO `tb_resource` VALUES ('39', '30', '运行中任务', 'schedule:runScheduleList', '0', '/scheduleJob/runningJobListUI.html', null, 'fa  fa-hourglass-2', '0', '运行中任务', '2016-07-19 18:53:45', '2016-07-26 18:02:20');
INSERT INTO `tb_resource` VALUES ('40', '38', '触发器列表', 'schedule:triggerList', '1', '/scheduleJob/jobTriggerListUI.html', null, '', '0', '查看触发器列表', '2016-07-21 21:19:57', '2016-07-26 18:03:03');
INSERT INTO `tb_resource` VALUES ('41', '40', '添加trigger', 'schedule:addTrigger', '1', '/scheduleJob/addTriggerUI.html', null, null, '0', '给当前job添加trigger', '2016-07-26 19:31:07', '2016-07-26 19:34:11');
INSERT INTO `tb_resource` VALUES ('42', '38', '暂停job', 'schedule:pauseJob', '1', '/scheduleJob/pauseJob.html', null, '', '0', '暂停job', '2016-07-26 19:32:15', '2016-07-26 19:32:15');
INSERT INTO `tb_resource` VALUES ('43', '38', '恢复job', 'schedule:resumeJob', '1', '/scheduleJob/resumeJob.html', null, '', '0', '恢复job', '2016-07-26 19:32:52', '2016-07-26 19:32:52');
INSERT INTO `tb_resource` VALUES ('44', '40', '编辑trigger', 'schedule:editTrigger', '1', '/scheduleJob/editTriggerUI.html', null, '', '0', '编辑trigger', '2016-07-26 19:34:44', '2016-07-26 19:34:44');
INSERT INTO `tb_resource` VALUES ('45', '40', '删除trigger', 'schedule:deleteTrigger', '1', '/scheduleJob/deleteTrigger.html', null, null, '0', '删除trigger', '2016-07-26 19:35:23', '2016-07-26 19:36:50');
INSERT INTO `tb_resource` VALUES ('46', '40', '暂停trigger', 'schedule:pauseTrigger', '1', '/scheduleJob/pasueTrigger.html', null, '', '0', '暂停trigger', '2016-07-26 19:36:37', '2016-07-26 19:36:37');
INSERT INTO `tb_resource` VALUES ('47', '40', '恢复trigger', 'schedule:resumeTrigger', '1', '/scheduleJob/resumeTrigger.html', null, '', '0', '恢复trigger', '2016-07-26 19:37:22', '2016-07-26 19:37:22');

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
) ENGINE=InnoDB AUTO_INCREMENT=798 DEFAULT CHARSET=utf8 COMMENT='角色权限映射表';

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
INSERT INTO `tb_resources_role` VALUES ('753', '3', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('754', '2', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('755', '4', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('756', '5', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('757', '6', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('758', '9', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('759', '25', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('760', '24', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('761', '38', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('762', '30', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('763', '40', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('764', '39', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('765', '26', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('766', '1', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('767', '11', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('768', '12', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('769', '13', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('770', '14', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('771', '15', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('772', '16', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('773', '17', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('774', '18', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('775', '19', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('776', '20', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('777', '21', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('778', '7', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('779', '8', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('780', '10', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('781', '22', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('782', '28', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('783', '29', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('784', '32', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('785', '34', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('786', '35', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('788', '41', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('789', '44', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('790', '45', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('791', '46', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('792', '47', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('793', '42', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('794', '43', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('795', '36', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('796', '37', '1', '2016-12-01 16:10:23');
INSERT INTO `tb_resources_role` VALUES ('797', '27', '1', '2016-12-01 16:10:23');

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
INSERT INTO `tb_role` VALUES ('3', '普通用户', 'user', '0', '普通用户', '2016-02-28 17:09:40', '2016-10-06 03:48:00');
INSERT INTO `tb_role` VALUES ('4', '华东部研发经理', 'admin', '0', '华东区域管理1', '2016-07-05 19:07:45', '2016-10-06 03:47:49');

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
-- Table structure for tb_schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `tb_schedule_job`;
CREATE TABLE `tb_schedule_job` (
  `j_id` int(11) NOT NULL AUTO_INCREMENT,
  `j_job_name` varchar(255) DEFAULT NULL,
  `j_job_group` varchar(255) DEFAULT NULL,
  `j_job_status` varchar(20) DEFAULT NULL COMMENT 'NONE:未知\r\nNORMAL:正常无任务\r\nPAUSED:暂停\r\nCOMPLETE:完成\r\nERROR:异常\r\nBLOCKED:等待运行,阻塞\r\nDELETE:删除\r\n',
  `j_cron_expression` varchar(255) DEFAULT NULL,
  `j_job_class_name` varchar(255) DEFAULT NULL,
  `j_job_desc` varchar(255) DEFAULT NULL,
  `j_job_start` datetime DEFAULT NULL,
  `j_job_end` datetime DEFAULT NULL,
  `j_job_create_time` datetime DEFAULT NULL,
  `j_job_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`j_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_schedule_job
-- ----------------------------


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
INSERT INTO `tb_user` VALUES ('4', 'superadmin', 'admin@webside.com', 'VIlO0st6mlpQF70XwXyiGA==', '0', '0', '超级管理员', '6ca87d4b7820b5fd90bd821b8af1ecbc', '', '2016-02-15 17:17:26', '2016-10-06 03:57:03');
INSERT INTO `tb_user` VALUES ('21', 'admin', '381543724@qq.com', '2mqwiRrX3L0KPFn0gnAM8w==', '0', '0', 'admin', '5ef9553384f7bf29e5f072b1dbd3e77e', 'admin@webside.com', '2016-07-05 18:57:53', '2016-10-06 03:17:47');
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