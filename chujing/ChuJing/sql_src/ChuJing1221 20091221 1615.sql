-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.37-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema chujing
--

CREATE DATABASE IF NOT EXISTS chujing;
USE chujing;

--
-- Definition of table `t_case`
--

DROP TABLE IF EXISTS `t_case`;
CREATE TABLE `t_case` (
  `CASE_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CASE_TITLE` varchar(45) DEFAULT NULL,
  `CASE_INTRODUCTION` varchar(1000) DEFAULT NULL,
  `CASE_CUSTOMER` varchar(45) DEFAULT NULL,
  `CASE_PUBLISH_TIME` datetime DEFAULT NULL,
  `CASE_3D_PATH` varchar(200) DEFAULT NULL,
  `CASE_RAR_PATH` varchar(200) DEFAULT NULL,
  `CASE_3D_SIZE` int(10) unsigned DEFAULT NULL,
  `CASE_RAR_SIZE` int(10) unsigned DEFAULT NULL,
  `CASE_SCREENSHOT1` varchar(200) DEFAULT NULL,
  `CASE_SCREENSHOT2` varchar(200) DEFAULT NULL,
  `CASE_SCREENSHOT3` varchar(200) DEFAULT NULL,
  `CASE_SCREENSHOT4` varchar(200) DEFAULT NULL,
  `CASE_SCREENSHOT5` varchar(200) DEFAULT NULL,
  `CASE_STAR` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`CASE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_case`
--

/*!40000 ALTER TABLE `t_case` DISABLE KEYS */;
INSERT INTO `t_case` (`CASE_ID`,`CASE_TITLE`,`CASE_INTRODUCTION`,`CASE_CUSTOMER`,`CASE_PUBLISH_TIME`,`CASE_3D_PATH`,`CASE_RAR_PATH`,`CASE_3D_SIZE`,`CASE_RAR_SIZE`,`CASE_SCREENSHOT1`,`CASE_SCREENSHOT2`,`CASE_SCREENSHOT3`,`CASE_SCREENSHOT4`,`CASE_SCREENSHOT5`,`CASE_STAR`) VALUES 
 (20,'21342134','234','123',NULL,'200911721125986.unity3d','200911721125929.rar',5,5,'200911721125990.jpg','200911721125924.jpg','200911721125933.jpg','200911721125940.jpg','200911721125987.jpg',4),
 (21,'3','13123123','123',NULL,'200911721134682.unity3d','200911721134659.rar',5,5,'200911721134633.jpg','200911721134624.jpg','200911721134672.jpg','200911721134663.jpg','200911721134671.jpg',1),
 (22,'null','testsdffdsf','testsdf',NULL,'200911821472029.unity3d','200911821472066.rar',5,5,'200911821472045.jpg','200911821472011.jpg','200911821472090.jpg','200911821472076.jpg','200911821472018.jpg',3),
 (33,'下次vxcv','下次vxcv','市地方是的xcv','2009-12-21 16:03:45','200911211634579.unity3d','200911211634553.rar',5,5,'200911211634559.jpg','200911211634555.jpg','20091121163450.jpg','200911211634573.jpg','200911211634546.jpg',5);
/*!40000 ALTER TABLE `t_case` ENABLE KEYS */;


--
-- Definition of table `t_job`
--

DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `JOB_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `JOB_TITLE` varchar(45) DEFAULT NULL,
  `JOB_CONTENT` varchar(1000) DEFAULT NULL,
  `JOB_PUBLISH_TIME` datetime DEFAULT NULL,
  `JOB_AVAILABLE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`JOB_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_job`
--

/*!40000 ALTER TABLE `t_job` DISABLE KEYS */;
INSERT INTO `t_job` (`JOB_ID`,`JOB_TITLE`,`JOB_CONTENT`,`JOB_PUBLISH_TIME`,`JOB_AVAILABLE_TIME`) VALUES 
 (1,'JOB1','FOR JOB1',NULL,'2009-12-26 00:00:00'),
 (2,'JOB2','JOB2',NULL,NULL),
 (3,'JOB3','JOB3',NULL,NULL),
 (4,'JOB4',NULL,NULL,NULL),
 (5,'玩儿','巍峨巍峨','2009-12-21 15:12:38','2009-12-25 00:00:00');
/*!40000 ALTER TABLE `t_job` ENABLE KEYS */;


--
-- Definition of table `t_news`
--

DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `NEWS_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NEWS_TITLE` varchar(200) DEFAULT NULL,
  `NEWS_CONTENT` varchar(1000) DEFAULT NULL,
  `NEWS_PUBLISH_TIME` datetime DEFAULT NULL,
  `NEWS_MODIFIED_TIME` datetime DEFAULT NULL,
  `FILENAME` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`NEWS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_news`
--

/*!40000 ALTER TABLE `t_news` DISABLE KEYS */;
INSERT INTO `t_news` (`NEWS_ID`,`NEWS_TITLE`,`NEWS_CONTENT`,`NEWS_PUBLISH_TIME`,`NEWS_MODIFIED_TIME`,`FILENAME`) VALUES 
 (2,'VRP-TRAVEL荣获首届仿真软件一等奖','VRP-TRAVEL荣获首届仿真软件一等奖VRP-TRAVEL荣获首届仿真软件一等奖VRP-TRAVEL荣获首届仿真软件一等奖VRP-TRAVEL荣获首届仿真软件一等奖VRP-TRAVEL荣获首届仿真软件一等奖VRP-TRAVEL荣获首届仿真软件一等奖VRP-TRAVEL荣获首届仿真软件一等奖VRP-TRAVEL荣获首届仿真软件一等奖','2009-11-19 00:00:00','2009-11-30 00:00:00',NULL),
 (3,'中视典09年重点项目介绍','中视典09年重点项目介绍中视典09年重点项目介绍中视典09年重点项目介绍中视典09年重点项目介绍中视典09年重点项目介绍中视典09年重点项目介绍中视典09年重点项目介绍中视典09年重点项目介绍','2009-11-19 00:00:00','2009-11-30 00:00:00',NULL),
 (4,'2009高校暑期虚拟现实联合培训在京取得圆满成功','2009高校暑期虚拟现实联合培训在京取得圆满成功2009高校暑期虚拟现实联合培训在京取得圆满成功2009高校暑期虚拟现实联合培训在京取得圆满成功2009高校暑期虚拟现实联合培训在京取得圆满成功2009高校暑期虚拟现实联合培训在京取得圆满成功2009高校暑期虚拟现实联合培训在京取得圆满成功2009高校暑期虚拟现实联合培训在京取得圆满成功2009高校暑期虚拟现实联合培训在京取得圆满成功','2009-11-19 00:00:00','2009-11-30 00:00:00',NULL),
 (5,'Siggraph2009 中视典再度出击！','Siggraph2009 中视典再度出击！Siggraph2009 中视典再度出击！Siggraph2009 中视典再度出击！Siggraph2009 中视典再度出击！Siggraph2009 中视典再度出击！Siggraph2009 中视典再度出击！Siggraph2009 中视典再度出击！Siggraph2009 中视典再度出击！Siggraph2009 中视典再度出击！','2009-11-19 00:00:00','2009-11-30 00:00:00',NULL),
 (6,'第30期VRP正版客户培训班在京圆满结束','第30期VRP正版客户培训班在京圆满结束第30期VRP正版客户培训班在京圆满结束第30期VRP正版客户培训班在京圆满结束第30期VRP正版客户培训班在京圆满结束第30期VRP正版客户培训班在京圆满结束第30期VRP正版客户培训班在京圆满结束第30期VRP正版客户培训班在京圆满结束','2009-11-19 00:00:00','2009-11-30 00:00:00',NULL),
 (7,'虚拟现实技术应用和发展全国百所院校巡回讲座','虚拟现实技术应用和发展全国百所院校巡回讲座虚拟现实技术应用和发展全国百所院校巡回讲座虚拟现实技术应用和发展全国百所院校巡回讲座虚拟现实技术应用和发展全国百所院校巡回讲座虚拟现实技术应用和发展全国百所院校巡回讲座','2009-11-19 00:00:00','2009-11-30 00:00:00',NULL),
 (8,'“VR-Platform三维互动制作大赛”第19期评选结果揭晓！','“VR-Platform三维互动制作大赛”第19期评选结果揭晓！“VR-Platform三维互动制作大赛”第19期评选结果揭晓！“VR-Platform三维互动制作大赛”第19期评选结果揭晓！“VR-Platform三维互动制作大赛”第19期评选结果揭晓！“VR-Platform三维互动制作大赛”第19期评选结果揭晓！“VR-Platform三维互动制作大赛”第19期评选结果揭晓！','2009-11-19 00:00:00','2009-11-30 00:00:00',NULL),
 (9,'上海交大昂立学院虚拟现实培训班火热招生','上海交大昂立学院虚拟现实培训班火热招生上海交大昂立学院虚拟现实培训班火热招生上海交大昂立学院虚拟现实培训班火热招生上海交大昂立学院虚拟现实培训班火热招生上海交大昂立学院虚拟现实培训班火热招生上海交大昂立学院虚拟现实培训班火热招生','2009-11-19 00:00:00','2009-11-30 00:00:00',NULL),
 (11,'sdfsd是否地方','市地方&nbsp; 市地方','2009-11-29 22:13:36',NULL,NULL),
 (12,'sdfsd是否地方','市地方&nbsp; 市地方','2009-11-29 22:14:18',NULL,NULL),
 (13,'fsdf','dfsdf','2009-12-06 23:17:41',NULL,NULL),
 (14,'sdf','fsdfsdf','2009-12-06 23:17:51',NULL,NULL),
 (15,'sss','ssss','2009-12-16 19:31:57',NULL,NULL),
 (16,'市地方','斯蒂芬速度','2009-12-21 13:44:45',NULL,NULL),
 (18,'sdf','&nbsp;fds fsd f','2009-12-21 14:44:14',NULL,'2009112114441431.jpg'),
 (19,'sdf','&nbsp;fds fsd f','2009-12-21 14:48:03',NULL,'200911211448365.jpg'),
 (20,' 发市地方 是的发','生的辅导书','2009-12-21 15:02:29',NULL,NULL),
 (21,'市地方','市地方','2009-12-21 15:06:51',NULL,NULL),
 (22,'是的发市地方是地方','斯蒂芬斯蒂芬斯蒂芬速度丰富的说法市地方','2009-12-21 16:04:23',NULL,'200911211642371.jpg');
/*!40000 ALTER TABLE `t_news` ENABLE KEYS */;


--
-- Definition of table `t_user_info`
--

DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE `t_user_info` (
  `USERID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_user_info`
--

/*!40000 ALTER TABLE `t_user_info` DISABLE KEYS */;
INSERT INTO `t_user_info` (`USERID`,`USERNAME`,`PASSWORD`) VALUES 
 (1,'admin','admin');
/*!40000 ALTER TABLE `t_user_info` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
