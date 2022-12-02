-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: suda
-- ------------------------------------------------------
-- Server version	5.7.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(45) NOT NULL COMMENT '权限名称，按钮名称',
  `path` varchar(255) NOT NULL COMMENT '按钮路径',
  `component` varchar(45) NOT NULL COMMENT '按钮组件路径',
  `icon` varchar(45) DEFAULT NULL COMMENT '按钮图标',
  `title` varchar(45) DEFAULT NULL COMMENT '按钮title标题',
  `isShow` tinyint(4) DEFAULT NULL COMMENT '按钮是否展示，0-不展示；1-展示',
  `father_id` int(11) DEFAULT NULL COMMENT '父权限id',
  PRIMARY KEY (`p_id`),
  UNIQUE KEY `p_id_UNIQUE` (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'Login','/login','/login/Login.vue',NULL,'登录',0,NULL),(2,'Register','/register','/register/Register.vue',NULL,'注册',0,NULL),(3,'UserInfo','user','/user/UserInfo.vue','fa fa-genderless','用户信息',1,20),(4,'SearchOrder','searchorder','/order/SearchOrder.vue','fa fa-genderless','订单查询',1,21),(5,'AddPermission','addpermission','/permission/AddPermission.vue','fa fa-genderless','添加权限',1,22),(6,'ChangeRole','changerole','/role/ChangeRole.vue','fa fa-genderless','变更角色',1,23),(7,'LookAnnouncement','lookannouncement','/announcement/LookAnnouncement.vue','fa fa-genderless','查看公告',1,24),(8,'IssueAnnouncement','issueannouncement','/announcement/IssueAnnouncement.vue','fa fa-genderless','发布公告',1,24),(9,'PermissionManager','permissionmanager','/permission/PermissionManager.vue','fa fa-genderless','权限管理',1,22),(10,'测试2','/test2','',NULL,NULL,0,NULL),(11,'PersonalMessage','personalmessage','/personal/PersonalMessage.vue','fa fa-genderless','个人信息',1,25),(19,'Main','/main','/Main.vue','fa fa-home','首页',1,NULL),(20,'User','/main','/Main.vue','fa fa-users','用户',1,NULL),(21,'Order','/main','/Main.vue','fa fa-list-alt','订单',1,NULL),(22,'Permission','/main','/Main.vue','fa fa-key','权限',1,NULL),(23,'Role','/main','/Main.vue','fa fa-user-o','角色',1,NULL),(24,'Announcement','/main','/Main.vue','fa fa-bullhorn','公告',1,NULL),(25,'Personal','/main','/Main.vue','fa fa-address-card','个人',1,NULL);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-02 15:27:03
