/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MariaDB
 Source Server Version : 100420
 Source Host           : localhost:3306
 Source Schema         : perisai_api

 Target Server Type    : MariaDB
 Target Server Version : 100420
 File Encoding         : 65001

 Date: 06/06/2024 14:48:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mediapartner
-- ----------------------------
DROP TABLE IF EXISTS `mediapartner`;
CREATE TABLE `mediapartner`  (
  `id_media` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `kode_media` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `foto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `no_hp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `jenis_media` enum('media_lokal','media_nasional') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_media`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  INDEX `kode_satker`(`kode_media`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mediapartner
-- ----------------------------
INSERT INTO `mediapartner` VALUES (48, 'Tribun Lombok Edit', 'tribuneditlombok', 'MED-NTB-01', 'tribunedit@gmail.com', '0000-00-00 00:00:00', '', NULL, 'MED-NTB-01.jpeg', '2024-05-29 12:17:56', '2024-05-30 09:50:19', '081987654321', 'media_lokal');
INSERT INTO `mediapartner` VALUES (49, 'Radar Lombok', 'radarlombok', 'MED-NTB-02', 'radar@gmail.com', '0000-00-00 00:00:00', '', NULL, 'MED-NTB-02.jpg', '2024-05-29 12:17:56', '2024-05-30 10:53:07', '081987654321', 'media_nasional');
INSERT INTO `mediapartner` VALUES (51, 'Antara News', 'antarauser', 'MED-NTB-03', 'antara@gmail.com', NULL, NULL, NULL, 'MED-NTB-03.jpeg', '2024-05-30 09:20:28', '2024-05-30 10:54:19', '0987654', 'media_nasional');
INSERT INTO `mediapartner` VALUES (53, 'Detik', 'detikuser', 'MED-NTB-04', 'detik@gmail.com', NULL, NULL, NULL, 'MED-NTB-04.jpeg', '2024-05-30 15:34:05', NULL, '0987656789', 'media_lokal');
INSERT INTO `mediapartner` VALUES (55, 'Gerbang Indonesia', 'gerbanguser', 'MED-NTB-05', 'gerbang@gmail.com', NULL, NULL, NULL, 'MED-NTB-04.jpeg', '2024-05-30 15:34:05', NULL, '0987656789', 'media_lokal');

SET FOREIGN_KEY_CHECKS = 1;
