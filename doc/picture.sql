/*
 Navicat Premium Data Transfer

 Source Server         : lo
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : picture

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 25/01/2024 10:16:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_role
-- ----------------------------
DROP TABLE IF EXISTS `account_role`;
CREATE TABLE `account_role`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `account_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_role
-- ----------------------------
INSERT INTO `account_role` VALUES ('eb014d68525849c29a5998e7133c1db9', '5a07d8d95b9a46179d10a67f3765d363', '28fb6f155b3b49e38a7241893b8d03f2');

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `love` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES (2, '开了几年吧', '看看美女', '23134165');
INSERT INTO `accounts` VALUES (3, '架构', '3', '00');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `department_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` tinyint(4) NULL DEFAULT NULL,
  `order_num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, 0, '波动很大', '地打开了电脑吗', '1234657', NULL, 0, 1);

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `image_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url_prefix` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `likes` int(11) NULL DEFAULT 0,
  `path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `source_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `small_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES (27, '27fe2d4b95fb4cd8ac0aab251a035fdf20240108012054994.jpg', '芙芙', '芙芙', 'http://localhost//', 7452, 'D:\\temp\\picture\\source\\27fe2d4b95fb4cd8ac0aab251a035fdf20240108012054994.jpg', 'source/27fe2d4b95fb4cd8ac0aab251a035fdf20240108012054994.jpg', 'small/27fe2d4b95fb4cd8ac0aab251a035fdf20240108012054994.jpg', '2024-01-08 01:20:55', '2024-01-19 18:03:24');
INSERT INTO `image` VALUES (28, 'ceb75e0449734568b96bddf0d9cdcaa620240108012104533.jpg', '胡桃', '胡桃', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\ceb75e0449734568b96bddf0d9cdcaa620240108012104533.jpg', 'source/ceb75e0449734568b96bddf0d9cdcaa620240108012104533.jpg', 'small/ceb75e0449734568b96bddf0d9cdcaa620240108012104533.jpg', '2024-01-08 01:21:04', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (29, 'acdd71267ea347e4ae899a155919f28120240108012114073.jpg', '芙芙', '芙芙', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\acdd71267ea347e4ae899a155919f28120240108012114073.jpg', 'source/acdd71267ea347e4ae899a155919f28120240108012114073.jpg', 'small/acdd71267ea347e4ae899a155919f28120240108012114073.jpg', '2024-01-08 01:21:14', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (30, '5e35041589334fd3bbfe7894c7fa5d5620240108015050259.jpg', '芙芙', '芙芙', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\5e35041589334fd3bbfe7894c7fa5d5620240108015050259.jpg', 'source/5e35041589334fd3bbfe7894c7fa5d5620240108015050259.jpg', 'small/5e35041589334fd3bbfe7894c7fa5d5620240108015050259.jpg', '2024-01-08 01:50:50', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (31, '729061e1d1ea42ebb8501b70a434e64720240112150553849.jpg', '芙芙', '芙芙', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\729061e1d1ea42ebb8501b70a434e64720240112150553849.jpg', 'source/729061e1d1ea42ebb8501b70a434e64720240112150553849.jpg', 'small/729061e1d1ea42ebb8501b70a434e64720240112150553849.jpg', '2024-01-12 15:05:54', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (32, 'e1d57d38668a4fb3879d56f6a08b9e3220240112150606153.jpg', '胡桃', '胡桃', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\e1d57d38668a4fb3879d56f6a08b9e3220240112150606153.jpg', 'source/e1d57d38668a4fb3879d56f6a08b9e3220240112150606153.jpg', 'small/e1d57d38668a4fb3879d56f6a08b9e3220240112150606153.jpg', '2024-01-12 15:06:06', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (33, '01c08259da884315840384f004bcbcf320240112150617003.jpg', '芙芙', '芙芙', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\01c08259da884315840384f004bcbcf320240112150617003.jpg', 'source/01c08259da884315840384f004bcbcf320240112150617003.jpg', 'small/01c08259da884315840384f004bcbcf320240112150617003.jpg', '2024-01-12 15:06:17', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (34, 'e0b900222e584e6b874ef9c8a75f630520240112150627857.jpg', '芙芙', '芙芙', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\e0b900222e584e6b874ef9c8a75f630520240112150627857.jpg', 'source/e0b900222e584e6b874ef9c8a75f630520240112150627857.jpg', 'small/e0b900222e584e6b874ef9c8a75f630520240112150627857.jpg', '2024-01-12 15:06:27', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (35, 'bedec66b1a4e4fc8b37b574240fd2cf220240112150637707.jpg', '芙芙', '芙芙', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\bedec66b1a4e4fc8b37b574240fd2cf220240112150637707.jpg', 'source/bedec66b1a4e4fc8b37b574240fd2cf220240112150637707.jpg', 'small/bedec66b1a4e4fc8b37b574240fd2cf220240112150637707.jpg', '2024-01-12 15:06:37', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (36, '4237d72833d54573972a08221568829320240112150650984.PNG', '胡桃', '胡桃', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\4237d72833d54573972a08221568829320240112150650984.PNG', 'source/4237d72833d54573972a08221568829320240112150650984.PNG', 'small/4237d72833d54573972a08221568829320240112150650984.PNG', '2024-01-12 15:06:51', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (37, '5fc8288fd1374d8ea5dc55f33b89fa2f20240112150701166.PNG', '芙芙', '芙芙', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\5fc8288fd1374d8ea5dc55f33b89fa2f20240112150701166.PNG', 'source/5fc8288fd1374d8ea5dc55f33b89fa2f20240112150701166.PNG', 'small/5fc8288fd1374d8ea5dc55f33b89fa2f20240112150701166.PNG', '2024-01-12 15:07:01', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (38, 'e4fc35c494be450f88adf42c5cedf2f120240112150725139.jfif', '芙芙', '芙芙', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\e4fc35c494be450f88adf42c5cedf2f120240112150725139.jfif', 'source/e4fc35c494be450f88adf42c5cedf2f120240112150725139.jfif', 'small/e4fc35c494be450f88adf42c5cedf2f120240112150725139.jfif', '2024-01-12 15:07:25', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (39, '73059aa442724ee69a2547e1decc7dc720240117204451453.jpg', '', NULL, 'http://localhost//', 0, 'D:\\temp\\picture\\source\\73059aa442724ee69a2547e1decc7dc720240117204451453.jpg', 'source/73059aa442724ee69a2547e1decc7dc720240117204451453.jpg', 'small/73059aa442724ee69a2547e1decc7dc720240117204451453.jpg', '2024-01-17 20:44:51', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (40, '7abfa2a8c03d4c50b2822fb81969abb620240118003012138.png', '芙芙', '毫不含糊', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\7abfa2a8c03d4c50b2822fb81969abb620240118003012138.png', 'source/7abfa2a8c03d4c50b2822fb81969abb620240118003012138.png', 'small/7abfa2a8c03d4c50b2822fb81969abb620240118003012138.png', '2024-01-18 00:30:12', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (41, '35b7781e56884523945c00e7a7b9b67e20240118003012253.jpg', '芙芙', '毫不含糊', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\35b7781e56884523945c00e7a7b9b67e20240118003012253.jpg', 'source/35b7781e56884523945c00e7a7b9b67e20240118003012253.jpg', 'small/35b7781e56884523945c00e7a7b9b67e20240118003012253.jpg', '2024-01-18 00:30:12', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (42, 'e2fc1f0aac76493faf7b7582ba9ca6f720240118003012276.png', '芙芙', '毫不含糊', 'http://localhost//', 445, 'D:\\temp\\picture\\source\\e2fc1f0aac76493faf7b7582ba9ca6f720240118003012276.png', 'source/e2fc1f0aac76493faf7b7582ba9ca6f720240118003012276.png', 'small/e2fc1f0aac76493faf7b7582ba9ca6f720240118003012276.png', '2024-01-18 00:30:12', '2024-01-19 18:03:35');
INSERT INTO `image` VALUES (43, '2c1c78cd7b9e461b82abdbeb6b869d5d20240118004808036.jpg', '芙芙', '毫不含糊', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\2c1c78cd7b9e461b82abdbeb6b869d5d20240118004808036.jpg', 'source/2c1c78cd7b9e461b82abdbeb6b869d5d20240118004808036.jpg', 'small/2c1c78cd7b9e461b82abdbeb6b869d5d20240118004808036.jpg', '2024-01-18 00:48:08', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (44, 'c0470c3737524aee92e6590aa5e24e6420240118004808061.png', '芙芙', '毫不含糊', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\c0470c3737524aee92e6590aa5e24e6420240118004808061.png', 'source/c0470c3737524aee92e6590aa5e24e6420240118004808061.png', 'small/c0470c3737524aee92e6590aa5e24e6420240118004808061.png', '2024-01-18 00:48:08', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (45, '9aa4b833c7f242b2b67e9da1cabc73d620240118004808085.png', '芙芙', '毫不含糊', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\9aa4b833c7f242b2b67e9da1cabc73d620240118004808085.png', 'source/9aa4b833c7f242b2b67e9da1cabc73d620240118004808085.png', 'small/9aa4b833c7f242b2b67e9da1cabc73d620240118004808085.png', '2024-01-18 00:48:08', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (64, 'ccec0435d81b4f79a55519a0d394a69320240119175033111.png', '芙芙', '毫不含糊', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\ccec0435d81b4f79a55519a0d394a69320240119175033111.png', 'source/ccec0435d81b4f79a55519a0d394a69320240119175033111.png', 'small/ccec0435d81b4f79a55519a0d394a69320240119175033111.png', '2024-01-19 17:50:33', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (65, '764a184ea36e41e7a62382b424eb054720240119175033253.jpg', '芙芙', '毫不含糊', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\764a184ea36e41e7a62382b424eb054720240119175033253.jpg', 'source/764a184ea36e41e7a62382b424eb054720240119175033253.jpg', 'small/764a184ea36e41e7a62382b424eb054720240119175033253.jpg', '2024-01-19 17:50:33', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (66, 'de5196df2558492b924fef48c66fd2f220240119175033348.jpg', '芙芙', '毫不含糊', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\de5196df2558492b924fef48c66fd2f220240119175033348.jpg', 'source/de5196df2558492b924fef48c66fd2f220240119175033348.jpg', 'small/de5196df2558492b924fef48c66fd2f220240119175033348.jpg', '2024-01-19 17:50:33', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (67, '8a3bcd19282c4ae08f1c6c21029b824720240119175321344.jpg', '芙芙', '毫不含糊', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\8a3bcd19282c4ae08f1c6c21029b824720240119175321344.jpg', 'source/8a3bcd19282c4ae08f1c6c21029b824720240119175321344.jpg', 'small/8a3bcd19282c4ae08f1c6c21029b824720240119175321344.jpg', '2024-01-19 17:53:21', '2024-01-19 18:02:41');
INSERT INTO `image` VALUES (68, 'b931f5513efd4d2fbc9635e16dc9616520240119175321400.jpg', '芙芙', '毫不含糊', 'http://localhost//', 0, 'D:\\temp\\picture\\source\\b931f5513efd4d2fbc9635e16dc9616520240119175321400.jpg', 'source/b931f5513efd4d2fbc9635e16dc9616520240119175321400.jpg', 'small/b931f5513efd4d2fbc9635e16dc9616520240119175321400.jpg', '2024-01-19 17:53:21', '2024-01-19 18:02:41');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` bigint(20) NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `parent_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` tinyint(4) NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_num` int(11) NULL DEFAULT NULL,
  `is_delete` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) NOT NULL,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `role_id` bigint(20) NULL DEFAULT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'nan');
INSERT INTO `student` VALUES (2, '22开没开');
INSERT INTO `student` VALUES (3, '3让访客');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_account_non_expired` tinyint(4) NULL DEFAULT NULL,
  `is_account_non_locked` tinyint(4) NULL DEFAULT NULL,
  `is_enabled` tinyint(4) NULL DEFAULT NULL,
  `is_credentials_non_expired` tinyint(4) NULL DEFAULT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `department_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `department_id` bigint(20) NULL DEFAULT NULL,
  `gender` tinyint(4) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_admin` tinyint(4) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_delete` tinyint(4) NULL DEFAULT 1,
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', NULL, NULL, NULL, NULL, NULL, '22223', '20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
