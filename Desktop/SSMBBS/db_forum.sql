/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : db_forum

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-09-07 22:49:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_board`
-- ----------------------------
DROP TABLE IF EXISTS `t_board`;
CREATE TABLE `t_board` (
  `board_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '论坛板块id',
  `board_name` varchar(150) NOT NULL DEFAULT '' COMMENT '论坛板块名称',
  `board_desc` varchar(300) NOT NULL DEFAULT '' COMMENT '论坛板块描述',
  `board_post_num` int(10) NOT NULL DEFAULT '0' COMMENT '帖子数目',
  PRIMARY KEY (`board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_board
-- ----------------------------
INSERT INTO `t_board` VALUES ('1', '学习天地', '学习和交流', '3');
INSERT INTO `t_board` VALUES ('2', 'javaweb', 'java 框架整合知识', '2');
INSERT INTO `t_board` VALUES ('3', '微服务架构', 'spring boot 等', '0');
INSERT INTO `t_board` VALUES ('4', '数据库', 'mysql等', '0');
INSERT INTO `t_board` VALUES ('5', '前端框架', 'html5\\css3等', '0');

-- ----------------------------
-- Table structure for `t_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log` (
  `login_log_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户名',
  `login_ip` varchar(30) NOT NULL DEFAULT '' COMMENT '登录IP',
  `login_datetime` datetime NOT NULL COMMENT '登录时间',
  PRIMARY KEY (`login_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_login_log
-- ----------------------------
INSERT INTO `t_login_log` VALUES ('1', '11184629', '127.0.0.1', '2017-09-18 17:44:39');
INSERT INTO `t_login_log` VALUES ('2', '11184629', '127.0.0.1', '2017-09-18 17:45:04');
INSERT INTO `t_login_log` VALUES ('3', 'admin', '127.0.0.1', '2017-09-18 18:18:44');
INSERT INTO `t_login_log` VALUES ('4', '11184629', '0:0:0:0:0:0:0:1', '2017-09-18 18:22:41');
INSERT INTO `t_login_log` VALUES ('5', '11184629', '0:0:0:0:0:0:0:1', '2017-09-18 18:23:04');
INSERT INTO `t_login_log` VALUES ('6', 'admin', '0:0:0:0:0:0:0:1', '2017-12-01 23:31:56');
INSERT INTO `t_login_log` VALUES ('7', 'admin', '0:0:0:0:0:0:0:1', '2017-12-01 23:32:28');
INSERT INTO `t_login_log` VALUES ('8', 'admin', '0:0:0:0:0:0:0:1', '2017-12-02 17:54:48');
INSERT INTO `t_login_log` VALUES ('9', '11184629', '0:0:0:0:0:0:0:1', '2017-12-02 18:08:21');
INSERT INTO `t_login_log` VALUES ('10', 'admin', '0:0:0:0:0:0:0:1', '2017-12-02 18:09:32');
INSERT INTO `t_login_log` VALUES ('11', '11184629', '0:0:0:0:0:0:0:1', '2017-12-02 18:14:49');
INSERT INTO `t_login_log` VALUES ('12', '123', '0:0:0:0:0:0:0:1', '2017-12-02 18:22:53');
INSERT INTO `t_login_log` VALUES ('13', '123', '0:0:0:0:0:0:0:1', '2017-12-02 18:30:33');
INSERT INTO `t_login_log` VALUES ('14', '123', '0:0:0:0:0:0:0:1', '2017-12-02 18:34:32');
INSERT INTO `t_login_log` VALUES ('15', '123', '0:0:0:0:0:0:0:1', '2017-12-02 18:37:07');
INSERT INTO `t_login_log` VALUES ('16', 'admin', '0:0:0:0:0:0:0:1', '2017-12-02 18:37:26');
INSERT INTO `t_login_log` VALUES ('17', '123', '0:0:0:0:0:0:0:1', '2017-12-02 18:37:56');
INSERT INTO `t_login_log` VALUES ('18', '1234', '0:0:0:0:0:0:0:1', '2017-12-02 18:42:27');
INSERT INTO `t_login_log` VALUES ('19', '123', '0:0:0:0:0:0:0:1', '2017-12-08 15:43:24');
INSERT INTO `t_login_log` VALUES ('20', '123', '0:0:0:0:0:0:0:1', '2017-12-08 15:55:27');
INSERT INTO `t_login_log` VALUES ('21', '123', '0:0:0:0:0:0:0:1', '2017-12-08 15:56:04');
INSERT INTO `t_login_log` VALUES ('22', '123', '0:0:0:0:0:0:0:1', '2017-12-08 15:57:22');
INSERT INTO `t_login_log` VALUES ('23', '123', '0:0:0:0:0:0:0:1', '2017-12-08 16:18:33');
INSERT INTO `t_login_log` VALUES ('24', '123', '0:0:0:0:0:0:0:1', '2017-12-08 16:54:24');
INSERT INTO `t_login_log` VALUES ('25', '123', '0:0:0:0:0:0:0:1', '2017-12-08 17:20:11');
INSERT INTO `t_login_log` VALUES ('26', '11111111', '0:0:0:0:0:0:0:1', '2017-12-08 18:25:56');
INSERT INTO `t_login_log` VALUES ('27', '123', '0:0:0:0:0:0:0:1', '2017-12-08 18:29:53');
INSERT INTO `t_login_log` VALUES ('28', 'admin', '0:0:0:0:0:0:0:1', '2017-12-08 18:31:18');
INSERT INTO `t_login_log` VALUES ('29', '123', '0:0:0:0:0:0:0:1', '2017-12-08 18:41:51');
INSERT INTO `t_login_log` VALUES ('30', '123', '0:0:0:0:0:0:0:1', '2017-12-08 19:01:08');
INSERT INTO `t_login_log` VALUES ('31', '123', '0:0:0:0:0:0:0:1', '2017-12-08 19:39:21');
INSERT INTO `t_login_log` VALUES ('32', '123', '0:0:0:0:0:0:0:1', '2017-12-08 19:43:45');
INSERT INTO `t_login_log` VALUES ('33', '123466', '0:0:0:0:0:0:0:1', '2017-12-08 19:44:45');
INSERT INTO `t_login_log` VALUES ('34', '111', '0:0:0:0:0:0:0:1', '2017-12-08 19:50:24');
INSERT INTO `t_login_log` VALUES ('35', '11184629', '0:0:0:0:0:0:0:1', '2017-12-19 14:53:24');
INSERT INTO `t_login_log` VALUES ('36', '123', '0:0:0:0:0:0:0:1', '2017-12-19 15:04:36');
INSERT INTO `t_login_log` VALUES ('37', '123', '0:0:0:0:0:0:0:1', '2017-12-19 15:04:37');
INSERT INTO `t_login_log` VALUES ('38', '123', '0:0:0:0:0:0:0:1', '2017-12-19 15:11:08');
INSERT INTO `t_login_log` VALUES ('39', 'admin', '0:0:0:0:0:0:0:1', '2017-12-19 15:15:38');
INSERT INTO `t_login_log` VALUES ('40', 'admin', '0:0:0:0:0:0:0:1', '2017-12-19 15:37:05');
INSERT INTO `t_login_log` VALUES ('41', '123', '0:0:0:0:0:0:0:1', '2017-12-19 15:50:13');
INSERT INTO `t_login_log` VALUES ('42', '123', '0:0:0:0:0:0:0:1', '2017-12-19 20:38:21');
INSERT INTO `t_login_log` VALUES ('43', '123', '0:0:0:0:0:0:0:1', '2017-12-20 15:01:50');
INSERT INTO `t_login_log` VALUES ('44', '123', '0:0:0:0:0:0:0:1', '2017-12-20 15:03:23');
INSERT INTO `t_login_log` VALUES ('45', 'admin', '0:0:0:0:0:0:0:1', '2017-12-20 15:47:00');
INSERT INTO `t_login_log` VALUES ('46', '123', '0:0:0:0:0:0:0:1', '2017-12-20 16:12:16');
INSERT INTO `t_login_log` VALUES ('47', 'admin', '0:0:0:0:0:0:0:1', '2017-12-20 16:38:01');
INSERT INTO `t_login_log` VALUES ('48', '123', '0:0:0:0:0:0:0:1', '2017-12-20 16:54:16');
INSERT INTO `t_login_log` VALUES ('49', '123', '0:0:0:0:0:0:0:1', '2017-12-21 10:17:13');
INSERT INTO `t_login_log` VALUES ('50', '123', '0:0:0:0:0:0:0:1', '2017-12-21 10:23:00');
INSERT INTO `t_login_log` VALUES ('51', '123', '0:0:0:0:0:0:0:1', '2017-12-21 10:26:47');
INSERT INTO `t_login_log` VALUES ('52', 'admin', '0:0:0:0:0:0:0:1', '2017-12-21 10:27:39');
INSERT INTO `t_login_log` VALUES ('53', '123', '0:0:0:0:0:0:0:1', '2017-12-21 10:36:04');
INSERT INTO `t_login_log` VALUES ('54', 'admin', '0:0:0:0:0:0:0:1', '2017-12-21 10:39:46');
INSERT INTO `t_login_log` VALUES ('55', 'admin', '0:0:0:0:0:0:0:1', '2017-12-21 20:05:58');
INSERT INTO `t_login_log` VALUES ('56', 'admin', '0:0:0:0:0:0:0:1', '2017-12-21 20:12:49');
INSERT INTO `t_login_log` VALUES ('57', 'admin', '0:0:0:0:0:0:0:1', '2017-12-21 20:16:57');
INSERT INTO `t_login_log` VALUES ('58', '123', '0:0:0:0:0:0:0:1', '2017-12-21 20:42:45');
INSERT INTO `t_login_log` VALUES ('59', '111', '0:0:0:0:0:0:0:1', '2017-12-21 20:43:28');
INSERT INTO `t_login_log` VALUES ('60', '123', '0:0:0:0:0:0:0:1', '2017-12-21 20:44:19');
INSERT INTO `t_login_log` VALUES ('61', 'admin', '0:0:0:0:0:0:0:1', '2017-12-21 20:45:26');
INSERT INTO `t_login_log` VALUES ('62', '123', '0:0:0:0:0:0:0:1', '2017-12-21 20:46:56');
INSERT INTO `t_login_log` VALUES ('63', '123', '0:0:0:0:0:0:0:1', '2017-12-21 20:48:29');
INSERT INTO `t_login_log` VALUES ('64', '123', '172.19.165.37', '2017-12-22 19:19:24');
INSERT INTO `t_login_log` VALUES ('65', '123', '0:0:0:0:0:0:0:1', '2018-06-05 19:32:13');
INSERT INTO `t_login_log` VALUES ('66', 'admin', '0:0:0:0:0:0:0:1', '2018-06-05 19:32:50');
INSERT INTO `t_login_log` VALUES ('67', 'admin', '0:0:0:0:0:0:0:1', '2018-06-13 19:50:59');
INSERT INTO `t_login_log` VALUES ('68', '123', '0:0:0:0:0:0:0:1', '2018-06-13 20:47:52');
INSERT INTO `t_login_log` VALUES ('69', 'admin', '0:0:0:0:0:0:0:1', '2018-06-13 20:52:10');
INSERT INTO `t_login_log` VALUES ('70', 'admin', '0:0:0:0:0:0:0:1', '2018-06-14 10:40:04');

-- ----------------------------
-- Table structure for `t_post`
-- ----------------------------
DROP TABLE IF EXISTS `t_post`;
CREATE TABLE `t_post` (
  `post_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  `post_board_id` int(10) NOT NULL DEFAULT '0' COMMENT '论坛板块ID',
  `post_user_name` varchar(30) NOT NULL DEFAULT '0' COMMENT '发表者名称',
  `post_title` varchar(50) NOT NULL COMMENT '帖子名称',
  `post_content` text NOT NULL COMMENT '帖子内容',
  `post_good_count` int(10) NOT NULL DEFAULT '0' COMMENT '点赞',
  `post_bad_count` int(10) NOT NULL DEFAULT '0' COMMENT '踩数',
  `post_view_count` int(10) NOT NULL DEFAULT '0' COMMENT '游览次数',
  `post_reply_count` int(10) NOT NULL DEFAULT '0' COMMENT '回帖数目',
  `post_status` int(2) NOT NULL DEFAULT '0' COMMENT '帖子状态:0:正常 1:锁定',
  `post_create_time` datetime NOT NULL COMMENT '创建时间',
  `post_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_post
-- ----------------------------
INSERT INTO `t_post` VALUES ('11', '1', 'admin', '学习帖子1', '首先，我无法否认学习之苦，学习之类，但甘守学习的苦才能享受学习的甜。 在校园里，我们快乐地成长，为理想而奋斗！遨游学海，跋涉书山，知识上的满足给我们快乐；山重水复，曲径通幽，破解难题的柳暗花明给我们快乐；思想境界上的不断开阔，心灵上的不断净化给我们快乐。记得爱因斯坦曾说：千万不要把学习当成一个任务，而应该看成一个令人羡慕的机会。是的，只要我们不辞劳苦，敢于面对学习中的困难，你会发现，学习中自有情趣，更有快乐。\r\n      其实，每个人都不能绝对的说自己有多聪明多厉害，也没有人会认为自己是不聪明的，任何一个人的成功都是通过自己的努力学习获得的，如果不学习即使有天才的智慧也只是浪费，然而只要你努力了，成绩好坏并没什么关系。', '0', '0', '0', '3', '0', '2017-12-21 20:42:32', '2017-12-21 20:42:32');
INSERT INTO `t_post` VALUES ('12', '2', '123', '关于java', '而JavaWeb则到了JavaEE领域了，也就是Java Enterprise Edition，Java的企业版，看那个web就应该想到是与Internet有关的，其实开发JavaWeb应用程序，初级的一般是用JSP（Java Server Pages）+servlet+Javabean来开发的，对大型的网站一般是使用框架来开发的，例如struts，hibernate，spring，例如校内，你在登陆的时候会在地址栏看见Login.do，登陆以后会看见Home.do这样的请求，典型的struts框架结构。\r\nJava还有一个版本是JavaME,Java Micro Edition,Java的微型版，诺基亚手机上运行的Java程序就是指用这个版本开发的程序。', '0', '0', '0', '1', '0', '2017-12-21 20:44:31', '2017-12-21 20:44:31');
INSERT INTO `t_post` VALUES ('13', '2', 'admin', '谁能具体分析一下JAVA EE 和 JSP 还有 JAVA WEB之间有什么区别', '', '0', '0', '0', '1', '0', '2017-12-21 20:45:56', '2017-12-21 20:45:56');
INSERT INTO `t_post` VALUES ('14', '1', 'admin', '测试帖子1', '这是个测试帖子', '0', '0', '0', '0', '0', '2017-12-21 20:46:47', '2017-12-21 20:46:47');
INSERT INTO `t_post` VALUES ('15', '1', '123', '1221', '123312312', '0', '0', '0', '0', '0', '2017-12-22 19:19:48', '2017-12-22 19:19:48');

-- ----------------------------
-- Table structure for `t_reply`
-- ----------------------------
DROP TABLE IF EXISTS `t_reply`;
CREATE TABLE `t_reply` (
  `reply_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '回复ID',
  `reply_post_id` int(10) NOT NULL COMMENT '所回复帖子的ID',
  `reply_user_name` varchar(30) NOT NULL COMMENT '回帖者姓名',
  `reply_content` text NOT NULL COMMENT '回复内容',
  `reply_good_count` int(10) NOT NULL DEFAULT '0' COMMENT '点赞',
  `reply_bad_count` int(10) NOT NULL DEFAULT '0' COMMENT '踩数',
  `reply_create_time` datetime NOT NULL COMMENT '回复时间',
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_reply
-- ----------------------------
INSERT INTO `t_reply` VALUES ('2', '2', '123', '代理商卡建档立卡圣皇大佬卡时间段里', '0', '0', '2017-12-19 20:38:36');
INSERT INTO `t_reply` VALUES ('3', '3', '123', '不知道阿', '0', '0', '2017-12-20 15:03:15');
INSERT INTO `t_reply` VALUES ('4', '1', '123', '大打算的撒', '0', '0', '2017-12-21 10:23:18');
INSERT INTO `t_reply` VALUES ('5', '4', '123', '大大声道', '0', '0', '2017-12-21 10:26:56');
INSERT INTO `t_reply` VALUES ('6', '10', 'admin', '打得', '0', '0', '2017-12-21 20:33:16');
INSERT INTO `t_reply` VALUES ('7', '11', '123', '你说的很不错', '0', '0', '2017-12-21 20:42:58');
INSERT INTO `t_reply` VALUES ('8', '11', '111', '同意楼上的话', '0', '0', '2017-12-21 20:43:42');
INSERT INTO `t_reply` VALUES ('9', '12', '123', '大家还有什么问题么', '0', '0', '2017-12-21 20:44:41');
INSERT INTO `t_reply` VALUES ('10', '13', 'admin', 'JavaWeb可以等同于JavaEE，官网叫法为JavaEE，意思为java企业版本，是一种平台（框架，不是专门一种语言或技术），主要开发Web应用，称之为javaWeb也可，而Jsp，jsf，ejb，struts，spring，hibernate等等都是JavaEE平台（框架）中的一种具体技术。', '0', '0', '2017-12-21 20:46:02');
INSERT INTO `t_reply` VALUES ('11', '11', '123', '撒大大', '0', '0', '2018-06-13 20:49:48');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(30) NOT NULL DEFAULT '' COMMENT '密码',
  `user_email` varchar(30) NOT NULL COMMENT '用户邮箱',
  `user_sex` varchar(30) NOT NULL COMMENT '用户性别',
  `user_phone` varchar(11) DEFAULT NULL COMMENT '电话号码',
  `create_time` datetime NOT NULL COMMENT '用户创建时间',
  `user_type` int(2) NOT NULL DEFAULT '1' COMMENT '用户类型 0:管理员 1:普通用户',
  `user_state` int(2) NOT NULL DEFAULT '0' COMMENT '用户状态 0:正常 1:冻结',
  `credit` int(10) NOT NULL DEFAULT '100' COMMENT '用户积分',
  `last_login_time` datetime DEFAULT NULL COMMENT '用户最后登入时间',
  `last_ip` varchar(20) DEFAULT NULL COMMENT '用户最后登入ip',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '123456', '11184629@qq.com', '男', '15011975772', '2017-09-18 17:44:39', '0', '0', '210', '2018-06-14 10:40:04', '0:0:0:0:0:0:0:1');
INSERT INTO `t_user` VALUES ('3', '11184629', '123456', '111846291@qq.com', '男', '13416228303', '2017-09-18 18:22:41', '1', '0', '120', '2017-12-19 14:53:24', '0:0:0:0:0:0:0:1');
INSERT INTO `t_user` VALUES ('4', '123', '123', '2310107723@qq.com', '男', '112', '2017-12-02 18:22:53', '1', '0', '280', '2018-06-13 20:47:52', '0:0:0:0:0:0:0:1');
INSERT INTO `t_user` VALUES ('6', '1234', '123', '310107723@qq.com', '男', '11', '2017-12-02 18:42:27', '1', '0', '100', '2017-12-02 18:42:27', '0:0:0:0:0:0:0:1');
INSERT INTO `t_user` VALUES ('8', '123466', 'dsff', 'sdfs@qq.com', '男', '222', '2017-12-08 19:44:45', '1', '0', '100', '2017-12-08 19:44:45', '0:0:0:0:0:0:0:1');
INSERT INTO `t_user` VALUES ('9', '111', '111111', '1111111@qq.com', '男', '111111', '2017-12-08 19:50:24', '1', '0', '105', '2017-12-21 20:43:28', '0:0:0:0:0:0:0:1');
