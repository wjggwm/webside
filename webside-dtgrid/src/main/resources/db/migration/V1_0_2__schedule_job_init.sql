/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : webside

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-07-20 18:45:54
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
