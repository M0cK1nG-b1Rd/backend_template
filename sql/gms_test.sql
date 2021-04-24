/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : gms_test

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 24/04/2021 20:10:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acceptance_teacher
-- ----------------------------
DROP TABLE IF EXISTS `acceptance_teacher`;
CREATE TABLE `acceptance_teacher`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEACHER_ID` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `TEAM_ID` int(11) NULL DEFAULT NULL,
  `IS_LEADER` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_5`(`TEACHER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_6`(`TEAM_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`TEACHER_ID`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `acceptance_teacher_ibfk_1` FOREIGN KEY (`TEAM_ID`) REFERENCES `acceptance_team` (`TEAM_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '验收老师' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for acceptance_team
-- ----------------------------
DROP TABLE IF EXISTS `acceptance_team`;
CREATE TABLE `acceptance_team`  (
  `TEAM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SEC_ID` int(11) NULL DEFAULT NULL,
  `STAGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TEAM_ID`) USING BTREE,
  INDEX `SEC_ID`(`SEC_ID`) USING BTREE,
  CONSTRAINT `acceptance_team_ibfk_1` FOREIGN KEY (`SEC_ID`) REFERENCES `secretary` (`SEC_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '验收小组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for achievement
-- ----------------------------
DROP TABLE IF EXISTS `achievement`;
CREATE TABLE `achievement`  (
  `ACHIEVEMENT_ID` int(11) NOT NULL,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ACHIEVEMENT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '成果物' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `USER_ID` int(11) NOT NULL COMMENT '主键,用户id',
  `ADMIN_ID` int(11) NOT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `ADMIN_ID`(`ADMIN_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_3` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ANN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ANN_TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATE_BY` int(11) NULL DEFAULT NULL,
  `ANN_DETAIL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TYPE` int(11) NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SIGNATURE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ANN_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_20`(`CREATE_BY`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_20` FOREIGN KEY (`CREATE_BY`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for applied_subject
-- ----------------------------
DROP TABLE IF EXISTS `applied_subject`;
CREATE TABLE `applied_subject`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUB_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STU_ID` int(11) NULL DEFAULT NULL,
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL,
  `APPLY_REASON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WSH',
  `FEEDBACK` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `AUDIT_BY` int(11) NULL DEFAULT NULL,
  `AUDIT_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_11`(`STU_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_12`(`SUB_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_11` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '选题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `CLASS_ID` int(11) NOT NULL,
  `CLASS_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CLASS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for classroom
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom`  (
  `CLASSROOM_ID` int(11) NOT NULL,
  `CLASSROOM_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CLASSROOM_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `COLLEGE_ID` int(11) NOT NULL,
  `COLLEGE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`COLLEGE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学院' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict`  (
  `DICT_ID` int(11) NULL DEFAULT NULL,
  `DICT_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DICT_KEY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DICT_VALUE` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file_storage
-- ----------------------------
DROP TABLE IF EXISTS `file_storage`;
CREATE TABLE `file_storage`  (
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FILE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SIZE` bigint(20) NULL DEFAULT NULL,
  `LOCATION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEL_FLAG` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0,
  `UPLOAD_BY` int(11) NULL DEFAULT NULL,
  `UPLOAD_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`FILE_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_22`(`UPLOAD_BY`) USING BTREE,
  INDEX `DOC_ID`(`DOC_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_22` FOREIGN KEY (`UPLOAD_BY`) REFERENCES `user` (`USER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 205 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for handin
-- ----------------------------
DROP TABLE IF EXISTS `handin`;
CREATE TABLE `handin`  (
  `ID` int(11) NOT NULL,
  `HANDIN_ID` int(11) NULL DEFAULT 0 COMMENT '如果是0（默认），即是不需要handin这个过程的doc',
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RETRIES` int(11) NULL DEFAULT NULL,
  `TYPE` int(11) NULL DEFAULT NULL,
  `FEEDBACK` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `HANDIN_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `HANDIN_ID`(`HANDIN_ID`, `DOC_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log`  (
  `USERNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `LOGIN_TIME` datetime(0) NOT NULL COMMENT '登录时间',
  `LOCATION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录地点',
  `IP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES ('admin', '2021-04-24 19:34:28', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-04-24 19:47:56', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-04-24 19:48:22', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-04-24 20:00:15', NULL, '127.0.0.1');
INSERT INTO `login_log` VALUES ('admin', '2021-04-24 20:07:13', NULL, '127.0.0.1');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `MAJOR_ID` int(11) NOT NULL,
  `COLLEGE_ID` int(11) NULL DEFAULT NULL,
  `MAJOR_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`MAJOR_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_32`(`COLLEGE_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_32` FOREIGN KEY (`COLLEGE_ID`) REFERENCES `college` (`COLLEGE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '专业' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `MENU_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(11) NULL DEFAULT NULL,
  `MENU_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATH` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMPONENT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ICON` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE` tinyint(1) NULL DEFAULT NULL,
  `PERMS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_NUM` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_42`(`PERMS`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 0, '系统管理', '/sys', NULL, 'el-icon-setting', 0, 'sys', 1);
INSERT INTO `menu` VALUES (3, 1, '用户管理', '/sys/user', NULL, 'el-icon-loading', 0, 'user:manage', 1);
INSERT INTO `menu` VALUES (4, 1, '角色管理', '/sys/role', NULL, 'el-icon-user', 0, 'role:manage', 2);
INSERT INTO `menu` VALUES (5, 1, '权限管理', '/sys/perm', NULL, 'el-icon-key', 0, 'perms:manage', 3);
INSERT INTO `menu` VALUES (6, 1, '菜单管理', '/sys/menu', NULL, 'el-icon-set-up', 0, 'menu:manage', 4);
INSERT INTO `menu` VALUES (8, 1, '阶段控制', '/sys/stage', NULL, 'el-icon-data-line', 0, 'sys:stage', 1);
INSERT INTO `menu` VALUES (10, 0, '公告管理', '/notice', NULL, 'el-icon-chat-line-square', 0, 'notice', 2);
INSERT INTO `menu` VALUES (11, 10, '管理公告', '/notice/manage', NULL, 'el-icon-s-check', 1, 'notice:manage', NULL);
INSERT INTO `menu` VALUES (12, 10, '查看公告', '/notice/view', NULL, 'el-icon-view', 1, 'notice:view', NULL);
INSERT INTO `menu` VALUES (13, 0, '过程监督', '/process', NULL, 'el-icon-data-line', 1, 'process', NULL);
INSERT INTO `menu` VALUES (14, 13, '任务管理', '/process/teacher/manage', NULL, 'el-icon-edit-outline', 1, 'process:manage', NULL);
INSERT INTO `menu` VALUES (15, 13, '我的任务', '/process/student/my', NULL, 'el-icon-postcard', 1, 'process:my', NULL);
INSERT INTO `menu` VALUES (16, 13, '提交记录', '/process/student/records', NULL, 'el-icon-postcard', 1, 'process:record', NULL);
INSERT INTO `menu` VALUES (17, 13, '任务审核', '/process/teacher/judge', NULL, 'el-icon-folder-checked', 1, 'process:judge', NULL);
INSERT INTO `menu` VALUES (18, 13, '统计报表', '/process/statistics', NULL, 'el-icon-s-data', 1, 'process:statistics', NULL);
INSERT INTO `menu` VALUES (19, 0, '出题管理', '/subject/apply', NULL, 'el-icon-s-management', 1, 'apply', NULL);
INSERT INTO `menu` VALUES (20, 19, '教师出题', '/subject/apply/teacher', NULL, 'el-icon-s-custom', 1, 'apply:teacher', NULL);
INSERT INTO `menu` VALUES (23, 19, '教研室审题', '/subject/judge/final', NULL, 'el-icon-circle-check', 1, 'apply:office', NULL);
INSERT INTO `menu` VALUES (24, 19, '审核状态', '/subject/apply/result', NULL, 'el-icon-wallet', 1, 'apply:result', NULL);
INSERT INTO `menu` VALUES (25, 0, '选题管理', '/subject/select', NULL, 'el-icon-thumb', 0, 'select', 4);
INSERT INTO `menu` VALUES (26, 25, '查看所有课题', '/subject/all', NULL, 'el-icon-menu', 0, 'select:view', 1);
INSERT INTO `menu` VALUES (28, 25, '教师审核', '/subject/select/judge/teacher', NULL, 'el-icon-check', 0, 'select:teacher', 5);
INSERT INTO `menu` VALUES (30, 25, '查看互选信息', '/subject/select/result', NULL, 'el-icon-view', 1, 'select:result', NULL);
INSERT INTO `menu` VALUES (31, 0, '开题管理', '/initial', NULL, 'el-icon-video-play', 1, 'init', NULL);
INSERT INTO `menu` VALUES (32, 0, '中期管理', '/middle', NULL, 'el-icon-time', 0, 'mid', 3);
INSERT INTO `menu` VALUES (33, 0, '结题管理', '/finish', NULL, 'el-icon-timer', 0, 'fin', 1);
INSERT INTO `menu` VALUES (35, 31, '开题报告', '/initial/myReport', NULL, 'el-icon-edit-outline', NULL, 'init:report', NULL);
INSERT INTO `menu` VALUES (36, 31, '我的记录', '/initial/myList', NULL, 'el-icon-notebook-2', NULL, 'init:list', NULL);
INSERT INTO `menu` VALUES (37, 31, '开题审核', '/initial/startCheck', NULL, 'el-icon-s-check', NULL, 'init:check', NULL);
INSERT INTO `menu` VALUES (38, 31, '安排答辩', '/initial/arrange', NULL, 'el-icon-set-up', NULL, 'init:arrange', NULL);
INSERT INTO `menu` VALUES (39, 31, '我的答辩安排', '/initial/arrange/my', NULL, 'el-icon-set-up', NULL, 'init:myarrange', NULL);
INSERT INTO `menu` VALUES (40, 31, '答辩评分', '/initial/score', NULL, 'el-icon-finished', NULL, 'init:score', NULL);
INSERT INTO `menu` VALUES (41, 32, '中期报告', '/middle/myReport', NULL, 'el-icon-edit-outline', NULL, 'mid:report', NULL);
INSERT INTO `menu` VALUES (42, 32, '我的记录', '/middle/myList', NULL, 'el-icon-notebook-2', NULL, 'mid:list', NULL);
INSERT INTO `menu` VALUES (43, 32, '中期审核', '/middle/midCheck', NULL, 'el-icon-s-check', NULL, 'mid:check', NULL);
INSERT INTO `menu` VALUES (44, 32, '安排答辩', '/middle/arrange', NULL, 'el-icon-set-up', NULL, 'mid:arrange', NULL);
INSERT INTO `menu` VALUES (45, 32, '我的答辩安排', '/middle/arrange/my', NULL, 'el-icon-set-up', NULL, 'mid:myarrange', NULL);
INSERT INTO `menu` VALUES (46, 32, '答辩评分', '/middle/score', NULL, 'el-icon-finished', NULL, 'mid:score', NULL);
INSERT INTO `menu` VALUES (47, 33, '结题申请', '/finish/apply', NULL, 'el-icon-s-claim', NULL, 'fin:apply', NULL);
INSERT INTO `menu` VALUES (48, 33, '申请记录', '/finish/myApplyList', NULL, 'el-icon-notebook-2', NULL, 'fin:list', NULL);
INSERT INTO `menu` VALUES (49, 33, '结题审核', '/finish/finishCheck', NULL, 'el-icon-s-check', NULL, 'fin:check', NULL);
INSERT INTO `menu` VALUES (50, 33, '安排答辩', '/finish/arrange', NULL, 'el-icon-set-up', NULL, 'fin:arrange', NULL);
INSERT INTO `menu` VALUES (51, 33, '我的答辩安排', '/finish/arrange/my', NULL, 'el-icon-set-up', NULL, 'fin:myarrange', NULL);
INSERT INTO `menu` VALUES (52, 33, '答辩评分', '/finish/score', NULL, 'el-icon-finished', NULL, 'fin:score', NULL);
INSERT INTO `menu` VALUES (53, 33, '评审安排', '/finish/crossJudgeArrange', NULL, 'el-icon-files', NULL, 'fin:cross', NULL);
INSERT INTO `menu` VALUES (54, 33, '交叉评审', '/finish/crossJudge', NULL, 'el-icon-document-checked', NULL, 'fin:judge', NULL);
INSERT INTO `menu` VALUES (56, 0, '成绩管理', '/scoreManage', NULL, 'el-icon-s-platform', NULL, 'score', NULL);
INSERT INTO `menu` VALUES (57, 56, '权重配置', '/score/weight', NULL, 'el-icon-brush', NULL, 'score:weight', NULL);
INSERT INTO `menu` VALUES (58, 56, '我的成绩', '/scoreManage/myScoreList', NULL, 'el-icon-collection', NULL, 'score:my', NULL);
INSERT INTO `menu` VALUES (59, 56, '成绩列表', '/scoreManage/totalList', NULL, 'el-icon-document-copy', NULL, 'score:list', NULL);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `MESSAGE_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FROM_ID` int(11) NULL DEFAULT NULL,
  `TO_ID` int(11) NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CREAT_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`MESSAGE_ID`) USING BTREE,
  INDEX `FROM_ID`(`FROM_ID`) USING BTREE,
  INDEX `TO_ID`(`TO_ID`) USING BTREE,
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`FROM_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`TO_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for plea
-- ----------------------------
DROP TABLE IF EXISTS `plea`;
CREATE TABLE `plea`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STU_GROUP_ID` int(11) NULL DEFAULT NULL,
  `ACCEPTANCE_TEAM_ID` int(11) NULL DEFAULT NULL,
  `CLASSROOM_ID` int(11) NULL DEFAULT NULL,
  `START_TIME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `END_TIME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_RELEASE` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_39`(`STU_GROUP_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_9`(`ACCEPTANCE_TEAM_ID`) USING BTREE,
  INDEX `plea_ibfk_1`(`CLASSROOM_ID`) USING BTREE,
  CONSTRAINT `plea_ibfk_1` FOREIGN KEY (`CLASSROOM_ID`) REFERENCES `classroom` (`CLASSROOM_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `plea_ibfk_2` FOREIGN KEY (`ACCEPTANCE_TEAM_ID`) REFERENCES `acceptance_team` (`TEAM_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '答辩' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for plea_result
-- ----------------------------
DROP TABLE IF EXISTS `plea_result`;
CREATE TABLE `plea_result`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STU_ID` int(11) NOT NULL,
  `PLEA_ID` int(11) NULL DEFAULT NULL,
  `STAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCORE` int(11) NULL DEFAULT 0,
  `FEEDBACK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_PASSED` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `STAGE`(`STAGE`) USING BTREE,
  INDEX `PLEA_ID`(`PLEA_ID`) USING BTREE,
  CONSTRAINT `plea_result_ibfk_1` FOREIGN KEY (`PLEA_ID`) REFERENCES `plea` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUB_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RETRIES` int(11) NULL DEFAULT 0,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阶段（开题或中期）',
  `MEANING` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于开题',
  `RESULT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于开题',
  `PLAN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于开题',
  `PROGRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于中期',
  `POST_PLAN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于中期',
  `APPLY_REASON` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属于结题',
  `POSE_BY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSE_TIME` datetime(0) NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WSH',
  `AUDIT_BY` int(11) NULL DEFAULT NULL,
  `AUDIT_TIME` datetime(0) NULL DEFAULT NULL,
  `COMMENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `SCORE` int(11) NULL DEFAULT NULL,
  `IS_RELEASED` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `ROLE_ID` int(11) NOT NULL,
  `ROLE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员');
INSERT INTO `role` VALUES (2, '学生');
INSERT INTO `role` VALUES (3, '老师');
INSERT INTO `role` VALUES (4, '系办');
INSERT INTO `role` VALUES (5, '答辩秘书');

-- ----------------------------
-- Table structure for role_perms
-- ----------------------------
DROP TABLE IF EXISTS `role_perms`;
CREATE TABLE `role_perms`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int(11) NULL DEFAULT NULL,
  `PERMS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_43`(`ROLE_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_44`(`PERMS`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_43` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_perms_ibfk_1` FOREIGN KEY (`PERMS`) REFERENCES `menu` (`PERMS`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2905 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置各阶段角色的权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_perms
-- ----------------------------
INSERT INTO `role_perms` VALUES (2905, 1, 'user:manage');
INSERT INTO `role_perms` VALUES (2906, 1, 'role:manage');
INSERT INTO `role_perms` VALUES (2907, 1, 'perms:manage');
INSERT INTO `role_perms` VALUES (2908, 1, 'menu:manage');
INSERT INTO `role_perms` VALUES (2909, 1, 'sys:stage');
INSERT INTO `role_perms` VALUES (2910, 1, 'notice');
INSERT INTO `role_perms` VALUES (2911, 1, 'notice:manage');
INSERT INTO `role_perms` VALUES (2912, 1, 'notice:view');
INSERT INTO `role_perms` VALUES (2913, 1, 'process');
INSERT INTO `role_perms` VALUES (2914, 1, 'process:manage');
INSERT INTO `role_perms` VALUES (2915, 1, 'process:my');
INSERT INTO `role_perms` VALUES (2916, 1, 'process:record');
INSERT INTO `role_perms` VALUES (2917, 1, 'process:judge');
INSERT INTO `role_perms` VALUES (2918, 1, 'process:statistics');
INSERT INTO `role_perms` VALUES (2919, 1, 'apply');
INSERT INTO `role_perms` VALUES (2920, 1, 'apply:teacher');
INSERT INTO `role_perms` VALUES (2921, 1, 'apply:office');
INSERT INTO `role_perms` VALUES (2922, 1, 'apply:result');
INSERT INTO `role_perms` VALUES (2923, 1, 'select');
INSERT INTO `role_perms` VALUES (2924, 1, 'select:view');
INSERT INTO `role_perms` VALUES (2925, 1, 'select:teacher');
INSERT INTO `role_perms` VALUES (2926, 1, 'select:result');
INSERT INTO `role_perms` VALUES (2927, 1, 'init');
INSERT INTO `role_perms` VALUES (2928, 1, 'mid');
INSERT INTO `role_perms` VALUES (2929, 1, 'fin');
INSERT INTO `role_perms` VALUES (2930, 1, 'init:report');
INSERT INTO `role_perms` VALUES (2931, 1, 'init:list');
INSERT INTO `role_perms` VALUES (2932, 1, 'init:check');
INSERT INTO `role_perms` VALUES (2933, 1, 'init:arrange');
INSERT INTO `role_perms` VALUES (2934, 1, 'init:myarrange');
INSERT INTO `role_perms` VALUES (2935, 1, 'init:score');
INSERT INTO `role_perms` VALUES (2936, 1, 'mid:report');
INSERT INTO `role_perms` VALUES (2937, 1, 'mid:list');
INSERT INTO `role_perms` VALUES (2938, 1, 'mid:check');
INSERT INTO `role_perms` VALUES (2939, 1, 'mid:arrange');
INSERT INTO `role_perms` VALUES (2940, 1, 'mid:myarrange');
INSERT INTO `role_perms` VALUES (2941, 1, 'mid:score');
INSERT INTO `role_perms` VALUES (2942, 1, 'fin:apply');
INSERT INTO `role_perms` VALUES (2943, 1, 'fin:list');
INSERT INTO `role_perms` VALUES (2944, 1, 'fin:check');
INSERT INTO `role_perms` VALUES (2945, 1, 'fin:arrange');
INSERT INTO `role_perms` VALUES (2946, 1, 'fin:myarrange');
INSERT INTO `role_perms` VALUES (2947, 1, 'fin:score');
INSERT INTO `role_perms` VALUES (2948, 1, 'fin:cross');
INSERT INTO `role_perms` VALUES (2949, 1, 'fin:judge');
INSERT INTO `role_perms` VALUES (2950, 1, 'score');
INSERT INTO `role_perms` VALUES (2951, 1, 'score:weight');
INSERT INTO `role_perms` VALUES (2952, 1, 'score:my');
INSERT INTO `role_perms` VALUES (2953, 1, 'score:list');
INSERT INTO `role_perms` VALUES (2954, 1, 'sys');
INSERT INTO `role_perms` VALUES (2955, 2, 'notice');
INSERT INTO `role_perms` VALUES (2956, 2, 'init');
INSERT INTO `role_perms` VALUES (2957, 2, 'mid');
INSERT INTO `role_perms` VALUES (2958, 2, 'fin');
INSERT INTO `role_perms` VALUES (2959, 2, 'process');
INSERT INTO `role_perms` VALUES (2960, 2, 'score');
INSERT INTO `role_perms` VALUES (2961, 2, 'notice:view');
INSERT INTO `role_perms` VALUES (2962, 2, 'process:my');
INSERT INTO `role_perms` VALUES (2963, 2, 'process:record');
INSERT INTO `role_perms` VALUES (2964, 2, 'process:statistics');
INSERT INTO `role_perms` VALUES (2965, 2, 'select:view');
INSERT INTO `role_perms` VALUES (2966, 2, 'select:result');
INSERT INTO `role_perms` VALUES (2967, 2, 'init:report');
INSERT INTO `role_perms` VALUES (2968, 2, 'init:list');
INSERT INTO `role_perms` VALUES (2969, 2, 'init:myarrange');
INSERT INTO `role_perms` VALUES (2970, 2, 'mid:report');
INSERT INTO `role_perms` VALUES (2971, 2, 'mid:list');
INSERT INTO `role_perms` VALUES (2972, 2, 'mid:myarrange');
INSERT INTO `role_perms` VALUES (2973, 2, 'fin:apply');
INSERT INTO `role_perms` VALUES (2974, 2, 'fin:list');
INSERT INTO `role_perms` VALUES (2975, 2, 'fin:myarrange');
INSERT INTO `role_perms` VALUES (2976, 2, 'score:my');
INSERT INTO `role_perms` VALUES (2977, 5, 'notice');
INSERT INTO `role_perms` VALUES (2978, 5, 'init');
INSERT INTO `role_perms` VALUES (2979, 5, 'mid');
INSERT INTO `role_perms` VALUES (2980, 5, 'fin');
INSERT INTO `role_perms` VALUES (2981, 5, 'notice:view');
INSERT INTO `role_perms` VALUES (2982, 5, 'init:score');
INSERT INTO `role_perms` VALUES (2983, 5, 'mid:score');
INSERT INTO `role_perms` VALUES (2984, 5, 'fin:score');
INSERT INTO `role_perms` VALUES (2985, 5, 'init:myarrange');
INSERT INTO `role_perms` VALUES (2986, 5, 'mid:myarrange');
INSERT INTO `role_perms` VALUES (2987, 5, 'fin:myarrange');
INSERT INTO `role_perms` VALUES (2988, 2, 'select');
INSERT INTO `role_perms` VALUES (2989, 4, 'apply');
INSERT INTO `role_perms` VALUES (2990, 4, 'apply:office');
INSERT INTO `role_perms` VALUES (2991, 4, 'apply:result');
INSERT INTO `role_perms` VALUES (2992, 4, 'fin');
INSERT INTO `role_perms` VALUES (2993, 4, 'fin:arrange');
INSERT INTO `role_perms` VALUES (2994, 4, 'fin:cross');
INSERT INTO `role_perms` VALUES (2995, 4, 'init');
INSERT INTO `role_perms` VALUES (2996, 4, 'init:arrange');
INSERT INTO `role_perms` VALUES (2997, 4, 'mid');
INSERT INTO `role_perms` VALUES (2998, 4, 'mid:arrange');
INSERT INTO `role_perms` VALUES (2999, 4, 'notice');
INSERT INTO `role_perms` VALUES (3000, 4, 'notice:manage');
INSERT INTO `role_perms` VALUES (3001, 4, 'notice:view');
INSERT INTO `role_perms` VALUES (3002, 4, 'score');
INSERT INTO `role_perms` VALUES (3003, 4, 'score:weight');
INSERT INTO `role_perms` VALUES (3004, 4, 'select');
INSERT INTO `role_perms` VALUES (3005, 4, 'select:view');
INSERT INTO `role_perms` VALUES (3006, 4, 'sys');
INSERT INTO `role_perms` VALUES (3007, 4, 'sys:stage');
INSERT INTO `role_perms` VALUES (3008, 4, 'user:manage');
INSERT INTO `role_perms` VALUES (3009, 3, 'apply');
INSERT INTO `role_perms` VALUES (3010, 3, 'apply:result');
INSERT INTO `role_perms` VALUES (3011, 3, 'apply:teacher');
INSERT INTO `role_perms` VALUES (3012, 3, 'fin');
INSERT INTO `role_perms` VALUES (3013, 3, 'fin:check');
INSERT INTO `role_perms` VALUES (3014, 3, 'fin:judge');
INSERT INTO `role_perms` VALUES (3015, 3, 'fin:myarrange');
INSERT INTO `role_perms` VALUES (3016, 3, 'init');
INSERT INTO `role_perms` VALUES (3017, 3, 'init:check');
INSERT INTO `role_perms` VALUES (3018, 3, 'init:myarrange');
INSERT INTO `role_perms` VALUES (3019, 3, 'mid');
INSERT INTO `role_perms` VALUES (3020, 3, 'mid:check');
INSERT INTO `role_perms` VALUES (3021, 3, 'mid:myarrange');
INSERT INTO `role_perms` VALUES (3022, 3, 'notice');
INSERT INTO `role_perms` VALUES (3023, 3, 'notice:view');
INSERT INTO `role_perms` VALUES (3024, 3, 'process');
INSERT INTO `role_perms` VALUES (3025, 3, 'process:judge');
INSERT INTO `role_perms` VALUES (3026, 3, 'process:manage');
INSERT INTO `role_perms` VALUES (3027, 3, 'score');
INSERT INTO `role_perms` VALUES (3028, 3, 'score:list');
INSERT INTO `role_perms` VALUES (3029, 3, 'select');
INSERT INTO `role_perms` VALUES (3030, 3, 'select:result');
INSERT INTO `role_perms` VALUES (3031, 3, 'select:teacher');
INSERT INTO `role_perms` VALUES (3032, 3, 'select:view');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `STU_ID` int(11) NULL DEFAULT NULL,
  `START_DEFENSE_SCORE` int(11) NULL DEFAULT NULL,
  `START_REPORT_SCORE` int(11) NULL DEFAULT NULL COMMENT '答辩和成果（包括报告）',
  `MID_DEFENSE_SCORE` int(11) NULL DEFAULT NULL,
  `MID_REPORT_SCORE` int(11) NULL DEFAULT NULL,
  `END_DEFENSE_SCORE` int(11) NULL DEFAULT NULL,
  `END_REPORT_SCORE` int(11) NULL DEFAULT NULL COMMENT '即论文分',
  `PROCEDURE_SCORE` int(11) NULL DEFAULT NULL,
  `FINAL_SCORE` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for secretary
-- ----------------------------
DROP TABLE IF EXISTS `secretary`;
CREATE TABLE `secretary`  (
  `USER_ID` int(11) NOT NULL COMMENT '主键,用户id',
  `SEC_ID` int(11) NOT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `SEC_ID`(`SEC_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_5` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '答辩秘书' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stage_task
-- ----------------------------
DROP TABLE IF EXISTS `stage_task`;
CREATE TABLE `stage_task`  (
  `TASK_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUB_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TASK_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TEACHER_ID` int(11) NULL DEFAULT NULL,
  `STU_ID` int(11) NULL DEFAULT NULL,
  `STAGE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WTJ',
  `START_TIME` datetime(0) NULL DEFAULT NULL,
  `END_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`TASK_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_16`(`TEACHER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_17`(`STU_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_16` FOREIGN KEY (`TEACHER_ID`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_17` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '阶段任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stage_task_result
-- ----------------------------
DROP TABLE IF EXISTS `stage_task_result`;
CREATE TABLE `stage_task_result`  (
  `TASK_ID` int(11) NULL DEFAULT NULL,
  `RETRIES` int(11) NULL DEFAULT 1,
  `SUMMARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FEEDBACK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'DSH',
  `AUDIT_TIME` datetime(0) NULL DEFAULT NULL,
  `SCORE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stu_group
-- ----------------------------
DROP TABLE IF EXISTS `stu_group`;
CREATE TABLE `stu_group`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `STU_ID` int(11) NULL DEFAULT NULL,
  `STAGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_38`(`STU_ID`) USING BTREE,
  INDEX `GROUP_ID`(`GROUP_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_38` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 255 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生小组，分批进行答辩' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `USER_ID` int(11) NOT NULL COMMENT '主键,用户id',
  `STU_ID` int(11) NOT NULL,
  `COLLEGE_ID` int(11) NULL DEFAULT NULL,
  `MAJOR_ID` int(11) NULL DEFAULT NULL,
  `CLASS_ID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `STU_ID`(`STU_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_29`(`MAJOR_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_31`(`CLASS_ID`) USING BTREE,
  INDEX `student_ibfk_1`(`COLLEGE_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_29` FOREIGN KEY (`MAJOR_ID`) REFERENCES `major` (`MAJOR_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_31` FOREIGN KEY (`CLASS_ID`) REFERENCES `class` (`CLASS_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`COLLEGE_ID`) REFERENCES `college` (`COLLEGE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUB_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SUB_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `REQUIREMENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CHOSEN` int(11) NULL DEFAULT 0,
  `CAPACITY` int(11) NULL DEFAULT 3,
  `ZONE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSE_BY` int(11) NULL DEFAULT NULL,
  `POSE_TIME` datetime(0) NULL DEFAULT NULL,
  `STATUS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WSH',
  `MAJOR_ID` int(11) NULL DEFAULT NULL,
  `AUDIT_BY` int(11) NULL DEFAULT NULL,
  `AUDIT_TIME` datetime(0) NULL DEFAULT NULL,
  `FEEDBACK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_10`(`POSE_BY`) USING BTREE,
  INDEX `FK_RELATIONSHIP_28`(`MAJOR_ID`) USING BTREE,
  INDEX `SUB_ID`(`SUB_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_10` FOREIGN KEY (`POSE_BY`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_28` FOREIGN KEY (`MAJOR_ID`) REFERENCES `major` (`MAJOR_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `USERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `OPERATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作内容',
  `TIME` decimal(11, 0) NULL DEFAULT NULL COMMENT '耗时',
  `METHOD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作方法',
  `PARAMS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '方法参数',
  `IP` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作者IP',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作地点',
  `RESPONSE_CODE` int(11) NULL DEFAULT NULL COMMENT '应答码',
  `RESPONSE_TEXT` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应答内容',
  `TYPE` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '0系统内部操作日志, 1系统外部请求日志',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_stage
-- ----------------------------
DROP TABLE IF EXISTS `system_stage`;
CREATE TABLE `system_stage`  (
  `IS_CURRENT` tinyint(1) NOT NULL,
  `STAGE_ID` int(11) NOT NULL,
  `STAGE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `START_TIME` datetime(0) NULL DEFAULT NULL,
  `END_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`STAGE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统当前状态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `USER_ID` int(11) NOT NULL COMMENT '主键,用户id',
  `TEACHER_ID` int(11) NOT NULL,
  `COLLEGE_ID` int(11) NULL DEFAULT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HOME_PAGE` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TEACHER_ID`) USING BTREE,
  INDEX `TEACHER_ID`(`TEACHER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_7`(`COLLEGE_ID`) USING BTREE,
  INDEX `USER_ID`(`USER_ID`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`COLLEGE_ID`) REFERENCES `college` (`COLLEGE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for teaching_office
-- ----------------------------
DROP TABLE IF EXISTS `teaching_office`;
CREATE TABLE `teaching_office`  (
  `USER_ID` int(11) NOT NULL COMMENT '主键,用户id',
  `OFFICE_ID` int(11) NOT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `OFFICE_ID`(`OFFICE_ID`) USING BTREE,
  CONSTRAINT `FK_INHERITANCE_4` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教研室' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for thesis
-- ----------------------------
DROP TABLE IF EXISTS `thesis`;
CREATE TABLE `thesis`  (
  `THESIS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DOC_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STU_ID` int(11) NULL DEFAULT NULL,
  `POSE_TIME` datetime(0) NULL DEFAULT NULL,
  `STATUS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'WSH',
  `SCORE` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`THESIS_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_21`(`STU_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_21` FOREIGN KEY (`STU_ID`) REFERENCES `student` (`STU_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '论文' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for thesis_teacher
-- ----------------------------
DROP TABLE IF EXISTS `thesis_teacher`;
CREATE TABLE `thesis_teacher`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEACHER_ID` int(11) NULL DEFAULT NULL,
  `THESIS_ID` int(11) NULL DEFAULT NULL,
  `IS_RELEASE` tinyint(1) NULL DEFAULT 0,
  `SCORE` int(11) NULL DEFAULT -1,
  `TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `TEACHER_ID`(`TEACHER_ID`) USING BTREE,
  INDEX `THESIS_ID`(`THESIS_ID`) USING BTREE,
  CONSTRAINT `thesis_teacher_ibfk_1` FOREIGN KEY (`TEACHER_ID`) REFERENCES `teacher` (`TEACHER_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `thesis_teacher_ibfk_2` FOREIGN KEY (`THESIS_ID`) REFERENCES `thesis` (`THESIS_ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 184 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,用户id',
  `REAL_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户真实姓名',
  `USERNAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户登录账号',
  `PASSWORD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `TEL` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户电话号',
  `MAIL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDER` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别(F女M男)',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 402 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (20, '管理员', 'admin', '3ee4a28b103216fa2d140d1979297910', '12387516512', 'we@jiaban.com', 'F');
INSERT INTO `user` VALUES (101, '学生1', 'student1', '039980483dcb6489166e1a6ba2da0b34', '17697576027', 'vhgj53@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (102, '学生2', 'student2', 'f07e767add41a8502acdc480fe884aa8', '15033432630', 'pabibruo@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (103, '学生3', 'student3', '0f1db4b53835ffd6120845ab738c5f4e', '13177867883', 'erjnbcdlciatj14@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (104, '学生4', 'student4', '46c47ab8544b14eec5396bbe1119f44d', '17576053067', 'avktjklkowojkqw@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (105, '学生5', 'student5', '94fa038b07f3f797f669d15ee88a547f', '15816366018', 'e483212120575@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (106, '学生6', 'student6', '7ebbf99e1cda3afc03f36472766b8434', '18463015511', 'bdtpkjshucjdmc@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (107, '学生7', 'student7', '524939ef821ac58264033d01afd7ce2b', '17670401263', 'bbjaacfrseq@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (108, '学生8', 'student8', '45668546bcb1567130cad10c047c2fcf', '16566451829', 'upa0@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (109, '学生9', 'student9', 'f4478ca1df1f88dafb5f34ecc97d1e85', '13365169634', 'gtghoidwft06@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (110, '学生10', 'student10', '9818e270fc3a4d9d592cc13bcce269c1', '14709831780', 'imr@stu.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (111, '学生11', 'student11', '2c3aa0c5eb0f7bbf0e2c24c10941ec9a', '17805252431', 'twvcu@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (112, '学生12', 'student12', '821b33484f99d17271775f8a4a5169d1', '19933625998', 'quakjb@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (113, '学生13', 'student13', 'f62078076ac2ebb379aac1bd28547dd2', '13277747354', 'jssrrotcavslp@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (114, '学生14', 'student14', '4b544c1294ec9513d584168b86bd7ab6', '17157967503', 'i87283363@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (115, '学生15', 'student15', '4b8bf2149ec3e192b6265f1c982e5e89', '19913259996', 'pgw@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (116, '学生16', 'student16', 'e75a00b64c58c020061f22e73d207bf6', '18608609762', 'vvgemrwkfatv1@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (117, '学生17', 'student17', 'e1bd4893af5bae35f3219931d0351983', '15944441733', 'aet@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (118, '学生18', 'student18', '115cad676c1b9ad5d487488d3c185a14', '18741177283', 'nstiaaiqtwn@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (119, '学生19', 'student19', '57ea017f08469f4fdac0dd0e268a9612', '17118282672', 'k743@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (120, '学生20', 'student20', 'ecf2fc877bf3ead11ce815521d26ed9b', '13638911701', 'oviau4@stu.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (201, '老师1', 'teacher1', 'b842b4673732526f68d9a06f1c8412b7', '15129298540', 'w54174@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (202, '老师2', 'teacher2', 'f11ae84809ee8b7585752eecbf2daa2b', '17394628455', 'jcn@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (203, '老师3', 'teacher3', '7b80722199dc27b8fab6a7192dffb0d3', '18862307793', 'dclnjiviwphqh@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (204, '老师4', 'teacher4', 'f6d33dcddda27dd85c002623cc07c50a', '13840561114', 'stcdle8241@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (205, '老师5', 'teacher5', '7ca0f96f147149e1d5713495d9c2d77e', '15009078565', 'a8064557@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (206, '老师6', 'teacher6', '3a2beb65cc1c8ef8bc9c69e96b459112', '18564971416', 'h403@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (207, '老师7', 'teacher7', '7cd6cb9a2ed237fde80778ac5a5818de', '15003194745', 'wdjlvttnwjhm@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (208, '老师8', 'teacher8', '496fbea9195de8cfeccfba418f6c8590', '17887756291', 'aiwhu@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (209, '老师9', 'teacher9', '6bf9ceaf73d997143ac015610acdb9b6', '13173933675', 'vudqrbll@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (210, '老师10', 'teacher10', '47b7878be1cbe4f92beef527e667e76d', '13203891843', 'dlaghsv1104@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (301, '秘书1', 'sec1', 'b01d0554881ddc66568236f9c7bd1af8', '19859673008', 'dahbgftmgfal@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (302, '秘书2', 'sec2', 'f10fcb9f2c251003406dc30ee1ec2b43', '15057791412', 'fjwl@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (303, '秘书3', 'sec3', 'e2f503cc34f366ca5b8b6a666db65f80', '18895271680', 'c1500@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (304, '秘书4', 'sec4', '34fdab656c967bef22b11565b52cb140', '15287897878', 'v58@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (305, '秘书5', 'sec5', '5f9ffc0d9efacb6a1a8b4cbc25d5fad5', '18285106178', 'mlhcolkmramrgvu@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (306, '秘书6', 'sec6', '87436df686c28f923ccc3d5b81ae1bef', '13270715610', 'fmbnmtajhwgrv83@mail.xjtu.edu.cn', 'F');
INSERT INTO `user` VALUES (401, '系办1', 'office1', '3285f6f3a77b9823fb4c6e0bab8b0390', '13173933675', 'nrrn@mail.xjtu.edu.cn', 'M');
INSERT INTO `user` VALUES (402, '系办2', 'office2', '9882d0ed29a2cff7e11f60c3cba1ad38', '13203891843', 'agjbrmplmr@mail.xjtu.edu.cn', 'F');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `ROLE_ID` int(11) NULL DEFAULT NULL,
  `USER_ID` int(11) NULL DEFAULT NULL,
  INDEX `FK_RELATIONSHIP_23`(`USER_ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_24`(`ROLE_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_23` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_RELATIONSHIP_24` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (2, 101);
INSERT INTO `user_role` VALUES (2, 102);
INSERT INTO `user_role` VALUES (2, 103);
INSERT INTO `user_role` VALUES (2, 104);
INSERT INTO `user_role` VALUES (2, 105);
INSERT INTO `user_role` VALUES (2, 106);
INSERT INTO `user_role` VALUES (2, 107);
INSERT INTO `user_role` VALUES (2, 108);
INSERT INTO `user_role` VALUES (2, 109);
INSERT INTO `user_role` VALUES (2, 110);
INSERT INTO `user_role` VALUES (2, 111);
INSERT INTO `user_role` VALUES (2, 112);
INSERT INTO `user_role` VALUES (2, 113);
INSERT INTO `user_role` VALUES (2, 114);
INSERT INTO `user_role` VALUES (2, 115);
INSERT INTO `user_role` VALUES (2, 116);
INSERT INTO `user_role` VALUES (2, 117);
INSERT INTO `user_role` VALUES (2, 118);
INSERT INTO `user_role` VALUES (2, 119);
INSERT INTO `user_role` VALUES (2, 120);
INSERT INTO `user_role` VALUES (3, 201);
INSERT INTO `user_role` VALUES (3, 202);
INSERT INTO `user_role` VALUES (3, 203);
INSERT INTO `user_role` VALUES (3, 204);
INSERT INTO `user_role` VALUES (3, 205);
INSERT INTO `user_role` VALUES (3, 206);
INSERT INTO `user_role` VALUES (3, 207);
INSERT INTO `user_role` VALUES (3, 208);
INSERT INTO `user_role` VALUES (3, 209);
INSERT INTO `user_role` VALUES (3, 210);
INSERT INTO `user_role` VALUES (5, 301);
INSERT INTO `user_role` VALUES (5, 302);
INSERT INTO `user_role` VALUES (5, 303);
INSERT INTO `user_role` VALUES (5, 304);
INSERT INTO `user_role` VALUES (5, 305);
INSERT INTO `user_role` VALUES (5, 306);
INSERT INTO `user_role` VALUES (4, 401);
INSERT INTO `user_role` VALUES (4, 402);
INSERT INTO `user_role` VALUES (1, 20);
INSERT INTO `user_role` VALUES (1, 20);

-- ----------------------------
-- Table structure for user_stage
-- ----------------------------
DROP TABLE IF EXISTS `user_stage`;
CREATE TABLE `user_stage`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NULL DEFAULT NULL,
  `STAGE_ID` int(11) NULL DEFAULT NULL,
  `START_TIME` datetime(0) NULL DEFAULT NULL,
  `END_TIME` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_RELATIONSHIP_30`(`USER_ID`) USING BTREE,
  CONSTRAINT `FK_RELATIONSHIP_30` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户当前状态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for validate
-- ----------------------------
DROP TABLE IF EXISTS `validate`;
CREATE TABLE `validate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reset_token` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for weight
-- ----------------------------
DROP TABLE IF EXISTS `weight`;
CREATE TABLE `weight`  (
  `START_STAGE` double NULL DEFAULT NULL,
  `MIDDLE_STAGE` double NULL DEFAULT NULL,
  `END_STAGE` double NULL DEFAULT NULL,
  `STAGE_TASK` double NULL DEFAULT NULL,
  `START_MATERIAL` double NULL DEFAULT NULL,
  `START_PLEA` double NULL DEFAULT NULL,
  `MIDDLE_MATERIAL` double NULL DEFAULT NULL,
  `MIDDLE_PLEA` double NULL DEFAULT NULL,
  `END_MATERIAL` double NULL DEFAULT NULL,
  `END_PLEA` double NULL DEFAULT NULL COMMENT '即论文'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
