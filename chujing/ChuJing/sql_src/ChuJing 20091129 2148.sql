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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_case`
--

/*!40000 ALTER TABLE `t_case` DISABLE KEYS */;
INSERT INTO `t_case` (`CASE_ID`,`CASE_TITLE`,`CASE_INTRODUCTION`,`CASE_CUSTOMER`,`CASE_PUBLISH_TIME`,`CASE_3D_PATH`,`CASE_RAR_PATH`,`CASE_3D_SIZE`,`CASE_RAR_SIZE`,`CASE_SCREENSHOT1`,`CASE_SCREENSHOT2`,`CASE_SCREENSHOT3`,`CASE_SCREENSHOT4`,`CASE_SCREENSHOT5`,`CASE_STAR`) VALUES 
 (1,'虚拟家居-互动看房 ','虚拟家居是一个非一般的网上互动看房程序','hhh',NULL,'test.unity3d','test.rar',5,NULL,'1.jpg','2.jpg','3.jpg','4.jpg','5.jpg',5),
 (2,'虚拟家居-互动看房 ','虚拟家居是一个非一般的网上互动看房程序，玩者可以通过点击相应的按钮从而改变可以改变家居布局、功用及装修用色等,在漫游功能方面我用了FPS游戏式的镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。','hhh',NULL,'test.unity3d','test.rar',5,NULL,'1.jpg','2.jpg','3.jpg','4.jpg','5.jpg',4),
 (3,'虚拟家居-互动看房 ','虚拟家居是一个非一般的网上互动看房程序，玩者可以通过点击相应的按钮从而改变可以改变家居布局、功用及装修用色等,在漫游功能方面我用了FPS游戏式的镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。','hhh',NULL,'test.unity3d','test.rar',5,NULL,'1.jpg','2.jpg','3.jpg','4.jpg','5.jpg',3),
 (4,'虚拟家居-互动看房 ','虚拟家居是一个非一般的网上互动看房程序，玩者可以通过点击相应的按钮从而改变可以改变家居布局、功用及装修用色等,在漫游功能方面我用了FPS游戏式的镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。','hhh',NULL,'test.unity3d','test.rar',5,NULL,'1.jpg','2.jpg','3.jpg','4.jpg','5.jpg',2),
 (5,'虚拟家居-互动看房 ','虚拟家居是一个非一般的网上互动看房程序，玩者可以通过点击相应的按钮从而改变可以改变家居布局、功用及装修用色等,在漫游功能方面我用了FPS游戏式的镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。','hhh',NULL,'test.unity3d','test.rar',5,NULL,'1.jpg','2.jpg','3.jpg','4.jpg','5.jpg',1),
 (6,'虚拟家居-互动看房 ','虚拟家居是一个非一般的网上互动看房程序，玩者可以通过点击相应的按钮从而改变可以改变家居布局、功用及装修用色等,在漫游功能方面我用了FPS游戏式的镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。','hhh',NULL,'test.unity3d','test.rar',5,NULL,'1.jpg','2.jpg','3.jpg','4.jpg','5.jpg',2),
 (7,'虚拟家居-互动看房 ','虚拟家居是一个非一般的网上互动看房程序，玩者可以通过点击相应的按钮从而改变可以改变家居布局、功用及装修用色等,在漫游功能方面我用了FPS游戏式的镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。','hhhh',NULL,'test.unity3d','test.rar',5,NULL,'1.jpg','2.jpg','3.jpg','4.jpg','5.jpg',4),
 (8,'虚拟家居-互动看房 ','虚拟家居是一个非一般的网上互动看房程序，玩者可以通过点击相应的按钮从而改变可以改变家居布局、功用及装修用色等,在漫游功能方面我用了FPS游戏式的镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。镜头，如当走到门前时加入了开门动作的互动效果，个人的体验。','hhh',NULL,'test.unity3d','test.rar',5,NULL,'1.jpg','2.jpg','3.jpg','4.jpg','5.jpg',5),
 (9,'上海交大昂立学院虚拟现实培训班火热招生','·“VR-Platform三维互动制作大赛”第19期评选结果揭晓！\r\n·“VR-Platform三维互动制作大赛”第19期评选结果揭晓！\r\n·“VR-Platform三维互动制作大赛”第19期评选结果揭晓！\r\n上海交大昂立学院虚拟现实培训班火热招生上海交大昂立学院虚拟现实培训班火热招生上海交大昂立学院虚拟现实培训班火热招生上海交大昂立学院虚拟现实培训班火热招生上海交大昂立学院虚拟现实培训班火热招生上海交大昂立学院虚拟现实培训班火热招生上海交大昂立学院虚拟现实培训班火热招生上海交大昂立学院虚拟现实培训班火热招生','hhh',NULL,'test.unity3d','test.rar',5,NULL,'1.jpg','2.jpg','3.jpg','4.jpg','5.jpg',1),
 (10,'VR-Platform三维互动制作大赛”第19期评选结果揭晓！','VR-Platform三维互动制作大赛”第19期评选结果揭晓！\r\nVR-Platform三维互动制作大赛”第19期评选结果揭晓！\r\nVR-Platform三维互动制作大赛”第19期评选结果揭晓！\r\nVR-Platform三维互动制作大赛”第19期评选结果揭晓！\r\nVR-Platform三维互动制作大赛”第19期评选结果揭晓！\r\n','hhh',NULL,'test.unity3d','test.rar',5,NULL,'1.jpg','2.jpg','3.jpg','4.jpg','5.jpg',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_job`
--

/*!40000 ALTER TABLE `t_job` DISABLE KEYS */;
INSERT INTO `t_job` (`JOB_ID`,`JOB_TITLE`,`JOB_CONTENT`,`JOB_PUBLISH_TIME`,`JOB_AVAILABLE_TIME`) VALUES 
 (1,'JOB1','FOR JOB1',NULL,NULL),
 (2,'JOB2','JOB2',NULL,NULL),
 (3,'JOB3','JOB3',NULL,NULL),
 (4,'JOB4',NULL,NULL,NULL);
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
  PRIMARY KEY (`NEWS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_news`
--

/*!40000 ALTER TABLE `t_news` DISABLE KEYS */;
INSERT INTO `t_news` (`NEWS_ID`,`NEWS_TITLE`,`NEWS_CONTENT`,`NEWS_PUBLISH_TIME`,`NEWS_MODIFIED_TIME`) VALUES 
 (1,'【VR-Platform正版客户培训，第32期】通知','【VR-Platform正版客户培训，第32期】通知【VR-Platform正版客户培训，第32期】通知【VR-Platform正版客户培训，第32期】通知【VR-Platform正版客户培训，第32期】通知【VR-Platform正版客户培训，第32期】通知【VR-Platform正版客户培训，第32期】通知【VR-Platform正版客户培训，第32期】通知【VR-Platform正版客户培训，第32期】通知','2009-11-19 00:00:00','2009-11-30 00:00:00'),
 (2,'VRP-TRAVEL荣获首届仿真软件一等奖','VRP-TRAVEL荣获首届仿真软件一等奖VRP-TRAVEL荣获首届仿真软件一等奖VRP-TRAVEL荣获首届仿真软件一等奖VRP-TRAVEL荣获首届仿真软件一等奖VRP-TRAVEL荣获首届仿真软件一等奖VRP-TRAVEL荣获首届仿真软件一等奖VRP-TRAVEL荣获首届仿真软件一等奖VRP-TRAVEL荣获首届仿真软件一等奖','2009-11-19 00:00:00','2009-11-30 00:00:00'),
 (3,'中视典09年重点项目介绍','中视典09年重点项目介绍中视典09年重点项目介绍中视典09年重点项目介绍中视典09年重点项目介绍中视典09年重点项目介绍中视典09年重点项目介绍中视典09年重点项目介绍中视典09年重点项目介绍','2009-11-19 00:00:00','2009-11-30 00:00:00'),
 (4,'2009高校暑期虚拟现实联合培训在京取得圆满成功','2009高校暑期虚拟现实联合培训在京取得圆满成功2009高校暑期虚拟现实联合培训在京取得圆满成功2009高校暑期虚拟现实联合培训在京取得圆满成功2009高校暑期虚拟现实联合培训在京取得圆满成功2009高校暑期虚拟现实联合培训在京取得圆满成功2009高校暑期虚拟现实联合培训在京取得圆满成功2009高校暑期虚拟现实联合培训在京取得圆满成功2009高校暑期虚拟现实联合培训在京取得圆满成功','2009-11-19 00:00:00','2009-11-30 00:00:00'),
 (5,'Siggraph2009 中视典再度出击！','Siggraph2009 中视典再度出击！Siggraph2009 中视典再度出击！Siggraph2009 中视典再度出击！Siggraph2009 中视典再度出击！Siggraph2009 中视典再度出击！Siggraph2009 中视典再度出击！Siggraph2009 中视典再度出击！Siggraph2009 中视典再度出击！Siggraph2009 中视典再度出击！','2009-11-19 00:00:00','2009-11-30 00:00:00'),
 (6,'第30期VRP正版客户培训班在京圆满结束','第30期VRP正版客户培训班在京圆满结束第30期VRP正版客户培训班在京圆满结束第30期VRP正版客户培训班在京圆满结束第30期VRP正版客户培训班在京圆满结束第30期VRP正版客户培训班在京圆满结束第30期VRP正版客户培训班在京圆满结束第30期VRP正版客户培训班在京圆满结束','2009-11-19 00:00:00','2009-11-30 00:00:00'),
 (7,'虚拟现实技术应用和发展全国百所院校巡回讲座','虚拟现实技术应用和发展全国百所院校巡回讲座虚拟现实技术应用和发展全国百所院校巡回讲座虚拟现实技术应用和发展全国百所院校巡回讲座虚拟现实技术应用和发展全国百所院校巡回讲座虚拟现实技术应用和发展全国百所院校巡回讲座','2009-11-19 00:00:00','2009-11-30 00:00:00'),
 (8,'“VR-Platform三维互动制作大赛”第19期评选结果揭晓！','“VR-Platform三维互动制作大赛”第19期评选结果揭晓！“VR-Platform三维互动制作大赛”第19期评选结果揭晓！“VR-Platform三维互动制作大赛”第19期评选结果揭晓！“VR-Platform三维互动制作大赛”第19期评选结果揭晓！“VR-Platform三维互动制作大赛”第19期评选结果揭晓！“VR-Platform三维互动制作大赛”第19期评选结果揭晓！','2009-11-19 00:00:00','2009-11-30 00:00:00'),
 (9,'上海交大昂立学院虚拟现实培训班火热招生','上海交大昂立学院虚拟现实培训班火热招生上海交大昂立学院虚拟现实培训班火热招生上海交大昂立学院虚拟现实培训班火热招生上海交大昂立学院虚拟现实培训班火热招生上海交大昂立学院虚拟现实培训班火热招生上海交大昂立学院虚拟现实培训班火热招生','2009-11-19 00:00:00','2009-11-30 00:00:00');
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
