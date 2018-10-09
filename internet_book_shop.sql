/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50639
 Source Host           : localhost:3306
 Source Schema         : internet_book_shop

 Target Server Type    : MySQL
 Target Server Version : 50639
 File Encoding         : 65001

 Date: 10/10/2018 04:20:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for author
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author`  (
  `id` bigint(16) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES (1, 'John Resig', '美国洛杉矶');
INSERT INTO `author` VALUES (2, 'Russ Fergunson', '美国洛杉矶');
INSERT INTO `author` VALUES (3, 'John Paxton', '美国纽约');
INSERT INTO `author` VALUES (4, '高尔基', '沙俄');
INSERT INTO `author` VALUES (5, '罗贯中', '中国明朝');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `ISBN` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pub_year` year NULL DEFAULT NULL COMMENT '出版年份',
  `price` decimal(7, 2) NOT NULL,
  `publisher` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` enum('文学历史','军事地理','科学技术','人文社科','阅享生活','经管理财') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注扩展属性',
  PRIMARY KEY (`ISBN`) USING BTREE,
  INDEX `publisher`(`publisher`) USING BTREE,
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publisher`) REFERENCES `publisher` (`name`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('234234-2342-908', '三国演义', 2014, 124.98, '湖南师范大学出版社', '文学历史');
INSERT INTO `book` VALUES ('3242-34324-212', '我的大学', 2016, 34.60, '安徽教育出版社', '文学历史');
INSERT INTO `book` VALUES ('44565-64-45457-453', '在人间', 2016, 86.45, '西安交通大学出版社', '文学历史');
INSERT INTO `book` VALUES ('978-7-115-43286-5', '精通javascript', 2016, 45.00, '人民邮电出版社', '科学技术');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` bigint(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'mardoner', '3.1415926', '湖南怀化', 17374268544);
INSERT INTO `customer` VALUES (2, '张三丰', 'abc123456', '新疆喀什', 18652473695);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `book_isbn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `basket_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT 0 COMMENT '订单中某种书籍的数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_isbn`(`book_isbn`) USING BTREE,
  INDEX `basket_id`(`basket_id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`basket_id`) REFERENCES `shopping_basket` (`basket_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '可以看成是订单，book与shopping_basket之间的联系集' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for publisher
-- ----------------------------
DROP TABLE IF EXISTS `publisher`;
CREATE TABLE `publisher`  (
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` bigint(11) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of publisher
-- ----------------------------
INSERT INTO `publisher` VALUES ('人民邮电出版社', '中国北京', 7002586);
INSERT INTO `publisher` VALUES ('安徽教育出版社', '安徽合肥', 7332569);
INSERT INTO `publisher` VALUES ('湖南师范大学出版社', '湖南长沙', 7419821);
INSERT INTO `publisher` VALUES ('西安交通大学出版社', '陕西西安', 7239654);

-- ----------------------------
-- Table structure for shopping_basket
-- ----------------------------
DROP TABLE IF EXISTS `shopping_basket`;
CREATE TABLE `shopping_basket`  (
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `basket_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `basket_id`(`basket_id`) USING BTREE,
  CONSTRAINT `shopping_basket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stocks
-- ----------------------------
DROP TABLE IF EXISTS `stocks`;
CREATE TABLE `stocks`  (
  `book_isbn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `warehouse_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `number` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`book_isbn`, `warehouse_id`) USING BTREE,
  INDEX `warehouse_id`(`warehouse_id`) USING BTREE,
  CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `stocks_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`code`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'book的总库存，book与warehouse的联系集' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stocks
-- ----------------------------
INSERT INTO `stocks` VALUES ('234234-2342-908', 1, 8541);
INSERT INTO `stocks` VALUES ('234234-2342-908', 3, 1489);
INSERT INTO `stocks` VALUES ('234234-2342-908', 4, 69);
INSERT INTO `stocks` VALUES ('3242-34324-212', 2, 0);
INSERT INTO `stocks` VALUES ('44565-64-45457-453', 2, 7800);
INSERT INTO `stocks` VALUES ('978-7-115-43286-5', 1, 1230);
INSERT INTO `stocks` VALUES ('978-7-115-43286-5', 5, 8521);

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse`  (
  `code` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` bigint(11) NULL DEFAULT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES (1, '湖北武汉', 7421365);
INSERT INTO `warehouse` VALUES (2, '广东广州', 7445248);
INSERT INTO `warehouse` VALUES (3, '北京昌平', 7003698);
INSERT INTO `warehouse` VALUES (4, '浙江杭州', 7856248);
INSERT INTO `warehouse` VALUES (5, '甘肃兰州', 8754369);

-- ----------------------------
-- Table structure for written_by
-- ----------------------------
DROP TABLE IF EXISTS `written_by`;
CREATE TABLE `written_by`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `book_isbn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `book_isbn`, `author_id`) USING BTREE,
  INDEX `book_isbn`(`book_isbn`) USING BTREE,
  INDEX `author_id`(`author_id`) USING BTREE,
  CONSTRAINT `written_by_ibfk_1` FOREIGN KEY (`book_isbn`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `written_by_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'author表与book表之间的联系集' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of written_by
-- ----------------------------
INSERT INTO `written_by` VALUES (2, '978-7-115-43286-5', 1);
INSERT INTO `written_by` VALUES (3, '978-7-115-43286-5', 2);
INSERT INTO `written_by` VALUES (4, '978-7-115-43286-5', 3);
INSERT INTO `written_by` VALUES (1, '44565-64-45457-453', 4);
INSERT INTO `written_by` VALUES (5, '3242-34324-212', 4);
INSERT INTO `written_by` VALUES (6, '234234-2342-908', 5);

SET FOREIGN_KEY_CHECKS = 1;
