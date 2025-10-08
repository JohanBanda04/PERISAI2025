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

 Date: 02/07/2024 16:18:26
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
) ENGINE = InnoDB AUTO_INCREMENT = 365 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of berita
-- ----------------------------
INSERT INTO `berita` VALUES (80, 'Voluptatem Corporis', 'SAT-NTB-01', 'Nam aspernatur autem', 'https://www.myqonibeloka.us', 'Quis deserunt iste q', 'Minim eiusmod molest', 'Minus illum quia no', 'Maiores totam omnis', 'Iure ea nulla qui mi', '[\"MED-NTB-01|||Judul|||LinkLokal1\",\"MED-NTB-02|||Judul|||LinkLokal2\",\"MED-NTB-02|||Judul|||LinkLokal3\",\"MED-NTB-02|||Judul|||LinkLokal4\",\"MED-NTB-01|||Judul|||LinkLokal5\"]', '[\"MED-NTB-03|||Judul|||LinkNasional1\",\"MED-NTB-03|||Judul|||LinkNasional2\"]', '2024-06-12', '2024-06-20');
INSERT INTO `berita` VALUES (82, 'Tes Judul Humas Kanwil', 'SAT-NTB-02', 'Vero est enim minus', 'https://www.zogyquge.tv', 'Nisi amet excepturi', 'Qui velit duis arch', 'Dolore dicta commodo', 'Non unde sunt et mol', 'Quisquam quas ipsum', '[\"MED-NTB-10|||Judul1|||LinkLokal1\",\"MED-NTB-10|||Judul1|||LinkLokal2\",\"MED-NTB-10|||Judul3|||LinkLokal3\",\"MED-NTB-04|||Judul1|||LinkLokal4\"]', '[\"MED-NTB-02|||Judul1|||LinkNasional1\",\"MED-NTB-02|||Judul1|||LinkNasional2\",\"MED-NTB-01|||Judul1|||LinkNasional3\"]', '2024-06-12', '2024-06-03');
INSERT INTO `berita` VALUES (83, 'Eum nostrum exercita', 'SAT-NTB-01', 'Nam maxime numquam c', 'https://www.fowefo.co.uk', 'Quia quos reiciendis', 'Duis vitae ut nobis', 'Architecto a volupta', 'Earum rerum exceptur', 'Magnam consequuntur', '[\"MED-NTB-01|||Omnis ut exercitatio|||Link2\",\"MED-NTB-03|||Omnis ut exercitatio|||Link3\",\"MED-NTB-03|||Omnis ut exercitatio|||Link4\"]', '[\"MED-NTB-04|||Non soluta maiores e|||LinkNas1\",\"MED-NTB-01|||Non soluta maiores e|||LinkNas2\",\"MED-NTB-03|||Non soluta maiores e|||LinkNas3\"]', '2024-06-10', '2024-06-04');
INSERT INTO `berita` VALUES (84, 'Sunt nisi quidem max', 'SAT-NTB-04', 'Ea doloribus nihil o', 'https://www.foxiciwij.info', 'Ullam laboriosam qu', 'Consequat Earum ill', 'Quia pariatur Do ve', 'Hic iure ipsum ipsa', 'Delectus vitae tene', '[\"MED-NTB-03|||Nihil dolore quod of|||LinkLokal1\",\"MED-NTB-01|||Nihil dolore quod of|||LinkLokal2\",\"MED-NTB-02|||Nihil dolore quod of|||LinkLokal3\"]', '[\"MED-NTB-01|||Quos sequi reprehend|||LinkNasional1\",\"MED-NTB-04|||Quos sequi reprehend|||LinkNasional2\",\"MED-NTB-04|||Quos sequi reprehend|||LinkNasional3\"]', '2024-06-11', NULL);
INSERT INTO `berita` VALUES (85, 'Magnam quae voluptat', 'SAT-NTB-04', 'Dolores do consequat', 'https://www.weroqydo.org', 'Laudantium facere a', 'Quas eius quas persp', 'Sequi ipsam voluptat', 'Nihil nemo eum dolor', 'Sint possimus quid', '[\"MED-NTB-02|||Voluptate aliquid qu|||Link2\",\"MED-NTB-02|||Voluptate aliquid qu|||Link3\",\"MED-NTB-01|||Voluptate aliquid qu|||Link4\"]', '[\"MED-NTB-05|||Voluptate aliquid qu|||LinkNasional1\",\"MED-NTB-03|||Voluptate aliquid qu|||LinkNasional2\",\"MED-NTB-04|||Voluptate aliquid qu|||LinkNasional3\",\"MED-NTB-05|||Voluptate aliquid qu|||LinkNasional4\"]', '2024-06-11', '2024-06-05');
INSERT INTO `berita` VALUES (86, 'Magnam quae voluptat', 'SAT-NTB-05', 'Dolores do consequat', 'https://www.weroqydo.org', 'Laudantium facere a', 'Quas eius quas persp', 'Sequi ipsam voluptat', 'Nihil nemo eum dolor', 'Sint possimus quid', '[\"MED-NTB-05|||Voluptate aliquid qu|||Link1\",\"MED-NTB-02|||Voluptate aliquid qu|||Link2\",\"MED-NTB-02|||Voluptate aliquid qu|||Link3\",\"MED-NTB-01|||Voluptate aliquid qu|||Link4\"]', '[\"MED-NTB-05|||Voluptate aliquid qu|||LinkNasional1\",\"MED-NTB-03|||Voluptate aliquid qu|||LinkNasional2\",\"MED-NTB-04|||Voluptate aliquid qu|||LinkNasional3\",\"MED-NTB-05|||Voluptate aliquid qu|||LinkNasional4\"]', '2024-06-11', '2024-06-05');
INSERT INTO `berita` VALUES (87, 'Laboris voluptas cup', 'SAT-NTB-05', 'Ullamco officiis con', 'https://www.belopizyvig.info', 'Est voluptatem occa', 'Sunt expedita dolore', 'Non et et iure incid', 'Omnis eum veritatis', 'Temporibus reprehend', '[\"MED-NTB-01|||Exercitation dicta e|||Link1\",\"MED-NTB-02|||Exercitation dicta e|||Link2\",\"MED-NTB-03|||Exercitation dicta e|||Link3\"]', '[\"no media|||-|||-\"]', '2024-06-10', NULL);
INSERT INTO `berita` VALUES (88, 'Tes judul berita 13 juni 2024', 'SAT-NTB-05', 'https://www.facebook.com/?locale=id_ID', 'https://www.website.com/?locale=id_ID', 'https://www.instagram.com/?locale=id_ID', 'https://www.twitter.com/?locale=id_ID', 'https://www.tiktok.com/?locale=id_ID', 'https://www.sippn.com/?locale=id_ID', 'https://www.youtube.com/?locale=id_ID', '[\"MED-NTB-09|||Provident consectet|||Link1\",\"MED-NTB-09|||Provident consectet|||Link2\",\"MED-NTB-09|||Provident consectet|||Link3\"]', '[\"no media|||-|||-\"]', '2024-06-12', NULL);
INSERT INTO `berita` VALUES (89, 'TESTING BERITA', 'SAT-NTB-01', 'Elit quasi rerum vo', 'https://www.puxote.org', 'Voluptatibus et minu', 'Commodi in qui qui m', 'Hic sed cupidatat ve', 'Iste dicta cupiditat', 'Aut dicta amet labo', '[\"no media|||Minima officia sequi|||Link1\",\"no media|||Minima officia sequi|||Link2\",\"no media|||Minima officia sequi|||Link3\"]', '[\"no media|||Nulla ea accusamus c|||Link1\",\"no media|||Nulla ea accusamus c|||Link2\",\"no media|||Nulla ea accusamus c|||Link3\"]', '2024-06-20', '2024-06-21');
INSERT INTO `berita` VALUES (90, 'BERITA LAPAS LOBAR', 'SAT-NTB-04', 'Id modi dolorem offi', 'https://www.budafuhad.me.uk', 'Velit in architecto', 'Et elit duis est v', 'Eiusmod animi molli', 'Optio sed odio opti', 'Illum proident ab', '[\"MED-NTB-07|||Provident consectet|||Link1\",\"MED-NTB-08|||Provident consectet|||Link1\"]', '[\"MED-NTB-02|||Iure rerum dolor hic|||Link1\",\"no media|||Iure rerum dolor hic|||Link2\"]', '2024-06-24', '2024-06-21');
INSERT INTO `berita` VALUES (91, 'CEK BERITA BROY', 'SAT-NTB-01', 'Tenetur aliquip adip', 'https://www.tononilypuqax.me', 'Dolorem quam illum', 'Sit proident maxim', 'Voluptatem et cum do', 'Corrupti eos quas', 'Consectetur in nisi', '[\"no media|||Rerum voluptatem do\"]', '[\"no media|||Odio aliquam sit es\"]', '2024-06-27', '2024-06-27');
INSERT INTO `berita` VALUES (302, 'GELAR TIMPORA, KANWIL KEMENKUMHAM NTB PERKUAT PENGAWASAN ORANG ASING:', 'SAT-NTB-01', 'https://www.facebook.com/permalink.php?story_fbid=pfbid0M678Qv92tdVAjdxeZzKhHDETRncsBvqiZCuDJbmHY9FkbvQoVQJfoKLAMPXwo5Lvl&id=61560886213034', 'https://ntb.kemenkumham.go.id/berita-utama/gelar-timpora-kanwil-kemenkumham-ntb-perkuat-pengawasan-orang-asing', '-', 'https://x.com/KumhamNTB/status/1805803755511927210', '-', '-', '-', '[\"MED-NTB-01|||GELAR TIMPORA, KANWIL KEMENKUMHAM NTB PERKUAT PENGAWASAN ORANG ASING: |||| https:\\/\\/lombok.tribunnews.com\\/2024\\/06\\/26\\/gelar-timpora-kanwil-kemenkumham-ntb-perkuat-pengawasan-orang-asing\",\"MED-NTB-02|||KANWIL KEMENKUMHAM NTB PERKUAT PENGAWASAN ORANG ASING: ||| https:\\/\\/radarlombok.co.id\\/kanwil-kemenkumham-ntb-perkuat-pengawasan-orang-asing.html\"]', '[\"no media|||-|||-\"]', '2024-06-26', '2024-06-26');
INSERT INTO `berita` VALUES (303, 'KANWIL KEMENKUMHAM NTB  FASILITASI PENYUSUNAN NASKAH AKADEMIK DI SUMBAWA BARAT:', 'SAT-NTB-01', 'https://www.facebook.com/permalink.php?story_fbid=pfbid0ArYpsR9wCgtTDsxUjLTJ8iboyGubtNPBJ5v2BK8BM6Z3v7gPAJx31uovPqw7sGRdl&id=61560886213034', 'https://ntb.kemenkumham.go.id/berita-utama/kanwil-kemenkumham-ntb-fasilitasi-penyusunan-naskah-akademik-di-sumbawa-barat', '-', 'https://x.com/KumhamNTB/status/1805803971241705670', '-', '-', '-', '[\"MED-NTB-02|||KANWIL KEMENKUMHAM NTB  FASILITASI PENYUSUNAN NASKAH AKADEMIK DI SUMBAWA BARAT: ||| https:\\/\\/radarlombok.co.id\\/kanwil-kemenkumham-ntb-fasilitasi-penyusunan-naskah-akademik-di-sumbawa-barat.html\",\"MED-NTB-03|||KANWIL KEMENKUMHAM NTB  FASILITASI PENYUSUNAN NASKAH AKADEMIK DI SUMBAWA BARAT: ||| https:\\/\\/www.suarantb.com\\/2024\\/06\\/25\\/kanwil-kemenkumham-ntb-fasilitasi-penyusunan-naskah-akademik-di-sumbawa-barat\\/\",\"MED-NTB-04|||KANWIL KEMENKUMHAM NTB  FASILITASI PENYUSUNAN NASKAH AKADEMIK DI SUMBAWA BARAT: ||| https:\\/\\/lombokpost.jawapos.com\\/ntb\\/1504798268\\/kanwil-kemenkumham-ntb-fasilitasi-penyusunan-naskah-akademik-di-sumbawa-barat\"]', '[\"no media|||-|||-\"]', '2024-06-26', '2024-06-26');
INSERT INTO `berita` VALUES (304, 'KANWIL KEMENKUMHAM NTB SIAP LANJUTKAN TREN POSITIF RAIH OPINI WTP:', 'SAT-NTB-01', 'https://www.facebook.com/permalink.php?story_fbid=pfbid07NWc7iXyZGjNMH3CBYcBmAh8QfsURt16nBVLRSH3Pm5uaxK6p11qqn1Bfh4VkrsLl&id=61560886213034', 'https://ntb.kemenkumham.go.id/berita-utama/kanwil-kemenkumham-ntb-siap-lanjutkan-tren-positif-raih-opini-wtp', '-', 'https://x.com/KumhamNTB/status/1805866602682106346', '-', '-', '-', '[\"MED-NTB-08|||KANWIL KEMENKUMHAM NTB MENUJU OPINI WTP DENGAN TREN POSITIF: |||  https:\\/\\/rri.co.id\\/mataram\\/daerah\\/781641\\/kanwil-kemenkumham-ntb-menuju-opini-wtp-dengan-tren-positif\",\"MED-NTB-04|||KANWIL KEMENKUMHAM NTB SIAP LANJUTKAN TREN POSITIF RAIH OPINI WTP: ||| https:\\/\\/lombokpost.jawapos.com\\/ntb\\/1504799246\\/kanwil-kemenkumham-ntb-siap-lanjutkan-tren-positif-raih-opini-wtp\",\"MED-NTB-03|||KANWIL KEMENKUMHAM NTB SIAP LANJUTKAN TREN POSITIF RAIH OPINI WTP: ||| https:\\/\\/www.suarantb.com\\/2024\\/06\\/26\\/kanwil-kemenkumham-ntb-siap-lanjutkan-tren-positif-raih-opini-wtp\\/\",\"MED-NTB-06|||KANWIL KEMENKUMHAM NTB SIAP LANJUTKAN TREN POSITIF RAIH OPINI WTP: ||| https:\\/\\/gerbangindonesia.co.id\\/2024\\/06\\/26\\/kanwil-kemenkumham-ntb-siap-lanjutkan-tren-positif-raih-opini-wtp\\/\\/\"]', '[\"no media|||-|||-\"]', '2024-06-26', '2024-06-26');
INSERT INTO `berita` VALUES (305, 'ONE STOP SERVICE KANWIL KEMENKUMHAM NTB BERSAMA DJKI GELAR PATENT ONE STOP SERVICE:', 'SAT-NTB-01', 'https://www.facebook.com/permalink.php?story_fbid=pfbid0Ar7WmqmwKxVyMTXRH6ogybcbfLQwM49MTeBG4awJhLAE8Um3g3LMtEm4kQBErHbbl&id=61560886213034', 'https://ntb.kemenkumham.go.id/berita-utama/kanwil-kemenkumham-ntb-bersama-djki-gelar-patent-one-stop-service', '-', 'https://x.com/KumhamNTB/status/1805869612141363671', '-', '-', '-', '[\"MED-NTB-08|||KANWIL KEMENKUMHAM NTB DAN DJKI GELAR PATENT ONE STOP SERVICE: ||| https:\\/\\/rri.co.id\\/mataram\\/daerah\\/781673\\/kanwil-kemenkumham-ntb-dan-djki-gelar-patent-one-stop-service\",\"MED-NTB-08|||KANWIL NTB DAN DJKI DORONG PENDAFTARAN PATEN MELALUI LAYANAN ONE STOP SERVICE:\",\"MED-NTB-04|||KANWIL NTB DAN DJKI DORONG INVESTOR DAFTARKAN PATEN LEWAT ONE STEP SERVICE: ||| https:\\/\\/lombokpost.jawapos.com\\/ntb\\/1504799542\\/kanwil-ntb-dan-djki-dorong-inventor-daftarkan-paten-lewat-one-stop-service\",\"MED-NTB-03|||KANWIL NTB DAN DJKI DORONG INVESTOR DAFTARKAN PATEN LEWAT ONE STEP SERVICE:  |||\"]', '[\"no media|||-|||-\"]', '2024-06-26', '2024-06-26');
INSERT INTO `berita` VALUES (306, 'KANWIL KEMENKUMHAM NTB GELAR PRA REKONSILIASI LAPORAN KEUANGAN DAN BMN:', 'SAT-NTB-01', '-', '-', '-', '-', '-', '-', '-', '[\"MED-NTB-08|||KANWIL KEMENKUMHAM NTB GELAR PRA REKONSILIASI LAPORAN KEUANGAN DAN BMN: ||| https:\\/\\/rri.co.id\\/mataram\\/daerah\\/781648\\/kanwil-kemenkumham-ntb-gelar-pra-rekonsiliasi-laporan-keuangan-dan-bmn\"]', '[\"no media|||-|||-\"]', '2024-06-26', NULL);
INSERT INTO `berita` VALUES (307, 'KEMENKUMHAM NTB REKOMENDASIKAN RAPERDA BERBASIS HAM:', 'SAT-NTB-01', '-', '-', '-', '-', '-', '-', '-', '[\"MED-NTB-08|||KEMENKUMHAM NTB REKOMENDASIKAN RAPERDA BERBASIS HAM: ||| https:\\/\\/rri.co.id\\/mataram\\/daerah\\/781665\\/kemenkumham-ntb-rekomendasikan-raperda-berbasis-ham\",\"MED-NTB-03|||KEMENKUMHAM NTB REKOMENDASIKAN RAPERDA BERBASIS HAM: ||| https:\\/\\/www.suarantb.com\\/2024\\/06\\/26\\/cegah-puu-tidak-melanggar-ham-kemenkumham-ntb-rumuskan-rekomendasi-raperda-berbasis-ham\\/\"]', '[\"no media|||-|||-\"]', '2024-06-26', '2024-06-26');
INSERT INTO `berita` VALUES (308, 'KANWIL KEMENKUMHAM NTB DISEMINASI PERSEROAN PERORANGAN DAN LAYANAN APOSTILLLE KOTA BIMA:', 'SAT-NTB-01', '-', '-', '-', '-', '-', '-', '-', '[\"MED-NTB-01|||KANWIL KEMENKUMHAM NTB DISEMINASI PERSEROAN PERORANGAN DAN LAYANAN APOSTILLLE KOTA BIMA: ||| https:\\/\\/lombok.tribunnews.com\\/2024\\/06\\/26\\/kemenkumham-ntb-gelar-diseminasi-perseroan-perorangan-dan-layanan-apostille-di-kota-bima\",\"MED-NTB-02|||KANWIL KEMENKUMHAM NTB DISEMINASI PERSEROAN PERORANGAN DAN LAYANAN APOSTILLLE KOTA BIMA: ||| https:\\/\\/radarlombok.co.id\\/kanwil-kemenkumham-ntb-diseminasi-perseroan-perorangan-dan-layanan-apostille-di-kota-bima.html\"]', '[\"no media|||-|||-\"]', '2024-06-26', '2024-06-27');
INSERT INTO `berita` VALUES (322, 'Voluptate voluptatem', 'SAT-NTB-01', 'Harum inventore anim', 'https://www.gimutoqevarycep.ws', 'Molestias deserunt q', 'Facere consequatur e', 'Facilis quasi rerum', 'Officia ut mollitia', 'Veniam delectus vo', '[\"MED-NTB-09|||Sint ut magnam tene|||Link1\",\"no media|||Consequatur minus a|||Link2\"]', '[\"MED-NTB-08|||Hic nihil aliqua Li|||Linknas1\",\"no media|||Est autem a minima |||Linknas2\"]', '2024-06-28', '2024-07-02');
INSERT INTO `berita` VALUES (323, 'Et molestias ducimus', 'SAT-NTB-01', 'Amet totam fugit c', 'https://www.duhutyl.org', 'Nisi sit dolore cor', 'Qui placeat consequ', 'Corrupti cupiditate', 'Accusamus aut suscip', 'Qui exercitationem u', '[\"MED-NTB-07|||Consectetur sed mol|||Link1\",\"MED-NTB-09|||Consectetur sed mol|||Link2\"]', '[\"MED-NTB-03|||Laudantium incidunt\"]', '2024-06-28', NULL);
INSERT INTO `berita` VALUES (324, 'Aut maxime et nostru', 'SAT-NTB-01', 'Dolores laboriosam', 'https://www.hokywec.cc', 'Nihil in dolore culp', 'Aut officia dolorem', 'Ut dolore quas autem', 'In molestiae consequ', 'Veniam lorem culpa', '[\"MED-NTB-011|||Cillum fuga Sint n|||Link1\"]', '[\"MED-NTB-04|||Distinctio Vitae fu\"]', '2024-06-28', NULL);
INSERT INTO `berita` VALUES (363, 'Sed quibusdam dolor', 'SAT-NTB-04', 'Molestias nulla dict', 'https://www.ziji.ca', 'Voluptate iste qui o', 'Amet culpa in aut l', 'Commodi magna deseru', 'Fuga Optio qui fug', 'Deserunt deserunt li', '[\"MED-NTB-09|||Consectetur error pr|||Link1\",\"MED-NTB-05|||Laudantium deserunt|||Link2\"]', '[\"MED-NTB-02|||Non ut non unde atqu|||Link1\",\"MED-NTB-10|||Nostrum itaque imped|||Link2\"]', '2024-07-02', NULL);

-- ----------------------------
-- Table structure for cabang
-- ----------------------------
DROP TABLE IF EXISTS `cabang`;
CREATE TABLE `cabang`  (
  `kode_cabang` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_cabang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lokasi_cabang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `radius_cabang` int(255) NOT NULL,
  PRIMARY KEY (`kode_cabang`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cabang
-- ----------------------------
INSERT INTO `cabang` VALUES ('JKT', 'JAKARTA', '-8.59251035890902,116.0973841', 20);
INSERT INTO `cabang` VALUES ('MTR', 'Mataram', '-8.592313731512958,116.09724612297573', 30);

-- ----------------------------
-- Table structure for departemen
-- ----------------------------
DROP TABLE IF EXISTS `departemen`;
CREATE TABLE `departemen`  (
  `kode_dept` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_dept` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`kode_dept`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departemen
-- ----------------------------
INSERT INTO `departemen` VALUES ('GAF', 'General Affair Edit');
INSERT INTO `departemen` VALUES ('HRD', 'Human Resource Development');
INSERT INTO `departemen` VALUES ('IT', 'Information Technology');
INSERT INTO `departemen` VALUES ('KEU', 'Keuangan');
INSERT INTO `departemen` VALUES ('MKT', 'Marketing');

-- ----------------------------
-- Table structure for jam_kerja
-- ----------------------------
DROP TABLE IF EXISTS `jam_kerja`;
CREATE TABLE `jam_kerja`  (
  `kode_jam_kerja` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_jam_kerja` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `awal_jam_masuk` time(0) NULL DEFAULT NULL,
  `jam_masuk` time(0) NULL DEFAULT NULL,
  `akhir_jam_masuk` time(0) NULL DEFAULT NULL,
  `jam_pulang` time(0) NULL DEFAULT NULL,
  PRIMARY KEY (`kode_jam_kerja`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jam_kerja
-- ----------------------------
INSERT INTO `jam_kerja` VALUES ('MTR02', 'SHIFT01', '06:30:00', '07:00:00', '08:00:00', '15:00:00');
INSERT INTO `jam_kerja` VALUES ('MTR03', 'SHIFT02', '06:30:00', '07:00:00', '08:00:00', '15:00:00');
INSERT INTO `jam_kerja` VALUES ('REGS1', 'REGULER SABTU', '06:30:00', '07:00:00', '13:00:00', '13:30:00');

-- ----------------------------
-- Table structure for karyawan
-- ----------------------------
DROP TABLE IF EXISTS `karyawan`;
CREATE TABLE `karyawan`  (
  `nik` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_lengkap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jabatan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_hp` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `foto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kode_dept` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kode_cabang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nik`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of karyawan
-- ----------------------------
INSERT INTO `karyawan` VALUES ('12311', 'Roody', 'Staff Marketing', '098123', '$2y$10$d6O0Vf.r2jgr8RnzTsAATe47KtM3cyPEmEOIcI.nOMtALyMfEma82', NULL, NULL, 'MKT', 'MTR');
INSERT INTO `karyawan` VALUES ('12345', 'Eko Rizkianto Mamat', 'Head Of IT', '087865249079', '$2y$10$d6O0Vf.r2jgr8RnzTsAATe47KtM3cyPEmEOIcI.nOMtALyMfEma82', NULL, '12345.jpeg', 'IT', 'JKT');
INSERT INTO `karyawan` VALUES ('12346', 'Wahyudianto', 'HRD Manager', '087865249072', '$2y$10$d6O0Vf.r2jgr8RnzTsAATe47KtM3cyPEmEOIcI.nOMtALyMfEma82', NULL, NULL, 'HRD', 'JKT');
INSERT INTO `karyawan` VALUES ('12347', 'Memet', 'Accounting', '087865249072', '$2y$10$d6O0Vf.r2jgr8RnzTsAATe47KtM3cyPEmEOIcI.nOMtALyMfEma82', NULL, '12347.jpeg', 'KEU', 'JKT');
INSERT INTO `karyawan` VALUES ('1991', 'M.Ilyas', 'Pelaksana', '087865349072', '$2y$10$d6O0Vf.r2jgr8RnzTsAATe47KtM3cyPEmEOIcI.nOMtALyMfEma82', NULL, '19973654321.jpeg', 'IT', 'MTR');

-- ----------------------------
-- Table structure for konfigurasi_berita
-- ----------------------------
DROP TABLE IF EXISTS `konfigurasi_berita`;
CREATE TABLE `konfigurasi_berita`  (
  `id_konfig` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name_config` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_satker` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `salam_pembuka` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `yth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `jumlah_tembusan_yth` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dari_pengirim` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pengantar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `jumlah_hashtag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `jargon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `jumlah_moto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `penutup` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `salam_penutup` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `jenis_konfig` enum('Konfigurasi Berita','Konfigurasi Rekap') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tgl_input` date NULL DEFAULT NULL,
  `tgl_update` date NULL DEFAULT NULL,
  `ttd_kakanwil` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nama_kakanwil` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_konfig`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of konfigurasi_berita
-- ----------------------------
INSERT INTO `konfigurasi_berita` VALUES (1, 'Lapas Mataram Template', 'SAT-NTB-04', 'Assalamualaikum Wr. Wb. Edit', 'Yth: Bapak Kakanwil Edit', '[\"Tembusan1\",\"Tembusan2\",\"Tembusan3\",\"Tembusan4\",\"Tembusan5\"]', 'Dari Kalapas Edit', 'Bersama Ini Dilaporkan Edit', '[\"#Parlindungan\",\"#Juare\",\"#KumhamPasti\",\"#Sayang\"]', 'Kumham NTB Pasti Juare Edit', '[\"Moto1\",\"Moto2\",\"Moto3\",\"Moto4\"]', 'Matur Tampiasih Meton Edit', 'Wassalam Edit', 'Konfigurasi Berita', '2024-03-20', '2024-03-26', NULL, NULL);
INSERT INTO `konfigurasi_berita` VALUES (49, 'Konfig 1', 'SAT-NTB-04', 'Assalamualaikum Warrahmatullahir Wabarakatuh', 'Yth: Bapak Kakanwil', '[\"Tembusan1\",\"Tembusan2\",\"Tembusan3\"]', 'Dari Kalapas', 'Bersama Ini Dilaporkan', '[\"#Parlindungan\",\"#Juare\",\"#Menkumham\"]', 'Kumham NTB Pasti Juare', '[\"Moto1\",\"Moto2\"]', 'Penutup', 'Wassalamualaikum', 'Konfigurasi Berita', '2024-03-20', '2024-03-20', NULL, NULL);
INSERT INTO `konfigurasi_berita` VALUES (50, 'Konfigurasi Berita Kanim 1', 'SAT-NTB-017', 'Assalamualaikum', 'Yth. Bapak Kepala Kakanwil', '[\"Tembusan1\",\"Tembusan2\",\"Tembusan3\",\"Tembusan4\"]', 'Dari Kalapas', 'Bersama Ini Dilaporkan', '[\"#Parlindungan\",\"#Juare\",\"#Menkumham\",\"#KanwilNTB\"]', 'Kumham NTB Pasti Juare', '[\"Moto1\",\"Moto2\",\"Moto3\",\"Moto4\"]', 'Matur Tampiasih', 'Wassalam', 'Konfigurasi Berita', '2024-03-20', '2024-03-27', NULL, NULL);
INSERT INTO `konfigurasi_berita` VALUES (51, 'Konfigurasi Rutan Bima', 'SAT-NTB-012', 'Assalamualaikum Warahmatullahi Wabarakatuh', 'Yth. Bapak Kepala Kanwil Kemenkumham NTB', '[\"Tembusan Yth : Kadivpas NTB 1\",\"Tembusan Yth : Kadivpas NTB 2\",\"Tembusan Yth : Kadivpas NTB 3\"]', 'Dari : Kalapas Lobar', 'Bersama ini dilaporkan ke bapak Kakanwil terkait publikasi pemberitaan', '[\"#Parlindungan\",\"#KanwilKemenkumhamNTB\"]', '#KumhamPasti', '[\"Juare, Unggul, Amanah, Ramah, Excellent\",\"Don\'t Forget to Like, Comment, and Subscribe\"]', 'Matur Tampiasih', 'Wassalamualaikum Wr. Wb.', 'Konfigurasi Berita', '2024-03-21', '2024-03-21', NULL, NULL);
INSERT INTO `konfigurasi_berita` VALUES (52, 'Template Berita Rutan Praya', 'SAT-NTB-011', 'Assalamualaikum Wr. Wb.', 'Yth. Bpk Kepala Kanwil  Kemenkumham Nusa Tenggara Barat', '[\"Tembusan Yth : Kadivmin Kanwil NTB\",\"Tembusan Yth : Kadivpas Kanwil NTB\"]', 'Dari Kepala Rutan Praya', 'Bersama ini dilaporkan bahwa telah dipublikasikan giat berikut', '[\"#RutanPraya\",\"#Parlindungan\",\"#Juare\"]', 'Rutan Praye Mantap', '[\"Juare\",\"Unggul\",\"Amanah\",\"Ramah\"]', 'Matur Tampiasin Meton', 'Terimakasih, Wassalam', 'Konfigurasi Berita', '2024-03-26', '2024-03-26', NULL, NULL);
INSERT INTO `konfigurasi_berita` VALUES (55, 'In et inventore nesc', 'SAT-NTB-01', 'Perferendis suscipit', 'Ad eaque rerum sed t', '[\"Quis temporibus anim\"]', 'Suscipit suscipit cu', 'Doloremque eius saep', '[\"In aut numquam proid\"]', 'Delectus est dolore', '[\"Quod quam ea et earu\"]', 'Animi id odit vel v', 'Magni fugiat omnis e', 'Konfigurasi Berita', '2024-04-02', '2024-04-02', 'KAKANWIL KEMENKUMHAM NTB', 'PARLINDUNGAN');
INSERT INTO `konfigurasi_berita` VALUES (57, 'Kanwil Config Rekap II', 'SAT-NTB-02', 'Assalamualaikum Wr.. Wb..', 'Yth. Bapak Kepala Kakanwil Kemenkumham NTB', '[\"Kadivmin Kemenkumham NTB\",\"Kadivpas Kemenkumham NTB\",\"Kadivyankum Kemenkumham NTB\"]', 'Kalapas Lobar', 'Bersama ini dilaporkan bahwa telah dipublikasikan giat berikut', NULL, NULL, NULL, NULL, 'Wassalamualaikum Wr. Wb.', 'Konfigurasi Rekap', '2024-04-02', '2024-04-02', 'KAKANWIL KEMENKUMHAM NTB', 'PARLINDUNGAN');
INSERT INTO `konfigurasi_berita` VALUES (58, 'Lapas Lobar Config Rekap II', 'SAT-NTB-04', 'Assalamualaikum Wr.. Wb..', 'Yth. Bapak Kepala Kakanwil Kemenkumham NTB', '[\"Kadivmin Kemenkumham NTB\",\"Kadivpas Kemenkumham NTB\",\"Kadivyankum Kemenkumham NTB\"]', 'Kalapas Lobar', 'Bersama ini dilaporkan bahwa telah dipublikasikan giat berikut', NULL, NULL, NULL, NULL, 'Wassalamualaikum Wr. Wb.', 'Konfigurasi Rekap', '2024-04-02', '2024-04-02', 'KAKANWIL KEMENKUMHAM NTB', 'PARLINDUNGAN');
INSERT INTO `konfigurasi_berita` VALUES (59, 'Edit Lapas Sumbawa Besar Konfigurasi I', 'SAT-NTB-05', 'Edit Assalamualaikum Wr.. Wb..', 'Edit Yth. Bapak Kepala Kakanwil Kemenkumham NTB', '[\"Edit Kadivmin Kemenkumham NTB\",\"Edit Kadivpas Kemenkumham NTB\",\"Edit Kadivyankum Kemenkumham NTB\",\"Edit Tambah Kadiv4\",\"Edit Tambah Kadiv5\"]', 'Edit Kalapas Lobar', 'Edit Bersama ini dilaporkan bahwa telah dipublikasikan giat berikut', NULL, NULL, NULL, NULL, 'Edit Wassalamualaikum Wr. Wb.', 'Konfigurasi Rekap', '2024-04-02', '2024-04-02', 'Edit KAKANWIL KEMENKUMHAM NTB', 'Edit PARLINDUNGAN');
INSERT INTO `konfigurasi_berita` VALUES (60, 'Adam Konfig Berita', 'SAT-NTB-01', 'Assalamualaikum Wr. Wb. Edit', 'Yth: Bapak Kakanwil Edit', '[\"Tembusan1\",\"Tembusan2\",\"Tembusan3\",\"Tembusan4\",\"Tembusan5\"]', 'Dari Kalapas Edit', 'Bersama Ini Dilaporkan Edit', '[\"#Parlindungan\",\"#Juare\",\"#KumhamPasti\",\"#Sayang\"]', 'Kumham NTB Pasti Juare Edit', '[\"Moto1\",\"Moto2\",\"Moto3\",\"Moto4\"]', 'Matur Tampiasih Meton Edit', 'Wassalam Edit', 'Konfigurasi Berita', '2024-03-20', '2024-03-26', 'KAKANWIL KEMENKUMHAM NTB', 'PARLINDUNGAN');
INSERT INTO `konfigurasi_berita` VALUES (61, 'KakaKonfig Berita', 'SAT-NTB-02', 'Assalamualaikum Wr. Wb. Edit', 'Yth: Bapak Kakanwil Edit', '[\"Tembusan1\",\"Tembusan2\",\"Tembusan3\",\"Tembusan4\",\"Tembusan5\"]', 'Dari Kalapas Edit', 'Bersama Ini Dilaporkan Edit', '[\"#Parlindungan\",\"#Juare\",\"#KumhamPasti\",\"#Sayang\"]', 'Kumham NTB Pasti Juare Edit', '[\"Moto1\",\"Moto2\",\"Moto3\",\"Moto4\"]', 'Matur Tampiasih Meton Edit', 'Wassalam Edit', 'Konfigurasi Berita', '2024-03-20', '2024-03-26', NULL, NULL);
INSERT INTO `konfigurasi_berita` VALUES (62, 'Adam Config Recap', 'SAT-NTB-01', 'Edit Assalamualaikum Wr.. Wb..', 'Edit Yth. Bapak Kepala Kakanwil Kemenkumham NTB', '[\"Edit Kadivmin Kemenkumham NTB\",\"Edit Kadivpas Kemenkumham NTB\",\"Edit Kadivyankum Kemenkumham NTB\",\"Edit Tambah Kadiv4\",\"Edit Tambah Kadiv5\"]', 'Edit Kalapas Lobar', 'Edit Bersama ini dilaporkan bahwa telah dipublikasikan giat berikut', NULL, NULL, NULL, NULL, 'Edit Wassalamualaikum Wr. Wb.', 'Konfigurasi Rekap', '2024-04-02', '2024-04-02', 'Edit KAKANWIL KEMENKUMHAM NTB', 'Edit PARLINDUNGAN');
INSERT INTO `konfigurasi_berita` VALUES (63, 'Kaka Config Recap', 'SAT-NTB-02', 'Edit Assalamualaikum Wr.. Wb..', 'Edit Yth. Bapak Kepala Kakanwil Kemenkumham NTB', '[\"Edit Kadivmin Kemenkumham NTB\",\"Edit Kadivpas Kemenkumham NTB\",\"Edit Kadivyankum Kemenkumham NTB\",\"Edit Tambah Kadiv4\",\"Edit Tambah Kadiv5\"]', 'Edit Kalapas Lobar', 'Edit Bersama ini dilaporkan bahwa telah dipublikasikan giat berikut', NULL, NULL, NULL, NULL, 'Edit Wassalamualaikum Wr. Wb.', 'Konfigurasi Rekap', '2024-04-02', '2024-04-02', 'Edit KAKANWIL KEMENKUMHAM NTB', 'Edit PARLINDUNGAN');
INSERT INTO `konfigurasi_berita` VALUES (64, 'SUMBAWA', 'SAT-NTB-05', 'Assalamu\'alaikum Wr. Wb.', 'Yth. Bapak Kepala Kantor Wilayah Kementerian Hukum dan HAM NTB', '[\"Tembusan Yth : KADIVPAS NTB (PEMASYARAKATAN)\"]', 'Dari : Kepala Lembaga Pemasyarakatan Kelas IIA Lombok Barat', 'Bersama ini dilaporkan kepada Bapak KAKANWIL terkait hasil rilis dan publikasi giat Lembaga Pemasyarakatan Kelas IIA Sumbawa Besar', '[\"#Parlindungan\",\"#KumhamPasti\"]', 'Kumham NTB PASTI JUARE', '[\"Jujur\"]', 'Matur Tampiasih', 'Terima kasih, Wassalamu\'alaikum Wr. Wb.', 'Konfigurasi Berita', '2024-04-29', '2024-04-29', NULL, NULL);

-- ----------------------------
-- Table structure for konfigurasi_jamkerja
-- ----------------------------
DROP TABLE IF EXISTS `konfigurasi_jamkerja`;
CREATE TABLE `konfigurasi_jamkerja`  (
  `nik` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hari` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kode_jam_kerja` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of konfigurasi_jamkerja
-- ----------------------------
INSERT INTO `konfigurasi_jamkerja` VALUES ('12345', 'Senin', 'REGS1');
INSERT INTO `konfigurasi_jamkerja` VALUES ('12345', 'Selasa', 'REGS1');
INSERT INTO `konfigurasi_jamkerja` VALUES ('12345', 'Rabu', 'REGS1');
INSERT INTO `konfigurasi_jamkerja` VALUES ('12345', 'Kamis', 'REGS1');
INSERT INTO `konfigurasi_jamkerja` VALUES ('12345', 'Jumat', 'REGS1');
INSERT INTO `konfigurasi_jamkerja` VALUES ('12345', 'Sabtu', 'REGS1');
INSERT INTO `konfigurasi_jamkerja` VALUES ('1991', 'Senin', 'MTR02');
INSERT INTO `konfigurasi_jamkerja` VALUES ('1991', 'Selasa', 'REGS1');
INSERT INTO `konfigurasi_jamkerja` VALUES ('1991', 'Rabu', 'MTR02');
INSERT INTO `konfigurasi_jamkerja` VALUES ('1991', 'Kamis', 'REGS1');
INSERT INTO `konfigurasi_jamkerja` VALUES ('1991', 'Jumat', 'MTR02');
INSERT INTO `konfigurasi_jamkerja` VALUES ('1991', 'Sabtu', 'REGS1');

-- ----------------------------
-- Table structure for konfigurasi_lokasi
-- ----------------------------
DROP TABLE IF EXISTS `konfigurasi_lokasi`;
CREATE TABLE `konfigurasi_lokasi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lokasi_kantor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `radius` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of konfigurasi_lokasi
-- ----------------------------
INSERT INTO `konfigurasi_lokasi` VALUES (1, '-8.592431342684229,116.09737843303738', '30');

-- ----------------------------
-- Table structure for mediapartner
-- ----------------------------
DROP TABLE IF EXISTS `mediapartner`;
CREATE TABLE `mediapartner`  (
  `id_media` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `kode_media` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `kode_satker_penjalin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
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
  INDEX `kode_satker`(`kode_media`) USING BTREE,
  INDEX `kode_satker_penjalin`(`kode_satker_penjalin`) USING BTREE,
  CONSTRAINT `mediapartner_ibfk_1` FOREIGN KEY (`kode_satker_penjalin`) REFERENCES `satker` (`kode_satker`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mediapartner
-- ----------------------------
INSERT INTO `mediapartner` VALUES (48, 'Tribun Lombok Edit', 'tribuneditlombok', 'MED-NTB-01', 'SAT-NTB-01', 'tribunedit@gmail.com', '0000-00-00 00:00:00', '', NULL, 'MED-NTB-01.jpeg', '2024-05-29 12:17:56', '2024-05-30 09:50:19', '081987654321', 'media_lokal');
INSERT INTO `mediapartner` VALUES (49, 'Radar Lombok', 'radarlombok', 'MED-NTB-02', 'SAT-NTB-01', 'radar@gmail.com', '0000-00-00 00:00:00', '', NULL, 'MED-NTB-02.jpg', '2024-05-29 12:17:56', '2024-05-30 10:53:07', '081987654321', 'media_nasional');
INSERT INTO `mediapartner` VALUES (51, 'Antara News', 'antarauser', 'MED-NTB-03', 'SAT-NTB-01', 'antara@gmail.com', NULL, NULL, NULL, 'MED-NTB-03.jpeg', '2024-05-30 09:20:28', '2024-05-30 10:54:19', '0987654', 'media_nasional');
INSERT INTO `mediapartner` VALUES (53, 'Detik', 'detikuser', 'MED-NTB-04', 'SAT-NTB-01', 'detik@gmail.com', NULL, NULL, NULL, 'MED-NTB-04.jpeg', '2024-05-30 15:34:05', NULL, '0987656789', 'media_lokal');
INSERT INTO `mediapartner` VALUES (55, 'Gerbang Indonesia', 'gerbanguser', 'MED-NTB-05', 'SAT-NTB-01', 'gerbang@gmail.com', NULL, NULL, NULL, 'MED-NTB-04.jpeg', '2024-05-30 15:34:05', NULL, '0987656789', 'media_lokal');
INSERT INTO `mediapartner` VALUES (57, 'Tes Media Baru', 'Tesmediabaruuser', 'MED-NTB-07', 'SAT-NTB-04', 'Tesmediabaruuser@gmail.com', NULL, NULL, NULL, 'MED-NTB-07.png', '2024-06-19 08:55:16', '2024-06-19 16:39:07', '0987654678', 'media_lokal');
INSERT INTO `mediapartner` VALUES (59, 'Tes Media Lagi', 'Tesmediabaruuser', 'MED-NTB-08', 'SAT-NTB-04', 'baru@gmail.com', NULL, NULL, NULL, 'MED-NTB-08.jpeg', '2024-06-19 08:55:16', '2024-06-24 09:27:59', '0987654678', 'media_lokal');
INSERT INTO `mediapartner` VALUES (60, 'Tes Media New', 'Tesmediabaruuser', 'MED-NTB-09', 'SAT-NTB-05', 'medianew@gmail.com', NULL, NULL, NULL, 'MED-NTB-08.jpeg', '2024-06-19 08:55:16', '2024-06-24 09:27:59', '0987654678', 'media_lokal');
INSERT INTO `mediapartner` VALUES (61, 'Media Kanwil II', 'mediakanwildua', 'MED-NTB-10', 'SAT-NTB-02', 'mediakanwilii@gmail.com', NULL, NULL, NULL, 'MED-NTB-08.jpeg', '2024-06-19 08:55:16', '2024-06-24 09:27:59', '0987654678', 'media_lokal');
INSERT INTO `mediapartner` VALUES (62, 'Media External Satker', 'qefoluqi', 'MED-NTB-011', 'SAT-NTB-04', 'tejulujaju@mailinator.com', NULL, NULL, NULL, NULL, '2024-06-27 14:50:01', NULL, 'Non dolore Nam quia', 'media_nasional');

-- ----------------------------
-- Table structure for pengajuan_izin
-- ----------------------------
DROP TABLE IF EXISTS `pengajuan_izin`;
CREATE TABLE `pengajuan_izin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nik` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tgl_izin` date NULL DEFAULT NULL,
  `status` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'i:izin s:sakit',
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status_approved` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '0:Pending 1:Disetujui 2:Ditolak',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengajuan_izin
-- ----------------------------
INSERT INTO `pengajuan_izin` VALUES (4, '12345', '2024-01-24', 'i', 'Jenguk Saudara Sakit', '0');
INSERT INTO `pengajuan_izin` VALUES (5, '12345', '2024-01-24', 's', 'Sakit Tipes', '0');
INSERT INTO `pengajuan_izin` VALUES (6, '12345', '2024-01-24', 'i', 'Mau pulkam', '0');
INSERT INTO `pengajuan_izin` VALUES (7, '12346', '2024-02-14', 'i', 'Ke acara nikahan saudara', '1');
INSERT INTO `pengajuan_izin` VALUES (8, '12346', '2024-02-13', 's', 'Batuk', '2');

-- ----------------------------
-- Table structure for presensi
-- ----------------------------
DROP TABLE IF EXISTS `presensi`;
CREATE TABLE `presensi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nik` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tgl_presensi` date NULL DEFAULT NULL,
  `jam_in` time(0) NULL DEFAULT NULL,
  `jam_out` time(0) NULL DEFAULT NULL,
  `foto_in` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `foto_out` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lokasi_in` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lokasi_out` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of presensi
-- ----------------------------
INSERT INTO `presensi` VALUES (31, '12345', '2024-01-01', '06:17:06', '16:19:33', '12345-2024-01-15-in.png', '12345-2024-01-15-out.png', '-8.5924306 , 116.0973842', '-8.5924351 , 116.0973728');
INSERT INTO `presensi` VALUES (32, '12346', '2024-01-23', '06:46:02', '08:47:29', '12345-2024-01-16-in.png', '12345-2024-01-16-out.png', '-8.5924733 , 116.0974212', '-8.5924723 , 116.0974207');
INSERT INTO `presensi` VALUES (33, '12346', '2024-01-24', '12:07:23', '00:00:00', '12346-2024-01-16-in.png', NULL, '-8.5924798 , 116.0974125', NULL);
INSERT INTO `presensi` VALUES (34, '12345', '2024-01-24', '11:14:50', '11:34:21', '12345-2024-01-18-in.png', '12345-2024-01-18-out.png', '-8.5919604 , 116.0977311', '-8.5919663 , 116.0977163');
INSERT INTO `presensi` VALUES (35, '12345', '2024-01-24', '09:00:15', '09:01:07', '12345-2024-01-19-in.png', '12345-2024-01-19-out.png', '-8.592475 , 116.0974291', '-8.592471 , 116.0974225');
INSERT INTO `presensi` VALUES (36, '12345', '2024-01-24', '05:06:29', '00:00:00', '12345-2024-01-20-in.png', NULL, '-8.5652286 , 116.1421924', NULL);
INSERT INTO `presensi` VALUES (38, '12345', '2024-02-01', '07:57:50', NULL, '12345-2024-02-01-in.png', NULL, '-8.5924275 , 116.0973809', NULL);
INSERT INTO `presensi` VALUES (39, '12346', '2024-02-01', '10:02:19', NULL, '12346-2024-02-01-in.png', NULL, '-8.5924344 , 116.0974011', NULL);
INSERT INTO `presensi` VALUES (40, '12347', '2024-02-01', '10:05:35', '10:16:17', '12347-2024-02-01-in.png', '12347-2024-02-01-out.png', '-8.5924283 , 116.0973802', '-8.5924343 , 116.097398');
INSERT INTO `presensi` VALUES (41, '12345', '2024-02-05', '15:49:18', '16:56:20', '12345-2024-02-05-in.png', '12345-2024-02-05-out.png', '-8.5924293 , 116.0973902', '-8.5924284 , 116.0973883');
INSERT INTO `presensi` VALUES (42, '12346', '2024-02-05', '16:56:51', '16:57:11', '12346-2024-02-05-in.png', '12346-2024-02-05-out.png', '-8.5924239 , 116.0973803', '-8.5924286 , 116.0973835');
INSERT INTO `presensi` VALUES (43, '12346', '2024-02-07', '07:48:52', '16:09:33', '12346-2024-02-07-in.png', '12346-2024-02-07-out.png', '-8.5924405 , 116.097383', '-8.5924341 , 116.0973995');
INSERT INTO `presensi` VALUES (44, '12345', '2024-02-13', '08:31:23', NULL, '12345-2024-02-13-in.png', NULL, '-8.5924573 , 116.0974343', NULL);
INSERT INTO `presensi` VALUES (45, '12346', '2024-02-15', '07:46:34', NULL, '12346-2024-02-15-in.png', NULL, '-8.5924242 , 116.0973819', NULL);
INSERT INTO `presensi` VALUES (46, '12346', '2024-02-19', '07:59:59', '16:41:54', '12346-2024-02-19-in.png', '12346-2024-02-19-out.png', '-8.592434 , 116.0973814', '-8.5924373 , 116.0973853');
INSERT INTO `presensi` VALUES (47, '12346', '2024-02-20', '07:35:55', NULL, '12346-2024-02-20-in.png', NULL, '-8.592431 , 116.0973746', NULL);
INSERT INTO `presensi` VALUES (49, '12345', '2024-02-20', '14:30:48', NULL, '12345-2024-02-20-in.png', NULL, '-8.5924347 , 116.0973826', NULL);
INSERT INTO `presensi` VALUES (50, '1991', '2024-02-20', '14:36:03', NULL, '1991-2024-02-20-in.png', NULL, '-8.5924303 , 116.0973789', NULL);

-- ----------------------------
-- Table structure for satker
-- ----------------------------
DROP TABLE IF EXISTS `satker`;
CREATE TABLE `satker`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `kode_satker` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `no_hp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `roles` enum('humas_kanwil','humas_satker','superadmin') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `konfigurasi_berita` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `konfigurasi_rekap` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `foto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  INDEX `kode_satker`(`kode_satker`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of satker
-- ----------------------------
INSERT INTO `satker` VALUES (1, 'KANWIL NTB', 'kanwilntb', 'SAT-NTB-01', 'adamsedit@gmail.com', '2024-01-23 08:05:54', '$2y$10$UWhkjSwgVbUN3X3m3ogchOlZskqyGy.5qw8glDH/XNUBcpkGIUnoe', NULL, '2024-02-23 15:56:48', '2024-03-15 00:00:00', '12345678', 'humas_kanwil', NULL, NULL, 'SAT-NTB-01.jpeg');
INSERT INTO `satker` VALUES (3, 'KAKA SLANK', 'kaka', 'SAT-NTB-02', 'kaka@gmail.com', '2024-01-23 08:05:54', '$2y$10$UWhkjSwgVbUN3X3m3ogchOlZskqyGy.5qw8glDH/XNUBcpkGIUnoe', NULL, '2024-02-23 15:56:48', '2024-04-19 00:00:00', '12345678', 'humas_kanwil', NULL, NULL, 'SAT-NTB-02.jpeg');
INSERT INTO `satker` VALUES (4, 'ADMIN SLANK', 'admin', 'SAT-NTB-03', 'admin@gmail.com', '2024-01-23 08:05:54', '$2y$10$6vTLfD86FJWXAYRQ8IfWQurW0Soct35cGkecNbfl85IfUcQb/bjcq', NULL, '2024-02-23 15:56:48', '2024-06-21 00:00:00', '12345678', 'superadmin', NULL, NULL, 'SAT-NTB-03.png');
INSERT INTO `satker` VALUES (21, 'LAPAS KLAS IIA MATARAM', 'Lapas Mataram', 'SAT-NTB-04', 'lapasmataram@gmail.com', '2024-01-23 08:05:54', '$2y$10$UWhkjSwgVbUN3X3m3ogchOlZskqyGy.5qw8glDH/XNUBcpkGIUnoe', NULL, '2024-02-23 15:56:48', '2024-04-19 00:00:00', '12345', 'humas_satker', NULL, NULL, 'SAT-NTB-04.jpg');
INSERT INTO `satker` VALUES (22, 'LAPAS KLAS IIA SUMBAWA BESAR', NULL, 'SAT-NTB-05', 'lapassumbawa@gmail.com', '2024-01-23 08:05:54', '$2y$10$UWhkjSwgVbUN3X3m3ogchOlZskqyGy.5qw8glDH/XNUBcpkGIUnoe', NULL, '2024-02-23 15:56:48', '2024-04-19 00:00:00', '12345', 'humas_satker', NULL, NULL, 'SAT-NTB-05.jpeg');
INSERT INTO `satker` VALUES (23, 'LAPAS KLAS IIB DOMPU', NULL, 'SAT-NTB-06', 'lapasdompu@gmail.com', '2024-01-23 08:05:54', '$2y$10$UWhkjSwgVbUN3X3m3ogchOlZskqyGy.5qw8glDH/XNUBcpkGIUnoe', NULL, '2024-02-23 15:56:48', '2024-02-23 15:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (24, 'LAPAS KLAS IIB SELONG', NULL, 'SAT-NTB-07', 'lapasselong@gmail.com', '2024-01-23 08:05:54', '$2y$10$UWhkjSwgVbUN3X3m3ogchOlZskqyGy.5qw8glDH/XNUBcpkGIUnoe', NULL, '2024-02-23 15:56:48', '2024-02-23 15:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (25, 'LAPAS TERBUKA KLAS IIB LOMBOK TENGAH', NULL, 'SAT-NTB-08', 'lapasterbuka@gmail.com', '2024-01-23 08:05:54', '$2y$10$UWhkjSwgVbUN3X3m3ogchOlZskqyGy.5qw8glDH/XNUBcpkGIUnoe', NULL, '2024-02-23 15:56:48', '2024-02-23 15:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (26, 'LPKA KLAS II LOMBOK TENGAH', NULL, 'SAT-NTB-09', 'lpka@gmail.com', '2024-01-23 08:05:54', '$2y$10$UWhkjSwgVbUN3X3m3ogchOlZskqyGy.5qw8glDH/XNUBcpkGIUnoe', NULL, '2024-02-23 15:56:48', '2024-02-23 15:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (27, 'LPP KLAS III MATARAM', NULL, 'SAT-NTB-010', 'lppmataram@gmail.com', '2024-01-23 08:05:54', '$2y$10$UWhkjSwgVbUN3X3m3ogchOlZskqyGy.5qw8glDH/XNUBcpkGIUnoe', NULL, '2024-02-23 15:56:48', '2024-02-23 15:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (28, 'RUTAN KLAS IIB PRAYA', NULL, 'SAT-NTB-011', 'rutanpraya@gmail.com', '2024-01-23 08:05:54', '$2y$10$UWhkjSwgVbUN3X3m3ogchOlZskqyGy.5qw8glDH/XNUBcpkGIUnoe', NULL, '2024-02-23 15:56:48', '2024-03-15 00:00:00', '12345', 'humas_satker', NULL, NULL, 'SAT-NTB-011.jpeg');
INSERT INTO `satker` VALUES (29, 'RUTAN KLAS IIB RABA BIMA', NULL, 'SAT-NTB-012', 'rutanbima@gmail.com', '2024-01-23 08:05:54', '$2y$10$UWhkjSwgVbUN3X3m3ogchOlZskqyGy.5qw8glDH/XNUBcpkGIUnoe', NULL, '2024-02-23 15:56:48', '2024-02-23 15:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (30, 'BAPAS KLAS II MATARAM', NULL, 'SAT-NTB-013', 'bapasmataram@gmail.com', '2024-01-23 08:05:54', '$2y$10$UWhkjSwgVbUN3X3m3ogchOlZskqyGy.5qw8glDH/XNUBcpkGIUnoe', NULL, '2024-02-23 15:56:48', '2024-02-23 15:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (31, 'BAPAS KLAS II SUMBAWA BESAR', NULL, 'SAT-NTB-014', 'bapassumbawa@gmail.com', '2024-01-23 08:05:54', '$2y$10$UWhkjSwgVbUN3X3m3ogchOlZskqyGy.5qw8glDH/XNUBcpkGIUnoe', NULL, '2024-02-23 15:56:48', '2024-02-23 15:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (32, 'RUPBASAN KLAS I MATARAM', NULL, 'SAT-NTB-015', 'rupbasanmataram@gmail.com', '2024-01-23 08:05:54', '$2y$10$UWhkjSwgVbUN3X3m3ogchOlZskqyGy.5qw8glDH/XNUBcpkGIUnoe', NULL, '2024-02-23 15:56:48', '2024-02-23 15:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (33, 'RUPBASAN KLAS II SUMBAWA BESAR', NULL, 'SAT-NTB-016', 'rupbasansumbawa@gmail.com', '2024-01-23 08:05:54', '$2y$10$UWhkjSwgVbUN3X3m3ogchOlZskqyGy.5qw8glDH/XNUBcpkGIUnoe', NULL, '2024-02-23 15:56:48', '2024-02-23 15:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (34, 'KANIM KLAS I TPI MATARAM', NULL, 'SAT-NTB-017', 'kanimmataram@gmail.com', '2024-01-23 08:05:54', '$2y$10$UWhkjSwgVbUN3X3m3ogchOlZskqyGy.5qw8glDH/XNUBcpkGIUnoe', NULL, '2024-02-23 15:56:48', '2024-02-23 15:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (35, 'KANIM KLAS II TPI SUMBAWA BESAR', NULL, 'SAT-NTB-018', 'kanimsumbawa@gmail.com', '2024-01-23 08:05:54', '$2y$10$UWhkjSwgVbUN3X3m3ogchOlZskqyGy.5qw8glDH/XNUBcpkGIUnoe', NULL, '2024-02-23 15:56:48', '2024-02-23 15:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (37, 'KANIM KLAS III NON TPI BIMA', NULL, 'SAT-NTB-019', 'kanimbima@gmail.com', '2024-01-23 08:05:54', '$2y$10$UWhkjSwgVbUN3X3m3ogchOlZskqyGy.5qw8glDH/XNUBcpkGIUnoe', NULL, '2024-02-23 15:56:48', '2024-02-23 15:56:48', '12345', 'humas_satker', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Adam NBC', 'adams@gmail.com', '2024-01-23 08:05:54', '$2y$10$V.Es3WiUs2U1xnlnOmw/lOoisLQMbRvBYTZa6eqCMKM65sznly3S.', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
