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

 Date: 04/12/2024 07:47:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for berita
-- ----------------------------
DROP TABLE IF EXISTS `berita`;
CREATE TABLE `berita`  (
  `id_berita` int(11) NOT NULL AUTO_INCREMENT,
  `nama_berita` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kode_divisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kode_satker` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `facebook` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 1056 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of berita
-- ----------------------------
INSERT INTO `berita` VALUES (1053, 'Berita Umum 1', 'berita_umum', 'SAT-NTB-01', 'facebookumum.com', 'websiteumum.com', 'instagramumum.com', 'twitterumum.com', 'tiktokumum.com', 'sippnumum.com', 'youtubeumum.com', '[\"MED-NTB-02|||Judul Umum Medlok 1|||Link Umum Medlok 1\"]', '[\"no media|||Judul Umum Mednas 1|||Link Umum Mednas 1\"]', '2024-11-29', '2024-11-29');
INSERT INTO `berita` VALUES (1054, 'Divmin Berita 1', 'DIV-NTB-01', 'SAT-NTB-01', 'facebookdivmin.com', 'websitedivmin.com', 'instagramdivmin.com', 'twitterdivmin.com', 'tiktokdivmin.com', 'sippndivmin.com', 'youtubedivmin.com', '[\"MED-NTB-01|||Judul Medlok Divmin 1|||Link Medlok Divmin 1\"]', '[\"no media|||Judul Mednas Divmin 1|||Link Mednas Divmin 1\"]', '2024-11-29', NULL);
INSERT INTO `berita` VALUES (1055, 'Insert Berita Divyankum 1 Broo', 'DIV-NTB-04', 'SAT-NTB-01', 'facebookdivyankum.com', 'websitedivyankum.com', 'instagramdivyankum.com', 'twitterdivyankum.com', 'tiktokdivyankum.com', 'sippndivyankum.com', 'youtubedivyankum.com', '[\"MED-NTB-01|||judul lokal divyankum 1|||Link Medlok Divyankum 1\",\"MED-NTB-02|||judul lokal divyankum 2|||Link Medlok Divyankum 2\"]', '[\"no media|||judul Nasional divyankum 1|||Link Mednas Divyankum 1\"]', '2024-11-29', NULL);

-- ----------------------------
-- Table structure for berita_divisi
-- ----------------------------
DROP TABLE IF EXISTS `berita_divisi`;
CREATE TABLE `berita_divisi`  (
  `id_berita` int(11) NOT NULL AUTO_INCREMENT,
  `nama_berita` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kode_satker` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `facebook` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 1044 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of berita_divisi
-- ----------------------------
INSERT INTO `berita_divisi` VALUES (1011, 'Tumbuhkan Semangat Kedisplinan dan Kekompakan Pegawai, Lapas Lombok Barat Gelar FMD', 'SAT-NTB-01', 'https://web.facebook.com/LapasIIALombokBarat/posts/pfbid0FVFBAP1gPhGoGvQCi7hZn3WnVcZcrjvr6HYt6dra6ZkANdE5ZU1uZSzVGCY4nVpUl?_rdc=1&_rdr', 'https://lapaslombokbarat.kemenkumham.go.id/berita-utama/tumbuhkan-semangat-kedisplinan-dan-kekompakan-pegawai-lapas-lombok-barat-gelar-fmd', 'https://www.instagram.com/p/C_aJyvAvOUq/', 'https://x.com/lapas_lobar/status/1830529764551221703', '-', '-', '-', '[]', '[]', '2024-10-25', '2024-09-02');
INSERT INTO `berita_divisi` VALUES (1012, 'Dukung KTT Indonesia Afrika (IAF) 2024, Menkumham Supratman Tinjau Layanan Imigrasi Di Bandara Ngurah Rai', 'SAT-NTB-01', 'https://web.facebook.com/share/p/GBr9VFjTkZvPGRXF/', 'https://lapaslombokbarat.kemenkumham.go.id/berita-utama/dukung-ktt-indonesia-afrika-iaf-2024-menkumham-supratman-tinjau-layanan-imigrasi-di-bandara-ngurah-rai', 'https://www.instagram.com/p/C_aTcp4vqsx/', 'https://x.com/lapas_lobar/status/1830549947223318726', '-', '-', '-', '[]', '[]', '2024-10-25', '2024-09-02');
INSERT INTO `berita_divisi` VALUES (1043, 'Proident id neque n', 'SAT-NTB-01', 'Commodi ea aliquip u', 'https://www.kywykul.mobi', 'Totam repellendus S', 'Voluptate sit a con', 'Dolorem dignissimos', 'Maiores iusto ea rei', 'Quis vero nobis nost', '[\"no media|||Quaerat deserunt duc|||Link1\"]', '[\"no media|||-|||-\"]', '2024-10-25', NULL);

-- ----------------------------
-- Table structure for cabang
-- ----------------------------
DROP TABLE IF EXISTS `cabang`;
CREATE TABLE `cabang`  (
  `kode_cabang` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_cabang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lokasi_cabang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `radius_cabang` int(11) NOT NULL,
  PRIMARY KEY (`kode_cabang`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for divisi
-- ----------------------------
DROP TABLE IF EXISTS `divisi`;
CREATE TABLE `divisi`  (
  `id_divisi` int(255) NOT NULL AUTO_INCREMENT,
  `kode_divisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_divisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_divisi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of divisi
-- ----------------------------
INSERT INTO `divisi` VALUES (1, 'DIV-NTB-01', 'Divisi Administrasi');
INSERT INTO `divisi` VALUES (2, 'DIV-NTB-02', 'Divisi Pemasyarakatan');
INSERT INTO `divisi` VALUES (3, 'DIV-NTB-03', 'Divisi Keimigrasian');
INSERT INTO `divisi` VALUES (4, 'DIV-NTB-04', 'Divisi Pelayanan Hukum');

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
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of konfigurasi_berita
-- ----------------------------
INSERT INTO `konfigurasi_berita` VALUES (64, 'Tes Konfig 1', 'SAT-NTB-01', 'Assalamualaikum Wr. Wb.', 'Yth. BAPAK SEKJEN KEMENKUMHAM.', '[\"BAPAK MENTERI HUKUM DAN HAM\",\"BAPAK IRJEN KEMENKUMHAM\",\"BAPAK DIRJEN IMIGRASI\",\"BAPAK PLT DIRJEN PEMASYARAKATAN\",\"IBU DIRJEN KEKAYAAN INTELEKTUAL\",\"BAPAK DIRJEN ADMINISTRASI HUKUM UMUM\",\"BAPAK KEPALA BADAN PEMBINAAN HUKUM NASIONAL\"]', 'KAKANWIL KEMENKUMHAM NTB.', 'Bersama ini kami laporkan terkait rilis publikasi', '[\"#Parlindungan\",\"#Juare\",\"#KamiPasti\"]', 'Kumham NTB Pasti Juare', '[\"Juare, Unggul, Amanah, Ramah, Excellent\"]', 'Matur Tampiasih', 'Terima Kasih, Wassalamualaikum', 'Konfigurasi Berita', '2024-04-25', '2024-08-01', NULL, NULL);
INSERT INTO `konfigurasi_berita` VALUES (65, 'Tes Konfig Rekap 1', 'SAT-NTB-01', 'Assalamualaikum Wr. Wb.', 'Yth. BAPAK SEKJEN KEMENKUMHAM.', '[\"BAPAK MENTERI HUKUM DAN HAM\",\"BAPAK IRJEN KEMENKUMHAM\",\"BAPAK DIRJEN IMIGRASI\",\"BAPAK PLT DIRJEN PEMASYARAKATAN\",\"BAPAK KEPALA BADAN PEMBINAAN HUKUM NASIONAL\",\"IBU DIRJEN KEKAYAAN INTELEKTUAL\"]', 'KAKANWIL KEMENKUMHAM NTB.', 'Bersama ini kami laporkan kepada BAPAK SEKJEN KEMENKUMHAM hasil rilis dan publikasi Media giat KANWIL KEMENKUMHAM NTB', NULL, NULL, NULL, NULL, 'Terimakasih, Wassalamualaikum Wr. Wb.', 'Konfigurasi Rekap', '2024-04-25', '2024-05-15', 'Kakanwil Kemenkumham NTB', 'PARLINDUNGAN');
INSERT INTO `konfigurasi_berita` VALUES (68, 'LAPAS KELAS IIA SUMBAWA BESAR', 'SAT-NTB-05', 'Assalamu\'alaikum Wr. Wb.', 'Yth. Kepala Kantor Wilayah Kementerian Hukum dan HAM NTB', '[\"KADIVPAS NTB\"]', 'Kepala Lembaga Pemasyarakatan Kelas IIA Sumbawa Besar', 'Bersama ini dilaporkan kepada Kepala Kantor Wilayah Kemenkumham NTB terkait hasil rilis dan publikasi giat  Lembaga Pemasyarakatan Kelas IIA Sumbawa Besar', '[\"#Parlindungan\",\"#KumhamPasti\",\"#KanwilKemenkumhamNTB\",\"#Purniawal\",\"#LapasSumbawaBesar\"]', 'Kumham NTB PASTI JUARE', '[\"Dukung Tim Humas Lapas Sumbawa Besar dalam menyampaikan informasi kepada masyarakat luas dengan Like, Komentar, dan Bagikan\"]', 'Matur Tampiasih', 'Terima kasih, Wassalamu\'alaikum Wr. Wb.', 'Konfigurasi Berita', '2024-04-29', '2024-08-01', NULL, NULL);
INSERT INTO `konfigurasi_berita` VALUES (69, 'Rekap Berita Lapas Lobar', 'SAT-NTB-04', '_Assalamu\'alaikum Wr. Wb._', '*Yth. Bapak Kepala Kantor Wilayah Kementerian Hukum dan HAM NTB*', '[\"*KADIVPAS NTB (PEMASYARAKATAN)*\"]', 'Kepala Lembaga Pemasyarakatan Kelas IIA Lombok Barat', 'Bersama ini dilaporkan kepada Bapak KAKANWIL terkait hasil rilis dan publikasi giat Lembaga Pemasyarakatan Kelas IIA Lombok Barat', '[\"#Parlindungan\",\"#KumhamPasti\",\"#KemenkumhamNTB\",\"#KanwilKemenkumhamNTB\",\"#KumhamNTBPastiJuare\"]', 'Kumham NTB Pasti JUARE', '[\"Jujur\",\"Unggul\",\"Amanah\",\"Ramah\",\"Exellent\"]', 'Matur Tampiasih', 'Terima kasih, Wassalamu\'alaikum Wr. Wb.', 'Konfigurasi Berita', '2024-07-30', '2024-07-30', NULL, NULL);
INSERT INTO `konfigurasi_berita` VALUES (70, 'Konfigurasi Berita', 'SAT-NTB-09', 'Assalamualaikum Wr. Wb.', 'Yth. Kepala Kantor Wilayah Kementerian Hukum dan HAM NTB', '[\"Kepala Divisi Pemasyarakatan Kantor Wilayah Nusa Tenggara Barat\"]', 'Plt. Kepala LPKA Kelas II Lombok Tengah', 'Bersama ini dilaporkan kepada Kepala Kantor Wilayah Kementerian Hukum dan HAM NTB terkait  hasil rilis dan publikasi giat LPKA Kelas II Lombok Tengah', '[\"#KumhamNTB\",\"#KemenkumhamNTB\",\"#Parlindungan\",\"#KanwilKemenkumhamNTB\",\"#LPKALoteng\"]', 'PASTI RAMAH', '[\"Religius, Amanah, Madani, Aman, dan Humanis\"]', 'Matur Tampiasih', 'Terima Kasih. Wassalamu\'alaikum Wr. Wb.', 'Konfigurasi Berita', '2024-07-31', '2024-07-31', NULL, NULL);
INSERT INTO `konfigurasi_berita` VALUES (71, 'Konfigurasi Berita 1', 'SAT-NTB-012', 'Assalamu\'alaikum Warahmatullahi Wabarakatuh', 'Yth. Bapak Kepala Kantor Wilayah Kementerian Hukum dan HAM NTB', '[\"Ka. Divpas Kanwil Kemenkumham NTB\"]', 'Kepala Rutan Kelas IIB Raba Bima', 'Bersama ini dilaporkan kepada Bapak KAKANWIL terkait  hasil rilis dan publikasi giat Rutan Kelas IIB Raba Bima', '[\"#Parlindungan\",\"#KumhamPasti\",\"#kemenkumhamRI\",\"#KemenkumhamNTB\",\"#KanwilKemenkumhamNTB\",\"#KumhamNtbPastiJuara\",\"#RutanBima\",\"#RutanBimaPastiMaju\"]', 'Kumham NTB Pasti JUARE', '[\"Jujur, Unggul, Amanah, Ramah, Excellent\"]', 'Terima Kasih', 'Wassalamu\'alaikum Warahmatullahi Wabarakatuh', 'Konfigurasi Berita', '2024-08-01', '2024-08-06', NULL, NULL);
INSERT INTO `konfigurasi_berita` VALUES (72, 'Konfigurasi berita 1', 'SAT-NTB-010', 'Assalamualaikum Wr. Wb.', 'Yth.KAKANWIL KEMENKUMHAM NTB.', '[\"Kepala Divisi Pemasyarakatan Kanwil Kemenkumham NTB\"]', 'Dari Kepala Lapas Perempuan Kelas III Mataram', 'Bersama ini kami laporkan kepada BAPAK KAKANWIL KEMENKUMHAM NTB.', '[\"#KumhamNTB  #KemenkumhamNTB  #Parlindungan  #KanwilKemenkumhamNTB  Kanwil Kemenkumham NTB  Parlindungan  @KumhamNTB\"]', 'LPP PASTI BISA', '[\"Terimakasih\"]', ',', 'Wassalamualaikum Wr. Wb.', 'Konfigurasi Berita', '2024-08-08', '2024-08-08', NULL, NULL);
INSERT INTO `konfigurasi_berita` VALUES (73, 'Konfigurasi 1', 'SAT-NTB-08', 'Assalamu\'alaikum Wr. Wb.', 'Yth. Bapak Kepala Kantor Wilayah Kementerian Hukum dan HAM NTB', '[\"KADIVPAS Kanwil Kemenkumham NTB\"]', 'Kepala Lapas Terbuka Lombok Tengah', 'Bersama ini dilaporkan kepada Bapak KAKANWIL terkait hasil rilis dan publikasi giat Lapas Terbuka Lombok Tengah', '[\"#KumhamNTB #KemenkumhamNTB #Parlindungan #KanwilKemenkumhamNTB #KumhamPASTI #KemenkumhamRI #Kemenkumham\"]', 'Kumham NTB Pasti JUARE', '[\"(Jujur Unggul Amanah Ramah Excellent)\"]', 'Matur Tampiasih', 'Terima kasih, Wassalamu\'alaikum Wr. Wb', 'Konfigurasi Berita', '2024-08-20', '2024-08-20', NULL, NULL);

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
-- Table structure for konfigurasi_lokasi
-- ----------------------------
DROP TABLE IF EXISTS `konfigurasi_lokasi`;
CREATE TABLE `konfigurasi_lokasi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lokasi_kantor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `radius` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mediapartner
-- ----------------------------
INSERT INTO `mediapartner` VALUES (57, 'Tribun Lombok', 'Tribunuser', 'MED-NTB-01', 'SAT-NTB-01', 'felatikarramadani@gmail.com', NULL, NULL, NULL, 'MED-NTB-01.jpeg', '2024-06-06 14:54:37', NULL, '087851255806', 'media_lokal');
INSERT INTO `mediapartner` VALUES (58, 'Radar Lombok', 'Radaruser', 'MED-NTB-02', 'SAT-NTB-01', 'radar@gmail.com', NULL, NULL, NULL, 'MED-NTB-02.jpeg', '2024-06-06 15:02:10', NULL, '0987654321', 'media_lokal');
INSERT INTO `mediapartner` VALUES (59, 'Suara NTB', 'Suarauser', 'MED-NTB-03', 'SAT-NTB-01', '1234@com', NULL, NULL, NULL, NULL, '2024-06-11 14:41:08', NULL, '-', 'media_lokal');
INSERT INTO `mediapartner` VALUES (60, 'Lombok Post', 'Lombokpostuser', 'MED-NTB-04', 'SAT-NTB-01', '1234@yahoo.com', NULL, NULL, NULL, NULL, '2024-06-11 14:41:59', NULL, '-', 'media_lokal');
INSERT INTO `mediapartner` VALUES (61, 'Antaranews', 'Antarauser', 'MED-NTB-05', 'SAT-NTB-01', 'antara123@yahoo.com', NULL, NULL, NULL, 'MED-NTB-05.png', '2024-06-11 15:26:56', '2024-06-11 15:42:08', '0987654321', 'media_lokal');
INSERT INTO `mediapartner` VALUES (62, 'Gerbang Indonesia', 'Gerbanguser', 'MED-NTB-06', 'SAT-NTB-01', 'gerbang23@com', NULL, NULL, NULL, NULL, '2024-06-11 15:29:15', NULL, '-', 'media_lokal');
INSERT INTO `mediapartner` VALUES (63, 'Radar Mandalika', 'Radarmandalikauser', 'MED-NTB-07', 'SAT-NTB-01', 'Radar123@yahoo.com', NULL, NULL, NULL, NULL, '2024-06-11 15:29:57', NULL, '-', 'media_lokal');
INSERT INTO `mediapartner` VALUES (64, 'RRI', 'rriuser', 'MED-NTB-08', 'SAT-NTB-01', 'RRI123@yahoo.com', NULL, NULL, NULL, NULL, '2024-06-11 15:30:33', NULL, '-', 'media_lokal');
INSERT INTO `mediapartner` VALUES (65, 'INews', 'inewsuser', 'MED-NTB-09', 'SAT-NTB-01', 'inews123@yahoo.co.id', NULL, NULL, NULL, NULL, '2024-06-11 15:31:08', '2024-06-11 15:34:03', '-', 'media_lokal');
INSERT INTO `mediapartner` VALUES (66, 'GrafikaNews', 'Grafikauser', 'MED-NTB-010', 'SAT-NTB-01', 'Grafika123@gmail.com', NULL, NULL, NULL, NULL, '2024-06-11 15:33:40', NULL, '-', 'media_lokal');
INSERT INTO `mediapartner` VALUES (67, 'Nawacita', 'nawacitauser', 'MED-NTB-011', 'SAT-NTB-01', 'nawacita123@gmail.com', NULL, NULL, NULL, NULL, '2024-06-11 15:36:58', '2024-07-10 15:49:10', '-', 'media_lokal');
INSERT INTO `mediapartner` VALUES (71, 'Kilas NTB', 'Sofiana Mufidah', 'MED-NTB-012', 'SAT-NTB-04', 'kilasntb@yahoo.com', NULL, NULL, NULL, 'MED-NTB-012.png', '2024-07-30 11:58:07', NULL, '085333254743', 'media_lokal');
INSERT INTO `mediapartner` VALUES (72, 'TopikTerkini.com', 'Saeful', 'MED-NTB-013', 'SAT-NTB-04', 'topikterkini.com@gmail.com', NULL, NULL, NULL, 'MED-NTB-013.png', '2024-07-30 12:02:15', NULL, '082195399699', 'media_lokal');
INSERT INTO `mediapartner` VALUES (73, 'Lensa Kriminal', 'Orik', 'MED-NTB-014', 'SAT-NTB-04', '-@gmail.com', NULL, NULL, NULL, 'MED-NTB-014.jpg', '2024-07-30 12:09:23', NULL, '6287750170205', 'media_lokal');
INSERT INTO `mediapartner` VALUES (74, 'Jurnalfokus.com', 'Awaludin', 'MED-NTB-015', 'SAT-NTB-04', 'jurnalfokus@gmail.com', NULL, NULL, NULL, 'MED-NTB-015.webp', '2024-07-30 14:20:29', NULL, '087777392840', 'media_lokal');
INSERT INTO `mediapartner` VALUES (75, 'Warta Bumigora', 'L Muhazzam', 'MED-NTB-016', 'SAT-NTB-04', 'redaksiwartabumigora@gmail.com', NULL, NULL, NULL, 'MED-NTB-016.png', '2024-07-30 15:39:30', NULL, '+6282341215652', 'media_lokal');
INSERT INTO `mediapartner` VALUES (76, 'Detik.com', 'vicky', 'MED-NTB-017', 'SAT-NTB-04', 'detik.vicky@gmail.com', NULL, NULL, NULL, 'MED-NTB-017.jpg', '2024-07-31 15:06:49', NULL, '+62 852-7495-5335', 'media_nasional');
INSERT INTO `mediapartner` VALUES (77, 'antaranews.com', 'dimas', 'MED-NTB-018', 'SAT-NTB-04', 'dimas.antara@gmail.com', NULL, NULL, NULL, 'MED-NTB-018.png', '2024-07-31 15:07:27', NULL, '+62 819-0733-3816', 'media_nasional');
INSERT INTO `mediapartner` VALUES (78, 'NTBsatu.com', 'Khan', 'MED-NTB-019', 'SAT-NTB-04', 'khan.ntbsatu@gmail.com', NULL, NULL, NULL, 'MED-NTB-019.png', '2024-07-31 15:08:10', NULL, '+62 823-5911-2828', 'media_lokal');
INSERT INTO `mediapartner` VALUES (79, 'rri.co.id', 'Ryan', 'MED-NTB-020', 'SAT-NTB-04', 'rrilombok@gmail.com', NULL, NULL, NULL, 'MED-NTB-020.png', '2024-07-31 15:11:43', NULL, '+62 819-3315-1796', 'media_nasional');
INSERT INTO `mediapartner` VALUES (80, 'Indonesiasatu.co.id', 'hadi', 'MED-NTB-021', 'SAT-NTB-04', 'hadi.indonesiasatu@gmail.com', NULL, NULL, NULL, 'MED-NTB-021.png', '2024-07-31 15:14:38', NULL, '62 859-0373-5829', 'media_lokal');
INSERT INTO `mediapartner` VALUES (81, 'PostkotaNtb', 'Safrin', 'MED-NTB-022', 'SAT-NTB-04', 'safrinpostkota@gmail.com', NULL, NULL, NULL, 'MED-NTB-022.png', '2024-07-31 15:28:03', NULL, '+62 878-6108-3144', 'media_lokal');
INSERT INTO `mediapartner` VALUES (82, 'radarlombok.co.id', 'Rosyid', 'MED-NTB-023', 'SAT-NTB-04', 'radarlombok@gmail.com', NULL, NULL, NULL, 'MED-NTB-023.png', '2024-07-31 15:32:46', NULL, '+62 817-0338-7350', 'media_lokal');
INSERT INTO `mediapartner` VALUES (83, 'Indonesia Satu', 'IndonesiaSatu', 'MED-NTB-024', 'SAT-NTB-011', 'IndonesiaSatu@gmail.com', NULL, NULL, NULL, NULL, '2024-08-01 14:34:44', NULL, '08123456789', 'media_lokal');
INSERT INTO `mediapartner` VALUES (84, '24jam', '24jam', 'MED-NTB-025', 'SAT-NTB-011', '24jam@gmail.com', NULL, NULL, NULL, NULL, '2024-08-01 14:36:07', NULL, '0819123456789', 'media_lokal');
INSERT INTO `mediapartner` VALUES (85, 'Jendela Indonesia', 'JendelaIndonesia', 'MED-NTB-026', 'SAT-NTB-011', 'JendelaIndonesia@gmail.com', NULL, NULL, NULL, NULL, '2024-08-01 14:37:25', NULL, '089123456789', 'media_lokal');
INSERT INTO `mediapartner` VALUES (86, 'Klik Indonesia', 'KlikIndonesia', 'MED-NTB-027', 'SAT-NTB-011', 'KlikIndonesia@gmail.com', NULL, NULL, NULL, NULL, '2024-08-01 14:38:42', NULL, '0819728134567', 'media_lokal');
INSERT INTO `mediapartner` VALUES (87, 'Lombok Tengah News', 'LombokTengahNews', 'MED-NTB-028', 'SAT-NTB-011', 'LombokTengahNews@gmail.com', NULL, NULL, NULL, NULL, '2024-08-01 14:39:32', NULL, '081123456789', 'media_lokal');
INSERT INTO `mediapartner` VALUES (88, 'Lombok Tengah Warta', 'LombokTengahWarta', 'MED-NTB-029', 'SAT-NTB-011', 'LombokTengahWarta@gmail.com', NULL, NULL, NULL, NULL, '2024-08-01 14:40:07', NULL, '081234511789', 'media_lokal');
INSERT INTO `mediapartner` VALUES (89, 'Indonesia Satu Nasional', 'IndonesiaSatuNasional', 'MED-NTB-030', 'SAT-NTB-011', 'IndonesiaSatuNasional@gmail.com', NULL, NULL, NULL, NULL, '2024-08-01 14:42:08', NULL, '0819213456789', 'media_nasional');
INSERT INTO `mediapartner` VALUES (90, 'Jendela Indonesia Nasional', 'JendelaIndonesiaNasional', 'MED-NTB-031', 'SAT-NTB-011', 'JendelaIndonesiaNasional@gmail.com', NULL, NULL, NULL, NULL, '2024-08-01 14:42:57', NULL, '0819172345688', 'media_nasional');
INSERT INTO `mediapartner` VALUES (91, 'Aspirasi Warga', 'AspirasiWarga', 'MED-NTB-032', 'SAT-NTB-011', 'AspirasiWarga@gmail.com', NULL, NULL, NULL, NULL, '2024-08-01 15:23:57', NULL, '0819122345678', 'media_lokal');
INSERT INTO `mediapartner` VALUES (92, 'Lensa Pos NTB', 'Lensa Pos NTB', 'MED-NTB-033', 'SAT-NTB-012', 'redaksikoranlensa@pos.com', NULL, NULL, NULL, NULL, '2024-08-01 15:42:58', NULL, '081338100777', 'media_lokal');
INSERT INTO `mediapartner` VALUES (93, 'Berita Terbaru', 'BeritaTerbaru', 'MED-NTB-034', 'SAT-NTB-011', 'BeritaTerbaru@gmail.com', NULL, NULL, NULL, NULL, '2024-08-01 15:44:03', NULL, '082912314567', 'media_lokal');
INSERT INTO `mediapartner` VALUES (94, 'Jurnal Nasional', 'JurnalNasional', 'MED-NTB-035', 'SAT-NTB-011', 'JurnalNasional@gmail.com', NULL, NULL, NULL, NULL, '2024-08-01 15:44:47', NULL, '0819231467456', 'media_nasional');
INSERT INTO `mediapartner` VALUES (95, 'Jurnal Nasional Lombok Tengah', 'JurnalNasionalLombokTengah', 'MED-NTB-036', 'SAT-NTB-011', 'JurnalNasionalLombokTengah@gmail.com', NULL, NULL, NULL, NULL, '2024-08-01 15:45:35', NULL, '081248592496', 'media_lokal');
INSERT INTO `mediapartner` VALUES (96, 'Garda Media', 'GardaMedia', 'MED-NTB-037', 'SAT-NTB-011', 'GardaMedia@gmail.com', NULL, NULL, NULL, NULL, '2024-08-01 15:46:10', NULL, '0819274875982', 'media_lokal');
INSERT INTO `mediapartner` VALUES (97, 'Bersuara', 'Bersuara', 'MED-NTB-038', 'SAT-NTB-011', 'Bersuara@gmail.com', NULL, NULL, NULL, NULL, '2024-08-01 15:51:54', NULL, '0819123456768', 'media_lokal');
INSERT INTO `mediapartner` VALUES (98, 'Big Issue', 'BigIssue', 'MED-NTB-039', 'SAT-NTB-011', 'BigIssue@gmail.com', NULL, NULL, NULL, NULL, '2024-08-01 15:52:31', NULL, '081921357895', 'media_nasional');
INSERT INTO `mediapartner` VALUES (99, 'Radar NTB', 'RadarNTB', 'MED-NTB-040', 'SAT-NTB-011', 'RadarNTB@gmail.com', NULL, NULL, NULL, NULL, '2024-08-02 10:56:20', NULL, '08112345678', 'media_lokal');
INSERT INTO `mediapartner` VALUES (100, 'Kompasiana', 'www.kompasiana.com/lapassumbawabesar', 'MED-NTB-041', 'SAT-NTB-05', 'tulapassumbawabesar@gmail.com', NULL, NULL, NULL, NULL, '2024-08-02 15:21:57', NULL, '087860606839', 'media_lokal');
INSERT INTO `mediapartner` VALUES (101, 'Media Jurnal Indonesia', 'https://mediajurnalindonesia.id/', 'MED-NTB-042', 'SAT-NTB-05', 'mediajurnalindonesia@gmail.com', NULL, NULL, NULL, 'MED-NTB-042.png', '2024-08-10 18:42:14', NULL, '082144891635', 'media_lokal');
INSERT INTO `mediapartner` VALUES (102, 'Investigasi.com', 'www.patroli88investigasi.com', 'MED-NTB-043', 'SAT-NTB-05', 'patroli88investigasi@gmail.com', NULL, NULL, NULL, 'MED-NTB-043.png', '2024-08-10 18:43:42', NULL, '082144891635', 'media_lokal');
INSERT INTO `mediapartner` VALUES (103, 'Bali jpnn', 'bali', 'MED-NTB-044', 'SAT-NTB-01', 'balijpn02@gmail.com', NULL, NULL, NULL, NULL, '2024-08-15 20:17:27', NULL, '-', 'media_lokal');
INSERT INTO `mediapartner` VALUES (104, 'IDN Times', 'idntimes', 'MED-NTB-045', 'SAT-NTB-04', 'idntimes@gmail.com', NULL, NULL, NULL, 'MED-NTB-045.png', '2024-08-17 16:51:14', NULL, '123', 'media_nasional');
INSERT INTO `mediapartner` VALUES (105, 'TV ONE NEWS', 'irwansyah', 'MED-NTB-046', 'SAT-NTB-05', 'publicrelations@tvone.co.id', NULL, NULL, NULL, 'MED-NTB-046.png', '2024-08-19 15:11:25', NULL, '08127351425', 'media_nasional');
INSERT INTO `mediapartner` VALUES (106, 'DETIK NEWS', 'Detik.com', 'MED-NTB-047', 'SAT-NTB-05', 'redaksi@detik.com', NULL, NULL, NULL, 'MED-NTB-047.png', '2024-08-19 15:13:45', NULL, '082340216423', 'media_nasional');
INSERT INTO `mediapartner` VALUES (107, 'Kick News Today', 'Kick News Today', 'MED-NTB-048', 'SAT-NTB-012', 'kicknewstoday@gmail.com', NULL, NULL, NULL, NULL, '2024-08-19 15:54:47', NULL, '081917901221', 'media_lokal');
INSERT INTO `mediapartner` VALUES (108, 'Zona Rakyat', 'Zona Rakyat', 'MED-NTB-049', 'SAT-NTB-012', 'zonarakyat@gmail.com', NULL, NULL, NULL, NULL, '2024-08-19 15:57:39', NULL, '081339842626', 'media_lokal');
INSERT INTO `mediapartner` VALUES (109, 'IDN Times NTB', 'IDN Times NTB', 'MED-NTB-050', 'SAT-NTB-012', 'redaksi@idntimes.com', NULL, NULL, NULL, NULL, '2024-08-19 16:01:01', NULL, '+62 21 759 14573', 'media_lokal');
INSERT INTO `mediapartner` VALUES (110, 'Tribunnews Lombok', 'Tribunnews Lombok', 'MED-NTB-051', 'SAT-NTB-08', 'Sinto_sintoairlangga@gmail.com', NULL, NULL, NULL, NULL, '2024-08-20 12:58:07', NULL, '+62 852-5371-8796', 'media_lokal');
INSERT INTO `mediapartner` VALUES (111, 'NewsKontoversi.com', 'NewsKontroversi', 'MED-NTB-052', 'SAT-NTB-04', 'newskontroversi@gmail.com', NULL, NULL, NULL, 'MED-NTB-052.png', '2024-09-04 15:44:10', NULL, '+62 859-6115-5151', 'media_lokal');
INSERT INTO `mediapartner` VALUES (112, 'NusraNews.com', 'NusraNews', 'MED-NTB-053', 'SAT-NTB-04', 'nusranews@gmail.com', NULL, NULL, NULL, 'MED-NTB-053.png', '2024-09-04 15:45:08', NULL, '+62 813-3946-6066', 'media_lokal');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of satker
-- ----------------------------
INSERT INTO `satker` VALUES (1, 'KANWIL NTB', 'kanwilntb', 'SAT-NTB-01', 'putriindonesiana020@gmail.com', '2024-01-23 15:05:54', '$2y$10$SPN9VCLbTG4pyE5NwurwquK3/vmM85TfT7CfbDMKZ2FwEBADEwTxO', NULL, '2024-02-23 22:56:48', '2024-08-23 00:00:00', '087881033420', 'humas_kanwil', NULL, NULL, 'SAT-NTB-01.jpeg');
INSERT INTO `satker` VALUES (3, 'KANWIL2 NTB', 'kaka', 'SAT-NTB-02', 'kaka@gmail.com', '2024-01-23 15:05:54', '$2y$10$SPN9VCLbTG4pyE5NwurwquK3/vmM85TfT7CfbDMKZ2FwEBADEwTxO', NULL, '2024-02-23 22:56:48', '2024-04-29 00:00:00', '12345678', 'humas_kanwil', NULL, NULL, 'SAT-NTB-02.png');
INSERT INTO `satker` VALUES (4, 'ADMIN SLANK', 'admin', 'SAT-NTB-03', 'admin@gmail.com', '2024-01-23 15:05:54', '$2y$10$SPN9VCLbTG4pyE5NwurwquK3/vmM85TfT7CfbDMKZ2FwEBADEwTxO', NULL, '2024-02-23 22:56:48', '2024-05-25 00:00:00', '12345678', 'superadmin', NULL, NULL, 'SAT-NTB-03.png');
INSERT INTO `satker` VALUES (21, 'LAPAS KELAS IIA LOBAR', 'lapaslobar', 'SAT-NTB-04', 'lapasmataram@gmail.com', '2024-01-23 15:05:54', '$2y$10$SPN9VCLbTG4pyE5NwurwquK3/vmM85TfT7CfbDMKZ2FwEBADEwTxO', NULL, '2024-02-23 22:56:48', '2024-07-30 00:00:00', '12345', 'humas_satker', NULL, NULL, 'SAT-NTB-04.jpeg');
INSERT INTO `satker` VALUES (22, 'LAPAS KLAS IIA SUMBAWA BESAR', NULL, 'SAT-NTB-05', 'lapassumbawa@gmail.com', '2024-01-23 15:05:54', '$2y$10$d7SPnA2joBEYNLtr4x4L..8uIla6vfhUofSHdLZU6MFsCo.0Vm5zm', NULL, '2024-02-23 22:56:48', '2024-04-29 00:00:00', '12345', 'humas_satker', NULL, NULL, 'SAT-NTB-05.png');
INSERT INTO `satker` VALUES (23, 'LAPAS KLAS IIB DOMPU', NULL, 'SAT-NTB-06', 'lapasdompu@gmail.com', '2024-01-23 15:05:54', '$2y$10$d7SPnA2joBEYNLtr4x4L..8uIla6vfhUofSHdLZU6MFsCo.0Vm5zm', NULL, '2024-02-23 22:56:48', '2024-02-23 22:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (24, 'LAPAS KLAS IIB SELONG', NULL, 'SAT-NTB-07', 'lapasselong@gmail.com', '2024-01-23 15:05:54', '$2y$10$d7SPnA2joBEYNLtr4x4L..8uIla6vfhUofSHdLZU6MFsCo.0Vm5zm', NULL, '2024-02-23 22:56:48', '2024-02-23 22:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (25, 'LAPAS TERBUKA KLAS IIB LOMBOK TENGAH', NULL, 'SAT-NTB-08', 'lapasterbuka@gmail.com', '2024-01-23 15:05:54', '$2y$10$d7SPnA2joBEYNLtr4x4L..8uIla6vfhUofSHdLZU6MFsCo.0Vm5zm', NULL, '2024-02-23 22:56:48', '2024-02-23 22:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (26, 'LPKA KLAS II LOMBOK TENGAH', NULL, 'SAT-NTB-09', 'lpka@gmail.com', '2024-01-23 15:05:54', '$2y$10$d7SPnA2joBEYNLtr4x4L..8uIla6vfhUofSHdLZU6MFsCo.0Vm5zm', NULL, '2024-02-23 22:56:48', '2024-02-23 22:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (27, 'LPP KLAS III MATARAM', NULL, 'SAT-NTB-010', 'lppmataram@gmail.com', '2024-01-23 15:05:54', '$2y$10$d7SPnA2joBEYNLtr4x4L..8uIla6vfhUofSHdLZU6MFsCo.0Vm5zm', NULL, '2024-02-23 22:56:48', '2024-02-23 22:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (28, 'RUTAN KLAS IIB PRAYA', NULL, 'SAT-NTB-011', 'rutanpraya@gmail.com', '2024-01-23 15:05:54', '$2y$10$IxB8Oyzw8.E1wMXjBJgtperiqdSuc.RbFWmZD2tXqPqLCvyZjq8g6', NULL, '2024-02-23 22:56:48', '2024-08-02 00:00:00', '12345', 'humas_satker', NULL, NULL, 'SAT-NTB-011.png');
INSERT INTO `satker` VALUES (29, 'RUTAN KLAS IIB RABA BIMA', NULL, 'SAT-NTB-012', 'rutanbima@gmail.com', '2024-01-23 15:05:54', '$2y$10$d7SPnA2joBEYNLtr4x4L..8uIla6vfhUofSHdLZU6MFsCo.0Vm5zm', NULL, '2024-02-23 22:56:48', '2024-02-23 22:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (30, 'BAPAS KLAS II MATARAM', NULL, 'SAT-NTB-013', 'bapasmataram@gmail.com', '2024-01-23 15:05:54', '$2y$10$d7SPnA2joBEYNLtr4x4L..8uIla6vfhUofSHdLZU6MFsCo.0Vm5zm', NULL, '2024-02-23 22:56:48', '2024-02-23 22:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (31, 'BAPAS KLAS II SUMBAWA BESAR', NULL, 'SAT-NTB-014', 'bapassumbawa@gmail.com', '2024-01-23 15:05:54', '$2y$10$d7SPnA2joBEYNLtr4x4L..8uIla6vfhUofSHdLZU6MFsCo.0Vm5zm', NULL, '2024-02-23 22:56:48', '2024-02-23 22:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (32, 'RUPBASAN KLAS I MATARAM', NULL, 'SAT-NTB-015', 'rupbasanmataram@gmail.com', '2024-01-23 15:05:54', '$2y$10$d7SPnA2joBEYNLtr4x4L..8uIla6vfhUofSHdLZU6MFsCo.0Vm5zm', NULL, '2024-02-23 22:56:48', '2024-02-23 22:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (33, 'RUPBASAN KLAS II SUMBAWA BESAR', NULL, 'SAT-NTB-016', 'rupbasansumbawa@gmail.com', '2024-01-23 15:05:54', '$2y$10$d7SPnA2joBEYNLtr4x4L..8uIla6vfhUofSHdLZU6MFsCo.0Vm5zm', NULL, '2024-02-23 22:56:48', '2024-02-23 22:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (34, 'KANIM KLAS I TPI MATARAM', NULL, 'SAT-NTB-017', 'kanimmataram@gmail.com', '2024-01-23 15:05:54', '$2y$10$d7SPnA2joBEYNLtr4x4L..8uIla6vfhUofSHdLZU6MFsCo.0Vm5zm', NULL, '2024-02-23 22:56:48', '2024-02-23 22:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (35, 'KANIM KLAS II TPI SUMBAWA BESAR', NULL, 'SAT-NTB-018', 'kanimsumbawa@gmail.com', '2024-01-23 15:05:54', '$2y$10$d7SPnA2joBEYNLtr4x4L..8uIla6vfhUofSHdLZU6MFsCo.0Vm5zm', NULL, '2024-02-23 22:56:48', '2024-02-23 22:56:48', '12345', 'humas_satker', NULL, NULL, NULL);
INSERT INTO `satker` VALUES (37, 'KANIM KLAS III NON TPI BIMA', NULL, 'SAT-NTB-019', 'kanimbima@gmail.com', '2024-01-23 15:05:54', '$2y$10$d7SPnA2joBEYNLtr4x4L..8uIla6vfhUofSHdLZU6MFsCo.0Vm5zm', NULL, '2024-02-23 22:56:48', '2024-02-23 22:56:48', '12345', 'humas_satker', NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
