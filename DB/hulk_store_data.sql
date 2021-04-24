/*
 Navicat Premium Data Transfer

 Source Server         : All
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : hulk_store

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 24/04/2021 03:12:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `internal_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` int UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `delete` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_users_id_foreign`(`users_id`) USING BTREE,
  CONSTRAINT `category_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Camisetas', 'Lorem ipsum', 'dfb31db840a8a4ac96a36ebe56cd00ab', 1, NULL, '2018-07-22 19:15:41', 1);
INSERT INTO `category` VALUES (2, 'Vasos', 'Lorem ipsum', '83af91bfeaf3caead8fbe4cffb93715b', 1, '2018-07-22 16:46:52', '2018-07-22 18:00:52', 0);
INSERT INTO `category` VALUES (3, 'Comics', 'Lorem ipsum', '2b23122b715a753fcc1758e875eb8d83', 1, '2018-07-22 16:48:35', '2018-07-22 17:50:01', 1);
INSERT INTO `category` VALUES (4, 'Juguetes', 'Lorem ipsum', '6fff29fef4724dccda44da6179fe329e', 1, '2018-07-22 16:51:29', '2018-07-22 17:54:54', 1);
INSERT INTO `category` VALUES (5, 'Accesorios', 'Lorem ipsum', '1fe93de6b78d890255fa147c9a666931', 1, '2018-07-22 16:53:55', '2018-07-22 18:00:53', 0);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_11_000000_create_roles_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (3, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (4, '2018_07_20_143101_create_order_table', 1);
INSERT INTO `migrations` VALUES (5, '2018_07_20_143114_create_category_table', 1);
INSERT INTO `migrations` VALUES (6, '2018_07_20_143131_create_products_table', 1);
INSERT INTO `migrations` VALUES (7, '2018_07_20_143152_create_order_detail_table', 1);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `products_id` int UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `internal_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `orders_id` int UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_detail_products_id_foreign`(`products_id`) USING BTREE,
  INDEX `order_detail_orders_id_foreign`(`orders_id`) USING BTREE,
  CONSTRAINT `order_detail_orders_id_foreign` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_detail_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_id` int UNSIGNED NOT NULL,
  `internal_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_order` int NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orders_users_id_foreign`(`users_id`) USING BTREE,
  CONSTRAINT `orders_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `internal_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `brand` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `price` int NULL DEFAULT NULL,
  `discount` int NULL DEFAULT NULL,
  `stock` int NULL DEFAULT NULL,
  `category_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `delete` int NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `products_users_id_foreign`(`users_id`) USING BTREE,
  INDEX `products_category_id_foreign`(`category_id`(191)) USING BTREE,
  CONSTRAINT `products_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 1, 'Producto 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '314596c6db71f232d20539a878eeba1b', 'Marvel', 55000, 5, 50, '1', 0, 'Talla L', 'CBS00018', '2018-07-23 01:22:33', '2018-07-23 02:46:46');
INSERT INTO `products` VALUES (2, 1, 'Producto 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '6657ee91a9c43440ab676769c27c3069', 'Dc Comics', 55300, 5, 50, '5', 1, 'Talla L', 'CBS00019', '2018-07-23 02:27:03', '2018-07-23 02:48:30');
INSERT INTO `products` VALUES (3, 1, 'Producto 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '1d1b2f9add25a3bc57f134d5368ef767', 'Marvel', 20000, 5, 530, '2', 0, 'Talla L', 'CBS00020', '2018-07-23 02:33:55', '2018-07-23 02:48:16');
INSERT INTO `products` VALUES (4, 1, 'Producto 4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'df4de60ffde045a70f272f5c0da8cb8d', 'Marvel', 50000, 5, 50, '3', 0, 'Talla XL', 'CBS00017', '2018-07-23 02:34:27', '2018-07-23 02:48:24');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_acces` int NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'administrator', 1, NULL, NULL);
INSERT INTO `roles` VALUES (2, 'user', 2, NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` bigint NULL DEFAULT NULL,
  `identification` bigint NULL DEFAULT NULL,
  `delete` bigint NULL DEFAULT NULL,
  `internal_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `roles_id` int UNSIGNED NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `users_roles_id_foreign`(`roles_id`) USING BTREE,
  CONSTRAINT `users_roles_id_foreign` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin', 'Admin', 'admin', 'admin@admin.com', 'Calle falsa 123', 1232456544, 1111223344, 0, 'fd2541dcaeabb1dc93abbe2604f1126f', 1, '$2y$10$f56lxXLukRV6mOsZr3ZZTu/5KpiDYL/hwl/qM8KwTTHxHbHtuUely', NULL, '2021-04-24 09:10:21', '2021-04-24 09:10:21');

SET FOREIGN_KEY_CHECKS = 1;
