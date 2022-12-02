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
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `a_manager_id` int(11) NOT NULL COMMENT '发布公告的管理员id',
  `a_manager_name` varchar(45) NOT NULL COMMENT '发布公告管理员的姓名',
  `a_issuetime` varchar(45) NOT NULL COMMENT '公告发布时间',
  `a_title` varchar(45) NOT NULL COMMENT '公告标题',
  `a_content` varchar(255) NOT NULL COMMENT '公告内容',
  `a_isrequire` int(11) NOT NULL COMMENT '公告是否必读',
  PRIMARY KEY (`a_id`),
  UNIQUE KEY `a_id_UNIQUE` (`a_id`),
  KEY `fk_amanager_id_idx` (`a_manager_id`),
  CONSTRAINT `fk_amanager_id` FOREIGN KEY (`a_manager_id`) REFERENCES `user` (`u_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` VALUES (29,4,'WangMin','2022-10-25 09:14:54','飞狗MOCO TOP 34 飞狗MOCO','本作品围绕着这只“身残志坚”的小柯基MOCO与它的主人YUMMY（雅米），讲述他们时而搞怪、时而温馨的日常。',1),(31,17,'XiaoZhou','2022-10-25 09:19:18','贝肯熊 第6季 TOP 35 贝肯熊 第6季','本剧以贝肯的生活视角重新演绎现实大众的辛苦不易，如外卖员赶送外卖、农夫抵御恶劣天气、住院病人行动不便、上班族找停车位的艰难等等。生活中的挫折虽让贝肯频频碰壁，但片中贝肯直面困难，越战越勇，让故事有了苦中作乐的况味，也让人在生活中多了几分勇气！',1),(32,17,'XiaoZhou','2022-10-25 09:19:53','宝宝巴士 TOP 36 宝宝巴士','宝宝巴士通过轻松活泼的音乐极大地吸引宝宝的注意力，在潜移默化地实现宝宝各方面能力逐步提升的同时，使其心灵空间亦能得到同步发展，让宝宝变得更加优秀。适宜0-6岁儿童观看。',0),(33,17,'XiaoZhou','2022-10-25 09:20:21','宝贝赳赳 第3季 TOP 37 宝贝赳赳 第3季','适龄启蒙，亲子共学。原《超级宝贝JoJo 第3季》。随着宝宝的成长这一季从简单的模仿学习到学习时带有自己的思考。从家庭拓展至户外，去海洋馆认识生物和家人去钓鱼学习专心的重要。更进一步协助家长，帮助孩子学习进阶生活技能，促进身心健康发展。',0),(34,17,'XiaoZhou','2022-10-25 09:20:33','爱探险的朵拉 第八季 TOP 38 爱探险的朵拉 第八季','一个留着棕褐色短发、穿着粉红色外衣、背着紫色小书包的小女孩精灵活现地跳跃在你的面前，脸上带着活泼的笑容，她将是带领孩子走进启蒙乐园的小导游,更是孩子们熟悉的小伙伴——朵拉',0),(35,17,'XiaoZhou','2022-10-25 09:20:43','捷德奥特曼 TOP 39 捷德奥特曼','奥特战士与贝利亚之间的战斗被地球人奉为传说一直流传了下来。在六年前的地球上曾出现过怪兽，那场混乱平息之后，人们一直过着和平的日子。主人公朝仓陆从小不知道自己的双亲是谁。',1),(36,17,'XiaoZhou','2022-10-25 09:23:49','都市喵奇谭 TOP 41 都市喵奇谭','漫画中的猫妖夜瞳、威廉通过和人类进行“灵魂”交易，从而吸收交易者的灵魂增加修行，修炼成仙。在一场场交易中，与红羽、蓝凌等人发生了有趣的故事',1);
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
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
