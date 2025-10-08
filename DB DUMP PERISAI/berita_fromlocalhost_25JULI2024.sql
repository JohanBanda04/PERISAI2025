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

 Date: 25/07/2024 07:46:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for berita
-- ----------------------------
DROP TABLE IF EXISTS `berita`;
CREATE TABLE `berita`  (
  `id_berita` int(255) NOT NULL AUTO_INCREMENT,
  `nama_berita` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kode_satker` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `facebook` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `website` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `instagram` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `twitter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tiktok` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sippn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `youtube` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `media_lokal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `media_nasional` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tgl_input` date NULL DEFAULT NULL,
  `tgl_update` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_berita`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 377 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of berita
-- ----------------------------
INSERT INTO `berita` VALUES (369, 'Laborum PerspiciatiFirst', 'SAT-NTB-01', 'Et rerum sint repre', 'https://www.xijysutapedusu.org', 'Qui cupidatat minim', 'Harum aspernatur aut', 'Aliquip qui cillum n', 'Exercitationem perfe', 'Dolor cillum tempora', '[\"no media|||-|||-\"]', '[\"MED-NTB-02|||Tes berita media nasional|||Linknas1\"]', '2024-07-23', '2024-07-23');
INSERT INTO `berita` VALUES (370, 'Laborum PerspiciatiSecond', 'SAT-NTB-01', 'Et rerum sint repre', 'https://www.xijysutapedusu.org', 'Qui cupidatat minim', 'Harum aspernatur aut', 'Aliquip qui cillum n', 'Exercitationem perfe', 'Dolor cillum tempora', '[\"MED-NTB-01|||Qui et ad molestiae |||Link1\",\"MED-NTB-05|||Qui et ad molestiae |||Link2\",\"MED-NTB-09|||Qui et ad molestiae |||Link3\"]', '[\"MED-NTB-03|||Tes Berita Nasional1|||Linknas1\"]', '2024-07-23', '2024-07-23');
INSERT INTO `berita` VALUES (371, 'Laborum Perspiciati2', 'SAT-NTB-01', 'Et rerum sint repre', 'https://www.xijysutapedusu.org', 'Qui cupidatat minim', 'Harum aspernatur aut', 'Aliquip qui cillum n', 'Exercitationem perfe', 'Dolor cillum tempora', '[\"MED-NTB-01|||Qui et ad molestiae |||Link1\",\"MED-NTB-05|||Qui et ad molestiae |||Link2\",\"MED-NTB-09|||Qui et ad molestiae |||Link3\"]', '[\"no media|||-|||-\"]', '2024-07-23', NULL);
INSERT INTO `berita` VALUES (372, 'Laborum Perspiciati2', 'SAT-NTB-01', 'Et rerum sint repre', 'https://www.xijysutapedusu.org', 'Qui cupidatat minim', 'Harum aspernatur aut', 'Aliquip qui cillum n', 'Exercitationem perfe', 'Dolor cillum tempora', '[\"MED-NTB-10|||Qui et ad molestiae |||Link1\",\"MED-NTB-05|||Qui et ad molestiae |||Link2\",\"MED-NTB-10|||Qui et ad molestiae |||Link3\"]', '[\"no media|||-|||-\"]', '2024-07-23', '2024-07-23');
INSERT INTO `berita` VALUES (373, 'Laborum Perspiciati2', 'SAT-NTB-01', 'Et rerum sint repre', 'https://www.xijysutapedusu.org', 'Qui cupidatat minim', 'Harum aspernatur aut', 'Aliquip qui cillum n', 'Exercitationem perfe', 'Dolor cillum tempora', '[\"MED-NTB-01|||Qui et ad molestiae |||Link1\",\"MED-NTB-05|||Qui et ad molestiae |||Link2\",\"MED-NTB-09|||Qui et ad molestiae |||Link3\"]', '[\"no media|||-|||-\"]', '2024-07-23', NULL);
INSERT INTO `berita` VALUES (374, 'Laborum Perspiciati2', 'SAT-NTB-01', 'Et rerum sint repre', 'https://www.xijysutapedusu.org', 'Qui cupidatat minim', 'Harum aspernatur aut', 'Aliquip qui cillum n', 'Exercitationem perfe', 'Dolor cillum tempora', '[\"MED-NTB-01|||Qui et ad molestiae |||Link1\",\"MED-NTB-05|||Qui et ad molestiae |||Link2\",\"MED-NTB-09|||Qui et ad molestiae |||Link3\"]', '[\"no media|||-|||-\"]', '2024-07-23', NULL);
INSERT INTO `berita` VALUES (375, 'Laborum Perspiciati2', 'SAT-NTB-01', 'Et rerum sint repre', 'https://www.xijysutapedusu.org', 'Qui cupidatat minim', 'Harum aspernatur aut', 'Aliquip qui cillum n', 'Exercitationem perfe', 'Dolor cillum tempora', '[\"MED-NTB-01|||Qui et ad molestiae |||Link1\",\"MED-NTB-05|||Qui et ad molestiae |||Link2\",\"MED-NTB-09|||Qui et ad molestiae |||Link3\"]', '[\"no media|||-|||-\"]', '2024-07-23', NULL);
INSERT INTO `berita` VALUES (376, 'Laborum Perspiciati2', 'SAT-NTB-01', 'Et rerum sint repre', 'https://www.xijysutapedusu.org', 'Qui cupidatat minim', 'Harum aspernatur aut', 'Aliquip qui cillum n', 'Exercitationem perfe', 'Dolor cillum tempora', '[\"MED-NTB-07|||Qui et ad molestiae |||Link1\",\"MED-NTB-08|||Qui et ad molestiae |||Link2\",\"MED-NTB-09|||Qui et ad molestiae |||Link3\"]', '[\"no media|||-|||-\"]', '2024-07-23', '2024-07-23');

SET FOREIGN_KEY_CHECKS = 1;
