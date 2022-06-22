/*
 Navicat Premium Data Transfer

 Source Server         : cgs
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : bookinghotel

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 21/06/2022 12:03:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bookings
-- ----------------------------
DROP TABLE IF EXISTS `bookings`;
CREATE TABLE `bookings`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `room_id` bigint UNSIGNED NOT NULL,
  `guests` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bookings_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `bookings_room_id_foreign`(`room_id`) USING BTREE,
  CONSTRAINT `bookings_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookings
-- ----------------------------
INSERT INTO `bookings` VALUES (18, '2022-06-21', '2022-06-23', 1, 1, 1, 'mickeyglass.1125@gmail.com', '35523424242423', '2022-06-19 17:15:50', '2022-06-19 17:15:50');
INSERT INTO `bookings` VALUES (19, '2022-06-09', '2022-06-11', 1, 1, 2, 'mickeyglass.1125@gmail.com', '355', '2022-06-19 17:16:43', '2022-06-19 17:16:43');
INSERT INTO `bookings` VALUES (20, '2022-06-30', '2022-07-05', 1, 1, 3, 'mickeyglass.1125@gmail.com', '355435345345345', '2022-06-19 17:29:46', '2022-06-19 17:29:46');
INSERT INTO `bookings` VALUES (21, '2022-06-20', '2022-06-22', 1, 5, 3, 'mickeyglass.1125@gmail.com', '35543535435', '2022-06-19 17:31:10', '2022-06-19 17:31:10');
INSERT INTO `bookings` VALUES (22, '2022-06-24', '2022-06-26', 2, 9, 3, 'mickeyglass.1125@gmail.com', '35534534534534', '2022-06-21 01:01:08', '2022-06-21 01:01:08');
INSERT INTO `bookings` VALUES (23, '2022-06-25', '2022-06-27', 1, 2, 3, 'mickeyglass.1125@gmail.com', '37445643545', '2022-06-21 01:26:47', '2022-06-21 01:26:47');
INSERT INTO `bookings` VALUES (24, '2022-06-23', '2022-06-25', 1, 2, 3, 'mickeyglass.1125@gmail.com', '35554645656465', '2022-06-21 02:46:45', '2022-06-21 02:46:45');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for features
-- ----------------------------
DROP TABLE IF EXISTS `features`;
CREATE TABLE `features`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `features_room_id_foreign`(`room_id`) USING BTREE,
  CONSTRAINT `features_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of features
-- ----------------------------
INSERT INTO `features` VALUES (1, 'POOL & SPA', 1, '2022-06-16 00:24:58', '2022-06-16 00:24:58');
INSERT INTO `features` VALUES (2, 'HOT TUB', 1, '2022-06-16 00:24:58', '2022-06-16 00:24:58');
INSERT INTO `features` VALUES (3, 'MASTER BEDROOMS', 1, '2022-06-16 00:24:58', '2022-06-16 00:24:58');
INSERT INTO `features` VALUES (4, 'WIFI COVERAGE', 1, '2022-06-16 00:24:58', '2022-06-16 00:24:58');
INSERT INTO `features` VALUES (8, 'POOL & SPA', 3, '2022-06-16 01:16:45', '2022-06-16 01:16:45');
INSERT INTO `features` VALUES (9, 'MASTER BEDROOMS', 3, '2022-06-16 01:16:45', '2022-06-16 01:16:45');
INSERT INTO `features` VALUES (10, 'POOL & SPA', 2, '2022-06-16 01:17:16', '2022-06-16 01:17:16');
INSERT INTO `features` VALUES (11, 'MASTER BEDROOMS', 2, '2022-06-16 01:17:17', '2022-06-16 01:17:17');
INSERT INTO `features` VALUES (12, 'HOT TUB', 2, '2022-06-16 01:17:17', '2022-06-16 01:17:17');
INSERT INTO `features` VALUES (13, 'POOL & SPA', 4, '2022-06-16 01:18:12', '2022-06-16 01:18:12');
INSERT INTO `features` VALUES (14, 'WIFI COVERAGE', 4, '2022-06-16 01:18:12', '2022-06-16 01:18:12');
INSERT INTO `features` VALUES (15, 'HOT TUB', 4, '2022-06-16 01:18:12', '2022-06-16 01:18:12');
INSERT INTO `features` VALUES (16, 'MASTER BEDROOMS', 4, '2022-06-16 01:18:12', '2022-06-16 01:18:12');
INSERT INTO `features` VALUES (17, 'POOL & SPA', 5, '2022-06-17 00:36:51', '2022-06-17 00:36:51');
INSERT INTO `features` VALUES (18, 'WIFI COVERAGE', 5, '2022-06-17 00:36:51', '2022-06-17 00:36:51');
INSERT INTO `features` VALUES (19, 'MASTER BEDROOMS', 5, '2022-06-17 00:36:51', '2022-06-17 00:36:51');
INSERT INTO `features` VALUES (20, 'POOL & SPA', 6, '2022-06-17 00:37:31', '2022-06-17 00:37:31');
INSERT INTO `features` VALUES (21, 'WIFI COVERAGE', 6, '2022-06-17 00:37:31', '2022-06-17 00:37:31');
INSERT INTO `features` VALUES (22, 'POOL & SPA', 7, '2022-06-17 00:38:14', '2022-06-17 00:38:14');
INSERT INTO `features` VALUES (23, 'WIFI COVERAGE', 7, '2022-06-17 00:38:14', '2022-06-17 00:38:14');
INSERT INTO `features` VALUES (24, 'POOL & SPA', 8, '2022-06-17 00:38:56', '2022-06-17 00:38:56');
INSERT INTO `features` VALUES (25, 'MASTER BEDROOMS', 8, '2022-06-17 00:38:56', '2022-06-17 00:38:56');
INSERT INTO `features` VALUES (26, 'WIFI COVERAGE', 9, '2022-06-17 14:28:01', '2022-06-17 14:28:01');
INSERT INTO `features` VALUES (27, 'POOL & SPA', 9, '2022-06-17 14:28:01', '2022-06-17 14:28:01');

-- ----------------------------
-- Table structure for hotels
-- ----------------------------
DROP TABLE IF EXISTS `hotels`;
CREATE TABLE `hotels`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `star` int NOT NULL,
  `x_coordinate` double(8, 2) NOT NULL,
  `y_coordinate` double(8, 2) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotels
-- ----------------------------
INSERT INTO `hotels` VALUES (1, 'Swedish Ice Hotel5', 'Stockholm Sven Nilsson Upssala12334', 'Stockholm', 5, 45.00, 45.00, 'hotel_1655337583.jpg', '2022-06-15 23:59:43', '2022-06-15 23:59:43');
INSERT INTO `hotels` VALUES (2, 'Paris Good Hotel', 'Paris France', 'Paris', 7, 78.00, 45.00, 'hotel_1655339042.jpg', '2022-06-16 00:24:02', '2022-06-16 00:24:02');
INSERT INTO `hotels` VALUES (3, 'Malaysian hotel', 'Qualarumput, Malaysia', 'Malaysia', 4, 67.00, 12.00, 'hotel_1655428546.jpg', '2022-06-17 01:15:46', '2022-06-17 01:15:46');
INSERT INTO `hotels` VALUES (5, 'swedish great excellent hotel', 'Upssala street 34', 'Uppsalla', 5, 56.00, 34.00, 'hotel_1655779237.jpg', '2022-06-21 02:40:37', '2022-06-21 02:40:37');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (5, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (6, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (7, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (8, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (9, '2022_06_15_131148_create_hotels_table', 1);
INSERT INTO `migrations` VALUES (10, '2022_06_15_131229_create_rooms_table', 1);
INSERT INTO `migrations` VALUES (11, '2022_06_15_131259_create_bookings_table', 1);
INSERT INTO `migrations` VALUES (12, '2022_06_15_131325_create_features_table', 1);
INSERT INTO `migrations` VALUES (13, '2022_06_15_131353_create_reviews_table', 1);
INSERT INTO `migrations` VALUES (19, '2016_06_01_000001_create_oauth_auth_codes_table', 2);
INSERT INTO `migrations` VALUES (20, '2016_06_01_000002_create_oauth_access_tokens_table', 2);
INSERT INTO `migrations` VALUES (21, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2);
INSERT INTO `migrations` VALUES (22, '2016_06_01_000004_create_oauth_clients_table', 2);
INSERT INTO `migrations` VALUES (23, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_access_tokens_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------
INSERT INTO `oauth_access_tokens` VALUES ('00232b332337799c55d06cf9f33e3a30f403cc1405db3a32e20da0502aeab17d2ebda22d3de43923', 4, 3, '', '[]', 0, '2022-06-19 10:00:34', '2022-06-19 10:00:34', '2023-06-19 10:00:34');
INSERT INTO `oauth_access_tokens` VALUES ('066eed5da7406ec74dbd046b1e26a22697aab3726be49fc202b9be057508b15f6c2f6826a75027ef', 1, 3, '', '[]', 0, '2022-06-18 08:22:27', '2022-06-18 08:22:27', '2023-06-18 08:22:27');
INSERT INTO `oauth_access_tokens` VALUES ('080773b465af54a96e22c849a0b559579713199de57b03cc21808253f8f364fb1e24d13b8324c38f', 1, 3, '', '[]', 0, '2022-06-19 10:00:43', '2022-06-19 10:00:43', '2023-06-19 10:00:43');
INSERT INTO `oauth_access_tokens` VALUES ('08a074b10183f5be43339bee9b48c05066cce36e51364f05d96d10e191d2c66b9db150a6445de4fd', 1, 3, '', '[]', 0, '2022-06-17 01:26:40', '2022-06-17 01:26:40', '2023-06-17 01:26:40');
INSERT INTO `oauth_access_tokens` VALUES ('09c989f17cf01a43701a0da26943a1629de61b12dd4dac0958f6ed2344d88bc24942fe73e695236d', 1, 3, '', '[]', 0, '2022-06-18 08:28:21', '2022-06-18 08:28:21', '2023-06-18 08:28:21');
INSERT INTO `oauth_access_tokens` VALUES ('0d6b69301fbd52004e5d28d81e91fa6ab8df9849cabe92e6a33e701cc60169076e30ec0eaf115183', 1, 3, '', '[]', 0, '2022-06-18 08:27:46', '2022-06-18 08:27:46', '2023-06-18 08:27:46');
INSERT INTO `oauth_access_tokens` VALUES ('1e8529f671fdb17e9b375310e13b6ec40eeadb650a9317d6997d7261b0b8d44035eff8623cbe1dde', 1, 3, '', '[]', 0, '2022-06-20 16:59:48', '2022-06-20 16:59:48', '2023-06-20 16:59:48');
INSERT INTO `oauth_access_tokens` VALUES ('21964d61bd33eb469ce8a7b223832c76af469be11b28c483dddfd5d343b8033768dac63a5686c235', 2, 3, '', '[]', 0, '2022-06-19 10:27:18', '2022-06-19 10:27:18', '2023-06-19 10:27:18');
INSERT INTO `oauth_access_tokens` VALUES ('2aa8aede9b107310221e59bf92a8cae118753d49ad3a312d87ebeb1fce2bc7cf603a2dfc709356ac', 1, 3, '', '[]', 0, '2022-06-16 01:18:43', '2022-06-16 01:18:43', '2023-06-16 01:18:43');
INSERT INTO `oauth_access_tokens` VALUES ('2ad23af6006b8e8454395367dabf869edab83edb21e022d4779af4a9014b84ea77a16e5d9fd028f4', 1, 3, '', '[]', 0, '2022-06-16 02:31:26', '2022-06-16 02:31:26', '2023-06-16 02:31:26');
INSERT INTO `oauth_access_tokens` VALUES ('2df595a6548d40789ed2d5556e96a72529b993e7006c1c4adefad4308f806c97b5ca2bc1ed1e4a63', 3, 3, '', '[]', 0, '2022-06-16 02:43:37', '2022-06-16 02:43:37', '2023-06-16 02:43:37');
INSERT INTO `oauth_access_tokens` VALUES ('2e37e8c202e7371bf13cfa44a819cdc0c8b2dc35efd2c7f57e96878087122e1b2f9b98b13c7e5c6c', 1, 3, '', '[]', 0, '2022-06-19 09:43:41', '2022-06-19 09:43:41', '2023-06-19 09:43:41');
INSERT INTO `oauth_access_tokens` VALUES ('35191e6724040a674a2ea55dd41ebc5f7560d101029eedf1da774146360f0b141237dfee716281a8', 1, 3, '', '[]', 0, '2022-06-17 00:39:42', '2022-06-17 00:39:42', '2023-06-17 00:39:42');
INSERT INTO `oauth_access_tokens` VALUES ('3a7137d5c3f2d83400623030a6e7f8197b93e38dc11a078c4effb9d12ad6116966af30fa6232c812', 1, 3, '', '[]', 0, '2022-06-17 17:00:13', '2022-06-17 17:00:13', '2023-06-17 17:00:13');
INSERT INTO `oauth_access_tokens` VALUES ('46753eb6d85a3e99408443ce842626ad106f1140646851112b8f6f6dbc4559c927021ebce03913a5', 2, 3, '', '[]', 0, '2022-06-21 01:06:49', '2022-06-21 01:06:49', '2023-06-21 01:06:49');
INSERT INTO `oauth_access_tokens` VALUES ('4918789aeb54c7ddbd9789ed8990fde41f864fe322207be96e998390330b8e2267ba33ec5ec39b2f', 2, 3, '', '[]', 0, '2022-06-15 23:59:24', '2022-06-15 23:59:24', '2023-06-15 23:59:24');
INSERT INTO `oauth_access_tokens` VALUES ('4f89649f320b349ef850768299e06d417babd313bc25aa896c25d610f9bf4ae7ef4dea7a9073797c', 2, 3, '', '[]', 0, '2022-06-16 01:02:28', '2022-06-16 01:02:28', '2023-06-16 01:02:28');
INSERT INTO `oauth_access_tokens` VALUES ('532096628c2141dbfbf849f5a2a2cbc2a35ca1a796ace379ca01bbfa16dfc6ba9265ec1493d61210', 1, 3, '', '[]', 0, '2022-06-19 15:51:25', '2022-06-19 15:51:25', '2023-06-19 15:51:25');
INSERT INTO `oauth_access_tokens` VALUES ('5880394c1d47ab6b608ecfe5914a25c101bf01b05b9cdd309a8956d6955cc510de6f25c266a4c17e', 1, 3, '', '[]', 0, '2022-06-19 09:42:11', '2022-06-19 09:42:11', '2023-06-19 09:42:11');
INSERT INTO `oauth_access_tokens` VALUES ('62937bab3770c6fc728aad335aefe93d0b9577b1106a8372502e378fd1590e764a682c75dbbb0591', 2, 3, '', '[]', 0, '2022-06-21 02:38:41', '2022-06-21 02:38:41', '2023-06-21 02:38:41');
INSERT INTO `oauth_access_tokens` VALUES ('654ffe159a934a257beaf30cce7dca99474f6280ce351cbccce0016df168dfdc9dea00f09f296553', 2, 3, '', '[]', 0, '2022-06-20 17:07:32', '2022-06-20 17:07:32', '2023-06-20 17:07:32');
INSERT INTO `oauth_access_tokens` VALUES ('6e62b6a50c191415007a53579ae791807f18edfde0191d693b98593a7f326d75078312bbc5dbe4f2', 2, 3, '', '[]', 0, '2022-06-17 00:29:35', '2022-06-17 00:29:35', '2023-06-17 00:29:35');
INSERT INTO `oauth_access_tokens` VALUES ('6ed26ceb82eb53c9b63e1977ef4f389fc6702c9a915cfd5d265a36f7137a8df79c4df212623ad3eb', 2, 3, '', '[]', 0, '2022-06-16 01:40:54', '2022-06-16 01:40:54', '2023-06-16 01:40:54');
INSERT INTO `oauth_access_tokens` VALUES ('6fb5f75aeca0e7d0a86469ed94e7f1216faa6f7d9f974847258e06bf9fd2281f1668ad1048f0343a', 1, 3, '', '[]', 0, '2022-06-16 00:26:39', '2022-06-16 00:26:39', '2023-06-16 00:26:39');
INSERT INTO `oauth_access_tokens` VALUES ('70d77cc773c96e0c0289a89a8b152479fe9c9dd7f0ebb3b3e9cac46b20c7d1c2cabf298f7f0f5152', 1, 3, '', '[]', 0, '2022-06-19 09:55:06', '2022-06-19 09:55:06', '2023-06-19 09:55:06');
INSERT INTO `oauth_access_tokens` VALUES ('729b3e9495d1c4acd2b9976e31a95192cf9fa225aaa5afefc91d985a2e08f46aa43287dffd081e10', 5, 3, '', '[]', 0, '2022-06-19 10:00:19', '2022-06-19 10:00:19', '2023-06-19 10:00:19');
INSERT INTO `oauth_access_tokens` VALUES ('792b34a8b33a8e05b0a5b0c9ae248d915615e432a6e4729a39d02cb7a98853af09f5ffe9be213a01', 1, 3, '', '[]', 0, '2022-06-17 00:41:12', '2022-06-17 00:41:12', '2023-06-17 00:41:12');
INSERT INTO `oauth_access_tokens` VALUES ('87b3279b8be9c7495a3249e348a2b286975fa858dcc6bc9b01a881c5fdf738e3e58bf414bdc93828', 2, 3, '', '[]', 0, '2022-06-18 08:07:08', '2022-06-18 08:07:08', '2023-06-18 08:07:08');
INSERT INTO `oauth_access_tokens` VALUES ('93331cb31c9703ce9c58c8aace5f045ea37bcfd7d7993800ae13a3f682a0d32e6fcd8cdd6dd38dc2', 3, 3, '', '[]', 0, '2022-06-16 00:59:49', '2022-06-16 00:59:49', '2023-06-16 00:59:49');
INSERT INTO `oauth_access_tokens` VALUES ('995401ee36abf6651c10990f15913132d45fcea93e2dfa3c69f4e656b3c9db86af0ea41e32ee6d5b', 2, 3, '', '[]', 0, '2022-06-17 01:17:01', '2022-06-17 01:17:01', '2023-06-17 01:17:01');
INSERT INTO `oauth_access_tokens` VALUES ('a143db370839ddd0bd21c81a4de67a242e7f32c14d9b34caf4bcf390dff7af8f303759125961e275', 1, 3, '', '[]', 0, '2022-06-18 08:23:21', '2022-06-18 08:23:21', '2023-06-18 08:23:21');
INSERT INTO `oauth_access_tokens` VALUES ('a247522962ab7ee3edd67cd27b4f1eb1b23be0d645fff24345917e9cc38ee603b31933075d89bae6', 1, 3, '', '[]', 0, '2022-06-18 08:13:39', '2022-06-18 08:13:39', '2023-06-18 08:13:39');
INSERT INTO `oauth_access_tokens` VALUES ('a3de63cd8b3a5a2b5707ffcfc62bb8399cca4aa9e7e625a69ca28473df2f56754a0e165f8ae87923', 1, 3, '', '[]', 0, '2022-06-21 01:16:07', '2022-06-21 01:16:07', '2023-06-21 01:16:07');
INSERT INTO `oauth_access_tokens` VALUES ('b2e804638000b414a6bd4bd91b3fbbab80ae81a5c7b2f54d71e6d4dd9a51e12fbfc6e4546b277a60', 2, 3, '', '[]', 0, '2022-06-17 14:15:17', '2022-06-17 14:15:17', '2023-06-17 14:15:17');
INSERT INTO `oauth_access_tokens` VALUES ('bf9798c9e93e22231b66d904a2e8f441086c53b6f1fa7db578cb9baba68af783e4af4cc3adf32329', 1, 3, '', '[]', 0, '2022-06-16 16:05:35', '2022-06-16 16:05:35', '2023-06-16 16:05:35');
INSERT INTO `oauth_access_tokens` VALUES ('c25fc2eb9635ab77796f97f7e94992bc95d4c38c440a2c476e9729607d7f94b4eebb053e3e39980e', 1, 3, '', '[]', 0, '2022-06-16 01:47:41', '2022-06-16 01:47:41', '2023-06-16 01:47:41');
INSERT INTO `oauth_access_tokens` VALUES ('cd9ba521c2764400656a02a098cfe2c97dfe05a11a4aa959b8c31429a2fdefaf9f1de12c73101f79', 1, 3, '', '[]', 0, '2022-06-21 02:42:17', '2022-06-21 02:42:17', '2023-06-21 02:42:17');
INSERT INTO `oauth_access_tokens` VALUES ('d28ca282190fe36097f11ad5b865513df6c56b5bba74d4b840c75ad337ea8d67f845b8c8645da54b', 2, 3, '', '[]', 0, '2022-06-17 01:15:06', '2022-06-17 01:15:06', '2023-06-17 01:15:06');
INSERT INTO `oauth_access_tokens` VALUES ('d5fffb96ad184ab946bbd7b99eac8ebe71ad376e5b335a700155a0759703019ea1bef310367576ba', 1, 3, '', '[]', 0, '2022-06-19 09:53:21', '2022-06-19 09:53:21', '2023-06-19 09:53:21');
INSERT INTO `oauth_access_tokens` VALUES ('d9b84342c67929e366004d72bb9346729cd142de097301ce7bc77ece562e92b0cde6052d93470a41', 1, 3, '', '[]', 0, '2022-06-20 02:38:10', '2022-06-20 02:38:10', '2023-06-20 02:38:10');
INSERT INTO `oauth_access_tokens` VALUES ('db96d0306b3b4290f06f699b41b968ce8ce6e422adb190dd374e2ffe5a0383de7ebd330e993bd058', 2, 3, '', '[]', 0, '2022-06-17 00:40:33', '2022-06-17 00:40:33', '2023-06-17 00:40:33');
INSERT INTO `oauth_access_tokens` VALUES ('e0e683e690e25cd3138f29a7dc65c9e52a4803ffda8b9b33535503fa08d6c7576805d1b597700d07', 1, 3, '', '[]', 0, '2022-06-19 10:15:18', '2022-06-19 10:15:18', '2023-06-19 10:15:18');
INSERT INTO `oauth_access_tokens` VALUES ('ecdd95298a6ea61adbc816b5226f41a1761d203c19c3ffa408d05877d90972be8da305e48cb95e82', 3, 3, '', '[]', 0, '2022-06-17 14:29:54', '2022-06-17 14:29:54', '2023-06-17 14:29:54');
INSERT INTO `oauth_access_tokens` VALUES ('f1701680725fdd863533e4de4ca43e4c898180da9f11ffebadf3de772e45cd5ef3cb3d102dd7d07a', 1, 3, '', '[]', 0, '2022-06-19 09:56:10', '2022-06-19 09:56:10', '2023-06-19 09:56:10');
INSERT INTO `oauth_access_tokens` VALUES ('f4360c69f01752b554b3c1310145480d43bce8455899001a526352c557befb5ba983d96596f132aa', 4, 3, '', '[]', 0, '2022-06-19 09:57:51', '2022-06-19 09:57:51', '2023-06-19 09:57:51');
INSERT INTO `oauth_access_tokens` VALUES ('fa3b7b520da6bd3654202d7298ce50e261fd5a7564eb50d89e1d30d5f6f865032dc371d10cec15e0', 1, 3, '', '[]', 0, '2022-06-18 08:21:20', '2022-06-18 08:21:20', '2023-06-18 08:21:20');

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_auth_codes_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_auth_codes
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_clients_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------
INSERT INTO `oauth_clients` VALUES (1, NULL, 'Laravel Personal Access Client', 'qGWuMeyjZBebbzwLtaDdiqI1EXuaV1EeJTdmhKvR', NULL, 'http://localhost', 1, 0, 0, '2022-06-15 23:50:12', '2022-06-15 23:50:12');
INSERT INTO `oauth_clients` VALUES (2, NULL, 'Laravel Password Grant Client', 'rSRDC3MiCeZWK3PqtY6ElvnGI3dNUTz2T4SOIch1', 'users', 'http://localhost', 0, 1, 0, '2022-06-15 23:50:12', '2022-06-15 23:50:12');
INSERT INTO `oauth_clients` VALUES (3, NULL, 'Laravel Personal Access Client', '70H9z5swbGCa6Uv35sXvVbaneY61xbuuFhsNEivb', NULL, 'http://localhost', 1, 0, 0, '2022-06-15 23:50:27', '2022-06-15 23:50:27');
INSERT INTO `oauth_clients` VALUES (4, NULL, 'Laravel Password Grant Client', 'uFYgWw1FSMhhlU5A2h6FBIc2KMwurdCZoRoLVI6b', 'users', 'http://localhost', 0, 1, 0, '2022-06-15 23:50:27', '2022-06-15 23:50:27');

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------
INSERT INTO `oauth_personal_access_clients` VALUES (1, 1, '2022-06-15 23:50:12', '2022-06-15 23:50:12');
INSERT INTO `oauth_personal_access_clients` VALUES (2, 3, '2022-06-15 23:50:27', '2022-06-15 23:50:27');

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_refresh_tokens_access_token_id_index`(`access_token_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_refresh_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\Models\\User', 1, '', 'ee2fa873f474645ce00eb76d1a5f8769403e5cff90ccc3e5e33fdcc80124fe2f', '[\"*\"]', NULL, '2022-06-15 15:24:38', '2022-06-15 15:24:38');
INSERT INTO `personal_access_tokens` VALUES (2, 'App\\Models\\User', 2, '', 'a67000a82deeb469d0ff55e73cc0939cafc7f4de82299563d37fe02553916063', '[\"*\"]', NULL, '2022-06-15 16:15:57', '2022-06-15 16:15:57');

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `hotel_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reviews_hotel_id_foreign`(`hotel_id`) USING BTREE,
  INDEX `reviews_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `reviews_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reviews
-- ----------------------------
INSERT INTO `reviews` VALUES (1, 'It is Very good!!!@', 10, 1, 3, '2022-06-16 01:01:44', '2022-06-17 00:39:30');
INSERT INTO `reviews` VALUES (2, 'Excelletn', 10, 1, 1, '2022-06-17 14:06:15', '2022-06-17 14:06:15');

-- ----------------------------
-- Table structure for rooms
-- ----------------------------
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `price` double NOT NULL,
  `guest` int NOT NULL,
  `hotel_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rooms_hotel_id_foreign`(`hotel_id`) USING BTREE,
  CONSTRAINT `rooms_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rooms
-- ----------------------------
INSERT INTO `rooms` VALUES (1, 'Bedroom', 'Good bedroom for 1', 30, 2000, 1, 1, 'ralph-ravi-kayden-8Cu8-cLZro8-unsplash_1655339098.jpg,smartworks-coworking-E7Tzh2TTS6c-unsplash_1655339098.jpg,rhema-kallianpur-jbJ-_hw2yag-unsplash_1655339098.jpg', '2022-06-16 00:24:58', '2022-06-16 00:24:58');
INSERT INTO `rooms` VALUES (2, 'Restaurant Room', 'For dinner-Restaurant room', 56, 6000, 3, 1, 'ksenia-veksler-v9QPFwOBAns-unsplash_1655339146.jpg,valeriia-bugaiova-_pPHgeHz1uk-unsplash_1655339146.jpg,toni-osmundson-XHBCqZGZre0-unsplash_1655339146.jpg', '2022-06-16 00:25:46', '2022-06-16 01:17:16');
INSERT INTO `rooms` VALUES (3, 'Kitchen', 'Kitchen for eat', 300, 300, 2, 1, 'smartworks-coworking-E7Tzh2TTS6c-unsplash_1655342205.jpg,rhema-kallianpur-jbJ-_hw2yag-unsplash_1655342205.jpg,carlos-de-almeida-f0_PcmpxnW4-unsplash_1655342205.jpg,martin-widenka-lpzw2uqUoLQ-unsplash_1655342205.jpg', '2022-06-16 01:16:45', '2022-06-16 01:16:45');
INSERT INTO `rooms` VALUES (4, 'big Roome', 'Big room for sleep', 100, 500, 2, 1, 'ksenia-veksler-v9QPFwOBAns-unsplash_1655342292.jpg,nick-fewings-VGyeR813BLk-unsplash_1655342292.jpg,ralph-ravi-kayden-8Cu8-cLZro8-unsplash_1655342292.jpg', '2022-06-16 01:18:12', '2022-06-16 01:18:12');
INSERT INTO `rooms` VALUES (5, 'Good Bedroom', 'Bedroom for 2 people', 200, 500, 3, 1, 'istockphoto-484151436-612x612_1655426211.jpg,istockphoto-907621754-612x612_1655426211.jpg,istockphoto-579240946-612x612_1655426211.jpg', '2022-06-17 00:36:51', '2022-06-17 00:36:51');
INSERT INTO `rooms` VALUES (6, 'living room with Restaurant', 'living room with Restaurant', 50, 300, 3, 1, 'istockphoto-1287089737-612x612_1655426251.jpg,istockphoto-1030503458-612x612_1655426251.jpg,istockphoto-154945734-612x612_1655426251.jpg', '2022-06-17 00:37:31', '2022-06-17 00:37:31');
INSERT INTO `rooms` VALUES (7, 'Internet room', 'you can use internet', 88, 500, 1, 1, 'istockphoto-579240946-612x612_1655426294.jpg,istockphoto-1030503458-612x612_1655426294.jpg,istockphoto-492189224-612x612_1655426294.jpg', '2022-06-17 00:38:14', '2022-06-17 00:38:14');
INSERT INTO `rooms` VALUES (8, 'Very good living roome', 'very good living room', 100, 6000, 1, 2, 'istockphoto-1208955086-612x612_1655426336.jpg,istockphoto-1213885014-612x612_1655426336.jpg,istockphoto-627892060-612x612_1655426336.jpg', '2022-06-17 00:38:56', '2022-06-17 00:38:56');
INSERT INTO `rooms` VALUES (9, 'Kitchen Room', 'Best kitchen Room', 55, 500, 3, 2, 'istockphoto-154945734-612x612_1655476080.jpg,smartworks-coworking-E7Tzh2TTS6c-unsplash_1655476080.jpg,carlos-de-almeida-f0_PcmpxnW4-unsplash_1655476080.jpg', '2022-06-17 14:28:01', '2022-06-17 14:28:01');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Robert', 'Benjamin', NULL, NULL, NULL, 'mickeyglass.1125@gmail.com', '$2y$10$mQZjh1GvegRSqJEWs49LrufZ9lOWU2AtX4PywH1v3MIo4QxvGiX7K', 0, 'user_1_1655633571.jpg', NULL, '2022-06-15 15:24:38', '2022-06-19 10:12:51');
INSERT INTO `users` VALUES (2, 'Robert5456', '3453', '435535453', 'gergehr', NULL, 'darkbluesea1125@gmail.com', '$2y$10$6rk7DJPHXi23YsLDIsUiZuN4jg02oApbk8UqwXmCBLYvqknoDKWmK', 1, 'user_2_1655779178.jpg', NULL, '2022-06-15 16:15:57', '2022-06-21 02:39:38');
INSERT INTO `users` VALUES (3, 'Sven', 'Bender', NULL, NULL, NULL, 'handsomeprince1125@gmail.com', '$2y$10$rjR4G6uaZnluByGMFFrHs.537wOD9j7jIxYez4MsDwV0x1W18JxlW', 0, NULL, NULL, '2022-06-16 00:59:49', '2022-06-16 00:59:49');
INSERT INTO `users` VALUES (4, 'Sven', 'Benderwegweg', NULL, NULL, NULL, 'awesomwebmaseter1125@gmail.com', '$2y$10$yyfKyfBa8g4DVGK2HUxiGedMt9LRg7SuIgWiiAJbPXxy/5ccCAb..', 0, NULL, NULL, '2022-06-19 09:57:51', '2022-06-19 09:57:51');
INSERT INTO `users` VALUES (5, 'wegweg', 'wegwegwe', NULL, NULL, NULL, 'werwerwe@weg.com', '$2y$10$m7Ix90jx8z9EpSQ49iGUF.biaNBkb90GnoZ/iESglfKhm3vgZ14j6', 0, NULL, NULL, '2022-06-19 10:00:19', '2022-06-19 10:00:19');

SET FOREIGN_KEY_CHECKS = 1;
