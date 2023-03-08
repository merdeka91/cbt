/*
Navicat MySQL Data Transfer

Source Server         : conn
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : upload_data

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2022-09-22 10:37:40
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `download`
-- ----------------------------
DROP TABLE IF EXISTS `download`;
CREATE TABLE `download` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal_upload` date NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `mata_pelajaran` varchar(100) NOT NULL,
  `asoal` varchar(255) DEFAULT NULL,
  `akisi` varchar(255) DEFAULT NULL,
  `bsoal` varchar(255) DEFAULT NULL,
  `bkisi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of download
-- ----------------------------
INSERT INTO `download` VALUES ('1', '2022-06-02', 'X', 'Pend. Agama dan Budi Pekerti', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('2', '2022-05-31', 'X', 'PPKn', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('3', '2022-05-30', 'X', 'Bahasa Indonesia', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('4', '2022-06-06', 'X', 'Matematika Wajib', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('5', '2022-06-01', 'X', 'Sejarah Indonesia', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('6', '2022-06-02', 'X', 'Bahasa Inggris', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('7', '2022-06-06', 'X', 'Seni Budaya', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('8', '2022-05-28', 'X', 'PJOK', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('9', '2022-05-29', 'X', 'PKWU', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('10', '2022-06-01', 'X', 'Bahasa Sunda', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('11', '2022-06-03', 'X', 'Matematika Minat', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('12', '2022-06-03', 'X', 'Biologi', '1', null, '1', null);
INSERT INTO `download` VALUES ('13', '2022-06-06', 'X', 'Fisika', '1', null, '1', null);
INSERT INTO `download` VALUES ('14', '2022-06-02', 'X', 'Kimia', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('15', '0000-00-00', 'X', 'Geografi', null, null, null, null);
INSERT INTO `download` VALUES ('16', '2022-06-01', 'X', 'Sejarah Minat', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('17', '2022-06-02', 'X', 'Sosiologi', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('18', '2022-05-29', 'X', 'Ekonomi', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('19', '2022-06-02', 'X', 'Bahasa dan Sastra Inggris', '1', null, '1', null);
INSERT INTO `download` VALUES ('20', '2022-06-06', 'X', 'Bahasa dan Sastra Jepang', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('21', '0000-00-00', 'X', 'Informatika', null, null, null, null);
INSERT INTO `download` VALUES ('22', '2022-06-03', 'XI', 'Pend. Agama dan Budi Pekerti', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('23', '2022-06-01', 'XI', 'PPKn', '1', null, null, null);
INSERT INTO `download` VALUES ('24', '2022-05-30', 'XI', 'Bahasa Indonesia', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('25', '2022-06-06', 'XI', 'Matematika Wajib', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('26', '0000-00-00', 'XI', 'Sejarah Indonesia', null, null, null, null);
INSERT INTO `download` VALUES ('27', '2022-06-06', 'XI', 'Bahasa Inggris', '1', null, null, null);
INSERT INTO `download` VALUES ('28', '2022-06-01', 'XI', 'Seni Budaya', '1', null, null, null);
INSERT INTO `download` VALUES ('29', '2022-06-02', 'XI', 'PJOK', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('30', '0000-00-00', 'XI', 'PKWU', null, null, null, null);
INSERT INTO `download` VALUES ('31', '2022-06-03', 'XI', 'Bahasa Sunda', '1', null, '1', null);
INSERT INTO `download` VALUES ('32', '2022-06-02', 'XI', 'Matematika Minat', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('33', '2022-06-01', 'XI', 'Biologi', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('34', '2022-06-07', 'XI', 'Fisika', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('35', '2022-06-06', 'XI', 'Kimia', '1', null, '1', null);
INSERT INTO `download` VALUES ('36', '0000-00-00', 'XI', 'Geografi', null, null, null, null);
INSERT INTO `download` VALUES ('37', '2022-06-03', 'XI', 'Sejarah Minat', '1', null, '1', null);
INSERT INTO `download` VALUES ('38', '2022-06-03', 'XI', 'Sosiologi', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('39', '2022-05-29', 'XI', 'Ekonomi', '1', '1', '1', '1');
INSERT INTO `download` VALUES ('40', '2022-06-02', 'XI', 'Bahasa dan Sastra Inggris', '1', null, null, null);
INSERT INTO `download` VALUES ('41', '0000-00-00', 'XI', 'Bahasa dan Sastra Jepang', null, null, null, null);
INSERT INTO `download` VALUES ('42', '0000-00-00', 'XI', 'Informatika', null, null, null, null);
