/*
Navicat MySQL Data Transfer

Source Server         : NT
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : nt_work__hours

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-01-29 09:46:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for nt_department
-- ----------------------------
DROP TABLE IF EXISTS `nt_department`;
CREATE TABLE `nt_department` (
`DEPT_ID`  int(11) NOT NULL AUTO_INCREMENT COMMENT '部门编号' ,
`DEPT_NAME`  varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '部门名称' ,
`DEPT_ABBREVIATION`  varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '部门简称' ,
`MANAGER_ID`  int(11) NOT NULL COMMENT '部门负责人编号' ,
`ASSISTANT_ID`  int(11) NOT NULL COMMENT '部门助理编号' ,
PRIMARY KEY (`DEPT_ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gbk COLLATE=gbk_chinese_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for nt_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `nt_dictionaries`;
CREATE TABLE `nt_dictionaries` (
`DIC_CODE`  varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '编码' ,
`DIC_TYPE`  varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '类别' ,
`DIC_VALUE`  varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '值' ,
`DIC_REMARK`  varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '说明' 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gbk COLLATE=gbk_chinese_ci

;

-- ----------------------------
-- Table structure for nt_holiday_define
-- ----------------------------
DROP TABLE IF EXISTS `nt_holiday_define`;
CREATE TABLE `nt_holiday_define` (
`HOLIDAY_ID`  int(11) NOT NULL AUTO_INCREMENT COMMENT '节假日编号' ,
`HOLIDAY_DATE`  date NOT NULL COMMENT '节假日日期' ,
`HOLIDAY_NAME`  varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '节假日名称' ,
`HOLIDAY_FUNCTION`  varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '说明' ,
`HOLIDAY_TYPE`  char(1) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '节假日类型' ,
PRIMARY KEY (`HOLIDAY_ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gbk COLLATE=gbk_chinese_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for nt_leave
-- ----------------------------
DROP TABLE IF EXISTS `nt_leave`;
CREATE TABLE `nt_leave` (
`PER_ID`  int(11) NOT NULL COMMENT '员工编号' ,
`BEG_DATE`  date NOT NULL COMMENT '请假开始日期' ,
`END_DATE`  date NOT NULL COMMENT '请假结束日期' ,
`LEAVE_TYPE`  char(1) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '请假类型' ,
`LEAVE_COUNT`  float NOT NULL COMMENT '请假天数' ,
`LEAVE_REMARK`  varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '请假说明' 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gbk COLLATE=gbk_chinese_ci

;

-- ----------------------------
-- Table structure for nt_leave_info
-- ----------------------------
DROP TABLE IF EXISTS `nt_leave_info`;
CREATE TABLE `nt_leave_info` (
`CUST_TYPE`  char(1) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '客户类别' ,
`WORK_TYPE`  varchar(1) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '工作种类' ,
`WORK_LEAVE`  varchar(5) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '等级' ,
`LEAVE_PRICE`  double NOT NULL COMMENT '等级单价' ,
`PROJECT_BEGDATE`  date NOT NULL COMMENT '开始日期' ,
`PROJECT_ENDDATE`  date NOT NULL COMMENT '结束日期' ,
`PROJECT_NUMBER`  int(11) NOT NULL COMMENT '项目编号' 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gbk COLLATE=gbk_chinese_ci

;

-- ----------------------------
-- Table structure for nt_per_alias
-- ----------------------------
DROP TABLE IF EXISTS `nt_per_alias`;
CREATE TABLE `nt_per_alias` (
`PER_ID`  int(11) NOT NULL COMMENT '员工编号' ,
`PROJECT_NUMBER`  int(11) NOT NULL COMMENT '项目编号' ,
`IN_PROJECT_NAME`  varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '项目中姓名' ,
`IN_COMPANY_NAME`  varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '在司姓名' 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gbk COLLATE=gbk_chinese_ci

;

-- ----------------------------
-- Table structure for nt_per_in_project
-- ----------------------------
DROP TABLE IF EXISTS `nt_per_in_project`;
CREATE TABLE `nt_per_in_project` (
`PER_ID`  int(11) NOT NULL COMMENT '员工编号' ,
`PROJECT_NUMBER`  int(11) NOT NULL COMMENT '所在项目编号' ,
`IN_PROJECT_LEAVE`  varchar(2) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '所在项目级别' ,
`PROJECT_BEGDATE`  date NULL DEFAULT NULL COMMENT '开始日期' ,
`PROJECT_ENDDATE`  date NULL DEFAULT NULL COMMENT '结束日期' 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gbk COLLATE=gbk_chinese_ci

;

-- ----------------------------
-- Table structure for nt_personnel
-- ----------------------------
DROP TABLE IF EXISTS `nt_personnel`;
CREATE TABLE `nt_personnel` (
`PER_ID`  int(11) NOT NULL AUTO_INCREMENT COMMENT '员工编号' ,
`DEPT_MANAGER_ID`  int(11) NULL DEFAULT NULL COMMENT '部门经理id' ,
`DEPT_ID`  int(11) NULL DEFAULT NULL COMMENT '部门编号' ,
`SEX`  char(1) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '性别' ,
`NAME`  varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '姓名' ,
`MOBILE_NO`  varchar(11) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '手机号' ,
`ID_NO`  varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '身份证号' ,
`BIRTHDAY`  date NULL DEFAULT NULL COMMENT '生日' ,
`ETHNIC`  varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '民族' ,
`EDUCATION`  varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '学历' ,
`UNIVERSITY`  varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '院校' ,
`MAJOR`  varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '专业' ,
`GRADUATION_DATE`  date NULL DEFAULT NULL COMMENT '毕业日期' ,
`ENTRY_DATE`  date NULL DEFAULT NULL COMMENT '入司日期' ,
`LEAVE_DATE`  date NULL DEFAULT NULL COMMENT '离职日期' ,
`STATUS`  char(1) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '状态' ,
`POSITION`  char(1) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '职位' ,
PRIMARY KEY (`PER_ID`, `ID_NO`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gbk COLLATE=gbk_chinese_ci
AUTO_INCREMENT=3

;

-- ----------------------------
-- Table structure for nt_personnel_apply
-- ----------------------------
DROP TABLE IF EXISTS `nt_personnel_apply`;
CREATE TABLE `nt_personnel_apply` (
`APPLY_SEQ`  int(11) NOT NULL AUTO_INCREMENT COMMENT '任务号' ,
`PER_ID`  int(11) NOT NULL COMMENT '员工编号' ,
`APPLY_DATE`  datetime NOT NULL COMMENT '申请日期' ,
`APPLY_TYPE`  char(1) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '申请类型' ,
`WORK_DATE`  date NOT NULL COMMENT '考勤日期' ,
`APPLY_STATUS`  char(1) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '处理状态' ,
`ERR_DESCRIBE`  varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '错误描述' ,
`APPROVE_DATE`  datetime NULL DEFAULT NULL COMMENT '审批日期' ,
`MANAGER_ID`  int(11) NULL DEFAULT NULL COMMENT '审批人编号' ,
`FILE_PATH`  varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '附件路径' ,
`FILE_NAME`  varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '附件名称' ,
`APPROVE_VALUE`  varchar(10) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '审批实际值' ,
`APPROVE_OPN`  varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '审批意见' ,
PRIMARY KEY (`APPLY_SEQ`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gbk COLLATE=gbk_chinese_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for nt_project_change
-- ----------------------------
DROP TABLE IF EXISTS `nt_project_change`;
CREATE TABLE `nt_project_change` (
`PER_ID`  int(11) NOT NULL COMMENT '员工编号' ,
`FROM_PROJECT_NUMBER`  int(11) NULL DEFAULT NULL COMMENT '原项目编号' ,
`TO_PROJECT_NUMBER`  int(11) NULL DEFAULT NULL COMMENT '目标项目编号' ,
`CHANGE_DATE`  date NULL DEFAULT NULL COMMENT '变动日期' ,
`PRIMARY_PROJECT_BEGDATE`  date NULL DEFAULT NULL COMMENT '原项目开始日期' ,
`PRIMARY_PROJECT_ENDDATE`  date NULL DEFAULT NULL COMMENT '原项目结束日期' ,
`NEW_PROJECT_BEGDATE`  date NULL DEFAULT NULL COMMENT '新项目开始日期' ,
`NEW_PROJECT_ENDDATE`  datetime NULL DEFAULT NULL COMMENT '新项目结束日期' 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gbk COLLATE=gbk_chinese_ci

;

-- ----------------------------
-- Table structure for nt_project_info
-- ----------------------------
DROP TABLE IF EXISTS `nt_project_info`;
CREATE TABLE `nt_project_info` (
`PROJECT_NUMBER`  int(11) NOT NULL AUTO_INCREMENT COMMENT '项目编号' ,
`PROJECT_NAME`  varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '项目名称' ,
`CUST_TYPE`  char(1) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '客户类别' ,
`DEPT_ID`  int(11) NULL DEFAULT NULL COMMENT '所属部门编号' ,
PRIMARY KEY (`PROJECT_NUMBER`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gbk COLLATE=gbk_chinese_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for nt_user
-- ----------------------------
DROP TABLE IF EXISTS `nt_user`;
CREATE TABLE `nt_user` (
`USER_ID`  int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID' ,
`USER_NAME`  varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '用户姓名' ,
`USER_LEVEL`  char(1) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '用户级别' ,
`USER_PASSWORD`  varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '用户密码' ,
PRIMARY KEY (`USER_ID`, `USER_NAME`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gbk COLLATE=gbk_chinese_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Table structure for nt_working_hours
-- ----------------------------
DROP TABLE IF EXISTS `nt_working_hours`;
CREATE TABLE `nt_working_hours` (
`PER_ID`  int(11) NOT NULL COMMENT '员工编号' ,
`WORK_DATE`  int(11) NOT NULL COMMENT '考勤日期' ,
`NORMAL_HOURS`  float NULL DEFAULT NULL COMMENT '正常工时' ,
`OVERTIME_HOURS`  float NULL DEFAULT NULL COMMENT '加班工时' ,
`SIGNIN_TIME`  time NULL DEFAULT NULL COMMENT '签到时间' ,
`SIGNBACK_TIME`  time NULL DEFAULT NULL COMMENT '签退时间' ,
PRIMARY KEY (`PER_ID`, `WORK_DATE`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=gbk COLLATE=gbk_chinese_ci

;

-- ----------------------------
-- Auto increment value for nt_department
-- ----------------------------
ALTER TABLE `nt_department` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for nt_holiday_define
-- ----------------------------
ALTER TABLE `nt_holiday_define` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for nt_personnel
-- ----------------------------
ALTER TABLE `nt_personnel` AUTO_INCREMENT=3;

-- ----------------------------
-- Auto increment value for nt_personnel_apply
-- ----------------------------
ALTER TABLE `nt_personnel_apply` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for nt_project_info
-- ----------------------------
ALTER TABLE `nt_project_info` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for nt_user
-- ----------------------------
ALTER TABLE `nt_user` AUTO_INCREMENT=1;
