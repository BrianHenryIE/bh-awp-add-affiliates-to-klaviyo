-- MySQL dump 10.13  Distrib 8.0.11, for macos10.13 (x86_64)
--
-- Host: localhost    Database: bh_awp_add_affiliates_to_klaviyo_tests
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wp_affiliate_wp_affiliatemeta`
--

DROP TABLE IF EXISTS `wp_affiliate_wp_affiliatemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_affiliate_wp_affiliatemeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `affiliate_id` bigint(20) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `affiliate_id` (`affiliate_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_affiliate_wp_affiliatemeta`
--

LOCK TABLES `wp_affiliate_wp_affiliatemeta` WRITE;
/*!40000 ALTER TABLE `wp_affiliate_wp_affiliatemeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_affiliate_wp_affiliatemeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_affiliate_wp_affiliates`
--

DROP TABLE IF EXISTS `wp_affiliate_wp_affiliates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_affiliate_wp_affiliates` (
  `affiliate_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rest_id` mediumtext NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `rate` tinytext NOT NULL,
  `rate_type` tinytext NOT NULL,
  `flat_rate_basis` tinytext NOT NULL,
  `payment_email` mediumtext NOT NULL,
  `status` tinytext NOT NULL,
  `earnings` mediumtext NOT NULL,
  `unpaid_earnings` mediumtext NOT NULL,
  `referrals` bigint(20) NOT NULL,
  `visits` bigint(20) NOT NULL,
  `date_registered` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_affiliate_wp_affiliates`
--

LOCK TABLES `wp_affiliate_wp_affiliates` WRITE;
/*!40000 ALTER TABLE `wp_affiliate_wp_affiliates` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_affiliate_wp_affiliates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `wp_affiliate_wp_campaigns`
--

DROP TABLE IF EXISTS `wp_affiliate_wp_campaigns`;
/*!50001 DROP VIEW IF EXISTS `wp_affiliate_wp_campaigns`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `wp_affiliate_wp_campaigns` AS SELECT 
 1 AS `affiliate_id`,
 1 AS `campaign`,
 1 AS `visits`,
 1 AS `unique_visits`,
 1 AS `referrals`,
 1 AS `conversion_rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wp_affiliate_wp_creatives`
--

DROP TABLE IF EXISTS `wp_affiliate_wp_creatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_affiliate_wp_creatives` (
  `creative_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  `description` longtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `text` tinytext NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinytext NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`creative_id`),
  KEY `creative_id` (`creative_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_affiliate_wp_creatives`
--

LOCK TABLES `wp_affiliate_wp_creatives` WRITE;
/*!40000 ALTER TABLE `wp_affiliate_wp_creatives` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_affiliate_wp_creatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_affiliate_wp_customermeta`
--

DROP TABLE IF EXISTS `wp_affiliate_wp_customermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_affiliate_wp_customermeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `affwp_customer_id` bigint(20) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `affwp_customer_id` (`affwp_customer_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_affiliate_wp_customermeta`
--

LOCK TABLES `wp_affiliate_wp_customermeta` WRITE;
/*!40000 ALTER TABLE `wp_affiliate_wp_customermeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_affiliate_wp_customermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_affiliate_wp_customers`
--

DROP TABLE IF EXISTS `wp_affiliate_wp_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_affiliate_wp_customers` (
  `customer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `ip` varchar(250) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `user_id` (`user_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_affiliate_wp_customers`
--

LOCK TABLES `wp_affiliate_wp_customers` WRITE;
/*!40000 ALTER TABLE `wp_affiliate_wp_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_affiliate_wp_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_affiliate_wp_payouts`
--

DROP TABLE IF EXISTS `wp_affiliate_wp_payouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_affiliate_wp_payouts` (
  `payout_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `affiliate_id` bigint(20) NOT NULL,
  `referrals` mediumtext NOT NULL,
  `amount` mediumtext NOT NULL,
  `owner` bigint(20) NOT NULL,
  `payout_method` tinytext NOT NULL,
  `service_account` tinytext NOT NULL,
  `service_id` bigint(20) NOT NULL,
  `service_invoice_link` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `status` tinytext NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`payout_id`),
  KEY `affiliate_id` (`affiliate_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_affiliate_wp_payouts`
--

LOCK TABLES `wp_affiliate_wp_payouts` WRITE;
/*!40000 ALTER TABLE `wp_affiliate_wp_payouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_affiliate_wp_payouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_affiliate_wp_referralmeta`
--

DROP TABLE IF EXISTS `wp_affiliate_wp_referralmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_affiliate_wp_referralmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `referral_id` bigint(20) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `referral_id` (`referral_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_affiliate_wp_referralmeta`
--

LOCK TABLES `wp_affiliate_wp_referralmeta` WRITE;
/*!40000 ALTER TABLE `wp_affiliate_wp_referralmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_affiliate_wp_referralmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_affiliate_wp_referrals`
--

DROP TABLE IF EXISTS `wp_affiliate_wp_referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_affiliate_wp_referrals` (
  `referral_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `affiliate_id` bigint(20) NOT NULL,
  `visit_id` bigint(20) NOT NULL,
  `rest_id` mediumtext NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `description` longtext NOT NULL,
  `status` tinytext NOT NULL,
  `amount` mediumtext NOT NULL,
  `currency` char(3) NOT NULL,
  `custom` longtext NOT NULL,
  `context` tinytext NOT NULL,
  `campaign` varchar(50) NOT NULL,
  `type` varchar(30) NOT NULL,
  `reference` mediumtext NOT NULL,
  `products` mediumtext NOT NULL,
  `payout_id` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`referral_id`),
  KEY `affiliate_id` (`affiliate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_affiliate_wp_referrals`
--

LOCK TABLES `wp_affiliate_wp_referrals` WRITE;
/*!40000 ALTER TABLE `wp_affiliate_wp_referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_affiliate_wp_referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_affiliate_wp_rest_consumers`
--

DROP TABLE IF EXISTS `wp_affiliate_wp_rest_consumers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_affiliate_wp_rest_consumers` (
  `consumer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `token` varchar(32) NOT NULL,
  `public_key` varchar(32) NOT NULL,
  `secret_key` varchar(32) NOT NULL,
  `status` tinytext NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`consumer_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_affiliate_wp_rest_consumers`
--

LOCK TABLES `wp_affiliate_wp_rest_consumers` WRITE;
/*!40000 ALTER TABLE `wp_affiliate_wp_rest_consumers` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_affiliate_wp_rest_consumers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_affiliate_wp_sales`
--

DROP TABLE IF EXISTS `wp_affiliate_wp_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_affiliate_wp_sales` (
  `referral_id` bigint(20) NOT NULL,
  `affiliate_id` bigint(20) NOT NULL,
  `order_total` mediumtext NOT NULL,
  PRIMARY KEY (`referral_id`),
  KEY `affiliate_id` (`affiliate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_affiliate_wp_sales`
--

LOCK TABLES `wp_affiliate_wp_sales` WRITE;
/*!40000 ALTER TABLE `wp_affiliate_wp_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_affiliate_wp_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_affiliate_wp_visits`
--

DROP TABLE IF EXISTS `wp_affiliate_wp_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_affiliate_wp_visits` (
  `visit_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `affiliate_id` bigint(20) NOT NULL,
  `referral_id` bigint(20) NOT NULL,
  `rest_id` mediumtext NOT NULL,
  `url` mediumtext NOT NULL,
  `referrer` mediumtext NOT NULL,
  `campaign` varchar(50) NOT NULL,
  `context` varchar(50) NOT NULL,
  `ip` tinytext NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`visit_id`),
  KEY `affiliate_id` (`affiliate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_affiliate_wp_visits`
--

LOCK TABLES `wp_affiliate_wp_visits` WRITE;
/*!40000 ALTER TABLE `wp_affiliate_wp_visits` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_affiliate_wp_visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES (1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2020-08-19 21:45:55','2020-08-19 21:45:55','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.',0,'1','','comment',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'siteurl','http://localhost/bh-awp-add-affiliates-to-klaviyo','yes'),(2,'home','http://localhost/bh-awp-add-affiliates-to-klaviyo','yes'),(3,'blogname','BH','yes'),(4,'blogdescription','Just another WordPress site','yes'),(5,'users_can_register','0','yes'),(6,'admin_email','admin@example.org','yes'),(7,'start_of_week','1','yes'),(8,'use_balanceTags','0','yes'),(9,'use_smilies','1','yes'),(10,'require_name_email','1','yes'),(11,'comments_notify','1','yes'),(12,'posts_per_rss','10','yes'),(13,'rss_use_excerpt','0','yes'),(14,'mailserver_url','mail.example.com','yes'),(15,'mailserver_login','login@example.com','yes'),(16,'mailserver_pass','password','yes'),(17,'mailserver_port','110','yes'),(18,'default_category','1','yes'),(19,'default_comment_status','open','yes'),(20,'default_ping_status','open','yes'),(21,'default_pingback_flag','1','yes'),(22,'posts_per_page','10','yes'),(23,'date_format','F j, Y','yes'),(24,'time_format','g:i a','yes'),(25,'links_updated_date_format','F j, Y g:i a','yes'),(26,'comment_moderation','0','yes'),(27,'moderation_notify','1','yes'),(28,'permalink_structure','','yes'),(29,'rewrite_rules','','yes'),(30,'hack_file','0','yes'),(31,'blog_charset','UTF-8','yes'),(32,'moderation_keys','','no'),(33,'active_plugins','a:2:{i:0;s:29:\"affiliate-wp/affiliate-wp.php\";i:1;s:69:\"bh-awp-add-affiliates-to-klaviyo/bh-awp-add-affiliates-to-klaviyo.php\";}','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'comment_max_links','2','yes'),(37,'gmt_offset','0','yes'),(38,'default_email_category','1','yes'),(39,'recently_edited','','no'),(40,'template','twentytwenty','yes'),(41,'stylesheet','twentytwenty','yes'),(42,'comment_registration','0','yes'),(43,'html_type','text/html','yes'),(44,'use_trackback','0','yes'),(45,'default_role','subscriber','yes'),(46,'db_version','48748','yes'),(47,'uploads_use_yearmonth_folders','1','yes'),(48,'upload_path','','yes'),(49,'blog_public','1','yes'),(50,'default_link_category','2','yes'),(51,'show_on_front','posts','yes'),(52,'tag_base','','yes'),(53,'show_avatars','1','yes'),(54,'avatar_rating','G','yes'),(55,'upload_url_path','','yes'),(56,'thumbnail_size_w','150','yes'),(57,'thumbnail_size_h','150','yes'),(58,'thumbnail_crop','1','yes'),(59,'medium_size_w','300','yes'),(60,'medium_size_h','300','yes'),(61,'avatar_default','mystery','yes'),(62,'large_size_w','1024','yes'),(63,'large_size_h','1024','yes'),(64,'image_default_link_type','none','yes'),(65,'image_default_size','','yes'),(66,'image_default_align','','yes'),(67,'close_comments_for_old_posts','0','yes'),(68,'close_comments_days_old','14','yes'),(69,'thread_comments','1','yes'),(70,'thread_comments_depth','5','yes'),(71,'page_comments','0','yes'),(72,'comments_per_page','50','yes'),(73,'default_comments_page','newest','yes'),(74,'comment_order','asc','yes'),(75,'sticky_posts','a:0:{}','yes'),(76,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(77,'widget_text','a:0:{}','yes'),(78,'widget_rss','a:0:{}','yes'),(79,'uninstall_plugins','a:0:{}','no'),(80,'timezone_string','','yes'),(81,'page_for_posts','0','yes'),(82,'page_on_front','0','yes'),(83,'default_post_format','0','yes'),(84,'link_manager_enabled','0','yes'),(85,'finished_splitting_shared_terms','1','yes'),(86,'site_icon','0','yes'),(87,'medium_large_size_w','768','yes'),(88,'medium_large_size_h','0','yes'),(89,'wp_page_for_privacy_policy','3','yes'),(90,'show_comments_cookies_opt_in','1','yes'),(92,'disallowed_keys','','no'),(93,'comment_previously_approved','1','yes'),(94,'auto_plugin_theme_update_emails','a:0:{}','no'),(95,'initial_db_version','48748','yes'),(96,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:75:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:22:\"view_affiliate_reports\";b:1;s:21:\"export_affiliate_data\";b:1;s:20:\"export_referral_data\";b:1;s:20:\"export_customer_data\";b:1;s:17:\"export_visit_data\";b:1;s:18:\"export_payout_data\";b:1;s:24:\"manage_affiliate_options\";b:1;s:17:\"manage_affiliates\";b:1;s:16:\"manage_referrals\";b:1;s:16:\"manage_customers\";b:1;s:13:\"manage_visits\";b:1;s:16:\"manage_creatives\";b:1;s:14:\"manage_payouts\";b:1;s:16:\"manage_consumers\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(97,'fresh_site','0','yes'),(98,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(99,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(100,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(101,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(102,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(103,'sidebars_widgets','a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes'),(104,'cron','a:5:{i:1597891558;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1597916758;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1597959957;a:2:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1597974746;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(105,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(106,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(107,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(108,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(109,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(110,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(111,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(112,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(113,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(117,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-5.5.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-5.5.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-5.5-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.5-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:3:\"5.5\";s:7:\"version\";s:3:\"5.5\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1597888347;s:15:\"version_checked\";s:3:\"5.5\";s:12:\"translations\";a:0:{}}','no'),(118,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1597888347;s:7:\"checked\";a:3:{s:69:\"bh-awp-add-affiliates-to-klaviyo/bh-awp-add-affiliates-to-klaviyo.php\";s:5:\"1.0.0\";s:29:\"affiliate-wp/affiliate-wp.php\";s:5:\"2.5.3\";s:19:\"klaviyo/klaviyo.php\";s:5:\"2.2.4\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:19:\"klaviyo/klaviyo.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/klaviyo\";s:4:\"slug\";s:7:\"klaviyo\";s:6:\"plugin\";s:19:\"klaviyo/klaviyo.php\";s:11:\"new_version\";s:5:\"2.2.4\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/klaviyo/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/klaviyo.2.2.4.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:60:\"https://ps.w.org/klaviyo/assets/icon-256x256.png?rev=2180214\";s:2:\"1x\";s:60:\"https://ps.w.org/klaviyo/assets/icon-256x256.png?rev=2180214\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}}}}','no'),(119,'_site_transient_timeout_theme_roots','1597890147','no'),(120,'_site_transient_theme_roots','a:1:{s:12:\"twentytwenty\";s:7:\"/themes\";}','no'),(121,'_site_transient_update_themes','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1597888347;s:7:\"checked\";a:1:{s:12:\"twentytwenty\";s:3:\"1.5\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:1:{s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.5.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}}s:12:\"translations\";a:0:{}}','no'),(122,'recently_activated','a:0:{}','yes'),(124,'recovery_keys','a:0:{}','yes'),(127,'finished_updating_comment_type','1','yes'),(128,'can_compress_scripts','1','no'),(129,'wp_affiliate_wp_affiliates_db_version','1.2','yes'),(130,'wp_affiliate_wp_affiliatemeta_db_version','1.0','yes'),(131,'wp_affiliate_wp_customers_db_version','1.0','yes'),(132,'wp_affiliate_wp_customermeta_db_version','1.0','yes'),(133,'wp_affiliate_wp_referrals_db_version','1.2','yes'),(134,'wp_affiliate_wp_referralmeta_db_version','1.0','yes'),(135,'wp_affiliate_wp_visits_db_version','1.2','yes'),(136,'wp_affiliate_wp_campaigns_db_version','1.0','yes'),(137,'wp_affiliate_wp_creatives_db_version','1.0','yes'),(138,'wp_affiliate_wp_sales_db_version','1.0','yes'),(139,'wp_affiliate_wp_payouts_db_version','1.0','yes'),(140,'wp_affiliate_wp_rest_consumers_db_version','1.0','yes'),(141,'affwp_settings','a:4:{s:15:\"affiliates_page\";i:4;s:28:\"required_registration_fields\";a:2:{s:9:\"your_name\";s:9:\"Your Name\";s:11:\"website_url\";s:11:\"Website URL\";}s:19:\"email_notifications\";a:6:{s:34:\"admin_affiliate_registration_email\";s:60:\"Notify affiliate manager when a new affiliate has registered\";s:24:\"admin_new_referral_email\";s:61:\"Notify affiliate manager when a new referral has been created\";s:28:\"affiliate_new_referral_email\";s:46:\"Notify affiliate when they earn a new referral\";s:36:\"affiliate_application_accepted_email\";s:61:\"Notify affiliate when their affiliate application is accepted\";s:35:\"affiliate_application_pending_email\";s:60:\"Notify affiliate when their affiliate application is pending\";s:36:\"affiliate_application_rejected_email\";s:61:\"Notify affiliate when their affiliate application is rejected\";}s:14:\"license_status\";O:8:\"stdClass\":5:{s:7:\"success\";b:0;s:7:\"license\";s:7:\"invalid\";s:7:\"item_id\";b:0;s:9:\"item_name\";s:11:\"AffiliateWP\";s:8:\"checksum\";s:32:\"25b830a96e0dd4b146b6227e206b5822\";}}','yes'),(142,'affwp_js_works','3','yes'),(143,'affwp_is_installed','1','yes'),(144,'affwp_version','2.5.3','yes'),(145,'affwp_completed_upgrades','a:3:{i:0;s:35:\"upgrade_v20_recount_unpaid_earnings\";i:1;s:35:\"upgrade_v22_create_customer_records\";i:2;s:59:\"upgrade_v245_create_customer_affiliate_relationship_records\";}','yes'),(146,'_transient_timeout__affwp_activation_redirect','1597888509','no'),(147,'_transient__affwp_activation_redirect','1','no'),(148,'_transient_timeout_affwp_license_check','1597974880','no'),(149,'_transient_affwp_license_check','invalid','no'),(150,'affwp_last_checkin','1597888480','yes'),(151,'_transient_timeout_affiliatewp_add_ons_feed_pro','1597892121','no'),(152,'_transient_affiliatewp_add_ons_feed_pro','\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">REST API Extended</h3>\n			<a href=\"https://affiliatewp.com/add-ons/pro/rest-api-extended/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=REST%20API%20Extended\" title=\"REST API Extended\">\n				<img width=\"2000\" height=\"1000\" src=\"https://s7386.pcdn.co/wp-content/uploads/2017/01/add-on-extended-rest-api.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"REST API Extended\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/2017/01/add-on-extended-rest-api.png 2000w, https://s7386.pcdn.co/wp-content/uploads/2017/01/add-on-extended-rest-api-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/2017/01/add-on-extended-rest-api-300x150.png 300w, https://s7386.pcdn.co/wp-content/uploads/2017/01/add-on-extended-rest-api-768x384.png 768w, https://s7386.pcdn.co/wp-content/uploads/2017/01/add-on-extended-rest-api-1024x512.png 1024w, https://s7386.pcdn.co/wp-content/uploads/2017/01/add-on-extended-rest-api-663x332.png 663w, https://s7386.pcdn.co/wp-content/uploads/2017/01/add-on-extended-rest-api-771x386.png 771w\" sizes=\"(max-width: 2000px) 100vw, 2000px\" />			</a>\n			<p>Adds Create, Update, and Delete operations to the AffiliateWP REST API.</p>\n			<a href=\"https://affiliatewp.com/add-ons/pro/rest-api-extended/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=REST%20API%20Extended\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Zapier for AffiliateWP</h3>\n			<a href=\"https://affiliatewp.com/add-ons/pro/zapier-for-affiliatewp/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Zapier%20for%20AffiliateWP\" title=\"Zapier for AffiliateWP\">\n				<img width=\"2000\" height=\"1000\" src=\"https://s7386.pcdn.co/wp-content/uploads/2017/03/add-on-zapier-for-affiliatewp.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Zapier for AffiliateWP\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/2017/03/add-on-zapier-for-affiliatewp.png 2000w, https://s7386.pcdn.co/wp-content/uploads/2017/03/add-on-zapier-for-affiliatewp-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/2017/03/add-on-zapier-for-affiliatewp-300x150.png 300w, https://s7386.pcdn.co/wp-content/uploads/2017/03/add-on-zapier-for-affiliatewp-768x384.png 768w, https://s7386.pcdn.co/wp-content/uploads/2017/03/add-on-zapier-for-affiliatewp-1024x512.png 1024w, https://s7386.pcdn.co/wp-content/uploads/2017/03/add-on-zapier-for-affiliatewp-663x332.png 663w, https://s7386.pcdn.co/wp-content/uploads/2017/03/add-on-zapier-for-affiliatewp-771x386.png 771w\" sizes=\"(max-width: 2000px) 100vw, 2000px\" />			</a>\n			<p>Connect AffiliateWP to over 700 web services with Zapier!</p>\n			<a href=\"https://affiliatewp.com/add-ons/pro/zapier-for-affiliatewp/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Zapier%20for%20AffiliateWP\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Affiliate Landing Pages</h3>\n			<a href=\"https://affiliatewp.com/add-ons/pro/affiliate-landing-pages/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Affiliate%20Landing%20Pages\" title=\"Affiliate Landing Pages\">\n				<img width=\"2000\" height=\"1000\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2017/02/add-on-affiliate-landing-pages.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Affiliate Landing Pages\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2017/02/add-on-affiliate-landing-pages.png 2000w, https://s7386.pcdn.co/wp-content/uploads/edd/2017/02/add-on-affiliate-landing-pages-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2017/02/add-on-affiliate-landing-pages-300x150.png 300w, https://s7386.pcdn.co/wp-content/uploads/edd/2017/02/add-on-affiliate-landing-pages-768x384.png 768w, https://s7386.pcdn.co/wp-content/uploads/edd/2017/02/add-on-affiliate-landing-pages-1024x512.png 1024w, https://s7386.pcdn.co/wp-content/uploads/edd/2017/02/add-on-affiliate-landing-pages-663x332.png 663w, https://s7386.pcdn.co/wp-content/uploads/edd/2017/02/add-on-affiliate-landing-pages-771x386.png 771w\" sizes=\"(max-width: 2000px) 100vw, 2000px\" />			</a>\n			<p>Create dedicated landing pages for your affiliates, which they can promote without using an affiliate link.</p>\n			<a href=\"https://affiliatewp.com/add-ons/pro/affiliate-landing-pages/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Affiliate%20Landing%20Pages\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Direct Link Tracking</h3>\n			<a href=\"https://affiliatewp.com/add-ons/pro/direct-link-tracking/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Direct%20Link%20Tracking\" title=\"Direct Link Tracking\">\n				<img width=\"880\" height=\"440\" src=\"https://s7386.pcdn.co/wp-content/uploads/2016/07/add-on-direct-link-tracking.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"Direct Link Tracking\" title=\"Direct Link Tracking\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/2016/07/add-on-direct-link-tracking.png 880w, https://s7386.pcdn.co/wp-content/uploads/2016/07/add-on-direct-link-tracking-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/2016/07/add-on-direct-link-tracking-300x150.png 300w, https://s7386.pcdn.co/wp-content/uploads/2016/07/add-on-direct-link-tracking-768x384.png 768w, https://s7386.pcdn.co/wp-content/uploads/2016/07/add-on-direct-link-tracking-663x332.png 663w, https://s7386.pcdn.co/wp-content/uploads/2016/07/add-on-direct-link-tracking-771x386.png 771w\" sizes=\"(max-width: 880px) 100vw, 880px\" />			</a>\n			<p>Allow affiliates to link directly to your site, from their site, without the need for an affiliate link</p>\n			<a href=\"https://affiliatewp.com/add-ons/pro/direct-link-tracking/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Direct%20Link%20Tracking\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Custom Affiliate Slugs</h3>\n			<a href=\"https://affiliatewp.com/add-ons/pro/custom-affiliate-slugs/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Custom%20Affiliate%20Slugs\" title=\"Custom Affiliate Slugs\">\n				<img width=\"880\" height=\"440\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2016/04/add-on-custom-affiliate-slugs.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Custom Affiliate Slugs\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2016/04/add-on-custom-affiliate-slugs.png 880w, https://s7386.pcdn.co/wp-content/uploads/edd/2016/04/add-on-custom-affiliate-slugs-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2016/04/add-on-custom-affiliate-slugs-300x150.png 300w, https://s7386.pcdn.co/wp-content/uploads/edd/2016/04/add-on-custom-affiliate-slugs-768x384.png 768w, https://s7386.pcdn.co/wp-content/uploads/edd/2016/04/add-on-custom-affiliate-slugs-663x332.png 663w, https://s7386.pcdn.co/wp-content/uploads/edd/2016/04/add-on-custom-affiliate-slugs-771x386.png 771w\" sizes=\"(max-width: 880px) 100vw, 880px\" />			</a>\n			<p>Automatically generate custom slugs, or let your affiliates create their own</p>\n			<a href=\"https://affiliatewp.com/add-ons/pro/custom-affiliate-slugs/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Custom%20Affiliate%20Slugs\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Signup Referrals</h3>\n			<a href=\"https://affiliatewp.com/add-ons/pro/signup-referrals/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Signup%20Referrals\" title=\"Signup Referrals\">\n				<img width=\"880\" height=\"440\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2016/02/add-on-signup-referrals.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Signup Referrals\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2016/02/add-on-signup-referrals.png 880w, https://s7386.pcdn.co/wp-content/uploads/edd/2016/02/add-on-signup-referrals-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2016/02/add-on-signup-referrals-300x150.png 300w, https://s7386.pcdn.co/wp-content/uploads/edd/2016/02/add-on-signup-referrals-768x384.png 768w, https://s7386.pcdn.co/wp-content/uploads/edd/2016/02/add-on-signup-referrals-663x332.png 663w, https://s7386.pcdn.co/wp-content/uploads/edd/2016/02/add-on-signup-referrals-771x386.png 771w\" sizes=\"(max-width: 880px) 100vw, 880px\" />			</a>\n			<p>Award commission when referred users sign up for a WordPress user account</p>\n			<a href=\"https://affiliatewp.com/add-ons/pro/signup-referrals/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Signup%20Referrals\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Affiliate Forms For Gravity Forms</h3>\n			<a href=\"https://affiliatewp.com/add-ons/pro/affiliate-forms-for-gravity-forms/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Affiliate%20Forms%20For%20Gravity%20Forms\" title=\"Affiliate Forms For Gravity Forms\">\n				<img width=\"720\" height=\"360\" src=\"https://s7386.pcdn.co/wp-content/uploads/2015/05/affiliate-forms-for-gravity-forms.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Affiliate Forms For Gravity Forms\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/2015/05/affiliate-forms-for-gravity-forms.png 720w, https://s7386.pcdn.co/wp-content/uploads/2015/05/affiliate-forms-for-gravity-forms-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/2015/05/affiliate-forms-for-gravity-forms-300x150.png 300w, https://s7386.pcdn.co/wp-content/uploads/2015/05/affiliate-forms-for-gravity-forms-663x332.png 663w\" sizes=\"(max-width: 720px) 100vw, 720px\" />			</a>\n			<p>Create the affiliate registration form you need using the power of Gravity Forms</p>\n			<a href=\"https://affiliatewp.com/add-ons/pro/affiliate-forms-for-gravity-forms/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Affiliate%20Forms%20For%20Gravity%20Forms\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Affiliate Forms For Ninja Forms</h3>\n			<a href=\"https://affiliatewp.com/add-ons/pro/affiliate-forms-for-ninja-forms/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Affiliate%20Forms%20For%20Ninja%20Forms\" title=\"Affiliate Forms For Ninja Forms\">\n				<img width=\"720\" height=\"360\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2015/04/affiliate-forms-for-ninja-forms.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Affiliate Forms For Ninja Forms\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2015/04/affiliate-forms-for-ninja-forms.png 720w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/04/affiliate-forms-for-ninja-forms-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/04/affiliate-forms-for-ninja-forms-300x150.png 300w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/04/affiliate-forms-for-ninja-forms-663x332.png 663w\" sizes=\"(max-width: 720px) 100vw, 720px\" />			</a>\n			<p>Create the affiliate registration form you need using the flexibility of Ninja Forms</p>\n			<a href=\"https://affiliatewp.com/add-ons/pro/affiliate-forms-for-ninja-forms/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Affiliate%20Forms%20For%20Ninja%20Forms\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Pushover Notifications</h3>\n			<a href=\"https://affiliatewp.com/add-ons/pro/pushover-notifications/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Pushover%20Notifications\" title=\"Pushover Notifications\">\n				<img width=\"585\" height=\"293\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/12/add-on-pushover-notifications.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Pushover Notifications\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/12/add-on-pushover-notifications.png 585w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/12/add-on-pushover-notifications-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/12/add-on-pushover-notifications-300x150.png 300w\" sizes=\"(max-width: 585px) 100vw, 585px\" />			</a>\n			<p>Send push notifications on new referrals to your affiliates!</p>\n			<a href=\"https://affiliatewp.com/add-ons/pro/pushover-notifications/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Pushover%20Notifications\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Lifetime Commissions</h3>\n			<a href=\"https://affiliatewp.com/add-ons/pro/lifetime-commissions/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Lifetime%20Commissions\" title=\"Lifetime Commissions\">\n				<img width=\"585\" height=\"293\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-lifetime-commissions.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Lifetime Commissions\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-lifetime-commissions.png 585w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-lifetime-commissions-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-lifetime-commissions-300x150.png 300w\" sizes=\"(max-width: 585px) 100vw, 585px\" />			</a>\n			<p>Allow your affiliates to receive a commission on all future purchases by the customer</p>\n			<a href=\"https://affiliatewp.com/add-ons/pro/lifetime-commissions/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Lifetime%20Commissions\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Recurring Referrals</h3>\n			<a href=\"https://affiliatewp.com/add-ons/pro/recurring-referrals/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Recurring%20Referrals\" title=\"Recurring Referrals\">\n				<img width=\"2000\" height=\"1000\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-recurring-referrals.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Recurring Referrals\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-recurring-referrals.png 2000w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-recurring-referrals-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-recurring-referrals-300x150.png 300w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-recurring-referrals-768x384.png 768w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-recurring-referrals-1024x512.png 1024w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-recurring-referrals-663x332.png 663w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-recurring-referrals-771x386.png 771w\" sizes=\"(max-width: 2000px) 100vw, 2000px\" />			</a>\n			<p>Track on-going referrals for subscription payments and membership plugins</p>\n			<a href=\"https://affiliatewp.com/add-ons/pro/recurring-referrals/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Recurring%20Referrals\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Tiered Affiliate Rates</h3>\n			<a href=\"https://affiliatewp.com/add-ons/pro/tiered-affiliate-rates/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Tiered%20Affiliate%20Rates\" title=\"Tiered Affiliate Rates\">\n				<img width=\"585\" height=\"293\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-tired-affiliate-rates.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Tiered Affiliate Rates\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-tired-affiliate-rates.png 585w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-tired-affiliate-rates-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-tired-affiliate-rates-300x150.png 300w\" sizes=\"(max-width: 585px) 100vw, 585px\" />			</a>\n			<p>Reward your affiliates with higher commission rates</p>\n			<a href=\"https://affiliatewp.com/add-ons/pro/tiered-affiliate-rates/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Tiered%20Affiliate%20Rates\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Affiliate Dashboard Sharing</h3>\n			<a href=\"https://affiliatewp.com/add-ons/pro/affiliate-dashboard-sharing/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Affiliate%20Dashboard%20Sharing\" title=\"Affiliate Dashboard Sharing\">\n				<img width=\"585\" height=\"293\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-affiliate-dashboard-sharing.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Affiliate Dashboard Sharing\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-affiliate-dashboard-sharing.png 585w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-affiliate-dashboard-sharing-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-affiliate-dashboard-sharing-300x150.png 300w\" sizes=\"(max-width: 585px) 100vw, 585px\" />			</a>\n			<p>Allow your affiliates to easily share generated referral URLs</p>\n			<a href=\"https://affiliatewp.com/add-ons/pro/affiliate-dashboard-sharing/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Affiliate%20Dashboard%20Sharing\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">PayPal Payouts</h3>\n			<a href=\"https://affiliatewp.com/add-ons/pro/paypal-payouts/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=PayPal%20Payouts\" title=\"PayPal Payouts\">\n				<img width=\"2000\" height=\"1000\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-paypal-payouts.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"PayPal Payouts\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-paypal-payouts.png 2000w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-paypal-payouts-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-paypal-payouts-300x150.png 300w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-paypal-payouts-768x384.png 768w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-paypal-payouts-1024x512.png 1024w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-paypal-payouts-663x332.png 663w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-paypal-payouts-771x386.png 771w\" sizes=\"(max-width: 2000px) 100vw, 2000px\" />			</a>\n			<p>Instantly pay affiliates. One click payments through PayPal</p>\n			<a href=\"https://affiliatewp.com/add-ons/pro/paypal-payouts/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=PayPal%20Payouts\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		','no'),(153,'_transient_timeout_affiliatewp_add_ons_feed_official-free','1597892129','no'),(154,'_transient_affiliatewp_add_ons_feed_official-free','\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Blocks</h3>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/blocks/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Blocks\" title=\"Blocks\">\n				<img width=\"1760\" height=\"880\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2020/05/add-ons-blocks.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Blocks\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2020/05/add-ons-blocks.png 1760w, https://s7386.pcdn.co/wp-content/uploads/edd/2020/05/add-ons-blocks-300x150.png 300w, https://s7386.pcdn.co/wp-content/uploads/edd/2020/05/add-ons-blocks-1024x512.png 1024w, https://s7386.pcdn.co/wp-content/uploads/edd/2020/05/add-ons-blocks-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2020/05/add-ons-blocks-768x384.png 768w, https://s7386.pcdn.co/wp-content/uploads/edd/2020/05/add-ons-blocks-1536x768.png 1536w, https://s7386.pcdn.co/wp-content/uploads/edd/2020/05/add-ons-blocks-663x332.png 663w, https://s7386.pcdn.co/wp-content/uploads/edd/2020/05/add-ons-blocks-991x496.png 991w\" sizes=\"(max-width: 1760px) 100vw, 1760px\" />			</a>\n			<p>A set of blocks for use within the new WordPress editor</p>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/blocks/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Blocks\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Starting Affiliate ID</h3>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/starting-affiliate-id/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Starting%20Affiliate%20ID\" title=\"Starting Affiliate ID\">\n				<img width=\"1760\" height=\"880\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2019/06/add-on-starting-affiliate-number.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Starting Affiliate ID\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2019/06/add-on-starting-affiliate-number.png 1760w, https://s7386.pcdn.co/wp-content/uploads/edd/2019/06/add-on-starting-affiliate-number-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2019/06/add-on-starting-affiliate-number-300x150.png 300w, https://s7386.pcdn.co/wp-content/uploads/edd/2019/06/add-on-starting-affiliate-number-768x384.png 768w, https://s7386.pcdn.co/wp-content/uploads/edd/2019/06/add-on-starting-affiliate-number-1024x512.png 1024w, https://s7386.pcdn.co/wp-content/uploads/edd/2019/06/add-on-starting-affiliate-number-663x332.png 663w, https://s7386.pcdn.co/wp-content/uploads/edd/2019/06/add-on-starting-affiliate-number-991x496.png 991w\" sizes=\"(max-width: 1760px) 100vw, 1760px\" />			</a>\n			<p>Specify a custom ID for the very first affiliate who registers, or for the next affiliate registration</p>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/starting-affiliate-id/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Starting%20Affiliate%20ID\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Affiliate Area Tabs</h3>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/affiliate-area-tabs/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Affiliate%20Area%20Tabs\" title=\"Affiliate Area Tabs\">\n				<img width=\"880\" height=\"440\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2016/04/add-on-affiliate-area-tabs.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Affiliate Area Tabs\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2016/04/add-on-affiliate-area-tabs.png 880w, https://s7386.pcdn.co/wp-content/uploads/edd/2016/04/add-on-affiliate-area-tabs-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2016/04/add-on-affiliate-area-tabs-300x150.png 300w, https://s7386.pcdn.co/wp-content/uploads/edd/2016/04/add-on-affiliate-area-tabs-768x384.png 768w, https://s7386.pcdn.co/wp-content/uploads/edd/2016/04/add-on-affiliate-area-tabs-663x332.png 663w, https://s7386.pcdn.co/wp-content/uploads/edd/2016/04/add-on-affiliate-area-tabs-771x386.png 771w\" sizes=\"(max-width: 880px) 100vw, 880px\" />			</a>\n			<p>Manage the Affiliate Area\'s tabs</p>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/affiliate-area-tabs/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Affiliate%20Area%20Tabs\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Affiliate Info</h3>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/affiliate-info/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Affiliate%20Info\" title=\"Affiliate Info\">\n				<img width=\"720\" height=\"360\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2015/10/add-on-affiliate-info.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Affiliate Info\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2015/10/add-on-affiliate-info.png 720w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/10/add-on-affiliate-info-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/10/add-on-affiliate-info-300x150.png 300w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/10/add-on-affiliate-info-663x332.png 663w\" sizes=\"(max-width: 720px) 100vw, 720px\" />			</a>\n			<p>Show information based on the affiliate\'s referral URL</p>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/affiliate-info/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Affiliate%20Info\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">External Referral Links</h3>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/external-referral-links/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=External%20Referral%20Links\" title=\"External Referral Links\">\n				<img width=\"720\" height=\"360\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2015/05/add-on-external-referral-links.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"External Referral Links add-on for AffiliateWP\" title=\"External Referral Links\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2015/05/add-on-external-referral-links.png 720w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/05/add-on-external-referral-links-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/05/add-on-external-referral-links-300x150.png 300w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/05/add-on-external-referral-links-663x332.png 663w\" sizes=\"(max-width: 720px) 100vw, 720px\" />			</a>\n			<p>Allows affiliates to promote external WordPress-based pages</p>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/external-referral-links/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=External%20Referral%20Links\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Allow Own Referrals</h3>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/allow-own-referrals/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Allow%20Own%20Referrals\" title=\"Allow Own Referrals\">\n				<img width=\"720\" height=\"360\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2015/04/allow-own-referrals.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Allow Own Referrals\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2015/04/allow-own-referrals.png 720w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/04/allow-own-referrals-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/04/allow-own-referrals-300x150.png 300w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/04/allow-own-referrals-663x332.png 663w\" sizes=\"(max-width: 720px) 100vw, 720px\" />			</a>\n			<p>Allows an affiliate to earn commission on their own referrals</p>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/allow-own-referrals/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Allow%20Own%20Referrals\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Show Affiliate Coupons</h3>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/show-affiliate-coupons/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Show%20Affiliate%20Coupons\" title=\"Show Affiliate Coupons\">\n				<img width=\"720\" height=\"361\" src=\"https://s7386.pcdn.co/wp-content/uploads/2015/04/add-on-show-affiliate-coupons.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Show Affiliate Coupons\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/2015/04/add-on-show-affiliate-coupons.png 720w, https://s7386.pcdn.co/wp-content/uploads/2015/04/add-on-show-affiliate-coupons-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/2015/04/add-on-show-affiliate-coupons-300x150.png 300w, https://s7386.pcdn.co/wp-content/uploads/2015/04/add-on-show-affiliate-coupons-663x332.png 663w\" sizes=\"(max-width: 720px) 100vw, 720px\" />			</a>\n			<p>Show affiliates tracked coupon codes assigned to them</p>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/show-affiliate-coupons/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Show%20Affiliate%20Coupons\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Allowed Products</h3>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/allowed-products/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Allowed%20Products\" title=\"Allowed Products\">\n				<img width=\"585\" height=\"293\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2015/03/add-on-allowed-products.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Allowed Products\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2015/03/add-on-allowed-products.png 585w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/03/add-on-allowed-products-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/03/add-on-allowed-products-300x150.png 300w\" sizes=\"(max-width: 585px) 100vw, 585px\" />			</a>\n			<p>Allows only specific products to generate commission</p>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/allowed-products/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Allowed%20Products\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Affiliate Area Shortcodes</h3>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/affiliate-area-shortcodes/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Affiliate%20Area%20Shortcodes\" title=\"Affiliate Area Shortcodes\">\n				<img width=\"585\" height=\"293\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2015/02/add-on-affiliate-area-shortcodes.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Affiliate Area Shortcodes\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2015/02/add-on-affiliate-area-shortcodes.png 585w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/02/add-on-affiliate-area-shortcodes-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/02/add-on-affiliate-area-shortcodes-300x150.png 300w\" sizes=\"(max-width: 585px) 100vw, 585px\" />			</a>\n			<p>Provides shortcodes for each tab of the Affiliate Area</p>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/affiliate-area-shortcodes/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Affiliate%20Area%20Shortcodes\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Affiliate Product Rates</h3>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/affiliate-product-rates/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Affiliate%20Product%20Rates\" title=\"Affiliate Product Rates\">\n				<img width=\"585\" height=\"293\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2015/01/add-on-affiliate-product-rates.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Affiliate Product Rates\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2015/01/add-on-affiliate-product-rates.png 585w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/01/add-on-affiliate-product-rates-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/01/add-on-affiliate-product-rates-300x150.png 300w\" sizes=\"(max-width: 585px) 100vw, 585px\" />			</a>\n			<p>Set product referral rates on a per-affiliate level</p>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/affiliate-product-rates/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Affiliate%20Product%20Rates\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Leaderboard</h3>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/leaderboard/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Leaderboard\" title=\"Leaderboard\">\n				<img width=\"585\" height=\"293\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/12/add-on-affiliate-leaderboard.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Leaderboard\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/12/add-on-affiliate-leaderboard.png 585w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/12/add-on-affiliate-leaderboard-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/12/add-on-affiliate-leaderboard-300x150.png 300w\" sizes=\"(max-width: 585px) 100vw, 585px\" />			</a>\n			<p>Show a leaderboard of your top affiliates</p>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/leaderboard/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Leaderboard\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Sign Up Bonus</h3>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/sign-up-bonus/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Sign%20Up%20Bonus\" title=\"Sign Up Bonus\">\n				<img width=\"585\" height=\"293\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-sign-up-bonus.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Sign Up Bonus\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-sign-up-bonus.png 585w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-sign-up-bonus-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-sign-up-bonus-300x150.png 300w\" sizes=\"(max-width: 585px) 100vw, 585px\" />			</a>\n			<p>Entice more affiliates to register by offering a sign up bonus</p>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/sign-up-bonus/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Sign%20Up%20Bonus\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Store Credit</h3>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/store-credit/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Store%20Credit\" title=\"Store Credit\">\n				<img width=\"585\" height=\"293\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-store-credit.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Store Credit\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-store-credit.png 585w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-store-credit-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-store-credit-300x150.png 300w\" sizes=\"(max-width: 585px) 100vw, 585px\" />			</a>\n			<p>Pay your affiliates with store credit</p>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/store-credit/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Store%20Credit\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Order Details For Affiliates</h3>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/order-details-for-affiliates/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Order%20Details%20For%20Affiliates\" title=\"Order Details For Affiliates\">\n				<img width=\"585\" height=\"293\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-order-details-for-affiliates.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Order Details For Affiliates\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-order-details-for-affiliates.png 585w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-order-details-for-affiliates-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2014/11/add-on-order-details-for-affiliates-300x150.png 300w\" sizes=\"(max-width: 585px) 100vw, 585px\" />			</a>\n			<p>Allow affiliates to see order details on referrals they generated</p>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/order-details-for-affiliates/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Order%20Details%20For%20Affiliates\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Force Pending Referrals</h3>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/force-pending-referrals/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Force%20Pending%20Referrals\" title=\"Force Pending Referrals\">\n				<img width=\"585\" height=\"293\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2015/01/add-on-force-pending-referrals.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Force Pending Referrals\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2015/01/add-on-force-pending-referrals.png 585w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/01/add-on-force-pending-referrals-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/01/add-on-force-pending-referrals-300x150.png 300w\" sizes=\"(max-width: 585px) 100vw, 585px\" />			</a>\n			<p>Force each referral to have a status of \"pending\" when created</p>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/force-pending-referrals/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Force%20Pending%20Referrals\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">WooCommerce Redirect Affiliates</h3>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/woocommerce-redirect-affiliates/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=WooCommerce%20Redirect%20Affiliates\" title=\"WooCommerce Redirect Affiliates\">\n				<img width=\"585\" height=\"293\" src=\"https://s7386.pcdn.co/wp-content/uploads/edd/2015/01/add-on-woocommerce-redirect-affiliates.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"WooCommerce Redirect Affiliates\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/edd/2015/01/add-on-woocommerce-redirect-affiliates.png 585w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/01/add-on-woocommerce-redirect-affiliates-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/edd/2015/01/add-on-woocommerce-redirect-affiliates-300x150.png 300w\" sizes=\"(max-width: 585px) 100vw, 585px\" />			</a>\n			<p>Redirect affiliates to their affiliate area when they login</p>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/woocommerce-redirect-affiliates/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=WooCommerce%20Redirect%20Affiliates\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		\n		<div class=\"affwp-add-on\">\n			<h3 class=\"affwp-add-on-title\">Checkout Referrals</h3>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/checkout-referrals/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Checkout%20Referrals\" title=\"Checkout Referrals\">\n				<img width=\"585\" height=\"293\" src=\"https://s7386.pcdn.co/wp-content/uploads/2015/01/add-on-checkout-referrals.png\" class=\"attachment-affwp-post-thumbnail size-affwp-post-thumbnail wp-post-image\" alt=\"\" title=\"Checkout Referrals\" srcset=\"https://s7386.pcdn.co/wp-content/uploads/2015/01/add-on-checkout-referrals.png 585w, https://s7386.pcdn.co/wp-content/uploads/2015/01/add-on-checkout-referrals-480x240.png 480w, https://s7386.pcdn.co/wp-content/uploads/2015/01/add-on-checkout-referrals-300x150.png 300w\" sizes=\"(max-width: 585px) 100vw, 585px\" />			</a>\n			<p>Allows a customer to award a referral to a specific affiliate at checkout</p>\n			<a href=\"https://affiliatewp.com/add-ons/official-free/checkout-referrals/?utm_source=plugin-addons-page&#038;utm_medium=plugin&#038;utm_campaign=AffWPAddonsPage&#038;utm_content=Checkout%20Referrals\" class=\"button-secondary\">Get this add-on</a>\n\n		</div>\n\n		','no');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','default'),(2,3,'_wp_page_template','default');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2020-08-19 21:45:55','2020-08-19 21:45:55','<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->','Hello world!','','publish','open','open','','hello-world','','','2020-08-19 21:45:55','2020-08-19 21:45:55','',0,'http://localhost/bh-awp-add-affiliates-to-klaviyo/?p=1',0,'post','',1),(2,1,'2020-08-19 21:45:55','2020-08-19 21:45:55','<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost/bh-awp-add-affiliates-to-klaviyo/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->','Sample Page','','publish','closed','open','','sample-page','','','2020-08-19 21:45:55','2020-08-19 21:45:55','',0,'http://localhost/bh-awp-add-affiliates-to-klaviyo/?page_id=2',0,'page','',0),(3,1,'2020-08-19 21:45:55','2020-08-19 21:45:55','<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://localhost/bh-awp-add-affiliates-to-klaviyo.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->','Privacy Policy','','draft','closed','open','','privacy-policy','','','2020-08-19 21:45:55','2020-08-19 21:45:55','',0,'http://localhost/bh-awp-add-affiliates-to-klaviyo/?page_id=3',0,'page','',0),(4,1,'2020-08-20 01:54:39','2020-08-20 01:54:39','[affiliate_area]','Affiliate Area','','publish','closed','closed','','affiliate-area','','','2020-08-20 01:54:39','2020-08-20 01:54:39','',0,'http://localhost/bh-awp-add-affiliates-to-klaviyo/?page_id=4',0,'page','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (1,1,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,1);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','admin'),(2,1,'first_name',''),(3,1,'last_name',''),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'syntax_highlighting','true'),(7,1,'comment_shortcuts','false'),(8,1,'admin_color','fresh'),(9,1,'use_ssl','0'),(10,1,'show_admin_bar_front','true'),(11,1,'locale',''),(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(13,1,'wp_user_level','10'),(14,1,'dismissed_wp_pointers',''),(15,1,'show_welcome_panel','1'),(16,2,'nickname','bob'),(17,2,'first_name',''),(18,2,'last_name',''),(19,2,'description',''),(20,2,'rich_editing','true'),(21,2,'syntax_highlighting','true'),(22,2,'comment_shortcuts','false'),(23,2,'admin_color','fresh'),(24,2,'use_ssl','0'),(25,2,'show_admin_bar_front','true'),(26,2,'locale',''),(27,2,'wp_capabilities','a:1:{s:10:\"subscriber\";b:1;}'),(28,2,'wp_user_level','0'),(29,2,'dismissed_wp_pointers',''),(30,1,'session_tokens','a:2:{s:64:\"82e6faaf74ffb3c51710db9b9601c56c7ad06e9d632199b8ae66b51defedf17d\";a:4:{s:10:\"expiration\";i:1598061146;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:18:\"Symfony BrowserKit\";s:5:\"login\";i:1597888346;}s:64:\"bca26d97cfbbee00b05961093c10158a472a311b24ba55ab51120ab283d9d08b\";a:4:{s:10:\"expiration\";i:1598061268;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:80.0) Gecko/20100101 Firefox/80.0\";s:5:\"login\";i:1597888468;}}');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'admin','$P$BTT9hV1XL26UNDhZPr26LKs44G6/ar0','admin','admin@example.org','http://localhost/bh-awp-add-affiliates-to-klaviyo','2020-08-19 21:45:54','',0,'admin'),(2,'bob','$P$BoW98K0cEVc9oidq/Sybnxegx8JweD0','bob','bob@example.org','','2020-08-19 21:46:00','',0,'bob');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `wp_affiliate_wp_campaigns`
--

/*!50001 DROP VIEW IF EXISTS `wp_affiliate_wp_campaigns`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_520_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`bh-awp-add-affiliates-to-klaviy`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `wp_affiliate_wp_campaigns` AS select `wp_affiliate_wp_visits`.`affiliate_id` AS `affiliate_id`,`wp_affiliate_wp_visits`.`campaign` AS `campaign`,count(`wp_affiliate_wp_visits`.`url`) AS `visits`,count(distinct `wp_affiliate_wp_visits`.`url`) AS `unique_visits`,sum(if((`wp_affiliate_wp_visits`.`referral_id` <> 0),1,0)) AS `referrals`,round(((sum(if((`wp_affiliate_wp_visits`.`referral_id` <> 0),1,0)) / count(`wp_affiliate_wp_visits`.`url`)) * 100),2) AS `conversion_rate` from `wp_affiliate_wp_visits` group by `wp_affiliate_wp_visits`.`affiliate_id`,`wp_affiliate_wp_visits`.`campaign` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-19 19:20:04
