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
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (1,'http://www.texasholdem-guide.org','Texas Holdem strategy guide','An in-depth Texas Holdem strategy guide','http://www.guidepoker.com/poker-links.php',1),(2,'http://www.pokerschedule.eu','Schedule in Poker','Learn all about Texas holdem Rules, All about EPT and all events in the realm of poker.','http://www.pokerguide.org',0),(3,'http://www.casinotop10.net','casino bonus','Find objective and updated information about the best online casinos.','http://www.bestonlinecasinogames.org/poker-information.php',1),(4,'http://www.pokerabcs.com','learn poker','Learn from our online poker strategy tips and online poker room reviews.','http://www.bonuswiz.com',0),(5,'http://videopokerguide.net/video_poker_strategy.php','Video Poker Strategy','All about Online Video Poker.','http://www.pokervariations.org',0),(6,'http://www.pokerjunkie.com/poker/full-tilt-poker/','Full tilt poker','By joining Full Tilt Poker through PokerJunkie you assure yourself\r\nof the best available Full Tilt Poker bonus - Full Tilt Poker are not\r\nfamous for their generous bonuses, they don’t need to entice new users.','http://www.pokerrulesdirectory.com',0),(7,'http://www.portalpoker.com','Online poker directory','A rapidly growing poker guide with its ever-expanding online\r\npoker directory.','http://www.onlinecaribbeanstudpoker.net',0),(8,'http://www.topomaha.com','Omaha Strategy','Omaha poker strategy guide for all types of players.','http://www.bestomaha.com',0),(9,'http://www.pokerroomsonline.com','Poker Room Reviews','Objective poker room reviews and a guide to online poker.','http://pokervariations.org',0);
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2006-11-15  4:44:15
