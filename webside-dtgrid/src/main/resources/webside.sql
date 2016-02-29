/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : webside

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-02-29 11:22:25
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
-- Records of tb_login_info
-- ----------------------------
INSERT INTO `tb_login_info` VALUES ('1', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-11 18:08:57');
INSERT INTO `tb_login_info` VALUES ('2', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-11 18:15:23');
INSERT INTO `tb_login_info` VALUES ('3', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-11 18:16:59');
INSERT INTO `tb_login_info` VALUES ('4', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-11 18:21:54');
INSERT INTO `tb_login_info` VALUES ('5', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-11 22:17:29');
INSERT INTO `tb_login_info` VALUES ('6', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-11 23:36:01');
INSERT INTO `tb_login_info` VALUES ('7', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-11 23:36:48');
INSERT INTO `tb_login_info` VALUES ('8', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-11 23:52:09');
INSERT INTO `tb_login_info` VALUES ('9', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 00:27:05');
INSERT INTO `tb_login_info` VALUES ('10', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 01:18:27');
INSERT INTO `tb_login_info` VALUES ('11', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 01:24:55');
INSERT INTO `tb_login_info` VALUES ('12', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 01:29:50');
INSERT INTO `tb_login_info` VALUES ('13', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 02:09:42');
INSERT INTO `tb_login_info` VALUES ('14', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 09:51:26');
INSERT INTO `tb_login_info` VALUES ('15', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 09:53:52');
INSERT INTO `tb_login_info` VALUES ('16', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 10:06:03');
INSERT INTO `tb_login_info` VALUES ('17', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 10:35:14');
INSERT INTO `tb_login_info` VALUES ('18', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 11:29:26');
INSERT INTO `tb_login_info` VALUES ('19', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 11:29:47');
INSERT INTO `tb_login_info` VALUES ('20', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 13:44:18');
INSERT INTO `tb_login_info` VALUES ('21', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 13:48:20');
INSERT INTO `tb_login_info` VALUES ('22', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 14:32:37');
INSERT INTO `tb_login_info` VALUES ('23', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 14:38:10');
INSERT INTO `tb_login_info` VALUES ('24', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 15:13:45');
INSERT INTO `tb_login_info` VALUES ('25', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 15:20:02');
INSERT INTO `tb_login_info` VALUES ('26', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 15:22:33');
INSERT INTO `tb_login_info` VALUES ('27', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 15:27:53');
INSERT INTO `tb_login_info` VALUES ('28', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 15:36:39');
INSERT INTO `tb_login_info` VALUES ('29', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 16:46:55');
INSERT INTO `tb_login_info` VALUES ('30', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 21:35:51');
INSERT INTO `tb_login_info` VALUES ('31', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 21:39:17');
INSERT INTO `tb_login_info` VALUES ('32', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 21:48:23');
INSERT INTO `tb_login_info` VALUES ('33', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-12 22:22:16');
INSERT INTO `tb_login_info` VALUES ('34', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-13 00:17:28');
INSERT INTO `tb_login_info` VALUES ('35', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-13 00:20:38');
INSERT INTO `tb_login_info` VALUES ('36', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-13 00:22:53');
INSERT INTO `tb_login_info` VALUES ('37', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-13 00:27:47');
INSERT INTO `tb_login_info` VALUES ('38', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-13 15:00:32');
INSERT INTO `tb_login_info` VALUES ('39', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-13 15:02:58');
INSERT INTO `tb_login_info` VALUES ('40', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-13 15:21:44');
INSERT INTO `tb_login_info` VALUES ('41', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-13 17:31:51');
INSERT INTO `tb_login_info` VALUES ('42', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-13 17:47:18');
INSERT INTO `tb_login_info` VALUES ('43', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-14 09:49:51');
INSERT INTO `tb_login_info` VALUES ('44', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-14 10:31:11');
INSERT INTO `tb_login_info` VALUES ('45', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-14 11:05:06');
INSERT INTO `tb_login_info` VALUES ('46', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-14 11:13:52');
INSERT INTO `tb_login_info` VALUES ('47', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-14 11:20:49');
INSERT INTO `tb_login_info` VALUES ('48', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-14 13:58:44');
INSERT INTO `tb_login_info` VALUES ('49', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-14 14:24:06');
INSERT INTO `tb_login_info` VALUES ('50', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-14 14:42:25');
INSERT INTO `tb_login_info` VALUES ('51', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-14 14:52:52');
INSERT INTO `tb_login_info` VALUES ('52', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-14 15:05:08');
INSERT INTO `tb_login_info` VALUES ('53', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-14 15:16:37');
INSERT INTO `tb_login_info` VALUES ('54', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-14 15:20:03');
INSERT INTO `tb_login_info` VALUES ('55', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-14 15:23:18');
INSERT INTO `tb_login_info` VALUES ('56', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-14 16:54:05');
INSERT INTO `tb_login_info` VALUES ('57', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-15 09:56:53');
INSERT INTO `tb_login_info` VALUES ('58', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-15 10:20:19');
INSERT INTO `tb_login_info` VALUES ('59', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-15 10:24:52');
INSERT INTO `tb_login_info` VALUES ('60', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-15 11:00:05');
INSERT INTO `tb_login_info` VALUES ('61', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-15 11:27:42');
INSERT INTO `tb_login_info` VALUES ('62', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-15 13:55:47');
INSERT INTO `tb_login_info` VALUES ('63', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-15 14:02:09');
INSERT INTO `tb_login_info` VALUES ('64', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-15 14:20:43');
INSERT INTO `tb_login_info` VALUES ('65', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-15 14:29:50');
INSERT INTO `tb_login_info` VALUES ('66', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-15 14:34:56');
INSERT INTO `tb_login_info` VALUES ('67', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-15 15:34:04');
INSERT INTO `tb_login_info` VALUES ('68', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-15 15:40:21');
INSERT INTO `tb_login_info` VALUES ('69', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-15 16:00:41');
INSERT INTO `tb_login_info` VALUES ('70', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-15 16:33:35');
INSERT INTO `tb_login_info` VALUES ('71', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-17 15:18:39');
INSERT INTO `tb_login_info` VALUES ('72', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 10:28:54');
INSERT INTO `tb_login_info` VALUES ('73', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 10:50:13');
INSERT INTO `tb_login_info` VALUES ('74', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 13:40:25');
INSERT INTO `tb_login_info` VALUES ('75', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 14:05:53');
INSERT INTO `tb_login_info` VALUES ('76', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 14:43:10');
INSERT INTO `tb_login_info` VALUES ('77', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 15:13:01');
INSERT INTO `tb_login_info` VALUES ('78', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 15:24:55');
INSERT INTO `tb_login_info` VALUES ('79', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 16:38:08');
INSERT INTO `tb_login_info` VALUES ('80', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 16:41:45');
INSERT INTO `tb_login_info` VALUES ('81', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 16:52:44');
INSERT INTO `tb_login_info` VALUES ('82', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 17:01:01');
INSERT INTO `tb_login_info` VALUES ('83', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 17:11:49');
INSERT INTO `tb_login_info` VALUES ('84', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 17:19:19');
INSERT INTO `tb_login_info` VALUES ('85', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 20:11:07');
INSERT INTO `tb_login_info` VALUES ('86', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 20:23:56');
INSERT INTO `tb_login_info` VALUES ('87', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 20:30:43');
INSERT INTO `tb_login_info` VALUES ('88', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 20:51:31');
INSERT INTO `tb_login_info` VALUES ('89', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 22:38:08');
INSERT INTO `tb_login_info` VALUES ('90', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-18 23:00:54');
INSERT INTO `tb_login_info` VALUES ('91', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-19 01:47:15');
INSERT INTO `tb_login_info` VALUES ('92', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-19 01:50:18');
INSERT INTO `tb_login_info` VALUES ('93', '7', 'ggao_knowology@163.com', '127.0.0.1', '2016-01-19 01:56:56');
INSERT INTO `tb_login_info` VALUES ('94', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-19 01:58:07');
INSERT INTO `tb_login_info` VALUES ('95', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-19 02:41:33');
INSERT INTO `tb_login_info` VALUES ('96', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-19 02:52:02');
INSERT INTO `tb_login_info` VALUES ('97', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-19 09:39:17');
INSERT INTO `tb_login_info` VALUES ('98', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-19 11:01:21');
INSERT INTO `tb_login_info` VALUES ('99', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-19 16:47:02');
INSERT INTO `tb_login_info` VALUES ('100', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-19 17:27:17');
INSERT INTO `tb_login_info` VALUES ('101', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-19 17:28:53');
INSERT INTO `tb_login_info` VALUES ('102', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-19 18:01:09');
INSERT INTO `tb_login_info` VALUES ('103', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-19 20:58:54');
INSERT INTO `tb_login_info` VALUES ('104', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-19 22:15:41');
INSERT INTO `tb_login_info` VALUES ('105', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-19 22:57:12');
INSERT INTO `tb_login_info` VALUES ('106', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-19 22:57:40');
INSERT INTO `tb_login_info` VALUES ('107', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-19 23:48:58');
INSERT INTO `tb_login_info` VALUES ('108', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-19 23:59:03');
INSERT INTO `tb_login_info` VALUES ('109', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-20 00:05:07');
INSERT INTO `tb_login_info` VALUES ('110', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-20 00:29:48');
INSERT INTO `tb_login_info` VALUES ('111', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-20 01:43:28');
INSERT INTO `tb_login_info` VALUES ('112', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-20 01:48:19');
INSERT INTO `tb_login_info` VALUES ('113', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-20 09:59:35');
INSERT INTO `tb_login_info` VALUES ('114', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-20 10:41:46');
INSERT INTO `tb_login_info` VALUES ('115', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-20 10:59:30');
INSERT INTO `tb_login_info` VALUES ('116', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-20 13:53:07');
INSERT INTO `tb_login_info` VALUES ('117', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-20 15:29:25');
INSERT INTO `tb_login_info` VALUES ('118', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-20 23:16:05');
INSERT INTO `tb_login_info` VALUES ('119', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-20 23:20:05');
INSERT INTO `tb_login_info` VALUES ('120', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-20 23:31:30');
INSERT INTO `tb_login_info` VALUES ('121', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-20 23:36:03');
INSERT INTO `tb_login_info` VALUES ('122', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 00:00:12');
INSERT INTO `tb_login_info` VALUES ('123', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 00:00:39');
INSERT INTO `tb_login_info` VALUES ('124', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 00:01:55');
INSERT INTO `tb_login_info` VALUES ('125', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 00:08:10');
INSERT INTO `tb_login_info` VALUES ('126', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 01:03:54');
INSERT INTO `tb_login_info` VALUES ('127', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 10:03:41');
INSERT INTO `tb_login_info` VALUES ('128', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 10:31:54');
INSERT INTO `tb_login_info` VALUES ('129', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 11:08:35');
INSERT INTO `tb_login_info` VALUES ('130', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 14:45:48');
INSERT INTO `tb_login_info` VALUES ('131', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 14:56:16');
INSERT INTO `tb_login_info` VALUES ('132', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 15:39:54');
INSERT INTO `tb_login_info` VALUES ('133', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 15:41:19');
INSERT INTO `tb_login_info` VALUES ('134', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 15:49:14');
INSERT INTO `tb_login_info` VALUES ('135', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 16:09:41');
INSERT INTO `tb_login_info` VALUES ('136', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 16:11:05');
INSERT INTO `tb_login_info` VALUES ('137', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 16:22:03');
INSERT INTO `tb_login_info` VALUES ('138', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 16:47:37');
INSERT INTO `tb_login_info` VALUES ('139', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 18:01:53');
INSERT INTO `tb_login_info` VALUES ('140', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 18:09:31');
INSERT INTO `tb_login_info` VALUES ('141', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 18:56:42');
INSERT INTO `tb_login_info` VALUES ('142', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 19:04:26');
INSERT INTO `tb_login_info` VALUES ('143', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 19:56:05');
INSERT INTO `tb_login_info` VALUES ('144', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-21 22:44:09');
INSERT INTO `tb_login_info` VALUES ('145', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-22 00:05:16');
INSERT INTO `tb_login_info` VALUES ('146', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-22 00:16:29');
INSERT INTO `tb_login_info` VALUES ('147', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-22 00:36:59');
INSERT INTO `tb_login_info` VALUES ('148', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-22 01:57:15');
INSERT INTO `tb_login_info` VALUES ('149', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-22 02:28:29');
INSERT INTO `tb_login_info` VALUES ('150', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-22 02:36:09');
INSERT INTO `tb_login_info` VALUES ('151', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-22 02:38:42');
INSERT INTO `tb_login_info` VALUES ('152', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-22 10:15:33');
INSERT INTO `tb_login_info` VALUES ('153', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-22 10:16:07');
INSERT INTO `tb_login_info` VALUES ('154', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-22 11:02:10');
INSERT INTO `tb_login_info` VALUES ('155', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-22 11:08:32');
INSERT INTO `tb_login_info` VALUES ('156', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-22 15:03:51');
INSERT INTO `tb_login_info` VALUES ('157', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-22 15:48:27');
INSERT INTO `tb_login_info` VALUES ('158', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-22 16:40:11');
INSERT INTO `tb_login_info` VALUES ('159', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-25 13:48:06');
INSERT INTO `tb_login_info` VALUES ('160', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-25 15:25:02');
INSERT INTO `tb_login_info` VALUES ('161', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-25 16:05:48');
INSERT INTO `tb_login_info` VALUES ('162', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-25 17:11:15');
INSERT INTO `tb_login_info` VALUES ('163', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-25 17:16:42');
INSERT INTO `tb_login_info` VALUES ('164', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-25 17:20:51');
INSERT INTO `tb_login_info` VALUES ('165', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-25 17:27:36');
INSERT INTO `tb_login_info` VALUES ('166', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-25 17:33:29');
INSERT INTO `tb_login_info` VALUES ('167', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-25 17:35:37');
INSERT INTO `tb_login_info` VALUES ('168', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-25 17:47:40');
INSERT INTO `tb_login_info` VALUES ('169', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-25 18:01:20');
INSERT INTO `tb_login_info` VALUES ('170', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-26 15:16:29');
INSERT INTO `tb_login_info` VALUES ('171', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-28 17:28:56');
INSERT INTO `tb_login_info` VALUES ('172', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-29 12:27:43');
INSERT INTO `tb_login_info` VALUES ('173', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-29 12:43:09');
INSERT INTO `tb_login_info` VALUES ('174', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-29 12:54:51');
INSERT INTO `tb_login_info` VALUES ('175', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-29 13:16:43');
INSERT INTO `tb_login_info` VALUES ('176', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-29 13:59:17');
INSERT INTO `tb_login_info` VALUES ('177', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-29 14:54:38');
INSERT INTO `tb_login_info` VALUES ('178', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-29 16:10:06');
INSERT INTO `tb_login_info` VALUES ('179', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-29 16:23:39');
INSERT INTO `tb_login_info` VALUES ('180', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-29 17:40:14');
INSERT INTO `tb_login_info` VALUES ('181', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-29 22:49:47');
INSERT INTO `tb_login_info` VALUES ('182', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-29 23:54:46');
INSERT INTO `tb_login_info` VALUES ('183', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-30 02:28:10');
INSERT INTO `tb_login_info` VALUES ('184', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-30 15:00:40');
INSERT INTO `tb_login_info` VALUES ('185', '2', 'wjggwm@126.com', '127.0.0.1', '2016-01-30 15:02:32');
INSERT INTO `tb_login_info` VALUES ('186', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-01 11:03:11');
INSERT INTO `tb_login_info` VALUES ('187', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-01 12:02:21');
INSERT INTO `tb_login_info` VALUES ('188', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-01 12:02:45');
INSERT INTO `tb_login_info` VALUES ('189', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-01 17:15:11');
INSERT INTO `tb_login_info` VALUES ('190', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-01 17:50:41');
INSERT INTO `tb_login_info` VALUES ('191', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-01 17:51:08');
INSERT INTO `tb_login_info` VALUES ('192', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-01 18:00:13');
INSERT INTO `tb_login_info` VALUES ('193', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-01 18:00:51');
INSERT INTO `tb_login_info` VALUES ('194', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-02 10:45:40');
INSERT INTO `tb_login_info` VALUES ('195', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-02 10:58:51');
INSERT INTO `tb_login_info` VALUES ('196', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-04 15:03:40');
INSERT INTO `tb_login_info` VALUES ('197', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-04 15:06:17');
INSERT INTO `tb_login_info` VALUES ('198', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-04 15:16:55');
INSERT INTO `tb_login_info` VALUES ('199', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-04 15:26:32');
INSERT INTO `tb_login_info` VALUES ('200', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-04 15:30:52');
INSERT INTO `tb_login_info` VALUES ('201', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-04 15:39:10');
INSERT INTO `tb_login_info` VALUES ('202', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-04 15:51:30');
INSERT INTO `tb_login_info` VALUES ('203', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-04 17:38:00');
INSERT INTO `tb_login_info` VALUES ('204', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 10:29:16');
INSERT INTO `tb_login_info` VALUES ('205', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 11:19:58');
INSERT INTO `tb_login_info` VALUES ('206', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 12:05:59');
INSERT INTO `tb_login_info` VALUES ('207', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 12:07:39');
INSERT INTO `tb_login_info` VALUES ('208', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 13:45:15');
INSERT INTO `tb_login_info` VALUES ('209', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 13:50:38');
INSERT INTO `tb_login_info` VALUES ('210', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 14:06:02');
INSERT INTO `tb_login_info` VALUES ('211', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 14:31:25');
INSERT INTO `tb_login_info` VALUES ('212', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 14:34:25');
INSERT INTO `tb_login_info` VALUES ('213', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 14:52:23');
INSERT INTO `tb_login_info` VALUES ('214', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 15:18:40');
INSERT INTO `tb_login_info` VALUES ('215', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 15:25:20');
INSERT INTO `tb_login_info` VALUES ('216', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 15:34:12');
INSERT INTO `tb_login_info` VALUES ('217', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 15:39:17');
INSERT INTO `tb_login_info` VALUES ('218', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 15:47:51');
INSERT INTO `tb_login_info` VALUES ('219', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 16:22:59');
INSERT INTO `tb_login_info` VALUES ('220', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 16:28:47');
INSERT INTO `tb_login_info` VALUES ('221', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 16:31:04');
INSERT INTO `tb_login_info` VALUES ('222', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 17:06:11');
INSERT INTO `tb_login_info` VALUES ('223', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 17:28:47');
INSERT INTO `tb_login_info` VALUES ('224', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-05 17:59:27');
INSERT INTO `tb_login_info` VALUES ('225', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-06 09:54:10');
INSERT INTO `tb_login_info` VALUES ('226', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-06 10:23:51');
INSERT INTO `tb_login_info` VALUES ('227', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-06 12:14:39');
INSERT INTO `tb_login_info` VALUES ('228', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-06 12:26:23');
INSERT INTO `tb_login_info` VALUES ('229', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-06 12:44:48');
INSERT INTO `tb_login_info` VALUES ('230', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-06 12:50:12');
INSERT INTO `tb_login_info` VALUES ('231', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-06 13:02:43');
INSERT INTO `tb_login_info` VALUES ('232', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-06 13:51:21');
INSERT INTO `tb_login_info` VALUES ('233', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-06 14:15:44');
INSERT INTO `tb_login_info` VALUES ('234', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-06 14:23:31');
INSERT INTO `tb_login_info` VALUES ('235', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-06 14:57:46');
INSERT INTO `tb_login_info` VALUES ('236', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-06 15:06:31');
INSERT INTO `tb_login_info` VALUES ('237', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-06 15:46:46');
INSERT INTO `tb_login_info` VALUES ('238', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-06 16:09:48');
INSERT INTO `tb_login_info` VALUES ('239', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-06 16:23:23');
INSERT INTO `tb_login_info` VALUES ('240', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-06 17:25:18');
INSERT INTO `tb_login_info` VALUES ('241', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-06 17:59:59');
INSERT INTO `tb_login_info` VALUES ('242', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-15 11:09:27');
INSERT INTO `tb_login_info` VALUES ('243', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-15 14:30:24');
INSERT INTO `tb_login_info` VALUES ('244', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-15 15:45:39');
INSERT INTO `tb_login_info` VALUES ('245', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-15 16:20:08');
INSERT INTO `tb_login_info` VALUES ('246', '2', 'wjggwm@126.com', '127.0.0.1', '2016-02-15 16:58:39');
INSERT INTO `tb_login_info` VALUES ('247', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-15 17:17:47');
INSERT INTO `tb_login_info` VALUES ('248', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-15 17:20:29');
INSERT INTO `tb_login_info` VALUES ('249', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-15 17:37:20');
INSERT INTO `tb_login_info` VALUES ('250', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-15 17:47:14');
INSERT INTO `tb_login_info` VALUES ('251', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-15 17:49:45');
INSERT INTO `tb_login_info` VALUES ('252', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-15 17:52:48');
INSERT INTO `tb_login_info` VALUES ('253', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-15 17:58:28');
INSERT INTO `tb_login_info` VALUES ('254', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-16 09:38:55');
INSERT INTO `tb_login_info` VALUES ('255', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-16 10:06:51');
INSERT INTO `tb_login_info` VALUES ('256', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-16 10:22:17');
INSERT INTO `tb_login_info` VALUES ('257', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-16 12:18:26');
INSERT INTO `tb_login_info` VALUES ('258', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-16 12:20:13');
INSERT INTO `tb_login_info` VALUES ('259', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-16 12:59:18');
INSERT INTO `tb_login_info` VALUES ('260', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-16 14:33:06');
INSERT INTO `tb_login_info` VALUES ('261', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-16 15:28:22');
INSERT INTO `tb_login_info` VALUES ('262', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-16 15:40:10');
INSERT INTO `tb_login_info` VALUES ('263', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-17 16:04:59');
INSERT INTO `tb_login_info` VALUES ('264', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-17 16:42:02');
INSERT INTO `tb_login_info` VALUES ('265', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-17 17:20:41');
INSERT INTO `tb_login_info` VALUES ('266', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-17 17:25:27');
INSERT INTO `tb_login_info` VALUES ('267', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-18 10:41:58');
INSERT INTO `tb_login_info` VALUES ('268', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-18 11:09:27');
INSERT INTO `tb_login_info` VALUES ('269', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-18 14:15:58');
INSERT INTO `tb_login_info` VALUES ('270', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-18 14:18:52');
INSERT INTO `tb_login_info` VALUES ('271', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-18 14:23:57');
INSERT INTO `tb_login_info` VALUES ('272', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-18 16:35:53');
INSERT INTO `tb_login_info` VALUES ('273', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-18 16:47:30');
INSERT INTO `tb_login_info` VALUES ('274', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-18 16:58:07');
INSERT INTO `tb_login_info` VALUES ('275', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-18 17:35:41');
INSERT INTO `tb_login_info` VALUES ('276', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-18 17:36:24');
INSERT INTO `tb_login_info` VALUES ('277', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-18 17:49:25');
INSERT INTO `tb_login_info` VALUES ('278', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-18 17:56:55');
INSERT INTO `tb_login_info` VALUES ('279', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 10:10:58');
INSERT INTO `tb_login_info` VALUES ('280', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 10:19:47');
INSERT INTO `tb_login_info` VALUES ('281', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 10:23:14');
INSERT INTO `tb_login_info` VALUES ('282', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 10:30:17');
INSERT INTO `tb_login_info` VALUES ('283', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 10:53:22');
INSERT INTO `tb_login_info` VALUES ('284', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 10:58:33');
INSERT INTO `tb_login_info` VALUES ('285', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 12:21:07');
INSERT INTO `tb_login_info` VALUES ('286', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 12:44:56');
INSERT INTO `tb_login_info` VALUES ('287', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 13:25:22');
INSERT INTO `tb_login_info` VALUES ('288', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 13:35:50');
INSERT INTO `tb_login_info` VALUES ('289', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 14:11:06');
INSERT INTO `tb_login_info` VALUES ('290', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 14:17:23');
INSERT INTO `tb_login_info` VALUES ('291', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 14:29:40');
INSERT INTO `tb_login_info` VALUES ('292', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 14:45:44');
INSERT INTO `tb_login_info` VALUES ('293', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 16:28:29');
INSERT INTO `tb_login_info` VALUES ('294', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 16:51:41');
INSERT INTO `tb_login_info` VALUES ('295', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 17:13:24');
INSERT INTO `tb_login_info` VALUES ('296', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 17:24:13');
INSERT INTO `tb_login_info` VALUES ('297', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 17:33:11');
INSERT INTO `tb_login_info` VALUES ('298', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 17:40:38');
INSERT INTO `tb_login_info` VALUES ('299', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-19 18:06:22');
INSERT INTO `tb_login_info` VALUES ('300', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-21 13:02:27');
INSERT INTO `tb_login_info` VALUES ('301', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-21 13:09:50');
INSERT INTO `tb_login_info` VALUES ('302', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-21 13:11:30');
INSERT INTO `tb_login_info` VALUES ('303', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-22 00:02:01');
INSERT INTO `tb_login_info` VALUES ('304', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-22 00:13:45');
INSERT INTO `tb_login_info` VALUES ('305', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-22 01:27:08');
INSERT INTO `tb_login_info` VALUES ('306', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-22 01:45:17');
INSERT INTO `tb_login_info` VALUES ('307', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-22 01:48:14');
INSERT INTO `tb_login_info` VALUES ('308', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-22 02:58:33');
INSERT INTO `tb_login_info` VALUES ('309', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-22 05:18:08');
INSERT INTO `tb_login_info` VALUES ('310', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-22 17:58:04');
INSERT INTO `tb_login_info` VALUES ('311', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-22 21:21:10');
INSERT INTO `tb_login_info` VALUES ('312', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-22 23:17:48');
INSERT INTO `tb_login_info` VALUES ('313', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-22 23:26:50');
INSERT INTO `tb_login_info` VALUES ('314', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-22 23:53:51');
INSERT INTO `tb_login_info` VALUES ('315', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-22 23:54:59');
INSERT INTO `tb_login_info` VALUES ('316', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-23 00:12:32');
INSERT INTO `tb_login_info` VALUES ('317', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-23 00:15:38');
INSERT INTO `tb_login_info` VALUES ('318', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-23 00:16:15');
INSERT INTO `tb_login_info` VALUES ('319', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-23 00:17:58');
INSERT INTO `tb_login_info` VALUES ('320', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-23 00:23:49');
INSERT INTO `tb_login_info` VALUES ('321', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-23 00:45:25');
INSERT INTO `tb_login_info` VALUES ('322', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-23 00:58:27');
INSERT INTO `tb_login_info` VALUES ('323', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-23 01:00:11');
INSERT INTO `tb_login_info` VALUES ('324', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-23 01:42:40');
INSERT INTO `tb_login_info` VALUES ('325', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-23 01:53:42');
INSERT INTO `tb_login_info` VALUES ('326', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-24 09:52:53');
INSERT INTO `tb_login_info` VALUES ('327', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-24 09:55:49');
INSERT INTO `tb_login_info` VALUES ('328', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-24 13:31:07');
INSERT INTO `tb_login_info` VALUES ('329', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-24 13:42:31');
INSERT INTO `tb_login_info` VALUES ('330', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-24 15:36:39');
INSERT INTO `tb_login_info` VALUES ('331', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-24 15:52:22');
INSERT INTO `tb_login_info` VALUES ('332', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-24 16:06:47');
INSERT INTO `tb_login_info` VALUES ('333', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-24 16:07:15');
INSERT INTO `tb_login_info` VALUES ('334', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-24 16:28:45');
INSERT INTO `tb_login_info` VALUES ('335', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-24 16:42:39');
INSERT INTO `tb_login_info` VALUES ('336', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-24 17:00:51');
INSERT INTO `tb_login_info` VALUES ('337', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-24 17:06:52');
INSERT INTO `tb_login_info` VALUES ('338', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-24 17:43:52');
INSERT INTO `tb_login_info` VALUES ('339', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-24 18:00:51');
INSERT INTO `tb_login_info` VALUES ('340', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 09:28:32');
INSERT INTO `tb_login_info` VALUES ('341', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 09:37:23');
INSERT INTO `tb_login_info` VALUES ('342', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 09:43:23');
INSERT INTO `tb_login_info` VALUES ('343', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 09:43:47');
INSERT INTO `tb_login_info` VALUES ('344', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 09:58:08');
INSERT INTO `tb_login_info` VALUES ('345', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 10:07:38');
INSERT INTO `tb_login_info` VALUES ('346', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 10:14:37');
INSERT INTO `tb_login_info` VALUES ('347', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 10:54:15');
INSERT INTO `tb_login_info` VALUES ('348', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 11:12:08');
INSERT INTO `tb_login_info` VALUES ('349', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 12:05:38');
INSERT INTO `tb_login_info` VALUES ('350', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 12:12:44');
INSERT INTO `tb_login_info` VALUES ('351', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 12:44:57');
INSERT INTO `tb_login_info` VALUES ('352', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 13:11:45');
INSERT INTO `tb_login_info` VALUES ('353', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 13:16:18');
INSERT INTO `tb_login_info` VALUES ('354', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 13:25:02');
INSERT INTO `tb_login_info` VALUES ('355', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 14:11:49');
INSERT INTO `tb_login_info` VALUES ('356', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 14:23:27');
INSERT INTO `tb_login_info` VALUES ('357', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 14:46:35');
INSERT INTO `tb_login_info` VALUES ('358', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 14:49:48');
INSERT INTO `tb_login_info` VALUES ('359', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 15:30:18');
INSERT INTO `tb_login_info` VALUES ('360', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 17:02:11');
INSERT INTO `tb_login_info` VALUES ('361', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-25 18:07:16');
INSERT INTO `tb_login_info` VALUES ('362', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-26 12:05:45');
INSERT INTO `tb_login_info` VALUES ('363', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-26 12:31:44');
INSERT INTO `tb_login_info` VALUES ('364', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-26 12:56:36');
INSERT INTO `tb_login_info` VALUES ('365', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-26 15:31:22');
INSERT INTO `tb_login_info` VALUES ('366', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-26 15:32:55');
INSERT INTO `tb_login_info` VALUES ('367', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-26 17:26:09');
INSERT INTO `tb_login_info` VALUES ('368', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-26 17:27:21');
INSERT INTO `tb_login_info` VALUES ('369', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-26 17:47:43');
INSERT INTO `tb_login_info` VALUES ('370', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-26 22:01:39');
INSERT INTO `tb_login_info` VALUES ('371', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-26 22:24:52');
INSERT INTO `tb_login_info` VALUES ('372', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-26 22:28:35');
INSERT INTO `tb_login_info` VALUES ('373', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-26 22:36:45');
INSERT INTO `tb_login_info` VALUES ('374', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-26 22:45:36');
INSERT INTO `tb_login_info` VALUES ('375', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-26 23:02:58');
INSERT INTO `tb_login_info` VALUES ('376', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-26 23:13:18');
INSERT INTO `tb_login_info` VALUES ('377', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-26 23:14:23');
INSERT INTO `tb_login_info` VALUES ('378', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-26 23:43:41');
INSERT INTO `tb_login_info` VALUES ('379', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-26 23:58:06');
INSERT INTO `tb_login_info` VALUES ('380', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-27 00:26:28');
INSERT INTO `tb_login_info` VALUES ('381', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-27 01:01:17');
INSERT INTO `tb_login_info` VALUES ('382', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-27 01:09:40');
INSERT INTO `tb_login_info` VALUES ('383', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-27 22:12:21');
INSERT INTO `tb_login_info` VALUES ('384', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-27 22:53:11');
INSERT INTO `tb_login_info` VALUES ('385', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-27 23:10:56');
INSERT INTO `tb_login_info` VALUES ('386', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-27 23:13:02');
INSERT INTO `tb_login_info` VALUES ('387', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-27 23:28:39');
INSERT INTO `tb_login_info` VALUES ('388', '6', '381543724@qq.com', '127.0.0.1', '2016-02-27 23:34:03');
INSERT INTO `tb_login_info` VALUES ('389', '6', '381543724@qq.com', '127.0.0.1', '2016-02-27 23:35:02');
INSERT INTO `tb_login_info` VALUES ('390', '6', '381543724@qq.com', '127.0.0.1', '2016-02-27 23:39:58');
INSERT INTO `tb_login_info` VALUES ('391', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-27 23:53:30');
INSERT INTO `tb_login_info` VALUES ('392', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-28 00:08:34');
INSERT INTO `tb_login_info` VALUES ('393', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-28 00:13:03');
INSERT INTO `tb_login_info` VALUES ('394', '6', '381543724@qq.com', '127.0.0.1', '2016-02-28 00:20:02');
INSERT INTO `tb_login_info` VALUES ('395', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-28 00:21:13');
INSERT INTO `tb_login_info` VALUES ('396', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-28 00:28:26');
INSERT INTO `tb_login_info` VALUES ('397', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-28 00:28:54');
INSERT INTO `tb_login_info` VALUES ('398', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-28 15:17:26');
INSERT INTO `tb_login_info` VALUES ('399', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-28 17:02:30');
INSERT INTO `tb_login_info` VALUES ('400', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-28 17:35:52');
INSERT INTO `tb_login_info` VALUES ('401', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-28 17:40:53');
INSERT INTO `tb_login_info` VALUES ('402', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-28 17:59:12');
INSERT INTO `tb_login_info` VALUES ('403', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-28 18:14:31');
INSERT INTO `tb_login_info` VALUES ('404', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-28 18:34:32');
INSERT INTO `tb_login_info` VALUES ('405', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-28 18:40:16');
INSERT INTO `tb_login_info` VALUES ('406', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-28 18:46:51');
INSERT INTO `tb_login_info` VALUES ('407', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-28 18:53:58');
INSERT INTO `tb_login_info` VALUES ('408', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-28 18:56:30');
INSERT INTO `tb_login_info` VALUES ('409', '9', '254813870@qq.com', '127.0.0.1', '2016-02-28 19:00:03');
INSERT INTO `tb_login_info` VALUES ('410', '4', 'wjggwm@126.com', '127.0.0.1', '2016-02-28 19:45:46');
INSERT INTO `tb_login_info` VALUES ('411', '10', '381543724@qq.com', '127.0.0.1', '2016-02-28 20:10:34');

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
  `s_update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of tb_resource
-- ----------------------------
INSERT INTO `tb_resource` VALUES ('1', null, '控制台', 'desktop', '0', '/welcome.jsp', '1', 'fa fa-tachometer', '0', '控制台', '2016-01-12 17:08:55', '2016-01-21 11:12:49');
INSERT INTO `tb_resource` VALUES ('2', null, '系统基础管理', 'system', '0', '', '1', 'fa fa-list', '0', '系统基础管理', '2016-01-05 12:11:12', '2016-02-25 14:07:46');
INSERT INTO `tb_resource` VALUES ('3', '2', '用户管理', 'system:user', '0', '/user/listUI.html', '2', '', '0', '用户管理', '2016-01-08 12:37:10', '2016-01-22 11:06:59');
INSERT INTO `tb_resource` VALUES ('4', '2', '角色管理', 'system:role', '0', '/role/listUI.html', '2', '', '0', '角色管理', '2016-01-11 22:51:07', '2016-01-22 11:07:04');
INSERT INTO `tb_resource` VALUES ('5', '2', '资源管理', 'system:resource', '0', '/resource/listUI.html', '2', '', '0', '资源管理', '2016-01-11 22:51:55', '2016-01-22 11:07:10');
INSERT INTO `tb_resource` VALUES ('6', null, '系统监控管理', 'monitor', '0', '', '1', 'fa fa-pencil-square-o', '0', '系统监控管理', '2016-01-05 12:11:12', '2016-02-25 14:07:48');
INSERT INTO `tb_resource` VALUES ('7', '6', '实时监控', 'monitor:realtime', '0', '/role/listUI.html', '2', '', '0', '实时监控', '2016-01-05 12:11:12', '2016-01-22 11:05:50');
INSERT INTO `tb_resource` VALUES ('8', '6', '告警列表', 'monitor:warning', '0', '/role/listUI.html', '2', '', '0', '告警列表', '2016-01-11 22:45:27', '2016-01-22 11:05:55');
INSERT INTO `tb_resource` VALUES ('9', null, '登录信息管理', 'logininfo', '0', '', '1', 'fa fa-tag', '0', '登录信息管理', '2016-01-11 22:46:39', '2016-02-25 14:07:51');
INSERT INTO `tb_resource` VALUES ('10', '9', '用户登录信息', 'logininfo:user', '0', '/loginInfo/listUI.html', '2', '', '0', '用户登录信息', '2016-01-11 22:47:41', '2016-01-22 11:06:10');
INSERT INTO `tb_resource` VALUES ('11', '3', '添加', 'user:add', '1', '/user/add.html', '3', '', '0', '添加用户', '2016-01-22 00:18:40', '2016-01-22 11:06:13');
INSERT INTO `tb_resource` VALUES ('12', '3', '编辑', 'user:edit', '1', '/user/edit.html', '3', '', '0', '编辑用户', '2016-01-22 00:18:40', '2016-01-22 11:06:22');
INSERT INTO `tb_resource` VALUES ('13', '3', '删除', 'user:deleteBatch', '1', '/user/deleteBatch.html', null, null, '0', '删除用户', '2016-02-05 15:26:32', '2016-02-25 15:27:51');
INSERT INTO `tb_resource` VALUES ('14', '3', '重置密码', 'user:resetPassword', '1', '/user/resetPassword.html', null, null, '0', '重置密码', '2016-02-27 23:55:13', '0000-00-00 00:00:00');
INSERT INTO `tb_resource` VALUES ('15', '4', '添加', 'role:add', '1', '/role/add.html', null, null, '0', '添加', '2016-02-27 23:56:52', '0000-00-00 00:00:00');
INSERT INTO `tb_resource` VALUES ('16', '4', '编辑', 'role:edit', '1', '/role/edit.html', null, null, '0', '编辑', '2016-02-27 23:57:35', '0000-00-00 00:00:00');
INSERT INTO `tb_resource` VALUES ('17', '4', '删除', 'role:deleteBatch', '1', '/role/deleteBatch.html ', null, null, '0', '删除', '2016-02-27 23:58:02', '0000-00-00 00:00:00');
INSERT INTO `tb_resource` VALUES ('18', '4', '分配权限', 'role:permission', '1', '/role/permission.html', null, null, '0', '分配权限', '2016-02-27 23:59:20', '0000-00-00 00:00:00');
INSERT INTO `tb_resource` VALUES ('19', '5', '添加', 'resource:add', '1', '/resource/add.html', null, null, '0', '添加', '2016-02-28 00:01:15', '0000-00-00 00:00:00');
INSERT INTO `tb_resource` VALUES ('20', '5', '编辑', 'resource:edit', '1', '/resource/edit.html', null, null, '0', '编辑', '2016-02-28 00:02:01', '0000-00-00 00:00:00');
INSERT INTO `tb_resource` VALUES ('21', '5', '删除', 'resource:deleteBatch', '1', '/resource/deleteBatch.html', null, null, '0', '删除', '2016-02-28 00:03:03', '0000-00-00 00:00:00');

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
