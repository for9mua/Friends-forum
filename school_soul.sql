/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : school_soul

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 26/03/2023 15:12:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收件人名称',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '收件人id',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '安徽省合肥市政务区1001号', '小黑子', 19, '13699559988');
INSERT INTO `address` VALUES (2, '安徽省合肥市', '小黑子1号', 19, '13899669988');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '软删除',
  `dynamic_id` int(11) NULL DEFAULT NULL COMMENT '动态',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '收藏人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ddu`(`deleted`, `dynamic_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (4, 4, 16, 1, '2023-03-18 10:42:10', '2023-03-18 10:42:10');
INSERT INTO `collect` VALUES (6, 6, 16, 1, '2023-03-18 10:42:14', '2023-03-18 10:42:14');
INSERT INTO `collect` VALUES (8, 8, 16, 1, '2023-03-18 10:42:15', '2023-03-18 10:42:15');
INSERT INTO `collect` VALUES (10, 0, 16, 1, '2023-03-18 10:42:29', '2023-03-18 10:42:29');
INSERT INTO `collect` VALUES (11, 0, 16, 18, '2023-03-18 11:35:31', '2023-03-18 11:35:31');
INSERT INTO `collect` VALUES (12, 0, 16, 19, '2023-03-18 11:44:50', '2023-03-18 11:44:50');
INSERT INTO `collect` VALUES (13, 0, 17, 18, '2023-03-26 09:56:52', '2023-03-26 09:56:52');
INSERT INTO `collect` VALUES (14, 0, 18, 19, '2023-03-26 15:00:15', '2023-03-26 15:00:15');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户',
  `dynamic_id` int(11) NULL DEFAULT NULL COMMENT '动态',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时间',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '属地',
  `puser_id` int(11) NULL DEFAULT NULL COMMENT '父级用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (2, 2, '2023-03-18 10:52:50', '2023-03-18 11:33:53', '123', 1, 16, '2023-03-18 10:52:49', NULL, '安徽合肥', NULL);
INSERT INTO `comments` VALUES (3, 3, '2023-03-18 11:13:01', '2023-03-18 11:33:45', '2回复内容', 1, 16, '2023-03-18 11:13:00', 2, '安徽省合肥市', 1);
INSERT INTO `comments` VALUES (4, 4, '2023-03-18 11:13:30', '2023-03-18 11:33:53', '123132131', 1, 16, '2023-03-18 11:13:30', 2, '安徽省合肥市', 1);
INSERT INTO `comments` VALUES (5, 5, '2023-03-18 11:14:59', '2023-03-18 11:33:51', '我是孙子的孙子', 1, 16, '2023-03-18 11:14:59', 2, '安徽省合肥市', 1);
INSERT INTO `comments` VALUES (6, 6, '2023-03-18 11:15:43', '2023-03-18 11:33:53', '我是小孙', 1, 16, '2023-03-18 11:15:42', 2, '安徽省合肥市', 1);
INSERT INTO `comments` VALUES (7, 0, '2023-03-18 11:34:14', '2023-03-18 11:34:14', '我是小黑粉', 1, 16, '2023-03-18 11:34:13', NULL, '安徽省合肥市', NULL);
INSERT INTO `comments` VALUES (8, 0, '2023-03-18 11:34:31', '2023-03-18 11:34:31', '哈哈哈  我也是', 19, 16, '2023-03-18 11:34:30', 7, '安徽省合肥市', 1);
INSERT INTO `comments` VALUES (9, 0, '2023-03-18 11:35:05', '2023-03-18 11:35:05', '我不是', 18, 16, '2023-03-18 11:35:04', 7, '安徽省合肥市', 1);
INSERT INTO `comments` VALUES (10, 0, '2023-03-25 09:52:32', '2023-03-25 09:52:32', '今天天气很好', 19, 15, '2023-03-25 09:52:31', NULL, '安徽省合肥市', NULL);
INSERT INTO `comments` VALUES (11, 0, '2023-03-25 13:46:16', '2023-03-25 13:46:16', '22123113', 19, 17, '2023-03-25 13:46:16', NULL, '安徽省合肥市', NULL);
INSERT INTO `comments` VALUES (12, 0, '2023-03-26 10:00:09', '2023-03-26 10:00:09', '哈哈哈 小黑子', 18, 16, '2023-03-26 10:00:08', NULL, '安徽省合肥市', NULL);
INSERT INTO `comments` VALUES (13, 0, '2023-03-26 10:02:14', '2023-03-26 10:02:14', '小黑子漏出鸡脚了吧', 18, 18, '2023-03-26 10:02:14', NULL, '安徽省合肥市', NULL);
INSERT INTO `comments` VALUES (14, 0, '2023-03-26 14:58:05', '2023-03-26 14:58:05', '小黑子太帅了吧！', 18, 18, '2023-03-26 14:58:04', NULL, '安徽省合肥市', NULL);

-- ----------------------------
-- Table structure for dynamic
-- ----------------------------
DROP TABLE IF EXISTS `dynamic`;
CREATE TABLE `dynamic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deleted` int(11) NULL DEFAULT 0 COMMENT '软删除',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `view` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  `tags` json NULL COMMENT '话题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dynamic
-- ----------------------------
INSERT INTO `dynamic` VALUES (1, 1, '标题标题标题标题标题标题标题标题', '222', '222', NULL, '2023-02-21 22:04:03', '2023-02-03 22:39:23', '2023-02-04 10:14:06', '描述描述描述描述描述', 1, NULL);
INSERT INTO `dynamic` VALUES (2, 2, '44444555', '33555', '44455', NULL, '2023-02-22 22:04:03', '2023-02-04 10:13:37', '2023-02-04 10:13:50', '描述描述描述描述描述', 0, NULL);
INSERT INTO `dynamic` VALUES (3, 3, '嗯嗯嗯', '是是是洒下寻多寻寻所撒奥做做做所所多多寻寻寻寻所多多多多寻寻寻奥所所多大寻寻寻寻寻寻寻寻群奥奥寻寻寻寻寻寻寻所所寻寻寻寻寻', 'http://localhost:9090/file/download/c852ac64fd9440efa739f59d092fa8e9.png', NULL, '2023-02-22 22:04:03', '2023-02-04 10:14:00', '2023-02-04 15:45:15', '描述描述描述描述描述', 0, NULL);
INSERT INTO `dynamic` VALUES (4, 0, '测试测试', '<p>测试测试</p>', 'http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png', 5, '2023-02-23 22:04:03', '2023-02-04 15:45:34', '2023-02-04 15:45:34', '描述描述描述描述描述', 0, NULL);
INSERT INTO `dynamic` VALUES (5, 5, '1122', '<p><strong>22222</strong></p><p><strong>测试测试</strong></p><p><span style=\"color: rgb(255, 255, 255); background-color: rgb(54, 88, 226);\"><em><strong>sssssss</strong></em></span></p><p><img src=\"http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"http://localhost:9090/file/download/2049d91719af4ecb8a5604d0e4e50f63.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p><p><br></p><p><br></p>', NULL, NULL, '2023-02-23 22:04:03', '2023-02-04 22:06:01', '2023-02-19 10:32:26', '描述描述描述描述描述', 0, NULL);
INSERT INTO `dynamic` VALUES (6, 6, '测试', '<blockquote>22221111</blockquote><pre><code class=\"language-java\">class Hello {}</code></pre><p><br></p>', NULL, NULL, '2023-02-24 22:04:03', '2023-02-19 09:05:01', '2023-02-19 10:32:24', '描述描述描述描述描述', 0, NULL);
INSERT INTO `dynamic` VALUES (7, 7, '测试', '<pre><code class=\"language-java\">class Hell {\n    public static void main() {\n    \n    }\n}</code></pre><blockquote>测试</blockquote><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled checked>测试</div><div data-w-e-type=\"todo\"><input type=\"checkbox\" disabled >测试</div>', NULL, NULL, '2023-02-28 22:04:03', '2023-02-19 09:44:10', '2023-02-19 10:32:22', '描述描述描述描述描述', 0, NULL);
INSERT INTO `dynamic` VALUES (8, 0, '测试123', '<p><br></p>', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 1, '2023-02-26 22:04:03', '2023-02-19 10:33:15', '2023-02-19 10:33:15', '描述描述描述描述描述', 0, NULL);
INSERT INTO `dynamic` VALUES (9, 9, '测试docx', '<p><br></p>', 'http://localhost:9090/file/download/a75a2983d16d4936afaf2c1f48a4483c.png', 3, '2023-02-28 22:04:03', '2023-02-19 10:56:47', '2023-03-18 09:27:45', '描述描述描述描述描述', 0, NULL);
INSERT INTO `dynamic` VALUES (10, 10, '测试测试', '', NULL, NULL, '2023-02-27 22:04:03', '2023-02-19 16:21:06', '2023-02-28 22:04:24', '描述描述描述描述描述', 0, NULL);
INSERT INTO `dynamic` VALUES (11, 11, '测试测试', '', NULL, NULL, '2023-02-28 22:04:03', '2023-02-19 16:22:16', '2023-02-28 22:04:23', '描述描述描述描述描述', 0, NULL);
INSERT INTO `dynamic` VALUES (12, 12, '测试测试', '', NULL, NULL, '2023-02-28 22:04:03', '2023-02-19 16:24:43', '2023-02-19 16:25:32', '描述描述描述描述描述', 0, NULL);
INSERT INTO `dynamic` VALUES (13, 13, '测试富文本', '<blockquote>测试测试</blockquote><h1>11111</h1><h2>222222</h2><p><span style=\"color: rgb(250, 250, 250); background-color: rgb(54, 88, 226);\"><em><strong>bbbbbb</strong></em></span></p><p><br></p><pre><code class=\"language-java\">class Hello {\n  \n}</code></pre><p><br></p>', NULL, 4, '2023-02-28 22:04:03', '2023-02-19 21:00:18', '2023-02-28 22:04:21', '描述描述描述描述描述', 0, NULL);
INSERT INTO `dynamic` VALUES (14, 0, '标题标题标题标题标题标题标题标题', '<blockquote>1111<img src=\"http://localhost:9090/file/download/1e78e65c7f7d4efb9291922cc6eb0d4a.png\" alt=\"\" data-href=\"\" style=\"\"/></blockquote><p><br></p><h1>我是H1</h1><p><em>我是斜体</em></p><p><br></p><p><span style=\"color: rgb(245, 219, 77); background-color: rgb(66, 144, 247);\">我是颜色字</span></p>', 'http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png', 1, '2023-02-28 22:04:03', '2023-02-28 22:04:07', '2023-02-28 22:04:07', '描述描述描述描述描述', 85, NULL);
INSERT INTO `dynamic` VALUES (15, 0, '今天真是一个好天气11', '<p>今天真是一个好天气</p><p><br></p><p><img src=\"http://localhost:9090/file/download/f3ffc202dd3e47888914ec6db3fcc093.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p>', 'http://localhost:9090/file/download/45a427d2ece84e0daa1d864e8f4bb713.jpg', 19, '2023-03-18 09:26:40', '2023-03-18 09:26:40', '2023-03-18 09:26:40', '真是一个好天气', 16, '[\"无聊的话题\"]');
INSERT INTO `dynamic` VALUES (16, 0, '哈哈哈哈我是小黑粉', '<p>1111</p><p><img src=\"http://localhost:9090/file/download/30ab8bc3353645efb8716374b20688cb.png\" alt=\"\" data-href=\"\" style=\"\"/></p>', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 19, '2023-03-18 09:38:26', '2023-03-18 09:38:26', '2023-03-18 09:38:26', '我是小黑粉', 125, '[\"征婚\"]');
INSERT INTO `dynamic` VALUES (17, 0, '小黑子你干嘛~', '<p><img src=\"http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png\" alt=\"\" data-href=\"\" style=\"\"/></p><p>小黑子你干嘛~小黑子你干嘛~小黑子你干嘛~小黑子你干嘛~</p><p>小黑子你干嘛~小黑子你干嘛~小黑子你干嘛~小黑子你干嘛~</p>', 'http://localhost:9090/file/download/27f7a9a8e1ab4cb38fe4719babb2f8d5.png', 19, '2023-03-25 11:59:02', '2023-03-25 11:59:03', '2023-03-25 11:59:03', '小黑子你干嘛~', 12, '[\"小黑子\", \"鸡你太美\"]');
INSERT INTO `dynamic` VALUES (18, 0, '真的没人看我的直播吗？', '<p>哈哈哈 &nbsp;不是 &nbsp; iqing在看！！</p><p><br></p><p><img src=\"http://localhost:9090/file/download/08a75cd4da794ca98b672411629784f7.png\" alt=\"\" data-href=\"\" style=\"\"/><img src=\"http://localhost:9090/file/download/f97531d34fb441b3becf9158da79e953.png\" alt=\"\" data-href=\"\" style=\"\"/></p>', 'http://localhost:9090/file/download/c9376c9b6adb4a20a9c7b17bcfd3a515.png', 19, '2023-03-25 13:47:27', '2023-03-25 13:47:28', '2023-03-25 13:47:28', '啊哈哈好像是', 24, '[\"小黑子\"]');
INSERT INTO `dynamic` VALUES (19, 0, '今天天气怎么样', '<p><img src=\"http://localhost:9090/file/download/44de2a1f72444ee7b70f0a2250dda616.png\" alt=\"\" data-href=\"\" style=\"\"/></p>', 'http://localhost:9090/file/download/e5d11ee679f442d9aeb8279319b86a1f.png', 19, '2023-03-26 14:59:50', '2023-03-26 14:59:50', '2023-03-26 14:59:50', '今天天气还好吧', 0, '[\"恋爱\"]');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单位',
  `num` int(11) NULL DEFAULT NULL COMMENT '库存',
  `score` int(11) NULL DEFAULT NULL COMMENT '所需积分',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片',
  `status_radio` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否上架',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 'G-31167291', '运动手表', 199.00, '个', 998, 500, 'http://localhost:9090/file/download/9ed2f656c90242689ed55b55aa4cb7c9.png', '是');
INSERT INTO `goods` VALUES (2, 'G-06961673', '数码相机', 999.00, '个', 97, 1000, 'http://localhost:9090/file/download/31351baf97a943cdaf1489092d937593.png', '是');

-- ----------------------------
-- Table structure for im
-- ----------------------------
DROP TABLE IF EXISTS `im`;
CREATE TABLE `im`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户编号',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '个性签名',
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '消息文字',
  `create_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of im
-- ----------------------------
INSERT INTO `im` VALUES (1, '4918ea50c06a458f94878abe741b4f51', '管理员', 'http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png', '', '哈喽，你好啊😀', '2023-02-18 12:54:05', NULL);
INSERT INTO `im` VALUES (2, 'f3e75978695847e59c7c575d8379afa3', 'Ikun小黑子专用号', 'http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg', '', '哦豁，我来了😄', '2023-02-18 12:55:02', NULL);
INSERT INTO `im` VALUES (3, 'f3e75978695847e59c7c575d8379afa3', 'Ikun小黑子专用号', 'http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg', '', '阿里嘎多，美羊羊桑~', '2023-02-18 12:55:18', NULL);
INSERT INTO `im` VALUES (4, '4918ea50c06a458f94878abe741b4f51', '管理员', 'http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png', '', '小黑子😍', '2023-02-18 12:55:35', NULL);
INSERT INTO `im` VALUES (5, '4918ea50c06a458f94878abe741b4f51', '管理员', 'http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png', '', '小黑子来了吗？\n😍', '2023-02-19 20:40:38', NULL);
INSERT INTO `im` VALUES (6, 'f3e75978695847e59c7c575d8379afa3', 'Ikun小黑子专用号', 'http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg', '', '哈哈哈 我来了😄', '2023-02-19 20:40:50', NULL);
INSERT INTO `im` VALUES (7, '4918ea50c06a458f94878abe741b4f51', '管理员', 'http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png', '', '你好骚啊！！😊', '2023-02-19 20:41:04', NULL);
INSERT INTO `im` VALUES (8, 'f3e75978695847e59c7c575d8379afa3', 'Ikun小黑子专用号', 'http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg', '', '你讨厌！😛', '2023-02-19 20:41:17', NULL);
INSERT INTO `im` VALUES (9, 'f3e75978695847e59c7c575d8379afa3', 'Ikun小黑子专用号', 'http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg', '', '小黑子已加入群聊😍', '2023-03-26 14:44:08', NULL);

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '通知内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '通知时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '通知人id',
  `isread` tinyint(1) NULL DEFAULT 0 COMMENT '是否已读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES (1, '系统用户6usym6点赞了你的动态<a href=\'/front/detail?id=18\'>真的没人看我的直播吗？</a>', '2023-03-26 09:34:11', 19, 1);
INSERT INTO `messages` VALUES (2, '系统用户6usym6点赞了你的动态 <a target=\'_blank\' href=\'/front/detail?id=16\'>哈哈哈哈我是小黑粉</a>', '2023-03-26 09:56:46', 19, 1);
INSERT INTO `messages` VALUES (3, '系统用户6usym6收藏了你的动态 <a target=\'_blank\' href=\'/front/detail?id=17\'>小黑子你干嘛~</a>', '2023-03-26 09:56:51', 19, 1);
INSERT INTO `messages` VALUES (4, '系统用户6usym6点赞了你的动态 <a target=\'_blank\' href=\'/front/detail?id=17\'>小黑子你干嘛~</a>', '2023-03-26 09:56:53', 19, 1);
INSERT INTO `messages` VALUES (5, '系统用户6usym6收藏了你的动态 <a target=\'_blank\' href=\'/front/detail?id=16\'>哈哈哈哈我是小黑粉</a>', '2023-03-26 10:00:09', 19, 1);
INSERT INTO `messages` VALUES (6, '系统用户6usym6收藏了你的动态 <a target=\'_blank\' href=\'/front/detail?id=18\'>真的没人看我的直播吗？</a>', '2023-03-26 10:02:14', 19, 1);
INSERT INTO `messages` VALUES (7, '系统用户6usym6收藏了你的动态 <a target=\'_blank\' href=\'/front/detail?id=18\'>真的没人看我的直播吗？</a>', '2023-03-26 14:58:04', 19, 1);
INSERT INTO `messages` VALUES (8, 'Ikun小黑子专用号收藏了你的动态 <a target=\'_blank\' href=\'/front/detail?id=18\'>真的没人看我的直播吗？</a>', '2023-03-26 15:00:14', 19, 1);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  `view` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '校园新闻征婚交友活动1111', '<p>今天开始发布征婚交友活动</p><p><br></p><p><img src=\"http://localhost:9090/file/download/60feae23628c4290ba28d65d6e3a07db.png\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2023-03-25 09:58:10', 6);
INSERT INTO `news` VALUES (2, '小黑子也去征婚了笑死我2222', '<p>小黑子也去征婚了笑死我</p><p><img src=\"http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2023-03-25 09:58:10', 1);
INSERT INTO `news` VALUES (3, '校园新闻征婚交友活动33333', '<p>今天开始发布征婚交友活动</p><p><br></p><p><img src=\"http://localhost:9090/file/download/60feae23628c4290ba28d65d6e3a07db.png\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2023-03-25 09:58:10', 5);
INSERT INTO `news` VALUES (4, '小黑子也去征婚了笑死我44444', '<p>小黑子也去征婚了笑死我</p><p><img src=\"http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2023-03-25 09:58:10', 0);
INSERT INTO `news` VALUES (5, '校园新闻征婚交友活动5555', '<p>今天开始发布征婚交友活动</p><p><br></p><p><img src=\"http://localhost:9090/file/download/60feae23628c4290ba28d65d6e3a07db.png\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2023-03-25 09:58:10', 5);
INSERT INTO `news` VALUES (6, '小黑子也去征婚了笑死我6666', '<p>小黑子也去征婚了笑死我</p><p><img src=\"http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2023-03-25 09:58:10', 0);
INSERT INTO `news` VALUES (7, '校园新闻征婚交友活动7777', '<p>今天开始发布征婚交友活动</p><p><br></p><p><img src=\"http://localhost:9090/file/download/60feae23628c4290ba28d65d6e3a07db.png\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2023-03-25 09:58:10', 5);
INSERT INTO `news` VALUES (8, '小黑子也去征婚了笑死我88888', '<p>小黑子也去征婚了笑死我</p><p><img src=\"http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png\" alt=\"\" data-href=\"\" style=\"\"/></p>', '2023-03-25 09:58:10', 0);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `userid` int(11) NULL DEFAULT NULL COMMENT '创建人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (3, '代码生成器V2.0发布', '1. 支持富文本、单选、下拉框（可关联其他表）等表单组件自动生成<br/>\n2. 内置聊天室和在线留言功能<br/>\n3. 内置音乐播放器和视频播放器组件<br/>\n4. 增加系统日志模块，记录登录和用户行为<br/>\n5. 内置系统公告功能<br/>\n6. 优化登录和注册页css，增加验证码功能\n', NULL, '管理员', 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单编号',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `num` int(11) NULL DEFAULT NULL COMMENT '数量',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '换购时间',
  `score` int(11) NULL DEFAULT NULL COMMENT '积分',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '202303026229201', 2, 1, '2023-03-26 13:57:09', 1000, 19, '小黑子, 13699559988, 安徽省合肥市政务区1001号 ');
INSERT INTO `orders` VALUES (2, '202303026590040', 2, 1, '2023-03-26 14:03:09', 1000, 19, '小黑子1号, 13899669988, 安徽省合肥市 ');
INSERT INTO `orders` VALUES (3, '202303026054733', 1, 1, '2023-03-26 15:00:54', 500, 19, '小黑子1号, 13899669988, 安徽省合肥市 ');
INSERT INTO `orders` VALUES (4, '202303026060426', 2, 1, '2023-03-26 15:01:00', 1000, 19, '小黑子1号, 13899669988, 安徽省合肥市 ');
INSERT INTO `orders` VALUES (5, '202303026159411', 1, 1, '2023-03-26 15:02:39', 500, 19, '小黑子1号, 13899669988, 安徽省合肥市 ');

-- ----------------------------
-- Table structure for praise
-- ----------------------------
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `fid` int(11) NULL DEFAULT NULL COMMENT '模块内容id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '点赞时间',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type`(`type`, `fid`, `user_id`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of praise
-- ----------------------------
INSERT INTO `praise` VALUES (52, 'dynamic', 17, 19, '2023-03-25 13:43:53', 0);
INSERT INTO `praise` VALUES (53, 'dynamic', 18, 18, '2023-03-26 09:34:12', 0);
INSERT INTO `praise` VALUES (54, 'dynamic', 16, 18, '2023-03-26 09:56:47', 0);
INSERT INTO `praise` VALUES (55, 'dynamic', 17, 18, '2023-03-26 09:56:53', 0);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编码',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `deleted` int(11) NULL DEFAULT 0 COMMENT '删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `c_d`(`code`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'user', 'user', 'icon', 0);
INSERT INTO `sys_dict` VALUES (2, 'message', 'message', 'icon', 0);
INSERT INTO `sys_dict` VALUES (3, 'menu', 'menu', 'icon', 0);
INSERT INTO `sys_dict` VALUES (4, 'grid', 'grid', 'icon', 0);
INSERT INTO `sys_dict` VALUES (5, 'house', 'house', 'icon', 0);

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名',
  `size` bigint(20) NULL DEFAULT NULL COMMENT '大小',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '访问链接',
  `md5` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件摘要',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '存储地址',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '软删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (14, 'beer.jpg', 13289, 'jpg', 'http://localhost:9090/file/download/2049d91719af4ecb8a5604d0e4e50f63.jpg', '35977e7dc2159a734f3c81de460e4b8d', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/2049d91719af4ecb8a5604d0e4e50f63.jpg', 0, '2023-02-04 11:37:40', '2023-02-04 11:37:40');
INSERT INTO `sys_file` VALUES (15, 'beer.jpg', 13289, 'jpg', 'http://localhost:9090/file/download/2049d91719af4ecb8a5604d0e4e50f63.jpg', '35977e7dc2159a734f3c81de460e4b8d', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/2049d91719af4ecb8a5604d0e4e50f63.jpg', 0, '2023-02-04 11:37:58', '2023-02-04 11:37:58');
INSERT INTO `sys_file` VALUES (16, 'beer.jpg', 13289, 'jpg', 'http://localhost:9090/file/download/2049d91719af4ecb8a5604d0e4e50f63.jpg', '35977e7dc2159a734f3c81de460e4b8d', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/2049d91719af4ecb8a5604d0e4e50f63.jpg', 0, '2023-02-04 11:38:33', '2023-02-04 11:38:33');
INSERT INTO `sys_file` VALUES (17, 'dog.jpg', 63308, 'jpg', 'http://localhost:9090/file/download/46a791c6ebd74972a9b761d137d77397.jpg', '698f208b46b5b780a231593517b6b26e', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/46a791c6ebd74972a9b761d137d77397.jpg', 0, '2023-02-04 13:28:30', '2023-02-04 13:28:30');
INSERT INTO `sys_file` VALUES (18, 'QQ截图20220521171636.png', 269788, 'png', 'http://localhost:9090/file/download/12e4dd9a53da43ab99e2559793b833a1.png', '85c90d261ac69c13bf4a1d2ed7898e52', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/12e4dd9a53da43ab99e2559793b833a1.png', 0, '2023-02-04 13:31:58', '2023-02-04 13:31:58');
INSERT INTO `sys_file` VALUES (19, 'QQ截图20221123205241.png', 88397, 'png', 'http://localhost:9090/file/download/c852ac64fd9440efa739f59d092fa8e9.png', '5851f34ce75540e33f95e224ee03d268', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/c852ac64fd9440efa739f59d092fa8e9.png', 0, '2023-02-04 13:32:01', '2023-02-04 13:32:01');
INSERT INTO `sys_file` VALUES (20, 'QQ截图20220521171636.png', 269788, 'png', 'http://localhost:9090/file/download/12e4dd9a53da43ab99e2559793b833a1.png', '85c90d261ac69c13bf4a1d2ed7898e52', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/12e4dd9a53da43ab99e2559793b833a1.png', 0, '2023-02-04 13:32:31', '2023-02-04 13:32:31');
INSERT INTO `sys_file` VALUES (21, 'c1b4644290f8421fb31d1cde90364ec1.webp', 49510, 'webp', 'http://localhost:9090/file/download/dd79ba9edcf149c086737e7c11ae91b8.webp', 'ee4b25e9cdd41506dae9018a4f615f12', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/dd79ba9edcf149c086737e7c11ae91b8.webp', 0, '2023-02-04 13:33:52', '2023-02-04 13:33:52');
INSERT INTO `sys_file` VALUES (22, 'ab8ea261a9b6467d8f5827e208fc25c0.pdf', 821746, 'pdf', 'http://localhost:9090/file/download/e322e7951e684f6cb4d8e11860cc23c0.pdf', '4c96cd3aa19642e7eaf655df981e379e', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/e322e7951e684f6cb4d8e11860cc23c0.pdf', 0, '2023-02-04 13:35:29', '2023-02-04 13:35:29');
INSERT INTO `sys_file` VALUES (23, '0e2fec37cf0241f0ac82db224f7e9093.png', 455277, 'png', 'http://localhost:9090/file/download/8ddfe75750d446228539750cf83cc5e1.png', '22a706b36b213562544aa8041bdb0b22', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/8ddfe75750d446228539750cf83cc5e1.png', 0, '2023-02-04 13:36:12', '2023-02-04 13:36:12');
INSERT INTO `sys_file` VALUES (24, 'BQ20220823668193_qrcode.jpg', 21129, 'jpg', 'http://localhost:9090/file/download/b6ab2e46470f4e8ead02eb9c1d8cab73.jpg', '33d7e6c0870242b060b074426a16382c', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/b6ab2e46470f4e8ead02eb9c1d8cab73.jpg', 0, '2023-02-04 13:36:47', '2023-02-04 13:36:47');
INSERT INTO `sys_file` VALUES (25, '6aa9b8f78cba45329df8849575c90837.png', 10675, 'png', 'http://localhost:9090/file/download/dfcf5f36d649469393f9a0cff3a9adbd.png', '03836b3799ae0fa0870d370e28582d19', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/dfcf5f36d649469393f9a0cff3a9adbd.png', 0, '2023-02-04 13:39:40', '2023-02-04 13:39:40');
INSERT INTO `sys_file` VALUES (26, '9fb235cd4e8d41c79802b4f3d7c23895.jpg', 13289, 'jpg', 'http://localhost:9090/file/download/2049d91719af4ecb8a5604d0e4e50f63.jpg', '35977e7dc2159a734f3c81de460e4b8d', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/2049d91719af4ecb8a5604d0e4e50f63.jpg', 0, '2023-02-04 13:39:49', '2023-02-04 13:39:49');
INSERT INTO `sys_file` VALUES (27, 'dcd050fbd8ec4c45920d43ba15a493bb.png', 455277, 'png', 'http://localhost:9090/file/download/8ddfe75750d446228539750cf83cc5e1.png', '22a706b36b213562544aa8041bdb0b22', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/8ddfe75750d446228539750cf83cc5e1.png', 0, '2023-02-04 13:40:13', '2023-02-04 13:40:13');
INSERT INTO `sys_file` VALUES (28, 'c1b4644290f8421fb31d1cde90364ec1.webp', 49510, 'webp', 'http://localhost:9090/file/download/dd79ba9edcf149c086737e7c11ae91b8.webp', 'ee4b25e9cdd41506dae9018a4f615f12', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/dd79ba9edcf149c086737e7c11ae91b8.webp', 0, '2023-02-04 13:41:24', '2023-02-04 13:41:24');
INSERT INTO `sys_file` VALUES (29, '新建 PPT 演示文稿.ppt', 41984, 'ppt', 'http://localhost:9090/file/download/b3ebb01a0d8946e6bee7c6c326d789fd.ppt', '67babc8456f7bde3e137aa3ada775487', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/b3ebb01a0d8946e6bee7c6c326d789fd.ppt', 0, '2023-02-04 15:29:35', '2023-02-04 15:29:35');
INSERT INTO `sys_file` VALUES (30, 'QQ截图20221201222714.png', 121662, 'png', 'http://localhost:9090/file/download/473224461f4d418fbeaeb6c9083543ae.png', '5fff63c4999b440a0a39fdfd6510c3dd', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/473224461f4d418fbeaeb6c9083543ae.png', 0, '2023-02-04 15:30:09', '2023-02-04 15:30:09');
INSERT INTO `sys_file` VALUES (31, 'ds.png', 499437, 'png', 'http://localhost:9090/file/download/f1ada57ace804697832d18c19c9b8d75.png', 'fcef406f63714fd1559d16cecda654b6', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/f1ada57ace804697832d18c19c9b8d75.png', 0, '2023-02-04 15:30:13', '2023-02-04 15:30:13');
INSERT INTO `sys_file` VALUES (32, '微信截图_20220806192019.png', 41695, 'png', 'http://localhost:9090/file/download/45e112ffda2c4db4bd55771742c4de8f.png', '1b362fca0adc034ff5fdfc49d4e320b1', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/45e112ffda2c4db4bd55771742c4de8f.png', 0, '2023-02-04 15:30:53', '2023-02-04 15:30:53');
INSERT INTO `sys_file` VALUES (33, '微信截图_20220706191248.png', 974309, 'png', 'http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png', 'd0af07d4be66ce7c392a22fb0f1ba659', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/cce151d3972b4780acf5a115f6a55f48.png', 0, '2023-02-04 15:30:57', '2023-02-04 15:30:57');
INSERT INTO `sys_file` VALUES (34, 'QQ截图20220523170916.png', 1118, 'png', 'http://localhost:9090/file/download/61ce3f7364d341f1a7b55bda746f5abe.png', '8841b08ce04ed9d6426b8c0fea829e70', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/61ce3f7364d341f1a7b55bda746f5abe.png', 0, '2023-02-04 15:31:03', '2023-02-04 15:31:03');
INSERT INTO `sys_file` VALUES (35, 'nacos服务.png', 44960, 'png', 'http://localhost:9090/file/download/eed68ab96ea14cfdb4f082867cc36a0e.png', '0f34d6534bbc23b0d9d30483d739b791', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/eed68ab96ea14cfdb4f082867cc36a0e.png', 0, '2023-02-04 15:31:20', '2023-02-04 15:31:20');
INSERT INTO `sys_file` VALUES (36, '微信截图_20220806192019.png', 41695, 'png', 'http://localhost:9090/file/download/45e112ffda2c4db4bd55771742c4de8f.png', '1b362fca0adc034ff5fdfc49d4e320b1', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/45e112ffda2c4db4bd55771742c4de8f.png', 0, '2023-02-04 15:33:19', '2023-02-04 15:33:19');
INSERT INTO `sys_file` VALUES (37, '新建 PPT 演示文稿.ppt', 20992, 'ppt', 'http://localhost:9090/file/download/1ed9786a139b4b409d319192a3ae6942.ppt', '5d7d0eb6696fb3e37a6dfeeccff006ab', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/1ed9786a139b4b409d319192a3ae6942.ppt', 0, '2023-02-04 15:33:41', '2023-02-04 15:33:41');
INSERT INTO `sys_file` VALUES (38, 'QQ截图20220909195631.png', 75987, 'png', 'http://localhost:9090/file/download/91ef247cc585445f8ac6b6a55bba070c.png', '1a549f80ababc51b0c63b5ca67c74c58', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/91ef247cc585445f8ac6b6a55bba070c.png', 0, '2023-02-04 15:33:51', '2023-02-04 15:33:51');
INSERT INTO `sys_file` VALUES (39, 'Nacos.png', 78968, 'png', 'http://localhost:9090/file/download/1cd464179e9741d79d0ff0e9233b3666.png', '09540432f77549b7c06111a8ae987a66', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/1cd464179e9741d79d0ff0e9233b3666.png', 0, '2023-02-04 15:35:38', '2023-02-04 15:35:38');
INSERT INTO `sys_file` VALUES (40, '微信截图_20220706191248.png', 974309, 'png', 'http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png', 'd0af07d4be66ce7c392a22fb0f1ba659', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/cce151d3972b4780acf5a115f6a55f48.png', 0, '2023-02-04 15:45:25', '2023-02-04 15:45:25');
INSERT INTO `sys_file` VALUES (41, '微信截图_20220616213432.png', 142891, 'png', 'http://localhost:9090/file/download/71cbf05d68d24634b098d3273d1fd8af.png', '76df935870440427fa9e809ff3abfbe6', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/71cbf05d68d24634b098d3273d1fd8af.png', 0, '2023-02-04 15:45:33', '2023-02-04 15:45:33');
INSERT INTO `sys_file` VALUES (42, '微信截图_20220818192957.png', 90105, 'png', 'http://localhost:9090/file/download/a359454194cc41378db71379950ee60b.png', '71c3963fb83637917497bd55a7d7809f', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/a359454194cc41378db71379950ee60b.png', 0, '2023-02-04 16:01:51', '2023-02-04 16:01:51');
INSERT INTO `sys_file` VALUES (43, '微信截图_20220706191248.png', 974309, 'png', 'http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png', 'd0af07d4be66ce7c392a22fb0f1ba659', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/cce151d3972b4780acf5a115f6a55f48.png', 0, '2023-02-04 22:01:37', '2023-02-04 22:01:37');
INSERT INTO `sys_file` VALUES (44, '足球.png', 10675, 'png', 'http://localhost:9090/file/download/dfcf5f36d649469393f9a0cff3a9adbd.png', '03836b3799ae0fa0870d370e28582d19', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/dfcf5f36d649469393f9a0cff3a9adbd.png', 0, '2023-02-04 22:04:22', '2023-02-04 22:04:22');
INSERT INTO `sys_file` VALUES (45, 'Nacos.png', 78968, 'png', 'http://localhost:9090/file/download/1cd464179e9741d79d0ff0e9233b3666.png', '09540432f77549b7c06111a8ae987a66', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/1cd464179e9741d79d0ff0e9233b3666.png', 0, '2023-02-04 22:16:49', '2023-02-04 22:16:49');
INSERT INTO `sys_file` VALUES (46, 'QQ截图20220612201918.png', 463169, 'png', 'http://localhost:9090/file/download/9969de9cfcea45fb98caf185060e88de.png', '69759e96a1c92263b185d48d50e3396a', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/9969de9cfcea45fb98caf185060e88de.png', 0, '2023-02-04 22:17:36', '2023-02-04 22:17:36');
INSERT INTO `sys_file` VALUES (47, 'courgette.log', 0, 'log', 'http://localhost:9090/file/download/0ee054a700b344b3b555cb69e8517928.docx', 'd41d8cd98f00b204e9800998ecf8427e', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/0ee054a700b344b3b555cb69e8517928.docx', 0, '2023-02-04 22:17:51', '2023-02-04 22:17:51');
INSERT INTO `sys_file` VALUES (48, '新建 PPT 演示文稿.ppt', 41984, 'ppt', 'http://localhost:9090/file/download/b3ebb01a0d8946e6bee7c6c326d789fd.ppt', '67babc8456f7bde3e137aa3ada775487', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/b3ebb01a0d8946e6bee7c6c326d789fd.ppt', 0, '2023-02-04 22:18:19', '2023-02-04 22:18:19');
INSERT INTO `sys_file` VALUES (49, 'ssss.docx', 10071, 'docx', 'http://localhost:9090/file/download/3525cc2c23c444218307bf42ddbd44d8.docx', '49e0ca3aefb9be63647c7dd009be5db3', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/3525cc2c23c444218307bf42ddbd44d8.docx', 0, '2023-02-04 22:19:15', '2023-02-04 22:19:15');
INSERT INTO `sys_file` VALUES (50, 'ssss.doc', 10071, 'doc', 'http://localhost:9090/file/download/3525cc2c23c444218307bf42ddbd44d8.docx', '49e0ca3aefb9be63647c7dd009be5db3', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/3525cc2c23c444218307bf42ddbd44d8.docx', 0, '2023-02-04 22:20:04', '2023-02-04 22:20:04');
INSERT INTO `sys_file` VALUES (51, 'ssss.doc', 10103, 'doc', 'http://localhost:9090/file/download/04c8e6b510d84917bd8dd948dd316843.doc', '4a2d1ef17edd9aac3027c3b6aba00d51', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/04c8e6b510d84917bd8dd948dd316843.doc', 0, '2023-02-04 22:20:25', '2023-02-04 22:20:25');
INSERT INTO `sys_file` VALUES (52, '5d14421163796-big.jpg', 4716, 'jpg', 'http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg', 'dd1100e1b58e3a834802ddb5ead2623b', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg', 0, '2023-02-11 21:25:45', '2023-02-11 21:25:45');
INSERT INTO `sys_file` VALUES (53, 'QQ截图20230211105428.png', 302241, 'png', 'http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png', 'adfd0ea8a0f4d2e4ed589b88b480b523', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/dd566990afa541cfb241203e83e8c651.png', 0, '2023-02-11 22:25:41', '2023-02-11 22:25:41');
INSERT INTO `sys_file` VALUES (54, 'QQ截图20230211105532.png', 166647, 'png', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 'bd74ba46e1481611bdccaeb29791e12e', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/244a4821658f493db9d304a2000c1eca.png', 0, '2023-02-11 22:25:44', '2023-02-11 22:25:44');
INSERT INTO `sys_file` VALUES (55, '1213123213.jpg', 10458, 'jpg', 'http://localhost:9090/file/download/80640a374c144fd2bd8d94c122fc1d79.jpg', '75ea040ecc58b96bc2f5290daf215105', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/80640a374c144fd2bd8d94c122fc1d79.jpg', 0, '2023-02-11 22:30:48', '2023-02-11 22:30:48');
INSERT INTO `sys_file` VALUES (56, 'v2-66672db58d976e6e095e08a180d1d530_r.jpg', 82790, 'jpg', 'http://localhost:9090/file/download/15b95fcef7be42e099ccdd831c688202.jpg', '0d4423a175ed5ac1c689c952b408b6bc', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/15b95fcef7be42e099ccdd831c688202.jpg', 0, '2023-02-11 22:30:51', '2023-02-11 22:30:51');
INSERT INTO `sys_file` VALUES (57, 'QQ截图20230211105532.png', 166647, 'png', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 'bd74ba46e1481611bdccaeb29791e12e', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/244a4821658f493db9d304a2000c1eca.png', 0, '2023-02-11 22:39:57', '2023-02-11 22:39:57');
INSERT INTO `sys_file` VALUES (58, 'QQ截图20230211105625.png', 44382, 'png', 'http://localhost:9090/file/download/e432e1f8bd2a42269f6cc1ac11cfd557.png', 'd5a45b2485746400308bbe52904a7069', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/e432e1f8bd2a42269f6cc1ac11cfd557.png', 0, '2023-02-11 22:39:59', '2023-02-11 22:39:59');
INSERT INTO `sys_file` VALUES (59, 'QQ截图20230211105428.png', 302241, 'png', 'http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png', 'adfd0ea8a0f4d2e4ed589b88b480b523', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/dd566990afa541cfb241203e83e8c651.png', 0, '2023-02-18 22:31:43', '2023-02-18 22:31:43');
INSERT INTO `sys_file` VALUES (60, 'QQ截图20230211105625.png', 44382, 'png', 'http://localhost:9090/file/download/e432e1f8bd2a42269f6cc1ac11cfd557.png', 'd5a45b2485746400308bbe52904a7069', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/e432e1f8bd2a42269f6cc1ac11cfd557.png', 0, '2023-02-18 22:33:42', '2023-02-18 22:33:42');
INSERT INTO `sys_file` VALUES (61, 'QQ截图20230211105532.png', 166647, 'png', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 'bd74ba46e1481611bdccaeb29791e12e', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/244a4821658f493db9d304a2000c1eca.png', 0, '2023-02-18 22:34:21', '2023-02-18 22:34:21');
INSERT INTO `sys_file` VALUES (62, 'QQ截图20230211105532.png', 166647, 'png', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 'bd74ba46e1481611bdccaeb29791e12e', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/244a4821658f493db9d304a2000c1eca.png', 0, '2023-02-18 22:35:30', '2023-02-18 22:35:30');
INSERT INTO `sys_file` VALUES (63, 'QQ截图20230211105428.png', 302241, 'png', 'http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png', 'adfd0ea8a0f4d2e4ed589b88b480b523', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/dd566990afa541cfb241203e83e8c651.png', 0, '2023-02-18 22:36:54', '2023-02-18 22:36:54');
INSERT INTO `sys_file` VALUES (64, 'beer.jpg', 13289, 'jpg', 'http://localhost:9090/file/download/2049d91719af4ecb8a5604d0e4e50f63.jpg', '35977e7dc2159a734f3c81de460e4b8d', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/2049d91719af4ecb8a5604d0e4e50f63.jpg', 0, '2023-02-18 22:47:51', '2023-02-18 22:47:51');
INSERT INTO `sys_file` VALUES (65, 'QQ截图20230211105532.png', 166647, 'png', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 'bd74ba46e1481611bdccaeb29791e12e', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/244a4821658f493db9d304a2000c1eca.png', 0, '2023-02-18 23:06:23', '2023-02-18 23:06:23');
INSERT INTO `sys_file` VALUES (66, 'QQ截图20230211105428.png', 302241, 'png', 'http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png', 'adfd0ea8a0f4d2e4ed589b88b480b523', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/dd566990afa541cfb241203e83e8c651.png', 0, '2023-02-18 23:06:45', '2023-02-18 23:06:45');
INSERT INTO `sys_file` VALUES (67, 'QQ截图20230211105532.png', 166647, 'png', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 'bd74ba46e1481611bdccaeb29791e12e', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/244a4821658f493db9d304a2000c1eca.png', 0, '2023-02-18 23:09:01', '2023-02-18 23:09:01');
INSERT INTO `sys_file` VALUES (68, 'QQ截图20230211105428.png', 302241, 'png', 'http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png', 'adfd0ea8a0f4d2e4ed589b88b480b523', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/dd566990afa541cfb241203e83e8c651.png', 0, '2023-02-18 23:09:29', '2023-02-18 23:09:29');
INSERT INTO `sys_file` VALUES (69, 'JAVA核心知识点整理.pdf', 10922015, 'pdf', 'http://localhost:9090/file/download/934931f5ab274096b6222150cc674822.pdf', 'cc26057c92f30401abae727d442d5b33', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/934931f5ab274096b6222150cc674822.pdf', 0, '2023-02-19 10:30:37', '2023-02-19 10:30:37');
INSERT INTO `sys_file` VALUES (70, '测试.docx', 0, 'docx', 'http://localhost:9090/file/download/0ee054a700b344b3b555cb69e8517928.docx', 'd41d8cd98f00b204e9800998ecf8427e', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/0ee054a700b344b3b555cb69e8517928.docx', 0, '2023-02-19 10:31:26', '2023-02-19 10:31:26');
INSERT INTO `sys_file` VALUES (71, '测试.docx', 0, 'docx', 'http://localhost:9090/file/download/0ee054a700b344b3b555cb69e8517928.docx', 'd41d8cd98f00b204e9800998ecf8427e', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/0ee054a700b344b3b555cb69e8517928.docx', 0, '2023-02-19 10:31:52', '2023-02-19 10:31:52');
INSERT INTO `sys_file` VALUES (72, 'Java开发手册-嵩山版.pdf', 1580978, 'pdf', 'http://localhost:9090/file/download/e732d71cae9842fe849fbfe6ca96d915.pdf', '0b1f94339d5757ed196198f70491cc25', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/e732d71cae9842fe849fbfe6ca96d915.pdf', 0, '2023-02-19 10:32:11', '2023-02-19 10:32:11');
INSERT INTO `sys_file` VALUES (73, 'JAVA核心知识点整理.pdf', 10922015, 'pdf', 'http://localhost:9090/file/download/934931f5ab274096b6222150cc674822.pdf', 'cc26057c92f30401abae727d442d5b33', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/934931f5ab274096b6222150cc674822.pdf', 0, '2023-02-19 10:33:10', '2023-02-19 10:33:10');
INSERT INTO `sys_file` VALUES (74, '测试.docx', 0, 'docx', 'http://localhost:9090/file/download/0ee054a700b344b3b555cb69e8517928.docx', 'd41d8cd98f00b204e9800998ecf8427e', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/0ee054a700b344b3b555cb69e8517928.docx', 0, '2023-02-19 10:56:45', '2023-02-19 10:56:45');
INSERT INTO `sys_file` VALUES (75, '封面@凡科快图.png', 392587, 'png', 'http://localhost:9090/file/download/a75a2983d16d4936afaf2c1f48a4483c.png', 'd9edc6e52d72029994a7fb495e25bde7', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/a75a2983d16d4936afaf2c1f48a4483c.png', 0, '2023-02-19 10:57:05', '2023-02-19 10:57:05');
INSERT INTO `sys_file` VALUES (76, 'QQ截图20230211105532.png', 166647, 'png', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 'bd74ba46e1481611bdccaeb29791e12e', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/244a4821658f493db9d304a2000c1eca.png', 0, '2023-02-19 10:57:18', '2023-02-19 10:57:18');
INSERT INTO `sys_file` VALUES (77, 'QQ截图20230211105428.png', 302241, 'png', 'http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png', 'adfd0ea8a0f4d2e4ed589b88b480b523', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/dd566990afa541cfb241203e83e8c651.png', 0, '2023-02-19 21:15:15', '2023-02-19 21:15:15');
INSERT INTO `sys_file` VALUES (78, 'weibo.webp', 12860, 'webp', 'http://localhost:9090/file/download/66faf9a9ef34404991add03ffa9d8e59.webp', '06805213683f2d30e88ee5e567cdf6d2', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/66faf9a9ef34404991add03ffa9d8e59.webp', 0, '2023-02-19 21:15:19', '2023-02-19 21:15:19');
INSERT INTO `sys_file` VALUES (79, 'QQ截图20230222215525.png', 780108, 'png', 'http://localhost:9090/file/download/1e78e65c7f7d4efb9291922cc6eb0d4a.png', 'cbb996971d936b949b1eab6098306e45', 'D:\\毕设\\演示\\vue3代码生成器演示\\2.0演示\\代码生成器V2.0\\boot-vue3-master/files/1e78e65c7f7d4efb9291922cc6eb0d4a.png', 0, '2023-02-28 22:03:47', '2023-02-28 22:03:47');
INSERT INTO `sys_file` VALUES (80, 'QQ截图20230211105428.png', 302241, 'png', 'http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png', 'adfd0ea8a0f4d2e4ed589b88b480b523', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/dd566990afa541cfb241203e83e8c651.png', 0, '2023-02-28 22:03:55', '2023-02-28 22:03:55');
INSERT INTO `sys_file` VALUES (81, 'QQ截图20230228145820.png', 416718, 'png', 'http://localhost:9090/file/download/66eb327af1b14ecc8995daec10400b7f.png', 'd9a938fbb5de9db28296d72e5d42bb7a', 'D:\\毕设\\演示\\vue3代码生成器演示\\2.0演示\\代码生成器V2.0\\boot-vue3-master/files/66eb327af1b14ecc8995daec10400b7f.png', 0, '2023-02-28 22:04:06', '2023-02-28 22:04:06');
INSERT INTO `sys_file` VALUES (82, 'QQ截图20230211105532.png', 166647, 'png', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 'bd74ba46e1481611bdccaeb29791e12e', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/244a4821658f493db9d304a2000c1eca.png', 0, '2023-02-28 22:13:51', '2023-02-28 22:13:51');
INSERT INTO `sys_file` VALUES (83, 'QQ截图20230228143601.png', 55422, 'png', 'http://localhost:9090/file/download/c9376c9b6adb4a20a9c7b17bcfd3a515.png', 'c0f221ce4f61f589be8fc4e9a39f5d33', 'D:\\毕设\\演示\\vue3代码生成器演示\\校园交友平台\\boot-vue3-master/files/c9376c9b6adb4a20a9c7b17bcfd3a515.png', 0, '2023-02-28 22:13:55', '2023-02-28 22:13:55');
INSERT INTO `sys_file` VALUES (84, '4797370-1551194061493-amx7_874-874.jpg', 94382, 'jpg', 'http://localhost:9090/file/download/f3ffc202dd3e47888914ec6db3fcc093.jpg', '96e20d484e9829f32721fed84c94c6bc', 'D:\\毕设\\演示\\vue3代码生成器演示\\校园交友平台\\boot-vue3-master/files/f3ffc202dd3e47888914ec6db3fcc093.jpg', 0, '2023-03-18 09:26:34', '2023-03-18 09:26:34');
INSERT INTO `sys_file` VALUES (85, '122121211.jpg', 34718, 'jpg', 'http://localhost:9090/file/download/45a427d2ece84e0daa1d864e8f4bb713.jpg', '06baad89133eedfdc4a7cd08001f6699', 'D:\\毕设\\演示\\vue3代码生成器演示\\校园交友平台\\boot-vue3-master/files/45a427d2ece84e0daa1d864e8f4bb713.jpg', 0, '2023-03-18 09:26:39', '2023-03-18 09:26:39');
INSERT INTO `sys_file` VALUES (86, 'QQ截图20230211105532.png', 166647, 'png', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 'bd74ba46e1481611bdccaeb29791e12e', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/244a4821658f493db9d304a2000c1eca.png', 0, '2023-03-18 09:38:10', '2023-03-18 09:38:10');
INSERT INTO `sys_file` VALUES (87, 'QQ截图20230225163128.png', 158225, 'png', 'http://localhost:9090/file/download/30ab8bc3353645efb8716374b20688cb.png', '13ff6046700f8168de69adf5645f21fa', 'D:\\毕设\\演示\\vue3代码生成器演示\\校园交友平台\\boot-vue3-master/files/30ab8bc3353645efb8716374b20688cb.png', 0, '2023-03-18 09:38:23', '2023-03-18 09:38:23');
INSERT INTO `sys_file` VALUES (88, 'QQ截图20230211105141.png', 716759, 'png', 'http://localhost:9090/file/download/60feae23628c4290ba28d65d6e3a07db.png', 'f651e54654fff989242c7a01ef9092b0', 'D:\\毕设\\演示\\vue3代码生成器演示\\校园交友平台\\boot-vue3-master/files/60feae23628c4290ba28d65d6e3a07db.png', 0, '2023-03-25 09:56:26', '2023-03-25 09:56:26');
INSERT INTO `sys_file` VALUES (89, 'QQ截图20230211105532.png', 166647, 'png', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 'bd74ba46e1481611bdccaeb29791e12e', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/244a4821658f493db9d304a2000c1eca.png', 0, '2023-03-25 09:58:08', '2023-03-25 09:58:08');
INSERT INTO `sys_file` VALUES (90, 'QQ截图20230211105532.png', 166647, 'png', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 'bd74ba46e1481611bdccaeb29791e12e', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/244a4821658f493db9d304a2000c1eca.png', 0, '2023-03-25 11:58:43', '2023-03-25 11:58:43');
INSERT INTO `sys_file` VALUES (91, 'QQ截图20230225163051.png', 271330, 'png', 'http://localhost:9090/file/download/27f7a9a8e1ab4cb38fe4719babb2f8d5.png', '879b76f3edc799dec1d505ff211a2a3f', 'D:\\毕设\\演示\\vue3代码生成器演示\\校园交友平台\\boot-vue3-master/files/27f7a9a8e1ab4cb38fe4719babb2f8d5.png', 0, '2023-03-25 11:58:59', '2023-03-25 11:58:59');
INSERT INTO `sys_file` VALUES (92, 'QQ截图20230228143227.png', 167757, 'png', 'http://localhost:9090/file/download/08a75cd4da794ca98b672411629784f7.png', '46533cbbde288354f73abbf0b33de299', 'D:\\毕设\\演示\\vue3代码生成器演示\\校园交友平台\\boot-vue3-master/files/08a75cd4da794ca98b672411629784f7.png', 0, '2023-03-25 13:47:17', '2023-03-25 13:47:17');
INSERT INTO `sys_file` VALUES (93, 'QQ截图20230228143550.png', 254390, 'png', 'http://localhost:9090/file/download/f97531d34fb441b3becf9158da79e953.png', '974a16c828711f4e29324697b8376c7e', 'D:\\毕设\\演示\\vue3代码生成器演示\\校园交友平台\\boot-vue3-master/files/f97531d34fb441b3becf9158da79e953.png', 0, '2023-03-25 13:47:22', '2023-03-25 13:47:22');
INSERT INTO `sys_file` VALUES (94, 'QQ截图20230228143601.png', 55422, 'png', 'http://localhost:9090/file/download/c9376c9b6adb4a20a9c7b17bcfd3a515.png', 'c0f221ce4f61f589be8fc4e9a39f5d33', 'D:\\毕设\\演示\\vue3代码生成器演示\\校园交友平台\\boot-vue3-master/files/c9376c9b6adb4a20a9c7b17bcfd3a515.png', 0, '2023-03-25 13:47:26', '2023-03-25 13:47:26');
INSERT INTO `sys_file` VALUES (95, 'QQ截图20230324204204.png', 120541, 'png', 'http://localhost:9090/file/download/9ed2f656c90242689ed55b55aa4cb7c9.png', '59544ac59c6f595249feff0346d74e64', 'D:\\毕设\\演示\\vue3代码生成器演示\\校园交友平台\\boot-vue3-master/files/9ed2f656c90242689ed55b55aa4cb7c9.png', 0, '2023-03-26 13:09:51', '2023-03-26 13:09:51');
INSERT INTO `sys_file` VALUES (96, 'QQ截图20230324204327.png', 245745, 'png', 'http://localhost:9090/file/download/31351baf97a943cdaf1489092d937593.png', '76ed52cb0f39a68967e84bf6df3e5459', 'D:\\毕设\\演示\\vue3代码生成器演示\\校园交友平台\\boot-vue3-master/files/31351baf97a943cdaf1489092d937593.png', 0, '2023-03-26 13:11:15', '2023-03-26 13:11:15');
INSERT INTO `sys_file` VALUES (97, 'QQ截图20230324204327.png', 245745, 'png', 'http://localhost:9090/file/download/31351baf97a943cdaf1489092d937593.png', '76ed52cb0f39a68967e84bf6df3e5459', 'D:\\毕设\\演示\\vue3代码生成器演示\\校园交友平台\\boot-vue3-master/files/31351baf97a943cdaf1489092d937593.png', 0, '2023-03-26 13:11:31', '2023-03-26 13:11:31');
INSERT INTO `sys_file` VALUES (98, 'QQ截图20230310185503.png', 1028047, 'png', 'http://localhost:9090/file/download/44de2a1f72444ee7b70f0a2250dda616.png', 'aa69991f85b39b9c7509266dba409cb1', 'D:\\毕设\\演示\\vue3代码生成器演示\\校园交友平台\\boot-vue3-master/files/44de2a1f72444ee7b70f0a2250dda616.png', 0, '2023-03-26 14:59:43', '2023-03-26 14:59:43');
INSERT INTO `sys_file` VALUES (99, 'QQ截图20230310185510.png', 706394, 'png', 'http://localhost:9090/file/download/e5d11ee679f442d9aeb8279319b86a1f.png', '96f24760c4e4fbe5d13818b918193860', 'D:\\毕设\\演示\\vue3代码生成器演示\\校园交友平台\\boot-vue3-master/files/e5d11ee679f442d9aeb8279319b86a1f.png', 0, '2023-03-26 14:59:49', '2023-03-26 14:59:49');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '入参',
  `output` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '出参',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'url',
  `duration` int(11) NULL DEFAULT NULL COMMENT '执行时间',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'IP',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '软删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 420 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (4, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '返回状态码：200', 'http://localhost:9090/login', 675, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 17:00:12', 0);
INSERT INTO `sys_log` VALUES (5, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 769, '112.32.138.68', '安徽省合肥市', '', '2023-02-19 17:02:50', 0);
INSERT INTO `sys_log` VALUES (6, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 17:02:54', 0);
INSERT INTO `sys_log` VALUES (7, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 107, '112.32.138.68', '安徽省合肥市', '', '2023-02-19 17:03:16', 0);
INSERT INTO `sys_log` VALUES (8, '编辑权限', '{\"id\":360,\"名称\":\"日志管理\",\"路径\":\"log\",\"顺序\":1,\"图标\":\"grid\",\"页面路径\":\"Log\",\"父级id\":1,\"类型\":2,\"逻辑删除\":0,\"更新时间\":1676797462449,\"children\":[{\"id\":361,\"名称\":\"系统日志查询\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"log.list\",\"父级id\":360,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":362,\"名称\":\"系统日志新增\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"log.add\",\"父级id\":360,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":363,\"名称\":\"系统日志导入\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"log.import\",\"父级id\":360,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":364,\"名称\":\"系统日志导出\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"log.export\",\"父级id\":360,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":365,\"名称\":\"批量删除\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"log.deleteBatch\",\"父级id\":360,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":366,\"名称\":\"系统日志编辑\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"log.edit\",\"父级id\":360,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":367,\"名称\":\"系统日志删除\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"log.delete\",\"父级id\":360,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false}],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 15, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 17:04:23', 0);
INSERT INTO `sys_log` VALUES (9, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 17:04:29', 0);
INSERT INTO `sys_log` VALUES (10, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 94, '112.32.138.68', '安徽省合肥市', '', '2023-02-19 17:04:33', 0);
INSERT INTO `sys_log` VALUES (11, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 17:12:05', 0);
INSERT INTO `sys_log` VALUES (12, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 77, '112.32.138.68', '安徽省合肥市', '', '2023-02-19 17:13:27', 0);
INSERT INTO `sys_log` VALUES (13, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 869, '112.32.138.68', '安徽省合肥市', '', '2023-02-19 20:33:02', 0);
INSERT INTO `sys_log` VALUES (14, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":19,\"用户名\":\"gbb\",\"密码\":\"$2a$10$XmgagEBh2jlERi9JTAP3iub88e022RXMovXlV3ea/ZQbMi/.Yd3Ae\",\"昵称\":\"Ikun小黑子专用号\",\"邮箱\":\"ikun@163.com\",\"地址\":\"蔡徐坤北京分坤\",\"用户唯一id\":\"f3e75978695847e59c7c575d8379afa3\",\"头像\":\"http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1676121934000,\"updateTime\":1676121934000,\"角色\":\"USER\"},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJmM2U3NTk3ODY5NTg0N2U1OWM3YzU3NWQ4Mzc5YWZhMyIsInJuU3RyIjoiOERleThoYm1RT1dscUs0N0RVY2VWM29sQVBsdGdZYVcifQ.-nUk51wSNf4BvacXyUWpa09aEXq93kGPpnK0rLjwb5Y\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675170180000,\"更新时间\":1675170180000,\"children\":[],\"是否隐藏\":false},{\"id\":187,\"名称\":\"在线聊天室\",\"路径\":\"im\",\"顺序\":1,\"图标\":\"chatRound\",\"页面路径\":\"IM\",\"类型\":2,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 110, '112.32.138.68', '安徽省合肥市', '', '2023-02-19 20:37:48', 0);
INSERT INTO `sys_log` VALUES (15, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":19,\"用户名\":\"gbb\",\"密码\":\"$2a$10$XmgagEBh2jlERi9JTAP3iub88e022RXMovXlV3ea/ZQbMi/.Yd3Ae\",\"昵称\":\"Ikun小黑子专用号\",\"邮箱\":\"ikun@163.com\",\"地址\":\"蔡徐坤北京分坤\",\"用户唯一id\":\"f3e75978695847e59c7c575d8379afa3\",\"头像\":\"http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1676121934000,\"updateTime\":1676121934000,\"角色\":\"USER\"},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJmM2U3NTk3ODY5NTg0N2U1OWM3YzU3NWQ4Mzc5YWZhMyIsInJuU3RyIjoiOERleThoYm1RT1dscUs0N0RVY2VWM29sQVBsdGdZYVcifQ.-nUk51wSNf4BvacXyUWpa09aEXq93kGPpnK0rLjwb5Y\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675170180000,\"更新时间\":1675170180000,\"children\":[],\"是否隐藏\":false},{\"id\":187,\"名称\":\"在线聊天室\",\"路径\":\"im\",\"顺序\":1,\"图标\":\"chatRound\",\"页面路径\":\"IM\",\"类型\":2,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 92, '112.32.138.68', '安徽省合肥市', 'gbb', '2023-02-19 20:37:55', 0);
INSERT INTO `sys_log` VALUES (16, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":19,\"用户名\":\"gbb\",\"密码\":\"$2a$10$XmgagEBh2jlERi9JTAP3iub88e022RXMovXlV3ea/ZQbMi/.Yd3Ae\",\"昵称\":\"Ikun小黑子专用号\",\"邮箱\":\"ikun@163.com\",\"地址\":\"蔡徐坤北京分坤\",\"用户唯一id\":\"f3e75978695847e59c7c575d8379afa3\",\"头像\":\"http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1676121934000,\"updateTime\":1676121934000,\"角色\":\"USER\"},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJmM2U3NTk3ODY5NTg0N2U1OWM3YzU3NWQ4Mzc5YWZhMyIsInJuU3RyIjoiOERleThoYm1RT1dscUs0N0RVY2VWM29sQVBsdGdZYVcifQ.-nUk51wSNf4BvacXyUWpa09aEXq93kGPpnK0rLjwb5Y\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675170180000,\"更新时间\":1675170180000,\"children\":[],\"是否隐藏\":false},{\"id\":187,\"名称\":\"在线聊天室\",\"路径\":\"im\",\"顺序\":1,\"图标\":\"chatRound\",\"页面路径\":\"IM\",\"类型\":2,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 90, '112.32.138.68', '安徽省合肥市', 'gbb', '2023-02-19 20:38:06', 0);
INSERT INTO `sys_log` VALUES (17, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":19,\"用户名\":\"gbb\",\"密码\":\"$2a$10$XmgagEBh2jlERi9JTAP3iub88e022RXMovXlV3ea/ZQbMi/.Yd3Ae\",\"昵称\":\"Ikun小黑子专用号\",\"邮箱\":\"ikun@163.com\",\"地址\":\"蔡徐坤北京分坤\",\"用户唯一id\":\"f3e75978695847e59c7c575d8379afa3\",\"头像\":\"http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1676121934000,\"updateTime\":1676121934000,\"角色\":\"USER\"},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJmM2U3NTk3ODY5NTg0N2U1OWM3YzU3NWQ4Mzc5YWZhMyIsInJuU3RyIjoiOERleThoYm1RT1dscUs0N0RVY2VWM29sQVBsdGdZYVcifQ.-nUk51wSNf4BvacXyUWpa09aEXq93kGPpnK0rLjwb5Y\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675170180000,\"更新时间\":1675170180000,\"children\":[],\"是否隐藏\":false},{\"id\":187,\"名称\":\"在线聊天室\",\"路径\":\"im\",\"顺序\":1,\"图标\":\"chatRound\",\"页面路径\":\"IM\",\"类型\":2,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 93, '112.32.138.68', '安徽省合肥市', 'gbb', '2023-02-19 20:38:22', 0);
INSERT INTO `sys_log` VALUES (18, '编辑角色', '{\"id\":3,\"名称\":\"普通用户\",\"唯一标识\":\"USER\",\"逻辑删除\":0,\"创建时间\":1673869841000,\"更新时间\":1673869841000,\"permissionIds\":[208,12,187,209]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 16, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 20:38:53', 0);
INSERT INTO `sys_log` VALUES (19, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 93, '112.32.138.68', '安徽省合肥市', 'gbb', '2023-02-19 20:39:00', 0);
INSERT INTO `sys_log` VALUES (20, '编辑角色', '{\"id\":3,\"名称\":\"普通用户\",\"唯一标识\":\"USER\",\"逻辑删除\":0,\"创建时间\":1673869841000,\"更新时间\":1673869841000,\"permissionIds\":[208,12,187,195,198,209]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 14, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 20:39:15', 0);
INSERT INTO `sys_log` VALUES (21, '编辑角色', '{\"id\":3,\"名称\":\"普通用户\",\"唯一标识\":\"USER\",\"逻辑删除\":0,\"创建时间\":1673869841000,\"更新时间\":1673869841000,\"permissionIds\":[208,12,187,195,198,209]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 14, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 20:39:19', 0);
INSERT INTO `sys_log` VALUES (22, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 15, '112.32.138.68', '安徽省合肥市', 'gbb', '2023-02-19 20:40:03', 0);
INSERT INTO `sys_log` VALUES (23, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 93, '112.32.138.68', '安徽省合肥市', '', '2023-02-19 20:40:10', 0);
INSERT INTO `sys_log` VALUES (24, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 20:41:35', 0);
INSERT INTO `sys_log` VALUES (25, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 94, '112.32.138.68', '安徽省合肥市', '', '2023-02-19 20:41:40', 0);
INSERT INTO `sys_log` VALUES (26, '新增动态', '{\"id\":13,\"名称\":\"测试富文本\",\"内容\":\"<blockquote>测试测试</blockquote><h1>11111</h1><h2>222222</h2><p><span style=\\\"color: rgb(250, 250, 250); background-color: rgb(54, 88, 226);\\\"><em><strong>bbbbbb</strong></em></span></p><p><br></p><pre><code class=\\\"language-java\\\">class Hello {\\n  \\n}</code></pre><p><br></p>\",\"创建时间\":1676811617832,\"更新时间\":1676811617832}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic', 16, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 21:00:18', 0);
INSERT INTO `sys_log` VALUES (27, '编辑动态', '{\"id\":13,\"软删除\":0,\"名称\":\"测试富文本\",\"内容\":\"<blockquote>测试测试</blockquote><h1>11111</h1><h2>222222</h2><p><span style=\\\"color: rgb(250, 250, 250); background-color: rgb(54, 88, 226);\\\"><em><strong>bbbbbb</strong></em></span></p><p><br></p><pre><code class=\\\"language-java\\\">class Hello {\\n  \\n}</code></pre><p><br></p>\",\"用户id\":4,\"创建时间\":1676811618000,\"更新时间\":1676811618000}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic', 0, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 21:05:48', 0);
INSERT INTO `sys_log` VALUES (28, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 797, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 21:14:54', 0);
INSERT INTO `sys_log` VALUES (29, '上传文件', '文件流', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":\"http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png\"}', 'http://localhost:9090/file/upload', 31, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 21:15:16', 0);
INSERT INTO `sys_log` VALUES (30, '上传文件', '文件流', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":\"http://localhost:9090/file/download/66faf9a9ef34404991add03ffa9d8e59.webp\"}', 'http://localhost:9090/file/upload', 16, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 21:15:19', 0);
INSERT INTO `sys_log` VALUES (31, '新增发帖', '{\"id\":1,\"名称\":\"测试发帖\",\"图片\":\"http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png\",\"文件\":\"http://localhost:9090/file/download/66faf9a9ef34404991add03ffa9d8e59.webp\",\"日期\":\"2023-02-19\",\"时间\":\"2023-02-19 21:15:23\",\"富文本\":\"<blockquote>富文本</blockquote><ol><li>哈哈哈</li><li>红红火火恍恍惚惚</li></ol>\",\"用户id\":4,\"是否隐藏\":\"是\",\"创建时间\":1676812553349,\"更新时间\":1676812553349}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/posts', 15, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 21:15:54', 0);
INSERT INTO `sys_log` VALUES (32, '编辑发帖', '{\"id\":1,\"名称\":\"测试发帖11122333\",\"软删除\":0,\"图片\":\"http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png\",\"文件\":\"http://localhost:9090/file/download/66faf9a9ef34404991add03ffa9d8e59.webp\",\"日期\":\"2023-02-20\",\"时间\":\"2023-02-19 21:15:23\",\"富文本\":\"<blockquote>富文本</blockquote><ol><li>哈哈哈</li><li>红红火火恍恍惚惚</li></ol>\",\"用户id\":4,\"是否隐藏\":\"否\",\"创建时间\":1676812553000,\"更新时间\":1676812553000}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/posts', 15, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 21:17:21', 0);
INSERT INTO `sys_log` VALUES (33, '删除权限', '195', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/195', 35, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 21:40:10', 0);
INSERT INTO `sys_log` VALUES (34, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":1,\"用户名\":\"admin\",\"密码\":\"$2a$10$sz5GIsQI162NS90.iuF6KuqUq6VeUb4uXztDDMDlry44Hazid/lhm\",\"昵称\":\"管理员\",\"邮箱\":\"xqnode@163.com\",\"地址\":\"合肥市政务区\",\"用户唯一id\":\"4918ea50c06a458f94878abe741b4f51\",\"头像\":\"http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1670587697000,\"updateTime\":1670587697000,\"角色\":\"ADMIN\"},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiI0OTE4ZWE1MGMwNmE0NThmOTQ4NzhhYmU3NDFiNGY1MSIsInJuU3RyIjoiQXhTNWNGZUFlcFNnSXFKeVV6bGY3RWxhWVUxZkRwekkifQ.WvMoi-aL28oxGcBj_iryuD9al8ZsjI75olDoj9jLsA4\",\"menus\":[],\"auths\":[]}}', 'http://localhost:9090/login', 138, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 21:40:16', 0);
INSERT INTO `sys_log` VALUES (35, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":1,\"用户名\":\"admin\",\"密码\":\"$2a$10$sz5GIsQI162NS90.iuF6KuqUq6VeUb4uXztDDMDlry44Hazid/lhm\",\"昵称\":\"管理员\",\"邮箱\":\"xqnode@163.com\",\"地址\":\"合肥市政务区\",\"用户唯一id\":\"4918ea50c06a458f94878abe741b4f51\",\"头像\":\"http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1670587697000,\"updateTime\":1670587697000,\"角色\":\"ADMIN\"},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiI0OTE4ZWE1MGMwNmE0NThmOTQ4NzhhYmU3NDFiNGY1MSIsInJuU3RyIjoiQXhTNWNGZUFlcFNnSXFKeVV6bGY3RWxhWVUxZkRwekkifQ.WvMoi-aL28oxGcBj_iryuD9al8ZsjI75olDoj9jLsA4\",\"menus\":[],\"auths\":[]}}', 'http://localhost:9090/login', 93, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 21:40:36', 0);
INSERT INTO `sys_log` VALUES (36, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":1,\"用户名\":\"admin\",\"密码\":\"$2a$10$sz5GIsQI162NS90.iuF6KuqUq6VeUb4uXztDDMDlry44Hazid/lhm\",\"昵称\":\"管理员\",\"邮箱\":\"xqnode@163.com\",\"地址\":\"合肥市政务区\",\"用户唯一id\":\"4918ea50c06a458f94878abe741b4f51\",\"头像\":\"http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1670587697000,\"updateTime\":1670587697000,\"角色\":\"ADMIN\"},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiI0OTE4ZWE1MGMwNmE0NThmOTQ4NzhhYmU3NDFiNGY1MSIsInJuU3RyIjoiQXhTNWNGZUFlcFNnSXFKeVV6bGY3RWxhWVUxZkRwekkifQ.WvMoi-aL28oxGcBj_iryuD9al8ZsjI75olDoj9jLsA4\",\"menus\":[],\"auths\":[]}}', 'http://localhost:9090/login', 107, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 21:45:10', 0);
INSERT INTO `sys_log` VALUES (37, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":1,\"用户名\":\"admin\",\"密码\":\"$2a$10$sz5GIsQI162NS90.iuF6KuqUq6VeUb4uXztDDMDlry44Hazid/lhm\",\"昵称\":\"管理员\",\"邮箱\":\"xqnode@163.com\",\"地址\":\"合肥市政务区\",\"用户唯一id\":\"4918ea50c06a458f94878abe741b4f51\",\"头像\":\"http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1670587697000,\"updateTime\":1670587697000,\"角色\":\"ADMIN\"},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiI0OTE4ZWE1MGMwNmE0NThmOTQ4NzhhYmU3NDFiNGY1MSIsInJuU3RyIjoiQXhTNWNGZUFlcFNnSXFKeVV6bGY3RWxhWVUxZkRwekkifQ.WvMoi-aL28oxGcBj_iryuD9al8ZsjI75olDoj9jLsA4\",\"menus\":[],\"auths\":[{\"id\":209,\"名称\":\"公告查询\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"notice.list\",\"父级id\":208,\"类型\":3,\"逻辑删除\":0,\"是否隐藏\":false}]}}', 'http://localhost:9090/login', 91, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 21:47:39', 0);
INSERT INTO `sys_log` VALUES (38, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 21:48:58', 0);
INSERT INTO `sys_log` VALUES (39, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 109, '112.32.138.8', '安徽省合肥市', '', '2023-02-28 21:49:04', 0);
INSERT INTO `sys_log` VALUES (40, '删除权限', '195', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/195', 16, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 21:49:24', 0);
INSERT INTO `sys_log` VALUES (41, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 92, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 21:51:25', 0);
INSERT INTO `sys_log` VALUES (42, '删除权限', '186', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/186', 5248, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 21:51:43', 0);
INSERT INTO `sys_log` VALUES (43, '删除权限', '195', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/195', 3959, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 21:53:12', 0);
INSERT INTO `sys_log` VALUES (44, '删除权限', '187', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/187', 0, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 21:53:18', 0);
INSERT INTO `sys_log` VALUES (45, '删除权限', '198', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/198', 16, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 21:53:21', 0);
INSERT INTO `sys_log` VALUES (46, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 16, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 21:54:16', 0);
INSERT INTO `sys_log` VALUES (47, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 124, '112.32.138.8', '安徽省合肥市', '', '2023-02-28 21:54:21', 0);
INSERT INTO `sys_log` VALUES (48, '删除权限', '376', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/376', 0, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 21:56:27', 0);
INSERT INTO `sys_log` VALUES (49, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 91, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 21:57:37', 0);
INSERT INTO `sys_log` VALUES (50, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 777, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 22:03:35', 0);
INSERT INTO `sys_log` VALUES (51, '富文本-上传图片', '文件流', '{\"errno\":0,\"data\":{\"url\":\"http://localhost:9090/file/download/1e78e65c7f7d4efb9291922cc6eb0d4a.png\"}}', 'http://localhost:9090/file/uploadImg', 32, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 22:03:48', 0);
INSERT INTO `sys_log` VALUES (52, '上传文件', '文件流', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":\"http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png\"}', 'http://localhost:9090/file/upload', 0, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 22:03:55', 0);
INSERT INTO `sys_log` VALUES (53, '上传文件', '文件流', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":\"http://localhost:9090/file/download/66eb327af1b14ecc8995daec10400b7f.png\"}', 'http://localhost:9090/file/upload', 16, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 22:04:06', 0);
INSERT INTO `sys_log` VALUES (54, '新增动态', '{\"id\":14,\"名称\":\"11111\",\"内容\":\"<p>1111<img src=\\\"http://localhost:9090/file/download/1e78e65c7f7d4efb9291922cc6eb0d4a.png\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"图片\":\"http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png\",\"用户id\":1,\"公告id\":3,\"是否隐藏\":\"是\",\"日期\":\"2023-02-28\",\"时间\":\"2023-02-28 22:04:03\",\"文件\":\"http://localhost:9090/file/download/66eb327af1b14ecc8995daec10400b7f.png\",\"创建时间\":1677593047067,\"更新时间\":1677593047067}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic', 14, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 22:04:07', 0);
INSERT INTO `sys_log` VALUES (55, '删除动态', '13', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic/13', 0, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 22:04:21', 0);
INSERT INTO `sys_log` VALUES (56, '删除动态', '11', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic/11', 0, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 22:04:23', 0);
INSERT INTO `sys_log` VALUES (57, '删除动态', '10', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic/10', 0, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 22:04:25', 0);
INSERT INTO `sys_log` VALUES (58, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 15, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 22:06:24', 0);
INSERT INTO `sys_log` VALUES (59, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 122, '112.32.138.8', '安徽省合肥市', '', '2023-02-28 22:06:50', 0);
INSERT INTO `sys_log` VALUES (60, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 22:07:36', 0);
INSERT INTO `sys_log` VALUES (61, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 93, '112.32.138.8', '安徽省合肥市', '', '2023-02-28 22:07:39', 0);
INSERT INTO `sys_log` VALUES (62, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 22:10:34', 0);
INSERT INTO `sys_log` VALUES (63, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 94, '112.32.138.8', '安徽省合肥市', '', '2023-02-28 22:10:38', 0);
INSERT INTO `sys_log` VALUES (64, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 37, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 22:13:24', 0);
INSERT INTO `sys_log` VALUES (65, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 202, '112.32.138.8', '安徽省合肥市', '', '2023-02-28 22:13:30', 0);
INSERT INTO `sys_log` VALUES (66, '富文本-上传图片', '文件流', '{\"errno\":0,\"data\":{\"url\":\"http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png\"}}', 'http://localhost:9090/file/uploadImg', 29, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 22:13:51', 0);
INSERT INTO `sys_log` VALUES (67, '上传文件', '文件流', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":\"http://localhost:9090/file/download/5cd51962ae5b427c8ff6a2c6b673f153.png\"}', 'http://localhost:9090/file/upload', 0, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 22:13:55', 0);
INSERT INTO `sys_log` VALUES (68, '新增发帖', '{\"id\":1,\"标题\":\"我是小黑子哈哈哈\",\"描述\":\"我是ikun\",\"内容\":\"<p><img src=\\\"http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"封面\":\"http://localhost:9090/file/download/5cd51962ae5b427c8ff6a2c6b673f153.png\",\"时间\":\"2023-02-28 22:13:57\",\"发帖人\":18,\"是否显示\":\"是\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/posts', 16, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 22:14:54', 0);
INSERT INTO `sys_log` VALUES (69, '编辑发帖', '{\"id\":1,\"标题\":\"我是小黑子哈111111\",\"描述\":\"我是ikun22222\",\"内容\":\"<p><img src=\\\"http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"封面\":\"http://localhost:9090/file/download/5cd51962ae5b427c8ff6a2c6b673f153.png\",\"时间\":\"2023-02-28 22:13:57\",\"发帖人\":18,\"是否显示\":\"是\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/posts', 13, '112.32.138.8', '安徽省合肥市', 'admin', '2023-02-28 22:15:29', 0);
INSERT INTO `sys_log` VALUES (70, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 979, '112.32.139.183', '安徽省合肥市', '', '2023-03-05 09:59:03', 0);
INSERT INTO `sys_log` VALUES (71, '删除权限', '400', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/400', 31, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 10:01:32', 0);
INSERT INTO `sys_log` VALUES (72, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 10:01:36', 0);
INSERT INTO `sys_log` VALUES (73, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 108, '112.32.139.183', '安徽省合肥市', '', '2023-03-05 10:01:40', 0);
INSERT INTO `sys_log` VALUES (74, '删除权限', '195', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/195', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 10:02:16', 0);
INSERT INTO `sys_log` VALUES (75, '删除权限', '198', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/198', 2, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 10:02:18', 0);
INSERT INTO `sys_log` VALUES (76, '删除权限', '187', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/187', 4, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 10:02:30', 0);
INSERT INTO `sys_log` VALUES (77, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 10:02:52', 0);
INSERT INTO `sys_log` VALUES (78, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 94, '112.32.139.183', '安徽省合肥市', '', '2023-03-05 10:02:56', 0);
INSERT INTO `sys_log` VALUES (79, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 312, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 14:42:18', 0);
INSERT INTO `sys_log` VALUES (80, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.139.183', '安徽省合肥市', '', '2023-03-05 14:43:52', 0);
INSERT INTO `sys_log` VALUES (81, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 109, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 14:43:56', 0);
INSERT INTO `sys_log` VALUES (82, '编辑动态', '{\"id\":14,\"软删除\":0,\"名称\":\"标题标题标题标题标题标题标题标题\",\"内容\":\"<blockquote>1111<img src=\\\"http://localhost:9090/file/download/1e78e65c7f7d4efb9291922cc6eb0d4a.png\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></blockquote>\",\"图片\":\"http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png\",\"用户id\":1,\"公告id\":3,\"是否隐藏\":\"是\",\"日期\":\"2023-02-28\",\"时间\":\"2023-02-28 22:04:03\",\"文件\":\"http://localhost:9090/file/download/66eb327af1b14ecc8995daec10400b7f.png\",\"创建时间\":1677593047000,\"更新时间\":1677593047000,\"descr\":\"描述描述描述描述描述\",\"user\":{\"id\":1,\"用户名\":\"admin\",\"密码\":\"$2a$10$sz5GIsQI162NS90.iuF6KuqUq6VeUb4uXztDDMDlry44Hazid/lhm\",\"昵称\":\"管理员\",\"邮箱\":\"xqnode@163.com\",\"地址\":\"合肥市政务区\",\"用户唯一id\":\"4918ea50c06a458f94878abe741b4f51\",\"头像\":\"http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1670587697000,\"updateTime\":1670587697000,\"角色\":\"ADMIN\"}}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic', 15, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 14:45:32', 0);
INSERT INTO `sys_log` VALUES (83, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.139.183', '安徽省合肥市', '', '2023-03-05 14:49:56', 0);
INSERT INTO `sys_log` VALUES (84, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 108, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 14:50:00', 0);
INSERT INTO `sys_log` VALUES (85, '编辑动态', '{\"id\":14,\"软删除\":0,\"名称\":\"标题标题标题标题标题标题标题标题\",\"内容\":\"<blockquote>1111<img src=\\\"http://localhost:9090/file/download/1e78e65c7f7d4efb9291922cc6eb0d4a.png\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></blockquote><p><br></p><h1>我是H1</h1><p><em>我是斜体</em></p><p><br></p><p><span style=\\\"color: rgb(245, 219, 77); background-color: rgb(66, 144, 247);\\\">我是颜色字</span></p>\",\"图片\":\"http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png\",\"用户id\":1,\"公告id\":3,\"是否隐藏\":\"是\",\"日期\":\"2023-02-28\",\"时间\":\"2023-02-28 22:04:03\",\"文件\":\"http://localhost:9090/file/download/66eb327af1b14ecc8995daec10400b7f.png\",\"创建时间\":1677593047000,\"更新时间\":1677593047000,\"descr\":\"描述描述描述描述描述\",\"user\":{\"id\":1,\"用户名\":\"admin\",\"密码\":\"$2a$10$sz5GIsQI162NS90.iuF6KuqUq6VeUb4uXztDDMDlry44Hazid/lhm\",\"昵称\":\"管理员\",\"邮箱\":\"xqnode@163.com\",\"地址\":\"合肥市政务区\",\"用户唯一id\":\"4918ea50c06a458f94878abe741b4f51\",\"头像\":\"http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1670587697000,\"updateTime\":1670587697000,\"角色\":\"ADMIN\"}}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 14:52:30', 0);
INSERT INTO `sys_log` VALUES (86, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 80, '112.32.139.183', '安徽省合肥市', '', '2023-03-05 16:11:13', 0);
INSERT INTO `sys_log` VALUES (87, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 201, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:11:18', 0);
INSERT INTO `sys_log` VALUES (88, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 123, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:11:53', 0);
INSERT INTO `sys_log` VALUES (89, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 16, '112.32.139.183', '安徽省合肥市', '', '2023-03-05 16:11:58', 0);
INSERT INTO `sys_log` VALUES (90, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 92, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:12:04', 0);
INSERT INTO `sys_log` VALUES (91, '编辑角色', '{\"id\":3,\"名称\":\"普通用户\",\"唯一标识\":\"USER\",\"逻辑删除\":0,\"创建时间\":1673869841000,\"更新时间\":1673869841000,\"permissionIds\":[208,12,209,408,409,410,411,412,413,414,415]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 45, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:12:14', 0);
INSERT INTO `sys_log` VALUES (92, '新增点赞', '{\"id\":1,\"类型\":\"dynamic\",\"用户id\":1,\"点赞时间\":1678004207624}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 45, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:16:48', 0);
INSERT INTO `sys_log` VALUES (93, '新增点赞', '{\"id\":2,\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678004216834}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 15, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:16:57', 0);
INSERT INTO `sys_log` VALUES (94, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":14}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 16, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:16:58', 0);
INSERT INTO `sys_log` VALUES (95, '新增点赞', '{\"id\":3,\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678004218410}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 16, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:16:59', 0);
INSERT INTO `sys_log` VALUES (96, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":14}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 16, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:16:59', 0);
INSERT INTO `sys_log` VALUES (97, '新增点赞', '{\"id\":4,\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678004218838}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:16:59', 0);
INSERT INTO `sys_log` VALUES (98, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":14}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 15, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:16:59', 0);
INSERT INTO `sys_log` VALUES (99, '新增点赞', '{\"id\":5,\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678004219168}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:16:59', 0);
INSERT INTO `sys_log` VALUES (100, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":14}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:16:59', 0);
INSERT INTO `sys_log` VALUES (101, '新增点赞', '{\"id\":6,\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678004219498}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 15, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:17:00', 0);
INSERT INTO `sys_log` VALUES (102, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":14}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 15, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:17:00', 0);
INSERT INTO `sys_log` VALUES (103, '新增点赞', '{\"id\":7,\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678004219820}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:17:00', 0);
INSERT INTO `sys_log` VALUES (104, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":14}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:17:00', 0);
INSERT INTO `sys_log` VALUES (105, '新增点赞', '{\"id\":8,\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678004220159}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:17:00', 0);
INSERT INTO `sys_log` VALUES (106, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":14}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:17:05', 0);
INSERT INTO `sys_log` VALUES (107, '新增点赞', '{\"id\":9,\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678004556745}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 33029, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:22:37', 0);
INSERT INTO `sys_log` VALUES (108, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":14}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 15, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:23:10', 0);
INSERT INTO `sys_log` VALUES (109, '新增点赞', '{\"id\":10,\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678004632880}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 39517, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:23:53', 0);
INSERT INTO `sys_log` VALUES (110, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":14}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 17, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:25:40', 0);
INSERT INTO `sys_log` VALUES (111, '新增点赞', '{\"id\":11,\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678004772198}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 31361, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:26:12', 0);
INSERT INTO `sys_log` VALUES (112, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678005078338}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 93, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:31:19', 0);
INSERT INTO `sys_log` VALUES (113, '新增点赞', '{\"id\":15,\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678005082007}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:31:22', 0);
INSERT INTO `sys_log` VALUES (114, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678005082882}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 16, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:31:23', 0);
INSERT INTO `sys_log` VALUES (115, '新增点赞', '{\"id\":17,\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678005083723}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:31:24', 0);
INSERT INTO `sys_log` VALUES (116, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678005084392}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 16, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:31:25', 0);
INSERT INTO `sys_log` VALUES (117, '新增点赞', '{\"id\":19,\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678005085100}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:31:25', 0);
INSERT INTO `sys_log` VALUES (118, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678005085857}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:31:26', 0);
INSERT INTO `sys_log` VALUES (119, '新增点赞', '{\"id\":21,\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678005142313}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:32:23', 0);
INSERT INTO `sys_log` VALUES (120, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678005142963}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 15, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:32:23', 0);
INSERT INTO `sys_log` VALUES (121, '新增点赞', '{\"id\":23,\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678005143617}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:32:24', 0);
INSERT INTO `sys_log` VALUES (122, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678005144361}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 16, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:32:24', 0);
INSERT INTO `sys_log` VALUES (123, '新增点赞', '{\"id\":25,\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678005145173}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:32:25', 0);
INSERT INTO `sys_log` VALUES (124, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678005145886}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:32:26', 0);
INSERT INTO `sys_log` VALUES (125, '新增点赞', '{\"id\":27,\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":1,\"点赞时间\":1678005175891}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.139.183', '安徽省合肥市', 'admin', '2023-03-05 16:32:56', 0);
INSERT INTO `sys_log` VALUES (126, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 922, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:09:51', 0);
INSERT INTO `sys_log` VALUES (127, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 874, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:12:13', 0);
INSERT INTO `sys_log` VALUES (128, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 16, '112.32.138.1', '安徽省合肥市', '', '2023-03-18 09:13:57', 0);
INSERT INTO `sys_log` VALUES (129, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 139, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:14:01', 0);
INSERT INTO `sys_log` VALUES (130, '新增点赞', '{\"id\":28,\"类型\":\"dynamic\",\"模块内容id\":14,\"用户id\":19,\"点赞时间\":1679102259037}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 16, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:17:39', 0);
INSERT INTO `sys_log` VALUES (131, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 0, '112.32.138.1', '安徽省合肥市', '', '2023-03-18 09:18:14', 0);
INSERT INTO `sys_log` VALUES (132, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 107, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 09:18:20', 0);
INSERT INTO `sys_log` VALUES (133, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 2, '112.32.138.1', '安徽省合肥市', '', '2023-03-18 09:18:34', 0);
INSERT INTO `sys_log` VALUES (134, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 95, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:18:40', 0);
INSERT INTO `sys_log` VALUES (135, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 0, '112.32.138.1', '安徽省合肥市', '', '2023-03-18 09:20:21', 0);
INSERT INTO `sys_log` VALUES (136, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 123, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 09:20:25', 0);
INSERT INTO `sys_log` VALUES (137, '编辑角色', '{\"id\":3,\"名称\":\"普通用户\",\"唯一标识\":\"USER\",\"逻辑删除\":0,\"创建时间\":1673869841000,\"更新时间\":1673869841000,\"permissionIds\":[208,392,12,209,393,394,398,399,408,409,410,411,412,413,414,415]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 32, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 09:20:58', 0);
INSERT INTO `sys_log` VALUES (138, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.138.1', '安徽省合肥市', '', '2023-03-18 09:21:00', 0);
INSERT INTO `sys_log` VALUES (139, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 94, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:21:04', 0);
INSERT INTO `sys_log` VALUES (140, '富文本-上传图片', '文件流', '{\"errno\":0,\"data\":{\"url\":\"http://localhost:9090/file/download/f3ffc202dd3e47888914ec6db3fcc093.jpg\"}}', 'http://localhost:9090/file/uploadImg', 39, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:26:34', 0);
INSERT INTO `sys_log` VALUES (141, '上传文件', '文件流', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":\"http://localhost:9090/file/download/45a427d2ece84e0daa1d864e8f4bb713.jpg\"}', 'http://localhost:9090/file/upload', 15, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:26:39', 0);
INSERT INTO `sys_log` VALUES (142, '新增动态', '{\"id\":15,\"名称\":\"今天真是一个好天气\",\"内容\":\"<p>今天真是一个好天气</p><p><br></p><p><img src=\\\"http://localhost:9090/file/download/f3ffc202dd3e47888914ec6db3fcc093.jpg\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"图片\":\"http://localhost:9090/file/download/45a427d2ece84e0daa1d864e8f4bb713.jpg\",\"用户id\":19,\"时间\":\"2023-03-18 09:26:40\",\"创建时间\":1679102800399,\"更新时间\":1679102800399}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic', 61, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:26:41', 0);
INSERT INTO `sys_log` VALUES (143, '编辑动态', '{\"id\":15,\"软删除\":0,\"名称\":\"今天真是一个好天气11\",\"内容\":\"<p>今天真是一个好天气</p><p><br></p><p><img src=\\\"http://localhost:9090/file/download/f3ffc202dd3e47888914ec6db3fcc093.jpg\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"图片\":\"http://localhost:9090/file/download/45a427d2ece84e0daa1d864e8f4bb713.jpg\",\"用户id\":19,\"时间\":\"2023-03-18 09:26:40\",\"创建时间\":1679102800000,\"更新时间\":1679102800000,\"view\":0,\"user\":{\"id\":19,\"用户名\":\"gbb\",\"密码\":\"$2a$10$XmgagEBh2jlERi9JTAP3iub88e022RXMovXlV3ea/ZQbMi/.Yd3Ae\",\"昵称\":\"Ikun小黑子专用号\",\"邮箱\":\"ikun@163.com\",\"地址\":\"蔡徐坤北京分坤\",\"用户唯一id\":\"f3e75978695847e59c7c575d8379afa3\",\"头像\":\"http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1676121934000,\"updateTime\":1676121934000,\"角色\":\"USER\"}}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic', 16, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:27:40', 0);
INSERT INTO `sys_log` VALUES (144, '删除动态', '9', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic/9', 15, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:27:45', 0);
INSERT INTO `sys_log` VALUES (145, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 31, '112.32.138.1', '安徽省合肥市', '', '2023-03-18 09:33:29', 0);
INSERT INTO `sys_log` VALUES (146, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 170, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 09:33:34', 0);
INSERT INTO `sys_log` VALUES (147, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.138.1', '安徽省合肥市', '', '2023-03-18 09:34:48', 0);
INSERT INTO `sys_log` VALUES (148, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 93, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:34:54', 0);
INSERT INTO `sys_log` VALUES (149, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 0, '112.32.138.1', '安徽省合肥市', '', '2023-03-18 09:35:20', 0);
INSERT INTO `sys_log` VALUES (150, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 107, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:35:28', 0);
INSERT INTO `sys_log` VALUES (151, '新增点赞', '{\"id\":29,\"类型\":\"dynamic\",\"模块内容id\":15,\"用户id\":19,\"点赞时间\":1679103349895}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 15, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:35:50', 0);
INSERT INTO `sys_log` VALUES (152, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":15,\"用户id\":19,\"点赞时间\":1679103353186}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 63, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:35:53', 0);
INSERT INTO `sys_log` VALUES (153, '新增点赞', '{\"id\":31,\"类型\":\"dynamic\",\"模块内容id\":15,\"用户id\":19,\"点赞时间\":1679103354697}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:35:55', 0);
INSERT INTO `sys_log` VALUES (154, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":15,\"用户id\":19,\"点赞时间\":1679103355496}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 17, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:35:56', 0);
INSERT INTO `sys_log` VALUES (155, '新增点赞', '{\"id\":33,\"类型\":\"dynamic\",\"模块内容id\":15,\"用户id\":19,\"点赞时间\":1679103356344}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:35:56', 0);
INSERT INTO `sys_log` VALUES (156, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":15,\"用户id\":19,\"点赞时间\":1679103360584}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 16, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:36:01', 0);
INSERT INTO `sys_log` VALUES (157, '新增点赞', '{\"id\":35,\"类型\":\"dynamic\",\"模块内容id\":15,\"用户id\":19,\"点赞时间\":1679103361391}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:36:02', 0);
INSERT INTO `sys_log` VALUES (158, '富文本-上传图片', '文件流', '{\"errno\":0,\"data\":{\"url\":\"\"}}', 'http://localhost:9090/file/uploadImg', 15, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:37:56', 0);
INSERT INTO `sys_log` VALUES (159, '富文本-上传图片', '文件流', '{\"errno\":0,\"data\":{\"url\":\"\"}}', 'http://localhost:9090/file/uploadImg', 16, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:38:05', 0);
INSERT INTO `sys_log` VALUES (160, '上传文件', '文件流', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":\"http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png\"}', 'http://localhost:9090/file/upload', 16, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:38:10', 0);
INSERT INTO `sys_log` VALUES (161, '富文本-上传图片', '文件流', '{\"errno\":0,\"data\":{\"url\":\"http://localhost:9090/file/download/30ab8bc3353645efb8716374b20688cb.png\"}}', 'http://localhost:9090/file/uploadImg', 0, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:38:24', 0);
INSERT INTO `sys_log` VALUES (162, '新增动态', '{\"id\":16,\"名称\":\"哈哈哈哈我是小黑粉\",\"内容\":\"<p>1111</p><p><img src=\\\"http://localhost:9090/file/download/30ab8bc3353645efb8716374b20688cb.png\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"图片\":\"http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png\",\"用户id\":19,\"时间\":\"2023-03-18 09:38:26\",\"创建时间\":1679103506218,\"更新时间\":1679103506218,\"descr\":\"我是小黑粉\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic', 61, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:38:26', 0);
INSERT INTO `sys_log` VALUES (163, '编辑动态', '{\"id\":15,\"软删除\":0,\"名称\":\"今天真是一个好天气11\",\"内容\":\"<p>今天真是一个好天气</p><p><br></p><p><img src=\\\"http://localhost:9090/file/download/f3ffc202dd3e47888914ec6db3fcc093.jpg\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"图片\":\"http://localhost:9090/file/download/45a427d2ece84e0daa1d864e8f4bb713.jpg\",\"用户id\":19,\"时间\":\"2023-03-18 09:26:40\",\"创建时间\":1679102800000,\"更新时间\":1679102800000,\"descr\":\"真是一个好天气\",\"view\":9,\"user\":{\"id\":19,\"用户名\":\"gbb\",\"密码\":\"$2a$10$XmgagEBh2jlERi9JTAP3iub88e022RXMovXlV3ea/ZQbMi/.Yd3Ae\",\"昵称\":\"Ikun小黑子专用号\",\"邮箱\":\"ikun@163.com\",\"地址\":\"蔡徐坤北京分坤\",\"用户唯一id\":\"f3e75978695847e59c7c575d8379afa3\",\"头像\":\"http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1676121934000,\"updateTime\":1676121934000,\"角色\":\"USER\"}}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic', 0, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 09:38:34', 0);
INSERT INTO `sys_log` VALUES (164, '新增点赞', '{\"id\":36,\"类型\":\"dynamic\",\"模块内容id\":16,\"用户id\":19,\"点赞时间\":1679106280099}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 30, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 10:24:41', 0);
INSERT INTO `sys_log` VALUES (165, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":16,\"用户id\":19,\"点赞时间\":1679106280948}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 63, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 10:24:41', 0);
INSERT INTO `sys_log` VALUES (166, '新增点赞', '{\"id\":38,\"类型\":\"dynamic\",\"模块内容id\":16,\"用户id\":19,\"点赞时间\":1679106281777}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 10:24:42', 0);
INSERT INTO `sys_log` VALUES (167, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":16,\"用户id\":19,\"点赞时间\":1679106282254}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 16, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 10:24:42', 0);
INSERT INTO `sys_log` VALUES (168, '新增点赞', '{\"id\":40,\"类型\":\"dynamic\",\"模块内容id\":16,\"用户id\":19,\"点赞时间\":1679106282670}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 15, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 10:24:43', 0);
INSERT INTO `sys_log` VALUES (169, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":16,\"用户id\":19,\"点赞时间\":1679106283014}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 10:24:43', 0);
INSERT INTO `sys_log` VALUES (170, '新增点赞', '{\"id\":42,\"类型\":\"dynamic\",\"模块内容id\":16,\"用户id\":19,\"点赞时间\":1679106283164}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 15, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 10:24:43', 0);
INSERT INTO `sys_log` VALUES (171, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":16,\"用户id\":19,\"点赞时间\":1679106283494}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 10:24:44', 0);
INSERT INTO `sys_log` VALUES (172, '新增点赞', '{\"id\":44,\"类型\":\"dynamic\",\"模块内容id\":16,\"用户id\":19,\"点赞时间\":1679106284778}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 10:24:45', 0);
INSERT INTO `sys_log` VALUES (173, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":16,\"用户id\":19,\"点赞时间\":1679106286176}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 10:24:46', 0);
INSERT INTO `sys_log` VALUES (174, '新增点赞', '{\"id\":46,\"类型\":\"dynamic\",\"模块内容id\":16,\"用户id\":19,\"点赞时间\":1679106287118}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 16, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 10:24:47', 0);
INSERT INTO `sys_log` VALUES (175, '新增点赞', '{\"类型\":\"dynamic\",\"模块内容id\":16,\"用户id\":19,\"点赞时间\":1679106287745}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 16, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 10:24:48', 0);
INSERT INTO `sys_log` VALUES (176, '新增点赞', '{\"id\":48,\"类型\":\"dynamic\",\"模块内容id\":16,\"用户id\":19,\"点赞时间\":1679106288845}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 10:24:49', 0);
INSERT INTO `sys_log` VALUES (177, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 30, '112.32.138.1', '安徽省合肥市', '', '2023-03-18 10:25:55', 0);
INSERT INTO `sys_log` VALUES (178, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 168, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 10:26:01', 0);
INSERT INTO `sys_log` VALUES (179, '新增点赞', '{\"id\":49,\"类型\":\"dynamic\",\"模块内容id\":16,\"用户id\":1,\"点赞时间\":1679107198289}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 16, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 10:39:59', 0);
INSERT INTO `sys_log` VALUES (180, '新增收藏', '{\"id\":1,\"动态\":16,\"收藏人\":1,\"创建时间\":1679107200755,\"更新时间\":1679107200755}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/collect', 15, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 10:40:01', 0);
INSERT INTO `sys_log` VALUES (181, '新增收藏', '{\"id\":2,\"动态\":16,\"收藏人\":1,\"创建时间\":1679107210225,\"更新时间\":1679107210225}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/collect', 0, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 10:40:10', 0);
INSERT INTO `sys_log` VALUES (182, '新增收藏', '{\"id\":3,\"动态\":16,\"收藏人\":1,\"创建时间\":1679107268218,\"更新时间\":1679107268218}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/collect', 17, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 10:41:08', 0);
INSERT INTO `sys_log` VALUES (183, '新增收藏', '{\"id\":4,\"动态\":16,\"收藏人\":1,\"创建时间\":1679107330250,\"更新时间\":1679107330250}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/collect', 15, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 10:42:11', 0);
INSERT INTO `sys_log` VALUES (184, '新增收藏', '{\"动态\":16,\"收藏人\":1,\"创建时间\":1679107333061,\"更新时间\":1679107333061}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/collect', 62, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 10:42:13', 0);
INSERT INTO `sys_log` VALUES (185, '新增收藏', '{\"id\":6,\"动态\":16,\"收藏人\":1,\"创建时间\":1679107334196,\"更新时间\":1679107334196}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/collect', 0, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 10:42:14', 0);
INSERT INTO `sys_log` VALUES (186, '新增收藏', '{\"动态\":16,\"收藏人\":1,\"创建时间\":1679107334839,\"更新时间\":1679107334839}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/collect', 16, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 10:42:15', 0);
INSERT INTO `sys_log` VALUES (187, '新增收藏', '{\"id\":8,\"动态\":16,\"收藏人\":1,\"创建时间\":1679107335396,\"更新时间\":1679107335396}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/collect', 0, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 10:42:16', 0);
INSERT INTO `sys_log` VALUES (188, '新增收藏', '{\"动态\":16,\"收藏人\":1,\"创建时间\":1679107335852,\"更新时间\":1679107335852}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/collect', 0, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 10:42:16', 0);
INSERT INTO `sys_log` VALUES (189, '新增收藏', '{\"id\":10,\"动态\":16,\"收藏人\":1,\"创建时间\":1679107349292,\"更新时间\":1679107349292}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/collect', 0, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 10:42:30', 0);
INSERT INTO `sys_log` VALUES (190, '新增评论', '{\"id\":1,\"创建时间\":1679107933010,\"更新时间\":1679107933012,\"内容\":\"123\",\"动态\":16}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/comments', 29, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 10:52:14', 0);
INSERT INTO `sys_log` VALUES (191, '新增评论', '{\"id\":2,\"创建时间\":1679107969964,\"更新时间\":1679107969966,\"内容\":\"123\",\"用户\":1,\"动态\":16,\"时间\":\"2023-03-18 10:52:49\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/comments', 92, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 10:52:50', 0);
INSERT INTO `sys_log` VALUES (192, '新增评论', '{\"id\":3,\"创建时间\":1679109181122,\"更新时间\":1679109181124,\"内容\":\"2回复内容\",\"用户\":1,\"动态\":16,\"时间\":\"2023-03-18 11:13:00\",\"父级id\":2,\"属地\":\"安徽省合肥市\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/comments', 556, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 11:13:01', 0);
INSERT INTO `sys_log` VALUES (193, '新增评论', '{\"id\":4,\"创建时间\":1679109210443,\"更新时间\":1679109210443,\"内容\":\"123132131\",\"用户\":1,\"动态\":16,\"时间\":\"2023-03-18 11:13:30\",\"父级id\":2,\"属地\":\"安徽省合肥市\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/comments', 261, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 11:13:31', 0);
INSERT INTO `sys_log` VALUES (194, '新增评论', '{\"id\":5,\"创建时间\":1679109299299,\"更新时间\":1679109299299,\"内容\":\"我是孙子的孙子\",\"用户\":1,\"动态\":16,\"时间\":\"2023-03-18 11:14:59\",\"父级id\":2,\"属地\":\"安徽省合肥市\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/comments', 261, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 11:15:00', 0);
INSERT INTO `sys_log` VALUES (195, '新增评论', '{\"id\":6,\"创建时间\":1679109342890,\"更新时间\":1679109342890,\"内容\":\"我是小孙\",\"用户\":1,\"动态\":16,\"时间\":\"2023-03-18 11:15:42\",\"父级id\":2,\"属地\":\"安徽省合肥市\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/comments', 263, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 11:15:43', 0);
INSERT INTO `sys_log` VALUES (196, '删除评论', '3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/comments/3', 30, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 11:33:45', 0);
INSERT INTO `sys_log` VALUES (197, '删除评论', '5', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/comments/5', 0, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 11:33:51', 0);
INSERT INTO `sys_log` VALUES (198, '删除评论', '2', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/comments/2', 0, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 11:33:53', 0);
INSERT INTO `sys_log` VALUES (199, '新增评论', '{\"id\":7,\"创建时间\":1679110454223,\"更新时间\":1679110454223,\"内容\":\"我是小黑粉\",\"用户\":1,\"动态\":16,\"时间\":\"2023-03-18 11:34:13\",\"属地\":\"安徽省合肥市\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/comments', 322, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 11:34:14', 0);
INSERT INTO `sys_log` VALUES (200, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 15, '112.32.138.1', '安徽省合肥市', '', '2023-03-18 11:34:17', 0);
INSERT INTO `sys_log` VALUES (201, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 152, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 11:34:21', 0);
INSERT INTO `sys_log` VALUES (202, '新增评论', '{\"id\":8,\"创建时间\":1679110470632,\"更新时间\":1679110470632,\"内容\":\"哈哈哈  我也是\",\"用户\":19,\"动态\":16,\"时间\":\"2023-03-18 11:34:30\",\"父级id\":7,\"属地\":\"安徽省合肥市\",\"puserId\":1}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/comments', 311, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 11:34:31', 0);
INSERT INTO `sys_log` VALUES (203, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 0, '112.32.138.1', '安徽省合肥市', '', '2023-03-18 11:34:38', 0);
INSERT INTO `sys_log` VALUES (204, '用户登录', '{\"username\":\"ass\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 94, '112.32.138.1', '安徽省合肥市', 'ass', '2023-03-18 11:34:55', 0);
INSERT INTO `sys_log` VALUES (205, '新增评论', '{\"id\":9,\"创建时间\":1679110504816,\"更新时间\":1679110504816,\"内容\":\"我不是\",\"用户\":18,\"动态\":16,\"时间\":\"2023-03-18 11:35:04\",\"父级id\":7,\"属地\":\"安徽省合肥市\",\"puserId\":1}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/comments', 308, '112.32.138.1', '安徽省合肥市', 'ass', '2023-03-18 11:35:05', 0);
INSERT INTO `sys_log` VALUES (206, '新增点赞', '{\"id\":50,\"类型\":\"dynamic\",\"模块内容id\":16,\"用户id\":18,\"点赞时间\":1679110529903}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 16, '112.32.138.1', '安徽省合肥市', 'ass', '2023-03-18 11:35:30', 0);
INSERT INTO `sys_log` VALUES (207, '新增收藏', '{\"id\":11,\"动态\":16,\"收藏人\":18,\"创建时间\":1679110530708,\"更新时间\":1679110530708}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/collect', 13, '112.32.138.1', '安徽省合肥市', 'ass', '2023-03-18 11:35:31', 0);
INSERT INTO `sys_log` VALUES (208, '用户退出登录', 'c8dcfc6f12c94963b8514f7495f7ca4c', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/c8dcfc6f12c94963b8514f7495f7ca4c', 0, '112.32.138.1', '安徽省合肥市', '', '2023-03-18 11:35:39', 0);
INSERT INTO `sys_log` VALUES (209, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 92, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 11:35:44', 0);
INSERT INTO `sys_log` VALUES (210, '编辑角色', '{\"id\":3,\"名称\":\"普通用户\",\"唯一标识\":\"USER\",\"逻辑删除\":0,\"创建时间\":1673869841000,\"更新时间\":1673869841000,\"permissionIds\":[208,392,416,12,209,393,394,398,399,408,409,410,411,412,413,414,415,417,418,422,423]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 53, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 11:36:54', 0);
INSERT INTO `sys_log` VALUES (211, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.138.1', '安徽省合肥市', '', '2023-03-18 11:36:56', 0);
INSERT INTO `sys_log` VALUES (212, '用户登录', '{\"username\":\"ass\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 92, '112.32.138.1', '安徽省合肥市', 'ass', '2023-03-18 11:37:02', 0);
INSERT INTO `sys_log` VALUES (213, '用户登录', '{\"username\":\"ass\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 91, '112.32.138.1', '安徽省合肥市', 'ass', '2023-03-18 11:37:04', 0);
INSERT INTO `sys_log` VALUES (214, '用户退出登录', 'c8dcfc6f12c94963b8514f7495f7ca4c', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/c8dcfc6f12c94963b8514f7495f7ca4c', 0, '112.32.138.1', '安徽省合肥市', '', '2023-03-18 11:38:05', 0);
INSERT INTO `sys_log` VALUES (215, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 92, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 11:38:11', 0);
INSERT INTO `sys_log` VALUES (216, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.138.1', '安徽省合肥市', '', '2023-03-18 11:38:30', 0);
INSERT INTO `sys_log` VALUES (217, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 122, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 11:40:48', 0);
INSERT INTO `sys_log` VALUES (218, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.138.1', '安徽省合肥市', '', '2023-03-18 11:40:54', 0);
INSERT INTO `sys_log` VALUES (219, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 92, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 11:40:58', 0);
INSERT INTO `sys_log` VALUES (220, '新增收藏', '{\"id\":12,\"动态\":16,\"收藏人\":19,\"创建时间\":1679111089535,\"更新时间\":1679111089537}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/collect', 15, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 11:44:50', 0);
INSERT INTO `sys_log` VALUES (221, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 31, '112.32.138.1', '安徽省合肥市', '', '2023-03-18 12:46:55', 0);
INSERT INTO `sys_log` VALUES (222, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 146, '112.32.138.1', '安徽省合肥市', 'admin', '2023-03-18 12:47:03', 0);
INSERT INTO `sys_log` VALUES (223, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.138.1', '安徽省合肥市', '', '2023-03-18 12:47:10', 0);
INSERT INTO `sys_log` VALUES (224, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 92, '112.32.138.1', '安徽省合肥市', 'gbb', '2023-03-18 12:47:20', 0);
INSERT INTO `sys_log` VALUES (225, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 734, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-25 09:21:44', 0);
INSERT INTO `sys_log` VALUES (226, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.139.58', '安徽省合肥市', '', '2023-03-25 09:22:02', 0);
INSERT INTO `sys_log` VALUES (227, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 92, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-25 09:22:07', 0);
INSERT INTO `sys_log` VALUES (228, '新增评论', '{\"id\":10,\"创建时间\":1679709152146,\"更新时间\":1679709152147,\"内容\":\"今天天气很好\",\"用户\":19,\"动态\":15,\"时间\":\"2023-03-25 09:52:31\",\"属地\":\"安徽省合肥市\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/comments', 483, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-25 09:52:32', 0);
INSERT INTO `sys_log` VALUES (229, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 16, '112.32.139.58', '安徽省合肥市', '', '2023-03-25 09:52:57', 0);
INSERT INTO `sys_log` VALUES (230, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 157, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-25 09:53:02', 0);
INSERT INTO `sys_log` VALUES (231, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 125, '112.32.139.58', '安徽省合肥市', '', '2023-03-25 09:55:22', 0);
INSERT INTO `sys_log` VALUES (232, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 175, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-25 09:55:26', 0);
INSERT INTO `sys_log` VALUES (233, '新增新闻', '{\"id\":1,\"标题\":\"校园新闻征婚交友活动\",\"内容\":\"<p>今天开始发布征婚交友活动</p>\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/news', 0, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-25 09:56:13', 0);
INSERT INTO `sys_log` VALUES (234, '富文本-上传图片', '文件流', '{\"errno\":0,\"data\":{\"url\":\"http://localhost:9090/file/download/60feae23628c4290ba28d65d6e3a07db.png\"}}', 'http://localhost:9090/file/uploadImg', 29, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-25 09:56:26', 0);
INSERT INTO `sys_log` VALUES (235, '编辑新闻', '{\"id\":1,\"标题\":\"校园新闻征婚交友活动\",\"内容\":\"<p>今天开始发布征婚交友活动</p><p><br></p><p><img src=\\\"http://localhost:9090/file/download/60feae23628c4290ba28d65d6e3a07db.png\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"浏览量\":0}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/news', 17, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-25 09:56:28', 0);
INSERT INTO `sys_log` VALUES (236, '富文本-上传图片', '文件流', '{\"errno\":0,\"data\":{\"url\":\"http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png\"}}', 'http://localhost:9090/file/uploadImg', 47, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-25 09:58:09', 0);
INSERT INTO `sys_log` VALUES (237, '新增新闻', '{\"id\":2,\"标题\":\"小黑子也去征婚了笑死我\",\"内容\":\"<p>小黑子也去征婚了笑死我</p><p><img src=\\\"http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"发布时间\":\"2023-03-25 09:58:10\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/news', 45, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-25 09:58:11', 0);
INSERT INTO `sys_log` VALUES (238, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 15, '112.32.139.58', '安徽省合肥市', '', '2023-03-25 09:58:30', 0);
INSERT INTO `sys_log` VALUES (239, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 156, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-25 09:58:34', 0);
INSERT INTO `sys_log` VALUES (240, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 80, '112.32.139.58', '安徽省合肥市', '', '2023-03-25 11:54:20', 0);
INSERT INTO `sys_log` VALUES (241, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 201, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-25 11:54:27', 0);
INSERT INTO `sys_log` VALUES (242, '新增标签', '{\"id\":1,\"名称\":\"恋爱\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/tag', 0, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-25 11:54:40', 0);
INSERT INTO `sys_log` VALUES (243, '新增标签', '{\"id\":2,\"名称\":\"征婚\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/tag', 0, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-25 11:54:44', 0);
INSERT INTO `sys_log` VALUES (244, '新增标签', '{\"id\":3,\"名称\":\"游戏\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/tag', 0, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-25 11:54:49', 0);
INSERT INTO `sys_log` VALUES (245, '新增标签', '{\"id\":4,\"名称\":\"小黑子\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/tag', 0, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-25 11:54:55', 0);
INSERT INTO `sys_log` VALUES (246, '新增标签', '{\"id\":5,\"名称\":\"鸡你太美\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/tag', 1, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-25 11:55:04', 0);
INSERT INTO `sys_log` VALUES (247, '新增标签', '{\"id\":6,\"名称\":\"无聊的话题\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/tag', 0, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-25 11:55:12', 0);
INSERT INTO `sys_log` VALUES (248, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.139.58', '安徽省合肥市', '', '2023-03-25 11:55:17', 0);
INSERT INTO `sys_log` VALUES (249, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 106, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-25 11:55:23', 0);
INSERT INTO `sys_log` VALUES (250, '富文本-上传图片', '文件流', '{\"errno\":0,\"data\":{\"url\":\"http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png\"}}', 'http://localhost:9090/file/uploadImg', 15, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-25 11:58:44', 0);
INSERT INTO `sys_log` VALUES (251, '上传文件', '文件流', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":\"http://localhost:9090/file/download/27f7a9a8e1ab4cb38fe4719babb2f8d5.png\"}', 'http://localhost:9090/file/upload', 6, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-25 11:58:59', 0);
INSERT INTO `sys_log` VALUES (252, '新增动态', '{\"id\":17,\"名称\":\"小黑子你干嘛~\",\"内容\":\"<p><img src=\\\"http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p><p>小黑子你干嘛~小黑子你干嘛~小黑子你干嘛~小黑子你干嘛~</p><p>小黑子你干嘛~小黑子你干嘛~小黑子你干嘛~小黑子你干嘛~</p>\",\"图片\":\"http://localhost:9090/file/download/27f7a9a8e1ab4cb38fe4719babb2f8d5.png\",\"用户id\":19,\"时间\":\"2023-03-25 11:59:02\",\"创建时间\":1679716742950,\"更新时间\":1679716742950,\"descr\":\"小黑子你干嘛~\",\"tags\":[\"小黑子\",\"鸡你太美\"]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic', 123, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-25 11:59:03', 0);
INSERT INTO `sys_log` VALUES (253, '编辑动态', '{\"id\":16,\"软删除\":0,\"名称\":\"哈哈哈哈我是小黑粉\",\"内容\":\"<p>1111</p><p><img src=\\\"http://localhost:9090/file/download/30ab8bc3353645efb8716374b20688cb.png\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"图片\":\"http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png\",\"用户id\":19,\"时间\":\"2023-03-18 09:38:26\",\"创建时间\":1679103506000,\"更新时间\":1679103506000,\"descr\":\"我是小黑粉\",\"view\":117,\"user\":{\"id\":19,\"用户名\":\"gbb\",\"密码\":\"$2a$10$XmgagEBh2jlERi9JTAP3iub88e022RXMovXlV3ea/ZQbMi/.Yd3Ae\",\"昵称\":\"Ikun小黑子专用号\",\"邮箱\":\"ikun@163.com\",\"地址\":\"蔡徐坤北京分坤\",\"用户唯一id\":\"f3e75978695847e59c7c575d8379afa3\",\"头像\":\"http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1676121934000,\"updateTime\":1676121934000,\"角色\":\"USER\"},\"praiseCount\":3,\"collectCount\":3,\"commentCount\":3,\"tags\":[\"征婚\"]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic', 15, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-25 13:21:42', 0);
INSERT INTO `sys_log` VALUES (254, '编辑动态', '{\"id\":15,\"软删除\":0,\"名称\":\"今天真是一个好天气11\",\"内容\":\"<p>今天真是一个好天气</p><p><br></p><p><img src=\\\"http://localhost:9090/file/download/f3ffc202dd3e47888914ec6db3fcc093.jpg\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"图片\":\"http://localhost:9090/file/download/45a427d2ece84e0daa1d864e8f4bb713.jpg\",\"用户id\":19,\"时间\":\"2023-03-18 09:26:40\",\"创建时间\":1679102800000,\"更新时间\":1679102800000,\"descr\":\"真是一个好天气\",\"view\":16,\"user\":{\"id\":19,\"用户名\":\"gbb\",\"密码\":\"$2a$10$XmgagEBh2jlERi9JTAP3iub88e022RXMovXlV3ea/ZQbMi/.Yd3Ae\",\"昵称\":\"Ikun小黑子专用号\",\"邮箱\":\"ikun@163.com\",\"地址\":\"蔡徐坤北京分坤\",\"用户唯一id\":\"f3e75978695847e59c7c575d8379afa3\",\"头像\":\"http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1676121934000,\"updateTime\":1676121934000,\"角色\":\"USER\"},\"praiseCount\":1,\"collectCount\":0,\"commentCount\":1,\"tags\":[\"无聊的话题\"]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-25 13:21:47', 0);
INSERT INTO `sys_log` VALUES (255, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 17, '112.32.139.58', '安徽省合肥市', '', '2023-03-25 13:40:37', 0);
INSERT INTO `sys_log` VALUES (256, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 898, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-25 13:41:29', 0);
INSERT INTO `sys_log` VALUES (257, '新增点赞', '{\"id\":51,\"类型\":\"dynamic\",\"模块内容id\":17,\"用户id\":19,\"点赞时间\":1679722926524}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-25 13:42:07', 0);
INSERT INTO `sys_log` VALUES (258, '新增点赞', '{\"id\":52,\"类型\":\"dynamic\",\"模块内容id\":17,\"用户id\":19,\"点赞时间\":1679723033192}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 5155, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-25 13:43:59', 0);
INSERT INTO `sys_log` VALUES (259, '新增评论', '{\"id\":11,\"创建时间\":1679723176381,\"更新时间\":1679723176381,\"内容\":\"22123113\",\"用户\":19,\"动态\":17,\"时间\":\"2023-03-25 13:46:16\",\"属地\":\"安徽省合肥市\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/comments', 305, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-25 13:46:17', 0);
INSERT INTO `sys_log` VALUES (260, '富文本-上传图片', '文件流', '{\"errno\":0,\"data\":{\"url\":\"http://localhost:9090/file/download/08a75cd4da794ca98b672411629784f7.png\"}}', 'http://localhost:9090/file/uploadImg', 45, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-25 13:47:17', 0);
INSERT INTO `sys_log` VALUES (261, '富文本-上传图片', '文件流', '{\"errno\":0,\"data\":{\"url\":\"http://localhost:9090/file/download/f97531d34fb441b3becf9158da79e953.png\"}}', 'http://localhost:9090/file/uploadImg', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-25 13:47:23', 0);
INSERT INTO `sys_log` VALUES (262, '上传文件', '文件流', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":\"http://localhost:9090/file/download/c9376c9b6adb4a20a9c7b17bcfd3a515.png\"}', 'http://localhost:9090/file/upload', 16, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-25 13:47:26', 0);
INSERT INTO `sys_log` VALUES (263, '新增动态', '{\"id\":18,\"名称\":\"真的没人看我的直播吗？\",\"内容\":\"<p>哈哈哈 &nbsp;不是 &nbsp; iqing在看！！</p><p><br></p><p><img src=\\\"http://localhost:9090/file/download/08a75cd4da794ca98b672411629784f7.png\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/><img src=\\\"http://localhost:9090/file/download/f97531d34fb441b3becf9158da79e953.png\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"图片\":\"http://localhost:9090/file/download/c9376c9b6adb4a20a9c7b17bcfd3a515.png\",\"用户id\":19,\"时间\":\"2023-03-25 13:47:27\",\"创建时间\":1679723247789,\"更新时间\":1679723247789,\"descr\":\"啊哈哈好像是\",\"tags\":[\"小黑子\"]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic', 16, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-25 13:47:28', 0);
INSERT INTO `sys_log` VALUES (264, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 0, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 08:51:09', 0);
INSERT INTO `sys_log` VALUES (265, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 187, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 08:58:59', 0);
INSERT INTO `sys_log` VALUES (266, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 893, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 09:15:46', 0);
INSERT INTO `sys_log` VALUES (267, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 0, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 09:15:47', 0);
INSERT INTO `sys_log` VALUES (268, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 217, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 09:15:51', 0);
INSERT INTO `sys_log` VALUES (269, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 125, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 09:16:00', 0);
INSERT INTO `sys_log` VALUES (270, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 108, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 09:17:30', 0);
INSERT INTO `sys_log` VALUES (271, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 19, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 09:33:37', 0);
INSERT INTO `sys_log` VALUES (272, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 156, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 09:33:41', 0);
INSERT INTO `sys_log` VALUES (273, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 0, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 09:34:01', 0);
INSERT INTO `sys_log` VALUES (274, '用户登录', '{\"username\":\"ass\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 109, '112.32.139.58', '安徽省合肥市', 'ass', '2023-03-26 09:34:04', 0);
INSERT INTO `sys_log` VALUES (275, '新增点赞', '{\"id\":53,\"类型\":\"dynamic\",\"模块内容id\":18,\"用户id\":18,\"点赞时间\":1679794451946}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 63, '112.32.139.58', '安徽省合肥市', 'ass', '2023-03-26 09:34:12', 0);
INSERT INTO `sys_log` VALUES (276, '用户退出登录', 'c8dcfc6f12c94963b8514f7495f7ca4c', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/c8dcfc6f12c94963b8514f7495f7ca4c', 33, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 09:46:16', 0);
INSERT INTO `sys_log` VALUES (277, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 172, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 09:46:19', 0);
INSERT INTO `sys_log` VALUES (278, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 666, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 09:52:12', 0);
INSERT INTO `sys_log` VALUES (279, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 652, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 09:56:03', 0);
INSERT INTO `sys_log` VALUES (280, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 16, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 09:56:05', 0);
INSERT INTO `sys_log` VALUES (281, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 16, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 09:56:09', 0);
INSERT INTO `sys_log` VALUES (282, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 09:56:26', 0);
INSERT INTO `sys_log` VALUES (283, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 09:56:34', 0);
INSERT INTO `sys_log` VALUES (284, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 30, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 09:56:38', 0);
INSERT INTO `sys_log` VALUES (285, '用户登录', '{\"username\":\"ass\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 139, '112.32.139.58', '安徽省合肥市', 'ass', '2023-03-26 09:56:41', 0);
INSERT INTO `sys_log` VALUES (286, '新增点赞', '{\"id\":54,\"类型\":\"dynamic\",\"模块内容id\":16,\"用户id\":18,\"点赞时间\":1679795806660}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 55, '112.32.139.58', '安徽省合肥市', 'ass', '2023-03-26 09:56:47', 0);
INSERT INTO `sys_log` VALUES (287, '新增收藏', '{\"id\":13,\"动态\":17,\"收藏人\":18,\"创建时间\":1679795811950,\"更新时间\":1679795811950}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/collect', 15, '112.32.139.58', '安徽省合肥市', 'ass', '2023-03-26 09:56:52', 0);
INSERT INTO `sys_log` VALUES (288, '新增点赞', '{\"id\":55,\"类型\":\"dynamic\",\"模块内容id\":17,\"用户id\":18,\"点赞时间\":1679795813069}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/praise', 16, '112.32.139.58', '安徽省合肥市', 'ass', '2023-03-26 09:56:53', 0);
INSERT INTO `sys_log` VALUES (289, '用户退出登录', 'c8dcfc6f12c94963b8514f7495f7ca4c', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/c8dcfc6f12c94963b8514f7495f7ca4c', 0, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 09:56:57', 0);
INSERT INTO `sys_log` VALUES (290, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 93, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 09:57:01', 0);
INSERT INTO `sys_log` VALUES (291, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 09:57:37', 0);
INSERT INTO `sys_log` VALUES (292, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 09:58:46', 0);
INSERT INTO `sys_log` VALUES (293, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 09:58:55', 0);
INSERT INTO `sys_log` VALUES (294, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 09:58:57', 0);
INSERT INTO `sys_log` VALUES (295, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 09:59:27', 0);
INSERT INTO `sys_log` VALUES (296, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 15, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 09:59:28', 0);
INSERT INTO `sys_log` VALUES (297, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 15, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 09:59:29', 0);
INSERT INTO `sys_log` VALUES (298, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 09:59:42', 0);
INSERT INTO `sys_log` VALUES (299, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 16, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 09:59:45', 0);
INSERT INTO `sys_log` VALUES (300, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 0, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 09:59:50', 0);
INSERT INTO `sys_log` VALUES (301, '用户登录', '{\"username\":\"ass\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 94, '112.32.139.58', '安徽省合肥市', 'ass', '2023-03-26 09:59:52', 0);
INSERT INTO `sys_log` VALUES (302, '新增评论', '{\"id\":12,\"创建时间\":1679796009153,\"更新时间\":1679796009154,\"内容\":\"哈哈哈 小黑子\",\"用户\":18,\"动态\":16,\"时间\":\"2023-03-26 10:00:08\",\"属地\":\"安徽省合肥市\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/comments', 311, '112.32.139.58', '安徽省合肥市', 'ass', '2023-03-26 10:00:09', 0);
INSERT INTO `sys_log` VALUES (303, '用户退出登录', 'c8dcfc6f12c94963b8514f7495f7ca4c', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/c8dcfc6f12c94963b8514f7495f7ca4c', 0, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 10:00:14', 0);
INSERT INTO `sys_log` VALUES (304, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 104, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:00:19', 0);
INSERT INTO `sys_log` VALUES (305, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:00:26', 0);
INSERT INTO `sys_log` VALUES (306, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:00:44', 0);
INSERT INTO `sys_log` VALUES (307, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:00:45', 0);
INSERT INTO `sys_log` VALUES (308, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 16, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 10:00:52', 0);
INSERT INTO `sys_log` VALUES (309, '用户登录', '{\"username\":\"ass\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 94, '112.32.139.58', '安徽省合肥市', 'ass', '2023-03-26 10:00:59', 0);
INSERT INTO `sys_log` VALUES (310, '新增评论', '{\"id\":13,\"创建时间\":1679796134375,\"更新时间\":1679796134375,\"内容\":\"小黑子漏出鸡脚了吧\",\"用户\":18,\"动态\":18,\"时间\":\"2023-03-26 10:02:14\",\"属地\":\"安徽省合肥市\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/comments', 262, '112.32.139.58', '安徽省合肥市', 'ass', '2023-03-26 10:02:15', 0);
INSERT INTO `sys_log` VALUES (311, '用户退出登录', 'c8dcfc6f12c94963b8514f7495f7ca4c', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/c8dcfc6f12c94963b8514f7495f7ca4c', 0, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 10:02:20', 0);
INSERT INTO `sys_log` VALUES (312, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 93, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:02:24', 0);
INSERT INTO `sys_log` VALUES (313, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:02:29', 0);
INSERT INTO `sys_log` VALUES (314, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:03:44', 0);
INSERT INTO `sys_log` VALUES (315, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:04:00', 0);
INSERT INTO `sys_log` VALUES (316, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 16, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:04:02', 0);
INSERT INTO `sys_log` VALUES (317, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:04:06', 0);
INSERT INTO `sys_log` VALUES (318, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:04:16', 0);
INSERT INTO `sys_log` VALUES (319, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:04:31', 0);
INSERT INTO `sys_log` VALUES (320, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:05:44', 0);
INSERT INTO `sys_log` VALUES (321, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:05:47', 0);
INSERT INTO `sys_log` VALUES (322, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 15, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:05:55', 0);
INSERT INTO `sys_log` VALUES (323, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 16, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:08:55', 0);
INSERT INTO `sys_log` VALUES (324, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 15, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:09:00', 0);
INSERT INTO `sys_log` VALUES (325, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:09:53', 0);
INSERT INTO `sys_log` VALUES (326, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:10:21', 0);
INSERT INTO `sys_log` VALUES (327, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:11:28', 0);
INSERT INTO `sys_log` VALUES (328, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:11:36', 0);
INSERT INTO `sys_log` VALUES (329, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:11:54', 0);
INSERT INTO `sys_log` VALUES (330, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 15, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:12:15', 0);
INSERT INTO `sys_log` VALUES (331, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 16, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:12:42', 0);
INSERT INTO `sys_log` VALUES (332, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:12:47', 0);
INSERT INTO `sys_log` VALUES (333, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:13:13', 0);
INSERT INTO `sys_log` VALUES (334, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:13:18', 0);
INSERT INTO `sys_log` VALUES (335, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 26, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:14:14', 0);
INSERT INTO `sys_log` VALUES (336, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:14:23', 0);
INSERT INTO `sys_log` VALUES (337, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:14:43', 0);
INSERT INTO `sys_log` VALUES (338, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:14:55', 0);
INSERT INTO `sys_log` VALUES (339, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:16:22', 0);
INSERT INTO `sys_log` VALUES (340, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:18:59', 0);
INSERT INTO `sys_log` VALUES (341, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:19:01', 0);
INSERT INTO `sys_log` VALUES (342, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:19:08', 0);
INSERT INTO `sys_log` VALUES (343, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:19:37', 0);
INSERT INTO `sys_log` VALUES (344, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:20:20', 0);
INSERT INTO `sys_log` VALUES (345, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:21:14', 0);
INSERT INTO `sys_log` VALUES (346, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:21:20', 0);
INSERT INTO `sys_log` VALUES (347, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:21:27', 0);
INSERT INTO `sys_log` VALUES (348, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:21:46', 0);
INSERT INTO `sys_log` VALUES (349, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 10:21:57', 0);
INSERT INTO `sys_log` VALUES (350, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 78, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 12:52:18', 0);
INSERT INTO `sys_log` VALUES (351, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 20, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 13:03:20', 0);
INSERT INTO `sys_log` VALUES (352, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 176, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 13:03:24', 0);
INSERT INTO `sys_log` VALUES (353, '新增权限', '{\"id\":480,\"名称\":\"积分商城\",\"顺序\":1,\"图标\":\"grid\",\"类型\":1,\"创建时间\":1679807178729,\"更新时间\":1679807178729}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 0, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 13:06:19', 0);
INSERT INTO `sys_log` VALUES (354, '编辑权限', '{\"id\":456,\"名称\":\"收货地址管理\",\"路径\":\"address\",\"顺序\":1,\"图标\":\"grid\",\"页面路径\":\"Address\",\"父级id\":480,\"类型\":2,\"逻辑删除\":0,\"更新时间\":1679807192417,\"children\":[{\"id\":457,\"名称\":\"收货地址查询\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"address.list\",\"父级id\":456,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":458,\"名称\":\"收货地址新增\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"address.add\",\"父级id\":456,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":459,\"名称\":\"收货地址导入\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"address.import\",\"父级id\":456,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":460,\"名称\":\"收货地址导出\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"address.export\",\"父级id\":456,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":461,\"名称\":\"批量删除\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"address.deleteBatch\",\"父级id\":456,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":462,\"名称\":\"收货地址编辑\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"address.edit\",\"父级id\":456,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":463,\"名称\":\"收货地址删除\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"address.delete\",\"父级id\":456,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false}],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 0, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 13:06:33', 0);
INSERT INTO `sys_log` VALUES (355, '编辑权限', '{\"id\":464,\"名称\":\"积分商品管理\",\"路径\":\"goods\",\"顺序\":1,\"图标\":\"grid\",\"页面路径\":\"Goods\",\"父级id\":480,\"类型\":2,\"逻辑删除\":0,\"更新时间\":1679807202330,\"children\":[{\"id\":465,\"名称\":\"积分商品查询\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"goods.list\",\"父级id\":464,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":466,\"名称\":\"积分商品新增\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"goods.add\",\"父级id\":464,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":467,\"名称\":\"积分商品导入\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"goods.import\",\"父级id\":464,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":468,\"名称\":\"积分商品导出\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"goods.export\",\"父级id\":464,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":469,\"名称\":\"批量删除\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"goods.deleteBatch\",\"父级id\":464,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":470,\"名称\":\"积分商品编辑\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"goods.edit\",\"父级id\":464,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":471,\"名称\":\"积分商品删除\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"goods.delete\",\"父级id\":464,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false}],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 9, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 13:06:43', 0);
INSERT INTO `sys_log` VALUES (356, '编辑权限', '{\"id\":472,\"名称\":\"积分订单管理\",\"路径\":\"orders\",\"顺序\":1,\"图标\":\"grid\",\"页面路径\":\"Orders\",\"父级id\":480,\"类型\":2,\"逻辑删除\":0,\"更新时间\":1679807211098,\"children\":[{\"id\":473,\"名称\":\"积分订单查询\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"orders.list\",\"父级id\":472,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":474,\"名称\":\"积分订单新增\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"orders.add\",\"父级id\":472,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":475,\"名称\":\"积分订单导入\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"orders.import\",\"父级id\":472,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":476,\"名称\":\"积分订单导出\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"orders.export\",\"父级id\":472,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":477,\"名称\":\"批量删除\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"orders.deleteBatch\",\"父级id\":472,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":478,\"名称\":\"积分订单编辑\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"orders.edit\",\"父级id\":472,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":479,\"名称\":\"积分订单删除\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"orders.delete\",\"父级id\":472,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false}],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 0, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 13:06:51', 0);
INSERT INTO `sys_log` VALUES (357, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 13:07:01', 0);
INSERT INTO `sys_log` VALUES (358, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 78, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 13:07:05', 0);
INSERT INTO `sys_log` VALUES (359, '编辑角色', '{\"id\":1,\"名称\":\"管理员\",\"唯一标识\":\"ADMIN\",\"逻辑删除\":0,\"创建时间\":1673869784000,\"更新时间\":1673869795000,\"permissionIds\":[12,186,208,209,210,211,212,213,214,215,392,393,394,395,396,397,398,399,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,480,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,1,3,4,8,9,14,15,16,10,21,22,23,25,26,27,11,30,31,32,34,35,13,37,38,39,40,41,42,96,97,98,99,100,101,102,360,361,362,363,364,365,366,367]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 108, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 13:07:18', 0);
INSERT INTO `sys_log` VALUES (360, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 13:07:19', 0);
INSERT INTO `sys_log` VALUES (361, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 94, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 13:07:23', 0);
INSERT INTO `sys_log` VALUES (362, '上传文件', '文件流', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":\"http://localhost:9090/file/download/9ed2f656c90242689ed55b55aa4cb7c9.png\"}', 'http://localhost:9090/file/upload', 31, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 13:09:52', 0);
INSERT INTO `sys_log` VALUES (363, '新增积分商品', '{\"id\":1,\"编号\":\"G-31167291\",\"名称\":\"运动手表\",\"价格\":199,\"单位\":\"个\",\"库存\":1000,\"所需积分\":500,\"图片\":\"http://localhost:9090/file/download/9ed2f656c90242689ed55b55aa4cb7c9.png\",\"是否上架\":\"是\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/goods', 585, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 13:11:03', 0);
INSERT INTO `sys_log` VALUES (364, '上传文件', '文件流', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":\"http://localhost:9090/file/download/31351baf97a943cdaf1489092d937593.png\"}', 'http://localhost:9090/file/upload', 17, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 13:11:15', 0);
INSERT INTO `sys_log` VALUES (365, '上传文件', '文件流', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":\"http://localhost:9090/file/download/31351baf97a943cdaf1489092d937593.png\"}', 'http://localhost:9090/file/upload', 16, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 13:11:31', 0);
INSERT INTO `sys_log` VALUES (366, '新增积分商品', '{\"id\":2,\"编号\":\"G-06961673\",\"名称\":\"数码相机\",\"价格\":999,\"单位\":\"个\",\"库存\":100,\"所需积分\":1000,\"图片\":\"http://localhost:9090/file/download/31351baf97a943cdaf1489092d937593.png\",\"是否上架\":\"是\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/goods', 0, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 13:11:33', 0);
INSERT INTO `sys_log` VALUES (367, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 15, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 13:11:41', 0);
INSERT INTO `sys_log` VALUES (368, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 141, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 13:11:49', 0);
INSERT INTO `sys_log` VALUES (369, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 16, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 13:13:55', 0);
INSERT INTO `sys_log` VALUES (370, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 136, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 13:14:00', 0);
INSERT INTO `sys_log` VALUES (371, '编辑角色', '{\"id\":3,\"名称\":\"普通用户\",\"唯一标识\":\"USER\",\"逻辑删除\":0,\"创建时间\":1673869841000,\"更新时间\":1673869841000,\"permissionIds\":[12]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 0, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 13:16:46', 0);
INSERT INTO `sys_log` VALUES (372, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 13:16:49', 0);
INSERT INTO `sys_log` VALUES (373, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":19,\"用户名\":\"gbb\",\"密码\":\"$2a$10$XmgagEBh2jlERi9JTAP3iub88e022RXMovXlV3ea/ZQbMi/.Yd3Ae\",\"昵称\":\"Ikun小黑子专用号\",\"邮箱\":\"ikun@163.com\",\"地址\":\"蔡徐坤北京分坤\",\"用户唯一id\":\"f3e75978695847e59c7c575d8379afa3\",\"头像\":\"http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1676121934000,\"updateTime\":1676121934000,\"角色\":\"USER\",\"score\":9},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJmM2U3NTk3ODY5NTg0N2U1OWM3YzU3NWQ4Mzc5YWZhMyIsInJuU3RyIjoiclZZeHQyZVY0cVFpQmFEeUFCQWd2ME1OZTkxYXZlR2wifQ.TA-Di6StokUGLo5jPHeto3nC3jO8eO63aJxAWh52_rc\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675170180000,\"更新时间\":1675170180000,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 95, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 13:16:53', 0);
INSERT INTO `sys_log` VALUES (374, '新增收货地址', '{\"id\":1,\"地址\":\"安徽省合肥市政务区1001号\",\"收件人名称\":\"小黑子\",\"收件人id\":19,\"电话\":\"13699559988\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/address', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 13:21:44', 0);
INSERT INTO `sys_log` VALUES (375, '新增收货地址', '{\"id\":2,\"地址\":\"安徽省合肥市\",\"收件人名称\":\"小黑子1号\",\"收件人id\":19,\"电话\":\"13899669988\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/address', 16, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 13:42:28', 0);
INSERT INTO `sys_log` VALUES (376, '新增积分订单', '{\"商品id\":2,\"数量\":1,\"address\":\"小黑子, 13699559988, 安徽省合肥市政务区1001号 \"}', '{\"code\":\"-1\",\"msg\":\"您的积分不足\"}', 'http://localhost:9090/orders', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 13:55:01', 0);
INSERT INTO `sys_log` VALUES (377, '新增积分订单', '{\"商品id\":2,\"数量\":1,\"address\":\"小黑子, 13699559988, 安徽省合肥市政务区1001号 \"}', '{\"code\":\"-1\",\"msg\":\"您的积分不足\"}', 'http://localhost:9090/orders', 14, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 13:55:25', 0);
INSERT INTO `sys_log` VALUES (378, '新增积分订单', '{\"id\":1,\"订单编号\":\"202303026229201\",\"商品id\":2,\"数量\":1,\"换购时间\":\"2023-03-26 13:57:09\",\"积分\":1000,\"用户id\":19,\"address\":\"小黑子, 13699559988, 安徽省合肥市政务区1001号 \"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/orders', 87, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 13:57:10', 0);
INSERT INTO `sys_log` VALUES (379, '新增积分订单', '{\"id\":2,\"订单编号\":\"202303026590040\",\"商品id\":2,\"数量\":1,\"换购时间\":\"2023-03-26 14:03:09\",\"积分\":1000,\"用户id\":19,\"address\":\"小黑子1号, 13899669988, 安徽省合肥市 \"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/orders', 111, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 14:03:11', 0);
INSERT INTO `sys_log` VALUES (380, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 16, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 14:03:33', 0);
INSERT INTO `sys_log` VALUES (381, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 139, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 14:03:37', 0);
INSERT INTO `sys_log` VALUES (382, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 14:15:13', 0);
INSERT INTO `sys_log` VALUES (383, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 95, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 14:15:19', 0);
INSERT INTO `sys_log` VALUES (384, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 16, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 14:43:17', 0);
INSERT INTO `sys_log` VALUES (385, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, NULL, NULL, '', '2023-03-26 14:43:17', 0);
INSERT INTO `sys_log` VALUES (386, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 125, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 14:43:44', 0);
INSERT INTO `sys_log` VALUES (387, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 14:43:47', 0);
INSERT INTO `sys_log` VALUES (388, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":19,\"用户名\":\"gbb\",\"密码\":\"$2a$10$XmgagEBh2jlERi9JTAP3iub88e022RXMovXlV3ea/ZQbMi/.Yd3Ae\",\"昵称\":\"Ikun小黑子专用号\",\"邮箱\":\"ikun@163.com\",\"地址\":\"蔡徐坤北京分坤\",\"用户唯一id\":\"f3e75978695847e59c7c575d8379afa3\",\"头像\":\"http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1676121934000,\"updateTime\":1676121934000,\"角色\":\"USER\",\"score\":18000},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJmM2U3NTk3ODY5NTg0N2U1OWM3YzU3NWQ4Mzc5YWZhMyIsInJuU3RyIjoibjFOWjFMd2xwUlV2M040UTMwaFpGSVE2MmVFYVJRQ0MifQ.3tkfRmXS10jl9vN_2jnsVLOX9dSFaqq16DRIEoPtp9Y\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675170180000,\"更新时间\":1675170180000,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 108, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 14:43:50', 0);
INSERT INTO `sys_log` VALUES (389, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 0, '112.32.139.58', NULL, '', '2023-03-26 14:45:36', 0);
INSERT INTO `sys_log` VALUES (390, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 79, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 14:45:38', 0);
INSERT INTO `sys_log` VALUES (391, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 15, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 14:50:36', 0);
INSERT INTO `sys_log` VALUES (392, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":19,\"用户名\":\"gbb\",\"密码\":\"$2a$10$XmgagEBh2jlERi9JTAP3iub88e022RXMovXlV3ea/ZQbMi/.Yd3Ae\",\"昵称\":\"Ikun小黑子专用号\",\"邮箱\":\"ikun@163.com\",\"地址\":\"蔡徐坤北京分坤\",\"用户唯一id\":\"f3e75978695847e59c7c575d8379afa3\",\"头像\":\"http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1676121934000,\"updateTime\":1676121934000,\"角色\":\"USER\",\"score\":18000},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJmM2U3NTk3ODY5NTg0N2U1OWM3YzU3NWQ4Mzc5YWZhMyIsInJuU3RyIjoieWVFWld0WWJmaFJPa0hlMnFzVEJoa2JvWHpUT1g4Qm0ifQ.dDAlJNw3cfpwDpp8w29468N5_tKoTu7oCV4IjbA_7Y0\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675170180000,\"更新时间\":1675170180000,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 80, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 14:51:10', 0);
INSERT INTO `sys_log` VALUES (393, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 0, NULL, NULL, '', '2023-03-26 14:56:31', 0);
INSERT INTO `sys_log` VALUES (394, '用户登录', '{\"username\":\"ass\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":18,\"用户名\":\"ass\",\"密码\":\"$2a$10$Wfsje9KSLFOGFSsyU/OQ6e7Z9UbdKH3gnjH2DRoyX07EID0GaNrLG\",\"昵称\":\"系统用户6usym6\",\"邮箱\":\"asss@163.com\",\"用户唯一id\":\"c8dcfc6f12c94963b8514f7495f7ca4c\",\"头像\":\"http://localhost:9090/file/download/dfcf5f36d649469393f9a0cff3a9adbd.png\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1675519424000,\"updateTime\":1675519424000,\"角色\":\"USER\",\"score\":7},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJjOGRjZmM2ZjEyYzk0OTYzYjg1MTRmNzQ5NWY3Y2E0YyIsInJuU3RyIjoiSVUzWkVuRWM0ZGp6YnVkNVRudTQ0QlBjN1J1ZnJyTW4ifQ.eVKRwJgRJWjLGz7f6cRvILcYfBWmX0nrZYyctDNXDb4\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675170180000,\"更新时间\":1675170180000,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 93, NULL, NULL, 'ass', '2023-03-26 14:56:39', 0);
INSERT INTO `sys_log` VALUES (395, '用户登录', '{\"username\":\"ass\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":18,\"用户名\":\"ass\",\"密码\":\"$2a$10$Wfsje9KSLFOGFSsyU/OQ6e7Z9UbdKH3gnjH2DRoyX07EID0GaNrLG\",\"昵称\":\"系统用户6usym6\",\"邮箱\":\"asss@163.com\",\"用户唯一id\":\"c8dcfc6f12c94963b8514f7495f7ca4c\",\"头像\":\"http://localhost:9090/file/download/dfcf5f36d649469393f9a0cff3a9adbd.png\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1675519424000,\"updateTime\":1675519424000,\"角色\":\"USER\",\"score\":7},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJjOGRjZmM2ZjEyYzk0OTYzYjg1MTRmNzQ5NWY3Y2E0YyIsInJuU3RyIjoiSVUzWkVuRWM0ZGp6YnVkNVRudTQ0QlBjN1J1ZnJyTW4ifQ.eVKRwJgRJWjLGz7f6cRvILcYfBWmX0nrZYyctDNXDb4\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675170180000,\"更新时间\":1675170180000,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 92, NULL, NULL, 'ass', '2023-03-26 14:56:42', 0);
INSERT INTO `sys_log` VALUES (396, '用户登录', '{\"username\":\"ass\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":18,\"用户名\":\"ass\",\"密码\":\"$2a$10$Wfsje9KSLFOGFSsyU/OQ6e7Z9UbdKH3gnjH2DRoyX07EID0GaNrLG\",\"昵称\":\"系统用户6usym6\",\"邮箱\":\"asss@163.com\",\"用户唯一id\":\"c8dcfc6f12c94963b8514f7495f7ca4c\",\"头像\":\"http://localhost:9090/file/download/dfcf5f36d649469393f9a0cff3a9adbd.png\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1675519424000,\"updateTime\":1675519424000,\"角色\":\"USER\",\"score\":7},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJjOGRjZmM2ZjEyYzk0OTYzYjg1MTRmNzQ5NWY3Y2E0YyIsInJuU3RyIjoiSVUzWkVuRWM0ZGp6YnVkNVRudTQ0QlBjN1J1ZnJyTW4ifQ.eVKRwJgRJWjLGz7f6cRvILcYfBWmX0nrZYyctDNXDb4\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675170180000,\"更新时间\":1675170180000,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 76, '112.32.139.58', '安徽省合肥市', 'ass', '2023-03-26 14:56:44', 0);
INSERT INTO `sys_log` VALUES (397, '用户登录', '{\"username\":\"ass\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":18,\"用户名\":\"ass\",\"密码\":\"$2a$10$Wfsje9KSLFOGFSsyU/OQ6e7Z9UbdKH3gnjH2DRoyX07EID0GaNrLG\",\"昵称\":\"系统用户6usym6\",\"邮箱\":\"asss@163.com\",\"用户唯一id\":\"c8dcfc6f12c94963b8514f7495f7ca4c\",\"头像\":\"http://localhost:9090/file/download/dfcf5f36d649469393f9a0cff3a9adbd.png\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1675519424000,\"updateTime\":1675519424000,\"角色\":\"USER\",\"score\":7},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJjOGRjZmM2ZjEyYzk0OTYzYjg1MTRmNzQ5NWY3Y2E0YyIsInJuU3RyIjoiSVUzWkVuRWM0ZGp6YnVkNVRudTQ0QlBjN1J1ZnJyTW4ifQ.eVKRwJgRJWjLGz7f6cRvILcYfBWmX0nrZYyctDNXDb4\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675170180000,\"更新时间\":1675170180000,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 92, '112.32.139.58', '安徽省合肥市', 'ass', '2023-03-26 14:56:45', 0);
INSERT INTO `sys_log` VALUES (398, '用户退出登录', 'c8dcfc6f12c94963b8514f7495f7ca4c', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/c8dcfc6f12c94963b8514f7495f7ca4c', 0, '112.32.139.58', NULL, '', '2023-03-26 14:56:50', 0);
INSERT INTO `sys_log` VALUES (399, '用户登录', '{\"username\":\"ass\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":18,\"用户名\":\"ass\",\"密码\":\"$2a$10$Wfsje9KSLFOGFSsyU/OQ6e7Z9UbdKH3gnjH2DRoyX07EID0GaNrLG\",\"昵称\":\"系统用户6usym6\",\"邮箱\":\"asss@163.com\",\"用户唯一id\":\"c8dcfc6f12c94963b8514f7495f7ca4c\",\"头像\":\"http://localhost:9090/file/download/dfcf5f36d649469393f9a0cff3a9adbd.png\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1675519424000,\"updateTime\":1675519424000,\"角色\":\"USER\",\"score\":7},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJjOGRjZmM2ZjEyYzk0OTYzYjg1MTRmNzQ5NWY3Y2E0YyIsInJuU3RyIjoiNlNGMUEzaEloc1NqZEo1VGJ2VWZpVVlyVTZhMXJQMDUifQ.1KCWJtWAyRpZRvFeXcdZ26rU6zWLqNcUZkBftTnypy0\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675170180000,\"更新时间\":1675170180000,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 107, '112.32.139.58', '安徽省合肥市', 'ass', '2023-03-26 14:56:54', 0);
INSERT INTO `sys_log` VALUES (400, '用户退出登录', 'c8dcfc6f12c94963b8514f7495f7ca4c', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/c8dcfc6f12c94963b8514f7495f7ca4c', 0, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 14:56:56', 0);
INSERT INTO `sys_log` VALUES (401, '用户登录', '{\"username\":\"ass\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":18,\"用户名\":\"ass\",\"密码\":\"$2a$10$Wfsje9KSLFOGFSsyU/OQ6e7Z9UbdKH3gnjH2DRoyX07EID0GaNrLG\",\"昵称\":\"系统用户6usym6\",\"邮箱\":\"asss@163.com\",\"用户唯一id\":\"c8dcfc6f12c94963b8514f7495f7ca4c\",\"头像\":\"http://localhost:9090/file/download/dfcf5f36d649469393f9a0cff3a9adbd.png\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1675519424000,\"updateTime\":1675519424000,\"角色\":\"USER\",\"score\":7},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJjOGRjZmM2ZjEyYzk0OTYzYjg1MTRmNzQ5NWY3Y2E0YyIsInJuU3RyIjoiQk9memIyYUNlRlVpc0NnWDloY0NCdFEySWRzSENxdnYifQ.txFncaIeLm_8GBTNeJ1DI2KW2Sys6xXRE4KUg28pkYw\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675170180000,\"更新时间\":1675170180000,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 77, '112.32.139.58', '安徽省合肥市', 'ass', '2023-03-26 14:57:37', 0);
INSERT INTO `sys_log` VALUES (402, '新增评论', '{\"id\":14,\"创建时间\":1679813884920,\"更新时间\":1679813884920,\"内容\":\"小黑子太帅了吧！\",\"用户\":18,\"动态\":18,\"时间\":\"2023-03-26 14:58:04\",\"属地\":\"安徽省合肥市\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/comments', 313, '112.32.139.58', '安徽省合肥市', 'ass', '2023-03-26 14:58:05', 0);
INSERT INTO `sys_log` VALUES (403, '用户退出登录', 'c8dcfc6f12c94963b8514f7495f7ca4c', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/c8dcfc6f12c94963b8514f7495f7ca4c', 0, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 14:58:08', 0);
INSERT INTO `sys_log` VALUES (404, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":19,\"用户名\":\"gbb\",\"密码\":\"$2a$10$XmgagEBh2jlERi9JTAP3iub88e022RXMovXlV3ea/ZQbMi/.Yd3Ae\",\"昵称\":\"Ikun小黑子专用号\",\"邮箱\":\"ikun@163.com\",\"地址\":\"蔡徐坤北京分坤\",\"用户唯一id\":\"f3e75978695847e59c7c575d8379afa3\",\"头像\":\"http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1676121934000,\"updateTime\":1676121934000,\"角色\":\"USER\",\"score\":18000},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJmM2U3NTk3ODY5NTg0N2U1OWM3YzU3NWQ4Mzc5YWZhMyIsInJuU3RyIjoiSVM0WFZkZEF0Q3dDWlpTV3BIRnRVMEVYRDRpNE1Rc0cifQ.W8ps_kwwWosyTUOq3WqotnE5eTEQkMaM-wO42DfdMwY\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675170180000,\"更新时间\":1675170180000,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 94, '112.32.139.58', NULL, 'gbb', '2023-03-26 14:58:12', 0);
INSERT INTO `sys_log` VALUES (405, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 14:58:29', 0);
INSERT INTO `sys_log` VALUES (406, '富文本-上传图片', '文件流', '{\"errno\":0,\"data\":{\"url\":\"http://localhost:9090/file/download/44de2a1f72444ee7b70f0a2250dda616.png\"}}', 'http://localhost:9090/file/uploadImg', 15, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 14:59:43', 0);
INSERT INTO `sys_log` VALUES (407, '上传文件', '文件流', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":\"http://localhost:9090/file/download/e5d11ee679f442d9aeb8279319b86a1f.png\"}', 'http://localhost:9090/file/upload', 15, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 14:59:49', 0);
INSERT INTO `sys_log` VALUES (408, '新增动态', '{\"id\":19,\"名称\":\"今天天气怎么样\",\"内容\":\"<p><img src=\\\"http://localhost:9090/file/download/44de2a1f72444ee7b70f0a2250dda616.png\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"图片\":\"http://localhost:9090/file/download/e5d11ee679f442d9aeb8279319b86a1f.png\",\"用户id\":19,\"时间\":\"2023-03-26 14:59:50\",\"创建时间\":1679813990458,\"更新时间\":1679813990458,\"descr\":\"今天天气还好吧\",\"tags\":[\"恋爱\"]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic', 15, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 14:59:51', 0);
INSERT INTO `sys_log` VALUES (409, '新增收藏', '{\"id\":14,\"动态\":18,\"收藏人\":19,\"创建时间\":1679814014878,\"更新时间\":1679814014878}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/collect', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 15:00:15', 0);
INSERT INTO `sys_log` VALUES (410, '新增积分订单', '{\"id\":4,\"订单编号\":\"202303026060426\",\"商品id\":2,\"数量\":1,\"换购时间\":\"2023-03-26 15:01:00\",\"积分\":1000,\"用户id\":19,\"address\":\"小黑子1号, 13899669988, 安徽省合肥市 \"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/orders', 16, '112.32.139.58', NULL, 'gbb', '2023-03-26 15:01:04', 0);
INSERT INTO `sys_log` VALUES (411, '新增积分订单', '{\"id\":3,\"订单编号\":\"202303026054733\",\"商品id\":1,\"数量\":1,\"换购时间\":\"2023-03-26 15:00:54\",\"积分\":500,\"用户id\":19,\"address\":\"小黑子1号, 13899669988, 安徽省合肥市 \"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/orders', 32, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 15:01:10', 0);
INSERT INTO `sys_log` VALUES (412, '更新消息已读', '', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/messages/read', 0, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 15:01:27', 0);
INSERT INTO `sys_log` VALUES (413, '新增积分订单', '{\"id\":5,\"订单编号\":\"202303026159411\",\"商品id\":1,\"数量\":1,\"换购时间\":\"2023-03-26 15:02:39\",\"积分\":500,\"用户id\":19,\"address\":\"小黑子1号, 13899669988, 安徽省合肥市 \"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/orders', 16, '112.32.139.58', '安徽省合肥市', 'gbb', '2023-03-26 15:02:40', 0);
INSERT INTO `sys_log` VALUES (414, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 93, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 15:03:32', 0);
INSERT INTO `sys_log` VALUES (415, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 94, '112.32.139.58', '安徽省合肥市', 'admin', '2023-03-26 15:03:32', 0);
INSERT INTO `sys_log` VALUES (416, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 0, '112.32.139.58', '安徽省合肥市', '', '2023-03-26 15:03:35', 0);
INSERT INTO `sys_log` VALUES (417, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 749, '112.32.139.58', NULL, 'admin', '2023-03-26 15:04:33', 0);
INSERT INTO `sys_log` VALUES (418, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.139.58', NULL, '', '2023-03-26 15:04:43', 0);
INSERT INTO `sys_log` VALUES (419, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 125, '112.32.139.58', NULL, 'admin', '2023-03-26 15:04:54', 0);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路径',
  `orders` int(11) NULL DEFAULT 1 COMMENT '顺序',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'grid' COMMENT '图标',
  `page` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  `auth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `type` int(1) NULL DEFAULT NULL COMMENT '类型，1目录  2菜单 3按钮',
  `hide` tinyint(1) NULL DEFAULT 0 COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `a_d_index`(`auth`, `deleted`) USING BTREE,
  UNIQUE INDEX `p_p_d_index`(`path`, `page`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 481 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, '系统管理', '', 2, 'menu', NULL, NULL, NULL, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 1, 0);
INSERT INTO `sys_permission` VALUES (3, '用户管理', 'user', 1, 'grid', 'User', 'user.list', 1, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 2, 0);
INSERT INTO `sys_permission` VALUES (4, '用户新增', '', 1, NULL, '', 'user.add', 3, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 3, 0);
INSERT INTO `sys_permission` VALUES (8, '用户编辑', '', 1, NULL, NULL, 'user.edit', 3, 0, NULL, '2023-01-28 11:45:21', 3, 0);
INSERT INTO `sys_permission` VALUES (9, '用户删除', NULL, 1, NULL, NULL, 'user.delete', 3, 0, '2023-01-29 11:04:15', '2023-01-29 11:04:15', 3, 0);
INSERT INTO `sys_permission` VALUES (10, '角色管理', 'role', 1, 'grid', 'Role', 'role.list', 1, 0, '2023-01-31 20:32:59', '2023-01-31 20:32:59', 2, 0);
INSERT INTO `sys_permission` VALUES (11, '权限管理', 'permission', 1, 'grid', 'Permission', 'permission.list', 1, 0, '2023-01-31 20:33:25', '2023-01-31 20:33:25', 2, 0);
INSERT INTO `sys_permission` VALUES (12, '首页', 'home', 1, 'house', 'Home', NULL, NULL, 0, '2023-01-31 21:03:00', '2023-01-31 21:03:00', 2, 0);
INSERT INTO `sys_permission` VALUES (13, '数据字典管理', 'dict', 1, 'grid', 'Dict', 'dict.list', 1, 0, '2023-02-02 20:41:32', '2023-02-02 20:41:32', 2, 0);
INSERT INTO `sys_permission` VALUES (14, '批量删除', NULL, 1, '', NULL, 'user.deleteBatch', 3, 0, '2023-02-02 22:32:22', '2023-02-02 22:32:22', 3, 0);
INSERT INTO `sys_permission` VALUES (15, '用户导入', NULL, 1, NULL, NULL, 'user.import', 3, 0, '2023-02-02 22:32:53', '2023-02-02 22:32:53', 3, 0);
INSERT INTO `sys_permission` VALUES (16, '用户导出', NULL, 1, NULL, NULL, 'user.export', 3, 0, '2023-02-02 22:33:08', '2023-02-02 22:33:08', 3, 0);
INSERT INTO `sys_permission` VALUES (21, '角色新增', NULL, 1, NULL, '', 'role.add', 10, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 3, 0);
INSERT INTO `sys_permission` VALUES (22, '角色编辑', NULL, 1, NULL, NULL, 'role.edit', 10, 0, NULL, '2023-01-28 11:45:21', 3, 0);
INSERT INTO `sys_permission` VALUES (23, '角色删除', NULL, 1, NULL, NULL, 'role.delete', 10, 0, '2023-01-29 11:04:15', '2023-01-29 11:04:15', 3, 0);
INSERT INTO `sys_permission` VALUES (25, '批量删除', NULL, 1, NULL, NULL, 'role.deleteBatch', 10, 0, '2023-02-02 22:32:22', '2023-02-02 22:32:22', 3, 0);
INSERT INTO `sys_permission` VALUES (26, '角色导入', NULL, 1, NULL, NULL, 'role.import', 10, 0, '2023-02-02 22:32:53', '2023-02-02 22:32:53', 3, 0);
INSERT INTO `sys_permission` VALUES (27, '角色导出', NULL, 1, NULL, NULL, 'role.export', 10, 0, '2023-02-02 22:33:08', '2023-02-02 22:33:08', 3, 0);
INSERT INTO `sys_permission` VALUES (30, '权限新增', NULL, 1, NULL, '', 'permission.add', 11, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 3, 0);
INSERT INTO `sys_permission` VALUES (31, '权限编辑', NULL, 1, NULL, NULL, 'permission.edit', 11, 0, NULL, '2023-01-28 11:45:21', 3, 0);
INSERT INTO `sys_permission` VALUES (32, '权限删除', NULL, 1, NULL, NULL, 'permission.delete', 11, 0, '2023-01-29 11:04:15', '2023-01-29 11:04:15', 3, 0);
INSERT INTO `sys_permission` VALUES (34, '权限导入', NULL, 1, NULL, NULL, 'permission.import', 11, 0, '2023-02-02 22:32:53', '2023-02-02 22:32:53', 3, 0);
INSERT INTO `sys_permission` VALUES (35, '权限导出', NULL, 1, NULL, NULL, 'permission.export', 11, 0, '2023-02-02 22:33:08', '2023-02-02 22:33:08', 3, 0);
INSERT INTO `sys_permission` VALUES (37, '数据字典新增', NULL, 1, NULL, '', 'dict.add', 13, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 3, 0);
INSERT INTO `sys_permission` VALUES (38, '数据字典编辑', NULL, 1, NULL, NULL, 'dict.edit', 13, 0, NULL, '2023-01-28 11:45:21', 3, 0);
INSERT INTO `sys_permission` VALUES (39, '数据字典删除', NULL, 1, NULL, NULL, 'dict.delete', 13, 0, '2023-01-29 11:04:15', '2023-01-29 11:04:15', 3, 0);
INSERT INTO `sys_permission` VALUES (40, '批量删除', NULL, 1, NULL, NULL, 'dict.deleteBatch', 13, 0, '2023-02-02 22:32:22', '2023-02-02 22:32:22', 3, 0);
INSERT INTO `sys_permission` VALUES (41, '数据字典导入', NULL, 1, NULL, NULL, 'dict.import', 13, 0, '2023-02-02 22:32:53', '2023-02-02 22:32:53', 3, 0);
INSERT INTO `sys_permission` VALUES (42, '数据字典导出', NULL, 1, NULL, NULL, 'dict.export', 13, 0, '2023-02-02 22:33:08', '2023-02-02 22:33:08', 3, 0);
INSERT INTO `sys_permission` VALUES (96, '文件管理', 'file', 1, 'grid', 'File', 'file.list', 1, 0, NULL, '2023-02-04 12:45:57', 2, 0);
INSERT INTO `sys_permission` VALUES (97, '文件新增', NULL, 1, 'grid', NULL, 'file.add', 96, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (98, '文件导入', NULL, 1, 'grid', NULL, 'file.import', 96, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (99, '文件导出', NULL, 1, 'grid', NULL, 'file.export', 96, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (100, '批量删除', NULL, 1, 'grid', NULL, 'file.deleteBatch', 96, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (101, '文件编辑', NULL, 1, 'grid', NULL, 'file.edit', 96, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (102, '文件删除', NULL, 1, 'grid', NULL, 'file.delete', 96, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (186, '数据图表', 'dashboard', 1, 'grid', 'Dashboard', NULL, NULL, 0, NULL, NULL, 2, 0);
INSERT INTO `sys_permission` VALUES (187, '在线聊天室', 'im', 1, 'chatRound', 'IM', NULL, NULL, 187, NULL, '2023-03-05 10:02:30', 2, 0);
INSERT INTO `sys_permission` VALUES (195, '音乐播放器', 'music', 1, 'headset', 'APlayer', NULL, NULL, 195, NULL, '2023-03-05 10:02:15', 2, 0);
INSERT INTO `sys_permission` VALUES (198, '视频播放器', 'video', 1, 'headset', 'Video', NULL, NULL, 198, NULL, '2023-03-05 10:02:18', 2, 0);
INSERT INTO `sys_permission` VALUES (208, '公告管理', 'notice', 1, 'grid', 'Notice', NULL, NULL, 0, NULL, NULL, 2, 0);
INSERT INTO `sys_permission` VALUES (209, '公告查询', NULL, 1, 'grid', NULL, 'notice.list', 208, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (210, '公告新增', NULL, 1, 'grid', NULL, 'notice.add', 208, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (211, '公告导入', NULL, 1, 'grid', NULL, 'notice.import', 208, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (212, '公告导出', NULL, 1, 'grid', NULL, 'notice.export', 208, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (213, '批量删除', NULL, 1, 'grid', NULL, 'notice.deleteBatch', 208, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (214, '公告编辑', NULL, 1, 'grid', NULL, 'notice.edit', 208, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (215, '公告删除', NULL, 1, 'grid', NULL, 'notice.delete', 208, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (360, '日志管理', 'log', 1, 'grid', 'Log', NULL, 1, 0, NULL, '2023-02-19 17:04:22', 2, 0);
INSERT INTO `sys_permission` VALUES (361, '系统日志查询', NULL, 1, 'grid', NULL, 'log.list', 360, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (362, '系统日志新增', NULL, 1, 'grid', NULL, 'log.add', 360, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (363, '系统日志导入', NULL, 1, 'grid', NULL, 'log.import', 360, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (364, '系统日志导出', NULL, 1, 'grid', NULL, 'log.export', 360, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (365, '批量删除', NULL, 1, 'grid', NULL, 'log.deleteBatch', 360, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (366, '系统日志编辑', NULL, 1, 'grid', NULL, 'log.edit', 360, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (367, '系统日志删除', NULL, 1, 'grid', NULL, 'log.delete', 360, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (392, '动态管理', 'dynamic', 1, 'grid', 'Dynamic', NULL, NULL, 0, NULL, NULL, 2, 0);
INSERT INTO `sys_permission` VALUES (393, '动态查询', NULL, 1, 'grid', NULL, 'dynamic.list', 392, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (394, '动态新增', NULL, 1, 'grid', NULL, 'dynamic.add', 392, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (395, '动态导入', NULL, 1, 'grid', NULL, 'dynamic.import', 392, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (396, '动态导出', NULL, 1, 'grid', NULL, 'dynamic.export', 392, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (397, '批量删除', NULL, 1, 'grid', NULL, 'dynamic.deleteBatch', 392, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (398, '动态编辑', NULL, 1, 'grid', NULL, 'dynamic.edit', 392, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (399, '动态删除', NULL, 1, 'grid', NULL, 'dynamic.delete', 392, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (400, '发帖管理', 'posts', 1, 'grid', 'Posts', NULL, NULL, 400, NULL, '2023-03-05 10:01:31', 2, 0);
INSERT INTO `sys_permission` VALUES (401, '发帖查询', NULL, 1, 'grid', NULL, 'posts.list', 400, 401, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (402, '发帖新增', NULL, 1, 'grid', NULL, 'posts.add', 400, 402, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (403, '发帖导入', NULL, 1, 'grid', NULL, 'posts.import', 400, 403, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (404, '发帖导出', NULL, 1, 'grid', NULL, 'posts.export', 400, 404, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (405, '批量删除', NULL, 1, 'grid', NULL, 'posts.deleteBatch', 400, 405, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (406, '发帖编辑', NULL, 1, 'grid', NULL, 'posts.edit', 400, 406, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (407, '发帖删除', NULL, 1, 'grid', NULL, 'posts.delete', 400, 407, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (408, '点赞管理', 'praise', 1, 'grid', 'Praise', NULL, NULL, 0, NULL, NULL, 2, 0);
INSERT INTO `sys_permission` VALUES (409, '点赞查询', NULL, 1, 'grid', NULL, 'praise.list', 408, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (410, '点赞新增', NULL, 1, 'grid', NULL, 'praise.add', 408, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (411, '点赞导入', NULL, 1, 'grid', NULL, 'praise.import', 408, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (412, '点赞导出', NULL, 1, 'grid', NULL, 'praise.export', 408, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (413, '批量删除', NULL, 1, 'grid', NULL, 'praise.deleteBatch', 408, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (414, '点赞编辑', NULL, 1, 'grid', NULL, 'praise.edit', 408, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (415, '点赞删除', NULL, 1, 'grid', NULL, 'praise.delete', 408, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (416, '收藏管理', 'collect', 1, 'grid', 'Collect', NULL, NULL, 0, NULL, NULL, 2, 0);
INSERT INTO `sys_permission` VALUES (417, '收藏查询', NULL, 1, 'grid', NULL, 'collect.list', 416, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (418, '收藏新增', NULL, 1, 'grid', NULL, 'collect.add', 416, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (419, '收藏导入', NULL, 1, 'grid', NULL, 'collect.import', 416, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (420, '收藏导出', NULL, 1, 'grid', NULL, 'collect.export', 416, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (421, '批量删除', NULL, 1, 'grid', NULL, 'collect.deleteBatch', 416, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (422, '收藏编辑', NULL, 1, 'grid', NULL, 'collect.edit', 416, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (423, '收藏删除', NULL, 1, 'grid', NULL, 'collect.delete', 416, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (424, '评论管理', 'comments', 1, 'grid', 'Comments', NULL, NULL, 0, NULL, NULL, 2, 0);
INSERT INTO `sys_permission` VALUES (425, '评论查询', NULL, 1, 'grid', NULL, 'comments.list', 424, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (426, '评论新增', NULL, 1, 'grid', NULL, 'comments.add', 424, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (427, '评论导入', NULL, 1, 'grid', NULL, 'comments.import', 424, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (428, '评论导出', NULL, 1, 'grid', NULL, 'comments.export', 424, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (429, '批量删除', NULL, 1, 'grid', NULL, 'comments.deleteBatch', 424, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (430, '评论编辑', NULL, 1, 'grid', NULL, 'comments.edit', 424, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (431, '评论删除', NULL, 1, 'grid', NULL, 'comments.delete', 424, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (432, '新闻管理', 'news', 1, 'grid', 'News', NULL, NULL, 0, NULL, NULL, 2, 0);
INSERT INTO `sys_permission` VALUES (433, '新闻查询', NULL, 1, 'grid', NULL, 'news.list', 432, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (434, '新闻新增', NULL, 1, 'grid', NULL, 'news.add', 432, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (435, '新闻导入', NULL, 1, 'grid', NULL, 'news.import', 432, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (436, '新闻导出', NULL, 1, 'grid', NULL, 'news.export', 432, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (437, '批量删除', NULL, 1, 'grid', NULL, 'news.deleteBatch', 432, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (438, '新闻编辑', NULL, 1, 'grid', NULL, 'news.edit', 432, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (439, '新闻删除', NULL, 1, 'grid', NULL, 'news.delete', 432, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (440, '标签管理', 'tag', 1, 'grid', 'Tag', NULL, NULL, 0, NULL, NULL, 2, 0);
INSERT INTO `sys_permission` VALUES (441, '标签查询', NULL, 1, 'grid', NULL, 'tag.list', 440, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (442, '标签新增', NULL, 1, 'grid', NULL, 'tag.add', 440, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (443, '标签导入', NULL, 1, 'grid', NULL, 'tag.import', 440, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (444, '标签导出', NULL, 1, 'grid', NULL, 'tag.export', 440, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (445, '批量删除', NULL, 1, 'grid', NULL, 'tag.deleteBatch', 440, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (446, '标签编辑', NULL, 1, 'grid', NULL, 'tag.edit', 440, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (447, '标签删除', NULL, 1, 'grid', NULL, 'tag.delete', 440, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (448, '消息通知管理', 'messages', 1, 'grid', 'Messages', NULL, NULL, 0, NULL, NULL, 2, 0);
INSERT INTO `sys_permission` VALUES (449, '消息通知查询', NULL, 1, 'grid', NULL, 'messages.list', 448, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (450, '消息通知新增', NULL, 1, 'grid', NULL, 'messages.add', 448, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (451, '消息通知导入', NULL, 1, 'grid', NULL, 'messages.import', 448, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (452, '消息通知导出', NULL, 1, 'grid', NULL, 'messages.export', 448, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (453, '批量删除', NULL, 1, 'grid', NULL, 'messages.deleteBatch', 448, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (454, '消息通知编辑', NULL, 1, 'grid', NULL, 'messages.edit', 448, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (455, '消息通知删除', NULL, 1, 'grid', NULL, 'messages.delete', 448, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (456, '收货地址管理', 'address', 1, 'grid', 'Address', NULL, 480, 0, NULL, '2023-03-26 13:06:32', 2, 0);
INSERT INTO `sys_permission` VALUES (457, '收货地址查询', NULL, 1, 'grid', NULL, 'address.list', 456, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (458, '收货地址新增', NULL, 1, 'grid', NULL, 'address.add', 456, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (459, '收货地址导入', NULL, 1, 'grid', NULL, 'address.import', 456, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (460, '收货地址导出', NULL, 1, 'grid', NULL, 'address.export', 456, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (461, '批量删除', NULL, 1, 'grid', NULL, 'address.deleteBatch', 456, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (462, '收货地址编辑', NULL, 1, 'grid', NULL, 'address.edit', 456, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (463, '收货地址删除', NULL, 1, 'grid', NULL, 'address.delete', 456, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (464, '积分商品管理', 'goods', 1, 'grid', 'Goods', NULL, 480, 0, NULL, '2023-03-26 13:06:42', 2, 0);
INSERT INTO `sys_permission` VALUES (465, '积分商品查询', NULL, 1, 'grid', NULL, 'goods.list', 464, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (466, '积分商品新增', NULL, 1, 'grid', NULL, 'goods.add', 464, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (467, '积分商品导入', NULL, 1, 'grid', NULL, 'goods.import', 464, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (468, '积分商品导出', NULL, 1, 'grid', NULL, 'goods.export', 464, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (469, '批量删除', NULL, 1, 'grid', NULL, 'goods.deleteBatch', 464, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (470, '积分商品编辑', NULL, 1, 'grid', NULL, 'goods.edit', 464, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (471, '积分商品删除', NULL, 1, 'grid', NULL, 'goods.delete', 464, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (472, '积分订单管理', 'orders', 1, 'grid', 'Orders', NULL, 480, 0, NULL, '2023-03-26 13:06:51', 2, 0);
INSERT INTO `sys_permission` VALUES (473, '积分订单查询', NULL, 1, 'grid', NULL, 'orders.list', 472, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (474, '积分订单新增', NULL, 1, 'grid', NULL, 'orders.add', 472, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (475, '积分订单导入', NULL, 1, 'grid', NULL, 'orders.import', 472, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (476, '积分订单导出', NULL, 1, 'grid', NULL, 'orders.export', 472, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (477, '批量删除', NULL, 1, 'grid', NULL, 'orders.deleteBatch', 472, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (478, '积分订单编辑', NULL, 1, 'grid', NULL, 'orders.edit', 472, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (479, '积分订单删除', NULL, 1, 'grid', NULL, 'orders.delete', 472, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (480, '积分商城', NULL, 1, 'grid', NULL, NULL, NULL, 0, '2023-03-26 13:06:19', '2023-03-26 13:06:19', 1, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `flag_deleted_idnex`(`flag`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'ADMIN', 0, '2023-01-16 19:49:44', '2023-01-16 19:49:55');
INSERT INTO `sys_role` VALUES (3, '普通用户', 'USER', 0, '2023-01-16 19:50:41', '2023-01-16 19:50:41');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_id`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4024 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (3980, 1, 1);
INSERT INTO `sys_role_permission` VALUES (3981, 1, 3);
INSERT INTO `sys_role_permission` VALUES (3982, 1, 4);
INSERT INTO `sys_role_permission` VALUES (3983, 1, 8);
INSERT INTO `sys_role_permission` VALUES (3984, 1, 9);
INSERT INTO `sys_role_permission` VALUES (3988, 1, 10);
INSERT INTO `sys_role_permission` VALUES (3995, 1, 11);
INSERT INTO `sys_role_permission` VALUES (3889, 1, 12);
INSERT INTO `sys_role_permission` VALUES (4001, 1, 13);
INSERT INTO `sys_role_permission` VALUES (3985, 1, 14);
INSERT INTO `sys_role_permission` VALUES (3986, 1, 15);
INSERT INTO `sys_role_permission` VALUES (3987, 1, 16);
INSERT INTO `sys_role_permission` VALUES (3989, 1, 21);
INSERT INTO `sys_role_permission` VALUES (3990, 1, 22);
INSERT INTO `sys_role_permission` VALUES (3991, 1, 23);
INSERT INTO `sys_role_permission` VALUES (3992, 1, 25);
INSERT INTO `sys_role_permission` VALUES (3993, 1, 26);
INSERT INTO `sys_role_permission` VALUES (3994, 1, 27);
INSERT INTO `sys_role_permission` VALUES (3996, 1, 30);
INSERT INTO `sys_role_permission` VALUES (3997, 1, 31);
INSERT INTO `sys_role_permission` VALUES (3998, 1, 32);
INSERT INTO `sys_role_permission` VALUES (3999, 1, 34);
INSERT INTO `sys_role_permission` VALUES (4000, 1, 35);
INSERT INTO `sys_role_permission` VALUES (4002, 1, 37);
INSERT INTO `sys_role_permission` VALUES (4003, 1, 38);
INSERT INTO `sys_role_permission` VALUES (4004, 1, 39);
INSERT INTO `sys_role_permission` VALUES (4005, 1, 40);
INSERT INTO `sys_role_permission` VALUES (4006, 1, 41);
INSERT INTO `sys_role_permission` VALUES (4007, 1, 42);
INSERT INTO `sys_role_permission` VALUES (4008, 1, 96);
INSERT INTO `sys_role_permission` VALUES (4009, 1, 97);
INSERT INTO `sys_role_permission` VALUES (4010, 1, 98);
INSERT INTO `sys_role_permission` VALUES (4011, 1, 99);
INSERT INTO `sys_role_permission` VALUES (4012, 1, 100);
INSERT INTO `sys_role_permission` VALUES (4013, 1, 101);
INSERT INTO `sys_role_permission` VALUES (4014, 1, 102);
INSERT INTO `sys_role_permission` VALUES (3890, 1, 186);
INSERT INTO `sys_role_permission` VALUES (3891, 1, 208);
INSERT INTO `sys_role_permission` VALUES (3892, 1, 209);
INSERT INTO `sys_role_permission` VALUES (3893, 1, 210);
INSERT INTO `sys_role_permission` VALUES (3894, 1, 211);
INSERT INTO `sys_role_permission` VALUES (3895, 1, 212);
INSERT INTO `sys_role_permission` VALUES (3896, 1, 213);
INSERT INTO `sys_role_permission` VALUES (3897, 1, 214);
INSERT INTO `sys_role_permission` VALUES (3898, 1, 215);
INSERT INTO `sys_role_permission` VALUES (4015, 1, 360);
INSERT INTO `sys_role_permission` VALUES (4016, 1, 361);
INSERT INTO `sys_role_permission` VALUES (4017, 1, 362);
INSERT INTO `sys_role_permission` VALUES (4018, 1, 363);
INSERT INTO `sys_role_permission` VALUES (4019, 1, 364);
INSERT INTO `sys_role_permission` VALUES (4020, 1, 365);
INSERT INTO `sys_role_permission` VALUES (4021, 1, 366);
INSERT INTO `sys_role_permission` VALUES (4022, 1, 367);
INSERT INTO `sys_role_permission` VALUES (3899, 1, 392);
INSERT INTO `sys_role_permission` VALUES (3900, 1, 393);
INSERT INTO `sys_role_permission` VALUES (3901, 1, 394);
INSERT INTO `sys_role_permission` VALUES (3902, 1, 395);
INSERT INTO `sys_role_permission` VALUES (3903, 1, 396);
INSERT INTO `sys_role_permission` VALUES (3904, 1, 397);
INSERT INTO `sys_role_permission` VALUES (3905, 1, 398);
INSERT INTO `sys_role_permission` VALUES (3906, 1, 399);
INSERT INTO `sys_role_permission` VALUES (3907, 1, 408);
INSERT INTO `sys_role_permission` VALUES (3908, 1, 409);
INSERT INTO `sys_role_permission` VALUES (3909, 1, 410);
INSERT INTO `sys_role_permission` VALUES (3910, 1, 411);
INSERT INTO `sys_role_permission` VALUES (3911, 1, 412);
INSERT INTO `sys_role_permission` VALUES (3912, 1, 413);
INSERT INTO `sys_role_permission` VALUES (3913, 1, 414);
INSERT INTO `sys_role_permission` VALUES (3914, 1, 415);
INSERT INTO `sys_role_permission` VALUES (3915, 1, 416);
INSERT INTO `sys_role_permission` VALUES (3916, 1, 417);
INSERT INTO `sys_role_permission` VALUES (3917, 1, 418);
INSERT INTO `sys_role_permission` VALUES (3918, 1, 419);
INSERT INTO `sys_role_permission` VALUES (3919, 1, 420);
INSERT INTO `sys_role_permission` VALUES (3920, 1, 421);
INSERT INTO `sys_role_permission` VALUES (3921, 1, 422);
INSERT INTO `sys_role_permission` VALUES (3922, 1, 423);
INSERT INTO `sys_role_permission` VALUES (3923, 1, 424);
INSERT INTO `sys_role_permission` VALUES (3924, 1, 425);
INSERT INTO `sys_role_permission` VALUES (3925, 1, 426);
INSERT INTO `sys_role_permission` VALUES (3926, 1, 427);
INSERT INTO `sys_role_permission` VALUES (3927, 1, 428);
INSERT INTO `sys_role_permission` VALUES (3928, 1, 429);
INSERT INTO `sys_role_permission` VALUES (3929, 1, 430);
INSERT INTO `sys_role_permission` VALUES (3930, 1, 431);
INSERT INTO `sys_role_permission` VALUES (3931, 1, 432);
INSERT INTO `sys_role_permission` VALUES (3932, 1, 433);
INSERT INTO `sys_role_permission` VALUES (3933, 1, 434);
INSERT INTO `sys_role_permission` VALUES (3934, 1, 435);
INSERT INTO `sys_role_permission` VALUES (3935, 1, 436);
INSERT INTO `sys_role_permission` VALUES (3936, 1, 437);
INSERT INTO `sys_role_permission` VALUES (3937, 1, 438);
INSERT INTO `sys_role_permission` VALUES (3938, 1, 439);
INSERT INTO `sys_role_permission` VALUES (3939, 1, 440);
INSERT INTO `sys_role_permission` VALUES (3940, 1, 441);
INSERT INTO `sys_role_permission` VALUES (3941, 1, 442);
INSERT INTO `sys_role_permission` VALUES (3942, 1, 443);
INSERT INTO `sys_role_permission` VALUES (3943, 1, 444);
INSERT INTO `sys_role_permission` VALUES (3944, 1, 445);
INSERT INTO `sys_role_permission` VALUES (3945, 1, 446);
INSERT INTO `sys_role_permission` VALUES (3946, 1, 447);
INSERT INTO `sys_role_permission` VALUES (3947, 1, 448);
INSERT INTO `sys_role_permission` VALUES (3948, 1, 449);
INSERT INTO `sys_role_permission` VALUES (3949, 1, 450);
INSERT INTO `sys_role_permission` VALUES (3950, 1, 451);
INSERT INTO `sys_role_permission` VALUES (3951, 1, 452);
INSERT INTO `sys_role_permission` VALUES (3952, 1, 453);
INSERT INTO `sys_role_permission` VALUES (3953, 1, 454);
INSERT INTO `sys_role_permission` VALUES (3954, 1, 455);
INSERT INTO `sys_role_permission` VALUES (3956, 1, 456);
INSERT INTO `sys_role_permission` VALUES (3957, 1, 457);
INSERT INTO `sys_role_permission` VALUES (3958, 1, 458);
INSERT INTO `sys_role_permission` VALUES (3959, 1, 459);
INSERT INTO `sys_role_permission` VALUES (3960, 1, 460);
INSERT INTO `sys_role_permission` VALUES (3961, 1, 461);
INSERT INTO `sys_role_permission` VALUES (3962, 1, 462);
INSERT INTO `sys_role_permission` VALUES (3963, 1, 463);
INSERT INTO `sys_role_permission` VALUES (3964, 1, 464);
INSERT INTO `sys_role_permission` VALUES (3965, 1, 465);
INSERT INTO `sys_role_permission` VALUES (3966, 1, 466);
INSERT INTO `sys_role_permission` VALUES (3967, 1, 467);
INSERT INTO `sys_role_permission` VALUES (3968, 1, 468);
INSERT INTO `sys_role_permission` VALUES (3969, 1, 469);
INSERT INTO `sys_role_permission` VALUES (3970, 1, 470);
INSERT INTO `sys_role_permission` VALUES (3971, 1, 471);
INSERT INTO `sys_role_permission` VALUES (3972, 1, 472);
INSERT INTO `sys_role_permission` VALUES (3973, 1, 473);
INSERT INTO `sys_role_permission` VALUES (3974, 1, 474);
INSERT INTO `sys_role_permission` VALUES (3975, 1, 475);
INSERT INTO `sys_role_permission` VALUES (3976, 1, 476);
INSERT INTO `sys_role_permission` VALUES (3977, 1, 477);
INSERT INTO `sys_role_permission` VALUES (3978, 1, 478);
INSERT INTO `sys_role_permission` VALUES (3979, 1, 479);
INSERT INTO `sys_role_permission` VALUES (3955, 1, 480);
INSERT INTO `sys_role_permission` VALUES (4023, 3, 12);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户唯一id',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 0存在  id删除',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `score` int(11) NULL DEFAULT 0 COMMENT '积分',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid_index`(`uid`) USING BTREE,
  UNIQUE INDEX `username_index`(`username`, `deleted`) USING BTREE,
  UNIQUE INDEX `email_index`(`email`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$sz5GIsQI162NS90.iuF6KuqUq6VeUb4uXztDDMDlry44Hazid/lhm', '管理员', 'xqnode@163.com', '合肥市政务区', '4918ea50c06a458f94878abe741b4f51', 0, '2022-12-09 20:08:17', '2022-12-09 20:08:17', 'http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png', 'ADMIN', 0);
INSERT INTO `sys_user` VALUES (2, 'bgg', '$2a$10$GMrMcVqC6nmefRENrgjWXeTHd4bvkwI/lYA0PkT01A.UkPwjq5Pym', 'bgg123456', 'xqnode1@163.com', '合肥市科大', '4918ea50c06a458f94878abe742131as', 2, NULL, '2023-02-02 22:36:23', NULL, 'USER', 0);
INSERT INTO `sys_user` VALUES (3, 'ngg', '$2a$10$Vb/33mxBRFnFg/6sMv6E7O1rwt4JJw5s2CJ6LpMYZzxy/m8odHppu', 'ngg', '1', '合肥市图书馆', '4918ea50c06a458f94878abe742ert34', 0, NULL, '2023-01-29 11:20:30', 'http://localhost:9090/file/download/a359454194cc41378db71379950ee60b.png', 'USER', 0);
INSERT INTO `sys_user` VALUES (4, 'mgg', '$2a$10$DS/R8r9TFena7ig1t4B.8eA3yLw1uTnmqiriEnnDxUT6.3yVz3HYy', '麦克111', 'mgg@163.com', '合肥市庐阳区', '4d144eeb49674271b2116d0a9793071c', 0, '2023-01-09 21:23:41', '2023-01-09 21:23:41', NULL, 'USER', 0);
INSERT INTO `sys_user` VALUES (5, 'vgg', '$2a$10$kd/qJHiY8NY2Q5miTk3nSu2HDNw1kKpNBHHCKIpgNDxPxivjqVZHS', '微微', 'vv@qq.com', '合肥市新站区', 'b134172712c146ffa4a7d92fe3065c58', 0, '2023-01-09 21:24:23', '2023-01-09 21:24:23', NULL, 'USER', 0);
INSERT INTO `sys_user` VALUES (6, 'lgg', '$2a$10$7kC0JSmoMWyBeoHZnIlqvuhDG/NV2/hgysV9Cy5DZ3KhdeUSLPWYi', '啦啦啦', 'lgg@163.com', '合肥市政务区', '5fb5e806e3bd47998c233e5fd4ddd9ed', 6, '2023-01-09 21:25:21', '2023-01-11 20:30:17', NULL, 'USER', 0);
INSERT INTO `sys_user` VALUES (7, 'lgg1', '$2a$10$kqpZwCWQJo3AYo17bfbTq./GNSSfq.pWqHsg7tHKM.r5K7t6EAJv6', '啦啦啦1', 'lgg11@163.com', '合肥市政务区', '31c444962184473e817cbdabc2c7eda7', 7, '2023-01-09 21:25:52', '2023-01-11 20:30:17', NULL, 'USER', 0);
INSERT INTO `sys_user` VALUES (8, 'cgg1', '$2a$10$bBnfsYfJJvshjk5d9DNu5O1mitdAOomBoVBfMZw1lm39UyokJrVG6', 'CAA1', 'cgg1@qq.com', '合肥市蜀山区1', '875068f088a7481cbb15f84f0e598b8c', 8, '2023-01-09 21:26:33', '2023-01-11 20:30:14', NULL, 'USER', 0);
INSERT INTO `sys_user` VALUES (9, 'ygg1', '$2a$10$B5h2DD1LHFVrOB/x0W/AF.QgVnx57w9CrMw3ZAFyt7y9CbJK2pxQe', '呀呀呀1', 'ygg1@qq.com', '合肥市2222', '86e865d243cb4d039b4a011656a013a3', 9, '2023-01-09 21:51:16', '2023-01-09 21:56:16', NULL, 'USER', 0);
INSERT INTO `sys_user` VALUES (10, 'acc', '$2a$10$sGuSBqboDWTIcGIgQyQ.6OtfK1K2IvMwHPIKb8eRpBJafhFtNi55u', '系统用户nhozq9', 'acc@163.com', '合肥市政务区', 'c4ce46d5f05c4b769da263fe6faedbbd', 10, '2023-01-11 20:15:32', '2023-01-11 20:30:14', NULL, 'USER', 0);
INSERT INTO `sys_user` VALUES (11, 'acc1', '$2a$10$fNZZUDw00beUme0cnj9kyuaH3ehzJC/D04B95JztER3/B8w.irq/W', '系统用户4jqdlw', 'acc1@163.com', '合肥市政务区', 'e6d42290806c42fe8ed2f338949020e7', 11, '2023-01-11 20:15:32', '2023-01-11 20:30:09', NULL, 'USER', 0);
INSERT INTO `sys_user` VALUES (12, 'acc2', '$2a$10$d9hMi0anGz7MFT2afLa/xe1p4v1d4oMDflm7BAkK0u3dJpzzwObTK', '系统用户l4e1l5', 'acc2@163.com', '合肥市政务区', 'c38cab03cdd9454494b7ff07973e9839', 12, '2023-01-11 20:17:41', '2023-01-11 20:29:59', NULL, 'USER', 0);
INSERT INTO `sys_user` VALUES (13, 'acc3', '$2a$10$/pcccH2OgJzkKO9M5jJ5ouWszn4wUrTXBTCeFA6Jx30mhBbwsXDiO', '系统用户xl7e4q', 'acc3@163.com', '合肥市政务区', '0ec9c217a6a344a7a3ab008f4bd9f62b', 13, '2023-01-11 20:17:41', '2023-01-11 20:24:46', NULL, 'USER', 0);
INSERT INTO `sys_user` VALUES (14, 'njj', '$2a$10$tx0fp6.3cU9g/VNz/nPMY.3ULcINaV9Dt3q9KmSFCR/5q6cG1j0B6', 'njj', 'njj@qq.com', '合肥市', 'd4d33c27834444ba81b98fe5e99e183d', 14, '2023-01-16 19:49:02', '2023-02-02 22:36:13', NULL, 'USER', 0);
INSERT INTO `sys_user` VALUES (15, 'zzz', '$2a$10$/sk2nU6etdDOjzFEN9qgC.O/yct6COykSoTk7tDrv8lDNay5J.zYy', '系统用户nxyn4z', 'zzz@qq.com', NULL, '0843a13e05364b25b6d2a6b2cd89d807', 15, '2023-02-02 22:21:27', '2023-02-02 22:36:13', NULL, 'USER', 0);
INSERT INTO `sys_user` VALUES (16, 'zzz1', '$2a$10$aUAismbA98BDKEoAHjUUfOU5L.Cr2ki7Tcn7O5BiG9sROucVQh1.m', '系统用户ams9ab', 'zzz1@qq.com', NULL, '633aab2eac50405387ae3e854527651f', 16, '2023-02-02 22:29:04', '2023-02-02 22:36:13', NULL, 'USER', 0);
INSERT INTO `sys_user` VALUES (17, 'vbbb', '$2a$10$sHX8UzVB2s5abnkw1nQrA.pBbRu5kQQEqvdb71lFwH6G..RnlKxXS', '系统用户3rb0t1', 'vbbb@qq.com', '111222', '0e338aad58384bc8b80c2de7f1bbd7da', 0, '2023-02-03 21:44:15', '2023-02-03 21:44:15', 'http://localhost:9090/file/download/3f07f2e30d2942089606b2bd96c7c85f.jpg', 'USER', 0);
INSERT INTO `sys_user` VALUES (18, 'ass', '$2a$10$Wfsje9KSLFOGFSsyU/OQ6e7Z9UbdKH3gnjH2DRoyX07EID0GaNrLG', '系统用户6usym6', 'asss@163.com', NULL, 'c8dcfc6f12c94963b8514f7495f7ca4c', 0, '2023-02-04 22:03:44', '2023-02-04 22:03:44', 'http://localhost:9090/file/download/dfcf5f36d649469393f9a0cff3a9adbd.png', 'USER', 9);
INSERT INTO `sys_user` VALUES (19, 'gbb', '$2a$10$XmgagEBh2jlERi9JTAP3iub88e022RXMovXlV3ea/ZQbMi/.Yd3Ae', 'Ikun小黑子专用号', 'ikun@163.com', '蔡徐坤北京分坤', 'f3e75978695847e59c7c575d8379afa3', 0, '2023-02-11 21:25:34', '2023-02-11 21:25:34', 'http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg', 'USER', 16005);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `comments` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, '恋爱', NULL);
INSERT INTO `tag` VALUES (2, '征婚', NULL);
INSERT INTO `tag` VALUES (3, '游戏', NULL);
INSERT INTO `tag` VALUES (4, '小黑子', NULL);
INSERT INTO `tag` VALUES (5, '鸡你太美', NULL);
INSERT INTO `tag` VALUES (6, '无聊的话题', NULL);

SET FOREIGN_KEY_CHECKS = 1;
