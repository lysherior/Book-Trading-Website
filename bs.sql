/*
Navicat MySQL Data Transfer

Source Server         : whj
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : bs

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-07-02 11:11:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bookID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `ISBN` varchar(17) NOT NULL,
  `originalprice` float DEFAULT NULL,
  `price` float NOT NULL,
  `category` varchar(16) NOT NULL,
  `imageURL` varchar(1024) NOT NULL,
  `details` varchar(1024) DEFAULT NULL,
  `state` tinyint(4) NOT NULL,
  PRIMARY KEY (`bookID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', 'Algorithm', '978-7-111-40701-0', '129', '39', 'computer', 'https://img10.360buyimg.com/n1/g9/M03/10/0C/rBEHalDFX10IAAAAAAMtdd_bKwEAADM6gOC6NoAAy2N265.jpg', 'Donec accumsan auctor iaculis. Sed suscipit arcu ligula, at egestas magna molestie a. Proin ac ex maximus, ultrices justo eget, sodales orci. Aliquam egestas libero ac turpis pharetra, in vehicula lacus scelerisque. Vestibulum ut sem laoreet, feugiat tellus at, hendrerit arcu.', '1');
INSERT INTO `book` VALUES ('2', 'Calculus and Higher Algebra', '123-4-567-88999-0', '68', '15', 'magazine', 'http://img1.zazhipu.com/magbpic/169364_small.jpg?imageMogr2/thumbnail/500x', 'Donec accumsan auctor iaculis. Sed suscipit arcu ligula, at egestas magna molestie a. Proin ac ex maximus, ultrices justo eget, sodales orci. Aliquam egestas libero ac turpis pharetra, in vehicula lacus scelerisque. Vestibulum ut sem laoreet, feugiat tellus at, hendrerit arcu.', '1');
INSERT INTO `book` VALUES ('3', 'Three countries', '102-1-233-21912-2', '88', '22', 'chinese', 'https://www.wsm.cn/uploads/allimg/160521/26-160521150358.jpg', 'Donec accumsan auctor iaculis. Sed suscipit arcu ligula, at egestas magna molestie a. Proin ac ex maximus, ultrices justo eget, sodales orci. Aliquam egestas libero ac turpis pharetra, in vehicula lacus scelerisque. Vestibulum ut sem laoreet, feugiat tellus at, hendrerit arcu.', '1');
INSERT INTO `book` VALUES ('4', 'Foreign exchange', '162-1-343-21432-2', '45', '13', 'economy', 'http://img3m6.ddimg.cn/23/32/1045752566-1_u_3.jpg', 'Donec accumsan auctor iaculis. Sed suscipit arcu ligula, at egestas magna molestie a. Proin ac ex maximus, ultrices justo eget, sodales orci. Aliquam egestas libero ac turpis pharetra, in vehicula lacus scelerisque. Vestibulum ut sem laoreet, feugiat tellus at, hendrerit arcu.', '1');
INSERT INTO `book` VALUES ('5', 'DataBase', '313-4-567-84359-1', '99', '40', 'computer', 'https://img10.360buyimg.com/n1/jfs/t19900/361/179325469/109165/b3e7de09/5ae980feN2b7040a5.jpg', 'Donec accumsan auctor iaculis. Sed suscipit arcu ligula, at egestas magna molestie a. Proin ac ex maximus, ultrices justo eget, sodales orci. Aliquam egestas libero ac turpis pharetra, in vehicula lacus scelerisque. Vestibulum ut sem laoreet, feugiat tellus at, hendrerit arcu.', '1');
INSERT INTO `book` VALUES ('6', 'Linear algebra', '162-1-343-21432-2', '129.9', '35', 'math', 'https://img.alicdn.com/imgextra/i1/640504782/TB12mG.jxrI8KJjy0FpXXb5hVXa_!!0-item_pic.jpg_430x430q90.jpg', 'Donec accumsan auctor iaculis. Sed suscipit arcu ligula, at egestas magna molestie a. Proin ac ex maximus, ultrices justo eget, sodales orci. Aliquam egestas libero ac turpis pharetra, in vehicula lacus scelerisque. Vestibulum ut sem laoreet, feugiat tellus at, hendrerit arcu.', '1');
INSERT INTO `book` VALUES ('7', 'Electronic and electrical technology', '313-4-567-84359-1', '88', '56', 'computer', 'http://s.cmpedu.com/images/upload/2019/4/4/1558376880619(LT800).jpg', 'Donec accumsan auctor iaculis. Sed suscipit arcu ligula, at egestas magna molestie a. Proin ac ex maximus, ultrices justo eget, sodales orci. Aliquam egestas libero ac turpis pharetra, in vehicula lacus scelerisque. Vestibulum ut sem laoreet, feugiat tellus at, hendrerit arcu.', '1');
INSERT INTO `book` VALUES ('8', 'Probability theory', '162-1-343-21432-2', '35', '9.9', 'math', 'https://imgservice.suning.cn/uimg1/b2c/image/XkdKJmU0v75zGsGzuyL7hg==.jpg_400w_400h_4e', 'Donec accumsan auctor iaculis. Sed suscipit arcu ligula, at egestas magna molestie a. Proin ac ex maximus, ultrices justo eget, sodales orci. Aliquam egestas libero ac turpis pharetra, in vehicula lacus scelerisque. Vestibulum ut sem laoreet, feugiat tellus at, hendrerit arcu.', '1');
INSERT INTO `book` VALUES ('9', 'Java language programming', '162-1-343-21432-2', '44', '33', 'computer', 'https://img.yzcdn.cn/upload_files/2016/08/03/FtyEyy2qQqULzjbm9__NEpr53_rK.jpg?imageView2/2/w/580/h/580/q/75/format/jpg', 'Donec accumsan auctor iaculis. Sed suscipit arcu ligula, at egestas magna molestie a. Proin ac ex maximus, ultrices justo eget, sodales orci. Aliquam egestas libero ac turpis pharetra, in vehicula lacus scelerisque. Vestibulum ut sem laoreet, feugiat tellus at, hendrerit arcu.', '1');
INSERT INTO `book` VALUES ('10', 'Introduction to E-Commerce', '162-1-343-21432-2', '70', '30', 'economy', 'http://image12.bookschina.com/2018/20180307/7833173.jpg', 'Donec accumsan auctor iaculis. Sed suscipit arcu ligula, at egestas magna molestie a. Proin ac ex maximus, ultrices justo eget, sodales orci. Aliquam egestas libero ac turpis pharetra, in vehicula lacus scelerisque. Vestibulum ut sem laoreet, feugiat tellus at, hendrerit arcu.', '1');
INSERT INTO `book` VALUES ('11', 'Smart home system development', '313-4-567-84359-1', '40', '10', 'computer', 'http://www.bizideal.com/d/file/content/2018/06/5b320587ab93f.jpg', 'Donec accumsan auctor iaculis. Sed suscipit arcu ligula, at egestas magna molestie a. Proin ac ex maximus, ultrices justo eget, sodales orci. Aliquam egestas libero ac turpis pharetra, in vehicula lacus scelerisque. Vestibulum ut sem laoreet, feugiat tellus at, hendrerit arcu.', '1');
INSERT INTO `book` VALUES ('12', 'Project quality management', '162-1-343-21432-2', '44', '22', 'manager', 'https://img.alicdn.com/imgextra/i3/389787275/TB1aQEztz7nBKNjSZLeXXbxCFXa_!!0-item_pic.jpg_430x430q90.jpg', 'Donec accumsan auctor iaculis. Sed suscipit arcu ligula, at egestas magna molestie a. Proin ac ex maximus, ultrices justo eget, sodales orci. Aliquam egestas libero ac turpis pharetra, in vehicula lacus scelerisque. Vestibulum ut sem laoreet, feugiat tellus at, hendrerit arcu.', '1');
INSERT INTO `book` VALUES ('41', 'Probability Theory', '313-4-567-84359-1', '99', '29', 'math', 'http://localhost:63342/Book-Trading-Website/Book-Trading-Website_main/resources/bookImage/4caacb368ef4495db07ebea5dd543706.jpg', 'Donec accumsan auctor iaculis. Sed suscipit arcu ligula, at egestas magna molestie a. Proin ac ex maximus, ultrices justo eget, sodales orci. Aliquam egestas libero ac turpis pharetra, in vehicula lacus scelerisque. Vestibulum ut sem laoreet, feugiat tellus at, hendrerit arcu.', '1');
INSERT INTO `book` VALUES ('42', 'Probability Theory', '313-4-567-84359-1', '99', '29', 'math', 'http://localhost:63342/Book-Trading-Website/Book-Trading-Website_main/resources/bookImage/9a9b13cf0fcd45d187dc85e42b6898dc.jpg', 'Donec accumsan auctor iaculis. Sed suscipit arcu ligula, at egestas magna molestie a. Proin ac ex maximus, ultrices justo eget, sodales orci. Aliquam egestas libero ac turpis pharetra, in vehicula lacus scelerisque. Vestibulum ut sem laoreet, feugiat tellus at, hendrerit arcu.', '1');

-- ----------------------------
-- Table structure for buy
-- ----------------------------
DROP TABLE IF EXISTS `buy`;
CREATE TABLE `buy` (
  `consumerEmail` varchar(64) NOT NULL,
  `bookID` int(11) NOT NULL,
  PRIMARY KEY (`consumerEmail`,`bookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buy
-- ----------------------------
INSERT INTO `buy` VALUES ('3160102461@zju.edu.cn', '1');
INSERT INTO `buy` VALUES ('3160102461@zju.edu.cn', '2');

-- ----------------------------
-- Table structure for need
-- ----------------------------
DROP TABLE IF EXISTS `need`;
CREATE TABLE `need` (
  `neederEmail` varchar(64) NOT NULL,
  `bookID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of need
-- ----------------------------

-- ----------------------------
-- Table structure for sell
-- ----------------------------
DROP TABLE IF EXISTS `sell`;
CREATE TABLE `sell` (
  `providerEmail` varchar(64) NOT NULL,
  `bookID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sell
-- ----------------------------
INSERT INTO `sell` VALUES ('3160102461@zju.edu.cn', '41');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `email` varchar(64) NOT NULL,
  `name` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3160101001@zju.edu.cn', 'bds', '123456');
INSERT INTO `user` VALUES ('3160102461@zju.edu.cn', 'whj', '123456');
