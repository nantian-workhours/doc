
--mysql 导出表结构
mysqldump -d -h localhost -u root -p123456 nt_work_hours > dumpfile.sql;


-- MySQL dump 10.13  Distrib 5.7.25, for Win32 (AMD64)
--
-- Host: localhost    Database: nt_work_hours
-- ------------------------------------------------------
-- Server version	5.7.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `nt_cust_type`
--

DROP TABLE IF EXISTS `nt_cust_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nt_cust_type` (
  `CUST_TYPE` varchar(100) NOT NULL COMMENT '客户类别名称',
  `WORK_TYPE` char(1) NOT NULL COMMENT '工作类别',
  `WORK_LEAVE` char(1) NOT NULL COMMENT '工作级别',
  PRIMARY KEY (`CUST_TYPE`,`WORK_TYPE`,`WORK_LEAVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nt_department`
--

DROP TABLE IF EXISTS `nt_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nt_department` (
  `DEPT_ID` int(11) NOT NULL DEFAULT '1000' COMMENT '部门编号',
  `DEPT_NAME` varchar(100) CHARACTER SET gbk NOT NULL COMMENT '部门名称',
  `DEPT_ABBREVIATION` varchar(50) CHARACTER SET gbk NOT NULL COMMENT '部门简称',
  `MANAGER_ID` int(11) NOT NULL COMMENT '部门负责人编号',
  `ASSISTANT_ID` int(11) NOT NULL COMMENT '部门助理编号',
  `SERVICE_TYPE` varchar(45) CHARACTER SET gbk DEFAULT NULL COMMENT '服务类别',
  `PRIO_DEPT_ID` int(11) DEFAULT NULL COMMENT '上级部门编号',
  PRIMARY KEY (`DEPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nt_dictionaries`
--

DROP TABLE IF EXISTS `nt_dictionaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nt_dictionaries` (
  `DIC_TYPE` varchar(50) NOT NULL COMMENT '类别',
  `DIC_CODE` varchar(50) NOT NULL COMMENT '编码',
  `DIC_VALUE` varchar(50) NOT NULL COMMENT '值',
  PRIMARY KEY (`DIC_CODE`,`DIC_VALUE`,`DIC_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nt_hol_info`
--

DROP TABLE IF EXISTS `nt_hol_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nt_hol_info` (
  `PER_ID` int(11) NOT NULL COMMENT '员工编号',
  `YEAR_DAYS` float DEFAULT NULL COMMENT '年假天数',
  `OVER_YEAR_DAYS` float DEFAULT NULL COMMENT '剩余年假天数',
  `DAY_OFF_DAYS` float DEFAULT NULL COMMENT '调休天数',
  `OVER_DAY_OFF_DAYS` float DEFAULT NULL COMMENT '剩余调休天数',
  PRIMARY KEY (`PER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nt_holiday_define`
--

DROP TABLE IF EXISTS `nt_holiday_define`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nt_holiday_define` (
  `HOLIDAY_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '节假日编号',
  `HOLIDAY_DATE` date NOT NULL COMMENT '节假日日期',
  `HOLIDAY_NAME` varchar(50) NOT NULL COMMENT '节假日名称',
  `HOLIDAY_FUNCTION` varchar(50) DEFAULT NULL COMMENT '说明',
  `HOLIDAY_TYPE` char(1) DEFAULT NULL COMMENT '节假日类型',
  PRIMARY KEY (`HOLIDAY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nt_leave`
--

DROP TABLE IF EXISTS `nt_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nt_leave` (
  `PER_ID` int(11) NOT NULL COMMENT '员工编号',
  `BEG_DATE` date NOT NULL COMMENT '请假开始日期',
  `END_DATE` date NOT NULL COMMENT '请假结束日期',
  `LEAVE_TYPE` char(1) CHARACTER SET gbk NOT NULL COMMENT '请假类型',
  `LEAVE_COUNT` float NOT NULL COMMENT '请假天数',
  `LEAVE_REMARK` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '请假说明',
  `APPLY_STATUS` char(1) DEFAULT NULL COMMENT '审批状态',
  `APPROVE_DATE` datetime DEFAULT NULL COMMENT '审批时间',
  `MANAGER_ID` int(11) DEFAULT NULL COMMENT '审批人ID',
  `APPROVE_OPN` varchar(100) DEFAULT NULL COMMENT '审批意见'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nt_leave_info`
--

DROP TABLE IF EXISTS `nt_leave_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nt_leave_info` (
  `CUST_TYPE` char(1) CHARACTER SET gbk NOT NULL COMMENT '客户类别',
  `WORK_TYPE` varchar(1) CHARACTER SET gbk NOT NULL COMMENT '工作种类',
  `WORK_LEAVE` varchar(5) CHARACTER SET gbk NOT NULL COMMENT '等级',
  `LEAVE_PRICE` double NOT NULL COMMENT '等级单价',
  `PROJECT_BEGDATE` date NOT NULL COMMENT '开始日期',
  `PROJECT_ENDDATE` date NOT NULL COMMENT '结束日期',
  `PROJECT_NUMBER` int(11) NOT NULL COMMENT '项目编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nt_per_alias`
--

DROP TABLE IF EXISTS `nt_per_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nt_per_alias` (
  `PER_ID` int(11) NOT NULL COMMENT '员工编号',
  `PROJECT_NUMBER` int(11) NOT NULL COMMENT '项目编号',
  `IN_PROJECT_NAME` varchar(50) CHARACTER SET gbk NOT NULL COMMENT '项目中姓名',
  `IN_COMPANY_NAME` varchar(50) CHARACTER SET gbk NOT NULL COMMENT '在司姓名',
  `ID_NO` varchar(18) DEFAULT NULL COMMENT '身份证号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nt_per_in_project`
--

DROP TABLE IF EXISTS `nt_per_in_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nt_per_in_project` (
  `PER_ID` int(11) NOT NULL COMMENT '员工编号',
  `PROJECT_NUMBER` int(11) NOT NULL COMMENT '所在项目编号',
  `IN_PROJECT_LEAVE` varchar(2) NOT NULL COMMENT '所在项目级别',
  `PROJECT_BEGDATE` date DEFAULT NULL COMMENT '开始日期',
  `PROJECT_ENDDATE` date DEFAULT NULL COMMENT '结束日期',
  `WORK_TYPE` char(1) DEFAULT NULL COMMENT '工作类别',
  `ID_NO` varchar(18) DEFAULT NULL COMMENT '身份证号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nt_personnel`
--

DROP TABLE IF EXISTS `nt_personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nt_personnel` (
  `PER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `DEPT_ID` int(11) DEFAULT NULL COMMENT '部门编号',
  `SEX` char(1) DEFAULT NULL COMMENT '性别',
  `NAME` varchar(50) DEFAULT NULL COMMENT '姓名',
  `MOBILE_NO` varchar(11) DEFAULT NULL COMMENT '手机号',
  `ID_NO` varchar(20) NOT NULL COMMENT '身份证号',
  `BIRTHDAY` date DEFAULT NULL COMMENT '生日',
  `ETHNIC` varchar(50) DEFAULT NULL COMMENT '民族',
  `EDUCATION` varchar(10) DEFAULT NULL COMMENT '学历',
  `UNIVERSITY` varchar(50) DEFAULT NULL COMMENT '院校',
  `MAJOR` varchar(50) DEFAULT NULL COMMENT '专业',
  `GRADUATION_DATE` date DEFAULT NULL COMMENT '毕业日期',
  `ENTRY_DATE` date DEFAULT NULL COMMENT '入司日期',
  `LEAVE_DATE` date DEFAULT NULL COMMENT '离职日期',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态',
  `POSITION` char(1) DEFAULT NULL COMMENT '职位',
  `COMPANY_EMAIL` varchar(100) DEFAULT NULL COMMENT '公司邮箱',
  `PERSON_EMAIL` varchar(100) DEFAULT NULL COMMENT '私人邮箱',
  `POST` char(1) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PER_ID`,`ID_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nt_personnel_apply`
--

DROP TABLE IF EXISTS `nt_personnel_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nt_personnel_apply` (
  `APPLY_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务号',
  `PER_ID` int(11) NOT NULL COMMENT '员工编号',
  `APPLY_DATE` datetime NOT NULL COMMENT '申请日期',
  `APPLY_TYPE` char(1) CHARACTER SET gbk NOT NULL COMMENT '申请类型',
  `APPLY_VALUE` varchar(10) DEFAULT NULL COMMENT '申请值',
  `WORK_DATE` date NOT NULL COMMENT '考勤日期',
  `APPLY_STATUS` char(1) CHARACTER SET gbk NOT NULL COMMENT '处理状态',
  `ERR_DESCRIBE` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '错误描述',
  `APPROVE_DATE` datetime DEFAULT NULL COMMENT '审批日期',
  `MANAGER_ID` int(11) DEFAULT NULL COMMENT '审批人编号',
  `FILE_PATH` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '附件路径',
  `FILE_NAME` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '附件名称',
  `APPROVE_OPN` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '审批意见',
  PRIMARY KEY (`APPLY_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nt_project_info`
--

DROP TABLE IF EXISTS `nt_project_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nt_project_info` (
  `PROJECT_NUMBER` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目编号',
  `PROJECT_NAME` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `CUST_TYPE` char(1) DEFAULT NULL COMMENT '客户类别',
  `DEPT_ID` int(11) DEFAULT NULL COMMENT '所属部门编号',
  `CHARGE_ID` int(11) DEFAULT NULL COMMENT '在场负责人',
  PRIMARY KEY (`PROJECT_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nt_type_dictionaries`
--

DROP TABLE IF EXISTS `nt_type_dictionaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nt_type_dictionaries` (
  `TYPE_CODE` varchar(50) NOT NULL COMMENT '类别编码',
  `TYPE_NAME` varchar(50) DEFAULT NULL COMMENT '类别名称',
  PRIMARY KEY (`TYPE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nt_working_hours`
--

DROP TABLE IF EXISTS `nt_working_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nt_working_hours` (
  `PER_ID` int(11) NOT NULL COMMENT '员工编号',
  `WORK_DATE` int(11) NOT NULL COMMENT '考勤日期',
  `NORMAL_HOURS` float DEFAULT NULL COMMENT '正常工时',
  `OVERTIME_HOURS` float DEFAULT NULL COMMENT '加班工时',
  `SIGNIN_TIME` time DEFAULT NULL COMMENT '签到时间',
  `SIGNBACK_TIME` time DEFAULT NULL COMMENT '签退时间',
  PRIMARY KEY (`PER_ID`,`WORK_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04  9:30:29
