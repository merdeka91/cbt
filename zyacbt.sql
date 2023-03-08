/*
 Navicat Premium Data Transfer

 Source Server         : CONN
 Source Server Type    : MySQL
 Source Server Version : 100406
 Source Host           : localhost:3306
 Source Schema         : zyacbt

 Target Server Type    : MySQL
 Target Server Version : 100406
 File Encoding         : 65001

 Date: 07/03/2023 17:04:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cbt_jawaban
-- ----------------------------
DROP TABLE IF EXISTS `cbt_jawaban`;
CREATE TABLE `cbt_jawaban`  (
  `jawaban_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `jawaban_soal_id` bigint UNSIGNED NOT NULL,
  `jawaban_detail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `jawaban_benar` tinyint(1) NOT NULL DEFAULT 0,
  `jawaban_aktif` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`jawaban_id`) USING BTREE,
  INDEX `p_answer_question_id`(`jawaban_soal_id`) USING BTREE,
  CONSTRAINT `cbt_jawaban_ibfk_1` FOREIGN KEY (`jawaban_soal_id`) REFERENCES `cbt_soal` (`soal_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 626 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_jawaban
-- ----------------------------

-- ----------------------------
-- Table structure for cbt_konfigurasi
-- ----------------------------
DROP TABLE IF EXISTS `cbt_konfigurasi`;
CREATE TABLE `cbt_konfigurasi`  (
  `konfigurasi_id` int NOT NULL AUTO_INCREMENT,
  `konfigurasi_kode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `konfigurasi_isi` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `konfigurasi_keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`konfigurasi_id`) USING BTREE,
  UNIQUE INDEX `konfigurasi_kode`(`konfigurasi_kode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_konfigurasi
-- ----------------------------
INSERT INTO `cbt_konfigurasi` VALUES (1, 'link_login_operator', 'tidak', 'Menampilkan Link Login Operator');
INSERT INTO `cbt_konfigurasi` VALUES (2, 'cbt_nama', 'CBT Kelas X', 'Nama Penyelenggara ZYACBT');
INSERT INTO `cbt_konfigurasi` VALUES (3, 'cbt_keterangan', 'SMAN 1 Garut', 'Keterangan Penyelenggara ZYACBT');
INSERT INTO `cbt_konfigurasi` VALUES (4, 'cbt_mobile_lock_xambro', 'ya', 'Melakukan Lock pada browser mobile agar menggunakan Xambro Saja');
INSERT INTO `cbt_konfigurasi` VALUES (5, 'cbt_informasi', '<p>Silahkan pilih Tes yang diikuti dari daftar tes yang tersedia dibawah ini. Apabila tes tidak muncul, silahkan menghubungi Operator yang bertugas.</p>\r\n', 'Informasi yang diberika di Dashboard peserta tes\'');

-- ----------------------------
-- Table structure for cbt_login
-- ----------------------------
DROP TABLE IF EXISTS `cbt_login`;
CREATE TABLE `cbt_login`  (
  `id_login` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_login`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_login
-- ----------------------------
INSERT INTO `cbt_login` VALUES (1, '212210335', '1');

-- ----------------------------
-- Table structure for cbt_modul
-- ----------------------------
DROP TABLE IF EXISTS `cbt_modul`;
CREATE TABLE `cbt_modul`  (
  `modul_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `modul_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `modul_aktif` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`modul_id`) USING BTREE,
  UNIQUE INDEX `ak_module_name`(`modul_nama`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_modul
-- ----------------------------
INSERT INTO `cbt_modul` VALUES (1, 'Kelas X', 1);
INSERT INTO `cbt_modul` VALUES (2, 'Kelas XI', 0);
INSERT INTO `cbt_modul` VALUES (3, 'Kelas XII', 0);

-- ----------------------------
-- Table structure for cbt_sessions
-- ----------------------------
DROP TABLE IF EXISTS `cbt_sessions`;
CREATE TABLE `cbt_sessions`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `timestamp` int UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ci_sessions_timestamp`(`timestamp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_sessions
-- ----------------------------
INSERT INTO `cbt_sessions` VALUES ('1d2ci5627rnojl6r501vlmqfshrg1ap2', '192.168.7.1', 1669935991, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393933353939313B);
INSERT INTO `cbt_sessions` VALUES ('1sk0k1seevr7o043faksuaoumnacakbp', '::1', 1669877762, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393837373734363B6362745F757365725F69647C733A353A2261646D696E223B6362745F6E616D617C733A31333A2241646D696E6973747261746F72223B6362745F6C6576656C7C733A353A2261646D696E223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B);
INSERT INTO `cbt_sessions` VALUES ('2362pitjjqe74htup2k0kestrjk1kgl6', '192.168.7.1', 1669888577, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393838383537373B);
INSERT INTO `cbt_sessions` VALUES ('3coi3di08vn8fuac0rf9gjag9o1d09hu', '192.168.7.1', 1669942622, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393934323632323B);
INSERT INTO `cbt_sessions` VALUES ('4l99ik9t54gf2c51vlhrbfjk7763fv11', '192.168.7.1', 1669936122, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393933363036353B);
INSERT INTO `cbt_sessions` VALUES ('5jgcqd0mnb27dupihn71of4slh73816b', '192.168.7.1', 1669893862, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393839333836323B);
INSERT INTO `cbt_sessions` VALUES ('6t40j1mv7rmvmdl5dla34ka1kna0ljjn', '192.168.7.1', 1669888579, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393838383537393B);
INSERT INTO `cbt_sessions` VALUES ('7d6092a0q5o8gp8n89tfhatmiqi395nf', '::1', 1678183130, 0x5F5F63695F6C6173745F726567656E65726174657C693A313637383138333133303B6362745F757365725F69647C733A353A2261646D696E223B6362745F6E616D617C733A31333A2241646D696E6973747261746F72223B6362745F6C6576656C7C733A353A2261646D696E223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B);
INSERT INTO `cbt_sessions` VALUES ('7i8nii0ma16s11gflv1jlenhpem8e8m9', '192.168.7.1', 1669894043, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393839333939313B6362745F7465735F757365725F69647C733A393A22323232333130313731223B6362745F7465735F6E616D617C733A31383A224B61796C61204E616D6972612048616B696D223B6362745F7465735F67726F75707C733A343A22582D3035223B6362745F7465735F67726F75705F69647C733A333A22313035223B);
INSERT INTO `cbt_sessions` VALUES ('7jnk8aq945ag25ga3bctugja68lstui3', '192.168.7.1', 1669940378, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393934303337383B);
INSERT INTO `cbt_sessions` VALUES ('aahd29nnr38ccpob3dqfjn54u4h080jm', '192.168.7.1', 1669883521, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393838333532313B);
INSERT INTO `cbt_sessions` VALUES ('be916fvu4jcee2rj44ph8h8pvabmb76p', '192.168.7.1', 1669939485, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393933393437323B);
INSERT INTO `cbt_sessions` VALUES ('cgqshlfa6kbr4aucmes2c3io3gaoslqd', '192.168.7.1', 1669935991, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393933353939313B);
INSERT INTO `cbt_sessions` VALUES ('de0hve5mb1q1opgiggnhq2mvhmtkimep', '192.168.7.3', 1653635770, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333633353730353B6362745F757365725F69647C733A353A2261646D696E223B6362745F6E616D617C733A31333A2241646D696E6973747261746F72223B6362745F6C6576656C7C733A353A2261646D696E223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B);
INSERT INTO `cbt_sessions` VALUES ('df7j61o167qq9likr37qrm32b5c979a9', '::1', 1678182822, 0x5F5F63695F6C6173745F726567656E65726174657C693A313637383138323832323B6362745F757365725F69647C733A353A2261646D696E223B6362745F6E616D617C733A31333A2241646D696E6973747261746F72223B6362745F6C6576656C7C733A353A2261646D696E223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B);
INSERT INTO `cbt_sessions` VALUES ('gjt2q7ci3dpr9oma1iio8m3s9udbhqln', '192.168.7.1', 1669939869, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393933393836393B);
INSERT INTO `cbt_sessions` VALUES ('gpg7vvfpkd9bfecui6fkm3j3j1dgbv7u', '192.168.7.3', 1653635705, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333633353730353B6362745F757365725F69647C733A353A2261646D696E223B6362745F6E616D617C733A31333A2241646D696E6973747261746F72223B6362745F6C6576656C7C733A353A2261646D696E223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B);
INSERT INTO `cbt_sessions` VALUES ('h4issrtki6mfnombf5291a0hc6i8v5j5', '192.168.7.1', 1669934308, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393933343330383B);
INSERT INTO `cbt_sessions` VALUES ('ipn15ndmlu345llm91p58b4dk1ujekej', '::1', 1653635791, 0x5F5F63695F6C6173745F726567656E65726174657C693A313635333633353637383B);
INSERT INTO `cbt_sessions` VALUES ('jcmhjdarfbvbf413h3a53vhi7m527dqc', '192.168.7.1', 1669903565, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393930333536353B);
INSERT INTO `cbt_sessions` VALUES ('ldm0t1ardjstno7s7n314it8vtk0s43g', '192.168.7.1', 1669938982, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393933383938323B);
INSERT INTO `cbt_sessions` VALUES ('litqfd3gcsaeuau15uonr1ghm706bg6r', '192.168.7.1', 1669883605, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393838333630353B);
INSERT INTO `cbt_sessions` VALUES ('o0ppstjqe43vb4iul3fcesnr0uah14qa', '192.168.7.2', 1669878200, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393837383230303B);
INSERT INTO `cbt_sessions` VALUES ('ofk71te5klns0iph86hqp169hve81icl', '192.168.7.1', 1669904809, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393930343830393B);
INSERT INTO `cbt_sessions` VALUES ('sl4v545sr3tt4iv64t14vjp3cvasj9he', '::1', 1678183357, 0x5F5F63695F6C6173745F726567656E65726174657C693A313637383138333133303B6362745F757365725F69647C733A353A2261646D696E223B6362745F6E616D617C733A31333A2241646D696E6973747261746F72223B6362745F6C6576656C7C733A353A2261646D696E223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B);
INSERT INTO `cbt_sessions` VALUES ('tfb9rpskadei0e1s5se3vvg5f1ng8rb3', '::1', 1669877746, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393837373734363B6362745F757365725F69647C733A353A2261646D696E223B6362745F6E616D617C733A31333A2241646D696E6973747261746F72223B6362745F6C6576656C7C733A353A2261646D696E223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B);
INSERT INTO `cbt_sessions` VALUES ('uo46tver232r9109f64m5lvjg2bihn4j', '::1', 1646727182, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634363732373031333B6362745F757365725F69647C733A353A2261646D696E223B6362745F6E616D617C733A31333A2241646D696E6973747261746F72223B6362745F6C6576656C7C733A353A2261646D696E223B6362745F6F707369317C733A303A22223B6362745F6F707369327C733A303A22223B);
INSERT INTO `cbt_sessions` VALUES ('v0aoqp4vjnrvit9ltt1riuro3hdpe59p', '192.168.7.1', 1669937996, 0x5F5F63695F6C6173745F726567656E65726174657C693A313636393933373939363B);

-- ----------------------------
-- Table structure for cbt_soal
-- ----------------------------
DROP TABLE IF EXISTS `cbt_soal`;
CREATE TABLE `cbt_soal`  (
  `soal_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `soal_topik_id` bigint UNSIGNED NOT NULL,
  `soal_detail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `soal_tipe` smallint UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Pilihan ganda, 2=essay, 3=jawaban singkat',
  `soal_kunci` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT 'Kunci untuk soal jawaban singkat',
  `soal_difficulty` smallint NOT NULL DEFAULT 1,
  `soal_aktif` tinyint(1) NOT NULL DEFAULT 0,
  `soal_audio` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `soal_audio_play` int NOT NULL DEFAULT 0,
  `soal_timer` smallint NULL DEFAULT NULL,
  `soal_inline_answers` tinyint(1) NOT NULL DEFAULT 0,
  `soal_auto_next` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`soal_id`) USING BTREE,
  INDEX `p_question_subject_id`(`soal_topik_id`) USING BTREE,
  CONSTRAINT `cbt_soal_ibfk_1` FOREIGN KEY (`soal_topik_id`) REFERENCES `cbt_topik` (`topik_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 215 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_soal
-- ----------------------------

-- ----------------------------
-- Table structure for cbt_tes
-- ----------------------------
DROP TABLE IF EXISTS `cbt_tes`;
CREATE TABLE `cbt_tes`  (
  `tes_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tes_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tes_detail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tes_begin_time` datetime NULL DEFAULT NULL,
  `tes_end_time` datetime NULL DEFAULT NULL,
  `tes_duration_time` smallint UNSIGNED NOT NULL DEFAULT 0,
  `tes_ip_range` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '*.*.*.*',
  `tes_results_to_users` tinyint(1) NOT NULL DEFAULT 0,
  `tes_detail_to_users` tinyint(1) NOT NULL DEFAULT 0,
  `tes_score_right` decimal(10, 2) NULL DEFAULT 1.00,
  `tes_score_wrong` decimal(10, 2) NULL DEFAULT 0.00,
  `tes_score_unanswered` decimal(10, 2) NULL DEFAULT 0.00,
  `tes_max_score` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `tes_token` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`tes_id`) USING BTREE,
  UNIQUE INDEX `ak_test_name`(`tes_nama`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_tes
-- ----------------------------

-- ----------------------------
-- Table structure for cbt_tes_soal
-- ----------------------------
DROP TABLE IF EXISTS `cbt_tes_soal`;
CREATE TABLE `cbt_tes_soal`  (
  `tessoal_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tessoal_tesuser_id` bigint UNSIGNED NOT NULL,
  `tessoal_user_ip` varchar(39) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `tessoal_soal_id` bigint UNSIGNED NOT NULL,
  `tessoal_jawaban_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `tessoal_nilai` decimal(10, 2) NULL DEFAULT NULL,
  `tessoal_creation_time` datetime NULL DEFAULT NULL,
  `tessoal_display_time` datetime NULL DEFAULT NULL,
  `tessoal_change_time` datetime NULL DEFAULT NULL,
  `tessoal_reaction_time` bigint UNSIGNED NOT NULL DEFAULT 0,
  `tessoal_ragu` int NOT NULL DEFAULT 0 COMMENT '1=ragu, 0=tidak ragu',
  `tessoal_order` smallint NOT NULL DEFAULT 1,
  `tessoal_num_answers` smallint UNSIGNED NOT NULL DEFAULT 0,
  `tessoal_comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `tessoal_audio_play` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`tessoal_id`) USING BTREE,
  UNIQUE INDEX `ak_testuser_question`(`tessoal_tesuser_id`, `tessoal_soal_id`) USING BTREE,
  INDEX `p_testlog_question_id`(`tessoal_soal_id`) USING BTREE,
  INDEX `p_testlog_testuser_id`(`tessoal_tesuser_id`) USING BTREE,
  CONSTRAINT `cbt_tes_soal_ibfk_1` FOREIGN KEY (`tessoal_tesuser_id`) REFERENCES `cbt_tes_user` (`tesuser_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cbt_tes_soal_ibfk_2` FOREIGN KEY (`tessoal_soal_id`) REFERENCES `cbt_soal` (`soal_id`) ON DELETE RESTRICT ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_tes_soal
-- ----------------------------

-- ----------------------------
-- Table structure for cbt_tes_soal_jawaban
-- ----------------------------
DROP TABLE IF EXISTS `cbt_tes_soal_jawaban`;
CREATE TABLE `cbt_tes_soal_jawaban`  (
  `soaljawaban_tessoal_id` bigint UNSIGNED NOT NULL,
  `soaljawaban_jawaban_id` bigint UNSIGNED NOT NULL,
  `soaljawaban_selected` smallint NOT NULL DEFAULT -1,
  `soaljawaban_order` smallint NOT NULL DEFAULT 1,
  `soaljawaban_position` bigint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`soaljawaban_tessoal_id`, `soaljawaban_jawaban_id`) USING BTREE,
  INDEX `p_logansw_answer_id`(`soaljawaban_jawaban_id`) USING BTREE,
  INDEX `p_logansw_testlog_id`(`soaljawaban_tessoal_id`) USING BTREE,
  CONSTRAINT `cbt_tes_soal_jawaban_ibfk_1` FOREIGN KEY (`soaljawaban_tessoal_id`) REFERENCES `cbt_tes_soal` (`tessoal_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cbt_tes_soal_jawaban_ibfk_2` FOREIGN KEY (`soaljawaban_jawaban_id`) REFERENCES `cbt_jawaban` (`jawaban_id`) ON DELETE RESTRICT ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_tes_soal_jawaban
-- ----------------------------

-- ----------------------------
-- Table structure for cbt_tes_token
-- ----------------------------
DROP TABLE IF EXISTS `cbt_tes_token`;
CREATE TABLE `cbt_tes_token`  (
  `token_id` int NOT NULL AUTO_INCREMENT,
  `token_isi` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `token_user_id` int NOT NULL,
  `token_ts` timestamp NOT NULL DEFAULT current_timestamp,
  `token_aktif` int NOT NULL DEFAULT 1 COMMENT 'Umur Token dalam menit, 1 = 1 hari penuh',
  `token_tes_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`token_id`) USING BTREE,
  INDEX `token_user_id`(`token_user_id`) USING BTREE,
  CONSTRAINT `cbt_tes_token_ibfk_1` FOREIGN KEY (`token_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_tes_token
-- ----------------------------

-- ----------------------------
-- Table structure for cbt_tes_topik_set
-- ----------------------------
DROP TABLE IF EXISTS `cbt_tes_topik_set`;
CREATE TABLE `cbt_tes_topik_set`  (
  `tset_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tset_tes_id` bigint UNSIGNED NOT NULL,
  `tset_topik_id` bigint UNSIGNED NOT NULL,
  `tset_tipe` smallint NOT NULL DEFAULT 1,
  `tset_difficulty` smallint NOT NULL DEFAULT 1,
  `tset_jumlah` smallint NOT NULL DEFAULT 1,
  `tset_jawaban` smallint NOT NULL DEFAULT 0,
  `tset_acak_jawaban` int NOT NULL DEFAULT 1,
  `tset_acak_soal` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`tset_id`) USING BTREE,
  INDEX `p_tsubset_test_id`(`tset_tes_id`) USING BTREE,
  INDEX `tsubset_subject_id`(`tset_topik_id`) USING BTREE,
  CONSTRAINT `cbt_tes_topik_set_ibfk_1` FOREIGN KEY (`tset_tes_id`) REFERENCES `cbt_tes` (`tes_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cbt_tes_topik_set_ibfk_2` FOREIGN KEY (`tset_topik_id`) REFERENCES `cbt_topik` (`topik_id`) ON DELETE RESTRICT ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_tes_topik_set
-- ----------------------------

-- ----------------------------
-- Table structure for cbt_tes_user
-- ----------------------------
DROP TABLE IF EXISTS `cbt_tes_user`;
CREATE TABLE `cbt_tes_user`  (
  `tesuser_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tesuser_tes_id` bigint UNSIGNED NOT NULL,
  `tesuser_user_id` bigint UNSIGNED NOT NULL,
  `tesuser_status` smallint UNSIGNED NOT NULL DEFAULT 0,
  `tesuser_creation_time` datetime NOT NULL,
  `tesuser_comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `tesuser_token` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tesuser_id`) USING BTREE,
  UNIQUE INDEX `ak_testuser`(`tesuser_tes_id`, `tesuser_user_id`, `tesuser_status`) USING BTREE,
  INDEX `p_testuser_user_id`(`tesuser_user_id`) USING BTREE,
  INDEX `p_testuser_test_id`(`tesuser_tes_id`) USING BTREE,
  CONSTRAINT `cbt_tes_user_ibfk_1` FOREIGN KEY (`tesuser_tes_id`) REFERENCES `cbt_tes` (`tes_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cbt_tes_user_ibfk_2` FOREIGN KEY (`tesuser_user_id`) REFERENCES `cbt_user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_tes_user
-- ----------------------------

-- ----------------------------
-- Table structure for cbt_tesgrup
-- ----------------------------
DROP TABLE IF EXISTS `cbt_tesgrup`;
CREATE TABLE `cbt_tesgrup`  (
  `tstgrp_tes_id` bigint UNSIGNED NOT NULL,
  `tstgrp_grup_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`tstgrp_tes_id`, `tstgrp_grup_id`) USING BTREE,
  INDEX `p_tstgrp_test_id`(`tstgrp_tes_id`) USING BTREE,
  INDEX `p_tstgrp_group_id`(`tstgrp_grup_id`) USING BTREE,
  CONSTRAINT `cbt_tesgrup_ibfk_1` FOREIGN KEY (`tstgrp_tes_id`) REFERENCES `cbt_tes` (`tes_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cbt_tesgrup_ibfk_2` FOREIGN KEY (`tstgrp_grup_id`) REFERENCES `cbt_user_grup` (`grup_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_tesgrup
-- ----------------------------

-- ----------------------------
-- Table structure for cbt_topik
-- ----------------------------
DROP TABLE IF EXISTS `cbt_topik`;
CREATE TABLE `cbt_topik`  (
  `topik_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `topik_modul_id` bigint UNSIGNED NOT NULL DEFAULT 1,
  `topik_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `topik_detail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `topik_aktif` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`topik_id`) USING BTREE,
  UNIQUE INDEX `ak_subject_name`(`topik_modul_id`, `topik_nama`) USING BTREE,
  CONSTRAINT `cbt_topik_ibfk_1` FOREIGN KEY (`topik_modul_id`) REFERENCES `cbt_modul` (`modul_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 407 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_topik
-- ----------------------------
INSERT INTO `cbt_topik` VALUES (101, 1, '10 Pendidikan Agama dan Budi Pekerti', '10 Pendidikan Agama dan Budi Pekerti', 0);
INSERT INTO `cbt_topik` VALUES (102, 1, '10 Pendidikan Pancasila', '10 PPKn', 0);
INSERT INTO `cbt_topik` VALUES (103, 1, '10 Bahasa Indonesia', '10 Bahasa Indonesia', 0);
INSERT INTO `cbt_topik` VALUES (104, 1, '10 Matematika', '10 Matematika Wajib', 0);
INSERT INTO `cbt_topik` VALUES (105, 1, '10 Sejarah', '10 Sejarah Indonesia', 0);
INSERT INTO `cbt_topik` VALUES (106, 1, '10 Bahasa Inggris', '10 Bahasa Inggris', 0);
INSERT INTO `cbt_topik` VALUES (107, 1, '10 Seni Budaya', '10 Seni Budaya', 0);
INSERT INTO `cbt_topik` VALUES (108, 1, '10 PJOK', '10 PJOK', 0);
INSERT INTO `cbt_topik` VALUES (109, 1, '10 PKWU', '10 PKWU', 0);
INSERT INTO `cbt_topik` VALUES (110, 1, '10 Bahasa Sunda', '10 Bahasa Sunda', 0);
INSERT INTO `cbt_topik` VALUES (112, 1, '10 Biologi', '10 Biologi', 0);
INSERT INTO `cbt_topik` VALUES (113, 1, '10 Fisika', '10 Fisika', 0);
INSERT INTO `cbt_topik` VALUES (114, 1, '10 Kimia', '10 Kimia', 0);
INSERT INTO `cbt_topik` VALUES (115, 1, '10 Geografi', '10 Geografi', 0);
INSERT INTO `cbt_topik` VALUES (117, 1, '10 Sosiologi', '10 Sosiologi', 0);
INSERT INTO `cbt_topik` VALUES (118, 1, '10 Ekonomi', '10 Ekonomi', 0);
INSERT INTO `cbt_topik` VALUES (121, 1, '10 Informatika', '10 Informatika', 0);
INSERT INTO `cbt_topik` VALUES (201, 2, '11 Pendidikan Agama dan Budi Pekerti', '11 Pendidikan Agama dan Budi Pekerti', 0);
INSERT INTO `cbt_topik` VALUES (202, 2, '11 PPKn', '11 PPKn', 0);
INSERT INTO `cbt_topik` VALUES (203, 2, '11 Bahasa Indonesia', '11 Bahasa Indonesia', 0);
INSERT INTO `cbt_topik` VALUES (204, 2, '11 Matematika Wajib', '11 Matematika Wajib', 0);
INSERT INTO `cbt_topik` VALUES (205, 2, '11 Sejarah Indonesia', '11 Sejarah Indonesia', 0);
INSERT INTO `cbt_topik` VALUES (206, 2, '11 Bahasa Inggris', '11 Bahasa Inggris', 0);
INSERT INTO `cbt_topik` VALUES (207, 2, '11 Seni Budaya', '11 Seni Budaya', 0);
INSERT INTO `cbt_topik` VALUES (208, 2, '11 PJOK', '11 PJOK', 0);
INSERT INTO `cbt_topik` VALUES (209, 2, '11 PKWU', '11 PKWU', 0);
INSERT INTO `cbt_topik` VALUES (210, 2, '11 Bahasa Sunda', '11 Bahasa Sunda', 0);
INSERT INTO `cbt_topik` VALUES (211, 2, '11 Matematika Minat', '11 Matematika Minat', 0);
INSERT INTO `cbt_topik` VALUES (212, 2, '11 Biologi', '11 Biologi', 0);
INSERT INTO `cbt_topik` VALUES (213, 2, '11 Fisika', '11 Fisika', 0);
INSERT INTO `cbt_topik` VALUES (214, 2, '11 Kimia', '11 Kimia', 0);
INSERT INTO `cbt_topik` VALUES (215, 2, '11 Geografi', '11 Geografi', 0);
INSERT INTO `cbt_topik` VALUES (216, 2, '11 Sejarah Minat', '11 Sejarah Minat', 0);
INSERT INTO `cbt_topik` VALUES (217, 2, '11 Sosiologi', '11 Sosiologi', 0);
INSERT INTO `cbt_topik` VALUES (218, 2, '11 Ekonomi', '11 Ekonomi', 0);
INSERT INTO `cbt_topik` VALUES (219, 2, '11 Bahasa dan Sastra Inggris', '11 Bahasa dan Sastra Inggris', 0);
INSERT INTO `cbt_topik` VALUES (220, 2, '11 Bahasa dan Sastra Jepang', '11 Bahasa dan Sastra Jepang', 0);
INSERT INTO `cbt_topik` VALUES (221, 2, '11 Informatika', '11 Informatika', 0);
INSERT INTO `cbt_topik` VALUES (301, 3, '12 Pendidikan Agama dan Budi Pekerti [PG]', '12 Pendidikan Agama dan Budi Pekerti [PG]', 1);
INSERT INTO `cbt_topik` VALUES (302, 3, '12 PPKn [PG]', '12 PPKn [PG]', 1);
INSERT INTO `cbt_topik` VALUES (303, 3, '12 Bahasa Indonesia [PG]', '12 Bahasa Indonesia [PG]', 1);
INSERT INTO `cbt_topik` VALUES (304, 3, '12 Matematika Wajib [PG]', '12 Matematika Wajib [PG]', 1);
INSERT INTO `cbt_topik` VALUES (305, 3, '12 Sejarah Indonesia [PG]', '12 Sejarah Indonesia [PG]', 1);
INSERT INTO `cbt_topik` VALUES (306, 3, '12 Bahasa Inggris [PG]', '12 Bahasa Inggris [PG]', 1);
INSERT INTO `cbt_topik` VALUES (307, 3, '12 Seni Budaya [PG]', '12 Seni Budaya [PG]', 1);
INSERT INTO `cbt_topik` VALUES (308, 3, '12 PJOK [PG]', '12 PJOK [PG]', 1);
INSERT INTO `cbt_topik` VALUES (309, 3, '12 PKWU [PG]', '12 PKWU [PG]', 1);
INSERT INTO `cbt_topik` VALUES (310, 3, '12 Bahasa Sunda [PG]', '12 Bahasa Sunda [PG]', 1);
INSERT INTO `cbt_topik` VALUES (311, 3, '12 Matematika Minat [PG]', '12 Matematika Minat [PG]', 1);
INSERT INTO `cbt_topik` VALUES (312, 3, '12 Biologi [PG]', '12 Biologi [PG]', 1);
INSERT INTO `cbt_topik` VALUES (313, 3, '12 Fisika [PG]', '12 Fisika [PG]', 1);
INSERT INTO `cbt_topik` VALUES (314, 3, '12 Kimia [PG]', '12 Kimia [PG]', 1);
INSERT INTO `cbt_topik` VALUES (315, 3, '12 Geografi [PG]', '12 Geografi [PG]', 1);
INSERT INTO `cbt_topik` VALUES (316, 3, '12 Sejarah Minat [PG]', '12 Sejarah Minat [PG]', 1);
INSERT INTO `cbt_topik` VALUES (317, 3, '12 Sosiologi [PG]', '12 Sosiologi [PG]', 1);
INSERT INTO `cbt_topik` VALUES (318, 3, '12 Ekonomi [PG]', '12 Ekonomi [PG]', 1);
INSERT INTO `cbt_topik` VALUES (319, 3, '12 Bahasa dan Sastra Inggris [PG]', '12 Bahasa dan Sastra Inggris [PG]', 1);
INSERT INTO `cbt_topik` VALUES (320, 3, '12 Bahasa dan Sastra Jepang [PG]', '12 Bahasa dan Sastra Jepang [PG]', 1);
INSERT INTO `cbt_topik` VALUES (321, 3, '12 Informatika [PG]', '12 Informatika [PG]', 1);
INSERT INTO `cbt_topik` VALUES (331, 3, '12 Pendidikan Agama dan Budi Pekerti [Essay]', '12 Pendidikan Agama dan Budi Pekerti [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (332, 3, '12 PPKn [Essay]', '12 PPKn [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (333, 3, '12 Bahasa Indonesia [Essay]', '12 Bahasa Indonesia [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (334, 3, '12 Matematika Wajib [Essay]', '12 Matematika Wajib [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (335, 3, '12 Sejarah Indonesia [Essay]', '12 Sejarah Indonesia [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (336, 3, '12 Bahasa Inggris [Essay]', '12 Bahasa Inggris [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (337, 3, '12 Seni Budaya [Essay]', '12 Seni Budaya [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (338, 3, '12 PJOK [Essay]', '12 PJOK [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (339, 3, '12 PKWU [Essay]', '12 PKWU [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (340, 3, '12 Bahasa Sunda [Essay]', '12 Bahasa Sunda [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (341, 3, '12 Matematika Minat [Essay]', '12 Matematika Minat [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (342, 3, '12 Biologi [Essay]', '12 Biologi [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (343, 3, '12 Fisika [Essay]', '12 Fisika [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (344, 3, '12 Kimia [Essay]', '12 Kimia [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (345, 3, '12 Geografi [Essay]', '12 Geografi [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (346, 3, '12 Sejarah Minat [Essay]', '12 Sejarah Minat [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (347, 3, '12 Sosiologi [Essay]', '12 Sosiologi [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (348, 3, '12 Ekonomi [Essay]', '12 Ekonomi [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (349, 3, '12 Bahasa dan Sastra Inggris [Essay]', '12 Bahasa dan Sastra Inggris [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (350, 3, '12 Bahasa dan Sastra Jepang [Essay]', '12 Bahasa dan Sastra Jepang [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (351, 3, '12 Informatika [Essay]', '12 Informatika [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (401, 3, 'Simulasi 1 [PG]', 'Simulasi 1 [PG]', 1);
INSERT INTO `cbt_topik` VALUES (402, 3, 'Simulasi 1 [Essay]', 'Simulasi 1 [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (403, 3, 'Simulasi 2 [PG]', 'Simulasi 2 [PG]', 1);
INSERT INTO `cbt_topik` VALUES (404, 3, 'Simulasi 2 [Essay]', 'Simulasi 2 [Essay]', 1);
INSERT INTO `cbt_topik` VALUES (405, 3, 'Simulasi 3 [PG]', 'Simulasi 3 [PG]', 1);
INSERT INTO `cbt_topik` VALUES (406, 3, 'Simulasi 3 [Essay]', 'Simulasi 3 [Essay]', 1);

-- ----------------------------
-- Table structure for cbt_user
-- ----------------------------
DROP TABLE IF EXISTS `cbt_user`;
CREATE TABLE `cbt_user`  (
  `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_grup_id` bigint UNSIGNED NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_regdate` timestamp NOT NULL DEFAULT current_timestamp,
  `user_ip` varchar(39) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_firstname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_birthdate` date NULL DEFAULT NULL,
  `user_birthplace` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_level` smallint UNSIGNED NOT NULL DEFAULT 1,
  `user_detail` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `ak_user_name`(`user_name`) USING BTREE,
  INDEX `user_groups_id`(`user_grup_id`) USING BTREE,
  INDEX `user_detail`(`user_detail`) USING BTREE,
  CONSTRAINT `cbt_user_ibfk_1` FOREIGN KEY (`user_grup_id`) REFERENCES `cbt_user_grup` (`grup_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 2003 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_user
-- ----------------------------
INSERT INTO `cbt_user` VALUES (677, 101, '222310001', '1294651', '222310001@gmail.com', '2023-03-07 17:01:26', NULL, 'Abdullah Margani Junior', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (678, 101, '222310002', '6458380', '222310002@gmail.com', '2023-03-07 17:01:26', NULL, 'Auldri Ulma Ramadhani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (679, 101, '222310003', '3062039', '222310003@gmail.com', '2023-03-07 17:01:26', NULL, 'Aulia Virganita Sari', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (680, 101, '222310004', '5721856', '222310004@gmail.com', '2023-03-07 17:01:26', NULL, 'Chesya Aliya Syahnira F.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (681, 101, '222310005', '9927775', '222310005@gmail.com', '2023-03-07 17:01:26', NULL, 'Deaneu Juwita Salsabil A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (682, 101, '222310006', '5389232', '222310006@gmail.com', '2023-03-07 17:01:26', NULL, 'Dian Aulia Putri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (683, 101, '222310007', '5024477', '222310007@gmail.com', '2023-03-07 17:01:26', NULL, 'Elma Marcella', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (684, 101, '222310008', '1829690', '222310008@gmail.com', '2023-03-07 17:01:26', NULL, 'Fahreza Raya Kusumanegara', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (685, 101, '222310009', '4084494', '222310009@gmail.com', '2023-03-07 17:01:26', NULL, 'Farrel Fatihul Fawwaz', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (686, 101, '222310010', '8277514', '222310010@gmail.com', '2023-03-07 17:01:26', NULL, 'Ghadiza Nazwatul F.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (687, 101, '222310011', '8851621', '222310011@gmail.com', '2023-03-07 17:01:26', NULL, 'Ghiania Putri Ramadhani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (688, 101, '222310012', '6720753', '222310012@gmail.com', '2023-03-07 17:01:26', NULL, 'Hafizh Alif Fakhritama', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (689, 101, '222310013', '9607889', '222310013@gmail.com', '2023-03-07 17:01:26', NULL, 'Hanny Mariani Simanjuntak', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (690, 101, '222310014', '2714738', '222310014@gmail.com', '2023-03-07 17:01:26', NULL, 'Jihan Nazwa Lestari', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (691, 101, '222310015', '258764', '222310015@gmail.com', '2023-03-07 17:01:27', NULL, 'Krisnha Ahmad Fadhilah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (692, 101, '222310016', '8287997', '222310016@gmail.com', '2023-03-07 17:01:27', NULL, 'Lutya Aprianatul Ahwal', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (693, 101, '222310017', '3329934', '222310017@gmail.com', '2023-03-07 17:01:27', NULL, 'M Dzulfikri Alghifari', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (694, 101, '222310018', '4006482', '222310018@gmail.com', '2023-03-07 17:01:27', NULL, 'M. Syafik Maulana P. R.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (695, 101, '222310019', '848360', '222310019@gmail.com', '2023-03-07 17:01:27', NULL, 'Mochammad Evan Abigail', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (696, 101, '222310020', '1394038', '222310020@gmail.com', '2023-03-07 17:01:27', NULL, 'Muhamad Razaidan Pasa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (697, 101, '222310021', '8761289', '222310021@gmail.com', '2023-03-07 17:01:27', NULL, 'Muhammad Aldo Ramdhano', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (698, 101, '222310022', '378891', '222310022@gmail.com', '2023-03-07 17:01:27', NULL, 'Muhammad Barik Al-Ghaniy', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (699, 101, '222310023', '9860860', '222310023@gmail.com', '2023-03-07 17:01:27', NULL, 'Muhammad Haiqal Firdaus', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (700, 101, '222310024', '7109315', '222310024@gmail.com', '2023-03-07 17:01:27', NULL, 'Nadhira Azzahra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (701, 101, '222310025', '1860894', '222310025@gmail.com', '2023-03-07 17:01:27', NULL, 'Najla Nada Salsabilla', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (702, 101, '222310026', '1533422', '222310026@gmail.com', '2023-03-07 17:01:27', NULL, 'Olive Monica Siregar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (703, 101, '222310027', '8861977', '222310027@gmail.com', '2023-03-07 17:01:27', NULL, 'Raisya Alexandra Azzahra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (704, 101, '222310028', '4932129', '222310028@gmail.com', '2023-03-07 17:01:27', NULL, 'Ramdhan Dzulqarnain', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (705, 101, '222310029', '8353821', '222310029@gmail.com', '2023-03-07 17:01:27', NULL, 'Regyna Lailatul Guntur', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (706, 101, '222310030', '938172', '222310030@gmail.com', '2023-03-07 17:01:27', NULL, 'Sabila Nur Izzati', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (707, 101, '222310031', '5548141', '222310031@gmail.com', '2023-03-07 17:01:27', NULL, 'Sandy Efrisa Ardian', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (708, 101, '222310032', '9938211', '222310032@gmail.com', '2023-03-07 17:01:27', NULL, 'Sefira Stevani Ramadani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (709, 101, '222310033', '9281728', '222310033@gmail.com', '2023-03-07 17:01:27', NULL, 'Sintia Nurmaharani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (710, 101, '222310034', '2974392', '222310034@gmail.com', '2023-03-07 17:01:27', NULL, 'Suci Akmalia Novianti', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (711, 101, '222310035', '9771890', '222310035@gmail.com', '2023-03-07 17:01:27', NULL, 'Syafira Intan Kumala N.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (712, 101, '222310036', '2226154', '222310036@gmail.com', '2023-03-07 17:01:28', NULL, 'Syahril Taqi Billal', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (713, 101, '222310037', '6717218', '222310037@gmail.com', '2023-03-07 17:01:28', NULL, 'Vina Vindya Fathan ', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (714, 101, '222310038', '9595972', '222310038@gmail.com', '2023-03-07 17:01:28', NULL, 'Winandya Khaerunisa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (715, 101, '222310039', '233089', '222310039@gmail.com', '2023-03-07 17:01:28', NULL, 'Xena Apriliyanti', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (716, 110, '222310350', '1407841', '222310350@gmail.com', '2023-03-07 17:01:28', NULL, 'Alya Oktavia Ramadani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (717, 110, '222310351', '9523197', '222310351@gmail.com', '2023-03-07 17:01:28', NULL, 'Aprillia Nur Rahmah S.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (718, 110, '222310352', '1731520', '222310352@gmail.com', '2023-03-07 17:01:28', NULL, 'Azmi Anugrah Ismayani P.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (719, 110, '222310353', '7749867', '222310353@gmail.com', '2023-03-07 17:01:28', NULL, 'Davina Bilbina', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (720, 110, '222310354', '814925', '222310354@gmail.com', '2023-03-07 17:01:28', NULL, 'Dhirgham Mallorca', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (721, 110, '222310355', '3964823', '222310355@gmail.com', '2023-03-07 17:01:28', NULL, 'Dikrifa Auliya Rossa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (722, 110, '222310356', '9182724', '222310356@gmail.com', '2023-03-07 17:01:28', NULL, 'Galang Alfarezzi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (723, 110, '222310357', '6191949', '222310357@gmail.com', '2023-03-07 17:01:28', NULL, 'Gannes Mufti Kamil', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (724, 110, '222310358', '5718618', '222310358@gmail.com', '2023-03-07 17:01:28', NULL, 'Hasni Nurrahmi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (725, 110, '222310360', '6265077', '222310360@gmail.com', '2023-03-07 17:01:28', NULL, 'Indira Indah Prameswari', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (726, 110, '222310361', '8150010', '222310361@gmail.com', '2023-03-07 17:01:28', NULL, 'M. Adhwa Athallah T. A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (727, 110, '222310362', '1557008', '222310362@gmail.com', '2023-03-07 17:01:28', NULL, 'M. Ezzailly Ad Dzikry', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (728, 110, '222310467', '6418837', '222310467@gmail.com', '2023-03-07 17:01:28', NULL, 'Makayla Anezka G. P.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (729, 110, '222310363', '2907074', '222310363@gmail.com', '2023-03-07 17:01:29', NULL, 'Marsya Denia Rahayu', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (730, 110, '222310364', '9585473', '222310364@gmail.com', '2023-03-07 17:01:29', NULL, 'Mesha Nuseptia Raihan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (731, 110, '222310365', '5406989', '222310365@gmail.com', '2023-03-07 17:01:29', NULL, 'Moh Afdal H Hambali', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (732, 110, '222310366', '5564494', '222310366@gmail.com', '2023-03-07 17:01:29', NULL, 'Much Daffa S. A. An Naja', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (733, 110, '222310367', '7841175', '222310367@gmail.com', '2023-03-07 17:01:29', NULL, 'Mufida Azka Sholihah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (734, 110, '222310368', '1851320', '222310368@gmail.com', '2023-03-07 17:01:29', NULL, 'Muhamad Dhera Pradita Y.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (735, 110, '222310369', '7828260', '222310369@gmail.com', '2023-03-07 17:01:29', NULL, 'Muhamad Zidan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (736, 110, '222310370', '8309688', '222310370@gmail.com', '2023-03-07 17:01:29', NULL, 'Muhammad Fadhli', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (737, 110, '222310371', '2295011', '222310371@gmail.com', '2023-03-07 17:01:29', NULL, 'Muhammad Tarmiji A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (738, 110, '222310372', '7451481', '222310372@gmail.com', '2023-03-07 17:01:29', NULL, 'Muthira Batrisyia Nazifa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (739, 110, '222310373', '3751593', '222310373@gmail.com', '2023-03-07 17:01:29', NULL, 'Naila Zahira Shofy', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (740, 110, '222310374', '2112631', '222310374@gmail.com', '2023-03-07 17:01:29', NULL, 'Nazriel Hanzhalah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (741, 110, '222310375', '2307339', '222310375@gmail.com', '2023-03-07 17:01:29', NULL, 'Nisrina Mu\\\'Adzah Pranesti', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (742, 110, '222310376', '6940200', '222310376@gmail.com', '2023-03-07 17:01:29', NULL, 'Rahmah Nur Insani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (743, 110, '222310377', '3833940', '222310377@gmail.com', '2023-03-07 17:01:29', NULL, 'Raka Gibrana Al-Ghifari', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (744, 110, '222310378', '3554822', '222310378@gmail.com', '2023-03-07 17:01:29', NULL, 'Ratu Aulia Az Zahra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (745, 110, '222310379', '9709528', '222310379@gmail.com', '2023-03-07 17:01:29', NULL, 'Ratu Shera Chantika Y.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (746, 110, '222310380', '8285610', '222310380@gmail.com', '2023-03-07 17:01:29', NULL, 'Raya Aisya Ayu', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (747, 110, '222310381', '3336453', '222310381@gmail.com', '2023-03-07 17:01:29', NULL, 'Rianti', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (748, 110, '222310382', '8596551', '222310382@gmail.com', '2023-03-07 17:01:30', NULL, 'Rizky Widjan Prasetyo', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (749, 110, '222310383', '2327404', '222310383@gmail.com', '2023-03-07 17:01:30', NULL, 'Salwa Tri Intan Rahayu', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (750, 110, '222310384', '3347535', '222310384@gmail.com', '2023-03-07 17:01:30', NULL, 'Shelomita A. Muta\\\'ali H.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (751, 110, '222310385', '3057683', '222310385@gmail.com', '2023-03-07 17:01:30', NULL, 'Syifa Shaumayyaningtyas', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (752, 110, '222310386', '5978858', '222310386@gmail.com', '2023-03-07 17:01:30', NULL, 'Wildan Zain Lesmana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (753, 110, '222310387', '6913040', '222310387@gmail.com', '2023-03-07 17:01:30', NULL, 'Zayyan M. Khairul Muna', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (754, 111, '222310388', '5423437', '222310388@gmail.com', '2023-03-07 17:01:30', NULL, 'Aliya Nurwanda', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (755, 111, '222310389', '8097319', '222310389@gmail.com', '2023-03-07 17:01:30', NULL, 'Alya Pratama Kurniawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (756, 111, '222310390', '7240632', '222310390@gmail.com', '2023-03-07 17:01:30', NULL, 'Alya Rahma Giani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (757, 111, '222310391', '5776175', '222310391@gmail.com', '2023-03-07 17:01:30', NULL, 'Ardelian Restu Fahra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (758, 111, '222310392', '4571305', '222310392@gmail.com', '2023-03-07 17:01:30', NULL, 'Asma Athaya Nur Sahara', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (759, 111, '222310393', '6691874', '222310393@gmail.com', '2023-03-07 17:01:30', NULL, 'Axel Naufal Abieza', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (760, 111, '222310394', '640721', '222310394@gmail.com', '2023-03-07 17:01:30', NULL, 'Bella Chintya Balqis', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (761, 111, '222310395', '4739810', '222310395@gmail.com', '2023-03-07 17:01:30', NULL, 'Bilqis Nabila Leksaputri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (762, 111, '222310396', '7733042', '222310396@gmail.com', '2023-03-07 17:01:30', NULL, 'Diana Jelita Fahrani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (763, 111, '222310397', '8281904', '222310397@gmail.com', '2023-03-07 17:01:31', NULL, 'Diaz Keyzanov G. H.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (764, 111, '222310398', '2614342', '222310398@gmail.com', '2023-03-07 17:01:31', NULL, 'Divya Ratu Fattahiyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (765, 111, '222310399', '6294545', '222310399@gmail.com', '2023-03-07 17:01:31', NULL, 'Fawaz Azzamzami Nugraha', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (766, 111, '222310400', '5572198', '222310400@gmail.com', '2023-03-07 17:01:31', NULL, 'Firli Pradila Hadiansah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (767, 111, '222310401', '6741457', '222310401@gmail.com', '2023-03-07 17:01:31', NULL, 'Galih Sultani Mustari', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (768, 111, '222310402', '6208956', '222310402@gmail.com', '2023-03-07 17:01:31', NULL, 'Hamka Fadilah Rajab', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (769, 111, '222310403', '3522719', '222310403@gmail.com', '2023-03-07 17:01:31', NULL, 'Karenaya Putri Syamdani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (770, 111, '222310404', '5934272', '222310404@gmail.com', '2023-03-07 17:01:31', NULL, 'Keisya Nafishaturahma', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (771, 111, '222310405', '4339818', '222310405@gmail.com', '2023-03-07 17:01:31', NULL, 'Lutfa Zahda Kamilah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (772, 111, '222310406', '406373', '222310406@gmail.com', '2023-03-07 17:01:31', NULL, 'Meisyha Sucita Nur Rizky', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (773, 111, '222310407', '9870019', '222310407@gmail.com', '2023-03-07 17:01:31', NULL, 'Miranti Wibawa Nur A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (774, 111, '222310408', '8502950', '222310408@gmail.com', '2023-03-07 17:01:31', NULL, 'Muhammad Nugraha S.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (775, 111, '222310409', '6129496', '222310409@gmail.com', '2023-03-07 17:01:31', NULL, 'Muhammad Tsani T. Q.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (776, 111, '222310410', '1103778', '222310410@gmail.com', '2023-03-07 17:01:31', NULL, 'Muthia Syahirah Syafitri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (777, 111, '222310411', '9345766', '222310411@gmail.com', '2023-03-07 17:01:31', NULL, 'Najwa Aisyah Putri Sofyan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (778, 111, '222310412', '8391942', '222310412@gmail.com', '2023-03-07 17:01:31', NULL, 'Nazmi Auli Hukmi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (779, 111, '222310413', '380098', '222310413@gmail.com', '2023-03-07 17:01:31', NULL, 'Nazwa Azzahra Ginanjar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (780, 111, '222310414', '1561865', '222310414@gmail.com', '2023-03-07 17:01:31', NULL, 'Nike Oktaviana Dasilvi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (781, 111, '222310415', '2719109', '222310415@gmail.com', '2023-03-07 17:01:31', NULL, 'Nisrina Gadis', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (782, 111, '222310416', '6229237', '222310416@gmail.com', '2023-03-07 17:01:32', NULL, 'Raihan Ramdhan Bachtiar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (783, 111, '222310417', '7060796', '222310417@gmail.com', '2023-03-07 17:01:32', NULL, 'Rasyad Ali Ridlo', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (784, 111, '222310418', '493088', '222310418@gmail.com', '2023-03-07 17:01:32', NULL, 'Reishal Farras Fahreza', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (785, 111, '222310419', '4078887', '222310419@gmail.com', '2023-03-07 17:01:32', NULL, 'Revan Imanul Faqih', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (786, 111, '222310420', '2793828', '222310420@gmail.com', '2023-03-07 17:01:32', NULL, 'Sahla Qurotul\\\'Aini', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (787, 111, '222310421', '6224106', '222310421@gmail.com', '2023-03-07 17:01:32', NULL, 'Sarah Alya Anugrah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (788, 111, '222310422', '6067925', '222310422@gmail.com', '2023-03-07 17:01:32', NULL, 'Siti Kulsum Mahdayanti', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (789, 111, '222310423', '3112316', '222310423@gmail.com', '2023-03-07 17:01:32', NULL, 'Suci Agustina Burhanudin', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (790, 111, '222310424', '2797301', '222310424@gmail.com', '2023-03-07 17:01:32', NULL, 'Tania Kayla', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (791, 111, '222310425', '5154642', '222310425@gmail.com', '2023-03-07 17:01:32', NULL, 'Tania Saskia Perlita', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (792, 111, '222310426', '3444214', '222310426@gmail.com', '2023-03-07 17:01:32', NULL, 'Zaidan Hisyam', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (793, 112, '222310427', '6290896', '222310427@gmail.com', '2023-03-07 17:01:32', NULL, 'Akbar Ramadhan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (794, 112, '222310428', '3493054', '222310428@gmail.com', '2023-03-07 17:01:32', NULL, 'Alma Naeva Afiah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (795, 112, '222310429', '2918573', '222310429@gmail.com', '2023-03-07 17:01:32', NULL, 'Alya Yasmine\\\'athir G.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (796, 112, '222310430', '4729796', '222310430@gmail.com', '2023-03-07 17:01:32', NULL, 'Angga Shaputra Darmawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (797, 112, '222310431', '1010667', '222310431@gmail.com', '2023-03-07 17:01:32', NULL, 'Anitha Cahaya Maulida', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (798, 112, '222310432', '3557362', '222310432@gmail.com', '2023-03-07 17:01:32', NULL, 'Arsheilia Putri Pradita', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (799, 112, '222310433', '7999223', '222310433@gmail.com', '2023-03-07 17:01:32', NULL, 'Assifa Nurrahmi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (800, 112, '222310434', '6173907', '222310434@gmail.com', '2023-03-07 17:01:32', NULL, 'Bilal Abdul Fatah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (801, 112, '222310435', '9225131', '222310435@gmail.com', '2023-03-07 17:01:32', NULL, 'Deo Gratias B.Z.P.L.G.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (802, 112, '222310436', '5698149', '222310436@gmail.com', '2023-03-07 17:01:32', NULL, 'Dievey Taufiqul Hakim', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (803, 112, '222310437', '8940223', '222310437@gmail.com', '2023-03-07 17:01:32', NULL, 'Faiza Ardhika Dani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (804, 112, '222310438', '1196933', '222310438@gmail.com', '2023-03-07 17:01:33', NULL, 'Fikri Sidkil Aripin', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (805, 112, '222310439', '7158798', '222310439@gmail.com', '2023-03-07 17:01:33', NULL, 'Ghaitsa Aqilah Putri W.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (806, 112, '222310440', '674896', '222310440@gmail.com', '2023-03-07 17:01:33', NULL, 'Gia Cantika Ratu K. R.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (807, 112, '222310441', '9456191', '222310441@gmail.com', '2023-03-07 17:01:33', NULL, 'Haifa Nur Ayesha ', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (808, 112, '222310442', '2436531', '222310442@gmail.com', '2023-03-07 17:01:33', NULL, 'Jona Syafiq Nauval', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (809, 112, '222310443', '5442980', '222310443@gmail.com', '2023-03-07 17:01:33', NULL, 'Keyla Permata Dini', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (810, 112, '222310444', '1104274', '222310444@gmail.com', '2023-03-07 17:01:33', NULL, 'Keysa Arwa Nabil', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (811, 112, '222310466', '3767668', '222310466@gmail.com', '2023-03-07 17:01:33', NULL, 'Kireina Mauluri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (812, 112, '222310445', '6306458', '222310445@gmail.com', '2023-03-07 17:01:33', NULL, 'Lianaza Denti', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (813, 112, '222310446', '6107235', '222310446@gmail.com', '2023-03-07 17:01:33', NULL, 'Martasha Agniya Manar M.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (814, 112, '222310447', '4283014', '222310447@gmail.com', '2023-03-07 17:01:33', NULL, 'Maulida Yustisia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (815, 112, '222310448', '421851', '222310448@gmail.com', '2023-03-07 17:01:33', NULL, 'Muhammad Fakhri Nazhira Purnama', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (816, 112, '222310449', '2147288', '222310449@gmail.com', '2023-03-07 17:01:33', NULL, 'Muhammad Firghil Afgani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (817, 112, '222310450', '4933583', '222310450@gmail.com', '2023-03-07 17:01:33', NULL, 'Muslim Kamaludin Mudaafi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (818, 112, '222310451', '6721667', '222310451@gmail.com', '2023-03-07 17:01:33', NULL, 'Nailah Nur Alifah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (819, 112, '222310452', '4773905', '222310452@gmail.com', '2023-03-07 17:01:33', NULL, 'Nasya Fatiyyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (820, 112, '222310453', '745623', '222310453@gmail.com', '2023-03-07 17:01:33', NULL, 'Natasya Aulia Ramadhani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (821, 112, '222310454', '190313', '222310454@gmail.com', '2023-03-07 17:01:33', NULL, 'Naufal Fadhli Rahman', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (822, 112, '222310455', '4068713', '222310455@gmail.com', '2023-03-07 17:01:33', NULL, 'Nisrina Shofa Ramadani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (823, 112, '222310456', '4156311', '222310456@gmail.com', '2023-03-07 17:01:33', NULL, 'Novia Putri Faris', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (824, 112, '222310457', '6961851', '222310457@gmail.com', '2023-03-07 17:01:33', NULL, 'Raisha Siti Zahira', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (825, 112, '222310458', '5876512', '222310458@gmail.com', '2023-03-07 17:01:33', NULL, 'Rajwa Aufa Putri Ardiva', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (826, 112, '222310459', '1169415', '222310459@gmail.com', '2023-03-07 17:01:34', NULL, 'Rifal Akhmad Arifin', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (827, 112, '222310460', '2680587', '222310460@gmail.com', '2023-03-07 17:01:34', NULL, 'Salwa Al Birra Ramadhani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (828, 112, '222310461', '4331546', '222310461@gmail.com', '2023-03-07 17:01:34', NULL, 'Salwa Salsabila K.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (829, 112, '222310462', '6755186', '222310462@gmail.com', '2023-03-07 17:01:34', NULL, 'Syafia Siti Adawiyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (830, 112, '222310463', '7812236', '222310463@gmail.com', '2023-03-07 17:01:34', NULL, 'Syafiq Aqeel Hegar Kusuma', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (831, 112, '222310464', '7111374', '222310464@gmail.com', '2023-03-07 17:01:34', NULL, 'Teorema N. Rahmatunisa A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (832, 102, '222310040', '4068588', '222310040@gmail.com', '2023-03-07 17:01:34', NULL, 'Adhitya Pratama', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (833, 102, '222310041', '5380883', '222310041@gmail.com', '2023-03-07 17:01:34', NULL, 'Asilah Wijaya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (834, 102, '222310042', '2289360', '222310042@gmail.com', '2023-03-07 17:01:34', NULL, 'Caroline Ezra Elfrida', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (835, 102, '222310043', '2544153', '222310043@gmail.com', '2023-03-07 17:01:34', NULL, 'Dzabi Mohammad Albani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (836, 102, '222310044', '5773646', '222310044@gmail.com', '2023-03-07 17:01:34', NULL, 'Emir Azra Fadilah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (837, 102, '222310045', '3577009', '222310045@gmail.com', '2023-03-07 17:01:34', NULL, 'Esminar Simanullang', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (838, 102, '222310046', '3408032', '222310046@gmail.com', '2023-03-07 17:01:34', NULL, 'Fachryzal Vigardia Ganjar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (839, 102, '222310047', '5343120', '222310047@gmail.com', '2023-03-07 17:01:34', NULL, 'Fahmi Firmansyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (840, 102, '222310048', '1589131', '222310048@gmail.com', '2023-03-07 17:01:34', NULL, 'Faridah Hasan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (841, 102, '222310049', '6759453', '222310049@gmail.com', '2023-03-07 17:01:35', NULL, 'Fasya Alfata Fernanda', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (842, 102, '222310050', '7604785', '222310050@gmail.com', '2023-03-07 17:01:35', NULL, 'Fiski Aulia Yogantara', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (843, 102, '222310051', '5794170', '222310051@gmail.com', '2023-03-07 17:01:35', NULL, 'Ghilman Iqtafa Sabiq', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (844, 102, '222310052', '4948966', '222310052@gmail.com', '2023-03-07 17:01:35', NULL, 'Jihan Nadhila Khansa G.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (845, 102, '222310053', '8127253', '222310053@gmail.com', '2023-03-07 17:01:35', NULL, 'Kafka Abdulrafiq', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (846, 102, '222310054', '7851527', '222310054@gmail.com', '2023-03-07 17:01:35', NULL, 'Kiram Maliq Nagaho', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (847, 102, '222310055', '7981935', '222310055@gmail.com', '2023-03-07 17:01:35', NULL, 'Melza Sahara Aprilia S', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (848, 102, '222310056', '2217066', '222310056@gmail.com', '2023-03-07 17:01:35', NULL, 'Mesty Cahya Imansyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (849, 102, '222310057', '6189162', '222310057@gmail.com', '2023-03-07 17:01:35', NULL, 'Mochammad Rifqi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (850, 102, '222310058', '2589128', '222310058@gmail.com', '2023-03-07 17:01:35', NULL, 'Muhamad Aliffafatahillah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (851, 102, '222310059', '9786763', '222310059@gmail.com', '2023-03-07 17:01:35', NULL, 'Muhamad Apriza Rizki H.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (852, 102, '222310060', '1667083', '222310060@gmail.com', '2023-03-07 17:01:35', NULL, 'Muhammad Aldi Ramdhani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (853, 102, '222310061', '1235330', '222310061@gmail.com', '2023-03-07 17:01:35', NULL, 'Muhammad Azfa Andika P.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (854, 102, '222310062', '2828277', '222310062@gmail.com', '2023-03-07 17:01:35', NULL, 'Najla Zakiyah Nur Pasha', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (855, 102, '222310063', '7963163', '222310063@gmail.com', '2023-03-07 17:01:35', NULL, 'Nasywa Kaylla Aufaa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (856, 102, '222310064', '8705927', '222310064@gmail.com', '2023-03-07 17:01:35', NULL, 'Nayla Rustianti', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (857, 102, '222310065', '2594919', '222310065@gmail.com', '2023-03-07 17:01:35', NULL, 'Novita Anggraeni', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (858, 102, '222310066', '9424280', '222310066@gmail.com', '2023-03-07 17:01:35', NULL, 'Rafa Talitha', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (859, 102, '222310067', '3955176', '222310067@gmail.com', '2023-03-07 17:01:35', NULL, 'Raihan Khairul Sativa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (860, 102, '222310068', '8539532', '222310068@gmail.com', '2023-03-07 17:01:35', NULL, 'Ratu Sheema Jauharotun N.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (861, 102, '222310069', '3053556', '222310069@gmail.com', '2023-03-07 17:01:35', NULL, 'Rio Satria', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (862, 102, '222310070', '3737867', '222310070@gmail.com', '2023-03-07 17:01:35', NULL, 'Rizky Mubarok Afif', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (863, 102, '222310071', '8464844', '222310071@gmail.com', '2023-03-07 17:01:35', NULL, 'Salwa Septiandri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (864, 102, '222310072', '2675176', '222310072@gmail.com', '2023-03-07 17:01:35', NULL, 'Saskia Delphi Khairunnisa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (865, 102, '222310073', '954096', '222310073@gmail.com', '2023-03-07 17:01:35', NULL, 'Sayla Zahwah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (866, 102, '222310074', '1360514', '222310074@gmail.com', '2023-03-07 17:01:36', NULL, 'Shinta Handayani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (867, 102, '222310075', '4445136', '222310075@gmail.com', '2023-03-07 17:01:36', NULL, 'Silmi Fauziyyah Isfahani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (868, 102, '222310076', '7373267', '222310076@gmail.com', '2023-03-07 17:01:36', NULL, 'Sulthan Rabbani Hakim', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (869, 102, '222310077', '1224326', '222310077@gmail.com', '2023-03-07 17:01:36', NULL, 'Ziyad Nawwaf Ashidiq ', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (870, 102, '222310078', '2073756', '222310078@gmail.com', '2023-03-07 17:01:36', NULL, 'Zulfa Dwi Safira', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (871, 103, '222310079', '7856469', '222310079@gmail.com', '2023-03-07 17:01:36', NULL, 'Addika Rizky Haris', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (872, 103, '222310080', '2143021', '222310080@gmail.com', '2023-03-07 17:01:36', NULL, 'Agnia Yulianty Djuhara', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (873, 103, '222310081', '3189456', '222310081@gmail.com', '2023-03-07 17:01:36', NULL, 'Andita Salwa Nur Amalia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (874, 103, '222310082', '1829527', '222310082@gmail.com', '2023-03-07 17:01:36', NULL, 'Askhiya Hafwa Ajdala', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (875, 103, '222310083', '8756046', '222310083@gmail.com', '2023-03-07 17:01:36', NULL, 'Az Zahra Nurfauziah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (876, 103, '222310084', '8295100', '222310084@gmail.com', '2023-03-07 17:01:36', NULL, 'Azka Naufal Ramdani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (877, 103, '222310085', '1357747', '222310085@gmail.com', '2023-03-07 17:01:36', NULL, 'Bagas Eka Rahmadani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (878, 103, '222310086', '2172363', '222310086@gmail.com', '2023-03-07 17:01:36', NULL, 'Dinda Damayanti', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (879, 103, '222310087', '5522703', '222310087@gmail.com', '2023-03-07 17:01:36', NULL, 'Dyas Athirah Jasmine L.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (880, 103, '222310088', '7925781', '222310088@gmail.com', '2023-03-07 17:01:36', NULL, 'Egidya Putri Leontina H.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (881, 103, '222310089', '2784474', '222310089@gmail.com', '2023-03-07 17:01:36', NULL, 'Egis Sani Atma Izan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (882, 103, '222310090', '1273757', '222310090@gmail.com', '2023-03-07 17:01:37', NULL, 'Fakhri Aufa Ahmad Rafi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (883, 103, '222310091', '7523523', '222310091@gmail.com', '2023-03-07 17:01:37', NULL, 'Fanny Arvia Ramadhani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (884, 103, '222310092', '8421564', '222310092@gmail.com', '2023-03-07 17:01:37', NULL, 'Ghaisani Qisti Maharani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (885, 103, '222310093', '8200209', '222310093@gmail.com', '2023-03-07 17:01:37', NULL, 'Hanifah Ainun Nisa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (886, 103, '222310094', '9577338', '222310094@gmail.com', '2023-03-07 17:01:37', NULL, 'Isna Khoerunisa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (887, 103, '222310095', '2492420', '222310095@gmail.com', '2023-03-07 17:01:37', NULL, 'Jihan Naura Kayyisa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (888, 103, '222310096', '9460796', '222310096@gmail.com', '2023-03-07 17:01:37', NULL, 'Jonathan Prakarsa Wijaya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (889, 103, '222310097', '3947487', '222310097@gmail.com', '2023-03-07 17:01:37', NULL, 'Kaila Camilia Najla', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (890, 103, '222310098', '771675', '222310098@gmail.com', '2023-03-07 17:01:37', NULL, 'Keysa Bianca Priscilla', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (891, 103, '222310099', '4374886', '222310099@gmail.com', '2023-03-07 17:01:37', NULL, 'M. Faathir Fadhilah A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (892, 103, '222310100', '9120138', '222310100@gmail.com', '2023-03-07 17:01:37', NULL, 'Mega Utami', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (893, 103, '222310101', '7427685', '222310101@gmail.com', '2023-03-07 17:01:37', NULL, 'Muhamad Wandiansyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (894, 103, '222310102', '2395532', '222310102@gmail.com', '2023-03-07 17:01:37', NULL, 'Muhammad Naufal Rafi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (895, 103, '222310103', '4080794', '222310103@gmail.com', '2023-03-07 17:01:37', NULL, 'Narullita Pandia Achmad', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (896, 103, '222310104', '8773321', '222310104@gmail.com', '2023-03-07 17:01:37', NULL, 'Nasya Aulia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (897, 103, '222310105', '6176876', '222310105@gmail.com', '2023-03-07 17:01:37', NULL, 'Nayla Fatma Az-Zahra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (898, 103, '222310106', '9958697', '222310106@gmail.com', '2023-03-07 17:01:37', NULL, 'Nazwa Ananda Maolana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (899, 103, '222310107', '654693', '222310107@gmail.com', '2023-03-07 17:01:37', NULL, 'Rafdi Khairi Hamzah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (900, 103, '222310108', '5316736', '222310108@gmail.com', '2023-03-07 17:01:37', NULL, 'Raisa Shakila Hasna', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (901, 103, '222310109', '4102788', '222310109@gmail.com', '2023-03-07 17:01:37', NULL, 'Raiya Rachmalia Dwi A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (902, 103, '222310110', '4905439', '222310110@gmail.com', '2023-03-07 17:01:38', NULL, 'Reyno Ramdanur Putra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (903, 103, '222310111', '5723574', '222310111@gmail.com', '2023-03-07 17:01:38', NULL, 'Salsaningtyas Cahya R.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (904, 103, '222310112', '7763290', '222310112@gmail.com', '2023-03-07 17:01:38', NULL, 'Salva Januar Hartasah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (905, 103, '222310113', '2502286', '222310113@gmail.com', '2023-03-07 17:01:38', NULL, 'Syifa Auliana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (906, 103, '222310114', '6319539', '222310114@gmail.com', '2023-03-07 17:01:38', NULL, 'Tora Hermin Putra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (907, 103, '222310115', '9857078', '222310115@gmail.com', '2023-03-07 17:01:38', NULL, 'Tyara Nadira Putri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (908, 103, '222310116', '7842606', '222310116@gmail.com', '2023-03-07 17:01:38', NULL, 'Yasmin Nihaal Kholiluloh', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (909, 103, '222310117', '3151608', '222310117@gmail.com', '2023-03-07 17:01:38', NULL, 'Zidan Fauzi Rahman', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (910, 104, '222310118', '1397886', '222310118@gmail.com', '2023-03-07 17:01:38', NULL, 'Adzra Tsanyan Mahbubah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (911, 104, '222310119', '5017606', '222310119@gmail.com', '2023-03-07 17:01:38', NULL, 'Ahmad Syahrul Nawawi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (912, 104, '222310120', '8946045', '222310120@gmail.com', '2023-03-07 17:01:38', NULL, 'Alfi Julrahmat', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (913, 104, '222310121', '6924821', '222310121@gmail.com', '2023-03-07 17:01:38', NULL, 'Alinda Merliana Utari', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (914, 104, '222310122', '1348940', '222310122@gmail.com', '2023-03-07 17:01:38', NULL, 'Alya Jazilah Nurfakhira', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (915, 104, '222310123', '1260341', '222310123@gmail.com', '2023-03-07 17:01:38', NULL, 'Alya Nashita Nugraha', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (916, 104, '222310124', '6614252', '222310124@gmail.com', '2023-03-07 17:01:38', NULL, 'Aniken Maretha Fransiska', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (917, 104, '222310125', '1316778', '222310125@gmail.com', '2023-03-07 17:01:38', NULL, 'Ardhiansyah Syakira Putra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (918, 104, '222310126', '1145218', '222310126@gmail.com', '2023-03-07 17:01:38', NULL, 'Arwa Mutiara Nurzahrani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (919, 104, '222310127', '5584420', '222310127@gmail.com', '2023-03-07 17:01:38', NULL, 'Aulia Ramadhani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (920, 104, '222310128', '5493792', '222310128@gmail.com', '2023-03-07 17:01:38', NULL, 'Dea Nur Fauziyyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (921, 104, '222310129', '6676013', '222310129@gmail.com', '2023-03-07 17:01:38', NULL, 'Destri Dera Nathania', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (922, 104, '222310130', '7204030', '222310130@gmail.com', '2023-03-07 17:01:38', NULL, 'Dinaisha Rasya Hakim', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (923, 104, '222310131', '9302716', '222310131@gmail.com', '2023-03-07 17:01:38', NULL, 'Dude Muhammad Naufal', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (924, 104, '222310132', '4497928', '222310132@gmail.com', '2023-03-07 17:01:38', NULL, 'Ellen Angelina', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (925, 104, '222310133', '540704', '222310133@gmail.com', '2023-03-07 17:01:38', NULL, 'Faisal Muhamad Hafiz', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (926, 104, '222310134', '8236176', '222310134@gmail.com', '2023-03-07 17:01:38', NULL, 'Faris Syahirul Alim', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (927, 104, '222310135', '6685688', '222310135@gmail.com', '2023-03-07 17:01:38', NULL, 'Fatimah Dewi Yusuf', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (928, 104, '222310136', '1610428', '222310136@gmail.com', '2023-03-07 17:01:39', NULL, 'Fitria Nara Andani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (929, 104, '222310137', '3360703', '222310137@gmail.com', '2023-03-07 17:01:39', NULL, 'Jasmine Khansania S.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (930, 104, '222310138', '4776561', '222310138@gmail.com', '2023-03-07 17:01:39', NULL, 'Lulu Nur Atsmara', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (931, 104, '222310139', '5352013', '222310139@gmail.com', '2023-03-07 17:01:39', NULL, 'Lutfia Nurlatifah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (932, 104, '222310140', '4077774', '222310140@gmail.com', '2023-03-07 17:01:39', NULL, 'Moch. Zaky Al Ghifari', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (933, 104, '222310141', '5075485', '222310141@gmail.com', '2023-03-07 17:01:39', NULL, 'Mochammad Rizqan S. H.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (934, 104, '222310142', '4814281', '222310142@gmail.com', '2023-03-07 17:01:39', NULL, 'Muhammad \\\'Abdul Hafizh', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (935, 104, '222310143', '8300519', '222310143@gmail.com', '2023-03-07 17:01:39', NULL, 'Muhammad Challif Akbar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (936, 104, '222310144', '8977969', '222310144@gmail.com', '2023-03-07 17:01:39', NULL, 'Muhammad Falih Azkhari', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (937, 104, '222310145', '6102824', '222310145@gmail.com', '2023-03-07 17:01:39', NULL, 'Najwa Mustafii Datul A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (938, 104, '222310146', '2556494', '222310146@gmail.com', '2023-03-07 17:01:39', NULL, 'Nayla Adha Azria', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (939, 104, '222310147', '6479673', '222310147@gmail.com', '2023-03-07 17:01:39', NULL, 'Pasya Rimadhani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (940, 104, '222310148', '6335786', '222310148@gmail.com', '2023-03-07 17:01:39', NULL, 'Puput Gusti Ikhwanti', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (941, 104, '222310149', '637751', '222310149@gmail.com', '2023-03-07 17:01:39', NULL, 'Rasya Oktaviandi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (942, 104, '222310150', '8415174', '222310150@gmail.com', '2023-03-07 17:01:39', NULL, 'Salsa Bela Julianti', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (943, 104, '222310151', '2074668', '222310151@gmail.com', '2023-03-07 17:01:39', NULL, 'Syahra Jasara Alkhowalifi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (944, 104, '222310152', '5763794', '222310152@gmail.com', '2023-03-07 17:01:39', NULL, 'Tria Indah Pertiwi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (945, 104, '222310153', '5842484', '222310153@gmail.com', '2023-03-07 17:01:39', NULL, 'Vianeu Kania Dewi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (946, 104, '222310154', '8599248', '222310154@gmail.com', '2023-03-07 17:01:39', NULL, 'Widianingsih', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (947, 104, '222310155', '4582592', '222310155@gmail.com', '2023-03-07 17:01:39', NULL, 'William Alesandro L.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (948, 104, '222310156', '2183683', '222310156@gmail.com', '2023-03-07 17:01:39', NULL, 'Zulfa Aribah Khairat', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (949, 105, '222310157', '7245988', '222310157@gmail.com', '2023-03-07 17:01:39', NULL, 'Agniya Roudhatul Jannah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (950, 105, '222310158', '2896888', '222310158@gmail.com', '2023-03-07 17:01:39', NULL, 'Arini F Filmiansyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (951, 105, '222310159', '5277453', '222310159@gmail.com', '2023-03-07 17:01:39', NULL, 'Arrumaisya Putri Basyuni', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (952, 105, '222310160', '9964253', '222310160@gmail.com', '2023-03-07 17:01:39', NULL, 'Azkia Hasya Nur Hidayat', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (953, 105, '222310161', '6167560', '222310161@gmail.com', '2023-03-07 17:01:39', NULL, 'Cellyndra Putri Damelia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (954, 105, '222310162', '8797255', '222310162@gmail.com', '2023-03-07 17:01:39', NULL, 'Dalva Azzahra Firdaus', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (955, 105, '222310163', '2708476', '222310163@gmail.com', '2023-03-07 17:01:39', NULL, 'Danisya Maulidat', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (956, 105, '222310164', '5487892', '222310164@gmail.com', '2023-03-07 17:01:39', NULL, 'Fauzan Al Mujahid', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (957, 105, '222310165', '5869675', '222310165@gmail.com', '2023-03-07 17:01:39', NULL, 'Fauzan Raka Widyanto', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (958, 105, '222310166', '3899653', '222310166@gmail.com', '2023-03-07 17:01:39', NULL, 'Haifal Juniazhar Yahya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (959, 105, '222310167', '6292687', '222310167@gmail.com', '2023-03-07 17:01:40', NULL, 'Haykal Hidayat Jamalul I.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (960, 105, '222310168', '6016229', '222310168@gmail.com', '2023-03-07 17:01:40', NULL, 'Ilmanisa Arafah A. W.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (961, 105, '222310169', '3014293', '222310169@gmail.com', '2023-03-07 17:01:40', NULL, 'Indri Citra Aulia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (962, 105, '222310170', '1922217', '222310170@gmail.com', '2023-03-07 17:01:40', NULL, 'Iryansyah Jaya Aryanto', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (963, 105, '222310171', '2925600', '222310171@gmail.com', '2023-03-07 17:01:40', NULL, 'Kayla Namira Hakim', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (964, 105, '222310172', '6862928', '222310172@gmail.com', '2023-03-07 17:01:40', NULL, 'Keisya Azzura Humaira', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (965, 105, '222310173', '3809009', '222310173@gmail.com', '2023-03-07 17:01:40', NULL, 'Keysha Putrie Indrayanti', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (966, 105, '222310174', '6888844', '222310174@gmail.com', '2023-03-07 17:01:40', NULL, 'Lafaz Sains Azizah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (967, 105, '222310175', '371768', '222310175@gmail.com', '2023-03-07 17:01:40', NULL, 'Maulidna Asri Lestari', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (968, 105, '222310176', '8796354', '222310176@gmail.com', '2023-03-07 17:01:40', NULL, 'Moch.Fatwa Faturahman', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (969, 105, '222310177', '7533881', '222310177@gmail.com', '2023-03-07 17:01:40', NULL, 'Muhamad Fadlan Aulia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (970, 105, '222310178', '8892816', '222310178@gmail.com', '2023-03-07 17:01:40', NULL, 'Muhamad Fahd Aufa Akbar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (971, 105, '222310179', '8816125', '222310179@gmail.com', '2023-03-07 17:01:40', NULL, 'Muhammad Alfarrel Putra R', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (972, 105, '222310180', '1948975', '222310180@gmail.com', '2023-03-07 17:01:40', NULL, 'Muhammad Fahmi Firdaus', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (973, 105, '222310181', '3612657', '222310181@gmail.com', '2023-03-07 17:01:40', NULL, 'Muhammad Hanif Wildan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (974, 105, '222310182', '2108437', '222310182@gmail.com', '2023-03-07 17:01:40', NULL, 'Muhammad Rafli Raditya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (975, 105, '222310183', '5105719', '222310183@gmail.com', '2023-03-07 17:01:40', NULL, 'Mulyadin', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (976, 105, '222310184', '6976576', '222310184@gmail.com', '2023-03-07 17:01:40', NULL, 'Mutiara Nadira', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (977, 105, '222310185', '1066024', '222310185@gmail.com', '2023-03-07 17:01:40', NULL, 'Nabila Rahmah Ajjahrah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (978, 105, '222310186', '6130282', '222310186@gmail.com', '2023-03-07 17:01:41', NULL, 'Najiatun Ibtihal', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (979, 105, '222310187', '4799979', '222310187@gmail.com', '2023-03-07 17:01:41', NULL, 'Narulita Azzahra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (980, 105, '222310188', '6681538', '222310188@gmail.com', '2023-03-07 17:01:41', NULL, 'Nazwa Nuziya Kirana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (981, 105, '222310189', '1252172', '222310189@gmail.com', '2023-03-07 17:01:41', NULL, 'Radhfan Hasya Imani H.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (982, 105, '222310190', '6067880', '222310190@gmail.com', '2023-03-07 17:01:41', NULL, 'Radityo Tangkas Fairus T.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (983, 105, '222310191', '6027155', '222310191@gmail.com', '2023-03-07 17:01:41', NULL, 'Salsa Putriani Rifai', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (984, 105, '222310192', '7121760', '222310192@gmail.com', '2023-03-07 17:01:41', NULL, 'Sashi Kirana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (985, 105, '222310193', '7706818', '222310193@gmail.com', '2023-03-07 17:01:41', NULL, 'Syahrina Putri Gumilar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (986, 105, '222310194', '8286782', '222310194@gmail.com', '2023-03-07 17:01:41', NULL, 'Tsalist Hayah Gunawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (987, 105, '222310195', '7845393', '222310195@gmail.com', '2023-03-07 17:01:41', NULL, 'Vicky Vikriandani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (988, 106, '222310196', '5582449', '222310196@gmail.com', '2023-03-07 17:01:41', NULL, 'Abdillah Daffah Andhika', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (989, 106, '222310197', '2438395', '222310197@gmail.com', '2023-03-07 17:01:41', NULL, 'Ananda Dilla Firdaus R.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (990, 106, '222310198', '6347436', '222310198@gmail.com', '2023-03-07 17:01:41', NULL, 'Arcel Greescyo', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (991, 106, '222310199', '1251379', '222310199@gmail.com', '2023-03-07 17:01:41', NULL, 'Bagja Maulidy Muhammad', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (992, 106, '222310200', '2729298', '222310200@gmail.com', '2023-03-07 17:01:41', NULL, 'Bintang Nusantara Setiadi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (993, 106, '222310201', '9846914', '222310201@gmail.com', '2023-03-07 17:01:41', NULL, 'Defhania Yasinta Darmawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (994, 106, '222310202', '4476733', '222310202@gmail.com', '2023-03-07 17:01:41', NULL, 'Gishella Putri Early R.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (995, 106, '222310203', '2645632', '222310203@gmail.com', '2023-03-07 17:01:41', NULL, 'Gisti Khansa Fadillah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (996, 106, '222310204', '3615852', '222310204@gmail.com', '2023-03-07 17:01:41', NULL, 'Gizya Amelia Putri C.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (997, 106, '222310205', '9924964', '222310205@gmail.com', '2023-03-07 17:01:41', NULL, 'Hadar Fadillah Syahara', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (998, 106, '222310206', '7379318', '222310206@gmail.com', '2023-03-07 17:01:41', NULL, 'Hafidz Putra Endriana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (999, 106, '222310207', '1623327', '222310207@gmail.com', '2023-03-07 17:01:41', NULL, 'Hildan Firdaus', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1000, 106, '222310208', '9432627', '222310208@gmail.com', '2023-03-07 17:01:41', NULL, 'Irwanda Adzkia Aulia D.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1001, 106, '222310209', '9976226', '222310209@gmail.com', '2023-03-07 17:01:41', NULL, 'Iyantona Ariesta Putra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1002, 106, '222310210', '2385860', '222310210@gmail.com', '2023-03-07 17:01:41', NULL, 'Kania Tresna Masagi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1003, 106, '222310211', '466777', '222310211@gmail.com', '2023-03-07 17:01:41', NULL, 'Lula Nayla', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1004, 106, '222310212', '3600436', '222310212@gmail.com', '2023-03-07 17:01:41', NULL, 'Maula Aulia Cantika', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1005, 106, '222310213', '6405083', '222310213@gmail.com', '2023-03-07 17:01:41', NULL, 'Mochammad Farrel F. M.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1006, 106, '222310214', '5753615', '222310214@gmail.com', '2023-03-07 17:01:42', NULL, 'Mochammad Refhaldy G.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1007, 106, '222310215', '784834', '222310215@gmail.com', '2023-03-07 17:01:42', NULL, 'Muhammad Ary N. F.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1008, 106, '222310216', '8364141', '222310216@gmail.com', '2023-03-07 17:01:42', NULL, 'Muhammad Davin S. A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1009, 106, '222310217', '8937530', '222310217@gmail.com', '2023-03-07 17:01:42', NULL, 'Muhammad Nur Ihsan Al K.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1010, 106, '222310218', '431662', '222310218@gmail.com', '2023-03-07 17:01:42', NULL, 'Nabila Salma Arvia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1011, 106, '222310219', '5971922', '222310219@gmail.com', '2023-03-07 17:01:42', NULL, 'Najwa Zahra Khairunnisa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1012, 106, '222310220', '6204182', '222310220@gmail.com', '2023-03-07 17:01:42', NULL, 'Navisa Aurieli Asipa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1013, 106, '222310221', '8305698', '222310221@gmail.com', '2023-03-07 17:01:42', NULL, 'Neng Rista Andari', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1014, 106, '222310222', '7947742', '222310222@gmail.com', '2023-03-07 17:01:42', NULL, 'Nurul Fadilah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1015, 106, '222310223', '2913453', '222310223@gmail.com', '2023-03-07 17:01:42', NULL, 'Raisya Azzahra Syaffitri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1016, 106, '222310224', '158042', '222310224@gmail.com', '2023-03-07 17:01:42', NULL, 'Rasyid Muhammad Shiddiq', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1017, 106, '222310225', '5783897', '222310225@gmail.com', '2023-03-07 17:01:42', NULL, 'Rizqi Fahlufi Akbar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1018, 106, '222310226', '4083415', '222310226@gmail.com', '2023-03-07 17:01:42', NULL, 'Rosi Puspitasari', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1019, 106, '222310227', '5156854', '222310227@gmail.com', '2023-03-07 17:01:42', NULL, 'Sakilla Putri Maharani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1020, 106, '222310228', '3994974', '222310228@gmail.com', '2023-03-07 17:01:43', NULL, 'Sintia Kusumawardani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1021, 106, '222310229', '4277718', '222310229@gmail.com', '2023-03-07 17:01:43', NULL, 'Siti Arly Gelisa Susanti', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1022, 106, '222310230', '8600214', '222310230@gmail.com', '2023-03-07 17:01:43', NULL, 'Siti Fatimatuzzahra T.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1023, 106, '222310231', '2100621', '222310231@gmail.com', '2023-03-07 17:01:43', NULL, 'Syaqila Azalia Mandala P.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1024, 106, '222310232', '4708861', '222310232@gmail.com', '2023-03-07 17:01:43', NULL, 'Valga Visio Aryanto', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1025, 106, '222310233', '6036843', '222310233@gmail.com', '2023-03-07 17:01:43', NULL, 'Verlyza Aulya Fahira', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1026, 106, '222310234', '3308612', '222310234@gmail.com', '2023-03-07 17:01:43', NULL, 'Vicky Pratama', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1027, 107, '222310235', '9829967', '222310235@gmail.com', '2023-03-07 17:01:43', NULL, 'Adinda Namira Achmad', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1028, 107, '222310236', '2882200', '222310236@gmail.com', '2023-03-07 17:01:43', NULL, 'Ajeng Salwa Nazifah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1029, 107, '222310237', '301395', '222310237@gmail.com', '2023-03-07 17:01:43', NULL, 'Ali Fathir Assidiq', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1030, 107, '222310238', '4781501', '222310238@gmail.com', '2023-03-07 17:01:43', NULL, 'Alluna Aura Ramadhani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1031, 107, '222310239', '4833018', '222310239@gmail.com', '2023-03-07 17:01:43', NULL, 'Althaf M. Bintang Wiharsa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1032, 107, '222310240', '5927231', '222310240@gmail.com', '2023-03-07 17:01:43', NULL, 'Anissa Sulistyorini', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1033, 107, '222310241', '5288614', '222310241@gmail.com', '2023-03-07 17:01:43', NULL, 'Aulia Nur Hidayah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1034, 107, '222310242', '6829283', '222310242@gmail.com', '2023-03-07 17:01:43', NULL, 'Cahya Kamila', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1035, 107, '222310243', '8348893', '222310243@gmail.com', '2023-03-07 17:01:43', NULL, 'Dara Alifa Agniasari S.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1036, 107, '222310244', '2395766', '222310244@gmail.com', '2023-03-07 17:01:43', NULL, 'Elva Novita Padillah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1037, 107, '222310245', '1693717', '222310245@gmail.com', '2023-03-07 17:01:43', NULL, 'Fadilah Fauziah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1038, 107, '222310246', '750156', '222310246@gmail.com', '2023-03-07 17:01:43', NULL, 'Farissa Aghnia Dimyati', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1039, 107, '222310247', '2741420', '222310247@gmail.com', '2023-03-07 17:01:43', NULL, 'Febi Anggraeni', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1040, 107, '222310248', '7411115', '222310248@gmail.com', '2023-03-07 17:01:43', NULL, 'Felisya Aprilia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1041, 107, '222310249', '5234956', '222310249@gmail.com', '2023-03-07 17:01:43', NULL, 'Fianida Salsabila N. D.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1042, 107, '222310250', '4426202', '222310250@gmail.com', '2023-03-07 17:01:43', NULL, 'Fitria Nurmaulida S.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1043, 107, '222310251', '5336052', '222310251@gmail.com', '2023-03-07 17:01:44', NULL, 'Hansya Nurrizqiana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1044, 107, '222310252', '1003424', '222310252@gmail.com', '2023-03-07 17:01:44', NULL, 'Hasbi Mochamad Al-Farizi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1045, 107, '222310253', '1344026', '222310253@gmail.com', '2023-03-07 17:01:44', NULL, 'Hasby Nijami Nurbarkah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1046, 107, '222310254', '4679746', '222310254@gmail.com', '2023-03-07 17:01:44', NULL, 'Irghi Alwafi Kuswaya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1047, 107, '222310255', '213917', '222310255@gmail.com', '2023-03-07 17:01:44', NULL, 'Malik Ahmad Fattan Athaya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1048, 107, '222310256', '3123437', '222310256@gmail.com', '2023-03-07 17:01:44', NULL, 'Mohamad Farhan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1049, 107, '222310257', '4658953', '222310257@gmail.com', '2023-03-07 17:01:44', NULL, 'Mohamad Rifqi Muzaki', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1050, 107, '222310258', '9814539', '222310258@gmail.com', '2023-03-07 17:01:44', NULL, 'Muhammad Fatih Abdurrahman', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1051, 107, '222310259', '1157127', '222310259@gmail.com', '2023-03-07 17:01:44', NULL, 'Muhammad Nadhif Ilmany', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1052, 107, '222310260', '2710837', '222310260@gmail.com', '2023-03-07 17:01:44', NULL, 'Nayla Augustin Putri S.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1053, 107, '222310261', '7232751', '222310261@gmail.com', '2023-03-07 17:01:44', NULL, 'Nuriyah Syifa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1054, 107, '222310262', '8143056', '222310262@gmail.com', '2023-03-07 17:01:44', NULL, 'Reva Walidah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1055, 107, '222310263', '5862723', '222310263@gmail.com', '2023-03-07 17:01:44', NULL, 'Rheyzha Elszha Slavina', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1056, 107, '222310264', '8444518', '222310264@gmail.com', '2023-03-07 17:01:44', NULL, 'Rifa Adilla Budihartana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1057, 107, '222310265', '8211047', '222310265@gmail.com', '2023-03-07 17:01:44', NULL, 'Rizky Widi Novian', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1058, 107, '222310266', '1195363', '222310266@gmail.com', '2023-03-07 17:01:44', NULL, 'Sasta Zahrotuz Zahi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1059, 107, '222310267', '7652385', '222310267@gmail.com', '2023-03-07 17:01:44', NULL, 'Syifa Nadhifah Rahmani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1060, 107, '222310268', '5289673', '222310268@gmail.com', '2023-03-07 17:01:44', NULL, 'Tisa Nurah Assary', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1061, 107, '222310269', '1367317', '222310269@gmail.com', '2023-03-07 17:01:44', NULL, 'Virginia Putri Ramdani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1062, 107, '222310270', '2602504', '222310270@gmail.com', '2023-03-07 17:01:44', NULL, 'Weni Aprilyani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1063, 107, '222310271', '7264919', '222310271@gmail.com', '2023-03-07 17:01:45', NULL, 'Yusi Muliawati Rahayu', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1064, 107, '222310272', '3279564', '222310272@gmail.com', '2023-03-07 17:01:45', NULL, 'Zalfa Azkia Rahmah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1065, 107, '222310273', '8301490', '222310273@gmail.com', '2023-03-07 17:01:45', NULL, 'Zamzam Maulana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1066, 108, '222310274', '8405108', '222310274@gmail.com', '2023-03-07 17:01:45', NULL, 'Abgi Rahman Ramadani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1067, 108, '222310275', '7824101', '222310275@gmail.com', '2023-03-07 17:01:45', NULL, 'Adel Flora Aulia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1068, 108, '222310276', '4780242', '222310276@gmail.com', '2023-03-07 17:01:45', NULL, 'Alit Nur Hakim', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1069, 108, '222310277', '5963751', '222310277@gmail.com', '2023-03-07 17:01:45', NULL, 'Berlian Habibi Sugiono', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1070, 108, '222310278', '8666050', '222310278@gmail.com', '2023-03-07 17:01:45', NULL, 'Davina Zahirah Samha A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1071, 108, '222310279', '6498023', '222310279@gmail.com', '2023-03-07 17:01:45', NULL, 'Detia Quinada Ridam', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1072, 108, '222310280', '5658681', '222310280@gmail.com', '2023-03-07 17:01:45', NULL, 'Diah Artisya Zahra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1073, 108, '222310281', '5555682', '222310281@gmail.com', '2023-03-07 17:01:45', NULL, 'Dinda Alsyafira Putri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1074, 108, '222310282', '7907453', '222310282@gmail.com', '2023-03-07 17:01:45', NULL, 'Dinda Aprilia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1075, 108, '222310283', '7685598', '222310283@gmail.com', '2023-03-07 17:01:45', NULL, 'Fadilanita Zhafirah A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1076, 108, '222310284', '979460', '222310284@gmail.com', '2023-03-07 17:01:45', NULL, 'Fadninta Alanna Qolbi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1077, 108, '222310285', '8515920', '222310285@gmail.com', '2023-03-07 17:01:45', NULL, 'Fashila Azra Suryana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1078, 108, '222310286', '4646772', '222310286@gmail.com', '2023-03-07 17:01:45', NULL, 'Fatihah Az Zahra El Fahmy', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1079, 108, '222310287', '7164384', '222310287@gmail.com', '2023-03-07 17:01:45', NULL, 'Fauziah Fathonatus Sobar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1080, 108, '222310288', '8424046', '222310288@gmail.com', '2023-03-07 17:01:45', NULL, 'Gaza Rahmat Jimbara', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1081, 108, '222310289', '3293994', '222310289@gmail.com', '2023-03-07 17:01:45', NULL, 'Hana Al Auliya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1082, 108, '222310290', '9819187', '222310290@gmail.com', '2023-03-07 17:01:45', NULL, 'Haniya Nurzahiya Mardanti', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1083, 108, '222310291', '7795802', '222310291@gmail.com', '2023-03-07 17:01:46', NULL, 'Jingga Meylandra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1084, 108, '222310292', '211850', '222310292@gmail.com', '2023-03-07 17:01:46', NULL, 'Khaira Aini Fathiyyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1085, 108, '222310293', '4044959', '222310293@gmail.com', '2023-03-07 17:01:46', NULL, 'Martin Mulia Abadi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1086, 108, '222310294', '7186836', '222310294@gmail.com', '2023-03-07 17:01:46', NULL, 'Meyla Anggita Ariani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1087, 108, '222310295', '1687941', '222310295@gmail.com', '2023-03-07 17:01:46', NULL, 'Muhamad Razan Nurfajri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1088, 108, '222310296', '793546', '222310296@gmail.com', '2023-03-07 17:01:46', NULL, 'Muhamad Zulfa Nugraha', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1089, 108, '222310297', '4457903', '222310297@gmail.com', '2023-03-07 17:01:46', NULL, 'Muhammad Fathi Adz-Dzikra S.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1090, 108, '222310298', '2696981', '222310298@gmail.com', '2023-03-07 17:01:46', NULL, 'Muhammad Haikal Azhar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1091, 108, '222310299', '2876257', '222310299@gmail.com', '2023-03-07 17:01:46', NULL, 'Muhammad Nabil Hasan Andanawari', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1092, 108, '222310465', '7703750', '222310465@gmail.com', '2023-03-07 17:01:46', NULL, 'Muhammad Yazdaaniar U.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1093, 108, '222310300', '157101', '222310300@gmail.com', '2023-03-07 17:01:46', NULL, 'Multazam Ahmad Al Fathan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1094, 108, '222310301', '2021162', '222310301@gmail.com', '2023-03-07 17:01:46', NULL, 'Mutia Marwah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1095, 108, '222310302', '4848571', '222310302@gmail.com', '2023-03-07 17:01:46', NULL, 'Nabilla Nur Aufa Rizqi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1096, 108, '222310303', '7777654', '222310303@gmail.com', '2023-03-07 17:01:46', NULL, 'Nuraeny Inayati Samhah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1097, 108, '222310304', '6213030', '222310304@gmail.com', '2023-03-07 17:01:46', NULL, 'Rivan Raya Alfaritsi J.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1098, 108, '222310305', '293014', '222310305@gmail.com', '2023-03-07 17:01:46', NULL, 'Sabrina Natsia Lairi O.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1099, 108, '222310306', '1606455', '222310306@gmail.com', '2023-03-07 17:01:47', NULL, 'Salwa Hanjani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1100, 108, '222310307', '9072196', '222310307@gmail.com', '2023-03-07 17:01:47', NULL, 'Shelsa Citra Utami', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1101, 108, '222310308', '2521760', '222310308@gmail.com', '2023-03-07 17:01:47', NULL, 'Tharminy Intan Nuraeni', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1102, 108, '222310309', '6546757', '222310309@gmail.com', '2023-03-07 17:01:47', NULL, 'Tresnatrisa Rahmaani D.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1103, 108, '222310310', '5279349', '222310310@gmail.com', '2023-03-07 17:01:47', NULL, 'Zalfa Zahirah Hamdani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1104, 109, '222310311', '3521672', '222310311@gmail.com', '2023-03-07 17:01:47', NULL, 'Alya Heriyanto Artha M.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1105, 109, '222310312', '9399705', '222310312@gmail.com', '2023-03-07 17:01:47', NULL, 'Arkeyla Maghfira', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1106, 109, '222310313', '5887422', '222310313@gmail.com', '2023-03-07 17:01:47', NULL, 'Azahra Epliana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1107, 109, '222310314', '2347001', '222310314@gmail.com', '2023-03-07 17:01:47', NULL, 'Berlian Arifin Putri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1108, 109, '222310315', '9742697', '222310315@gmail.com', '2023-03-07 17:01:47', NULL, 'Brinet Khaira Surya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1109, 109, '222310316', '5843173', '222310316@gmail.com', '2023-03-07 17:01:47', NULL, 'Carrissa Ardine Elvaretta', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1110, 109, '222310317', '915516', '222310317@gmail.com', '2023-03-07 17:01:47', NULL, 'Chintya Permata Sari', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1111, 109, '222310318', '8735461', '222310318@gmail.com', '2023-03-07 17:01:47', NULL, 'Erika Oktavia Nababan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1112, 109, '222310319', '6788215', '222310319@gmail.com', '2023-03-07 17:01:47', NULL, 'Fadiya Ramzy Siswanto', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1113, 109, '222310320', '7498126', '222310320@gmail.com', '2023-03-07 17:01:47', NULL, 'Fathan Nurul Arif R.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1114, 109, '222310321', '3815889', '222310321@gmail.com', '2023-03-07 17:01:47', NULL, 'Fenni Anggraeni', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1115, 109, '222310322', '570268', '222310322@gmail.com', '2023-03-07 17:01:47', NULL, 'Firyal Nayfa Revaliana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1116, 109, '222310323', '385726', '222310323@gmail.com', '2023-03-07 17:01:47', NULL, 'Ghaitsa Haifa Badzlin', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1117, 109, '222310324', '7508359', '222310324@gmail.com', '2023-03-07 17:01:47', NULL, 'Gun-Gun Permana Sidik', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1118, 109, '222310325', '2605918', '222310325@gmail.com', '2023-03-07 17:01:47', NULL, 'Imara Nurul Khonsa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1119, 109, '222310326', '3764808', '222310326@gmail.com', '2023-03-07 17:01:47', NULL, 'Jordan Malik Ahmad', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1120, 109, '222310327', '1503920', '222310327@gmail.com', '2023-03-07 17:01:48', NULL, 'Luhut Alpantorang Rambe', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1121, 109, '222310328', '1375950', '222310328@gmail.com', '2023-03-07 17:01:48', NULL, 'M. Afdhal Quizra K.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1122, 109, '222310329', '4432625', '222310329@gmail.com', '2023-03-07 17:01:48', NULL, 'Melisha Setiawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1123, 109, '222310330', '2758993', '222310330@gmail.com', '2023-03-07 17:01:48', NULL, 'Moch Febryan Abdul Wahid', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1124, 109, '222310331', '2159956', '222310331@gmail.com', '2023-03-07 17:01:48', NULL, 'Muhammad Fachri Faisal', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1125, 109, '222310332', '9470213', '222310332@gmail.com', '2023-03-07 17:01:48', NULL, 'Muhammad Hidqi A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1126, 109, '222310333', '8440715', '222310333@gmail.com', '2023-03-07 17:01:48', NULL, 'Muhammad Zakaria Lukman', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1127, 109, '222310334', '5534126', '222310334@gmail.com', '2023-03-07 17:01:48', NULL, 'Nafa Fitriyani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1128, 109, '222310335', '4422289', '222310335@gmail.com', '2023-03-07 17:01:48', NULL, 'Najwa Aulia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1129, 109, '222310336', '4565439', '222310336@gmail.com', '2023-03-07 17:01:48', NULL, 'Nindiannisa Nawal Cahaya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1130, 109, '222310337', '2868570', '222310337@gmail.com', '2023-03-07 17:01:48', NULL, 'Nindya Dwi Ramadhani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1131, 109, '222310338', '5888956', '222310338@gmail.com', '2023-03-07 17:01:48', NULL, 'Qeyrra Mugni Sabila', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1132, 109, '222310339', '4442922', '222310339@gmail.com', '2023-03-07 17:01:48', NULL, 'Rafi Mohamad Ikhsan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1133, 109, '222310340', '4652528', '222310340@gmail.com', '2023-03-07 17:01:49', NULL, 'Rahmat Solihin Nugraha', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1134, 109, '222310341', '210540', '222310341@gmail.com', '2023-03-07 17:01:49', NULL, 'Raul Ziad Al Zamani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1135, 109, '222310342', '3885019', '222310342@gmail.com', '2023-03-07 17:01:49', NULL, 'Razwa Nur Raqiqah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1136, 109, '222310343', '3546731', '222310343@gmail.com', '2023-03-07 17:01:49', NULL, 'Rifqy Nurmauludia Suryana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1137, 109, '222310344', '5194131', '222310344@gmail.com', '2023-03-07 17:01:49', NULL, 'Sela Martina Sidik', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1138, 109, '222310345', '6365388', '222310345@gmail.com', '2023-03-07 17:01:49', NULL, 'Syafitri Kusuma Dewi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1139, 109, '222310346', '9610067', '222310346@gmail.com', '2023-03-07 17:01:49', NULL, 'Syifa Nur Fadhilah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1140, 109, '222310347', '2584134', '222310347@gmail.com', '2023-03-07 17:01:49', NULL, 'Tsulits Navisa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1141, 109, '222310348', '2933877', '222310348@gmail.com', '2023-03-07 17:01:49', NULL, 'Zahra Anastasia Salsabila', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1142, 109, '222310349', '659876', '222310349@gmail.com', '2023-03-07 17:01:49', NULL, 'Zahra Nisaul Janah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1143, 221, '212210335', '5131117', '212210335@gmail.com', '2023-03-07 17:01:49', NULL, 'Adhitia Sutanto', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1144, 221, '212210336', '6642110', '212210336@gmail.com', '2023-03-07 17:01:49', NULL, 'Agami Ramadhani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1145, 221, '212210337', '5101002', '212210337@gmail.com', '2023-03-07 17:01:49', NULL, 'Agustinus Lumbantoruan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1146, 221, '212210338', '4839740', '212210338@gmail.com', '2023-03-07 17:01:49', NULL, 'Akhfasy Ahmad Nur Mulyadi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1147, 221, '212210339', '1848121', '212210339@gmail.com', '2023-03-07 17:01:49', NULL, 'Aulia Zahwa Putri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1148, 221, '212210340', '1513742', '212210340@gmail.com', '2023-03-07 17:01:49', NULL, 'Chelsea Moza Zahira', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1149, 221, '212210341', '6460513', '212210341@gmail.com', '2023-03-07 17:01:49', NULL, 'Desi Kustiani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1150, 221, '212210342', '9969833', '212210342@gmail.com', '2023-03-07 17:01:49', NULL, 'Diani Rachma Rosdiyanti', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1151, 221, '212210343', '1737753', '212210343@gmail.com', '2023-03-07 17:01:49', NULL, 'Divana Putri Perdana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1152, 221, '212210344', '2474144', '212210344@gmail.com', '2023-03-07 17:01:49', NULL, 'Elsa Nitri Cahyani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1153, 221, '212210345', '1450414', '212210345@gmail.com', '2023-03-07 17:01:49', NULL, 'Faiz Faizal Muhamad Zaki', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1154, 221, '212210346', '5954041', '212210346@gmail.com', '2023-03-07 17:01:49', NULL, 'Ferio Dwinanda Aji', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1155, 221, '212210347', '624091', '212210347@gmail.com', '2023-03-07 17:01:49', NULL, 'Fitri Khoufi Fauziah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1156, 221, '212210348', '8297505', '212210348@gmail.com', '2023-03-07 17:01:50', NULL, 'Hanifia Syaki Aulis', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1157, 221, '212210349', '542684', '212210349@gmail.com', '2023-03-07 17:01:50', NULL, 'Helmy Maulana Kasmono', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1158, 221, '212210350', '2279323', '212210350@gmail.com', '2023-03-07 17:01:50', NULL, 'Izma Zakaria Suryani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1159, 221, '212210351', '8038313', '212210351@gmail.com', '2023-03-07 17:01:50', NULL, 'Luana Haura Putri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1160, 221, '212210353', '4718396', '212210353@gmail.com', '2023-03-07 17:01:50', NULL, 'Muhamad Tsaqif Wafi Z.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1161, 221, '212210354', '9808451', '212210354@gmail.com', '2023-03-07 17:01:50', NULL, 'Muhammad Dafa D. M.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1162, 221, '212210355', '8559381', '212210355@gmail.com', '2023-03-07 17:01:50', NULL, 'Nabila Putri Ramadhani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1163, 221, '212210356', '706676', '212210356@gmail.com', '2023-03-07 17:01:50', NULL, 'Nafisa Rahman', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1164, 221, '212210357', '4287064', '212210357@gmail.com', '2023-03-07 17:01:50', NULL, 'Naifa Fatharani Khairy', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1165, 221, '212210358', '4411871', '212210358@gmail.com', '2023-03-07 17:01:50', NULL, 'Najmi Aghniya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1166, 221, '212210359', '1248563', '212210359@gmail.com', '2023-03-07 17:01:50', NULL, 'Naura Syifa Shahira Zalfa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1167, 221, '212210361', '2102398', '212210361@gmail.com', '2023-03-07 17:01:50', NULL, 'Nitya Aulia Nafisa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1168, 221, '212210362', '1534342', '212210362@gmail.com', '2023-03-07 17:01:50', NULL, 'Qisthi Uswatun Hasanah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1169, 221, '212210364', '6774073', '212210364@gmail.com', '2023-03-07 17:01:50', NULL, 'Raihan Muhamad Al Fatoni', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1170, 221, '212210363', '7473244', '212210363@gmail.com', '2023-03-07 17:01:50', NULL, 'Rakha Fraya Rhafaella', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1171, 221, '212210365', '5977267', '212210365@gmail.com', '2023-03-07 17:01:50', NULL, 'Rifki Maulana Halid', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1172, 221, '212210366', '5892558', '212210366@gmail.com', '2023-03-07 17:01:50', NULL, 'Salma Natsa Aufa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1173, 221, '212210367', '6627041', '212210367@gmail.com', '2023-03-07 17:01:50', NULL, 'Shellina Roviyunnisa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1174, 221, '222311444', '6941732', '222311444@gmail.com', '2023-03-07 17:01:50', NULL, 'Tajsana Aulia Azka', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1175, 221, '212210368', '6700957', '212210368@gmail.com', '2023-03-07 17:01:50', NULL, 'Tasya Dwi Ariana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1176, 221, '212210369', '8723987', '212210369@gmail.com', '2023-03-07 17:01:50', NULL, 'Vania Shira S. A. E.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1177, 221, '212210370', '7903508', '212210370@gmail.com', '2023-03-07 17:01:50', NULL, 'Vika Marwah Raizhela', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1178, 221, '212210371', '3940857', '212210371@gmail.com', '2023-03-07 17:01:50', NULL, 'Yudhis Febrian', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1179, 222, '212210372', '4044898', '212210372@gmail.com', '2023-03-07 17:01:50', NULL, 'Alya Elvina Ayu', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1180, 222, '212210373', '4137547', '212210373@gmail.com', '2023-03-07 17:01:50', NULL, 'Aqil Albaihaqi Hibatullah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1181, 222, '212210375', '4515507', '212210375@gmail.com', '2023-03-07 17:01:50', NULL, 'Azmii Syafarina P.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1182, 222, '212210374', '179912', '212210374@gmail.com', '2023-03-07 17:01:51', NULL, 'Az\\\'zah Fauziah Y. F.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1183, 222, '212210376', '9627446', '212210376@gmail.com', '2023-03-07 17:01:51', NULL, 'Chelsea Salwa Fadila', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1184, 222, '212210377', '6754101', '212210377@gmail.com', '2023-03-07 17:01:51', NULL, 'Desti Aishah Putri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1185, 222, '212210378', '2347318', '212210378@gmail.com', '2023-03-07 17:01:51', NULL, 'Dhea Siti Adila', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1186, 222, '212210379', '5974717', '212210379@gmail.com', '2023-03-07 17:01:51', NULL, 'Dinni Kania Sundasari', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1187, 222, '212210380', '8441461', '212210380@gmail.com', '2023-03-07 17:01:51', NULL, 'Diva Oktavia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1188, 222, '212210381', '4493148', '212210381@gmail.com', '2023-03-07 17:01:51', NULL, 'Dwi Nur Fidiyah Wirawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1189, 222, '212210382', '2327503', '212210382@gmail.com', '2023-03-07 17:01:51', NULL, 'Fajar Satriawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1190, 222, '212210383', '6877782', '212210383@gmail.com', '2023-03-07 17:01:51', NULL, 'Fauziyah Azhar M. K. I.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1191, 222, '212210384', '7320044', '212210384@gmail.com', '2023-03-07 17:01:51', NULL, 'Gandia Sarianingrat', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1192, 222, '212210385', '8042501', '212210385@gmail.com', '2023-03-07 17:01:51', NULL, 'Gilar Muhamad Riski', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1193, 222, '212210386', '4958458', '212210386@gmail.com', '2023-03-07 17:01:51', NULL, 'Hany Maryati', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1194, 222, '212210387', '2526075', '212210387@gmail.com', '2023-03-07 17:01:51', NULL, 'Michelle Ervia Favo', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1195, 222, '212210388', '6257463', '212210388@gmail.com', '2023-03-07 17:01:51', NULL, 'Mohammad Ersan Wahyu', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1196, 222, '212210389', '1078846', '212210389@gmail.com', '2023-03-07 17:01:51', NULL, 'Muhammad Baihakii', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1197, 222, '212210390', '2122971', '212210390@gmail.com', '2023-03-07 17:01:51', NULL, 'Muhammad Hafizh Kurniawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1198, 222, '212210391', '3007930', '212210391@gmail.com', '2023-03-07 17:01:51', NULL, 'Muhammad Reihan Alamsyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1199, 222, '212210392', '5174510', '212210392@gmail.com', '2023-03-07 17:01:51', NULL, 'Nabila Ramadhani R. S.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1200, 222, '212210393', '9619805', '212210393@gmail.com', '2023-03-07 17:01:51', NULL, 'Nafisa Rizkiya K.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1201, 222, '212210394', '5530414', '212210394@gmail.com', '2023-03-07 17:01:51', NULL, 'Navisa Desiyanti Hermawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1202, 222, '212210395', '1114119', '212210395@gmail.com', '2023-03-07 17:01:52', NULL, 'Nazwa Aulia Santana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1203, 222, '212210396', '4482756', '212210396@gmail.com', '2023-03-07 17:01:52', NULL, 'Nurfadilah Safitri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1204, 222, '212210397', '7023481', '212210397@gmail.com', '2023-03-07 17:01:52', NULL, 'Radit Shandy Dwi Putra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1205, 222, '212210398', '4241624', '212210398@gmail.com', '2023-03-07 17:01:52', NULL, 'Reisya Putri Tajudin', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1206, 222, '212210399', '3087948', '212210399@gmail.com', '2023-03-07 17:01:52', NULL, 'Rizky Putra Pratama', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1207, 222, '212210400', '9540322', '212210400@gmail.com', '2023-03-07 17:01:52', NULL, 'Romi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1208, 222, '212210401', '2671956', '212210401@gmail.com', '2023-03-07 17:01:52', NULL, 'Salsabila Dwi Sartika', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1209, 222, '212210402', '5595983', '212210402@gmail.com', '2023-03-07 17:01:52', NULL, 'Siti Sarah Trihapsari', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1210, 222, '212210403', '489266', '212210403@gmail.com', '2023-03-07 17:01:52', NULL, 'Sulthan Putra Madyan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1211, 222, '212210404', '3551737', '212210404@gmail.com', '2023-03-07 17:01:52', NULL, 'Vellen Agvia Nur Ashifa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1212, 222, '212210405', '471220', '212210405@gmail.com', '2023-03-07 17:01:52', NULL, 'Zaenal Mutakin', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1213, 222, '212210112', '8101340', '212210112@gmail.com', '2023-03-07 17:01:52', NULL, 'Zulfan Ahsanul A', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1214, 223, '212210406', '4370666', '212210406@gmail.com', '2023-03-07 17:01:52', NULL, 'Adelia Septiani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1215, 223, '212210407', '3229997', '212210407@gmail.com', '2023-03-07 17:01:52', NULL, 'Ahdan Ramdani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1216, 223, '212210408', '5468701', '212210408@gmail.com', '2023-03-07 17:01:52', NULL, 'Arsyani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1217, 223, '212210409', '8572839', '212210409@gmail.com', '2023-03-07 17:01:52', NULL, 'Azka Azaliyyah Kassyaf', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1218, 223, '212210410', '6885267', '212210410@gmail.com', '2023-03-07 17:01:52', NULL, 'Azkia Miladia Gusman', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1219, 223, '212210411', '5684931', '212210411@gmail.com', '2023-03-07 17:01:52', NULL, 'Catherine Triwidyarti G', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1220, 223, '212210412', '9556836', '212210412@gmail.com', '2023-03-07 17:01:52', NULL, 'Chikal Putri Mawahdi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1221, 223, '212210413', '601209', '212210413@gmail.com', '2023-03-07 17:01:53', NULL, 'Dafi Fadlika', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1222, 223, '212210414', '612824', '212210414@gmail.com', '2023-03-07 17:01:53', NULL, 'Devia Skewa Br Simatupang', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1223, 223, '212210415', '8872407', '212210415@gmail.com', '2023-03-07 17:01:53', NULL, 'Dhepri Arlymar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1224, 223, '212210416', '2682637', '212210416@gmail.com', '2023-03-07 17:01:53', NULL, 'Dwi Rafa Rayani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1225, 223, '212210417', '2595395', '212210417@gmail.com', '2023-03-07 17:01:53', NULL, 'Farrel Haidir Alfathan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1226, 223, '212210418', '5355663', '212210418@gmail.com', '2023-03-07 17:01:53', NULL, 'Felisa Meida', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1227, 223, '212210419', '1195710', '212210419@gmail.com', '2023-03-07 17:01:53', NULL, 'Gimas Tiar Putra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1228, 223, '212210420', '1334874', '212210420@gmail.com', '2023-03-07 17:01:53', NULL, 'Giselle Isabelle Bahtiar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1229, 223, '212210421', '4622880', '212210421@gmail.com', '2023-03-07 17:01:53', NULL, 'Inaya Tabina Ramadhanti', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1230, 223, '212210422', '9174887', '212210422@gmail.com', '2023-03-07 17:01:53', NULL, 'Keisya Khaira Putri A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1231, 223, '212210423', '5927304', '212210423@gmail.com', '2023-03-07 17:01:53', NULL, 'Laras Dita Nuralim', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1232, 223, '212210424', '1824420', '212210424@gmail.com', '2023-03-07 17:01:53', NULL, 'Mahesya Albani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1233, 223, '212210425', '1976853', '212210425@gmail.com', '2023-03-07 17:01:53', NULL, 'Mora Zahwa Nayla', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1234, 223, '212210426', '7380511', '212210426@gmail.com', '2023-03-07 17:01:53', NULL, 'Muhamad Awal Nawawi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1235, 223, '212210427', '2188914', '212210427@gmail.com', '2023-03-07 17:01:53', NULL, 'Muhammad Gumilang Yusamsi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1236, 223, '212210428', '3064009', '212210428@gmail.com', '2023-03-07 17:01:53', NULL, 'Nadia Zahrah Sulaeman', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1237, 223, '212210429', '5900573', '212210429@gmail.com', '2023-03-07 17:01:54', NULL, 'Nayla Zalfa Syahira A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1238, 223, '212210430', '7510213', '212210430@gmail.com', '2023-03-07 17:01:54', NULL, 'Nisriina Faiq Akram', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1239, 223, '212210431', '6904719', '212210431@gmail.com', '2023-03-07 17:01:54', NULL, 'Nurrahma Sya\\\'Baniyya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1240, 223, '212210432', '5327078', '212210432@gmail.com', '2023-03-07 17:01:54', NULL, 'Rafli Mubaroq', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1241, 223, '212210433', '6519543', '212210433@gmail.com', '2023-03-07 17:01:54', NULL, 'Rakha Yuzza Yasman', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1242, 223, '212210434', '2340664', '212210434@gmail.com', '2023-03-07 17:01:54', NULL, 'Ramanda Driamatoga Gultom', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1243, 223, '212210435', '4997624', '212210435@gmail.com', '2023-03-07 17:01:54', NULL, 'Reska Nur Septiani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1244, 223, '212210436', '6504704', '212210436@gmail.com', '2023-03-07 17:01:54', NULL, 'Ridho Satria Bathielda', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1245, 223, '212210437', '5847147', '212210437@gmail.com', '2023-03-07 17:01:54', NULL, 'Salwa Salsabila Gunawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1246, 223, '212210438', '7021242', '212210438@gmail.com', '2023-03-07 17:01:54', NULL, 'Siti Zahra Putri Subarna', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1247, 223, '212210439', '4476417', '212210439@gmail.com', '2023-03-07 17:01:54', NULL, 'Vera', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1248, 223, '212210440', '8897986', '212210440@gmail.com', '2023-03-07 17:01:54', NULL, 'Zulfa Azzahra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1249, 211, '212210001', '9003867', '212210001@gmail.com', '2023-03-07 17:01:54', NULL, 'Aghnat Mahran Jaudan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1250, 211, '212210002', '8793618', '212210002@gmail.com', '2023-03-07 17:01:54', NULL, 'Alayya Mumtaza W.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1251, 211, '212210004', '6988149', '212210004@gmail.com', '2023-03-07 17:01:54', NULL, 'Andina Auliaputri Yusuf', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1252, 211, '212210005', '6026455', '212210005@gmail.com', '2023-03-07 17:01:55', NULL, 'Anikha Anindya Darmawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1253, 211, '212210006', '6201850', '212210006@gmail.com', '2023-03-07 17:01:55', NULL, 'Anisa Bagja Septiani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1254, 211, '212210007', '3474400', '212210007@gmail.com', '2023-03-07 17:01:55', NULL, 'Arleta Febrilla N.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1255, 211, '212210008', '4355133', '212210008@gmail.com', '2023-03-07 17:01:55', NULL, 'Berlian Maharani Ramania', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1256, 211, '212210009', '2498920', '212210009@gmail.com', '2023-03-07 17:01:55', NULL, 'Dhiawita Hanifa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1257, 211, '212210010', '1454414', '212210010@gmail.com', '2023-03-07 17:01:55', NULL, 'Dyvia Fadilla Nazneen', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1258, 211, '212210011', '6543659', '212210011@gmail.com', '2023-03-07 17:01:55', NULL, 'Erika Nasya Pitria', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1259, 211, '212210012', '2427167', '212210012@gmail.com', '2023-03-07 17:01:55', NULL, 'Fania R Dwi Utari', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1260, 211, '212210013', '6687823', '212210013@gmail.com', '2023-03-07 17:01:55', NULL, 'Farah A\\\'Isyah Dwi Lesmana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1261, 211, '212210014', '5044742', '212210014@gmail.com', '2023-03-07 17:01:55', NULL, 'Fawaz Adly Mulyana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1262, 211, '212210015', '1706494', '212210015@gmail.com', '2023-03-07 17:01:55', NULL, 'Hilman Linggawastu', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1263, 211, '212210016', '1800101', '212210016@gmail.com', '2023-03-07 17:01:55', NULL, 'Intan Nabiila Noor', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1264, 211, '212210017', '6797760', '212210017@gmail.com', '2023-03-07 17:01:55', NULL, 'Irghi Satya Priangga', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1265, 211, '212210018', '6600162', '212210018@gmail.com', '2023-03-07 17:01:55', NULL, 'Kasyif Ahmad', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1266, 211, '212210019', '293380', '212210019@gmail.com', '2023-03-07 17:01:55', NULL, 'M.Rizal Pebriansyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1267, 211, '212210020', '9826323', '212210020@gmail.com', '2023-03-07 17:01:55', NULL, 'Mochammad Fadhlan Fasya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1268, 211, '212210021', '9713575', '212210021@gmail.com', '2023-03-07 17:01:56', NULL, 'Muhammad Ridwan Al Fauzi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1269, 211, '212210022', '6050417', '212210022@gmail.com', '2023-03-07 17:01:56', NULL, 'Nayla Zulfa Awalia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1270, 211, '212210023', '6195836', '212210023@gmail.com', '2023-03-07 17:01:56', NULL, 'Neng Mia Andini', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1271, 211, '212210024', '7185327', '212210024@gmail.com', '2023-03-07 17:01:56', NULL, 'Nisrina Mustika', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1272, 211, '212210025', '7152180', '212210025@gmail.com', '2023-03-07 17:01:56', NULL, 'Patih Patihah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1273, 211, '212210026', '5039334', '212210026@gmail.com', '2023-03-07 17:01:56', NULL, 'Pefpriyanti Br Tobing', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1274, 211, '212210027', '6137239', '212210027@gmail.com', '2023-03-07 17:01:56', NULL, 'Rafi Andhira Putra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1275, 211, '212210028', '1610992', '212210028@gmail.com', '2023-03-07 17:01:56', NULL, 'Raisya Azzahra Nurohman', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1276, 211, '212210029', '288096', '212210029@gmail.com', '2023-03-07 17:01:56', NULL, 'Rayhan Detryna Prasetya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1277, 211, '212210030', '3210349', '212210030@gmail.com', '2023-03-07 17:01:56', NULL, 'Reavani Maheswari', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1278, 211, '212210031', '5556769', '212210031@gmail.com', '2023-03-07 17:01:56', NULL, 'Redzuan Al Farizha', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1279, 211, '212210032', '4761599', '212210032@gmail.com', '2023-03-07 17:01:57', NULL, 'Sahnaz Nur Azkiya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1280, 211, '212210033', '8481167', '212210033@gmail.com', '2023-03-07 17:01:57', NULL, 'Salman Alfarisy', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1281, 211, '212210034', '5416736', '212210034@gmail.com', '2023-03-07 17:01:57', NULL, 'Shysi Indah Nurfilailah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1282, 211, '212210035', '799819', '212210035@gmail.com', '2023-03-07 17:01:57', NULL, 'Silvia Tiabasha', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1283, 211, '212210036', '5421681', '212210036@gmail.com', '2023-03-07 17:01:57', NULL, 'Tahira Rahman', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1284, 211, '212210037', '8970379', '212210037@gmail.com', '2023-03-07 17:01:57', NULL, 'Talitha Mughni', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1285, 211, '212210038', '8196673', '212210038@gmail.com', '2023-03-07 17:01:57', NULL, 'Wi\\\'Am Amaliya Hidayat', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1286, 212, '212210039', '9819852', '212210039@gmail.com', '2023-03-07 17:01:57', NULL, 'Achmad Fauzi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1287, 212, '212210040', '9022697', '212210040@gmail.com', '2023-03-07 17:01:57', NULL, 'Alsa Annisa Bilqisthi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1288, 212, '212210041', '7361339', '212210041@gmail.com', '2023-03-07 17:01:57', NULL, 'Arvel Hafiza A. Y.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1289, 212, '212210042', '4113176', '212210042@gmail.com', '2023-03-07 17:01:57', NULL, 'Choky Adriano Sutanto', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1290, 212, '212210043', '3343338', '212210043@gmail.com', '2023-03-07 17:01:57', NULL, 'Derilo Albani Devanda P.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1291, 212, '212210044', '2106594', '212210044@gmail.com', '2023-03-07 17:01:57', NULL, 'Desma Amanda Nur Fitri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1292, 212, '212210045', '6437307', '212210045@gmail.com', '2023-03-07 17:01:57', NULL, 'Dhea Hufy Yusfini', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1293, 212, '212210046', '815220', '212210046@gmail.com', '2023-03-07 17:01:57', NULL, 'Faras Zahwa Alika', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1294, 212, '212210047', '4243049', '212210047@gmail.com', '2023-03-07 17:01:57', NULL, 'Fuja', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1295, 212, '212210048', '9915853', '212210048@gmail.com', '2023-03-07 17:01:58', NULL, 'Gia Zesika Pebrianti', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1296, 212, '212210049', '5961783', '212210049@gmail.com', '2023-03-07 17:01:58', NULL, 'Hellbi Thoriqotunnajiah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1297, 212, '212210050', '4620192', '212210050@gmail.com', '2023-03-07 17:01:58', NULL, 'Hisyam M. Abdurrahman', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1298, 212, '212210051', '1389302', '212210051@gmail.com', '2023-03-07 17:01:58', NULL, 'Jihan Fila Shafa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1299, 212, '212210052', '8633084', '212210052@gmail.com', '2023-03-07 17:01:58', NULL, 'Lu-lu Tsamrotul Fuadah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1300, 212, '212210053', '8064283', '212210053@gmail.com', '2023-03-07 17:01:58', NULL, 'Mesya Shapa Ulhaq', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1301, 212, '212210054', '4310312', '212210054@gmail.com', '2023-03-07 17:01:58', NULL, 'Muhammad Dhafin', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1302, 212, '212210055', '9379223', '212210055@gmail.com', '2023-03-07 17:01:58', NULL, 'Muhammad Zola Z. M.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1303, 212, '212210056', '5925853', '212210056@gmail.com', '2023-03-07 17:01:58', NULL, 'Nabil Prasetio', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1304, 212, '212210057', '8834079', '212210057@gmail.com', '2023-03-07 17:01:58', NULL, 'Nafisya Salsabila B.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1305, 212, '212210058', '7972832', '212210058@gmail.com', '2023-03-07 17:01:58', NULL, 'Najla Aprilla Sasi Kirana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1306, 212, '212210059', '4883402', '212210059@gmail.com', '2023-03-07 17:01:58', NULL, 'Namira Noor Kamilah E.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1307, 212, '212210060', '9736508', '212210060@gmail.com', '2023-03-07 17:01:58', NULL, 'Nazwa Firdhausia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1308, 212, '212210061', '1044427', '212210061@gmail.com', '2023-03-07 17:01:58', NULL, 'Neng Shyfa Dwi Pradani P.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1309, 212, '212210062', '360852', '212210062@gmail.com', '2023-03-07 17:01:58', NULL, 'Putri Nur Syiam', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1310, 212, '212210063', '2132653', '212210063@gmail.com', '2023-03-07 17:01:58', NULL, 'Raden M. Satria Rizqi G.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1311, 212, '212210064', '3693600', '212210064@gmail.com', '2023-03-07 17:01:58', NULL, 'Rafif Mustawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1312, 212, '212210065', '7269317', '212210065@gmail.com', '2023-03-07 17:01:58', NULL, 'Regita Elfira Cahyani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1313, 212, '212210066', '5823367', '212210066@gmail.com', '2023-03-07 17:01:59', NULL, 'Richie Blessing T.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1314, 212, '212210067', '6879645', '212210067@gmail.com', '2023-03-07 17:01:59', NULL, 'Tabina Nika Vania', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1315, 212, '212210068', '3578603', '212210068@gmail.com', '2023-03-07 17:01:59', NULL, 'Tiar Rylova Wangka', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1316, 212, '212210069', '2497337', '212210069@gmail.com', '2023-03-07 17:01:59', NULL, 'Tri Afra Laura Nadhifa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1317, 212, '212210070', '9442214', '212210070@gmail.com', '2023-03-07 17:01:59', NULL, 'Tsania Fitrianisa Gunawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1318, 212, '212210071', '2437431', '212210071@gmail.com', '2023-03-07 17:01:59', NULL, 'Ulfia Rahmannisa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1319, 212, '212210072', '6597585', '212210072@gmail.com', '2023-03-07 17:01:59', NULL, 'Vidya Syalwa Aulia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1320, 212, '212210073', '6619923', '212210073@gmail.com', '2023-03-07 17:01:59', NULL, 'Violin Briliani Islami', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1321, 212, '212210074', '5567770', '212210074@gmail.com', '2023-03-07 17:01:59', NULL, 'Zia Adhwaa Nugraha', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1322, 212, '212210075', '8072742', '212210075@gmail.com', '2023-03-07 17:01:59', NULL, 'Zuhdi Baihaqi Rahman', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1323, 213, '212210076', '3194745', '212210076@gmail.com', '2023-03-07 17:01:59', NULL, 'Aisyah Muthmainnah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1324, 213, '212210077', '8440685', '212210077@gmail.com', '2023-03-07 17:01:59', NULL, 'Akmal Ahmad Nur Mulyadi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1325, 213, '212210078', '651329', '212210078@gmail.com', '2023-03-07 17:01:59', NULL, 'Chika Anggriani L. Br M.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1326, 213, '212210079', '8088823', '212210079@gmail.com', '2023-03-07 17:01:59', NULL, 'Clarisa Angelina Pakpahan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1327, 213, '212210080', '4986691', '212210080@gmail.com', '2023-03-07 17:01:59', NULL, 'Dhistia Naira Falihah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1328, 213, '212210081', '3200918', '212210081@gmail.com', '2023-03-07 17:01:59', NULL, 'Dicky Syam Dermawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1329, 213, '212210082', '9922123', '212210082@gmail.com', '2023-03-07 17:01:59', NULL, 'Dimas Putra Pamungkas', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1330, 213, '212210083', '7729277', '212210083@gmail.com', '2023-03-07 17:01:59', NULL, 'Fadel Dwi Adrian', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1331, 213, '212210084', '951657', '212210084@gmail.com', '2023-03-07 17:01:59', NULL, 'Gelar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1332, 213, '212210085', '280554', '212210085@gmail.com', '2023-03-07 17:01:59', NULL, 'Gusti Mujiba Ahsana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1333, 213, '212210086', '892133', '212210086@gmail.com', '2023-03-07 17:01:59', NULL, 'Hana Nur Adhimi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1334, 213, '212210087', '9390843', '212210087@gmail.com', '2023-03-07 17:01:59', NULL, 'Hani Siti Hudaifah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1335, 213, '212210088', '4302846', '212210088@gmail.com', '2023-03-07 17:01:59', NULL, 'Izmayuki Herdianti Rahayu', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1336, 213, '212210089', '8543266', '212210089@gmail.com', '2023-03-07 17:01:59', NULL, 'Karina Nuraliyah Dermawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1337, 213, '212210090', '7989877', '212210090@gmail.com', '2023-03-07 17:02:00', NULL, 'Kayla Auralia Putri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1338, 213, '212210091', '5190999', '212210091@gmail.com', '2023-03-07 17:02:00', NULL, 'Kayla Khalishah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1339, 213, '212210092', '9206757', '212210092@gmail.com', '2023-03-07 17:02:00', NULL, 'Khairunnisa Maulidina S.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1340, 213, '212210093', '284699', '212210093@gmail.com', '2023-03-07 17:02:00', NULL, 'Marssella Angelita Agba', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1341, 213, '212210094', '7800224', '212210094@gmail.com', '2023-03-07 17:02:00', NULL, 'Mia Meylani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1342, 213, '212210095', '5535231', '212210095@gmail.com', '2023-03-07 17:02:00', NULL, 'Muhammad Akbar Dalmawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1343, 213, '212210096', '877262', '212210096@gmail.com', '2023-03-07 17:02:00', NULL, 'Muhammad Nail Aqsha', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1344, 213, '212210097', '6499572', '212210097@gmail.com', '2023-03-07 17:02:00', NULL, 'Muhammad Nur Malik Mulki', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1345, 213, '212210098', '8346671', '212210098@gmail.com', '2023-03-07 17:02:00', NULL, 'Nadya Aulia Maulidina', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1346, 213, '222311441', '3340303', '222311441@gmail.com', '2023-03-07 17:02:00', NULL, 'Najmi Alifah Hilmiyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1347, 213, '212210099', '6084675', '212210099@gmail.com', '2023-03-07 17:02:00', NULL, 'Nanda Azzahra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1348, 213, '212210100', '4547886', '212210100@gmail.com', '2023-03-07 17:02:00', NULL, 'Naza Hilyatul Auliya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1349, 213, '212210101', '218435', '212210101@gmail.com', '2023-03-07 17:02:00', NULL, 'Neng Zena Suryani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1350, 213, '212210102', '3721389', '212210102@gmail.com', '2023-03-07 17:02:00', NULL, 'Nur Latif Al Khairi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1351, 213, '212210103', '3091631', '212210103@gmail.com', '2023-03-07 17:02:00', NULL, 'Nurul Fazriah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1352, 213, '212210104', '8675673', '212210104@gmail.com', '2023-03-07 17:02:00', NULL, 'Rahma Sri Andini', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1353, 213, '212210105', '8389136', '212210105@gmail.com', '2023-03-07 17:02:01', NULL, 'Rizqi Afrisan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1354, 213, '212210106', '3237712', '212210106@gmail.com', '2023-03-07 17:02:01', NULL, 'Salwa Amalia Rahayu', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1355, 213, '212210107', '6138850', '212210107@gmail.com', '2023-03-07 17:02:01', NULL, 'Shofia Aristina Dewi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1356, 213, '212210108', '6596005', '212210108@gmail.com', '2023-03-07 17:02:01', NULL, 'Siti Aishah ', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1357, 213, '212210109', '5197412', '212210109@gmail.com', '2023-03-07 17:02:01', NULL, 'Syahdan Maojuda Sandi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1358, 213, '212210110', '5612300', '212210110@gmail.com', '2023-03-07 17:02:01', NULL, 'Syazwa Nabilah Nurmawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1359, 213, '212210111', '5794955', '212210111@gmail.com', '2023-03-07 17:02:01', NULL, 'Tsani Istifania Nurgarini', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1360, 214, '212210113', '1119687', '212210113@gmail.com', '2023-03-07 17:02:01', NULL, 'Almas Thifal Fatin', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1361, 214, '212210114', '740679', '212210114@gmail.com', '2023-03-07 17:02:01', NULL, 'Alsya Al Asri Nur Rochim', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1362, 214, '212210115', '6243313', '212210115@gmail.com', '2023-03-07 17:02:01', NULL, 'Aufa Fadhilah Ridwan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1363, 214, '212210116', '2342235', '212210116@gmail.com', '2023-03-07 17:02:01', NULL, 'Bagas Rakha Putra Lasidi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1364, 214, '212210117', '3014643', '212210117@gmail.com', '2023-03-07 17:02:01', NULL, 'Bilal Azriansyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1365, 214, '212210118', '6306702', '212210118@gmail.com', '2023-03-07 17:02:01', NULL, 'Dharma Hafidz Istanto', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1366, 214, '212210119', '944034', '212210119@gmail.com', '2023-03-07 17:02:01', NULL, 'Dhisty Auliya Nurizzani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1367, 214, '212210120', '1328636', '212210120@gmail.com', '2023-03-07 17:02:01', NULL, 'Fadya Hilwi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1368, 214, '212210121', '3479524', '212210121@gmail.com', '2023-03-07 17:02:01', NULL, 'Faiz Muhammad Abrar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1369, 214, '212210122', '1598946', '212210122@gmail.com', '2023-03-07 17:02:02', NULL, 'Fanny Indriyani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1370, 214, '212210123', '3771423', '212210123@gmail.com', '2023-03-07 17:02:02', NULL, 'Keisya Anastasya Nastity', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1371, 214, '212210124', '3160570', '212210124@gmail.com', '2023-03-07 17:02:02', NULL, 'Keisya Widya Fahira Aqila', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1372, 214, '212210125', '9184125', '212210125@gmail.com', '2023-03-07 17:02:02', NULL, 'Laviola Suryana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1373, 214, '212210126', '8289242', '212210126@gmail.com', '2023-03-07 17:02:02', NULL, 'Medeena Salsabila Sargo', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1374, 214, '212210127', '9863698', '212210127@gmail.com', '2023-03-07 17:02:02', NULL, 'Mohamad Zacky N. M.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1375, 214, '212210128', '8793233', '212210128@gmail.com', '2023-03-07 17:02:02', NULL, 'Muhamad Sulthan Dhia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1376, 214, '212210129', '2310444', '212210129@gmail.com', '2023-03-07 17:02:02', NULL, 'Muhammad Ali Akbar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1377, 214, '212210130', '1598870', '212210130@gmail.com', '2023-03-07 17:02:02', NULL, 'Muhammad Bilhasz A. B.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1378, 214, '212210131', '7352234', '212210131@gmail.com', '2023-03-07 17:02:02', NULL, 'Muhammad Rifaldi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1379, 214, '212210132', '7070145', '212210132@gmail.com', '2023-03-07 17:02:02', NULL, 'Naila Rahmanisa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1380, 214, '212210133', '2042834', '212210133@gmail.com', '2023-03-07 17:02:02', NULL, 'Naufal Adriel Muttaqin', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1381, 214, '212210134', '7216443', '212210134@gmail.com', '2023-03-07 17:02:02', NULL, 'Naufal Rafi Primansyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1382, 214, '212210136', '1391633', '212210136@gmail.com', '2023-03-07 17:02:02', NULL, 'Rafa Aryaputra Praja', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1383, 214, '212210137', '3821124', '212210137@gmail.com', '2023-03-07 17:02:02', NULL, 'Rasya Lahira Salwa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1384, 214, '212210138', '5643113', '212210138@gmail.com', '2023-03-07 17:02:02', NULL, 'Revina Salsabila Putri F', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1385, 214, '212210139', '6629299', '212210139@gmail.com', '2023-03-07 17:02:02', NULL, 'Rifqi Syafiq Fauzi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1386, 214, '222311442', '1463021', '222311442@gmail.com', '2023-03-07 17:02:02', NULL, 'Rt Kaylla Rahma Shafira', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1387, 214, '212210140', '9816547', '212210140@gmail.com', '2023-03-07 17:02:02', NULL, 'Sabila Najwah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1388, 214, '212210141', '4915681', '212210141@gmail.com', '2023-03-07 17:02:02', NULL, 'Sahid Reza Al- Muntazhar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1389, 214, '212210142', '4653631', '212210142@gmail.com', '2023-03-07 17:02:03', NULL, 'Salma Haniyah Putri P.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1390, 214, '212210143', '1457874', '212210143@gmail.com', '2023-03-07 17:02:03', NULL, 'Salza Khoerunnisa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1391, 214, '212210144', '9664712', '212210144@gmail.com', '2023-03-07 17:02:03', NULL, 'Shidqi Al-Alimu', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1392, 214, '212210145', '4323681', '212210145@gmail.com', '2023-03-07 17:02:03', NULL, 'Siti Zahra Maudina', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1393, 214, '212210146', '4184182', '212210146@gmail.com', '2023-03-07 17:02:03', NULL, 'Suroya Nazma Huriyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1394, 214, '212210147', '6108179', '212210147@gmail.com', '2023-03-07 17:02:03', NULL, 'Valda Saphira Faulika', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1395, 214, '212210148', '2394793', '212210148@gmail.com', '2023-03-07 17:02:03', NULL, 'Yuni Khoerunnisa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1396, 214, '212210149', '567221', '212210149@gmail.com', '2023-03-07 17:02:03', NULL, 'Zaidan Rizqulloh', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1397, 215, '212210150', '1846095', '212210150@gmail.com', '2023-03-07 17:02:03', NULL, 'Allura Mutiara Natasya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1398, 215, '212210151', '1504503', '212210151@gmail.com', '2023-03-07 17:02:03', NULL, 'Ananda Sabila', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1399, 215, '212210152', '2097401', '212210152@gmail.com', '2023-03-07 17:02:03', NULL, 'Andini Maolani Putri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1400, 215, '212210153', '7876356', '212210153@gmail.com', '2023-03-07 17:02:03', NULL, 'Aria Aura Rachman', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1401, 215, '212210154', '8726525', '212210154@gmail.com', '2023-03-07 17:02:03', NULL, 'Arsel Sidney Supardan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1402, 215, '212210155', '751473', '212210155@gmail.com', '2023-03-07 17:02:03', NULL, 'Azka Haydar\\\'Aqila ', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1403, 215, '212210156', '5216169', '212210156@gmail.com', '2023-03-07 17:02:03', NULL, 'Dina Mardiatul Islami', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1404, 215, '212210157', '7353248', '212210157@gmail.com', '2023-03-07 17:02:03', NULL, 'Fajri Ikhwatul Zam Zam', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1405, 215, '212210158', '1239550', '212210158@gmail.com', '2023-03-07 17:02:03', NULL, 'Fauzi Lukman Nurhakim', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1406, 215, '212210159', '2378577', '212210159@gmail.com', '2023-03-07 17:02:04', NULL, 'Fitria Naila Salsabila', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1407, 215, '212210160', '8147135', '212210160@gmail.com', '2023-03-07 17:02:04', NULL, 'Hari Subagja', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1408, 215, '212210161', '4214975', '212210161@gmail.com', '2023-03-07 17:02:04', NULL, 'Ichlas Teguh Firdaus', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1409, 215, '212210162', '7193200', '212210162@gmail.com', '2023-03-07 17:02:04', NULL, 'Jamaludin Nurfikri D.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1410, 215, '212210163', '9869292', '212210163@gmail.com', '2023-03-07 17:02:04', NULL, 'Kayla Nisa Hanan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1411, 215, '212210165', '8622803', '212210165@gmail.com', '2023-03-07 17:02:04', NULL, 'M Briliant Ilham P.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1412, 215, '212210166', '6782727', '212210166@gmail.com', '2023-03-07 17:02:04', NULL, 'M Khalif Zukaur R. A N', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1413, 215, '212210167', '8679979', '212210167@gmail.com', '2023-03-07 17:02:04', NULL, 'Marfihana Nur A. D.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1414, 215, '212210168', '1124139', '212210168@gmail.com', '2023-03-07 17:02:04', NULL, 'Mochamad Dzaky Muzhaffar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1415, 215, '212210170', '979076', '212210170@gmail.com', '2023-03-07 17:02:04', NULL, 'Muhamad Fahmi S. A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1416, 215, '212210172', '3960514', '212210172@gmail.com', '2023-03-07 17:02:04', NULL, 'Muhammad Fathan A. A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1417, 215, '212210173', '9394500', '212210173@gmail.com', '2023-03-07 17:02:04', NULL, 'Muhammad Gegana W. P.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1418, 215, '212210171', '3497924', '212210171@gmail.com', '2023-03-07 17:02:05', NULL, 'Muhammmad Auliya R.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1419, 215, '212210174', '5641367', '212210174@gmail.com', '2023-03-07 17:02:05', NULL, 'Nadila Ferdinia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1420, 215, '212210175', '5200405', '212210175@gmail.com', '2023-03-07 17:02:05', NULL, 'Nafidz Alfarisi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1421, 215, '212210176', '3139675', '212210176@gmail.com', '2023-03-07 17:02:05', NULL, 'Naflah Cayadewi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1422, 215, '212210177', '3252285', '212210177@gmail.com', '2023-03-07 17:02:05', NULL, 'Najua Jahra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1423, 215, '212210178', '1327140', '212210178@gmail.com', '2023-03-07 17:02:05', NULL, 'Neneng Sera Kurniawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1424, 215, '212210179', '2185013', '212210179@gmail.com', '2023-03-07 17:02:05', NULL, 'Pani Julianti', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1425, 215, '212210180', '2010592', '212210180@gmail.com', '2023-03-07 17:02:05', NULL, 'Reva Safarina Anggraeni', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1426, 215, '212210181', '1695358', '212210181@gmail.com', '2023-03-07 17:02:05', NULL, 'Salma Nayla', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1427, 215, '212210182', '7818858', '212210182@gmail.com', '2023-03-07 17:02:05', NULL, 'Shelza Putri Maretza', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1428, 215, '212210183', '8507108', '212210183@gmail.com', '2023-03-07 17:02:05', NULL, 'Silvi Nurfauji', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1429, 215, '212210184', '5562169', '212210184@gmail.com', '2023-03-07 17:02:05', NULL, 'Vallyza Salsabilla A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1430, 215, '212210185', '5696425', '212210185@gmail.com', '2023-03-07 17:02:05', NULL, 'Zahwa Nur Sabila', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1431, 215, '212210186', '8346110', '212210186@gmail.com', '2023-03-07 17:02:05', NULL, 'Zazkya Khansa Salsabila', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1432, 216, '212210187', '8532008', '212210187@gmail.com', '2023-03-07 17:02:05', NULL, 'Abdan Syakuro', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1433, 216, '212210188', '6480748', '212210188@gmail.com', '2023-03-07 17:02:06', NULL, 'Agpi Herdiansyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1434, 216, '212210189', '8724825', '212210189@gmail.com', '2023-03-07 17:02:06', NULL, 'Aliyya Nurul Shaumi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1435, 216, '212210190', '5313688', '212210190@gmail.com', '2023-03-07 17:02:06', NULL, 'Anggitha Safitri Darmawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1436, 216, '212210191', '1910165', '212210191@gmail.com', '2023-03-07 17:02:06', NULL, 'Aninda Finkan Meira', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1437, 216, '212210192', '2087821', '212210192@gmail.com', '2023-03-07 17:02:06', NULL, 'Aufa Lufi Akifah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1438, 216, '212210193', '8568610', '212210193@gmail.com', '2023-03-07 17:02:06', NULL, 'Ayisha Fatia Athifah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1439, 216, '212210194', '3857973', '212210194@gmail.com', '2023-03-07 17:02:06', NULL, 'Brian Demas Elfreda Rakha', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1440, 216, '212210195', '135389', '212210195@gmail.com', '2023-03-07 17:02:06', NULL, 'Dava Ramadhan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1441, 216, '212210196', '7528535', '212210196@gmail.com', '2023-03-07 17:02:06', NULL, 'Dhiyaa Rifa Naurah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1442, 216, '212210197', '6120822', '212210197@gmail.com', '2023-03-07 17:02:06', NULL, 'Fadhil Ahmad Haiffand P.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1443, 216, '212210198', '6376831', '212210198@gmail.com', '2023-03-07 17:02:06', NULL, 'Fandi Baskara', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1444, 216, '212210199', '5563501', '212210199@gmail.com', '2023-03-07 17:02:06', NULL, 'Firla Ayu Komara', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1445, 216, '212210200', '1203113', '212210200@gmail.com', '2023-03-07 17:02:06', NULL, 'Gina Amalia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1446, 216, '212210201', '7125720', '212210201@gmail.com', '2023-03-07 17:02:06', NULL, 'Karina Anggia Dewi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1447, 216, '212210202', '8856648', '212210202@gmail.com', '2023-03-07 17:02:06', NULL, 'Kinan Hakim', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1448, 216, '212210203', '2730970', '212210203@gmail.com', '2023-03-07 17:02:06', NULL, 'Lakayla Firyaal A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1449, 216, '212210204', '7747200', '212210204@gmail.com', '2023-03-07 17:02:06', NULL, 'Maliki Albany Railan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1450, 216, '212210205', '6875019', '212210205@gmail.com', '2023-03-07 17:02:06', NULL, 'Mazaya Syakira Aulia S.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1451, 216, '212210206', '3657012', '212210206@gmail.com', '2023-03-07 17:02:06', NULL, 'Meutia Nabila Amanda', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1452, 216, '212210207', '7485199', '212210207@gmail.com', '2023-03-07 17:02:06', NULL, 'Mohammad Rifki Taufiq', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1453, 216, '212210208', '5749843', '212210208@gmail.com', '2023-03-07 17:02:07', NULL, 'Najwa Nursabani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1454, 216, '212210209', '8117775', '212210209@gmail.com', '2023-03-07 17:02:07', NULL, 'Najwa Sintia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1455, 216, '212210210', '639801', '212210210@gmail.com', '2023-03-07 17:02:07', NULL, 'Nazril Ilham Rusdiana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1456, 216, '212210211', '5330673', '212210211@gmail.com', '2023-03-07 17:02:07', NULL, 'Nizar Taufik Zulfitri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1457, 216, '212210213', '1875296', '212210213@gmail.com', '2023-03-07 17:02:07', NULL, 'Riffky Saputra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1458, 216, '212210214', '311558', '212210214@gmail.com', '2023-03-07 17:02:07', NULL, 'Salman Santika Abdullah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1459, 216, '212210215', '9250068', '212210215@gmail.com', '2023-03-07 17:02:07', NULL, 'Sri Azkia Utami', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1460, 216, '212210216', '9476944', '212210216@gmail.com', '2023-03-07 17:02:07', NULL, 'Syalika Syahira Zahra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1461, 216, '212210217', '5379197', '212210217@gmail.com', '2023-03-07 17:02:07', NULL, 'Tastbita Naura Brilliany', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1462, 216, '212210218', '2122858', '212210218@gmail.com', '2023-03-07 17:02:07', NULL, 'Tiara Citra E.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1463, 216, '212210219', '8067178', '212210219@gmail.com', '2023-03-07 17:02:07', NULL, 'Tomi Kuswara', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1464, 216, '212210220', '5202355', '212210220@gmail.com', '2023-03-07 17:02:07', NULL, 'Zahra Agreika Putri G.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1465, 216, '212210221', '9247610', '212210221@gmail.com', '2023-03-07 17:02:07', NULL, 'Zalfa Octavia Ramadhani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1466, 216, '212210222', '3287029', '212210222@gmail.com', '2023-03-07 17:02:07', NULL, 'Zasmina Silva Setiawan P.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1467, 216, '212210223', '3037591', '212210223@gmail.com', '2023-03-07 17:02:07', NULL, 'Zayyin Adhytia N.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1468, 217, '212210224', '5363193', '212210224@gmail.com', '2023-03-07 17:02:07', NULL, 'Aldy Panca Maulana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1469, 217, '212210225', '1862885', '212210225@gmail.com', '2023-03-07 17:02:07', NULL, 'Aurellya Cristoval', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1470, 217, '212210226', '2482006', '212210226@gmail.com', '2023-03-07 17:02:07', NULL, 'Bagas Julian H. S. P.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1471, 217, '212210227', '8811981', '212210227@gmail.com', '2023-03-07 17:02:07', NULL, 'Bahtiar Yusup', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1472, 217, '212210228', '8951290', '212210228@gmail.com', '2023-03-07 17:02:07', NULL, 'Belen Ramadhan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1473, 217, '212210229', '8823805', '212210229@gmail.com', '2023-03-07 17:02:07', NULL, 'Bulan Sri Andini', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1474, 217, '212210230', '9118810', '212210230@gmail.com', '2023-03-07 17:02:07', NULL, 'Chelsea Ramadhani P. A.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1475, 217, '212210231', '7266319', '212210231@gmail.com', '2023-03-07 17:02:08', NULL, 'Dwi Maulidya K. P. S.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1476, 217, '212210232', '4285814', '212210232@gmail.com', '2023-03-07 17:02:08', NULL, 'Fathurrohman Ibrahim', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1477, 217, '212210233', '355643', '212210233@gmail.com', '2023-03-07 17:02:08', NULL, 'Ihsan Fauzi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1478, 217, '212210234', '7453623', '212210234@gmail.com', '2023-03-07 17:02:08', NULL, 'Inneu Winarti', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1479, 217, '212210236', '6173504', '212210236@gmail.com', '2023-03-07 17:02:08', NULL, 'Linda Mega Aulia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1480, 217, '212210237', '7029237', '212210237@gmail.com', '2023-03-07 17:02:08', NULL, 'Maudy Clarina D. P.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1481, 217, '212210238', '2746834', '212210238@gmail.com', '2023-03-07 17:02:08', NULL, 'Muhamad Jaqi Alenta P.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1482, 217, '212210239', '6029059', '212210239@gmail.com', '2023-03-07 17:02:08', NULL, 'Mutia Salsabilla J.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1483, 217, '212210240', '4322430', '212210240@gmail.com', '2023-03-07 17:02:08', NULL, 'Nadhifa Alya Sonjaya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1484, 217, '212210241', '3672328', '212210241@gmail.com', '2023-03-07 17:02:08', NULL, 'Nafisa Dinar Afinnas', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1485, 217, '212210242', '5506517', '212210242@gmail.com', '2023-03-07 17:02:08', NULL, 'Najelia Amiera Bilqis S.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1486, 217, '212210243', '1728336', '212210243@gmail.com', '2023-03-07 17:02:08', NULL, 'Natasya Tertia Maghfira', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1487, 217, '212210244', '4228091', '212210244@gmail.com', '2023-03-07 17:02:08', NULL, 'Naufal Dzaki Aristianto', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1488, 217, '212210245', '7584838', '212210245@gmail.com', '2023-03-07 17:02:08', NULL, 'Nayla Amalia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1489, 217, '212210246', '870481', '212210246@gmail.com', '2023-03-07 17:02:08', NULL, 'Nuri Elvina', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1490, 217, '212210247', '810590', '212210247@gmail.com', '2023-03-07 17:02:08', NULL, 'Putri Rizky Juniar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1491, 217, '212210248', '2247621', '212210248@gmail.com', '2023-03-07 17:02:08', NULL, 'Rabi Dikri Suhjana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1492, 217, '212210249', '8594029', '212210249@gmail.com', '2023-03-07 17:02:08', NULL, 'Ragana Tatar Galuh', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1493, 217, '212210250', '2577005', '212210250@gmail.com', '2023-03-07 17:02:09', NULL, 'Rasyano Lazuardi Rahmat', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1494, 217, '212210251', '3384409', '212210251@gmail.com', '2023-03-07 17:02:09', NULL, 'Rehan Farid', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1495, 217, '212210252', '4422910', '212210252@gmail.com', '2023-03-07 17:02:09', NULL, 'Reilo Milad Alhud', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1496, 217, '212210253', '2035680', '212210253@gmail.com', '2023-03-07 17:02:09', NULL, 'Reva Putri Herdiansyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1497, 217, '212210254', '1384409', '212210254@gmail.com', '2023-03-07 17:02:09', NULL, 'Reyna Khoirunnisa', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1498, 217, '212210255', '1481488', '212210255@gmail.com', '2023-03-07 17:02:09', NULL, 'Roby Atarik Febriansyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1499, 217, '212210256', '4466171', '212210256@gmail.com', '2023-03-07 17:02:09', NULL, 'Sigit Musa Ali', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1500, 217, '212210257', '4587739', '212210257@gmail.com', '2023-03-07 17:02:09', NULL, 'Siti Azmi Syarah Aulia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1501, 217, '212210258', '2199376', '212210258@gmail.com', '2023-03-07 17:02:09', NULL, 'Syara Nurdina', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1502, 217, '212210259', '5312172', '212210259@gmail.com', '2023-03-07 17:02:09', NULL, 'Trya Gustiani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1503, 217, '212210260', '3290292', '212210260@gmail.com', '2023-03-07 17:02:09', NULL, 'Zulfa Ziana Azahra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1504, 218, '212210261', '9205447', '212210261@gmail.com', '2023-03-07 17:02:09', NULL, 'Adline Putri Hafidziani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1505, 218, '212210262', '891592', '212210262@gmail.com', '2023-03-07 17:02:09', NULL, 'Albin Muhammad Wiryawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1506, 218, '212210263', '3106450', '212210263@gmail.com', '2023-03-07 17:02:09', NULL, 'Atmini Marshaliani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1507, 218, '212210264', '3878798', '212210264@gmail.com', '2023-03-07 17:02:09', NULL, 'Azhar Fardiana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1508, 218, '212210265', '2889254', '212210265@gmail.com', '2023-03-07 17:02:09', NULL, 'Cahaya Nafisah Ibnatu S.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1509, 218, '212210266', '1509569', '212210266@gmail.com', '2023-03-07 17:02:09', NULL, 'Depi Anjani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1510, 218, '212210267', '9258589', '212210267@gmail.com', '2023-03-07 17:02:10', NULL, 'Ervina Cahyani Putri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1511, 218, '212210268', '5829978', '212210268@gmail.com', '2023-03-07 17:02:10', NULL, 'Febrina Putri Firdaus', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1512, 218, '212210269', '379444', '212210269@gmail.com', '2023-03-07 17:02:10', NULL, 'Fitri Fathonah Adi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1513, 218, '212210270', '6862172', '212210270@gmail.com', '2023-03-07 17:02:10', NULL, 'Girant Anfisabil Haqsa D', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1514, 218, '222311443', '8740217', '222311443@gmail.com', '2023-03-07 17:02:10', NULL, 'Hasna Nadine', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1515, 218, '212210271', '192282', '212210271@gmail.com', '2023-03-07 17:02:10', NULL, 'Ismena Adaliyah Mawardi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1516, 218, '212210272', '2205543', '212210272@gmail.com', '2023-03-07 17:02:10', NULL, 'Kembara Tamma Progresto', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1517, 218, '212210273', '8748774', '212210273@gmail.com', '2023-03-07 17:02:10', NULL, 'Landra Al Fawwaz', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1518, 218, '212210274', '3238935', '212210274@gmail.com', '2023-03-07 17:02:10', NULL, 'Muhamad Fajri Ar Rasyid', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1519, 218, '212210275', '5800653', '212210275@gmail.com', '2023-03-07 17:02:10', NULL, 'Muhammad Hanif Al Farisi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1520, 218, '212210276', '1453421', '212210276@gmail.com', '2023-03-07 17:02:10', NULL, 'Muhammad Naufal Firdaus', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1521, 218, '212210277', '5057993', '212210277@gmail.com', '2023-03-07 17:02:10', NULL, 'Muhammad Syawal Bakti S.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1522, 218, '212210278', '4065881', '212210278@gmail.com', '2023-03-07 17:02:10', NULL, 'Muhammad Zaky Khoery', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1523, 218, '212210280', '3631118', '212210280@gmail.com', '2023-03-07 17:02:10', NULL, 'Nadia Safinattunnazah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1524, 218, '212210281', '8687413', '212210281@gmail.com', '2023-03-07 17:02:10', NULL, 'Nailah Fadilah S. S.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1525, 218, '212210283', '3499319', '212210283@gmail.com', '2023-03-07 17:02:10', NULL, 'Novia Kartika Rahayu', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1526, 218, '212210284', '709147', '212210284@gmail.com', '2023-03-07 17:02:10', NULL, 'Putri Melati Budiani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1527, 218, '212210285', '4286478', '212210285@gmail.com', '2023-03-07 17:02:10', NULL, 'Raden Abimanyu P. K.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1528, 218, '212210286', '6516860', '212210286@gmail.com', '2023-03-07 17:02:11', NULL, 'Rafa Mikail Jurdan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1529, 218, '212210287', '6913797', '212210287@gmail.com', '2023-03-07 17:02:11', NULL, 'Raffabian Friezy Setiawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1530, 218, '212210288', '994056', '212210288@gmail.com', '2023-03-07 17:02:11', NULL, 'Rahma Pradyia Dwita', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1531, 218, '212210289', '1958327', '212210289@gmail.com', '2023-03-07 17:02:11', NULL, 'Raka Shandy Esa Putra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1532, 218, '212210290', '9676036', '212210290@gmail.com', '2023-03-07 17:02:11', NULL, 'Rakka Rifael Al-Ziqri', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1533, 218, '212210291', '1439446', '212210291@gmail.com', '2023-03-07 17:02:11', NULL, 'Resi Juniar', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1534, 218, '212210292', '6307821', '212210292@gmail.com', '2023-03-07 17:02:11', NULL, 'Resti Cahaya Nabila', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1535, 218, '212210293', '3215180', '212210293@gmail.com', '2023-03-07 17:02:11', NULL, 'Satria Teza Permana', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1536, 218, '212210294', '4466457', '212210294@gmail.com', '2023-03-07 17:02:11', NULL, 'Tazkia Aulia Zahra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1537, 218, '212210295', '2056787', '212210295@gmail.com', '2023-03-07 17:02:11', NULL, 'Thalya Sukmawati Dahlan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1538, 218, '212210296', '1820117', '212210296@gmail.com', '2023-03-07 17:02:11', NULL, 'Thania Rosalie', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1539, 218, '212210297', '6204268', '212210297@gmail.com', '2023-03-07 17:02:11', NULL, 'Zulfa Januar Sodikin', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1540, 219, '212210298', '1516521', '212210298@gmail.com', '2023-03-07 17:02:11', NULL, 'Ahmad Tsaqib Waldimir', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1541, 219, '212210299', '4489492', '212210299@gmail.com', '2023-03-07 17:02:11', NULL, 'Aisya Athaa Nathifa B.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1542, 219, '212210300', '7791699', '212210300@gmail.com', '2023-03-07 17:02:11', NULL, 'Alma Nova Nazmi Mubarak', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1543, 219, '212210301', '3666206', '212210301@gmail.com', '2023-03-07 17:02:11', NULL, 'Azzahra Mutmainah K.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1544, 219, '212210302', '9522729', '212210302@gmail.com', '2023-03-07 17:02:12', NULL, 'Damania A. Kurniati', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1545, 219, '212210303', '5247471', '212210303@gmail.com', '2023-03-07 17:02:12', NULL, 'Fitriani Rizkia Nurjanah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1546, 219, '212210304', '8098996', '212210304@gmail.com', '2023-03-07 17:02:12', NULL, 'Hanifa Aulia Al-Afyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1547, 219, '212210305', '1387638', '212210305@gmail.com', '2023-03-07 17:02:12', NULL, 'Keysha Garcia Faizal', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1548, 219, '212210306', '339123', '212210306@gmail.com', '2023-03-07 17:02:12', NULL, 'M Bagas Daniswara', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1549, 219, '212210307', '929525', '212210307@gmail.com', '2023-03-07 17:02:12', NULL, 'M. Haqqi Muzakir', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1550, 219, '212210308', '5646542', '212210308@gmail.com', '2023-03-07 17:02:12', NULL, 'Marsha Masayu Virginia', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1551, 219, '212210309', '130564', '212210309@gmail.com', '2023-03-07 17:02:12', NULL, 'Moch Azriel Naufan H.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1552, 219, '212210310', '6844060', '212210310@gmail.com', '2023-03-07 17:02:12', NULL, 'Mughny Suffatul M.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1553, 219, '212210312', '3524393', '212210312@gmail.com', '2023-03-07 17:02:12', NULL, 'Muhammad Dzimar Fawwazi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1554, 219, '212210313', '7115426', '212210313@gmail.com', '2023-03-07 17:02:12', NULL, 'Muhammad Saepudin', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1555, 219, '212210314', '929728', '212210314@gmail.com', '2023-03-07 17:02:12', NULL, 'Muhammad Tsaqif Al Qadr', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1556, 219, '212210315', '7320991', '212210315@gmail.com', '2023-03-07 17:02:12', NULL, 'Naima Fitria Assabila', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1557, 219, '212210316', '3288276', '212210316@gmail.com', '2023-03-07 17:02:12', NULL, 'Nayda Shaliha Rizwansyah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1558, 219, '212210317', '2731360', '212210317@gmail.com', '2023-03-07 17:02:12', NULL, 'Rafi Syahran Ramadhan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1559, 219, '212210318', '4401526', '212210318@gmail.com', '2023-03-07 17:02:12', NULL, 'Raissa Fasya Sabila', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1560, 219, '212210319', '7746817', '212210319@gmail.com', '2023-03-07 17:02:12', NULL, 'Rakha Mahija Pranaya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1561, 219, '212210320', '5795815', '212210320@gmail.com', '2023-03-07 17:02:13', NULL, 'Rayhan Azka', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1562, 219, '212210321', '1373239', '212210321@gmail.com', '2023-03-07 17:02:13', NULL, 'Reinathan Caesario Firas', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1563, 219, '212210322', '8514899', '212210322@gmail.com', '2023-03-07 17:02:13', NULL, 'Revaldi Ahmad Nurhakim', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1564, 219, '212210323', '4465744', '212210323@gmail.com', '2023-03-07 17:02:13', NULL, 'Riggo Yoga Darmawan', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1565, 219, '212210324', '9999326', '212210324@gmail.com', '2023-03-07 17:02:13', NULL, 'Salma Wafirah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1566, 219, '212210325', '2194623', '212210325@gmail.com', '2023-03-07 17:02:13', NULL, 'Salwa Nurfadilah', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1567, 219, '212210326', '1864128', '212210326@gmail.com', '2023-03-07 17:02:13', NULL, 'Satria Guna Jaya', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1568, 219, '212210327', '2172197', '212210327@gmail.com', '2023-03-07 17:02:13', NULL, 'Shaqila Poetri Azzahra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1569, 219, '212210328', '4270029', '212210328@gmail.com', '2023-03-07 17:02:13', NULL, 'Siti Salamah Ramadhani', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1570, 219, '212210329', '2419686', '212210329@gmail.com', '2023-03-07 17:02:13', NULL, 'Syachlevi Ibrahim', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1571, 219, '212210330', '7080004', '212210330@gmail.com', '2023-03-07 17:02:13', NULL, 'Talitha Siti Salsabila', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1572, 219, '212210331', '4122488', '212210331@gmail.com', '2023-03-07 17:02:13', NULL, 'Tyara Carolina Zahra', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1573, 219, '212210332', '5711691', '212210332@gmail.com', '2023-03-07 17:02:13', NULL, 'Valda Evania Efendi', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1574, 219, '212210333', '2641601', '212210333@gmail.com', '2023-03-07 17:02:13', NULL, 'Vayola Aura Mecca', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1575, 219, '212210334', '8240184', '212210334@gmail.com', '2023-03-07 17:02:13', NULL, 'Zahirah Alwah L. M.', NULL, NULL, 1, '0');
INSERT INTO `cbt_user` VALUES (1576, 321, '202110325', '7850512', '202110325@gmail.com', '2023-03-07 17:02:13', NULL, 'Ajeng Sri Heryani P.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1577, 321, '202110326', '8163116', '202110326@gmail.com', '2023-03-07 17:02:14', NULL, 'Akmal Reihan Rediandi P.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1578, 321, '202110327', '8167777', '202110327@gmail.com', '2023-03-07 17:02:14', NULL, 'Ananda Putri Medina', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1579, 321, '202110328', '2468360', '202110328@gmail.com', '2023-03-07 17:02:14', NULL, 'Annisa Nurul\\\'Aini', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1580, 321, '202110329', '3134799', '202110329@gmail.com', '2023-03-07 17:02:14', NULL, 'Aprillia Rossa Dharmawan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1581, 321, '202110330', '4100724', '202110330@gmail.com', '2023-03-07 17:02:14', NULL, 'Aprizia Perenial Asla W.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1582, 321, '202110331', '6618335', '202110331@gmail.com', '2023-03-07 17:02:14', NULL, 'Berliani Regita Putri K.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1583, 321, '202110332', '798769', '202110332@gmail.com', '2023-03-07 17:02:14', NULL, 'Dita Aditama', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1584, 321, '202110333', '4028636', '202110333@gmail.com', '2023-03-07 17:02:14', NULL, 'Dita Nur Rosmawati', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1585, 321, '202110334', '4131479', '202110334@gmail.com', '2023-03-07 17:02:14', NULL, 'Dliya Shafa Azizah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1586, 321, '202110335', '921011', '202110335@gmail.com', '2023-03-07 17:02:14', NULL, 'Fairuz Rizal Abdul Qudus', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1587, 321, '202110336', '2778372', '202110336@gmail.com', '2023-03-07 17:02:14', NULL, 'Farhah Nailatur Rahmah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1588, 321, '202110337', '4828348', '202110337@gmail.com', '2023-03-07 17:02:14', NULL, 'Ferrasta Deva Budaya', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1589, 321, '202110338', '9132227', '202110338@gmail.com', '2023-03-07 17:02:14', NULL, 'Gita Dwi Yulianti', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1590, 321, '202110339', '3452440', '202110339@gmail.com', '2023-03-07 17:02:14', NULL, 'Hasbi M. Syafiq Putra A.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1591, 321, '202110340', '5399946', '202110340@gmail.com', '2023-03-07 17:02:14', NULL, 'Heliana Putri Ansory', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1592, 321, '202110342', '6834275', '202110342@gmail.com', '2023-03-07 17:02:14', NULL, 'Moch Arsyal Raffa G. S.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1593, 321, '202110343', '5526232', '202110343@gmail.com', '2023-03-07 17:02:15', NULL, 'Moch Fauzan Muttaqin', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1594, 321, '202110344', '3034818', '202110344@gmail.com', '2023-03-07 17:02:15', NULL, 'Mohamad Aqil Almuqtafi T.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1595, 321, '202110345', '7897810', '202110345@gmail.com', '2023-03-07 17:02:15', NULL, 'Muhamad Athar Nur Athifal', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1596, 321, '202110346', '9569369', '202110346@gmail.com', '2023-03-07 17:02:15', NULL, 'Muhamad Fadhli Saepul M.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1597, 321, '202110347', '6144875', '202110347@gmail.com', '2023-03-07 17:02:15', NULL, 'Muhammad Fachriel T. M.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1598, 321, '202110348', '7235702', '202110348@gmail.com', '2023-03-07 17:02:15', NULL, 'Nabiel Ardiana Sembada', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1599, 321, '202110349', '7196507', '202110349@gmail.com', '2023-03-07 17:02:15', NULL, 'Nabil Taqiy Dhiyasatya', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1600, 321, '202110350', '164310', '202110350@gmail.com', '2023-03-07 17:02:15', NULL, 'Nisya Triyani Avrilya', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1601, 321, '202110351', '5148565', '202110351@gmail.com', '2023-03-07 17:02:15', NULL, 'Novi Nurdiyanti', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1602, 321, '202110352', '1555722', '202110352@gmail.com', '2023-03-07 17:02:15', NULL, 'Putri Siti Nabila', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1603, 321, '202110353', '9745601', '202110353@gmail.com', '2023-03-07 17:02:15', NULL, 'Raisya Ismail', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1604, 321, '202110354', '3590596', '202110354@gmail.com', '2023-03-07 17:02:15', NULL, 'Raisya Nazwa Ayudia T.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1605, 321, '202110355', '8190589', '202110355@gmail.com', '2023-03-07 17:02:15', NULL, 'Rebisa Novia Eva R.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1606, 321, '202110356', '5479047', '202110356@gmail.com', '2023-03-07 17:02:15', NULL, 'Reza Moch Ramadhan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1607, 321, '202110357', '4585403', '202110357@gmail.com', '2023-03-07 17:02:15', NULL, 'Sanggam Nainggolan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1608, 321, '202110358', '3348063', '202110358@gmail.com', '2023-03-07 17:02:15', NULL, 'Tasya Ameralena', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1609, 321, '202110359', '890473', '202110359@gmail.com', '2023-03-07 17:02:15', NULL, 'Yasa Satria Ismail', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1610, 321, '202110360', '6241911', '202110360@gmail.com', '2023-03-07 17:02:15', NULL, 'Zalfa Naqiyah Alifah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1611, 322, '202110361', '1524288', '202110361@gmail.com', '2023-03-07 17:02:15', NULL, 'Abyan Ilyasa Putra Malik', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1612, 322, '202110362', '8059852', '202110362@gmail.com', '2023-03-07 17:02:16', NULL, 'Afina Carissa Ikhsan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1613, 322, '202110363', '5539195', '202110363@gmail.com', '2023-03-07 17:02:16', NULL, 'Agni Rahmadini Putri', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1614, 322, '202110364', '3282170', '202110364@gmail.com', '2023-03-07 17:02:16', NULL, 'Ai Sintya Sari', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1615, 322, '202110365', '4861186', '202110365@gmail.com', '2023-03-07 17:02:16', NULL, 'Albifaridz Ramadhan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1616, 322, '202110366', '2762509', '202110366@gmail.com', '2023-03-07 17:02:16', NULL, 'Alifia Zahra', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1617, 322, '202110367', '901462', '202110367@gmail.com', '2023-03-07 17:02:16', NULL, 'Alya Ramadhani T.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1618, 322, '202110368', '8724995', '202110368@gmail.com', '2023-03-07 17:02:16', NULL, 'Ananda Salma Elvira', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1619, 322, '202110369', '2731635', '202110369@gmail.com', '2023-03-07 17:02:16', NULL, 'Aurely Rizky Syabani N.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1620, 322, '202110370', '9234419', '202110370@gmail.com', '2023-03-07 17:02:16', NULL, 'Azmi Renalji', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1621, 322, '202110371', '4686531', '202110371@gmail.com', '2023-03-07 17:02:16', NULL, 'Citra Dwi Lestari', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1622, 322, '202110372', '4026054', '202110372@gmail.com', '2023-03-07 17:02:16', NULL, 'Dewi Titik Sari', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1623, 322, '202110373', '7810761', '202110373@gmail.com', '2023-03-07 17:02:16', NULL, 'Dhyfal Fakhriy Hakim', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1624, 322, '202110374', '2588994', '202110374@gmail.com', '2023-03-07 17:02:16', NULL, 'Fauzia Azzahra', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1625, 322, '202110375', '8919465', '202110375@gmail.com', '2023-03-07 17:02:16', NULL, 'Halika Afwa Ramaida', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1626, 322, '212211434', '4752312', '212211434@gmail.com', '2023-03-07 17:02:16', NULL, 'Ibnu Wahid Zein', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1627, 322, '202110377', '3204876', '202110377@gmail.com', '2023-03-07 17:02:16', NULL, 'Indah Tia Rajawali', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1628, 322, '202110378', '5736836', '202110378@gmail.com', '2023-03-07 17:02:17', NULL, 'Maitsa Tsabitah A.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1629, 322, '202110380', '3356148', '202110380@gmail.com', '2023-03-07 17:02:17', NULL, 'Muhammad Arya Wiguna', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1630, 322, '202110381', '9703413', '202110381@gmail.com', '2023-03-07 17:02:17', NULL, 'Muhammad Raihan Irwan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1631, 322, '202110382', '436756', '202110382@gmail.com', '2023-03-07 17:02:17', NULL, 'Muhammad Rayhan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1632, 322, '202110383', '6708014', '202110383@gmail.com', '2023-03-07 17:02:17', NULL, 'Muhammad Taufik Amarullah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1633, 322, '202110384', '7206239', '202110384@gmail.com', '2023-03-07 17:02:17', NULL, 'Naiya Fazkia Putri Nurdin', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1634, 322, '202110385', '9615482', '202110385@gmail.com', '2023-03-07 17:02:17', NULL, 'Nurfitri Armelia', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1635, 322, '202110386', '3275540', '202110386@gmail.com', '2023-03-07 17:02:17', NULL, 'Pebri Pebrianti', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1636, 322, '202110387', '9893384', '202110387@gmail.com', '2023-03-07 17:02:17', NULL, 'Rafli Achmad Slamet', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1637, 322, '202110388', '9154309', '202110388@gmail.com', '2023-03-07 17:02:17', NULL, 'Rahmat Hidayat', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1638, 322, '202110389', '5133949', '202110389@gmail.com', '2023-03-07 17:02:17', NULL, 'Salsa Khairunnisa', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1639, 322, '202110390', '6375878', '202110390@gmail.com', '2023-03-07 17:02:17', NULL, 'Seli Rohali', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1640, 322, '202110391', '6091824', '202110391@gmail.com', '2023-03-07 17:02:17', NULL, 'Wardah Raihatul Jannah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1641, 322, '202110393', '2012451', '202110393@gmail.com', '2023-03-07 17:02:17', NULL, 'Yuamita Rachmadina Intani', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1642, 322, '202110394', '1606447', '202110394@gmail.com', '2023-03-07 17:02:17', NULL, 'Yuwono Wicaksono', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1643, 322, '202110395', '5666951', '202110395@gmail.com', '2023-03-07 17:02:17', NULL, 'Zeyad Nurova', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1644, 322, '202110396', '5491015', '202110396@gmail.com', '2023-03-07 17:02:17', NULL, 'Zulparhan Sabil Arrasyid', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1645, 323, '202110397', '5221125', '202110397@gmail.com', '2023-03-07 17:02:17', NULL, 'Al Amanda Gelar Tasa', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1646, 323, '202110398', '8772178', '202110398@gmail.com', '2023-03-07 17:02:17', NULL, 'Alifa Zinka Pranada', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1647, 323, '202110399', '3754621', '202110399@gmail.com', '2023-03-07 17:02:17', NULL, 'Angel Ronauli Ritonga', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1648, 323, '202110400', '970007', '202110400@gmail.com', '2023-03-07 17:02:18', NULL, 'Aulyasa Hanif Cantara', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1649, 323, '202110401', '823141', '202110401@gmail.com', '2023-03-07 17:02:18', NULL, 'Azrel Diva Abiansyah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1650, 323, '202110402', '7567690', '202110402@gmail.com', '2023-03-07 17:02:18', NULL, 'Cecilia Clairin R.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1651, 323, '202110403', '4918195', '202110403@gmail.com', '2023-03-07 17:02:18', NULL, 'Denissa Putri Dimardika', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1652, 323, '202110404', '6851810', '202110404@gmail.com', '2023-03-07 17:02:18', NULL, 'Diva Nindya Mardhotillah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1653, 323, '202110405', '9017610', '202110405@gmail.com', '2023-03-07 17:02:18', NULL, 'Fahren Fizzi Haical', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1654, 323, '202110406', '1506563', '202110406@gmail.com', '2023-03-07 17:02:18', NULL, 'Farsya Salsabila Shabirah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1655, 323, '202110407', '3517815', '202110407@gmail.com', '2023-03-07 17:02:18', NULL, 'Fatika Nurul Azmi', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1656, 323, '202110408', '9023109', '202110408@gmail.com', '2023-03-07 17:02:18', NULL, 'Fauzan Al Ghozali', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1657, 323, '202110409', '724964', '202110409@gmail.com', '2023-03-07 17:02:18', NULL, 'Fauzan Nurzaman', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1658, 323, '202110410', '4177354', '202110410@gmail.com', '2023-03-07 17:02:18', NULL, 'Ghania Nurul Agistina', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1659, 323, '202110411', '9840546', '202110411@gmail.com', '2023-03-07 17:02:18', NULL, 'Ireyna Deskia Nur Hapipah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1660, 323, '202110412', '3893932', '202110412@gmail.com', '2023-03-07 17:02:18', NULL, 'Ismi Rahayu', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1661, 323, '202110413', '6109010', '202110413@gmail.com', '2023-03-07 17:02:18', NULL, 'Juan Sebastian Siahaan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1662, 323, '202110414', '7204971', '202110414@gmail.com', '2023-03-07 17:02:18', NULL, 'Keisya Ainun Nisa P. U.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1663, 323, '212211437', '2729183', '212211437@gmail.com', '2023-03-07 17:02:18', NULL, 'M. Jawwad Syihab Umam Rf', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1664, 323, '202110417', '3131222', '202110417@gmail.com', '2023-03-07 17:02:18', NULL, 'Milly Dewiyani', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1665, 323, '202110418', '9008380', '202110418@gmail.com', '2023-03-07 17:02:18', NULL, 'Moch.Aditiya Ta\\\'Zir Ilham', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1666, 323, '202110415', '655294', '202110415@gmail.com', '2023-03-07 17:02:18', NULL, 'Muhamad Rifqi T. H. A.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1667, 323, '202110419', '4014956', '202110419@gmail.com', '2023-03-07 17:02:19', NULL, 'Muhammad Farhan P.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1668, 323, '202110420', '6526844', '202110420@gmail.com', '2023-03-07 17:02:19', NULL, 'Muhammad Firman Syahril', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1669, 323, '202110421', '9552996', '202110421@gmail.com', '2023-03-07 17:02:19', NULL, 'Muhammad Rafnan Zhabiyan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1670, 323, '202110422', '2403150', '202110422@gmail.com', '2023-03-07 17:02:19', NULL, 'Nasfa Khasifan Nugraha', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1671, 323, '202110423', '4944125', '202110423@gmail.com', '2023-03-07 17:02:19', NULL, 'Nazmi Nur Laila', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1672, 323, '202110424', '8662524', '202110424@gmail.com', '2023-03-07 17:02:19', NULL, 'Nisha Marsha Shonia', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1673, 323, '202110425', '3456684', '202110425@gmail.com', '2023-03-07 17:02:19', NULL, 'Pasha Alexander', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1674, 323, '202110426', '5879847', '202110426@gmail.com', '2023-03-07 17:02:19', NULL, 'Sakti Divano Wiharja', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1675, 323, '202110427', '9823910', '202110427@gmail.com', '2023-03-07 17:02:19', NULL, 'Viena Kurniawan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1676, 323, '202110428', '3148001', '202110428@gmail.com', '2023-03-07 17:02:19', NULL, 'Yayang Juliani', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1677, 323, '202110429', '8702818', '202110429@gmail.com', '2023-03-07 17:02:19', NULL, 'Yesa Amalia', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1678, 323, '202110430', '1522669', '202110430@gmail.com', '2023-03-07 17:02:19', NULL, 'Yupi Nurul Azizah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1679, 323, '202110431', '3498561', '202110431@gmail.com', '2023-03-07 17:02:19', NULL, 'Zikra Salsabila Febriana', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1680, 311, '202110001', '3444229', '202110001@gmail.com', '2023-03-07 17:02:19', NULL, 'Ashidiq Noor Fajar', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1681, 311, '202110002', '4396237', '202110002@gmail.com', '2023-03-07 17:02:20', NULL, 'Calvin Sya\\\'ban Habibie K.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1682, 311, '202110003', '390060', '202110003@gmail.com', '2023-03-07 17:02:20', NULL, 'Citra Salsabila Putri', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1683, 311, '202110004', '5645262', '202110004@gmail.com', '2023-03-07 17:02:20', NULL, 'Defina Devitania', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1684, 311, '202110005', '7694351', '202110005@gmail.com', '2023-03-07 17:02:20', NULL, 'Dhiandra Lavica T. G.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1685, 311, '202110006', '3335796', '202110006@gmail.com', '2023-03-07 17:02:20', NULL, 'Felisha Safa Kirana', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1686, 311, '202110007', '7593949', '202110007@gmail.com', '2023-03-07 17:02:20', NULL, 'Fierda Widiarti', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1687, 311, '202110008', '1804962', '202110008@gmail.com', '2023-03-07 17:02:20', NULL, 'Frilda Sulistya Prasetya', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1688, 311, '202110009', '571001', '202110009@gmail.com', '2023-03-07 17:02:20', NULL, 'Kamilah Ramadhan Wafiah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1689, 311, '202110010', '4548653', '202110010@gmail.com', '2023-03-07 17:02:20', NULL, 'Kania Rucita Pramuditha', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1690, 311, '202110012', '3026729', '202110012@gmail.com', '2023-03-07 17:02:20', NULL, 'Mahesa Yustriardi', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1691, 311, '202110013', '6570046', '202110013@gmail.com', '2023-03-07 17:02:20', NULL, 'Marsya Rahima', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1692, 311, '202110014', '923950', '202110014@gmail.com', '2023-03-07 17:02:20', NULL, 'Melky Yudhistira', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1693, 311, '202110015', '9390309', '202110015@gmail.com', '2023-03-07 17:02:20', NULL, 'Miradhil Al Fadilah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1694, 311, '202110016', '389163', '202110016@gmail.com', '2023-03-07 17:02:20', NULL, 'Mochamad Fakhri A.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1695, 311, '202110017', '2032621', '202110017@gmail.com', '2023-03-07 17:02:20', NULL, 'Moh. Arfiandi Eka R.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1696, 311, '202110018', '5371252', '202110018@gmail.com', '2023-03-07 17:02:20', NULL, 'Muhamad Razidan A. F.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1697, 311, '202110019', '3587437', '202110019@gmail.com', '2023-03-07 17:02:20', NULL, 'Muhamad Rifqi Ridwansyah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1698, 311, '202110020', '3271266', '202110020@gmail.com', '2023-03-07 17:02:21', NULL, 'Muhammad Ariel Ardiansyah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1699, 311, '202110011', '8515972', '202110011@gmail.com', '2023-03-07 17:02:21', NULL, 'Muhammad Karannabiel D.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1700, 311, '202110021', '3958738', '202110021@gmail.com', '2023-03-07 17:02:21', NULL, 'Muhammad Rayhan K.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1701, 311, '202110022', '3515429', '202110022@gmail.com', '2023-03-07 17:02:21', NULL, 'Muhammad Yusep M.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1702, 311, '202110023', '8880856', '202110023@gmail.com', '2023-03-07 17:02:21', NULL, 'Naifa Khoirunnisa', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1703, 311, '202110024', '5260138', '202110024@gmail.com', '2023-03-07 17:02:21', NULL, 'Reina Alyanabila', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1704, 311, '202110025', '2920198', '202110025@gmail.com', '2023-03-07 17:02:21', NULL, 'Risyda Rosyidah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1705, 311, '202110026', '7201073', '202110026@gmail.com', '2023-03-07 17:02:21', NULL, 'Rizal Mochamad Rizqi', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1706, 311, '202110027', '8676456', '202110027@gmail.com', '2023-03-07 17:02:21', NULL, 'Salman Baihaqi', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1707, 311, '202110028', '3067454', '202110028@gmail.com', '2023-03-07 17:02:21', NULL, 'Salsabilla Putri Cantika', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1708, 311, '202110029', '1296459', '202110029@gmail.com', '2023-03-07 17:02:21', NULL, 'Sandra Mutiara Riza', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1709, 311, '202110030', '6014878', '202110030@gmail.com', '2023-03-07 17:02:21', NULL, 'Shalma Berliani Herawan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1710, 311, '202110031', '8747365', '202110031@gmail.com', '2023-03-07 17:02:21', NULL, 'Siti Sarah Aulia Zahra', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1711, 311, '202110032', '6248694', '202110032@gmail.com', '2023-03-07 17:02:21', NULL, 'Sophia Rahmatika Alhulwa', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1712, 311, '202110033', '4759364', '202110033@gmail.com', '2023-03-07 17:02:21', NULL, 'Suci Puspita Handayani', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1713, 311, '202110034', '5517753', '202110034@gmail.com', '2023-03-07 17:02:21', NULL, 'Tabah Muhammad P.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1714, 311, '202110035', '7526071', '202110035@gmail.com', '2023-03-07 17:02:21', NULL, 'Tresna Widianti Nurrahmah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1715, 311, '202110036', '676555', '202110036@gmail.com', '2023-03-07 17:02:21', NULL, 'Tsinan Arun Jaisy S. T.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1716, 312, '202110037', '3243432', '202110037@gmail.com', '2023-03-07 17:02:21', NULL, 'Alieffa Iga Muharami', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1717, 312, '202110038', '3537453', '202110038@gmail.com', '2023-03-07 17:02:21', NULL, 'Annisa Siti Khaira', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1718, 312, '202110039', '7072963', '202110039@gmail.com', '2023-03-07 17:02:21', NULL, 'Arif Rahmanul Hakim', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1719, 312, '202110040', '7825704', '202110040@gmail.com', '2023-03-07 17:02:21', NULL, 'Aris Fadhlurrahman', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1720, 312, '202110041', '9913807', '202110041@gmail.com', '2023-03-07 17:02:21', NULL, 'Azhar Luthfi Aushaf', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1721, 312, '202110042', '4035807', '202110042@gmail.com', '2023-03-07 17:02:21', NULL, 'Azmi Nuri Rusyda', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1722, 312, '202110043', '3493970', '202110043@gmail.com', '2023-03-07 17:02:21', NULL, 'Farhan Garindesta Adithia', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1723, 312, '202110044', '8462290', '202110044@gmail.com', '2023-03-07 17:02:22', NULL, 'Ghafa Qintara Barru R', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1724, 312, '202110045', '7958299', '202110045@gmail.com', '2023-03-07 17:02:22', NULL, 'Gisyera Oktary Arnelia', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1725, 312, '202110046', '8609819', '202110046@gmail.com', '2023-03-07 17:02:22', NULL, 'Helma Milga Hania Pratiwi', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1726, 312, '202110047', '3923695', '202110047@gmail.com', '2023-03-07 17:02:22', NULL, 'Ilma Nur Asyiyah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1727, 312, '202110048', '8054330', '202110048@gmail.com', '2023-03-07 17:02:22', NULL, 'Kalina Maulida', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1728, 312, '202110049', '145779', '202110049@gmail.com', '2023-03-07 17:02:22', NULL, 'Marcellino Philipus Pitoy', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1729, 312, '202110050', '3533922', '202110050@gmail.com', '2023-03-07 17:02:22', NULL, 'Maureen Angelica', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1730, 312, '202110051', '8252531', '202110051@gmail.com', '2023-03-07 17:02:22', NULL, 'Meutia Khanza Putri S.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1731, 312, '202110052', '3828705', '202110052@gmail.com', '2023-03-07 17:02:22', NULL, 'Muhamad Faiz Rasyid N.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1732, 312, '202110053', '5897558', '202110053@gmail.com', '2023-03-07 17:02:22', NULL, 'Muhammad Aymar B.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1733, 312, '202110054', '8653845', '202110054@gmail.com', '2023-03-07 17:02:22', NULL, 'Muhammad Ilham Saripul M.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1734, 312, '202110055', '9802919', '202110055@gmail.com', '2023-03-07 17:02:22', NULL, 'Muhammad Zahy P. K.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1735, 312, '202110056', '3405788', '202110056@gmail.com', '2023-03-07 17:02:22', NULL, 'Nabila Permana Putri', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1736, 312, '202110057', '6481001', '202110057@gmail.com', '2023-03-07 17:02:22', NULL, 'Naila Salsabila', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1737, 312, '202110058', '8516958', '202110058@gmail.com', '2023-03-07 17:02:22', NULL, 'Naila Tarisha Azahra', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1738, 312, '202110059', '2543649', '202110059@gmail.com', '2023-03-07 17:02:22', NULL, 'Nalsa Berliandra', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1739, 312, '202110060', '1265210', '202110060@gmail.com', '2023-03-07 17:02:22', NULL, 'Nasya Armania Nur Hidayat', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1740, 312, '202110062', '2814752', '202110062@gmail.com', '2023-03-07 17:02:22', NULL, 'Nisa Ananta Junianti', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1741, 312, '202110063', '3110164', '202110063@gmail.com', '2023-03-07 17:02:22', NULL, 'Raafi Alhaakim', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1742, 312, '202110064', '879949', '202110064@gmail.com', '2023-03-07 17:02:22', NULL, 'Rendi Nugraha Hadiansyah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1743, 312, '202110065', '3206500', '202110065@gmail.com', '2023-03-07 17:02:22', NULL, 'Reqi Jumantara Hapid', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1744, 312, '202110066', '4209206', '202110066@gmail.com', '2023-03-07 17:02:22', NULL, 'Resti Rahayu', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1745, 312, '202110067', '6152362', '202110067@gmail.com', '2023-03-07 17:02:22', NULL, 'Rindaini Queeny D.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1746, 312, '202110068', '2254208', '202110068@gmail.com', '2023-03-07 17:02:22', NULL, 'Syifa Amalia Nur Kamila', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1747, 312, '202110069', '4136449', '202110069@gmail.com', '2023-03-07 17:02:22', NULL, 'Syifa Nurjihan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1748, 312, '202110070', '2078789', '202110070@gmail.com', '2023-03-07 17:02:22', NULL, 'Tiara Dwi Ardiyanti', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1749, 312, '202110071', '2872762', '202110071@gmail.com', '2023-03-07 17:02:23', NULL, 'Tiara Muzizatunnisa', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1750, 312, '202110072', '7939168', '202110072@gmail.com', '2023-03-07 17:02:23', NULL, 'Verliana Syawalandia H.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1751, 313, '202110073', '3905721', '202110073@gmail.com', '2023-03-07 17:02:23', NULL, 'Ahmad Faizal Hilmi D. U.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1752, 313, '202110074', '4905833', '202110074@gmail.com', '2023-03-07 17:02:23', NULL, 'Argian Alvin Miladian', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1753, 313, '202110075', '1037120', '202110075@gmail.com', '2023-03-07 17:02:23', NULL, 'Atha\\\'illah S. Nur Iman', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1754, 313, '202110076', '6242614', '202110076@gmail.com', '2023-03-07 17:02:23', NULL, 'Aulia Putri Ramadhani', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1755, 313, '202110077', '8276362', '202110077@gmail.com', '2023-03-07 17:02:23', NULL, 'Azkia Zahradzafira', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1756, 313, '202110078', '3411195', '202110078@gmail.com', '2023-03-07 17:02:23', NULL, 'Chelsea Amaura Hanim T.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1757, 313, '202110079', '1329495', '202110079@gmail.com', '2023-03-07 17:02:23', NULL, 'Fakhri Muhammad Aqil', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1758, 313, '202110081', '3346257', '202110081@gmail.com', '2023-03-07 17:02:23', NULL, 'Farhah Fadila K. Nuha', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1759, 313, '202110082', '9471946', '202110082@gmail.com', '2023-03-07 17:02:23', NULL, 'Farhan Regian Cahya M.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1760, 313, '202110080', '243173', '202110080@gmail.com', '2023-03-07 17:02:23', NULL, 'Farrel Bernesta', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1761, 313, '202110083', '312413', '202110083@gmail.com', '2023-03-07 17:02:23', NULL, 'Fathir Agung Cahya', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1762, 313, '202110084', '8756842', '202110084@gmail.com', '2023-03-07 17:02:24', NULL, 'Fazira Septiani Dewi', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1763, 313, '202110085', '3882911', '202110085@gmail.com', '2023-03-07 17:02:24', NULL, 'Frea Medea Alda', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1764, 313, '202110086', '2483298', '202110086@gmail.com', '2023-03-07 17:02:24', NULL, 'Hana Aliya Juliana', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1765, 313, '202110087', '9093213', '202110087@gmail.com', '2023-03-07 17:02:24', NULL, 'Helmi Juliana', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1766, 313, '202110088', '1608005', '202110088@gmail.com', '2023-03-07 17:02:24', NULL, 'Luthvina Puspa Dewi', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1767, 313, '202110090', '7307682', '202110090@gmail.com', '2023-03-07 17:02:24', NULL, 'Malvin Aditiya', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1768, 313, '202110091', '4957790', '202110091@gmail.com', '2023-03-07 17:02:24', NULL, 'Marsella Intan N. Ulya', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1769, 313, '202110089', '5288467', '202110089@gmail.com', '2023-03-07 17:02:24', NULL, 'Mochamad Akmal Ramadhan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1770, 313, '202110092', '4296977', '202110092@gmail.com', '2023-03-07 17:02:24', NULL, 'Mohamad Firman Yogaswara', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1771, 313, '202110094', '2785463', '202110094@gmail.com', '2023-03-07 17:02:24', NULL, 'Muhammad Argya Anbar', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1772, 313, '202110095', '1683136', '202110095@gmail.com', '2023-03-07 17:02:24', NULL, 'Muhammad Fathul Barry', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1773, 313, '202110093', '8118497', '202110093@gmail.com', '2023-03-07 17:02:24', NULL, 'Muhammad Najwan Abdillah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1774, 313, '202110096', '1073655', '202110096@gmail.com', '2023-03-07 17:02:24', NULL, 'Nadia Nazwa Fadillah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1775, 313, '202110097', '3634899', '202110097@gmail.com', '2023-03-07 17:02:24', NULL, 'Nadya Sukma Rahayu', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1776, 313, '202110098', '3945747', '202110098@gmail.com', '2023-03-07 17:02:24', NULL, 'Nazwa Nadia Tristina', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1777, 313, '202110099', '8818757', '202110099@gmail.com', '2023-03-07 17:02:24', NULL, 'Nirmalia Indah Setiawan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1778, 313, '202110100', '4117907', '202110100@gmail.com', '2023-03-07 17:02:24', NULL, 'Raisa Julva Maulia', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1779, 313, '212211433', '3105519', '212211433@gmail.com', '2023-03-07 17:02:24', NULL, 'Raisya Isfa\\\' Kayyla A.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1780, 313, '202110101', '8348205', '202110101@gmail.com', '2023-03-07 17:02:24', NULL, 'Rheina Isaury Suryohadi', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1781, 313, '202110102', '8550565', '202110102@gmail.com', '2023-03-07 17:02:24', NULL, 'Sabrina Berliana Mulyadi', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1782, 313, '202110103', '7550325', '202110103@gmail.com', '2023-03-07 17:02:24', NULL, 'Saepul Maulana', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1783, 313, '202110105', '6450445', '202110105@gmail.com', '2023-03-07 17:02:24', NULL, 'Surya Panji Dipantara', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1784, 313, '202110106', '2427740', '202110106@gmail.com', '2023-03-07 17:02:24', NULL, 'Yesira Mirzaqie', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1785, 313, '202110107', '406736', '202110107@gmail.com', '2023-03-07 17:02:24', NULL, 'Zahra Nurul Falah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1786, 313, '202110108', '7916915', '202110108@gmail.com', '2023-03-07 17:02:24', NULL, 'Zhillanullael Gumelar', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1787, 314, '202110109', '5225456', '202110109@gmail.com', '2023-03-07 17:02:24', NULL, 'Anastasya Salsabila S', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1788, 314, '202110110', '4255678', '202110110@gmail.com', '2023-03-07 17:02:24', NULL, 'Annida Rizqia Mufidah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1789, 314, '202110111', '731762', '202110111@gmail.com', '2023-03-07 17:02:25', NULL, 'Aurora Aprilia Enjelika', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1790, 314, '202110112', '9960597', '202110112@gmail.com', '2023-03-07 17:02:25', NULL, 'Darren Rekmal Gradia', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1791, 314, '202110113', '3381687', '202110113@gmail.com', '2023-03-07 17:02:25', NULL, 'Dede Firman', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1792, 314, '202110114', '3294834', '202110114@gmail.com', '2023-03-07 17:02:25', NULL, 'Deviana Dewi Saparani', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1793, 314, '202110115', '4295661', '202110115@gmail.com', '2023-03-07 17:02:25', NULL, 'Dhea Phasa Yasminabilah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1794, 314, '202110116', '2166530', '202110116@gmail.com', '2023-03-07 17:02:25', NULL, 'Dhiya Febriyanisa Adha', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1795, 314, '202110117', '638508', '202110117@gmail.com', '2023-03-07 17:02:25', NULL, 'Eneng Intan Fitriani', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1796, 314, '202110118', '9923783', '202110118@gmail.com', '2023-03-07 17:02:25', NULL, 'Fadya Fauziyyah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1797, 314, '202110119', '4934879', '202110119@gmail.com', '2023-03-07 17:02:25', NULL, 'Fathan Ariel Pratama', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1798, 314, '202110120', '9277302', '202110120@gmail.com', '2023-03-07 17:02:26', NULL, 'Fauzan Shidiq Susetyo', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1799, 314, '202110121', '3371650', '202110121@gmail.com', '2023-03-07 17:02:26', NULL, 'Fitra Rifki Firdaus', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1800, 314, '202110122', '775354', '202110122@gmail.com', '2023-03-07 17:02:26', NULL, 'Ghiyats Zhafir F.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1801, 314, '202110123', '8607833', '202110123@gmail.com', '2023-03-07 17:02:26', NULL, 'Giri Adhi Wijaya', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1802, 314, '202110124', '2827848', '202110124@gmail.com', '2023-03-07 17:02:26', NULL, 'Havy Hilmi Al-Zuhdi', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1803, 314, '202110125', '4534516', '202110125@gmail.com', '2023-03-07 17:02:26', NULL, 'Hikmal Aryasser R.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1804, 314, '202110126', '7826824', '202110126@gmail.com', '2023-03-07 17:02:26', NULL, 'Hugie Guntur Harefa R.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1805, 314, '202110127', '336930', '202110127@gmail.com', '2023-03-07 17:02:26', NULL, 'Itfa Alya', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1806, 314, '202110128', '8043395', '202110128@gmail.com', '2023-03-07 17:02:26', NULL, 'Jasmine Firdaus Hermawan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1807, 314, '202110129', '1255131', '202110129@gmail.com', '2023-03-07 17:02:26', NULL, 'Kaila Natania', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1808, 314, '202110130', '5243379', '202110130@gmail.com', '2023-03-07 17:02:26', NULL, 'M. Lutfi Syawal R', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1809, 314, '202110131', '213964', '202110131@gmail.com', '2023-03-07 17:02:26', NULL, 'Maisyah Ghina Alya Z. A.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1810, 314, '202110132', '4265785', '202110132@gmail.com', '2023-03-07 17:02:26', NULL, 'Mallika Aureil Pasya M.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1811, 314, '202110133', '5093778', '202110133@gmail.com', '2023-03-07 17:02:26', NULL, 'Naufal Akmaluqyan M.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1812, 314, '202110134', '8814399', '202110134@gmail.com', '2023-03-07 17:02:26', NULL, 'Nurmalia Putri Nareswari', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1813, 314, '202110135', '5157116', '202110135@gmail.com', '2023-03-07 17:02:26', NULL, 'Putri Aulia Purnama', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1814, 314, '202110136', '8355441', '202110136@gmail.com', '2023-03-07 17:02:26', NULL, 'Safarudin Ali Topan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1815, 314, '202110137', '7905294', '202110137@gmail.com', '2023-03-07 17:02:26', NULL, 'Salwa Fadila Usmayanti', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1816, 314, '202110138', '8456592', '202110138@gmail.com', '2023-03-07 17:02:27', NULL, 'Shofiyya Zahira C. S.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1817, 314, '202110139', '8150100', '202110139@gmail.com', '2023-03-07 17:02:27', NULL, 'Syamma Husna Adilah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1818, 314, '202110140', '5011980', '202110140@gmail.com', '2023-03-07 17:02:27', NULL, 'Syaqiq Rahman Al Mughni', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1819, 314, '202110141', '5493188', '202110141@gmail.com', '2023-03-07 17:02:27', NULL, 'Syifa Shofiyanti Agustina', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1820, 314, '202110142', '9778463', '202110142@gmail.com', '2023-03-07 17:02:27', NULL, 'Yukafi Mazidha Khaira ', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1821, 314, '202110143', '2414449', '202110143@gmail.com', '2023-03-07 17:02:27', NULL, 'Zahra Hilyatul Jannah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1822, 314, '202110144', '8231880', '202110144@gmail.com', '2023-03-07 17:02:27', NULL, 'Zahra Laelatussa\\\'Adah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1823, 315, '202110145', '1072558', '202110145@gmail.com', '2023-03-07 17:02:27', NULL, 'Aisyka Sabila I. Z.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1824, 315, '202110146', '1937731', '202110146@gmail.com', '2023-03-07 17:02:27', NULL, 'Aldi Qusairie', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1825, 315, '212211435', '6198892', '212211435@gmail.com', '2023-03-07 17:02:27', NULL, 'Alya Mutiara Abdul Rasyid', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1826, 315, '202110147', '6345052', '202110147@gmail.com', '2023-03-07 17:02:27', NULL, 'Cikal Muhammad Alfath', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1827, 315, '202110148', '5994709', '202110148@gmail.com', '2023-03-07 17:02:27', NULL, 'Faried Gustian', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1828, 315, '202110149', '193118', '202110149@gmail.com', '2023-03-07 17:02:27', NULL, 'Fathan Najid Abdurrahman', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1829, 315, '202110150', '2285181', '202110150@gmail.com', '2023-03-07 17:02:27', NULL, 'Fathiyah Hasna', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1830, 315, '202110151', '1018601', '202110151@gmail.com', '2023-03-07 17:02:27', NULL, 'Fayza Kulla Azmina', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1831, 315, '202110152', '8851119', '202110152@gmail.com', '2023-03-07 17:02:27', NULL, 'Galuh Hanafi ', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1832, 315, '202110153', '2580236', '202110153@gmail.com', '2023-03-07 17:02:27', NULL, 'Ghifari Muhammad Ramadhan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1833, 315, '202110154', '1463120', '202110154@gmail.com', '2023-03-07 17:02:27', NULL, 'Helena Rosalin Nanin', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1834, 315, '202110155', '5129055', '202110155@gmail.com', '2023-03-07 17:02:27', NULL, 'Helga Athifa Hidayat', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1835, 315, '202110159', '3917618', '202110159@gmail.com', '2023-03-07 17:02:28', NULL, 'Mohammad Zidan Surahman', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1836, 315, '202110158', '8258271', '202110158@gmail.com', '2023-03-07 17:02:28', NULL, 'Muhamad Chikal U. N.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1837, 315, '202110161', '7414975', '202110161@gmail.com', '2023-03-07 17:02:28', NULL, 'Muhammad Fakhri A.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1838, 315, '202110156', '5067696', '202110156@gmail.com', '2023-03-07 17:02:28', NULL, 'Muhammad Nadhief R. F.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1839, 315, '202110160', '1627800', '202110160@gmail.com', '2023-03-07 17:02:28', NULL, 'Muhammad Rais Rashif', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1840, 315, '202110157', '4005927', '202110157@gmail.com', '2023-03-07 17:02:28', NULL, 'Muhammad Reva Kurniawan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1841, 315, '202110162', '4006835', '202110162@gmail.com', '2023-03-07 17:02:28', NULL, 'Najmi An Nuri', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1842, 315, '202110163', '4515028', '202110163@gmail.com', '2023-03-07 17:02:28', NULL, 'Naura Zakiya Ismail', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1843, 315, '202110164', '5393998', '202110164@gmail.com', '2023-03-07 17:02:28', NULL, 'Navisa Sukma Koswara', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1844, 315, '202110165', '515439', '202110165@gmail.com', '2023-03-07 17:02:28', NULL, 'Nesya Oktavia Ramadhani', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1845, 315, '202110167', '652764', '202110167@gmail.com', '2023-03-07 17:02:28', NULL, 'Prayoga Fikri Fauzan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1846, 315, '202110168', '5782425', '202110168@gmail.com', '2023-03-07 17:02:28', NULL, 'Qyara Maharani Putri', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1847, 315, '202110170', '7319876', '202110170@gmail.com', '2023-03-07 17:02:28', NULL, 'Rafi Ahmad Gunawan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1848, 315, '202110171', '6867167', '202110171@gmail.com', '2023-03-07 17:02:28', NULL, 'Rafli Abdul Aziz', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1849, 315, '202110172', '4889265', '202110172@gmail.com', '2023-03-07 17:02:28', NULL, 'Rakheyan Rommy Ardyansyah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1850, 315, '202110173', '1492117', '202110173@gmail.com', '2023-03-07 17:02:28', NULL, 'Rayhan Nata Ardiansyah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1851, 315, '202110169', '7597386', '202110169@gmail.com', '2023-03-07 17:02:28', NULL, 'Rd. Salma Salsabil G.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1852, 315, '202110174', '6679077', '202110174@gmail.com', '2023-03-07 17:02:29', NULL, 'Reisha Humaira', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1853, 315, '202110175', '6473225', '202110175@gmail.com', '2023-03-07 17:02:29', NULL, 'Rezkia Suciawati Putri R.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1854, 315, '202110176', '1473555', '202110176@gmail.com', '2023-03-07 17:02:29', NULL, 'Rio Hanif Abduh', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1855, 315, '202110177', '6717783', '202110177@gmail.com', '2023-03-07 17:02:29', NULL, 'Selma Syarifatu Sya\\\'Adah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1856, 315, '202110178', '2635976', '202110178@gmail.com', '2023-03-07 17:02:29', NULL, 'Shizuka Maula Everlin', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1857, 315, '202110179', '3877885', '202110179@gmail.com', '2023-03-07 17:02:29', NULL, 'Vinalia Nurr Ramadhan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1858, 315, '202110180', '2370003', '202110180@gmail.com', '2023-03-07 17:02:29', NULL, 'Zalika Nakeisya Akilah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1859, 316, '202110181', '3094992', '202110181@gmail.com', '2023-03-07 17:02:29', NULL, 'Aghnia Putri Aprilianti', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1860, 316, '202110182', '8377378', '202110182@gmail.com', '2023-03-07 17:02:29', NULL, 'Ahmad Fauzan Herianto', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1861, 316, '202110183', '7166274', '202110183@gmail.com', '2023-03-07 17:02:29', NULL, 'Aidah Karimah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1862, 316, '202110184', '5898738', '202110184@gmail.com', '2023-03-07 17:02:29', NULL, 'Ajha Al Fauz', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1863, 316, '202110185', '6580192', '202110185@gmail.com', '2023-03-07 17:02:29', NULL, 'Alifa Ilarakhis Juli Nur', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1864, 316, '202110187', '2189088', '202110187@gmail.com', '2023-03-07 17:02:29', NULL, 'Ananda Widi Astuti', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1865, 316, '202110188', '1607166', '202110188@gmail.com', '2023-03-07 17:02:29', NULL, 'Aulia Rahma Nurul Hakim', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1866, 316, '202110189', '2102218', '202110189@gmail.com', '2023-03-07 17:02:29', NULL, 'Azhar Putri Da\\\'az S.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1867, 316, '202110190', '8088716', '202110190@gmail.com', '2023-03-07 17:02:29', NULL, 'Bismar Syauqie Widodo', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1868, 316, '202110191', '5647662', '202110191@gmail.com', '2023-03-07 17:02:29', NULL, 'Della Rahman Ramadhani', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1869, 316, '202110192', '7205986', '202110192@gmail.com', '2023-03-07 17:02:29', NULL, 'Denisa Septiani Putri G.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1870, 316, '202110193', '765065', '202110193@gmail.com', '2023-03-07 17:02:29', NULL, 'Devina Aulia Putri', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1871, 316, '202110194', '4893766', '202110194@gmail.com', '2023-03-07 17:02:29', NULL, 'Faqih Alghifari', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1872, 316, '202110195', '7144230', '202110195@gmail.com', '2023-03-07 17:02:30', NULL, 'Haidar Ali Al Akbar', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1873, 316, '202110196', '3360872', '202110196@gmail.com', '2023-03-07 17:02:30', NULL, 'Haikal Azizan Al Purqon', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1874, 316, '202110197', '8850806', '202110197@gmail.com', '2023-03-07 17:02:30', NULL, 'Haykal Yusuf Pratama', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1875, 316, '202110198', '3721374', '202110198@gmail.com', '2023-03-07 17:02:30', NULL, 'Hilwa Fauziah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1876, 316, '202110199', '4670343', '202110199@gmail.com', '2023-03-07 17:02:30', NULL, 'Jembar Gelar Kusumah W.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1877, 316, '202110200', '604571', '202110200@gmail.com', '2023-03-07 17:02:30', NULL, 'Kamila Dea Ananda', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1878, 316, '202110201', '2442493', '202110201@gmail.com', '2023-03-07 17:02:30', NULL, 'M Guntur Aji Pamungkas', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1879, 316, '202110202', '9716288', '202110202@gmail.com', '2023-03-07 17:02:30', NULL, 'M Haikal Adz Dzikri', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1880, 316, '202110203', '451639', '202110203@gmail.com', '2023-03-07 17:02:30', NULL, 'Mohamad Arfin Ilham', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1881, 316, '202110204', '6879351', '202110204@gmail.com', '2023-03-07 17:02:30', NULL, 'Muhammad Rai Luthfi Z. U.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1882, 316, '202110205', '4275854', '202110205@gmail.com', '2023-03-07 17:02:30', NULL, 'Muhammad Reyhan A. K.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1883, 316, '202110206', '4785797', '202110206@gmail.com', '2023-03-07 17:02:30', NULL, 'Najwa Wurie Zahratunnisa', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1884, 316, '202110207', '917459', '202110207@gmail.com', '2023-03-07 17:02:30', NULL, 'Nasya Natasya Laviola', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1885, 316, '202110208', '7370669', '202110208@gmail.com', '2023-03-07 17:02:30', NULL, 'Nasywa Nur Azizah W.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1886, 316, '202110209', '9799617', '202110209@gmail.com', '2023-03-07 17:02:30', NULL, 'R. Satria Giovanni P. K.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1887, 316, '202110210', '4028188', '202110210@gmail.com', '2023-03-07 17:02:30', NULL, 'Rahma Dita Sukma Amalia', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1888, 316, '202110211', '9967944', '202110211@gmail.com', '2023-03-07 17:02:30', NULL, 'Raissa Priscila Az Zahra', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1889, 316, '202110213', '2603049', '202110213@gmail.com', '2023-03-07 17:02:30', NULL, 'Riski Moh Farel', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1890, 316, '202110212', '8400220', '202110212@gmail.com', '2023-03-07 17:02:30', NULL, 'Rival Subagja', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1891, 316, '202110214', '9438910', '202110214@gmail.com', '2023-03-07 17:02:31', NULL, 'Rosalia Melati', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1892, 316, '202110215', '9373352', '202110215@gmail.com', '2023-03-07 17:02:31', NULL, 'Safwan Hasbi Asfahani', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1893, 316, '212211436', '3997759', '212211436@gmail.com', '2023-03-07 17:02:31', NULL, 'Zakiah Ayu Farhani', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1894, 316, '202110216', '5983676', '202110216@gmail.com', '2023-03-07 17:02:31', NULL, 'Zalfa Roudhotul Jannah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1895, 317, '202110217', '6237554', '202110217@gmail.com', '2023-03-07 17:02:31', NULL, 'Adhea Putra Islam', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1896, 317, '202110218', '6170255', '202110218@gmail.com', '2023-03-07 17:02:31', NULL, 'Arghy Habil Nabawi', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1897, 317, '202110219', '9345475', '202110219@gmail.com', '2023-03-07 17:02:31', NULL, 'Farhan Maulana A.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1898, 317, '202110220', '3162146', '202110220@gmail.com', '2023-03-07 17:02:31', NULL, 'Fasya Aghnia Sudrajat', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1899, 317, '202110221', '2174338', '202110221@gmail.com', '2023-03-07 17:02:31', NULL, 'Fika Nurbella', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1900, 317, '202110222', '6957013', '202110222@gmail.com', '2023-03-07 17:02:31', NULL, 'Gerrard Fadhilah Badzlin', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1901, 317, '202110223', '6553210', '202110223@gmail.com', '2023-03-07 17:02:31', NULL, 'Ghassan Hibatul Wafi', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1902, 317, '202110224', '1428250', '202110224@gmail.com', '2023-03-07 17:02:31', NULL, 'Hilda Jumadila Irsad', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1903, 317, '202110225', '565755', '202110225@gmail.com', '2023-03-07 17:02:31', NULL, 'Imelda Putri Fahira', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1904, 317, '202110226', '3195934', '202110226@gmail.com', '2023-03-07 17:02:31', NULL, 'Januar Rizaldi', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1905, 317, '202110227', '5020461', '202110227@gmail.com', '2023-03-07 17:02:31', NULL, 'Lusy Maesa Garnisa', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1906, 317, '202110228', '8628015', '202110228@gmail.com', '2023-03-07 17:02:32', NULL, 'M Romy Sufyan Tsauri', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1907, 317, '202110230', '9629812', '202110230@gmail.com', '2023-03-07 17:02:32', NULL, 'Malyafaiza Fauzi', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1908, 317, '202110231', '7087594', '202110231@gmail.com', '2023-03-07 17:02:32', NULL, 'Muhamad Al Qabil Y.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1909, 317, '202110229', '3355412', '202110229@gmail.com', '2023-03-07 17:02:32', NULL, 'Muhamad Raka S. S.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1910, 317, '202110232', '6970309', '202110232@gmail.com', '2023-03-07 17:02:32', NULL, 'Muhammad Naufal Ali F.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1911, 317, '202110233', '4876877', '202110233@gmail.com', '2023-03-07 17:02:32', NULL, 'Muhammad Rafly Agusdiana', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1912, 317, '202110234', '3691367', '202110234@gmail.com', '2023-03-07 17:02:32', NULL, 'Nabila Dwi Agustin', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1913, 317, '202110235', '1091938', '202110235@gmail.com', '2023-03-07 17:02:32', NULL, 'Nasya Zalfa Nabila', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1914, 317, '202110236', '9974774', '202110236@gmail.com', '2023-03-07 17:02:32', NULL, 'Natasha Marfefia Sahnazri', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1915, 317, '202110237', '9963433', '202110237@gmail.com', '2023-03-07 17:02:32', NULL, 'Nayla Febrianti Pasma A.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1916, 317, '202110238', '5572954', '202110238@gmail.com', '2023-03-07 17:02:32', NULL, 'Nida Nur Salamah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1917, 317, '202110239', '112084', '202110239@gmail.com', '2023-03-07 17:02:32', NULL, 'Nilam Sari', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1918, 317, '202110240', '6313628', '202110240@gmail.com', '2023-03-07 17:02:32', NULL, 'Nurul Aulia Amanda Putri', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1919, 317, '202110241', '3700098', '202110241@gmail.com', '2023-03-07 17:02:32', NULL, 'Nurul Putri Sutrisna', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1920, 317, '202110242', '4422698', '202110242@gmail.com', '2023-03-07 17:02:32', NULL, 'R Firaz Fawwaz K.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1921, 317, '202110243', '3468739', '202110243@gmail.com', '2023-03-07 17:02:32', NULL, 'Raffly Rinaldika Naufal', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1922, 317, '202110244', '1586187', '202110244@gmail.com', '2023-03-07 17:02:32', NULL, 'Raysa Aulia Putri', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1923, 317, '202110245', '7413636', '202110245@gmail.com', '2023-03-07 17:02:32', NULL, 'Resna Amallia Saprilda', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1924, 317, '202110246', '8777235', '202110246@gmail.com', '2023-03-07 17:02:32', NULL, 'Satria Putra Ismaya', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1925, 317, '202110247', '8774775', '202110247@gmail.com', '2023-03-07 17:02:32', NULL, 'Septian Abdifiraz Firdaus', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1926, 317, '202110248', '9079665', '202110248@gmail.com', '2023-03-07 17:02:33', NULL, 'Shira Naila Putri Arafah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1927, 317, '202110249', '4959614', '202110249@gmail.com', '2023-03-07 17:02:33', NULL, 'Siti Amelia Rachmaniar', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1928, 317, '202110250', '9403391', '202110250@gmail.com', '2023-03-07 17:02:33', NULL, 'Syahnaz Mutiara Ramadhani', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1929, 317, '202110251', '2596919', '202110251@gmail.com', '2023-03-07 17:02:33', NULL, 'Syakirah Nur Fauziah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1930, 317, '202110252', '4410685', '202110252@gmail.com', '2023-03-07 17:02:33', NULL, 'Walid Sya\\\'Ban', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1931, 318, '202110253', '4246701', '202110253@gmail.com', '2023-03-07 17:02:33', NULL, 'Ahmad Fikri', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1932, 318, '202110254', '1597981', '202110254@gmail.com', '2023-03-07 17:02:33', NULL, 'Allena Bintang Devonia M.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1933, 318, '202110255', '5066197', '202110255@gmail.com', '2023-03-07 17:02:33', NULL, 'Alya Khaerunnisa', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1934, 318, '202110256', '6154249', '202110256@gmail.com', '2023-03-07 17:02:33', NULL, 'Aulia Suci Ramadhoni', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1935, 318, '202110257', '9343607', '202110257@gmail.com', '2023-03-07 17:02:33', NULL, 'Aurell Ameilia Kirana A.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1936, 318, '202110258', '2312758', '202110258@gmail.com', '2023-03-07 17:02:33', NULL, 'Azriel Arya Pratama', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1937, 318, '202110259', '5411657', '202110259@gmail.com', '2023-03-07 17:02:33', NULL, 'Caristia Febriyani', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1938, 318, '202110260', '4985647', '202110260@gmail.com', '2023-03-07 17:02:33', NULL, 'Chevrilio Pascal F.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1939, 318, '202110261', '9940267', '202110261@gmail.com', '2023-03-07 17:02:33', NULL, 'Efrila Nurfalaq Safari', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1940, 318, '202110262', '2840566', '202110262@gmail.com', '2023-03-07 17:02:33', NULL, 'Faiq Muhamad Arkan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1941, 318, '202110263', '5747475', '202110263@gmail.com', '2023-03-07 17:02:33', NULL, 'Fuji Agustiani Nur F.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1942, 318, '202110264', '862407', '202110264@gmail.com', '2023-03-07 17:02:33', NULL, 'Hana Azkia Nisrina', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1943, 318, '202110265', '8444528', '202110265@gmail.com', '2023-03-07 17:02:33', NULL, 'Hasna Nurhalisa', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1944, 318, '202110266', '6181463', '202110266@gmail.com', '2023-03-07 17:02:33', NULL, 'Hilal Maulana Ibrahim', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1945, 318, '202110267', '9553280', '202110267@gmail.com', '2023-03-07 17:02:33', NULL, 'Joshua', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1946, 318, '202110268', '1319334', '202110268@gmail.com', '2023-03-07 17:02:33', NULL, 'Kirana Ajeng Pratiwi N.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1947, 318, '202110269', '2696294', '202110269@gmail.com', '2023-03-07 17:02:33', NULL, 'Muhamad Zubair Al Husain', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1948, 318, '202110270', '6814806', '202110270@gmail.com', '2023-03-07 17:02:33', NULL, 'Muhammad Abelard Abyudaya', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1949, 318, '202110271', '3298330', '202110271@gmail.com', '2023-03-07 17:02:33', NULL, 'Muhammad Faiz Adiansah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1950, 318, '202110272', '2124501', '202110272@gmail.com', '2023-03-07 17:02:33', NULL, 'Nada Shobah ', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1951, 318, '202110273', '8928300', '202110273@gmail.com', '2023-03-07 17:02:33', NULL, 'Naswa Munggarani R. P.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1952, 318, '202110274', '9156561', '202110274@gmail.com', '2023-03-07 17:02:34', NULL, 'Nathan Al Maliki Ardhana', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1953, 318, '202110275', '4346865', '202110275@gmail.com', '2023-03-07 17:02:34', NULL, 'Nazwal Bilbina Budiman', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1954, 318, '202110276', '7769762', '202110276@gmail.com', '2023-03-07 17:02:34', NULL, 'Niel Christian Jonathan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1955, 318, '202110277', '3144451', '202110277@gmail.com', '2023-03-07 17:02:34', NULL, 'Nurul Rizki Fauziah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1956, 318, '202110278', '2006744', '202110278@gmail.com', '2023-03-07 17:02:34', NULL, 'Qurrota A\\\'Yun Ihsani', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1957, 318, '202110279', '2684461', '202110279@gmail.com', '2023-03-07 17:02:34', NULL, 'Randi Mi\\\'Raj Septiansyah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1958, 318, '202110280', '4147194', '202110280@gmail.com', '2023-03-07 17:02:34', NULL, 'Reisya Meira Malika', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1959, 318, '202110281', '3948862', '202110281@gmail.com', '2023-03-07 17:02:34', NULL, 'Salma Alima Aisyah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1960, 318, '202110282', '9810777', '202110282@gmail.com', '2023-03-07 17:02:34', NULL, 'Sava Aulia Hikmah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1961, 318, '202110283', '6372032', '202110283@gmail.com', '2023-03-07 17:02:34', NULL, 'Sipa Anugrah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1962, 318, '202110284', '9373816', '202110284@gmail.com', '2023-03-07 17:02:34', NULL, 'Syakhila Yazid', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1963, 318, '202110285', '6912149', '202110285@gmail.com', '2023-03-07 17:02:34', NULL, 'Tsaaniah Hasan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1964, 318, '202110286', '4705168', '202110286@gmail.com', '2023-03-07 17:02:34', NULL, 'Vina Nurasyifa', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1965, 318, '202110287', '3394040', '202110287@gmail.com', '2023-03-07 17:02:34', NULL, 'Zahra Ramadhani Sanjaya', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1966, 318, '202110288', '2212670', '202110288@gmail.com', '2023-03-07 17:02:34', NULL, 'Zenitha Syakirah Idris P.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1967, 319, '202110289', '8881505', '202110289@gmail.com', '2023-03-07 17:02:34', NULL, 'Agrani Leviana Putri', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1968, 319, '202110290', '9861360', '202110290@gmail.com', '2023-03-07 17:02:34', NULL, 'Ajeng Fitra Nuralisya', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1969, 319, '202110291', '1845960', '202110291@gmail.com', '2023-03-07 17:02:34', NULL, 'Alika Falinsya Marwah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1970, 319, '202110292', '8919444', '202110292@gmail.com', '2023-03-07 17:02:35', NULL, 'Amara Nur Asyira', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1971, 319, '202110293', '1237643', '202110293@gmail.com', '2023-03-07 17:02:35', NULL, 'Azka Jarwal Taisir H.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1972, 319, '202110294', '8491622', '202110294@gmail.com', '2023-03-07 17:02:35', NULL, 'Bintang Gian Anindita', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1973, 319, '202110295', '7629571', '202110295@gmail.com', '2023-03-07 17:02:35', NULL, 'Dalfah Asri Azzahra', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1974, 319, '202110296', '1449248', '202110296@gmail.com', '2023-03-07 17:02:35', NULL, 'Faiz Addafi Zein F.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1975, 319, '202110297', '542883', '202110297@gmail.com', '2023-03-07 17:02:35', NULL, 'Gierkha Daffa Ariella N.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1976, 319, '202110298', '3146500', '202110298@gmail.com', '2023-03-07 17:02:35', NULL, 'Gun Gun Sugandi', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1977, 319, '202110299', '664956', '202110299@gmail.com', '2023-03-07 17:02:35', NULL, 'Inge Ilona Bareto Valen', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1978, 319, '202110300', '3274861', '202110300@gmail.com', '2023-03-07 17:02:35', NULL, 'Jizdan Mulkan Nailan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1979, 319, '202110301', '5761476', '202110301@gmail.com', '2023-03-07 17:02:35', NULL, 'Moch. Fahrul Pauzi R', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1980, 319, '202110302', '9592430', '202110302@gmail.com', '2023-03-07 17:02:35', NULL, 'Muhammad Hasbi Farizi', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1981, 319, '202110303', '3829390', '202110303@gmail.com', '2023-03-07 17:02:35', NULL, 'Muhammad Radhitya Azhara', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1982, 319, '202110304', '8205340', '202110304@gmail.com', '2023-03-07 17:02:35', NULL, 'Muhammad Sidik Permana', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1983, 319, '202110305', '3989457', '202110305@gmail.com', '2023-03-07 17:02:35', NULL, 'Najwa Khairunnisa', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1984, 319, '202110306', '5877389', '202110306@gmail.com', '2023-03-07 17:02:35', NULL, 'Naquila Nazla Herdiana', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1985, 319, '202110307', '2134197', '202110307@gmail.com', '2023-03-07 17:02:35', NULL, 'Naufal Faishal Hakim', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1986, 319, '202110308', '5914034', '202110308@gmail.com', '2023-03-07 17:02:35', NULL, 'Naza Naqiya Dwi Nugraha', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1987, 319, '202110309', '339446', '202110309@gmail.com', '2023-03-07 17:02:35', NULL, 'Putri Ilma Nurhakim', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1988, 319, '202110310', '1882084', '202110310@gmail.com', '2023-03-07 17:02:35', NULL, 'Radja Restu Arsita', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1989, 319, '202110311', '7987656', '202110311@gmail.com', '2023-03-07 17:02:35', NULL, 'Randi Mubarok', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1990, 319, '202110312', '7747179', '202110312@gmail.com', '2023-03-07 17:02:35', NULL, 'Ratna', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1991, 319, '202110313', '3528404', '202110313@gmail.com', '2023-03-07 17:02:36', NULL, 'Ratu Nashirotun Nissa T.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1992, 319, '202110314', '3208737', '202110314@gmail.com', '2023-03-07 17:02:36', NULL, 'Raudy Nabawian', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1993, 319, '202110315', '7728037', '202110315@gmail.com', '2023-03-07 17:02:36', NULL, 'Redla Elvia Ridwan', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1994, 319, '202110316', '3967497', '202110316@gmail.com', '2023-03-07 17:02:36', NULL, 'Renata Zahra Salsabila', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1995, 319, '202110317', '5737515', '202110317@gmail.com', '2023-03-07 17:02:36', NULL, 'Rendy Pachrezy Candriana', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1996, 319, '202110318', '5795388', '202110318@gmail.com', '2023-03-07 17:02:36', NULL, 'Rian Herdiansyah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1997, 319, '202110319', '3030707', '202110319@gmail.com', '2023-03-07 17:02:36', NULL, 'Risfi Astri Wulan Sari', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1998, 319, '202110320', '7955202', '202110320@gmail.com', '2023-03-07 17:02:37', NULL, 'Sanggita Salsabilla P. N.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (1999, 319, '202110321', '2398157', '202110321@gmail.com', '2023-03-07 17:02:37', NULL, 'Shalwa Nur Nabila', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (2000, 319, '202110322', '5158585', '202110322@gmail.com', '2023-03-07 17:02:37', NULL, 'Siska Nuraisyah', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (2001, 319, '202110323', '4664612', '202110323@gmail.com', '2023-03-07 17:02:37', NULL, 'Syaina Putri Yantie A.', NULL, NULL, 1, '1');
INSERT INTO `cbt_user` VALUES (2002, 319, '202110324', '8057478', '202110324@gmail.com', '2023-03-07 17:02:37', NULL, 'Troy Philardy Rahardja', NULL, NULL, 1, '1');

-- ----------------------------
-- Table structure for cbt_user_grup
-- ----------------------------
DROP TABLE IF EXISTS `cbt_user_grup`;
CREATE TABLE `cbt_user_grup`  (
  `grup_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `grup_nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`grup_id`) USING BTREE,
  UNIQUE INDEX `group_name`(`grup_nama`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 324 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cbt_user_grup
-- ----------------------------
INSERT INTO `cbt_user_grup` VALUES (101, 'X-01');
INSERT INTO `cbt_user_grup` VALUES (102, 'X-02');
INSERT INTO `cbt_user_grup` VALUES (103, 'X-03');
INSERT INTO `cbt_user_grup` VALUES (104, 'X-04');
INSERT INTO `cbt_user_grup` VALUES (105, 'X-05');
INSERT INTO `cbt_user_grup` VALUES (106, 'X-06');
INSERT INTO `cbt_user_grup` VALUES (107, 'X-07');
INSERT INTO `cbt_user_grup` VALUES (108, 'X-08');
INSERT INTO `cbt_user_grup` VALUES (109, 'X-09');
INSERT INTO `cbt_user_grup` VALUES (110, 'X-10');
INSERT INTO `cbt_user_grup` VALUES (111, 'X-11');
INSERT INTO `cbt_user_grup` VALUES (112, 'X-12');
INSERT INTO `cbt_user_grup` VALUES (211, 'XI IPA 1');
INSERT INTO `cbt_user_grup` VALUES (212, 'XI IPA 2');
INSERT INTO `cbt_user_grup` VALUES (213, 'XI IPA 3');
INSERT INTO `cbt_user_grup` VALUES (214, 'XI IPA 4');
INSERT INTO `cbt_user_grup` VALUES (215, 'XI IPA 5');
INSERT INTO `cbt_user_grup` VALUES (216, 'XI IPA 6');
INSERT INTO `cbt_user_grup` VALUES (217, 'XI IPA 7');
INSERT INTO `cbt_user_grup` VALUES (218, 'XI IPA 8');
INSERT INTO `cbt_user_grup` VALUES (219, 'XI IPA 9');
INSERT INTO `cbt_user_grup` VALUES (221, 'XI IPS 1');
INSERT INTO `cbt_user_grup` VALUES (222, 'XI IPS 2');
INSERT INTO `cbt_user_grup` VALUES (223, 'XI IPS 3');
INSERT INTO `cbt_user_grup` VALUES (311, 'XII IPA 1');
INSERT INTO `cbt_user_grup` VALUES (312, 'XII IPA 2');
INSERT INTO `cbt_user_grup` VALUES (313, 'XII IPA 3');
INSERT INTO `cbt_user_grup` VALUES (314, 'XII IPA 4');
INSERT INTO `cbt_user_grup` VALUES (315, 'XII IPA 5');
INSERT INTO `cbt_user_grup` VALUES (316, 'XII IPA 6');
INSERT INTO `cbt_user_grup` VALUES (317, 'XII IPA 7');
INSERT INTO `cbt_user_grup` VALUES (318, 'XII IPA 8');
INSERT INTO `cbt_user_grup` VALUES (319, 'XII IPA 9');
INSERT INTO `cbt_user_grup` VALUES (321, 'XII IPS 1');
INSERT INTO `cbt_user_grup` VALUES (322, 'XII IPS 2');
INSERT INTO `cbt_user_grup` VALUES (323, 'XII IPS 3');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `opsi1` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `opsi2` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `level` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `level`(`level`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`level`) REFERENCES `user_level` (`level`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '2445ed83a7d686628f1dc63ccce9b0f0a7b69453', 'Administrator', '', '', '', 'admin', '2015-07-30 01:12:03');
INSERT INTO `user` VALUES (6, 'admin_ikeu', '21bd12dc183f740ee76f27b78eb39c8ad972a757', 'Admin Ikeu', '', '', '-', 'operator-soal', '2022-05-27 14:16:09');
INSERT INTO `user` VALUES (7, 'admin_ohim', '21bd12dc183f740ee76f27b78eb39c8ad972a757', 'Admin Ohim', '', '', '-', 'operator-soal', '2022-09-30 15:48:34');
INSERT INTO `user` VALUES (8, 'admin_purwoto', '21bd12dc183f740ee76f27b78eb39c8ad972a757', 'Admin Purwoto', '', '', '-', 'operator-soal', '2022-09-30 15:49:36');
INSERT INTO `user` VALUES (9, 'admin_aldy', '21bd12dc183f740ee76f27b78eb39c8ad972a757', 'Admin Aldy', '', '', '-', 'operator-soal', '2022-09-30 15:50:14');
INSERT INTO `user` VALUES (10, 'admin_poppy', '21bd12dc183f740ee76f27b78eb39c8ad972a757', 'Admin Poppy', '', '', '-', 'admin', '2022-09-30 15:50:58');

-- ----------------------------
-- Table structure for user_akses
-- ----------------------------
DROP TABLE IF EXISTS `user_akses`;
CREATE TABLE `user_akses`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_menu` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `add` int NOT NULL DEFAULT 1 COMMENT '0=false, 1=true',
  `edit` int NOT NULL DEFAULT 1 COMMENT '0=false, 1=true',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `akses_kode_menu`(`kode_menu`) USING BTREE,
  INDEX `akses_level`(`level`) USING BTREE,
  CONSTRAINT `user_akses_ibfk_2` FOREIGN KEY (`kode_menu`) REFERENCES `user_menu` (`kode_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_akses_ibfk_3` FOREIGN KEY (`level`) REFERENCES `user_level` (`level`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 514 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_akses
-- ----------------------------
INSERT INTO `user_akses` VALUES (259, 'operator-tes', 'tes-hasil-operator', 1, 1);
INSERT INTO `user_akses` VALUES (260, 'operator-tes', 'tes-token', 1, 1);
INSERT INTO `user_akses` VALUES (481, 'admin', 'laporan-analisis-butir-soal', 1, 1);
INSERT INTO `user_akses` VALUES (482, 'admin', 'peserta-kartu', 1, 1);
INSERT INTO `user_akses` VALUES (483, 'admin', 'peserta-group', 1, 1);
INSERT INTO `user_akses` VALUES (484, 'admin', 'peserta-daftar', 1, 1);
INSERT INTO `user_akses` VALUES (485, 'admin', 'modul-daftar', 1, 1);
INSERT INTO `user_akses` VALUES (486, 'admin', 'tes-daftar', 1, 1);
INSERT INTO `user_akses` VALUES (487, 'admin', 'tool-backup', 1, 1);
INSERT INTO `user_akses` VALUES (488, 'admin', 'tes-evaluasi', 1, 1);
INSERT INTO `user_akses` VALUES (489, 'admin', 'tool-exportimport-soal', 1, 1);
INSERT INTO `user_akses` VALUES (490, 'admin', 'modul-filemanager', 1, 1);
INSERT INTO `user_akses` VALUES (491, 'admin', 'tes-hasil', 1, 1);
INSERT INTO `user_akses` VALUES (492, 'admin', 'peserta-import', 1, 1);
INSERT INTO `user_akses` VALUES (493, 'admin', 'modul-import', 1, 1);
INSERT INTO `user_akses` VALUES (494, 'admin', 'modul-import-word', 1, 1);
INSERT INTO `user_akses` VALUES (496, 'admin', 'user_level', 1, 1);
INSERT INTO `user_akses` VALUES (497, 'admin', 'user_menu', 1, 1);
INSERT INTO `user_akses` VALUES (498, 'admin', 'user_atur', 1, 1);
INSERT INTO `user_akses` VALUES (499, 'admin', 'user-zyacbt', 1, 1);
INSERT INTO `user_akses` VALUES (500, 'admin', 'laporan-rekap', 1, 1);
INSERT INTO `user_akses` VALUES (501, 'admin', 'modul-soal', 1, 1);
INSERT INTO `user_akses` VALUES (502, 'admin', 'tes-tambah', 1, 1);
INSERT INTO `user_akses` VALUES (503, 'admin', 'tes-token', 1, 1);
INSERT INTO `user_akses` VALUES (504, 'admin', 'modul-topik', 1, 1);
INSERT INTO `user_akses` VALUES (505, 'operator-soal', 'laporan-analisis-butir-soal', 1, 1);
INSERT INTO `user_akses` VALUES (506, 'operator-soal', 'laporan-analisis-soal', 1, 1);
INSERT INTO `user_akses` VALUES (507, 'operator-soal', 'modul-daftar', 1, 1);
INSERT INTO `user_akses` VALUES (508, 'operator-soal', 'tes-daftar', 1, 1);
INSERT INTO `user_akses` VALUES (509, 'operator-soal', 'tes-hasil', 1, 1);
INSERT INTO `user_akses` VALUES (510, 'operator-soal', 'modul-import-word', 1, 1);
INSERT INTO `user_akses` VALUES (511, 'operator-soal', 'laporan-rekap', 1, 1);
INSERT INTO `user_akses` VALUES (512, 'operator-soal', 'tes-tambah', 1, 1);
INSERT INTO `user_akses` VALUES (513, 'operator-soal', 'tes-token', 1, 1);

-- ----------------------------
-- Table structure for user_level
-- ----------------------------
DROP TABLE IF EXISTS `user_level`;
CREATE TABLE `user_level`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `level`(`level`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_level
-- ----------------------------
INSERT INTO `user_level` VALUES (1, 'admin', 'Administrator');
INSERT INTO `user_level` VALUES (7, 'operator-soal', 'Operator Soal');
INSERT INTO `user_level` VALUES (8, 'operator-tes', 'Operator Tes');

-- ----------------------------
-- Table structure for user_log
-- ----------------------------
DROP TABLE IF EXISTS `user_log`;
CREATE TABLE `user_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `log` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_log
-- ----------------------------

-- ----------------------------
-- Table structure for user_menu
-- ----------------------------
DROP TABLE IF EXISTS `user_menu`;
CREATE TABLE `user_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipe` int NOT NULL DEFAULT 1 COMMENT '0=parent, 1=child',
  `parent` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_menu` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_menu` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `url` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '#',
  `icon` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'fa fa-circle-o',
  `urutan` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `kode_menu`(`kode_menu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_menu
-- ----------------------------
INSERT INTO `user_menu` VALUES (1, 0, '', 'user', 'Pengaturan', '#', 'fa fa-user', 20);
INSERT INTO `user_menu` VALUES (3, 1, 'user', 'user_atur', 'Pengaturan User', 'manager/useratur', 'fa fa-circle-o', 5);
INSERT INTO `user_menu` VALUES (4, 1, 'user', 'user_level', 'Pengaturan Level', 'manager/userlevel', 'fa fa-circle-o', 6);
INSERT INTO `user_menu` VALUES (5, 1, 'user', 'user_menu', 'Pengaturan Menu', 'manager/usermenu', 'fa fa-circle-o', 7);
INSERT INTO `user_menu` VALUES (6, 0, '', 'modul', 'Data Modul', '#', 'fa fa-book', 2);
INSERT INTO `user_menu` VALUES (7, 1, 'modul', 'modul-daftar', 'Daftar Soal', 'manager/modul_daftar', 'fa fa-circle-o', 5);
INSERT INTO `user_menu` VALUES (8, 1, 'modul', 'modul-topik', 'Topik', 'manager/modul_topik', 'fa fa-circle-o', 2);
INSERT INTO `user_menu` VALUES (10, 0, '', 'peserta', 'Data Peserta', '#', 'fa fa-users', 3);
INSERT INTO `user_menu` VALUES (11, 1, 'peserta', 'peserta-daftar', 'Daftar Peserta', 'manager/peserta_daftar', 'fa fa-circle-o', 2);
INSERT INTO `user_menu` VALUES (12, 1, 'peserta', 'peserta-group', 'Daftar Group', 'manager/peserta_group', 'fa fa-circle-o', 1);
INSERT INTO `user_menu` VALUES (13, 1, 'peserta', 'peserta-import', 'Import Data Peserta', 'manager/peserta_import', 'fa fa-circle-o', 3);
INSERT INTO `user_menu` VALUES (14, 0, '', 'tes', 'Data Tes', '#', 'fa fa-tasks', 4);
INSERT INTO `user_menu` VALUES (15, 1, 'tes', 'tes-tambah', 'Tambah Tes', 'manager/tes_tambah', 'fa fa-circle-o', 1);
INSERT INTO `user_menu` VALUES (16, 1, 'tes', 'tes-daftar', 'Daftar Tes', 'manager/tes_daftar', 'fa fa-circle-o', 2);
INSERT INTO `user_menu` VALUES (17, 1, 'tes', 'tes-hasil', 'Hasil Tes', 'manager/tes_hasil', 'fa fa-circle-o', 6);
INSERT INTO `user_menu` VALUES (18, 1, 'modul', 'modul-soal', 'Soal', 'manager/modul_soal', 'fa fa-circle-o', 3);
INSERT INTO `user_menu` VALUES (19, 1, 'tes', 'tes-token', 'Token', 'manager/tes_token', 'fa fa-circle-o', 8);
INSERT INTO `user_menu` VALUES (22, 1, 'modul', 'modul-filemanager', 'File Manager', 'manager/modul_filemanager', 'fa fa-circle-o', 6);
INSERT INTO `user_menu` VALUES (24, 1, 'modul', 'modul-import', 'Import Soal Spreadsheet', 'manager/modul_import', 'fa fa-circle-o', 4);
INSERT INTO `user_menu` VALUES (25, 1, 'tes', 'tes-evaluasi', 'Evaluasi Tes', 'manager/tes_evaluasi', 'fa fa-circle-o', 5);
INSERT INTO `user_menu` VALUES (28, 1, 'tes', 'tes-hasil-operator', 'Hasil Tes Operator', 'manager/tes_hasil_operator', 'fa fa-circle-o', 10);
INSERT INTO `user_menu` VALUES (30, 0, '', 'tool', 'Tool', '#', 'fa fa-wrench', 6);
INSERT INTO `user_menu` VALUES (31, 1, 'tool', 'tool-backup', 'Database', 'manager/tool_backup', 'fa fa-database', 1);
INSERT INTO `user_menu` VALUES (32, 1, 'tes-laporan', 'laporan-rekap', 'Rekap Hasil Tes', 'manager/laporan_rekap_hasil', 'fa fa-circle-o', 7);
INSERT INTO `user_menu` VALUES (33, 1, 'tool', 'tool-exportimport-soal', 'Export / Import Soal', 'manager/tool_exportimport_soal', 'fa fa-circle-o', 2);
INSERT INTO `user_menu` VALUES (34, 1, 'user', 'user-zyacbt', 'Pengaturan ZYACBT', 'manager/pengaturan_zyacbt', 'fa fa-circle-o', 1);
INSERT INTO `user_menu` VALUES (37, 1, 'peserta', 'peserta-kartu', 'Cetak Kartu', 'manager/peserta_kartu', 'fa fa-circle-o', 5);
INSERT INTO `user_menu` VALUES (38, 0, '', 'tes-laporan', 'Laporan', '#', 'fa fa-print', 5);
INSERT INTO `user_menu` VALUES (41, 1, 'tes-laporan', 'laporan-analisis-butir-soal', 'Analisis Butir Soal', 'manager/laporan_analisis_butir_soal', 'fa fa-circle-o', 1);
INSERT INTO `user_menu` VALUES (42, 1, 'tes-laporan', 'laporan-analisis-soal', 'Analisis Soal', 'manager/laporan_analisis_soal', 'fa fa-circle-o', 2);
INSERT INTO `user_menu` VALUES (43, 1, 'modul', 'modul-import-word', 'Import Soal Word', 'manager/modul_import_word', 'fa fa-circle-o', 4);

SET FOREIGN_KEY_CHECKS = 1;
