-- phpMyAdmin SQL Dump
-- version 3.1.2deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 24, 2011 at 12:50 PM
-- Server version: 5.0.75
-- PHP Version: 5.2.6-3ubuntu4.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `twitter_followers_tweets_development`
--

-- --------------------------------------------------------

--
-- Table structure for table `twitter_results`
--

CREATE TABLE IF NOT EXISTS `twitter_results` (
  `id` int(11) NOT NULL auto_increment,
  `screen_name` varchar(255) default NULL,
  `tweet_id` varchar(255) default NULL,
  `tweet` varchar(255) default NULL,
  `source` varchar(255) default NULL,
  `geo` varchar(255) default NULL,
  `tweet_length` int(11) default NULL,
  `has_link` tinyint(1) default NULL,
  `positive` tinyint(1) default NULL,
  `negative` tinyint(1) default NULL,
  `spam` float default NULL,
  `tweet_created` datetime default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `has_question` tinyint(1) default '0',
  `competitor` tinyint(1) default '0',
  `product_tweet` tinyint(1) default '0',
  `purchase_intent` varchar(255) default NULL,
  `purchase_intent_score` float default NULL,
  `user_id` int(11) default NULL,
  `user_type` varchar(255) default NULL,
  `tweet_weight` float default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69852 ;
