-- MySQL dump 10.10
--
-- Host: localhost    Database: poker
-- ------------------------------------------------------
-- Server version	5.0.26-standard

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
-- Table structure for table `hit_counts`
--

DROP TABLE IF EXISTS `hit_counts`;
CREATE TABLE `hit_counts` (
  `id` int(11) NOT NULL auto_increment,
  `created_on` date NOT NULL,
  `count` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `hits`
--

DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `id` int(11) NOT NULL auto_increment,
  `url` varchar(100) NOT NULL default '',
  `remote_addr` varchar(20) default NULL,
  `created_on` datetime NOT NULL,
  `referer` varchar(100) default NULL,
  PRIMARY KEY  (`id`),
  KEY `created_on` (`created_on`)
) ENGINE=MyISAM AUTO_INCREMENT=20835 DEFAULT CHARSET=latin1;

--
-- Table structure for table `holdem_hole_stat_sim`
--

DROP TABLE IF EXISTS `holdem_hole_stat_sim`;
CREATE TABLE `holdem_hole_stat_sim` (
  `stat_id` tinyint(3) unsigned NOT NULL auto_increment,
  `hole_id` tinyint(3) unsigned NOT NULL default '0',
  `wins` int(10) unsigned NOT NULL default '0',
  `losses` int(10) unsigned NOT NULL default '0',
  `total` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`stat_id`),
  UNIQUE KEY `stat_id` (`stat_id`),
  UNIQUE KEY `hole_id` (`hole_id`)
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=latin1;

--
-- Table structure for table `hole_stats`
--

DROP TABLE IF EXISTS `hole_stats`;
CREATE TABLE `hole_stats` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `hole_id` tinyint(3) unsigned NOT NULL default '0',
  `wins` bigint(20) unsigned NOT NULL default '0',
  `losses` bigint(20) unsigned NOT NULL default '0',
  `total` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `hole_id` (`hole_id`)
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=latin1;

--
-- Table structure for table `hole_widow_five_stats`
--

DROP TABLE IF EXISTS `hole_widow_five_stats`;
CREATE TABLE `hole_widow_five_stats` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `hole_id` tinyint(3) unsigned NOT NULL default '0',
  `widow_five_id` mediumint(8) unsigned NOT NULL default '0',
  `wins` smallint(5) unsigned NOT NULL default '0',
  `losses` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `widow_id` (`widow_five_id`,`hole_id`)
) ENGINE=MyISAM AUTO_INCREMENT=185490319 DEFAULT CHARSET=latin1;

--
-- Table structure for table `hole_widow_four_stats`
--

DROP TABLE IF EXISTS `hole_widow_four_stats`;
CREATE TABLE `hole_widow_four_stats` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `hole_id` tinyint(3) unsigned NOT NULL default '0',
  `widow_four_id` mediumint(8) unsigned NOT NULL default '0',
  `wins` smallint(5) unsigned NOT NULL default '0',
  `losses` smallint(5) unsigned NOT NULL default '0',
  `total` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `widow4_id` (`widow_four_id`,`hole_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53100867 DEFAULT CHARSET=latin1;

--
-- Table structure for table `hole_widow_three_stats`
--

DROP TABLE IF EXISTS `hole_widow_three_stats`;
CREATE TABLE `hole_widow_three_stats` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hole_id` tinyint(3) unsigned NOT NULL default '0',
  `widow_three_id` smallint(5) unsigned NOT NULL default '0',
  `wins` int(10) unsigned NOT NULL default '0',
  `losses` int(10) unsigned NOT NULL default '0',
  `total` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `widow3_id` (`widow_three_id`,`hole_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1867902 DEFAULT CHARSET=latin1;

--
-- Table structure for table `holes`
--

DROP TABLE IF EXISTS `holes`;
CREATE TABLE `holes` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `card0` char(2) NOT NULL default '',
  `card1` char(2) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `card0` (`card0`,`card1`)
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=latin1;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int(11) NOT NULL auto_increment,
  `url` varchar(100) NOT NULL default '',
  `title` varchar(100) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  `three_way` varchar(100) NOT NULL default '',
  `reciprocal` tinyint(1) NOT NULL default '0',
  `hidden` tinyint(1) NOT NULL default '0',
  `email_address` varchar(100) NOT NULL default '',
  `warned` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Table structure for table `schema_info`
--

DROP TABLE IF EXISTS `schema_info`;
CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `test_table`
--

DROP TABLE IF EXISTS `test_table`;
CREATE TABLE `test_table` (
  `test_id` int(11) NOT NULL auto_increment,
  `first_name` varchar(30) NOT NULL default '',
  `last_name` varchar(30) NOT NULL default '',
  `score` int(11) default NULL,
  `percentile` float default NULL,
  PRIMARY KEY  (`test_id`),
  UNIQUE KEY `name_unique` (`first_name`,`last_name`),
  KEY `name_index` (`first_name`,`last_name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Table structure for table `widow_fives`
--

DROP TABLE IF EXISTS `widow_fives`;
CREATE TABLE `widow_fives` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `card0` char(2) NOT NULL default '',
  `card1` char(2) NOT NULL default '',
  `card2` char(2) NOT NULL default '',
  `card3` char(2) NOT NULL default '',
  `card4` char(2) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `card0` (`card0`,`card1`,`card2`,`card3`,`card4`)
) ENGINE=MyISAM AUTO_INCREMENT=1350285 DEFAULT CHARSET=latin1;

--
-- Table structure for table `widow_fours`
--

DROP TABLE IF EXISTS `widow_fours`;
CREATE TABLE `widow_fours` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `card0` char(2) NOT NULL default '',
  `card1` char(2) NOT NULL default '',
  `card2` char(2) NOT NULL default '',
  `card3` char(2) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `card0` (`card0`,`card1`,`card2`,`card3`)
) ENGINE=MyISAM AUTO_INCREMENT=144990 DEFAULT CHARSET=latin1;

--
-- Table structure for table `widow_threes`
--

DROP TABLE IF EXISTS `widow_threes`;
CREATE TABLE `widow_threes` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `card0` char(2) NOT NULL default '',
  `card1` char(2) NOT NULL default '',
  `card2` char(2) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `card0` (`card0`,`card1`,`card2`)
) ENGINE=MyISAM AUTO_INCREMENT=12520 DEFAULT CHARSET=latin1;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-06-19  3:54:50
