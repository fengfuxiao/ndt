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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `u_username` varchar(45) NOT NULL COMMENT '用户名，必填',
  `u_password` varchar(255) NOT NULL COMMENT '密码，必填',
  `u_nickname` varchar(45) DEFAULT NULL COMMENT '用户昵称',
  `u_age` varchar(45) DEFAULT NULL COMMENT '用户年龄',
  `u_gender` varchar(45) DEFAULT NULL COMMENT '用户性别',
  `u_address` varchar(45) DEFAULT NULL COMMENT '用户住址',
  `u_avatar` varchar(45) DEFAULT NULL COMMENT '用户头像',
  `r_id` int(11) NOT NULL DEFAULT '1' COMMENT '角色id，默认1。1-普通用户；2-管理员',
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_id_UNIQUE` (`u_id`),
  KEY `fk_u_r_id` (`r_id`),
  CONSTRAINT `fk_u_r_id` FOREIGN KEY (`r_id`) REFERENCES `role` (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'WangMin','','王敏','21','女','天津',NULL,1),(8,'XiaoLi','','小李','21','男','天津市','',1),(14,'XiaoDong','$2a$10$dSPZwVc3NKHUQv7hxHINLeUDtVxxJLoflO0bIvXwIRw1ShEYYbzRu','小董','22','男','河南省','',2),(17,'XiaoZhou','$2a$10$JrUZlL8n1bigjGY1Zdyl5u/aldptqTtcUmzJXBRoLzzIUfO0wUm5G','小周','39','男','河南省','',2),(20,'XiaoFe','$2a$10$JVH2vETVJYq42q1Hhb6P7OYNMDoWGnQbt2CUqOIvHHxQv9LDqSluW','小Fe','20','男','北京市','',1),(21,'XiaoFeng','$2a$10$C1FKR1CCI/lecJWTK3ZF6OOXI6oLPqXwrf6OBuOA3pG5JLd12eHiG','小冯','21','男','广州市','',2),(22,'123','$2a$10$U1xHOiIXDHrlgHuGe4XF7ue02lFEtRp.FdfFk/yhxCzxyuqEnH/Ty','123123','12','男','123123','',1),(24,'XiaoQ','$2a$10$2WRxryCWWl5CdpV6wl4gieBZBgmMtP8FSHeL4anolSkkYAQo1m4y.','小Q','22','女','河南省','',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
