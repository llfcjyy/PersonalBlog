-- MySQL dump 10.17  Distrib 10.3.13-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: typecho
-- ------------------------------------------------------
-- Server version	10.3.13-MariaDB

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
  `cid` int(10) unsigned DEFAULT 0,
  `created` int(10) unsigned DEFAULT 0,
  `author` varchar(200) DEFAULT NULL,
  `authorId` int(10) unsigned DEFAULT 0,
  `ownerId` int(10) unsigned DEFAULT 0,
  `mail` varchar(200) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `agent` varchar(511) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `type` varchar(16) DEFAULT 'comment',
  `status` varchar(16) DEFAULT 'approved',
  `parent` int(10) unsigned DEFAULT 0,
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
  `created` int(10) unsigned DEFAULT 0,
  `modified` int(10) unsigned DEFAULT 0,
  `text` longtext DEFAULT NULL,
  `order` int(10) unsigned DEFAULT 0,
  `authorId` int(10) unsigned DEFAULT 0,
  `template` varchar(32) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'post',
  `status` varchar(16) DEFAULT 'publish',
  `password` varchar(32) DEFAULT NULL,
  `commentsNum` int(10) unsigned DEFAULT 0,
  `allowComment` char(1) DEFAULT '0',
  `allowPing` char(1) DEFAULT '0',
  `allowFeed` char(1) DEFAULT '0',
  `parent` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `slug` (`slug`),
  KEY `created` (`created`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typecho_contents`
--

LOCK TABLES `typecho_contents` WRITE;
/*!40000 ALTER TABLE `typecho_contents` DISABLE KEYS */;
INSERT INTO `typecho_contents` VALUES (3,'1796578910.jpeg','1796578910-jpeg',1553481552,1553481552,'a:5:{s:4:\"name\";s:15:\"1796578910.jpeg\";s:4:\"path\";s:36:\"/usr/uploads/2019/03/2311125299.jpeg\";s:4:\"size\";i:144007;s:4:\"type\";s:4:\"jpeg\";s:4:\"mime\";s:10:\"image/jpeg\";}',1,1,NULL,'attachment','publish',NULL,0,'1','0','1',4),(2,'关于','start-page',1553479513,1553479513,'<!--markdown-->本页面由 Typecho 创建, 这只是个测试页面.',0,1,NULL,'page','publish',NULL,0,'1','1','1',0),(4,'mariadb安装与配置','4',1553481540,1555579781,'<!--markdown-->## 安装\r\n\r\n同时安装mariadb服务器和客户端（mycli也支持mariadb）\r\n\r\n      #sudo pacman -S mariadb mycli\r\n\r\n## 配置\r\n\r\n先初始化\r\n\r\n      #sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql\r\n允许开机启动和启动mariadb\r\n\r\n      #sudo systemctl enable mariadb\r\n      #sudo systemctl start mariadb\r\n\r\n配置root账户，一路回车和按提示输入密码\r\n\r\n      #mysql_secure_installation\r\n\r\n\r\n使用root账户登录\r\n\r\n      #mysql -u root -p\r\n\r\n创建新用户和授予全部权限并更新用户授权\r\n\r\n      >create user \'yi\'@\'localhost\' identified by \'1\';\r\n      >grant all privileges on *.* to yi@localhost identified by \'1\';\r\n      >flush privileges;\r\n\r\n## 常用命令\r\n\r\n修改密码\r\n\r\n      >set password for \'yi\'@\'localhost\'=Password(\'1\');\r\n\r\n创建数据库\r\n\r\n      >create database demo;\r\n\r\n显示所用数据库和表格（先选中数据库）\r\n\r\n      >show databases;\r\n      >use demo;\r\n      >show tables;\r\n\r\n显示数据库表结构\r\n\r\n      >describe demo;\r\n\r\n删除表格和数据库\r\n\r\n      >drop database demo;\r\n      >drop table table1;\r\n\r\n备份和还原\r\n\r\n      #mysqldump -uyi -p\'1\' -B typecho > typecho_bak.sql\r\n      #mysql -uyi -p\'1\' < typecho_bak.sql\r\n',0,1,NULL,'post','publish',NULL,0,'1','1','1',0),(5,'debian9配置nginx建立typecho个人博客','5',1553594220,1555579752,'<!--markdown-->## 配置数据库\r\n\r\n安装MySQL或mariadb，建立typecho的专用账户和数据库\r\n例如创建yi用户和新建typecho数据库\r\n\r\n    # mysql -u root -p //使用root账户登录mysql\r\n    > grant all privileges on *.* to yi@localhost identified by \'1\'; //创建yi用户并授予全部权限\r\n    > create database typecho; //创建数据库typecho\r\n\r\n## 配置php\r\n\r\ntypecho要php环境来支持，安装php，修改php.ini开启mysql支持\r\n\r\n    # sudo apt install php php-mysql\r\n    # sudo vim /etc/php/7.0/fpm/php.ini\r\n\r\n启动php-fpm\r\n\r\n    # sudo php-fpm7.0\r\n    # sudo mkdir /run/php //如果提示找不到目录就执行此句\r\n\r\n## 配置nginx\r\n\r\n安装nginx，修改nginx用户组，开启php支持\r\n\r\n    # sudo apt install nginx\r\n    # sudo vim /etc/nginx/nginx.conf\r\n    # sudo vim /etc/nginx/sites-available/default\r\n\r\n把typecho放到nginx的web目录下面\r\n\r\n    # sudo cp * /var/www/html\r\n\r\n启动nginx服务\r\n\r\n    # sudo service nginx start\r\n',0,1,NULL,'post','publish',NULL,0,'1','1','1',0),(12,'3262146100.jpg','3262146100-jpg',1554802181,1554802181,'a:5:{s:4:\"name\";s:14:\"3262146100.jpg\";s:4:\"path\";s:35:\"/usr/uploads/2019/04/1694403381.jpg\";s:4:\"size\";i:16720;s:4:\"type\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";}',2,1,NULL,'attachment','publish',NULL,0,'1','0','1',8),(8,'Visual Studio 禁止自动生成 *.VC.db和*.ipch 文件','8',1554689460,1554802189,'<!--markdown-->设置方法：工具–》选项–》文本编辑器–》C/C++–》高级，把回退位置和警告设置为true或者禁用数据库设为true，这样就不会产生那个文件了。\r\n![3262146100.jpg][1]\r\n\r\n\r\n  [1]: http://127.0.0.1/usr/uploads/2019/04/1694403381.jpg',0,1,NULL,'post','publish',NULL,0,'1','1','1',0),(11,'timg.jpg','timg-jpg',1554692482,1554692482,'a:5:{s:4:\"name\";s:8:\"timg.jpg\";s:4:\"path\";s:32:\"/usr/uploads/2019/04/8699984.jpg\";s:4:\"size\";i:108053;s:4:\"type\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";}',1,1,NULL,'attachment','publish',NULL,0,'1','0','1',8),(13,'makefile函数','13',1554803700,1555579719,'<!--markdown-->## 字符操作函数使用\r\n在Makefile中可以使用函数来处理变量，从而让我们的命令或是规则更为的灵活和具有智能。make所支持的函数也不算很多，不过已经足够我们的操作了。函数调用后，函数的返回值可以当做变量来使用。\r\n函数调用，很像变量的使用，也是以“$”来标识的，其语法如下：\r\n$(\\<function\\> \\<arguments\\> )\r\n或是\r\n${\\<function\\> \\<arguments\\>}\r\n这里，\\<function\\>就是函数名，make支持的函数不多。\\<arguments\\>是函数的参数，参数间以逗号“,”分隔，而函数名和参数之间以“空格”分隔。函数调用以“$”开头，以圆括号或花括号把函数名和参数括起。例如字符替换函数。\r\n\r\n## 字符串替换函数\r\n$(subst \\<from\\>,\\<to\\>,\\<text\\> )\r\n名称：字符串替换函数——subst。\r\n功能：把字串\\<text\\>中的\\<from\\>字符串替换成\\<to\\>。\r\n返回：函数返回被替换过后的字符串。\r\n\r\nMakefile 内容\r\n\r\n    all:\r\n    \r\n        @echo $(subst t,e,maktfilt)  <-- 将t替换为e\r\n\r\nbash 中执行 make\r\n\r\n$ make\r\n\r\nmakefile\r\n\r\n## 模式字符串替换函数\r\n$(patsubst \\<pattern\\>,\\<replacement\\>,\\<text\\> )\r\n\r\n名称：模式字符串替换函数——patsubst。\r\n功能：以通配符的形式替换字符，查找\\<text\\>中的单词（单词以“空格”、“Tab”或“回车”“换行”分隔）是否符合模式\\<pattern\\>，如果匹配的话，则以\\<replacement\\>替换。这里，\\<pattern\\>可以包括通配符“%”，表示任意长度的字串。如果\\<replacement\\>中也包含“%”，那么，\\<replacement\\>中的这个“%”将是\\<pattern\\>中的那个“%”所代表的字串。（可以用“\\”来转义，以“\\%”来表示真实含义的“%”字符）返回：函数返回被替换过后的字符串。\r\n示例：\r\n$(patsubst %.c,%.o,x.c.c bar.c)\r\n把字串“x.c.c bar.c”符合模式[%.c]的单词替换成[%.o]，返回结果是“x.c.o bar.o”\r\n\r\n\r\nMakefile 内容\r\n\r\n    all:\r\n    \r\n        @echo $(patsubst %.c,%.o,programA.c programB.c)\r\n\r\nbash 中执行 make\r\n\r\n$ make\r\n\r\nprogramA.o programB.o\r\n\r\n## 去首尾空格函数\r\n名称：去空格函数——strip。\r\n功能：去掉\\<string\\>字串中开头和结尾的空字符。\r\n返回：返回被去掉空格的字符串值。\r\n示例：\r\n$(strip a b c )\r\n把字串“a b c ”去到开头和结尾的空格，结果是“a b c”。\r\n\r\nMakefile 内容\r\n\r\n    VAL := \"       aa  bb  cc \"\r\n    \r\n    all:\r\n    \r\n        @echo \"去除空格前: \" $(VAL)\r\n    \r\n        @echo \"去除空格后: \" $(strip $(VAL))\r\n\r\nbash 中执行 make\r\n\r\n$ make\r\n\r\n    去除空格前:         aa  bb  cc\r\n    \r\n    去除空格后:   aa bb cc\r\n\r\n## 查找字符串函数\r\n$(findstring \\<find\\>,\\<in\\> )\r\n\r\n名称：查找字符串函数——findstring。\r\n功能：在字串\\<in\\>中查找\\<find\\>字串。\r\n返回：如果找到，那么返回找到的字符串，否则返回空字符串。\r\n示例：\r\n$(findstring a,a b c)\r\n$(findstring a,b c)\r\n第一个函数返回“a”字符串，第二个返回“”字符串（空字符串）\r\n\r\nMakefile 内容\r\n\r\n    VAL := \"       aa  bb  cc \"\r\n    \r\n    all:\r\n    \r\n        @echo $(findstring aa,$(VAL))\r\n    \r\n        @echo $(findstring ab,$(VAL))\r\n\r\n\r\nbash 中执行 make\r\n\r\n$ make\r\n\r\naa\r\n\r\n## 过滤函数\r\n$(filter \\<pattern...\\>,\\<text\\> )\r\n名称：过滤函数——filter。\r\n功能：以\\<pattern\\>模式过滤\\<text\\>字符串中的单词，保留符合模式\\<pattern\\>的单词。可以有多个模式。\r\n返回：返回符合模式\\<pattern\\>的字串。\r\n示例：\r\nsources := foo.c bar.c baz.s ugh.h\r\nfoo: $(sources)\r\ncc $(filter %.c %.s,$(sources)) -o foo\r\n$(filter %.c %.s,$(sources))返回的值是“foo.c bar.c baz.s”。\r\n$(filter-out \\<pattern...\\>,\\<text\\> )\r\n\r\nMakefile 内容\r\n\r\n    all:\r\n    \r\n        @echo $(filter %.o %.a,program.c program.o program.a)\r\n\r\n \r\nbash 中执行 make\r\n\r\n$ make\r\n\r\nprogram.o program.a\r\n\r\n## 反过滤函数\r\n名称：反过滤函数——filter-out。\r\n\r\n功能：以\\<pattern\\>模式过滤\\<text\\>字符串中的单词，去除符合模式\\<pattern\\>的单词。可\r\n以有多个模式。\r\n返回：返回不符合模式\\<pattern\\>的字串。\r\n示例：\r\nobjects=main1.o foo.o main2.o bar.o\r\nmains=main1.o main2.o\r\n$(filter-out $(mains),$(objects)) 返回值是“foo.o bar.o”。\r\n\r\nMakefile 内容\r\n\r\n    all:\r\n    \r\n        @echo $(filter-out %.o %.a,program.c program.o program.a)\r\n\r\nbash 中执行 make\r\n\r\n$ make\r\n\r\nprogram.c\r\n\r\n## 排序函数\r\n名称：排序函数——sort。\r\n功能：给字符串\\<list\\>中的单词排序（升序）。\r\n返回：返回排序后的字符串。\r\n示例：$(sort foo bar lose)返回“bar foo lose” 。\r\n备注：sort函数会去掉\\<list\\>中相同的单词。\r\n$(word \\<n\\>,\\<text\\> )\r\n\r\nMakefile 内容\r\n\r\n    all:\r\n    \r\n        @echo $(sort bac abc acb cab)\r\n\r\nbash 中执行 make\r\n\r\n$ make\r\n\r\nabc acb bac cab\r\n\r\n## 取单词函数\r\n名称：取单词函数——word。\r\n功能：取字符串\\<text\\>中第\\<n\\>个单词。空格隔开（从一开始）\r\n返回：返回字符串\\<text\\>中第\\<n\\>个单词。如果\\<n\\>比\\<text\\>中的单词数要大，那么返回空\r\n字符串。\r\n示例：$(word 2, foo bar baz)返回值是“bar”。\r\n$(wordlist \\<s\\>,\\<e\\>,\\<text\\> )\r\n\r\nMakefile 内容\r\n\r\n    all:\r\n    \r\n        @echo $(word 1,aa bb cc dd)\r\n    \r\n        @echo $(word 5,aa bb cc dd)\r\n    \r\n        @echo $(word 4,aa bb cc dd)\r\n\r\nbash 中执行 make\r\n\r\n$ make\r\n\r\naa\r\n\r\ndd\r\n\r\n取单词串函数wordlist\r\n名称：取单词串函数——wordlist。\r\n功能：从字符串\\<text\\>中取从\\<s\\>开始到\\<e\\>的单词串。\\<s\\>和\\<e\\>是一个数字。\r\n返回：返回字符串\\<text\\>中从\\<s\\>到\\<e\\>的单词字串。如果\\<s\\>比\\<text\\>中的单词数要大，那\r\n么返回空字符串。如果\\<e\\>大于\\<text\\>的单词数，那么返回从\\<s\\>开始，到\\<text\\>结束的单\r\n词串。\r\n示例： $(wordlist 2, 3, foo bar baz)返回值是“bar baz”。\r\n\r\nMakefile 内容\r\n\r\n    all:\r\n    \r\n        @echo $(wordlist 1,3,aa bb cc dd)\r\n    \r\n        @echo $(word 5,6,aa bb cc dd)\r\n    \r\n        @echo $(word 2,5,aa bb cc dd)\r\n\r\n \r\nbash 中执行 make\r\n\r\n$ make\r\n\r\naa bb cc\r\n\r\nbb\r\n\r\n## 单词个数统计函数words\r\n$(words \\<text\\> )\r\n名称：单词个数统计函数——words。\r\n功能：统计\\<text\\>中字符串中的单词个数。\r\n返回：返回\\<text\\>中的单词数。\r\n示例：$(words, foo bar baz)返回值是“3”。\r\n备注：如果我们要取\\<text\\>中最后的一个单词，我们可以这样：$(word $(words \\<text\\> \r\n),\\<text\\> )。\r\n\r\nMakefile 内容\r\n\r\n    all:\r\n    \r\n        @echo $(words aa bb cc dd)\r\n    \r\n        @echo $(words aabbccdd)\r\n    \r\n        @echo $(words )\r\n\r\nbash 中执行 make\r\n\r\n$ make\r\n\r\n4\r\n\r\n1\r\n\r\n0\r\n\r\n## 首单词函数firstword\r\n$(firstword \\<text\\> )\r\n名称：首单词函数——firstword。\r\n功能：取字符串\\<text\\>中的第一个单词。\r\n返回：返回字符串\\<text\\>的第一个单词。\r\n示例：$(firstword foo bar)返回值是“foo”。\r\n备注：这个函数可以用word函数来实现：$(word 1,\\<text\\> )。\r\n\r\n## 小结\r\n以上，是所有的字符串操作函数，如果搭配混合使用，可以完成比较复杂的功能。这里，举一个现实中应用的例子。我们知道，make使用“VPATH”变量来指定“依赖文件”的搜索路径。于是，我们可以利用这个搜索路径来指定编译器对头文件的搜索路径参数CFLAGS，\r\n如将头文件路径的前面加上-I表示包含路径：\r\noverride CFLAGS += $(patsubst %,-I%,$(subst :, ,$(VPATH)))\r\n如果我们的“$(VPATH)”值是“src:../headers”，VPATH之间用分号{:}隔开，$(subst :, ,$(VPATH)) 先将路径中的分号替换为空格src ../headers，然后模式替换函数$(patsubst %,-I%,)在每个路径前面加上-I，表示包含文件路径，生成 “-Isrc -I../headers”，这正是cc或gcc搜索头文件路径的参数。',0,1,NULL,'post','publish',NULL,0,'1','1','1',0),(14,'gcc安装与基本用法','14',1554890100,1555579473,'<!--markdown-->## 安装\r\nLinux系统下可以直接使用包管理器(apt,yum,pacman等)搜索gcc并安装\r\n\r\n    $ sudo apt install gcc\r\n    $ sudo pacman -S gcc\r\n    $ sudo yum install gcc\r\n\r\n## 查看帮助\r\n使用gcc --help可以查看简单的帮助说明，部分gcc帮助：\r\n\r\n    $ gcc --help\r\n    用法：gcc [选项] 文件...\r\n    选项：\r\n      -specs=<文件>            用 <文件> 的内容覆盖内建的 specs 文件。\r\n      -std=<标准>              假定输入源文件遵循给定的标准。\r\n      --sysroot=<目录>         将 <目录> 作为头文件和库文件的根目录。\r\n      -B <目录>                将 <目录> 添加到编译器的搜索路径中。\r\n      -v                      显示编译器调用的程序。\r\n      -E                      仅作预处理，不进行编译、汇编或链接。\r\n      -S                      编译到汇编语言，不进行汇编和链接，\r\n      -c                      编译、汇编到目标代码，不进行链接。\r\n      -o <文件>                输出到 <文件>。\r\n      -shared                 生成一个共享库。\r\n      -w                      禁止所有警告信息.\r\n      -Wall                   开启所有警告信息\r\n\r\n## 编译程序\r\ngcc是c语言编译器，编译出一个可执行程序需要四步：\r\n\r\n 1. 预处理(preprocessing)，预处理后的代码送往标准输出，可以使用-o选项输出到指定文件\r\n 2. 编译(compilation)，生成汇编语言文件，在当前目录下生成同名的.s文件\r\n 3. 汇编(assembly)，输出对应于源文件的目标文件，在当前目录下生成同名的.o文件\r\n 4. 连接(linking).把多个目标文件连接成一个可执行程序，在当前目录下生成a.out文件\r\n\r\n注意：.c文件到可执行程序bin的流程，**.c** -->**.s** -->**.o** -->**bin**，可以使用-o定义输出文件位置\r\n\r\n    分步编译程序\r\n    $ gcc -E hello.c -o hello.i\r\n    $ gcc -S hello.i -o hello.s\r\n    $ gcc -c hello.s -o hello.o\r\n    $ gcc hello.o -o hello\r\n\r\n    直接编译程序\r\n    $ gcc hello.c -o hello \r\n\r\n如果有很多文件，一般情况下是先编译为目标文件，再连接为可执行程序\r\n\r\n    $ gcc -c hello.c a.c b.c\r\n    $ gcc hello.o a.o b.o -o hello\r\n\r\n## 生成静态库\r\n实际上是一些.o文件通过ar打包而成的\r\n - 生成test.o目标文件\r\n - 使用ar将test.o打包成libtest.a静态库\r\n\r\n\r\n    $ gcc -c test.c -o test.o\r\n    $ ar rcs -o libtest.a test.o\r\n    \r\n - **创建动态库**\r\n\r\n - 使用参数-fPIC参数生成test.o目标文件，该参数用于生成位置无关代码\r\n - 使用-shared参数生成动态库\r\n\r\n\r\n    //分步生成\r\n    $ gcc -c -fPIC -o test.o test.c\r\n    $ gcc -shared -o libmyshare.so test.o\r\n    \r\n    //一步生成\r\n    $ gcc -shared -fPIC -o libmyshare.so test.c\r\n\r\n## 连接静态库或者动态库\r\n\r\n两种库连接方式一致，使用-lLIBRARY 指定要连接的库，使用-LDIRECTORY 指定库的路径,另外可以把库文件视为目标文件一起编译程序\r\n\r\n    $ gcc hello.c -L. -ltest -o hello\r\n    $ gcc hello.c libtest.so -o hello\r\n\r\n## 需要注意的问题\r\n\r\n 1. 如果指定的库目录下存在同名的动态库与静态库，默认使用动态库，增加选项-static可以使用静态库。\r\n 2. 静态库要放到源文件后面声明，不然连接会出错，提示找不到（undefined reference to \"xxx\"）。\r\n 3. 使用ldd <文件> 可以查看程序运行依赖的动态库。\r\n 4. 执行含有动态库编译而成的程序需要加载动态库，有三个办法：把动态库所在的路径加入到环境变量LD_LIBRARY_PATH；拷贝或者创建软连接到系统的库目录/usr/lib/(不推荐)；在/etc/ld.so.conf.d/下新建一个文件把动态库路径写进去。\r\n\r\n\r\n    //强制连接静态库\r\n    $ gcc -static hello.c -L. -ltest -o hello\r\n    //错误的静态库引用（放到源文件前面）\r\n    $ gcc -static -L. -ltest hello.c -o hello\r\n    //查看程序依赖的动态库\r\n    $ ldd hello\r\n    //修改LD_LIBRARY_PATH环境变量,绝对路径\r\n    $ export LD_LIBRARY_PATH=\"/home/yi/foobar\"\r\n    //使/etc/ld.so.conf.d/配置的动态库路径生效\r\n    $ sudo ldconfig -v',0,1,NULL,'post','publish',NULL,0,'1','1','1',0),(15,'vue条件渲染和列表渲染','15',1555406160,1555579407,'<!--markdown-->## 条件渲染\r\nv-if 指令用于条件性地渲染一块内容。这块内容只会在指令的表达式返回 truthy 值的时候被渲染。\r\n\r\n    <h1 v-if=\"awesome\">Vue is awesome!</h1>\r\n\r\n因为 v-if 是一个指令，所以必须将它添加到一个元素上。但是如果想切换多个元素呢？此时可以把一个 \\<template\\> 元素当做不可见的包裹元素，并在上面使用 v-if。最终的渲染结果将不包含 \\<template\\> 元素。\r\n\r\n    <template v-if=\"ok\">\r\n      <h1>Title</h1>\r\n      <p>Paragraph 1</p>\r\n      <p>Paragraph 2</p>\r\n    </template>\r\n\r\n你可以使用 v-else 指令来表示 v-if 的“else 块”：v-else 元素必须紧跟在带 v-if 或者 v-else-if 的元素的后面，否则它将不会被识别。\r\n\r\n    <div v-if=\"Math.random() > 0.5\">\r\n      Now you see me\r\n    </div>\r\n    <div v-else>\r\n      Now you don\'t\r\n    </div>\r\n\r\n**注意：**\r\nVue 会尽可能高效地渲染元素，通常会复用已有元素而不是从头开始渲染。这么做除了使 Vue 变得非常快之外，还有其它一些好处。例如，如果你允许用户在不同的登录方式之间切换：\r\n\r\n    <template v-if=\"loginType === \'username\'\">\r\n      <label>Username</label>\r\n      <input placeholder=\"Enter your username\">\r\n    </template>\r\n    <template v-else>\r\n      <label>Email</label>\r\n      <input placeholder=\"Enter your email address\">\r\n    </template>\r\n\r\n那么在上面的代码中切换 loginType 将不会清除用户已经输入的内容。因为两个模板使用了相同的元素，\\<input\\> 不会被替换掉——仅仅是替换了它的 placeholder,如果想要阻止这种行为，只需添加一个具有唯一值的 key 属性即可。\r\n\r\n    <input placeholder=\"Enter your username\" key=\"username-input\">\r\n\r\n另一个用于根据条件展示元素的选项是 v-show 指令。用法大致一样：\r\n\r\n    <h1 v-show=\"ok\">Hello!</h1>\r\n\r\n不同的是带有 v-show 的元素始终会被渲染并保留在 DOM 中。v-show 只是简单地切换元素的 CSS 属性 display。\r\n**注意**\r\nv-show 不支持 \\<template\\> 元素，也不支持v-else\r\n\r\nv-if 有更高的切换开销，而 v-show 有更高的初始渲染开销。因此，如果需要非常频繁地切换，则使用 v-show 较好；如果在运行时条件很少改变，则使用 v-if 较好。\r\n\r\n## 列表渲染\r\n\r\n我们用 v-for 指令根据一组数组的选项列表进行渲染。v-for 指令需要使用 item in items 形式的特殊语法，items 是源数据数组并且 item 是数组元素迭代的别名。\r\n\r\n    <ul id=\"example-1\">\r\n      <li v-for=\"item in items\">\r\n        {{ item.message }}\r\n      </li>\r\n    </ul>\r\n\r\n    data: {\r\n      items: [\r\n        { message: \'Foo\' },\r\n        { message: \'Bar\' }\r\n      ]\r\n    }\r\n\r\n结果：\r\n\r\n    Foo\r\n    Bar\r\n\r\n你也可以用 v-for 通过一个对象的属性来迭代。你也可以提供第二个的参数为键名,第三个参数为索引：\r\n\r\n    <div v-for=\"(value, key, index) in object\">\r\n      {{ index }}. {{ key }}: {{ value }}\r\n    </div>\r\n    \r\n    data: {\r\n      object: {\r\n        firstName: \'John\',\r\n        lastName: \'Doe\',\r\n        age: 30\r\n      }\r\n    }\r\n\r\nv-for 也可以取整数。在这种情况下，它将重复多次模板。\r\n\r\n    <div>\r\n      <span v-for=\"n in 5\">{{ n }} </span>\r\n    </div>\r\n\r\n结果：\r\n\r\n    1 2 3 4 5\r\n\r\n类似于 v-if，你也可以利用带有 v-for 的 \\<template\\> 渲染多个元素。比如：\r\n\r\n    <ul>\r\n      <template v-for=\"item in items\">\r\n        <li>{{ item.msg }}</li>\r\n        <li class=\"divider\" role=\"presentation\"></li>\r\n      </template>\r\n    </ul>\r\n\r\n\r\n**注意：**\r\n由于 JavaScript 的限制，Vue 不能检测以下变动的数组：\r\n**当你利用索引直接设置一个项时，例如：vm.items[indexOfItem] = newValue**\r\n**当你修改数组的长度时，例如：vm.items.length = newLength**\r\n\r\n    var vm = new Vue({\r\n      data: {\r\n        items: [\'a\', \'b\', \'c\']\r\n      }\r\n    })\r\n    vm.items[1] = \'x\' // 不是响应性的\r\n    vm.items.length = 2 // 不是响应性的\r\n\r\n为了解决第一类问题，以下两种方式都可以实现和 vm.items[indexOfItem] = newValue 相同的效果，同时也将触发状态更新：\r\n\r\n    // Vue.set\r\n    Vue.set(vm.items, indexOfItem, newValue)\r\n    // Array.prototype.splice\r\n    vm.items.splice(indexOfItem, 1, newValue)\r\n    //你也可以使用 vm.$set 实例方法，该方法是全局方法 Vue.set 的一个别名：\r\n    \r\n    vm.$set(vm.items, indexOfItem, newValue)\r\n\r\n为了解决第二类问题，你可以使用 splice：\r\n\r\n    vm.items.splice(newLength)',0,1,NULL,'post','publish',NULL,0,'1','1','1',0),(16,'RAFT算法简述','16',1555576620,1555578488,'<!--markdown-->## 什么是RAFT算法\r\n\r\n一致性（共识）算法用于解决分布式环境下多副本之间数据一致性的问题。RAFT正是通过管理`复制日志`的方式来达成一致的共识算法。Raft阶段分为两个，首先是`选举`过程，然后是`日志（一个状态机指令或者是节点配置变更）同步`过程，即追随者在选举出来的领导人带领下进行日志复制操作。\r\n\r\n## 如何达成一致\r\n\r\n所有一致性算法都会涉及到`状态机`，而状态机保证系统从一个一致的状态开始，以相同的顺序执行一些列指令最终会达到另一个一致的状态。所有的节点以相同的顺序处理日志，那么最终状态机在多个节点中都是一致的。\r\n\r\n## 节点角色\r\n\r\n在Raft中，任何时候一个服务器可以扮演下面角色之一，且同一时刻只能是一种：  \r\n**Leader**领导者: 处理所有客户端交互，负责日志同步，一个时刻只有一个Leader。  \r\n**Follower**追随者: 类似选民，完全被动，听从leader的，与leader保持同步。  \r\n**Candidate**候选人: 可以被选为一个新的领导人，这是一个中间态，不可长期存在。\r\n\r\n## 任期\r\n\r\nRaft把时间切割为任意长度的任期，每个任期都有一个任期号，采用连续的整数。每个任期都由一次选举开始，若选举失败则这个任期内没有Leader；如果选举出了Leader则这个任期内有Leader负责集群状态管理。\r\n\r\n## 选举过程\r\n\r\nraft初始状态时所有节点都处于Follower状态，并且随机睡眠一段时间。最先醒来的节点进入Candidate状态，向其它所有节点发出投票请求。当其它节点收到投票请求后，如果同意（请求节点的任期日志比自己的新）将自己仅有的一票投给请求节点。当节点收到超过半数节点的投票后，就进入Leader状态，成为系统中仅有的Leader。raft系统中只有Leader才有权利接收并处理client请求，并向其它节点发出同步请求。\r\n\r\n## 日志复制过程  \r\nLeader选举出来后，就可以开始处理客户端请求。Leader收到客户端请求后，将请求内容作为一条日志添加到自己的日志记录中，并向其它节点发送添加日志请求。其它节点收到请求后，判断该请求满足接收条件，如果满足条件就将其添加到本地的日志中，并给Leader发送添加成功的回复。Leader在收到大多数节点添加成功的回复后，就将该条日志正式提交。提交后的日志日志就意味着已经被raft系统接受，并能应用到状态机中了。\r\n\r\n## 节点状态\r\n\r\n1. currentTerm：节点当前任期，初始为0，递增\r\n1. votedFor：在当前获得选票的候选人的 Id\r\n1. log[]：日志条目集；每一个条目包含一个用户状态机执行的指令，和收到时的任期号\r\n1. commitIndex：最大的已经被commit的日志的index\r\n1. appliedIndex：最大的已经被应用到状态机的index\r\n\r\n## 节点响应规则\r\n\r\n所有节点\r\n * 如果commitIndex > appliedIndex，应用log[appliedIndex]到状态机，增加appliedIndex\r\n * 如果请求或者响应包含的任期T > currentTerm，将currentTerm设置为T并转换为Follower\r\n\r\nFollowers\r\n * 响应来自Leader和Candidate的请求\r\n * 如果在选举超时周期内没有收到添加日志的请求或者给Candidate投票，转换为Candidate角色\r\n\r\nCandidates\r\n * 转换为candidate角色，开始选举：\r\n * 递增currentTerm\r\n\r\n  * 给自己投票\r\n  * 重置选举时间\r\n  * 发送投票请求给其他所有节点\r\n\r\n * 如果收到了大多数节点的选票，转换为Leader节点\r\n * 如果收到Leader节点的添加日志请求，转换为Follower节点\r\n * 如果选举超时，重新开始新一轮的选举\r\n\r\nLeaders\r\n * 一旦选举完成：发送心跳给所有节点；在空闲的周期内不断发送心跳保持Leader身份和阻止跟随者超时，\r\n * 如果收到客户端的请求，将日志追加到本地日志中，在日志被应用到状态机后响应给客户端\r\n\r\n## 异常情况\r\n1. leader节点挂了：每一个追随者节点都有一个随机时间的超时任务：转变状态至候选者，在收到leader心跳时会重置，如果leader挂了，将在超时时间之内收不到心跳，超时转化为候选者发起重新选举过程。  \r\n1. 两个节点同时发起投票请求，由于在一次选举过程中，一个节点一个任期只能投一票，这就保证了两个节点不可能同时得到大多数（一半以上）的投票。如果A和B可能刚好都得到一半的投票，两者都成为不了Leader。这时A和B继续保持Candidate状态，并且随机睡眠一段时间，等待进入到下一个选举周期。由于所有节点都是随机选择睡眠时间，所以连续出现多个节点竞选的概率很低。  \r\n1. 向raft系统中添加新机器时，由于配置信息不可能在各个节点上同时达到同步状态，总会有某些节点先得到新机器的信息，有些节点后得到新机器的信息。解决办法是将添加机器这个动作当成一个提议，当leader提交这个提议后新的配置生效。\r\n\r\n## 优势与局限\r\n* 优势：在达成一致的过程中，避免所有节点争抢提议权，直接由leader节点负责提议，大大加快了共识的速度；整个集群由leader节点作为代表，对外处理客户端的提议，对内管理不同节点的日志一致，模型简单可靠，节点通信效率高（一对多）。\r\n* 局限性：raft算法假设每个节点都是忠诚的、节点间的信道是安全的，如果存在作恶节点（即使只有一个）或者信道不安全则整个集群就完全失效。',0,1,NULL,'post','publish',NULL,0,'1','1','1',0),(17,'RAFT算法需求分析','17',1555662360,1555667978,'<!--markdown-->## 1. 引言\r\n\r\n### 1.1 编写目的\r\n实现RAFT共识算法，提高集群的协作能力和效率。为算法的设计、实现、测试提供重要依据。本文档可供开发人员、测试人员、用户阅读和参考。\r\n\r\n### 1.2 背景\r\n1982年，Lamport首次发表了关于拜占庭将军问题解决方案的论文，后来获得了计算机界的最高奖：图灵奖。\r\n1999年，Jakobsson发表了关于PoW的论文。\r\n2008年，中本聪发表了比特币的论文，并用了PoW作为共识机制。\r\n2012年，PeerCoin项目开始采用PoS作为共识机制。\r\n2016年，Tendermint项目开始采用PBFT作为公示机制。\r\n2018年，以太坊项目提出在2.0版本中，通过Casper方法采用PoS作为共识机制。\r\n共识算法作为一个集群中沟通与协调的工具，性能和安全等对集群的影响较大，raft算法是共识算法中一个较为高效的算法实现，对于提升集群的效率有着非凡意义\r\n**项目名称：**RAFT算法\r\n**项目开发者：**文浪\r\n\r\n### 1.3 定义\r\n* RAFT:共识算法raft\r\n* Follower：追随者，集群成员默认身份\r\n* Candidate：候选者，集群没有领导者\r\n* Leader:领导者，Candidate选举成功\r\n\r\n\r\n## 2. 任务概述\r\n\r\n### **2.1 目标**\r\n解决集群中就某一指令（提议）达成一致的问题，实现稳定可靠的RAFT算法\r\n\r\n### **2.2 用户特点**\r\n本算法为集群共识而设计，集群成员（计算机）即为用户，要求性能强大、能够互相通信、存在唯一成员标识\r\n\r\n### **2.3 假定和约束**\r\n**节点要求：**\r\n  * 信道安全\r\n  * 节点忠诚\r\n**约束**\r\n  * 集群成员可以宕机，但要保证超过半数可以正常工作\r\n  * 领导者是整个集群的枢纽，对集群的性能起决定性作用\r\n\r\n\r\n## 3. 需求规定\r\n\r\n### **3.1 对功能的规定**\r\n* 共识提议：领导者共识提议，以前的共识没有完成也可以继续提出提议，一旦共识完成对所有成员发出通知\r\n* 成员变更：成员变更（添加和移除）可视为特殊的提议，也需要共识。\r\n* 选取领导者：节点一旦成为主节点，对所有成员发出通知\r\n\r\n### **3.2 性能需求**\r\n\r\n#### **3.2.1 精度**\r\n数据要求必须完整、精确、可靠、真实。\r\n\r\n#### **3.2.2 时间特性要求**\r\n在通信良好的情况下：在30秒以内选出领导者，实时处理提议，结果可以延时返回，成员变更1分钟内完成；\r\n在通信较差的情况下可以适当增加时间\r\n\r\n#### **3.2.3 灵活性**\r\nRAFT算法在每个成员都有一份持久化的日志（提议）和自己的标识，可更新成员的运行环境，只要这些数据不变\r\n\r\n### **3.3 输入输出要求**\r\n\r\n### **3.4 数据管理能力要求**\r\n\r\n### **3.5 故障处理要求**\r\n节点宕机之后，可使用本地的数据或者同步其他节点的数据进行恢复\r\n\r\n### **3.6 其他专门需求**\r\n\r\n\r\n## 4. 运行环境规定\r\n\r\n### **4.1 设备**\r\n计算机性能有较高要求，越快越好。\r\n\r\n### **4.2 支持软件**\r\n开发工具：goland\r\n编程语言：go\r\n操作系统：Linux最佳，windows也可\r\n\r\n### **4.3 接口**\r\n\r\n### **4.3 控制**',0,1,NULL,'post','publish',NULL,0,'1','1','1',0),(18,'软件生命周期和文档','18',1555665600,1555667107,'<!--markdown--># 软件生命周期\r\n软件生命周期是软件的产生直到报废的整个过程，一般来说，整个生命周期包括**计划**（定义）、**开发**、**运行**（维护）三个时期，每一个时期又划分为若干阶段，一般包括以下各阶段：\r\n* **软件计划与可行性研究**：此阶段是软件开发方与需求方共同讨论，主要确定软件的开发目标及其可行性。文档：**可行性分析报告**（一般很少需要）和**立项文档**。\r\n\r\n* **需求分析**：在确定软件开发可行的情况下，对软件需要实现的各个功能进行详细分析。文档：**软件需求说明**。\r\n\r\n* **软件设计**：此阶段主要根据需求分析的结果，对整个软件系统进行设计，如系统框架设计，数据库设计等等，包括总体设计和详细设计。文档：**概要设计说明**、**接口设计文档**、**数据库设计说明**、**详细设计说明**。\r\n\r\n* **编码**：此阶段是将软件设计的结果转换成计算机可运行的程序代码。在程序编码中必须要制定统一，符合标准的编写规范。文档：**编码规范**。\r\n\r\n* **软件测试**：在软件设计完成后要经过严密的测试，以发现软件在整个设计过程中存在的问题并加以纠正。分单元测试、组装测试以及系统测试。方法主要有**白盒测试**和**黑盒测试**。文档：**软件测试计划**、**测试用例**、**软件测试报告**。\r\n\r\n* **运行与维护**：软件维护是软件生命周期中持续时间最长的阶段。在软件开发完成并投入使用后，由于多方面的原因，软件不能继续适应用户的要求。要延续软件的使用寿命，就必须对软件进行维护。文档：**项目开发总结报告**、**使用手册**、**应用软件清单**、**源代码清单**、**维护手册**。\r\n\r\n# 软件文档\r\n软件文档是软件开发使用和维护过程中的必备资料。它能提高软件开发的效率，保证软件的质量，而且在软件的使用过程中有指导，帮助，解惑的作用，尤其在维护工作中，文档是不可或缺的资料。一般有如下几类：\r\n* 项目管理文档：**软件项目计划**、**项目进度报告**、**项目开发总结报告**\r\n* 软件开发文档：**软件需求说明**、**概要设计说明**、**详细设计说明**、**软件测试计划**、**软件测试报告**\r\n* 产品文档包括：**产品简介**、**产品演示**、**疑问解答**、**功能介绍**、**技术白皮书**、**评测报告**\r\n* 用户文档：**安装手册**、**使用手册**、**维护手册**、**用户报告**、**销售培训**\r\n',0,1,NULL,'post','publish',NULL,0,'1','1','1',0);
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
  `str_value` text DEFAULT NULL,
  `int_value` int(10) DEFAULT 0,
  `float_value` float DEFAULT 0,
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
INSERT INTO `typecho_fields` VALUES (4,'picUrl','str','http://127.0.0.1/usr/uploads/2019/03/2311125299.jpeg',0,0),(4,'description','str','',0,0),(5,'picUrl','str','',0,0),(5,'description','str','debian9 typecho mysql nginx mariadb/mysql',0,0),(8,'picUrl','str','http://127.0.0.1/usr/uploads/2019/04/8699984.jpg',0,0),(8,'description','str','',0,0),(13,'picUrl','str','',0,0),(13,'description','str','',0,0),(14,'picUrl','str','',0,0),(14,'description','str','gcc 编译程序 静态库 动态库',0,0),(15,'picUrl','str','',0,0),(15,'description','str','',0,0),(16,'picUrl','str','',0,0),(16,'description','str','共识算法 raft 一致性',0,0),(17,'picUrl','str','',0,0),(17,'description','str','raft 算法 共识',0,0),(18,'picUrl','str','',0,0),(18,'description','str','软件 生命周期 软件开发 文档',0,0);
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
  `count` int(10) unsigned DEFAULT 0,
  `order` int(10) unsigned DEFAULT 0,
  `parent` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`mid`),
  KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typecho_metas`
--

LOCK TABLES `typecho_metas` WRITE;
/*!40000 ALTER TABLE `typecho_metas` DISABLE KEYS */;
INSERT INTO `typecho_metas` VALUES (1,'默认分类','default','category','只是一个默认分类',9,1,0);
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
  `user` int(10) unsigned NOT NULL DEFAULT 0,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`name`,`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typecho_options`
--

LOCK TABLES `typecho_options` WRITE;
/*!40000 ALTER TABLE `typecho_options` DISABLE KEYS */;
INSERT INTO `typecho_options` VALUES ('theme',0,'Material'),('theme:Material',0,'a:58:{s:6:\"switch\";a:4:{i:0;s:12:\"SmoothScroll\";i:1;s:15:\"ShowLoadingLine\";i:2;s:8:\"PanguPHP\";i:3;s:9:\"HighLight\";}s:9:\"commentis\";i:0;s:11:\"CommentRows\";i:1;s:15:\"DisqusShortname\";N;s:14:\"DisqusSiteName\";N;s:9:\"DisqusApi\";s:30:\"https://disqus.skk.moe/disqus/\";s:12:\"DisqusApiKey\";N;s:11:\"DisqusAdmin\";N;s:16:\"DisqusAdminLabel\";N;s:19:\"SwitchToDisqusSince\";i:0;s:6:\"qrcode\";i:0;s:8:\"searchis\";i:1;s:7:\"CDNType\";i:0;s:6:\"CDNURL\";N;s:8:\"language\";s:5:\"zh-CN\";s:9:\"footersns\";a:0:{}s:11:\"FacebookURL\";N;s:10:\"TwitterURL\";N;s:13:\"GooglePlusURL\";N;s:8:\"WeiboURL\";N;s:12:\"InstagramURL\";N;s:9:\"TumblrURL\";N;s:9:\"GithubURL\";N;s:11:\"LinkedinURL\";N;s:8:\"ZhihuURL\";N;s:11:\"BilibiliURL\";N;s:11:\"TelegramURL\";N;s:7:\"V2EXURL\";N;s:12:\"post_license\";N;s:11:\"footer_text\";N;s:12:\"RobotoSource\";i:3;s:8:\"analysis\";N;s:7:\"adsense\";N;s:11:\"DNSPrefetch\";N;s:12:\"loadingcolor\";s:4:\"#29d\";s:13:\"loadingbuffer\";i:800;s:11:\"SearchColor\";N;s:6:\"BGtype\";i:1;s:7:\"bgcolor\";N;s:12:\"GradientType\";i:0;s:15:\"ThumbnailOption\";i:1;s:10:\"TitleColor\";s:4:\"#FFF\";s:13:\"RandomPicAmnt\";i:19;s:10:\"ThemeColor\";s:7:\"#0097A7\";s:10:\"alinkcolor\";s:7:\"#00838F\";s:16:\"ChromeThemeColor\";s:7:\"#0097A7\";s:16:\"ButtonThemeColor\";s:7:\"#757575\";s:13:\"CardElevation\";i:2;s:9:\"avatarURL\";N;s:7:\"favicon\";N;s:13:\"sidebarheader\";N;s:8:\"dailypic\";N;s:4:\"logo\";N;s:8:\"logosize\";i:0;s:12:\"dailypicLink\";s:1:\"#\";s:8:\"logoLink\";s:1:\"#\";s:6:\"slogan\";s:20:\"Hi, nice to meet you\";s:11:\"CustomFonts\";s:124:\"Roboto, \'Helvetica Neue\', Helvetica, \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', \'微软雅黑\', Arial, sans-serif\";}'),('timezone',0,'28800'),('lang',0,'zh_CN'),('charset',0,'UTF-8'),('contentType',0,'text/html'),('gzip',0,'0'),('generator',0,'Typecho 1.2/18.1.29'),('title',0,'Hello World'),('description',0,'Just So So ...'),('keywords',0,'typecho,php,blog'),('rewrite',0,'0'),('frontPage',0,'recent'),('frontArchive',0,'0'),('commentsRequireMail',0,'1'),('commentsWhitelist',0,'0'),('commentsRequireURL',0,'0'),('commentsRequireModeration',0,'0'),('plugins',0,'a:2:{s:9:\"activated\";a:3:{s:4:\"Snow\";a:1:{s:7:\"handles\";a:2:{s:21:\"Widget_Archive:header\";a:1:{i:0;a:2:{i:0;s:11:\"Snow_Plugin\";i:1;s:6:\"header\";}}s:21:\"Widget_Archive:footer\";a:1:{i:0;a:2:{i:0;s:11:\"Snow_Plugin\";i:1;s:6:\"footer\";}}}}s:3:\"Pio\";a:1:{s:7:\"handles\";a:2:{s:21:\"Widget_Archive:header\";a:1:{i:0;a:2:{i:0;s:10:\"Pio_Plugin\";i:1;s:6:\"header\";}}s:21:\"Widget_Archive:footer\";a:1:{i:0;a:2:{i:0;s:10:\"Pio_Plugin\";i:1;s:6:\"footer\";}}}}s:14:\"BadApplePlayer\";a:1:{s:7:\"handles\";a:1:{s:21:\"Widget_Archive:footer\";a:1:{i:0;a:2:{i:0;s:21:\"BadApplePlayer_Plugin\";i:1;s:6:\"render\";}}}}}s:7:\"handles\";a:2:{s:21:\"Widget_Archive:header\";a:2:{i:0;a:2:{i:0;s:11:\"Snow_Plugin\";i:1;s:6:\"header\";}s:5:\"0.001\";a:2:{i:0;s:10:\"Pio_Plugin\";i:1;s:6:\"header\";}}s:21:\"Widget_Archive:footer\";a:3:{i:0;a:2:{i:0;s:11:\"Snow_Plugin\";i:1;s:6:\"footer\";}s:5:\"0.001\";a:2:{i:0;s:10:\"Pio_Plugin\";i:1;s:6:\"footer\";}s:5:\"0.002\";a:2:{i:0;s:21:\"BadApplePlayer_Plugin\";i:1;s:6:\"render\";}}}}'),('commentDateFormat',0,'F jS, Y \\a\\t h:i a'),('siteUrl',0,'http://127.0.0.1'),('defaultCategory',0,'1'),('allowRegister',0,'0'),('defaultAllowComment',0,'1'),('defaultAllowPing',0,'1'),('defaultAllowFeed',0,'1'),('pageSize',0,'5'),('postsListSize',0,'10'),('commentsListSize',0,'10'),('commentsHTMLTagAllowed',0,NULL),('postDateFormat',0,'Y-m-d'),('feedFullText',0,'1'),('editorSize',0,'350'),('autoSave',0,'0'),('markdown',0,'1'),('xmlrpcMarkdown',0,'0'),('commentsMaxNestingLevels',0,'5'),('commentsPostTimeout',0,'2592000'),('commentsUrlNofollow',0,'1'),('commentsShowUrl',0,'1'),('commentsMarkdown',0,'0'),('commentsPageBreak',0,'0'),('commentsThreaded',0,'1'),('commentsPageSize',0,'20'),('commentsPageDisplay',0,'last'),('commentsOrder',0,'ASC'),('commentsCheckReferer',0,'1'),('commentsAutoClose',0,'0'),('commentsPostIntervalEnable',0,'1'),('commentsPostInterval',0,'60'),('commentsShowCommentOnly',0,'0'),('commentsAvatar',0,'1'),('commentsAvatarRating',0,'G'),('commentsAntiSpam',0,'1'),('routingTable',0,'a:26:{i:0;a:25:{s:5:\"index\";a:6:{s:3:\"url\";s:1:\"/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:8:\"|^[/]?$|\";s:6:\"format\";s:1:\"/\";s:6:\"params\";a:0:{}}s:7:\"archive\";a:6:{s:3:\"url\";s:6:\"/blog/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:13:\"|^/blog[/]?$|\";s:6:\"format\";s:6:\"/blog/\";s:6:\"params\";a:0:{}}s:2:\"do\";a:6:{s:3:\"url\";s:22:\"/action/[action:alpha]\";s:6:\"widget\";s:9:\"Widget_Do\";s:6:\"action\";s:6:\"action\";s:4:\"regx\";s:32:\"|^/action/([_0-9a-zA-Z-]+)[/]?$|\";s:6:\"format\";s:10:\"/action/%s\";s:6:\"params\";a:1:{i:0;s:6:\"action\";}}s:4:\"post\";a:6:{s:3:\"url\";s:24:\"/archives/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:26:\"|^/archives/([0-9]+)[/]?$|\";s:6:\"format\";s:13:\"/archives/%s/\";s:6:\"params\";a:1:{i:0;s:3:\"cid\";}}s:10:\"attachment\";a:6:{s:3:\"url\";s:26:\"/attachment/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:28:\"|^/attachment/([0-9]+)[/]?$|\";s:6:\"format\";s:15:\"/attachment/%s/\";s:6:\"params\";a:1:{i:0;s:3:\"cid\";}}s:8:\"category\";a:6:{s:3:\"url\";s:17:\"/category/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:25:\"|^/category/([^/]+)[/]?$|\";s:6:\"format\";s:13:\"/category/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"slug\";}}s:3:\"tag\";a:6:{s:3:\"url\";s:12:\"/tag/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:20:\"|^/tag/([^/]+)[/]?$|\";s:6:\"format\";s:8:\"/tag/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"slug\";}}s:6:\"author\";a:6:{s:3:\"url\";s:22:\"/author/[uid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:24:\"|^/author/([0-9]+)[/]?$|\";s:6:\"format\";s:11:\"/author/%s/\";s:6:\"params\";a:1:{i:0;s:3:\"uid\";}}s:6:\"search\";a:6:{s:3:\"url\";s:19:\"/search/[keywords]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:23:\"|^/search/([^/]+)[/]?$|\";s:6:\"format\";s:11:\"/search/%s/\";s:6:\"params\";a:1:{i:0;s:8:\"keywords\";}}s:10:\"index_page\";a:6:{s:3:\"url\";s:21:\"/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:22:\"|^/page/([0-9]+)[/]?$|\";s:6:\"format\";s:9:\"/page/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"page\";}}s:12:\"archive_page\";a:6:{s:3:\"url\";s:26:\"/blog/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:27:\"|^/blog/page/([0-9]+)[/]?$|\";s:6:\"format\";s:14:\"/blog/page/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"page\";}}s:13:\"category_page\";a:6:{s:3:\"url\";s:32:\"/category/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:34:\"|^/category/([^/]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:16:\"/category/%s/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"slug\";i:1;s:4:\"page\";}}s:8:\"tag_page\";a:6:{s:3:\"url\";s:27:\"/tag/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:29:\"|^/tag/([^/]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:11:\"/tag/%s/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"slug\";i:1;s:4:\"page\";}}s:11:\"author_page\";a:6:{s:3:\"url\";s:37:\"/author/[uid:digital]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:33:\"|^/author/([0-9]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:14:\"/author/%s/%s/\";s:6:\"params\";a:2:{i:0;s:3:\"uid\";i:1;s:4:\"page\";}}s:11:\"search_page\";a:6:{s:3:\"url\";s:34:\"/search/[keywords]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:32:\"|^/search/([^/]+)/([0-9]+)[/]?$|\";s:6:\"format\";s:14:\"/search/%s/%s/\";s:6:\"params\";a:2:{i:0;s:8:\"keywords\";i:1;s:4:\"page\";}}s:12:\"archive_year\";a:6:{s:3:\"url\";s:18:\"/[year:digital:4]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:19:\"|^/([0-9]{4})[/]?$|\";s:6:\"format\";s:4:\"/%s/\";s:6:\"params\";a:1:{i:0;s:4:\"year\";}}s:13:\"archive_month\";a:6:{s:3:\"url\";s:36:\"/[year:digital:4]/[month:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:30:\"|^/([0-9]{4})/([0-9]{2})[/]?$|\";s:6:\"format\";s:7:\"/%s/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"year\";i:1;s:5:\"month\";}}s:11:\"archive_day\";a:6:{s:3:\"url\";s:52:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:41:\"|^/([0-9]{4})/([0-9]{2})/([0-9]{2})[/]?$|\";s:6:\"format\";s:10:\"/%s/%s/%s/\";s:6:\"params\";a:3:{i:0;s:4:\"year\";i:1;s:5:\"month\";i:2;s:3:\"day\";}}s:17:\"archive_year_page\";a:6:{s:3:\"url\";s:38:\"/[year:digital:4]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:33:\"|^/([0-9]{4})/page/([0-9]+)[/]?$|\";s:6:\"format\";s:12:\"/%s/page/%s/\";s:6:\"params\";a:2:{i:0;s:4:\"year\";i:1;s:4:\"page\";}}s:18:\"archive_month_page\";a:6:{s:3:\"url\";s:56:\"/[year:digital:4]/[month:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:44:\"|^/([0-9]{4})/([0-9]{2})/page/([0-9]+)[/]?$|\";s:6:\"format\";s:15:\"/%s/%s/page/%s/\";s:6:\"params\";a:3:{i:0;s:4:\"year\";i:1;s:5:\"month\";i:2;s:4:\"page\";}}s:16:\"archive_day_page\";a:6:{s:3:\"url\";s:72:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:55:\"|^/([0-9]{4})/([0-9]{2})/([0-9]{2})/page/([0-9]+)[/]?$|\";s:6:\"format\";s:18:\"/%s/%s/%s/page/%s/\";s:6:\"params\";a:4:{i:0;s:4:\"year\";i:1;s:5:\"month\";i:2;s:3:\"day\";i:3;s:4:\"page\";}}s:12:\"comment_page\";a:6:{s:3:\"url\";s:53:\"[permalink:string]/comment-page-[commentPage:digital]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:36:\"|^(.+)/comment\\-page\\-([0-9]+)[/]?$|\";s:6:\"format\";s:18:\"%s/comment-page-%s\";s:6:\"params\";a:2:{i:0;s:9:\"permalink\";i:1;s:11:\"commentPage\";}}s:4:\"feed\";a:6:{s:3:\"url\";s:20:\"/feed[feed:string:0]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:4:\"feed\";s:4:\"regx\";s:17:\"|^/feed(.*)[/]?$|\";s:6:\"format\";s:7:\"/feed%s\";s:6:\"params\";a:1:{i:0;s:4:\"feed\";}}s:8:\"feedback\";a:6:{s:3:\"url\";s:31:\"[permalink:string]/[type:alpha]\";s:6:\"widget\";s:15:\"Widget_Feedback\";s:6:\"action\";s:6:\"action\";s:4:\"regx\";s:29:\"|^(.+)/([_0-9a-zA-Z-]+)[/]?$|\";s:6:\"format\";s:5:\"%s/%s\";s:6:\"params\";a:2:{i:0;s:9:\"permalink\";i:1;s:4:\"type\";}}s:4:\"page\";a:6:{s:3:\"url\";s:12:\"/[slug].html\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";s:4:\"regx\";s:22:\"|^/([^/]+)\\.html[/]?$|\";s:6:\"format\";s:8:\"/%s.html\";s:6:\"params\";a:1:{i:0;s:4:\"slug\";}}}s:5:\"index\";a:3:{s:3:\"url\";s:1:\"/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:7:\"archive\";a:3:{s:3:\"url\";s:6:\"/blog/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:2:\"do\";a:3:{s:3:\"url\";s:22:\"/action/[action:alpha]\";s:6:\"widget\";s:9:\"Widget_Do\";s:6:\"action\";s:6:\"action\";}s:4:\"post\";a:3:{s:3:\"url\";s:24:\"/archives/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:10:\"attachment\";a:3:{s:3:\"url\";s:26:\"/attachment/[cid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:8:\"category\";a:3:{s:3:\"url\";s:17:\"/category/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:3:\"tag\";a:3:{s:3:\"url\";s:12:\"/tag/[slug]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:6:\"author\";a:3:{s:3:\"url\";s:22:\"/author/[uid:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:6:\"search\";a:3:{s:3:\"url\";s:19:\"/search/[keywords]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:10:\"index_page\";a:3:{s:3:\"url\";s:21:\"/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:12:\"archive_page\";a:3:{s:3:\"url\";s:26:\"/blog/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:13:\"category_page\";a:3:{s:3:\"url\";s:32:\"/category/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:8:\"tag_page\";a:3:{s:3:\"url\";s:27:\"/tag/[slug]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:11:\"author_page\";a:3:{s:3:\"url\";s:37:\"/author/[uid:digital]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:11:\"search_page\";a:3:{s:3:\"url\";s:34:\"/search/[keywords]/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:12:\"archive_year\";a:3:{s:3:\"url\";s:18:\"/[year:digital:4]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:13:\"archive_month\";a:3:{s:3:\"url\";s:36:\"/[year:digital:4]/[month:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:11:\"archive_day\";a:3:{s:3:\"url\";s:52:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:17:\"archive_year_page\";a:3:{s:3:\"url\";s:38:\"/[year:digital:4]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:18:\"archive_month_page\";a:3:{s:3:\"url\";s:56:\"/[year:digital:4]/[month:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:16:\"archive_day_page\";a:3:{s:3:\"url\";s:72:\"/[year:digital:4]/[month:digital:2]/[day:digital:2]/page/[page:digital]/\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:12:\"comment_page\";a:3:{s:3:\"url\";s:53:\"[permalink:string]/comment-page-[commentPage:digital]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}s:4:\"feed\";a:3:{s:3:\"url\";s:20:\"/feed[feed:string:0]\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:4:\"feed\";}s:8:\"feedback\";a:3:{s:3:\"url\";s:31:\"[permalink:string]/[type:alpha]\";s:6:\"widget\";s:15:\"Widget_Feedback\";s:6:\"action\";s:6:\"action\";}s:4:\"page\";a:3:{s:3:\"url\";s:12:\"/[slug].html\";s:6:\"widget\";s:14:\"Widget_Archive\";s:6:\"action\";s:6:\"render\";}}'),('actionTable',0,'a:0:{}'),('panelTable',0,'a:0:{}'),('attachmentTypes',0,'@image@'),('secret',0,'ZVnqKzmr8uJlpO6eAmRIGJU%XWwhF0GF'),('installed',0,'1'),('allowXmlRpc',0,'2'),('plugin:Snow',0,'a:9:{s:6:\"mobile\";i:1;s:10:\"flakeCount\";s:3:\"200\";s:4:\"size\";s:1:\"2\";s:7:\"minDist\";s:3:\"150\";s:5:\"speed\";s:3:\"0.5\";s:8:\"stepSize\";s:1:\"1\";s:9:\"snowcolor\";s:7:\"#ffffff\";s:7:\"opacity\";s:3:\"0.3\";s:7:\"bgcolor\";s:7:\"#7d895f\";}'),('plugin:Pio',0,'a:11:{s:13:\"choose_models\";a:1:{i:0;s:9:\"snow_miku\";}s:8:\"position\";s:4:\"left\";s:12:\"custom_width\";s:3:\"450\";s:13:\"custom_height\";s:3:\"450\";s:12:\"custom_model\";s:0:\"\";s:5:\"night\";s:0:\"\";s:11:\"custom_mode\";s:6:\"static\";s:6:\"hidden\";s:1:\"0\";s:4:\"tips\";s:1:\"0\";s:6:\"dialog\";s:0:\"\";s:8:\"selector\";s:0:\"\";}'),('plugin:BadApplePlayer',0,'a:5:{s:7:\"XlchKey\";s:7:\"Default\";s:8:\"IsJquery\";s:3:\"Yes\";s:18:\"IsJqueryMousewheel\";s:3:\"Yes\";s:13:\"IsFontAwesome\";s:3:\"Yes\";s:7:\"IsHttps\";s:2:\"No\";}'),('autoSave',1,'0'),('markdown',1,'1'),('xmlrpcMarkdown',1,'1'),('defaultAllowComment',1,'1'),('defaultAllowPing',1,'1'),('defaultAllowFeed',1,'1');
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
INSERT INTO `typecho_relationships` VALUES (4,1),(5,1),(8,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1);
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
  `created` int(10) unsigned DEFAULT 0,
  `activated` int(10) unsigned DEFAULT 0,
  `logged` int(10) unsigned DEFAULT 0,
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
INSERT INTO `typecho_users` VALUES (1,'admin','$P$BWm/VWYtsgEaJECXDKlSBhKEI673Px.','llfcjyy@outlook.com','http://www.typecho.org','admin',1553479513,1555667978,1554802191,'administrator','d98ce4b274bfa496a7dcf02e6d90a1d3');
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

-- Dump completed on 2019-04-19 18:00:21
