-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: typecho
-- ------------------------------------------------------
-- Server version	10.1.37-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `typecho`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `typecho` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `typecho`;

--
-- Table structure for table `typecho_comments`
--

DROP TABLE IF EXISTS `typecho_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typecho_comments` (
  `coid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned DEFAULT '0',
  `created` int(10) unsigned DEFAULT '0',
  `author` varchar(200) DEFAULT NULL,
  `authorId` int(10) unsigned DEFAULT '0',
  `ownerId` int(10) unsigned DEFAULT '0',
  `mail` varchar(200) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `agent` varchar(511) DEFAULT NULL,
  `text` text,
  `type` varchar(16) DEFAULT 'comment',
  `status` varchar(16) DEFAULT 'approved',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`coid`),
  KEY `cid` (`cid`),
  KEY `created` (`created`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typecho_comments`
--

LOCK TABLES `typecho_comments` WRITE;
/*!40000 ALTER TABLE `typecho_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `typecho_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typecho_contents`
--

DROP TABLE IF EXISTS `typecho_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typecho_contents` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `created` int(10) unsigned DEFAULT '0',
  `modified` int(10) unsigned DEFAULT '0',
  `text` longtext,
  `order` int(10) unsigned DEFAULT '0',
  `authorId` int(10) unsigned DEFAULT '0',
  `template` varchar(32) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'post',
  `status` varchar(16) DEFAULT 'publish',
  `password` varchar(32) DEFAULT NULL,
  `commentsNum` int(10) unsigned DEFAULT '0',
  `allowComment` char(1) DEFAULT '0',
  `allowPing` char(1) DEFAULT '0',
  `allowFeed` char(1) DEFAULT '0',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `slug` (`slug`),
  KEY `created` (`created`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typecho_contents`
--

LOCK TABLES `typecho_contents` WRITE;
/*!40000 ALTER TABLE `typecho_contents` DISABLE KEYS */;
INSERT INTO `typecho_contents` VALUES (3,'1796578910.jpeg','1796578910-jpeg',1553481552,1553481552,'a:5:{s:4:\"name\";s:15:\"1796578910.jpeg\";s:4:\"path\";s:36:\"/usr/uploads/2019/03/2311125299.jpeg\";s:4:\"size\";i:144007;s:4:\"type\";s:4:\"jpeg\";s:4:\"mime\";s:10:\"image/jpeg\";}',1,1,NULL,'attachment','publish',NULL,0,'1','0','1',4),(2,'关于','start-page',1553479513,1553479513,'<!--markdown-->本页面由 Typecho 创建, 这只是个测试页面.',0,1,NULL,'page','publish',NULL,0,'1','1','1',0),(4,'mariadb安装与配置','4',1553481540,1553483970,'<!--markdown--> - **安装**\r\n\r\n同时安装mariadb服务器和客户端（mycli也支持mariadb）\r\n\r\n      #sudo pacman -S mariadb mycli\r\n\r\n - **配置**\r\n\r\n先初始化\r\n\r\n      #sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql\r\n允许开机启动和启动mariadb\r\n\r\n      #sudo systemctl enable mariadb\r\n      #sudo systemctl start mariadb\r\n\r\n配置root账户，一路回车和按提示输入密码\r\n\r\n      #mysql_secure_installation\r\n\r\n\r\n使用root账户登录\r\n\r\n      #mysql -u root -p\r\n\r\n创建新用户和授予全部权限并更新用户授权\r\n\r\n      >create user \'yi\'@\'localhost\' identified by \'1\';\r\n      >grant all privileges on *.* to yi@localhost identified by \'1\';\r\n      >flush privileges;\r\n\r\n - **常用命令**\r\n\r\n修改密码\r\n\r\n      >set password for \'yi\'@\'localhost\'=Password(\'1\');\r\n\r\n创建数据库\r\n\r\n      >create database demo;\r\n\r\n显示所用数据库和表格（先选中数据库）\r\n\r\n      >show databases;\r\n      >use demo;\r\n      >show tables;\r\n\r\n显示数据库表结构\r\n\r\n      >describe demo;\r\n\r\n删除表格和数据库\r\n\r\n      >drop database demo;\r\n      >drop table table1;\r\n\r\n备份和还原\r\n\r\n      #mysqldump -uyi -p\'1\' -B typecho > typecho_bak.sql\r\n      #mysql -uyi -p\'1\' < typecho_bak.sql\r\n',0,1,NULL,'post','publish',NULL,0,'1','1','1',0),(5,'debian9配置nginx建立typecho个人博客','5',1553594269,1553594269,'<!--markdown--> - **配置数据库**\r\n\r\n安装MySQL或mariadb，建立typecho的专用账户和数据库\r\n例如创建yi用户和新建typecho数据库\r\n\r\n    # mysql -u root -p //使用root账户登录mysql\r\n    > grant all privileges on *.* to yi@localhost identified by \'1\'; //创建yi用户并授予全部权限\r\n    > create database typecho; //创建数据库typecho\r\n\r\n - **配置php**\r\n\r\ntypecho要php环境来支持，安装php，修改php.ini开启mysql支持\r\n\r\n    # sudo apt install php php-mysql\r\n    # sudo vim /etc/php/7.0/fpm/php.ini\r\n\r\n启动php-fpm\r\n\r\n    # sudo php-fpm7.0\r\n    # sudo mkdir /run/php //如果提示找不到目录就执行此句\r\n\r\n - **配置nginx**\r\n\r\n安装nginx，修改nginx用户组，开启php支持\r\n\r\n    # sudo apt install nginx\r\n    # sudo vim /etc/nginx/nginx.conf\r\n    # sudo vim /etc/nginx/sites-available/default\r\n\r\n把typecho放到nginx的web目录下面\r\n\r\n    # sudo cp * /var/www/html\r\n\r\n启动nginx服务\r\n\r\n    # sudo service nginx start\r\n',0,1,NULL,'post','publish',NULL,0,'1','1','1',0),(7,'捕获.JPG','捕获-JPG',1554689470,1554689470,'a:5:{s:4:\"name\";s:10:\"捕获.JPG\";s:4:\"path\";s:35:\"/usr/uploads/2019/04/3262146100.jpg\";s:4:\"size\";i:16720;s:4:\"type\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";}',1,1,NULL,'attachment','publish',NULL,0,'1','0','1',8),(8,'Visual Studio 禁止自动生成 *.VC.db和*.ipch 文件','8',1554689500,1554689500,'<!--markdown-->设置方法：工具–》选项–》文本编辑器–》C/C++–》高级，把回退位置和警告设置为true或者禁用数据库设为true，这样就不会产生那个文件了。\r\n![捕获.JPG][1]\r\n\r\n\r\n  [1]: http://127.0.0.1/usr/uploads/2019/04/3262146100.jpg',0,1,NULL,'post','publish',NULL,0,'1','1','1',0);
/*!40000 ALTER TABLE `typecho_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typecho_fields`
--

DROP TABLE IF EXISTS `typecho_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typecho_fields` (
  `cid` int(10) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `type` varchar(8) DEFAULT 'str',
  `str_value` text,
  `int_value` int(10) DEFAULT '0',
  `float_value` float DEFAULT '0',
  PRIMARY KEY (`cid`,`name`),
  KEY `int_value` (`int_value`),
  KEY `float_value` (`float_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typecho_fields`
--

LOCK TABLES `typecho_fields` WRITE;
/*!40000 ALTER TABLE `typecho_fields` DISABLE KEYS */;
INSERT INTO `typecho_fields` VALUES (4,'picUrl','str','http://127.0.0.1/usr/uploads/2019/03/2311125299.jpeg',0,0),(4,'description','str','',0,0),(5,'picUrl','str','',0,0),(5,'description','str','debian9 typecho mysql nginx mariadb/mysql',0,0),(8,'picUrl','str','',0,0),(8,'description','str','',0,0);
/*!40000 ALTER TABLE `typecho_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typecho_metas`
--

DROP TABLE IF EXISTS `typecho_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typecho_metas` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `count` int(10) unsigned DEFAULT '0',
  `order` int(10) unsigned DEFAULT '0',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typecho_metas`
--

LOCK TABLES `typecho_metas` WRITE;
/*!40000 ALTER TABLE `typecho_metas` DISABLE KEYS */;
INSERT INTO `typecho_metas` VALUES (1,'默认分类','default','category','只是一个默认分类',3,1,0);
/*!40000 ALTER TABLE `typecho_metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typecho_options`
--

DROP TABLE IF EXISTS `typecho_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typecho_options` (
  `name` varchar(32) NOT NULL,
  `user` int(10) unsigned NOT NULL DEFAULT '0',
  `value` text,
  PRIMARY KEY (`name`,`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typecho_options`
--

LOCK TABLES `typecho_options` WRITE;
/*!40000 ALTER TABLE `typecho_options` DISABLE KEYS */;
INSERT INTO `typecho_options` VALUES ('theme',0,'Material'),('theme:Material',0,'a:58:{s:6:\"switch\";a:4:{i:0;s:12:\"SmoothScroll\";i:1;s:15:\"ShowLoadingLine\";i:2;s:8:\"PanguPHP\";i:3;s:9:\"HighLight\";}s:9:\"commentis\";i:0;s:11:\"CommentRows\";i:1;s:15:\"DisqusShortname\";N;s:14:\"DisqusSiteName\";N;s:9:\"DisqusApi\";s:30:\"https://disqus.skk.moe/disqus/\";s:12:\"DisqusApiKey\";N;s:11:\"DisqusAdmin\";N;s:16:\"DisqusAdminLabel\";N;s:19:\"SwitchToDisqusSince\";i:0;s:6:\"qrcode\";i:0;s:8:\"searchis\";i:1;s:7:\"CDNType\";i:0;s:6:\"CDNURL\";N;s:8:\"language\";s:5:\"zh-CN\";s:9:\"footersns\";a:0:{}s:11:\"FacebookURL\";N;s:10:\"TwitterURL\";N;s:13:\"GooglePlusURL\";N;s:8:\"WeiboURL\";N;s:12:\"InstagramURL\";N;s:9:\"TumblrURL\";N;s:9:\"GithubURL\";N;s:11:\"LinkedinURL\";N;s:8:\"ZhihuURL\";N;s:11:\"BilibiliURL\";N;s:11:\"TelegramURL\";N;s:7:\"V2EXURL\";N;s:12:\"post_license\";N;s:11:\"footer_text\";N;s:12:\"RobotoSource\";i:3;s:8:\"analysis\";N;s:7:\"adsense\";N;s:11:\"DNSPrefetch\";N;s:12:\"loadingcolor\";s:4:\"#29d\";s:13:\"loadingbuffer\";i:800;s:11:\"SearchColor\";N;s:6:\"BGtype\";i:1;s:7:\"bgcolor\";N;s:12:\"GradientType\";i:0;s:15:\"ThumbnailOption\";i:1;s:10:\"TitleColor\";s:4:\"#FFF\";s:13:\"RandomPicAmnt\";i:19;s:10:\"ThemeColor\";s:7:\"#0097A7\";s:10:\"alinkcolor\";s:7:\"#00838F\";s:16:\"ChromeThemeColor\";s:7:\"#0097A7\";s:16:\"ButtonThemeColor\";s:7:\"#757575\";s:13:\"CardElevation\";i:2;s:9:\"avatarURL\";N;s:7:\"favicon\";N;s:13:\"sidebarheader\";N;s:8:\"dailypic\";N;s:4:\"logo\";N;s:8:\"logosize\";i:0;s:12:\"dailypicLink\";s:1:\"#\";s:8:\"logoLink\";s:1:\"#\";s:6:\"slogan\";s:20:\"Hi, nice to meet you\";s:11:\"CustomFonts\";s:124:\"Roboto, \'Helvetica Neue\', Helvetica, \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'微软雅黑\', Arial, sans-serif\";}'),('timezone',0,'28800'),('lang',0,'zh_CN'),('charset',0,'UTF-8'),('contentType',0,'text/html'),('gzip',0,'0'),('generator',0,'Typecho 1.2/18.1.29'),('title',0,'Hello World'),('description',0,'Just So So ...'),('keywords',0,'typecho,php,blog'),('rewrite',0,'0'),('frontPage',0,'recent'),('frontArchive',0,'0'),('commentsRequireMail',0,'1'),('commentsWhitelist',0,'0'),('commentsRequireURL',0,'0'),('commentsRequireModeration',0,'0'),('plugins',0,'a:2:{s:9:\"activated\";a:3:{s:4:\"Snow\";a:1:{s:7:\"handles\";a:2:{s:21:\"Widget_Archive:header\";a:1:{i:0;a:2:{i:0;s:11:\"Snow_Plugin\";i:1;s:6:\"header\";}}s:21:\"Widget_Archive:footer\";a:1:{i:0;a:2:{i:0;s:11:\"Snow_Plugin\";i:1;s:6:\"footer\";}}}}s:3:\"Pio\";a:1:{s:7:\"handles\";a:2:{s:21:\"Widget_Archive:header\";a:1:{i:0;a:2:{i:0;s:10:\"Pio_Plugin\";i:1;s:6:\"header\";}}s:21:\"Widget_Archive:footer\";a:1:{i:0;a:2:{i:0;s:10:\"Pio_Plugin\";i:1;s:6:\"footer\";}}}}s:14:\"BadApplePlayer\";a:1:{s:7:\"handles\";a:1:{s:21:\"Widget_Archive:footer\";a:1:{i:0;a:2:{i:0;s:21:\"BadApplePlayer_Plugin\";i:1;s:6:\"render\";}}}}}s:7:\"handles\";a:2:{s:21:\"Widget_Archive:header\";a:2:{i:0;a:2:{i:0;s:11:\"Snow_Plugin\";i:1;s:6:\"header\";}s:5:\"0.001\";a:2:{i:0;s:10:\"Pio_Plugin\";i:1;s:6:\"header\";}}s:21:\"Widget_Archive:footer\";a:3:{i:0;a:2:{i:0;s:11:\"Snow_Plugin\";i:1;s:6:\"footer\";}s:5:\"0.001\";a:2:{i:0;s:10:\"Pio_Plugin\";i:1;s:6:\"footer\";}s:5:\"0.002\";a:2:{i:0;s:21:\"BadApplePlayer_Plugin\";i:1;s:6:\"render\";}}}}'),('commentDateFormat',0,'F jS, Y \\a\\t h:i a'),('siteUrl',0,'http://127.0.0.1'),('defaultCategory',0,'1'),('allowRegister',0,'0'),('defaultAllowComment',0,'1'),('defaultAllowPing',0,'1'),('defaultAllowFeed',0,'1'),('pageSize',0,'5'),('postsListSize',0,'10'),('commentsListSize',0,'10'),('commentsHTMLTagAllowed',0,NULL),('postDateFormat',0,'Y-m-d'),('feedFullText',0,'1'),('editorSize',0,'350'),('autoSave',0,'0'),('markdown',0,'1'),('xmlrpcMarkdown',0,'0'),('commentsMaxNestingLevels',0,'5'),('commentsPostTimeout',0,'2592000'),('commentsUrlNofollow',0,'1'),('commentsShowUrl',0,'1'),('commentsMarkdown',0,'0'),('commentsPageBreak',0,'0'),('commentsThreaded',0,'1'),('commentsPageSize',0,'20'),('commentsPageDisplay',0,'last'),('commentsOrder',0,'ASC'),('commentsCheckReferer',0,'1'),('commentsAutoClose',0,'0'),('commentsPostIntervalEnable',0,'1'),('commentsPostInterval',0,'60'),('commentsShowCommentOnly',0,'0'),('commentsAvatar',0,'1'),('commentsAvatarRating',0,'G'),('commentsAntiSpam',0,'1'),('routingTable',0,'a:26:{i:0;a:25:{s:5:\"index\";a:6:{s:3:\"url\";s:1:\"/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:8:\"|^[/]?$|\";s:6:\"format\";s:1:\"/\";s:6:\"params\";a:0:{}}s:7:\"archive\";a:6:{s:3:\"url\";s:6:\"/blog/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:13:\"|^/blog[/]?$|\";s:6:\"format\";s:6:\"/blog/\";s:6:\"params\";a:0:{}}s:2:\"do\";a:6:{s:3:\"url\";s:22:\"/action/[action:alpha]\";s:6:\"widget\";s:9:\"Widget_Do\";s:6:\"action\";s:6:\"action\";s:4:\"regx\";s:32:\"|^/action/([_0-9a-zA-Z-]+)[/]?$|\";s:6:\"format\";s:10:\"/action/%s\";s:6:\"params\";a:1:{i:0;s:6:\"action\";}}s:4:\"post\";a:6:{s:3:\"url\";s:24:\"/archives/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:26:\"|^/archives/([0-9]+)[/]?$|\";s:6:\"format\";s:13:\"/archives/%s/\";s:6:\"params\";a:1:{i:0;s:3:\"cid\";}}s:10:\"attachment\";a:6:{s:3:\"url\";s:26:\"/attachment/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:28:\"|^/attachment/([0-9]+)[/]?$|\";s:6:\"format\";s:15:\"/attachment/%s/\";s:6:\"params\";a:1:{i:0;s:3:\"cid\";}}s:8:\"category\";a:6:{s:3:\"url\";s:17:\"/category/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:25:\"|^/category/([^/]+)[/]?$|\";s:6:\"format\";s:13:\"/category/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"slug\";}}s:3:\"tag\";a:6:{s:3:\"url\";s:12:\"/tag/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:20:\"|^/tag/([^/]+)[/]?$|\";s:6:\"format\";s:8:\"/tag/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"slug\";}}s:6:\"author\";a:6:{s:3:\"url\";s:22:\"/author/[uid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:24:\"|^/author/([0-9]+)[/]?$|\";s:6:\"format\";s:11:\"/author/%s/\";s:6:\"params\";a:1:{i:0;s:3:\"uid\";}}s:6:\"search\";a:6:{s:3:\"url\";s:19:\"/search/[keywords]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:23:\"|^/search/([^/]+)[/]?$|\";s:6:\"format\";s:11:\"/search/%s/\";s:6:\"params\";a:1:{i:0;s:8:\"keywords\";}}s:10:\"index_page\";a:6:{s:3:\"url\";s:21:\"/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:22:\"|^/page/([0-9]+)[/]?$|\";s:6:\"format\";s:9:\"/page/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"page\";}}s:12:\"archive_page\";a:6:{s:3:\"url\";s:26:\"/blog/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:27:\"|^/blog/page/([0-9]+)[/]?$|\";s:6:\"format\";s:14:\"/blog/page/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"page\";}}s:13:\"category_page\";a:6:{s:3:\"url\";s:32:\"/category/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:34:\"|^/category/([^/]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:16:\"/category/%s/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"slug\";i:1;s:4:\"page\";}}s:8:\"tag_page\";a:6:{s:3:\"url\";s:27:\"/tag/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:29:\"|^/tag/([^/]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:11:\"/tag/%s/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"slug\";i:1;s:4:\"page\";}}s:11:\"author_page\";a:6:{s:3:\"url\";s:37:\"/author/[uid:digital]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:33:\"|^/author/([0-9]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:14:\"/author/%s/%s/\";s:6:\"params\";a:2:{i:0;s:3:\"uid\";i:1;s:4:\"page\";}}s:11:\"search_page\";a:6:{s:3:\"url\";s:34:\"/search/[keywords]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:32:\"|^/search/([^/]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:14:\"/search/%s/%s/\";s:6:\"params\";a:2:{i:0;s:8:\"keywords\";i:1;s:4:\"page\";}}s:12:\"archive_year\";a:6:{s:3:\"url\";s:18:\"/[year:digital:4]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:19:\"|^/([0-9]{4})[/]?$|\";s:6:\"format\";s:4:\"/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"year\";}}s:13:\"archive_month\";a:6:{s:3:\"url\";s:36:\"/[year:digital:4]/[month:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:30:\"|^/([0-9]{4})/([0-9]{2})[/]?$|\";s:6:\"format\";s:7:\"/%s/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"year\";i:1;s:5:\"month\";}}s:11:\"archive_day\";a:6:{s:3:\"url\";s:52:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:41:\"|^/([0-9]{4})/([0-9]{2})/([0-9]{2})[/]?$|\";s:6:\"format\";s:10:\"/%s/%s/%s/\";s:6:\"params\";a:3:{i:0;s:4:\"year\";i:1;s:5:\"month\";i:2;s:3:\"day\";}}s:17:\"archive_year_page\";a:6:{s:3:\"url\";s:38:\"/[year:digital:4]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:33:\"|^/([0-9]{4})/page/([0-9]+)[/]?$|\";s:6:\"format\";s:12:\"/%s/page/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"year\";i:1;s:4:\"page\";}}s:18:\"archive_month_page\";a:6:{s:3:\"url\";s:56:\"/[year:digital:4]/[month:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:44:\"|^/([0-9]{4})/([0-9]{2})/page/([0-9]+)[/]?$|\";s:6:\"format\";s:15:\"/%s/%s/page/%s/\";s:6:\"params\";a:3:{i:0;s:4:\"year\";i:1;s:5:\"month\";i:2;s:4:\"page\";}}s:16:\"archive_day_page\";a:6:{s:3:\"url\";s:72:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:55:\"|^/([0-9]{4})/([0-9]{2})/([0-9]{2})/page/([0-9]+)[/]?$|\";s:6:\"format\";s:18:\"/%s/%s/%s/page/%s/\";s:6:\"params\";a:4:{i:0;s:4:\"year\";i:1;s:5:\"month\";i:2;s:3:\"day\";i:3;s:4:\"page\";}}s:12:\"comment_page\";a:6:{s:3:\"url\";s:53:\"[permalink:string]/comment-page-[commentPage:digital]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:36:\"|^(.+)/comment\\-page\\-([0-9]+)[/]?$|\";s:6:\"format\";s:18:\"%s/comment-page-%s\";s:6:\"params\";a:2:{i:0;s:9:\"permalink\";i:1;s:11:\"commentPage\";}}s:4:\"feed\";a:6:{s:3:\"url\";s:20:\"/feed[feed:string:0]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:4:\"feed\";s:4:\"regx\";s:17:\"|^/feed(.*)[/]?$|\";s:6:\"format\";s:7:\"/feed%s\";s:6:\"params\";a:1:{i:0;s:4:\"feed\";}}s:8:\"feedback\";a:6:{s:3:\"url\";s:31:\"[permalink:string]/[type:alpha]\";s:6:\"widget\";s:15:\"Widget_Feedback\";s:6:\"action\";s:6:\"action\";s:4:\"regx\";s:29:\"|^(.+)/([_0-9a-zA-Z-]+)[/]?$|\";s:6:\"format\";s:5:\"%s/%s\";s:6:\"params\";a:2:{i:0;s:9:\"permalink\";i:1;s:4:\"type\";}}s:4:\"page\";a:6:{s:3:\"url\";s:12:\"/[slug].html\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:22:\"|^/([^/]+)\\.html[/]?$|\";s:6:\"format\";s:8:\"/%s.html\";s:6:\"params\";a:1:{i:0;s:4:\"slug\";}}}s:5:\"index\";a:3:{s:3:\"url\";s:1:\"/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:7:\"archive\";a:3:{s:3:\"url\";s:6:\"/blog/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:2:\"do\";a:3:{s:3:\"url\";s:22:\"/action/[action:alpha]\";s:6:\"widget\";s:9:\"Widget_Do\";s:6:\"action\";s:6:\"action\";}s:4:\"post\";a:3:{s:3:\"url\";s:24:\"/archives/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:10:\"attachment\";a:3:{s:3:\"url\";s:26:\"/attachment/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:8:\"category\";a:3:{s:3:\"url\";s:17:\"/category/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:3:\"tag\";a:3:{s:3:\"url\";s:12:\"/tag/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:6:\"author\";a:3:{s:3:\"url\";s:22:\"/author/[uid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:6:\"search\";a:3:{s:3:\"url\";s:19:\"/search/[keywords]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:10:\"index_page\";a:3:{s:3:\"url\";s:21:\"/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:12:\"archive_page\";a:3:{s:3:\"url\";s:26:\"/blog/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:13:\"category_page\";a:3:{s:3:\"url\";s:32:\"/category/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:8:\"tag_page\";a:3:{s:3:\"url\";s:27:\"/tag/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:11:\"author_page\";a:3:{s:3:\"url\";s:37:\"/author/[uid:digital]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:11:\"search_page\";a:3:{s:3:\"url\";s:34:\"/search/[keywords]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:12:\"archive_year\";a:3:{s:3:\"url\";s:18:\"/[year:digital:4]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:13:\"archive_month\";a:3:{s:3:\"url\";s:36:\"/[year:digital:4]/[month:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:11:\"archive_day\";a:3:{s:3:\"url\";s:52:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:17:\"archive_year_page\";a:3:{s:3:\"url\";s:38:\"/[year:digital:4]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:18:\"archive_month_page\";a:3:{s:3:\"url\";s:56:\"/[year:digital:4]/[month:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:16:\"archive_day_page\";a:3:{s:3:\"url\";s:72:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:12:\"comment_page\";a:3:{s:3:\"url\";s:53:\"[permalink:string]/comment-page-[commentPage:digital]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:4:\"feed\";a:3:{s:3:\"url\";s:20:\"/feed[feed:string:0]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:4:\"feed\";}s:8:\"feedback\";a:3:{s:3:\"url\";s:31:\"[permalink:string]/[type:alpha]\";s:6:\"widget\";s:15:\"Widget_Feedback\";s:6:\"action\";s:6:\"action\";}s:4:\"page\";a:3:{s:3:\"url\";s:12:\"/[slug].html\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}}'),('actionTable',0,'a:0:{}'),('panelTable',0,'a:0:{}'),('attachmentTypes',0,'@image@'),('secret',0,'ZVnqKzmr8uJlpO6eAmRIGJU%XWwhF0GF'),('installed',0,'1'),('allowXmlRpc',0,'2'),('plugin:Snow',0,'a:9:{s:6:\"mobile\";i:1;s:10:\"flakeCount\";s:3:\"200\";s:4:\"size\";s:1:\"2\";s:7:\"minDist\";s:3:\"150\";s:5:\"speed\";s:3:\"0.5\";s:8:\"stepSize\";s:1:\"1\";s:9:\"snowcolor\";s:7:\"#ffffff\";s:7:\"opacity\";s:3:\"0.3\";s:7:\"bgcolor\";s:7:\"#7d895f\";}'),('plugin:Pio',0,'a:11:{s:13:\"choose_models\";a:1:{i:0;s:9:\"snow_miku\";}s:8:\"position\";s:4:\"left\";s:12:\"custom_width\";s:3:\"450\";s:13:\"custom_height\";s:3:\"450\";s:12:\"custom_model\";s:0:\"\";s:5:\"night\";s:0:\"\";s:11:\"custom_mode\";s:6:\"static\";s:6:\"hidden\";s:1:\"0\";s:4:\"tips\";s:1:\"0\";s:6:\"dialog\";s:0:\"\";s:8:\"selector\";s:0:\"\";}'),('plugin:BadApplePlayer',0,'a:5:{s:7:\"XlchKey\";s:7:\"Default\";s:8:\"IsJquery\";s:3:\"Yes\";s:18:\"IsJqueryMousewheel\";s:3:\"Yes\";s:13:\"IsFontAwesome\";s:3:\"Yes\";s:7:\"IsHttps\";s:2:\"No\";}');
/*!40000 ALTER TABLE `typecho_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typecho_relationships`
--

DROP TABLE IF EXISTS `typecho_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typecho_relationships` (
  `cid` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cid`,`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typecho_relationships`
--

LOCK TABLES `typecho_relationships` WRITE;
/*!40000 ALTER TABLE `typecho_relationships` DISABLE KEYS */;
INSERT INTO `typecho_relationships` VALUES (4,1),(5,1),(8,1);
/*!40000 ALTER TABLE `typecho_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typecho_users`
--

DROP TABLE IF EXISTS `typecho_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typecho_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `mail` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `screenName` varchar(32) DEFAULT NULL,
  `created` int(10) unsigned DEFAULT '0',
  `activated` int(10) unsigned DEFAULT '0',
  `logged` int(10) unsigned DEFAULT '0',
  `group` varchar(16) DEFAULT 'visitor',
  `authCode` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typecho_users`
--

LOCK TABLES `typecho_users` WRITE;
/*!40000 ALTER TABLE `typecho_users` DISABLE KEYS */;
INSERT INTO `typecho_users` VALUES (1,'admin','$P$BWm/VWYtsgEaJECXDKlSBhKEI673Px.','llfcjyy@outlook.com','http://www.typecho.org','admin',1553479513,1554689503,1554274853,'administrator','58a735cf5268268722752291cd92368a');
/*!40000 ALTER TABLE `typecho_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-08 10:43:02
