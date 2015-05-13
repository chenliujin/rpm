-- MySQL dump 10.13  Distrib 5.1.71, for redhat-linux-gnu (x86_64)
--
-- Host: vm2    Database: zencart
-- ------------------------------------------------------
-- Server version	5.1.71

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
-- Table structure for table `countries`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `countries_id` int(11) NOT NULL AUTO_INCREMENT,
  `countries_name` varchar(64) NOT NULL DEFAULT '' COMMENT '英文名称',
  `countries_name_cn` varchar(64) NOT NULL DEFAULT '0' COMMENT '中文名称',
  `countries_iso_code_2` char(2) NOT NULL DEFAULT '',
  `countries_iso_code_3` char(3) NOT NULL DEFAULT '',
  `countries_iso_language` char(2) NOT NULL DEFAULT '',
  `countries_iso_currency` char(3) NOT NULL DEFAULT '',
  `continent` varchar(45) NOT NULL COMMENT '亚洲：Asia\n欧洲：Europe\n非洲：Africa\n北美洲：North America\n南美洲：South America\n大洋洲：Oceania\n南极洲：Antarctica\n',
  `time_zone` float NOT NULL DEFAULT '0' COMMENT '时区',
  `address_format_id` int(11) NOT NULL DEFAULT '0',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`countries_id`),
  KEY `idx_countries_name_zen` (`countries_name`),
  KEY `idx_address_format_id_zen` (`address_format_id`),
  KEY `idx_iso_2_zen` (`countries_iso_code_2`),
  KEY `idx_iso_3_zen` (`countries_iso_code_3`)
) ENGINE=MyISAM AUTO_INCREMENT=1242 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (240,'Aaland Islands','','AX','ALA','en','','',3,1,'2015-05-13 08:36:33'),(1,'Afghanistan','阿富汗','AF','AFG','en','','',4.5,1,'2015-05-13 08:36:33'),(2,'Albania','阿尔巴尼亚','AL','ALB','en','','',2,1,'2015-05-13 08:36:33'),(3,'Algeria','阿尔及利亚','DZ','DZA','ar','DZD','',1,1,'2015-05-13 08:36:33'),(4,'American Samoa','','AS','ASM','en','','',-11,1,'2015-05-13 08:36:33'),(5,'Andorra','安道尔共和国','AD','AND','en','','',2,1,'2015-05-13 08:36:33'),(6,'Angola','','AO','AGO','pt','','',1,1,'2015-05-13 08:36:33'),(7,'Anguilla','','AI','AIA','en','','',-4,1,'2015-05-13 08:36:33'),(8,'Antarctica','','AQ','ATA','en','','',-3,1,'2015-05-13 08:36:33'),(9,'Antigua and Barbuda','安提瓜岛和巴布达岛','AG','ATG','en','','',-4,1,'2015-05-13 08:36:33'),(10,'Argentina','阿根廷','AR','ARG','es','ARS','',-3,1,'2015-05-13 08:36:33'),(11,'Armenia','亚美尼亚','AM','ARM','ru','','',4,1,'2015-05-13 08:36:33'),(12,'Aruba','阿鲁巴岛[拉丁美洲]','AW','ABW','en','','',-4,1,'2015-05-13 08:36:33'),(13,'Australia','澳大利亚','AU','AUS','en','AUD','',10,1,'2015-05-13 08:36:33'),(14,'Austria','奥地利','AT','AUT','de','EUR','',2,5,'2015-05-13 08:36:33'),(15,'Azerbaijan Republic','阿塞拜疆','AZ','AZE','ru','','',5,1,'2015-05-13 08:36:33'),(16,'Bahamas','巴哈马群岛','BS','BHS','en','','',-4,1,'2015-05-13 08:36:33'),(17,'Bahrain','巴林群岛','BH','BHR','ar','','',3,1,'2015-05-13 08:36:33'),(18,'Bangladesh','孟加拉国[亚洲]','BD','BGD','en','','',6,1,'2015-05-13 08:36:33'),(19,'Barbados','巴巴多斯岛','BB','BRB','en','','',-4,1,'2015-05-13 08:36:33'),(20,'Belarus','白俄罗斯','BY','BLR','ru','','',3,1,'2015-05-13 08:36:33'),(21,'Belgium','比利时','BE','BEL','fr','EUR','',2,1,'2015-05-13 08:36:33'),(22,'Belize','','BZ','BLZ','en','','',-6,1,'2015-05-13 08:36:33'),(23,'Benin','','BJ','BEN','fr','','',1,1,'2015-05-13 08:36:33'),(24,'Bermuda','百慕大','BM','BMU','en','','',-3,1,'2015-05-13 08:36:33'),(25,'Bhutan','','BT','BTN','en','','',6,1,'2015-05-13 08:36:33'),(26,'Bolivia','玻利维亚','BO','BOL','es','','',-4,1,'2015-05-13 08:36:33'),(27,'Bosnia and Herzegovina','波黑','BA','BIH','en','','',2,1,'2015-05-13 08:36:33'),(28,'Botswana','博茨瓦纳','BW','BWA','en','','',2,1,'2015-05-13 08:36:33'),(29,'Bouvet Island','','BV','BVT','en','','',1,1,'2015-05-13 08:36:33'),(30,'Brazil','巴西','BR','BRA','pt','BRL','',-2,1,'2015-05-13 08:36:33'),(31,'British Indian Ocean Territory','','IO','IOT','en','','',7,1,'2015-05-13 08:36:33'),(32,'Brunei Darussalam','文莱达鲁萨兰国','BN','BRN','en','','',8,1,'2015-05-13 08:36:33'),(33,'Bulgaria','保加利亚','BG','BGR','en','BGN','',3,1,'2015-05-13 08:36:33'),(34,'Burkina Faso','布基纳法索','BF','BFA','fr','','',0,1,'2015-05-13 08:36:33'),(35,'Burundi','','BI','BDI','en','','',2,1,'2015-05-13 08:36:33'),(36,'Cambodia','柬埔寨','KH','KHM','en','','',7,1,'2015-05-13 08:36:33'),(37,'Cameroon','喀麦隆','CM','CMR','en','','',1,1,'2015-05-13 08:36:33'),(38,'Canada','加拿大','CA','CAN','en','CAD','',-5,2,'2015-05-13 08:36:33'),(39,'Cape Verde','佛得角','CV','CPV','pt','','',-1,1,'2015-05-13 08:36:33'),(40,'Cayman Islands','开曼群岛','KY','CYM','en','','',-5,1,'2015-05-13 08:36:33'),(41,'Central African Republic','','CF','CAF','fr','','',1,1,'2015-05-13 08:36:33'),(42,'Chad','','TD','TCD','fr','','',1,1,'2015-05-13 08:36:33'),(43,'Chile','智利','CL','CHL','es','CLP','',-4,1,'2015-05-13 08:36:33'),(44,'China','中国','CN','CHN','en','RMB','',8,1,'2015-05-13 08:36:33'),(45,'Christmas Island','','CX','CXR','en','','',7,1,'2015-05-13 08:36:33'),(46,'Cocos (Keeling) Islands','','CC','CCK','en','','',6.5,1,'2015-05-13 08:36:33'),(47,'Colombia','哥伦比亚','CO','COL','es','','',-5,1,'2015-05-13 08:36:33'),(48,'Comoros','','KM','COM','ar','','',3,1,'2015-05-13 08:36:33'),(49,'Congo','','CG','COG','en','','',1,1,'2015-05-13 08:36:33'),(50,'Cook Islands','','CK','COK','en','','',-10,1,'2015-05-13 08:36:33'),(51,'Costa Rica','哥斯达黎加','CR','CRI','es','','',-6,1,'2015-05-13 08:36:33'),(52,'Cote D Ivoire','科特迪瓦','CI','CIV','en','','',0,1,'2015-05-13 08:36:33'),(53,'Croatia','克罗地亚','HR','HRV','en','','',2,1,'2015-05-13 08:36:33'),(54,'Cuba','','CU','CUB','es','','',-4,1,'2015-05-13 08:36:33'),(55,'Cyprus','塞浦路斯','CY','CYP','en','EUR','',3,1,'2015-05-13 08:36:33'),(56,'Czech Republic','捷克','CZ','CZE','en','CZK','',2,1,'2015-05-13 08:36:33'),(57,'Denmark','丹麦','DK','DNK','en','','',2,1,'2015-05-13 08:36:33'),(58,'Djibouti','','DJ','DJI','ar','','',3,1,'2015-05-13 08:36:33'),(59,'Dominica','','DM','DMA','en','','',-4,1,'2015-05-13 08:36:33'),(60,'Dominican Republic','多米尼加共和国','DO','DOM','es','','',-4,1,'2015-05-13 08:36:33'),(61,'East Timor','0','TP','TMP','pt','','',9,1,'2015-05-13 08:36:33'),(62,'Ecuador','厄瓜多尔','EC','ECU','en','','',-5,1,'2015-05-13 08:36:33'),(63,'Egypt','埃及','EG','EGY','ar','','',2,1,'2015-05-13 08:36:33'),(64,'El Salvador','萨尔瓦多共和国','SV','SLV','es','','',-6,1,'2015-05-13 08:36:33'),(65,'Equatorial Guinea','','GQ','GNQ','en','','',1,1,'2015-05-13 08:36:33'),(66,'Eritrea','','ER','ERI','en','','',3,1,'2015-05-13 08:36:33'),(67,'Estonia','爱沙尼亚','EE','EST','ru','EUR','',3,1,'2015-05-13 08:36:33'),(68,'Ethiopia','','ET','ETH','en','','',3,1,'2015-05-13 08:36:33'),(69,'Falkland Islands (Malvinas)','','FK','FLK','en','','',-3,1,'2015-05-13 08:36:33'),(70,'Faroe Islands','','FO','FRO','en','','',1,1,'2015-05-13 08:36:33'),(71,'Fiji','斐济','FJ','FJI','en','','',12,1,'2015-05-13 08:36:33'),(72,'Finland','芬兰','FI','FIN','en','EUR','',3,1,'2015-05-13 08:36:33'),(73,'France','法国','FR','FRA','fr','EUR','',2,1,'2015-05-13 08:36:33'),(74,'France Metropolitan','0','FX','FXX','fr','EUR','',2,1,'2015-05-13 08:36:33'),(75,'French Guiana','法属圭亚那','GF','GUF','fr','','',-3,1,'2015-05-13 08:36:33'),(76,'French Polynesia','波利尼西亚(法属)','PF','PYF','fr','','',-10,1,'2015-05-13 08:36:33'),(77,'French Southern Territories','','TF','ATF','en','','',-6,1,'2015-05-13 08:36:33'),(78,'Gabon','','GA','GAB','fr','','',1,1,'2015-05-13 08:36:33'),(79,'Gambia','冈比亚','GM','GMB','en','','',0,1,'2015-05-13 08:36:33'),(80,'Georgia','格鲁吉亚','GE','GEO','ru','','',4,1,'2015-05-13 08:36:33'),(81,'Germany','德国','DE','DEU','de','EUR','',2,5,'2015-05-13 08:36:33'),(82,'Ghana','加纳','GH','GHA','en','','',0,1,'2015-05-13 08:36:33'),(83,'Gibraltar','直布罗陀','GI','GIB','en','','',2,1,'2015-05-13 08:36:33'),(84,'Greece','希腊','GR','GRC','en','EUR','',3,1,'2015-05-13 08:36:33'),(85,'Greenland','','GL','GRL','en','','',0,1,'2015-05-13 08:36:33'),(86,'Grenada','格林纳达','GD','GRD','en','','',-4,1,'2015-05-13 08:36:33'),(87,'Guadeloupe','瓜德罗普岛','GP','GLP','fr','','',-4,1,'2015-05-13 08:36:33'),(88,'Guam','关岛','GU','GUM','en','','',10,1,'2015-05-13 08:36:33'),(89,'Guatemala','危地马拉','GT','GTM','es','','',-6,1,'2015-05-13 08:36:33'),(90,'Guinea','','GN','GIN','en','','',0,1,'2015-05-13 08:36:33'),(91,'Guinea-bissau','','GW','GNB','pt','','',0,1,'2015-05-13 08:36:33'),(92,'Guyana','圭亚那','GY','GUY','en','','',-4,1,'2015-05-13 08:36:33'),(93,'Haiti','','HT','HTI','fr','','',-4,1,'2015-05-13 08:36:33'),(94,'Heard and Mc Donald Islands','','HM','HMD','en','','',0,1,'2015-05-13 08:36:33'),(95,'Honduras','洪都拉斯','HN','HND','es','','',-6,1,'2015-05-13 08:36:33'),(96,'Hong Kong','香港','HK','HKG','en','','',8,1,'2015-05-13 08:36:33'),(97,'Hungary','匈牙利','HU','HUN','en','HUF','',2,1,'2015-05-13 08:36:33'),(98,'Iceland','冰岛','IS','ISL','en','','',0,1,'2015-05-13 08:36:33'),(99,'India','印度','IN','IND','en','INR','',5.5,1,'2015-05-13 08:36:33'),(100,'Indonesia','印尼','ID','IDN','en','','',8,1,'2015-05-13 08:36:33'),(101,'Iran (Islamic Republic of)','伊朗','IR','IRN','en','','',4.5,1,'2015-05-13 08:36:33'),(102,'Iraq','','IQ','IRQ','ar','','',3,1,'2015-05-13 08:36:33'),(103,'Ireland','爱尔兰','IE','IRL','en','EUR','',1,1,'2015-05-13 08:36:33'),(104,'Israel','以色列','IL','ISR','en','ILS','',3,1,'2015-05-13 08:36:33'),(105,'Italy','意大利','IT','ITA','it','EUR','',2,1,'2015-05-13 08:36:33'),(106,'Jamaica','牙买加','JM','JAM','en','','',-5,1,'2015-05-13 08:36:33'),(107,'Japan','日本','JP','JPN','en','','',9,1,'2015-05-13 08:36:33'),(108,'Jordan','约旦','JO','JOR','ar','','',3,1,'2015-05-13 08:36:33'),(109,'Kazakhstan','哈萨克斯坦','KZ','KAZ','ru','KZT','',6,1,'2015-05-13 08:36:33'),(110,'Kenya','','KE','KEN','en','','',3,1,'2015-05-13 08:36:33'),(111,'Kiribati','','KI','KIR','en','','',12,1,'2015-05-13 08:36:33'),(112,'Democratic People\'s Republic of Korea','','KP','PRK','en','','',9,1,'2015-05-13 08:36:33'),(113,'Republic of Korea','','KR','KOR','en','','',9,1,'2015-05-13 08:36:33'),(114,'Kuwait','科威特(中东国家)','KW','KWT','ar','','',3,1,'2015-05-13 08:36:33'),(115,'Kyrgyzstan','吉尔吉斯斯坦','KG','KGZ','ru','','',6,1,'2015-05-13 08:36:33'),(116,'Lao People\'s Democratic Republic','老挝','LA','LAO','en','','',7,1,'2015-05-13 08:36:33'),(117,'Latvia','拉脱维亚','LV','LVA','ru','','',3,1,'2015-05-13 08:36:33'),(118,'Lebanon','黎巴嫩','LB','LBN','ar','','',3,1,'2015-05-13 08:36:33'),(119,'Lesotho','','LS','LSO','en','','',2,1,'2015-05-13 08:36:33'),(120,'Liberia','','LR','LBR','en','','',0,1,'2015-05-13 08:36:33'),(121,'Libyan Arab Jamahiriya','','LY','LBY','ar','','',0,1,'2015-05-13 08:36:33'),(122,'Liechtenstein','列支敦士登','LI','LIE','de','','',2,1,'2015-05-13 08:36:33'),(123,'Lithuania','立陶宛','LT','LTU','ru','','',3,1,'2015-05-13 08:36:33'),(124,'Luxembourg','卢森堡','LU','LUX','de','EUR','',2,1,'2015-05-13 08:36:33'),(125,'Macau','','MO','MAC','en','','',8,1,'2015-05-13 08:36:33'),(126,'Macedonia','马其顿共和国','MK','MKD','en','','',2,1,'2015-05-13 08:36:33'),(127,'Madagascar','马达加斯加岛(非洲岛国)','MG','MDG','fr','','',3,1,'2015-05-13 08:36:33'),(128,'Malawi','马拉维','MW','MWI','en','','',2,1,'2015-05-13 08:36:33'),(129,'Malaysia','马来西亚','MY','MYS','en','MYR','',8,1,'2015-05-13 08:36:33'),(130,'Maldives','马尔代夫','MV','MDV','en','','',5,1,'2015-05-13 08:36:33'),(131,'Mali','','ML','MLI','fr','','',0,1,'2015-05-13 08:36:33'),(132,'Malta','马耳他','MT','MLT','en','EUR','',2,1,'2015-05-13 08:36:33'),(133,'Marshall Islands','','MH','MHL','en','','',12,1,'2015-05-13 08:36:33'),(134,'Martinique','马提尼克岛','MQ','MTQ','fr','','',-4,1,'2015-05-13 08:36:33'),(135,'Mauritania','','MR','MRT','ar','','',0,1,'2015-05-13 08:36:33'),(136,'Mauritius','毛里求斯(非洲岛国)','MU','MUS','en','','',4,1,'2015-05-13 08:36:33'),(137,'Mayotte','马约特岛','YT','MYT','en','','',3,1,'2015-05-13 08:36:33'),(138,'Mexico','墨西哥','MX','MEX','es','MXN','',-5,1,'2015-05-13 08:36:33'),(139,'Federated States of Micronesia','','FM','FSM','en','','',11,1,'2015-05-13 08:36:33'),(140,'Republic of Moldova','摩尔多瓦','MD','MDA','ru','','',3,1,'2015-05-13 08:36:33'),(141,'Monaco','摩纳哥','MC','MCO','fr','','',2,1,'2015-05-13 08:36:33'),(142,'Mongolia','蒙古','MN','MNG','en','','',8,1,'2015-05-13 08:36:33'),(143,'Montserrat','','MS','MSR','en','','',-4,1,'2015-05-13 08:36:33'),(144,'Morocco','摩洛哥','MA','MAR','ar','','',1,1,'2015-05-13 08:36:33'),(145,'Mozambique','莫桑比克','MZ','MOZ','pt','','',2,1,'2015-05-13 08:36:33'),(146,'Myanmar','','MM','MMR','en','','',6.5,1,'2015-05-13 08:36:33'),(147,'Namibia','','NA','NAM','en','','',1,1,'2015-05-13 08:36:33'),(148,'Nauru','','NR','NRU','en','','',12,1,'2015-05-13 08:36:33'),(149,'Nepal','','NP','NPL','en','','',5.75,1,'2015-05-13 08:36:33'),(150,'Netherlands','荷兰','NL','NLD','en','EUR','',2,1,'2015-05-13 08:36:33'),(151,'Netherlands Antilles','','AN','ANT','en','EUR','',2,1,'2015-05-13 08:36:33'),(152,'New Caledonia','新喀里多尼亚','NC','NCL','fr','','',11,1,'2015-05-13 08:36:33'),(153,'New Zealand','新西兰','NZ','NZL','en','','',12,1,'2015-05-13 08:36:33'),(154,'Nicaragua','尼加拉瓜','NI','NIC','es','','',-6,1,'2015-05-13 08:36:33'),(155,'Niger','尼日尔','NE','NER','fr','','',1,1,'2015-05-13 08:36:33'),(156,'Nigeria','尼日利亚','NG','NGA','en','','',1,1,'2015-05-13 08:36:33'),(157,'Niue','','NU','NIU','en','','',-11,1,'2015-05-13 08:36:33'),(158,'Norfolk Island','','NF','NFK','en','','',11.5,1,'2015-05-13 08:36:33'),(159,'Northern Mariana Islands','','MP','MNP','en','','',10,1,'2015-05-13 08:36:33'),(160,'Norway','挪威','NO','NOR','en','','',2,1,'2015-05-13 08:36:33'),(161,'Oman','阿曼','OM','OMN','ar','','',4,1,'2015-05-13 08:36:33'),(162,'Pakistan','巴基斯坦','PK','PAK','en','','',5,1,'2015-05-13 08:36:33'),(163,'Palau','帕劳群岛','PW','PLW','en','','',9,1,'2015-05-13 08:36:33'),(164,'Panama','巴拿马','PA','PAN','es','','',-5,1,'2015-05-13 08:36:33'),(165,'Papua New Guinea','巴布亚新几内亚','PG','PNG','en','','',10,1,'2015-05-13 08:36:33'),(166,'Paraguay','','PY','PRY','es','','',-4,1,'2015-05-13 08:36:33'),(167,'Peru','秘鲁','PE','PER','es','','',-5,1,'2015-05-13 08:36:33'),(168,'Philippines','菲律宾共和国','PH','PHL','en','','',8,1,'2015-05-13 08:36:33'),(169,'Pitcairn','','PN','PCN','en','','',-8,1,'2015-05-13 08:36:33'),(170,'Poland','波兰','PL','POL','en','','',2,1,'2015-05-13 08:36:33'),(171,'Portugal','葡萄牙','PT','PRT','pt','EUR','',1,1,'2015-05-13 08:36:33'),(172,'Puerto Rico','波多黎各','PR','PRI','es','','',-4,1,'2015-05-13 08:36:33'),(173,'Qatar','卡塔尔','QA','QAT','ar','','',3,1,'2015-05-13 08:36:33'),(174,'Reunion','留尼汪岛','RE','REU','fr','','',4,1,'2015-05-13 08:36:33'),(175,'Romania','罗马尼亚','RO','ROM','en','','',3,1,'2015-05-13 08:36:33'),(176,'Russia','','RU','RUS','ru','RUB','',4,1,'2015-05-13 08:36:33'),(177,'Rwanda','','RW','RWA','en','','',2,1,'2015-05-13 08:36:33'),(178,'Saint Kitts and Nevis','圣克里斯托弗和尼维斯','KN','KNA','en','','',-4,1,'2015-05-13 08:36:33'),(179,'Saint Lucia','圣卢西亚','LC','LCA','en','','',-4,1,'2015-05-13 08:36:33'),(180,'Saint Vincent and the Grenadines','圣文森特和格林纳丁斯','VC','VCT','en','','',-4,1,'2015-05-13 08:36:33'),(181,'Samoa','','WS','WSM','en','','',13,1,'2015-05-13 08:36:33'),(182,'San Marino','圣马力诺','SM','SMR','it','','',2,1,'2015-05-13 08:36:33'),(183,'Sao Tome and Principe','圣多美和普林西比','ST','STP','pt','','',0,1,'2015-05-13 08:36:33'),(184,'Saudi Arabia','沙特阿拉伯','SA','SAU','ar','','',3,1,'2015-05-13 08:36:33'),(185,'Senegal','塞内加尔','SN','SEN','fr','','',0,1,'2015-05-13 08:36:33'),(186,'Seychelles','','SC','SYC','en','','',4,1,'2015-05-13 08:36:33'),(187,'Sierra Leone','','SL','SLE','en','','',0,1,'2015-05-13 08:36:33'),(188,'Singapore','新加坡','SG','SGP','en','','',8,4,'2015-05-13 08:36:33'),(189,'Slovakia','斯洛伐克','SK','SVK','en','EUR','',2,1,'2015-05-13 08:36:33'),(190,'Slovenia','斯洛文尼亚','SI','SVN','en','EUR','',2,1,'2015-05-13 08:36:33'),(191,'Solomon Islands','所罗门群岛','SB','SLB','en','','',11,1,'2015-05-13 08:36:33'),(192,'Somalia','','SO','SOM','ar','','',3,1,'2015-05-13 08:36:33'),(193,'South Africa','南非','ZA','ZAF','en','ZAR','',2,1,'2015-05-13 08:36:33'),(194,'South Georgia and the South Sandwich Islands','','GS','SGS','en','','',10,1,'2015-05-13 08:36:33'),(195,'Spain','西班牙','ES','ESP','es','EUR','',1,3,'2015-05-13 08:36:33'),(196,'Sri Lanka','斯里兰卡','LK','LKA','en','','',5.5,1,'2015-05-13 08:36:33'),(197,'St. Helena','','SH','SHN','en','','',0,1,'2015-05-13 08:36:33'),(198,'St. Pierre and Miquelon','','PM','SPM','en','','',-2,1,'2015-05-13 08:36:33'),(199,'Sudan','','SD','SDN','ar','','',3,1,'2015-05-13 08:36:33'),(200,'Suriname','','SR','SUR','en','','',-3,1,'2015-05-13 08:36:33'),(201,'Svalbard and Jan Mayen Islands','','SJ','SJM','en','','',2,1,'2015-05-13 08:36:33'),(202,'Swaziland','','SZ','SWZ','en','','',2,1,'2015-05-13 08:36:33'),(203,'Sweden','瑞典','SE','SWE','en','','',2,1,'2015-05-13 08:36:33'),(204,'Switzerland','瑞士','CH','CHE','de','CHF','',2,1,'2015-05-13 08:36:33'),(205,'Syrian Arab Republic','','SY','SYR','ar','','',3,1,'2015-05-13 08:36:33'),(206,'Taiwan','','TW','TWN','en','','',8,1,'2015-05-13 08:36:33'),(207,'Tajikistan','','TJ','TJK','ru','','',5,1,'2015-05-13 08:36:33'),(208,'United Republic of Tanzania','','TZ','TZA','en','','',3,1,'2015-05-13 08:36:33'),(209,'Thailand','泰国','TH','THA','en','','',7,1,'2015-05-13 08:36:33'),(210,'Togo','','TG','TGO','fr','','',0,1,'2015-05-13 08:36:33'),(211,'Tokelau','','TK','TKL','en','','',14,1,'2015-05-13 08:36:33'),(212,'Tonga','','TO','TON','en','','',13,1,'2015-05-13 08:36:33'),(213,'Trinidad and Tobago','特立尼达和多巴哥','TT','TTO','en','','',-4,1,'2015-05-13 08:36:33'),(214,'Tunisia','突尼斯','TN','TUN','ar','','',1,1,'2015-05-13 08:36:33'),(215,'Turkey','土耳其','TR','TUR','en','','',3,1,'2015-05-13 08:36:33'),(216,'Turkmenistan','','TM','TKM','ru','','',5,1,'2015-05-13 08:36:33'),(217,'Turks and Caicos Islands','','TC','TCA','en','','',-4,1,'2015-05-13 08:36:33'),(218,'Tuvalu','','TV','TUV','en','','',12,1,'2015-05-13 08:36:33'),(219,'Uganda','乌干达(东非国家)','UG','UGA','en','','',3,1,'2015-05-13 08:36:33'),(220,'Ukraine','乌克兰','UA','UKR','ru','UAH','',3,1,'2015-05-13 08:36:33'),(221,'United Arab Emirates','阿拉伯联合酋长国','AE','ARE','ar','','',4,1,'2015-05-13 08:36:33'),(222,'United Kingdom','英国','GB','GBR','en','GBP','',1,6,'2015-05-13 08:36:33'),(223,'United States','美国','US','USA','en','USD','',-4,2,'2015-05-13 08:36:33'),(224,'United States Minor Outlying Islands','','UM','UMI','en','USD','',0,1,'2015-05-13 08:36:33'),(225,'Uruguay','乌拉圭','UY','URY','es','','',-3,1,'2015-05-13 08:36:33'),(226,'Uzbekistan','乌兹别克斯坦','UZ','UZB','ru','','',5,1,'2015-05-13 08:36:33'),(227,'Vanuatu','瓦努阿图','VU','VUT','fr','','',11,1,'2015-05-13 08:36:33'),(228,'Vatican City State (Holy See)','','VA','VAT','en','','',2,1,'2015-05-13 08:36:33'),(229,'Venezuela','委内瑞拉','VE','VEN','es','','',-4.5,1,'2015-05-13 08:36:33'),(230,'Viet Nam','越南','VN','VNM','en','','',7,1,'2015-05-13 08:36:33'),(231,'Virgin Islands (British)','','VG','VGB','en','','',-4,1,'2015-05-13 08:36:33'),(232,'Virgin Islands (U.S.)','','VI','VIR','en','','',-4,1,'2015-05-13 08:36:33'),(233,'Wallis and Futuna Islands','瓦利斯和富图纳(法属)','WF','WLF','fr','','',12,1,'2015-05-13 08:36:33'),(234,'Western Sahara','','EH','ESH','en','','',1,1,'2015-05-13 08:36:33'),(235,'Yemen','','YE','YEM','ar','','',3,1,'2015-05-13 08:36:33'),(237,'Zaire','0','ZR','ZAR','en','','',0,1,'2015-05-13 08:36:33'),(238,'Zambia','','ZM','ZMB','en','','',2,1,'2015-05-13 08:36:33'),(239,'Zimbabwe','','ZW','ZWE','en','','',2,1,'2015-05-13 08:36:33'),(249,'Serbia','塞尔维亚','RS','','en','','',2,1,'2015-05-13 08:36:33'),(1240,'Montenegro','黑山','ME','','en','','',2,1,'2015-05-13 08:36:33'),(1241,'Timor-Leste','東帝汶民主共和國','TL','','en','','',9,1,'2015-05-13 08:36:33');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-13 16:46:11
