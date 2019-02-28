/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : luffycity

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 28/02/2019 03:01:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 01-课程分类表
-- ----------------------------
DROP TABLE IF EXISTS `01-课程分类表`;
CREATE TABLE `01-课程分类表`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 01-课程分类表
-- ----------------------------
INSERT INTO `01-课程分类表` VALUES (1, 'Go');
INSERT INTO `01-课程分类表` VALUES (3, 'Linux');
INSERT INTO `01-课程分类表` VALUES (2, 'Python');
INSERT INTO `01-课程分类表` VALUES (4, 'UI');
INSERT INTO `01-课程分类表` VALUES (5, '工具');

-- ----------------------------
-- Table structure for 02-课程表
-- ----------------------------
DROP TABLE IF EXISTS `02-课程表`;
CREATE TABLE `02-课程表`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_type` smallint(6) NOT NULL,
  `brief` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` smallint(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  `pub_date` date NULL DEFAULT NULL,
  `order` int(11) NOT NULL,
  `study_num` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `degree_course_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE,
  INDEX `02-课程表_category_id_b71442be_fk_01-课程分类表_id`(`category_id`) USING BTREE,
  INDEX `02-课程表_degree_course_id_91770740_fk_05-学位课程表_id`(`degree_course_id`) USING BTREE,
  CONSTRAINT `02-课程表_category_id_b71442be_fk_01-课程分类表_id` FOREIGN KEY (`category_id`) REFERENCES `01-课程分类表` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `02-课程表_degree_course_id_91770740_fk_05-学位课程表_id` FOREIGN KEY (`degree_course_id`) REFERENCES `05-学位课程表` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 02-课程表
-- ----------------------------
INSERT INTO `02-课程表` VALUES (1, 'Python开发21天入门', 'course/2019-02/Snipaste_2019-01-15_14-01-39.png', 3, '由于Python在深度学习、机器学习等领域的广泛使用，Python一跃成为人工智能时代的“网红”语言，无论你将来从事web相关开发，还是搞人工智能方面的研究，学会Python都对你大有好处。', 1, 0, '2018-02-27', 1, 1123, 2, NULL);
INSERT INTO `02-课程表` VALUES (2, 'Linux系统基础5周入门精讲', 'course/2019-02/幸运叶4k背景图片_彼岸图网.jpg', 3, '本课程将带你进入Linux世界，解决从0到1的问题。一步一个脚印带你掌握Linux命令与知识点，这些命令是所有Linux操作的基础，也是整个Linux生涯中的地基，可以让你在接下来的学习Linux的过程中如鱼得水。', 1, 0, '2018-02-27', 2, 232, 3, NULL);

-- ----------------------------
-- Table structure for 03-课程详细表
-- ----------------------------
DROP TABLE IF EXISTS `03-课程详细表`;
CREATE TABLE `03-课程详细表`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hours` int(11) NOT NULL,
  `course_slogan` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `video_brief_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `summary` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `why_study` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `what_to_study_brief` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `career_improvement` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prerequisite` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `03-课程详细表_course_id_1691e0c0_fk_02-课程表_id` FOREIGN KEY (`course_id`) REFERENCES `02-课程表` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 03-课程详细表
-- ----------------------------
INSERT INTO `03-课程详细表` VALUES (1, 7, '本课程Python开发带你21天轻松入门，帮助想学习编程却不得其门而入的新手写出自己的第一行代码开始，踏上编程之路。', NULL, '基于Python 3课程基于Python3进行讲解，也增加了不少Python3独有的内容。\r\n实战开发演练', '结合解决实际问题的场景展开编码，在编码过程中讲解基础的理论知识，免去了生硬、枯燥的纯理论讲解。同时，我们也给每个关键知识点设置了作业进行练习，以便能更牢固地掌握所学知识。', '本课程Python开发带你21天轻松入门，帮助想学习编程却不得其门而入的新手写出自己的第一行代码开始，踏上编程之路。', '本课程Python开发带你21天轻松入门，帮助想学习编程却不得其门而入的新手写出自己的第一行代码开始，踏上编程之路。', '无', 1);

-- ----------------------------
-- Table structure for 03-课程详细表_recommend_courses
-- ----------------------------
DROP TABLE IF EXISTS `03-课程详细表_recommend_courses`;
CREATE TABLE `03-课程详细表_recommend_courses`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coursedetail_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `D03-课程详细表_recommend_cours_coursedetail_id_course_i_56552bb1_uni`(`coursedetail_id`, `course_id`) USING BTREE,
  INDEX `03-课程详细表_recommend_courses_course_id_447b501e_fk_02-课程表_id`(`course_id`) USING BTREE,
  CONSTRAINT `03-课程详细表_recommend_courses_course_id_447b501e_fk_02-课程表_id` FOREIGN KEY (`course_id`) REFERENCES `02-课程表` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `D03-课程详细表_recommend_c_coursedetail_id_5dd13865_fk_03-课程详细表` FOREIGN KEY (`coursedetail_id`) REFERENCES `03-课程详细表` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 03-课程详细表_recommend_courses
-- ----------------------------
INSERT INTO `03-课程详细表_recommend_courses` VALUES (1, 1, 2);

-- ----------------------------
-- Table structure for 03-课程详细表_teachers
-- ----------------------------
DROP TABLE IF EXISTS `03-课程详细表_teachers`;
CREATE TABLE `03-课程详细表_teachers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coursedetail_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `03-课程详细表_teachers_coursedetail_id_teacher_id_98eb5792_uniq`(`coursedetail_id`, `teacher_id`) USING BTREE,
  INDEX `03-课程详细表_teachers_teacher_id_c6ab45a4_fk_04-教师表_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `03-课程详细表_teachers_coursedetail_id_bebc8482_fk_03-课程详细表_id` FOREIGN KEY (`coursedetail_id`) REFERENCES `03-课程详细表` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `03-课程详细表_teachers_teacher_id_c6ab45a4_fk_04-教师表_id` FOREIGN KEY (`teacher_id`) REFERENCES `04-教师表` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 03-课程详细表_teachers
-- ----------------------------
INSERT INTO `03-课程详细表_teachers` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for 04-教师表
-- ----------------------------
DROP TABLE IF EXISTS `04-教师表`;
CREATE TABLE `04-教师表`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `brief` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 04-教师表
-- ----------------------------
INSERT INTO `04-教师表` VALUES (1, 'Alex', '老男孩教育CTO & CO-FOUNDER 国内知名PYTHON语言推广者 51CTO学院2016\\2017年度最受学员喜爱10大讲师之一 多款开源软件作者 曾任职公安部、飞信、中金公司、NOKIA中国研究院、华尔街英语、ADVENT、汽车之家等公司');

-- ----------------------------
-- Table structure for 05-学位课程表
-- ----------------------------
DROP TABLE IF EXISTS `05-学位课程表`;
CREATE TABLE `05-学位课程表`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 06-课程章节表
-- ----------------------------
DROP TABLE IF EXISTS `06-课程章节表`;
CREATE TABLE `06-课程章节表`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chapter` smallint(6) NOT NULL,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `06-课程章节表_course_id_chapter_384a55b8_uniq`(`course_id`, `chapter`) USING BTREE,
  CONSTRAINT `06-课程章节表_course_id_0967bc4a_fk_02-课程表_id` FOREIGN KEY (`course_id`) REFERENCES `02-课程表` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 06-课程章节表
-- ----------------------------
INSERT INTO `06-课程章节表` VALUES (1, 1, '第一章', 1);
INSERT INTO `06-课程章节表` VALUES (2, 2, '第二章', 1);

-- ----------------------------
-- Table structure for 07-课程课时表
-- ----------------------------
DROP TABLE IF EXISTS `07-课程课时表`;
CREATE TABLE `07-课程课时表`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `section_order` smallint(6) NOT NULL,
  `free_trail` tinyint(1) NOT NULL,
  `section_type` smallint(6) NOT NULL,
  `section_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chapter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `07-课程课时表_chapter_id_section_link_ff544e9c_uniq`(`chapter_id`, `section_link`) USING BTREE,
  CONSTRAINT `07-课程课时表_chapter_id_109c9cb3_fk_06-课程章节表_id` FOREIGN KEY (`chapter_id`) REFERENCES `06-课程章节表` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 07-课程课时表
-- ----------------------------
INSERT INTO `07-课程课时表` VALUES (1, '6', 1, 0, 2, 'https://www.luffycity.com/micro/play/7216/4168', 1);
INSERT INTO `07-课程课时表` VALUES (2, '8', 2, 0, 2, 'https://www.luffycity.com/micro/play/7216/4168', 2);

-- ----------------------------
-- Table structure for 08-价格策略表
-- ----------------------------
DROP TABLE IF EXISTS `08-价格策略表`;
CREATE TABLE `08-价格策略表`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) UNSIGNED NOT NULL,
  `valid_period` smallint(6) NOT NULL,
  `price` double NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `08-价格策略表_content_type_id_object_id_valid_period_0fd5e336_uniq`(`content_type_id`, `object_id`, `valid_period`) USING BTREE,
  CONSTRAINT `08-价格策略表_content_type_id_d039ceea_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 08-价格策略表
-- ----------------------------
INSERT INTO `08-价格策略表` VALUES (1, 1, 1, 5, 10);
INSERT INTO `08-价格策略表` VALUES (2, 2, 7, 12, 10);

-- ----------------------------
-- Table structure for 09-常见问题表
-- ----------------------------
DROP TABLE IF EXISTS `09-常见问题表`;
CREATE TABLE `09-常见问题表`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) UNSIGNED NOT NULL,
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answer` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `09-常见问题表_content_type_id_object_id_question_3d1442af_uniq`(`content_type_id`, `object_id`, `question`) USING BTREE,
  CONSTRAINT `09-常见问题表_content_type_id_0cbac417_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 09-常见问题表
-- ----------------------------
INSERT INTO `09-常见问题表` VALUES (1, 1, '1.学完此课程后能达到什么水平？', '课程中会涉及几个小项目，其中一个比较重要的作业是实现ATM信用卡程序，代码量在500行左右，你学完此课程，至少可以写个500行的不太复杂的程序。', 10);
INSERT INTO `09-常见问题表` VALUES (2, 1, '2.学习过程中碰到疑问怎么办？', '报名后，会提示你加入我们的学习群，学习过程中遇到的问题可以在群里与小伙伴讨论，或询问导师帮助。', 10);

-- ----------------------------
-- Table structure for 10-评价表
-- ----------------------------
DROP TABLE IF EXISTS `10-评价表`;
CREATE TABLE `10-评价表`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` datetime(6) NOT NULL,
  `account_id` int(11) NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `10-评价表_account_id_e7abf3de_fk_11-用户表_id`(`account_id`) USING BTREE,
  INDEX `10-评价表_content_type_id_3b05582f_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  CONSTRAINT `10-评价表_account_id_e7abf3de_fk_11-用户表_id` FOREIGN KEY (`account_id`) REFERENCES `11-用户表` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `10-评价表_content_type_id_3b05582f_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 10-评价表
-- ----------------------------
INSERT INTO `10-评价表` VALUES (1, 1, '下定决心好好学习了，还有可爱的美女小姐姐陪学一点都不枯燥了呢', '2019-02-27 18:51:41.186546', 1, 10);
INSERT INTO `10-评价表` VALUES (2, 1, '课程内容真的很不错，讲解很精细，老师也很幽默帅气，我要加油好好学习啦！', '2019-02-27 18:52:07.294615', 1, 10);

-- ----------------------------
-- Table structure for 11-用户表
-- ----------------------------
DROP TABLE IF EXISTS `11-用户表`;
CREATE TABLE `11-用户表`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `balance` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 11-用户表
-- ----------------------------
INSERT INTO `11-用户表` VALUES (1, 'fadewalk', '1234qwer', 1231);

-- ----------------------------
-- Table structure for 12-课程大纲表
-- ----------------------------
DROP TABLE IF EXISTS `12-课程大纲表`;
CREATE TABLE `12-课程大纲表`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order` smallint(5) UNSIGNED NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_detail_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `12-课程大纲表_course_detail_id_title_9abc6c64_uniq`(`course_detail_id`, `title`) USING BTREE,
  CONSTRAINT `12-课程大纲表_course_detail_id_28f74a69_fk_03-课程详细表_id` FOREIGN KEY (`course_detail_id`) REFERENCES `03-课程详细表` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 12-课程大纲表
-- ----------------------------
INSERT INTO `12-课程大纲表` VALUES (1, '行业认知', 1, '01lPython为什么这么火？02|Python区别于其他语言的优点；\r\n03|Python生态圈与应用哪些领域？04|Python开发行业解析以及岗位需求；', 1);
INSERT INTO `12-课程大纲表` VALUES (2, '基础知识', 1, '01| Python基础语法、流程控制；02|Python数据类型、字符编码学习；\r\n03|Python文件操作、函数、装饰器；04|Python常用模块、开发规范学习；', 1);

-- ----------------------------
-- Table structure for 13. 优惠券生成规则记录
-- ----------------------------
DROP TABLE IF EXISTS `13. 优惠券生成规则记录`;
CREATE TABLE `13. 优惠券生成规则记录`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `brief` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `coupon_type` smallint(6) NOT NULL,
  `money_equivalent_value` int(11) NULL DEFAULT NULL,
  `off_percent` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `minimum_consume` int(10) UNSIGNED NULL DEFAULT NULL,
  `object_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `open_date` date NOT NULL,
  `close_date` date NOT NULL,
  `valid_begin_date` date NULL DEFAULT NULL,
  `valid_end_date` date NULL DEFAULT NULL,
  `coupon_valid_days` int(10) UNSIGNED NULL DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `13. 优惠券生成规则记录_content_type_id_8e18a379_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  CONSTRAINT `13. 优惠券生成规则记录_content_type_id_8e18a379_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 14. 用户优惠券领取使用记录表
-- ----------------------------
DROP TABLE IF EXISTS `14. 用户优惠券领取使用记录表`;
CREATE TABLE `14. 用户优惠券领取使用记录表`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `get_time` datetime(6) NOT NULL,
  `used_time` datetime(6) NULL DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `number`(`number`) USING BTREE,
  INDEX `14. 用户优惠券领取使用记录表_account_id_0a75bf05_fk_11-用户表_id`(`account_id`) USING BTREE,
  INDEX `14. 用户优惠券领取使用记录表_coupon_id_fd3a911d_fk_13. 优惠券生成规则记录_id`(`coupon_id`) USING BTREE,
  INDEX `14. 用户优惠券领取使用记录表_order_id_35a3a333_fk_15. 订单表_id`(`order_id`) USING BTREE,
  CONSTRAINT `14. 用户优惠券领取使用记录表_account_id_0a75bf05_fk_11-用户表_id` FOREIGN KEY (`account_id`) REFERENCES `11-用户表` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `14. 用户优惠券领取使用记录表_coupon_id_fd3a911d_fk_13. 优惠券生成规则记录_id` FOREIGN KEY (`coupon_id`) REFERENCES `13. 优惠券生成规则记录` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `14. 用户优惠券领取使用记录表_order_id_35a3a333_fk_15. 订单表_id` FOREIGN KEY (`order_id`) REFERENCES `15. 订单表` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 15. 订单表
-- ----------------------------
DROP TABLE IF EXISTS `15. 订单表`;
CREATE TABLE `15. 订单表`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type` smallint(6) NOT NULL,
  `payment_number` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_number` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `actual_amount` double NOT NULL,
  `status` smallint(6) NOT NULL,
  `date` datetime(6) NOT NULL,
  `pay_time` datetime(6) NULL DEFAULT NULL,
  `cancel_time` datetime(6) NULL DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_number`(`order_number`) USING BTREE,
  INDEX `15. 订单表_account_id_4ce30dc3_fk_11-用户表_id`(`account_id`) USING BTREE,
  CONSTRAINT `15. 订单表_account_id_4ce30dc3_fk_11-用户表_id` FOREIGN KEY (`account_id`) REFERENCES `11-用户表` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 16. 订单详细
-- ----------------------------
DROP TABLE IF EXISTS `16. 订单详细`;
CREATE TABLE `16. 订单详细`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) UNSIGNED NOT NULL,
  `original_price` double NOT NULL,
  `price` double NOT NULL,
  `valid_period_display` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `valid_period` int(10) UNSIGNED NOT NULL,
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `16. 订单详细_content_type_id_9380cdeb_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `16. 订单详细_order_id_31a3c61f`(`order_id`) USING BTREE,
  CONSTRAINT `16. 订单详细_content_type_id_9380cdeb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `16. 订单详细_order_id_31a3c61f_fk_15. 订单表_id` FOREIGN KEY (`order_id`) REFERENCES `15. 订单表` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for 17. 贝里交易记录
-- ----------------------------
DROP TABLE IF EXISTS `17. 贝里交易记录`;
CREATE TABLE `17. 贝里交易记录`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `transaction_type` smallint(6) NOT NULL,
  `transaction_number` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` datetime(6) NOT NULL,
  `memo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `transaction_number`(`transaction_number`) USING BTREE,
  INDEX `17. 贝里交易记录_account_id_0daf432a_fk_11-用户表_id`(`account_id`) USING BTREE,
  CONSTRAINT `17. 贝里交易记录_account_id_0daf432a_fk_11-用户表_id` FOREIGN KEY (`account_id`) REFERENCES `11-用户表` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 11-用户表', 7, 'add_account');
INSERT INTO `auth_permission` VALUES (26, 'Can change 11-用户表', 7, 'change_account');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 11-用户表', 7, 'delete_account');
INSERT INTO `auth_permission` VALUES (28, 'Can view 11-用户表', 7, 'view_account');
INSERT INTO `auth_permission` VALUES (29, 'Can add 01-课程分类表', 8, 'add_category');
INSERT INTO `auth_permission` VALUES (30, 'Can change 01-课程分类表', 8, 'change_category');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 01-课程分类表', 8, 'delete_category');
INSERT INTO `auth_permission` VALUES (32, 'Can view 01-课程分类表', 8, 'view_category');
INSERT INTO `auth_permission` VALUES (33, 'Can add 10-评价表', 9, 'add_comment');
INSERT INTO `auth_permission` VALUES (34, 'Can change 10-评价表', 9, 'change_comment');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 10-评价表', 9, 'delete_comment');
INSERT INTO `auth_permission` VALUES (36, 'Can view 10-评价表', 9, 'view_comment');
INSERT INTO `auth_permission` VALUES (37, 'Can add 02-课程表', 10, 'add_course');
INSERT INTO `auth_permission` VALUES (38, 'Can change 02-课程表', 10, 'change_course');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 02-课程表', 10, 'delete_course');
INSERT INTO `auth_permission` VALUES (40, 'Can view 02-课程表', 10, 'view_course');
INSERT INTO `auth_permission` VALUES (41, 'Can add 06-课程章节表', 11, 'add_coursechapter');
INSERT INTO `auth_permission` VALUES (42, 'Can change 06-课程章节表', 11, 'change_coursechapter');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 06-课程章节表', 11, 'delete_coursechapter');
INSERT INTO `auth_permission` VALUES (44, 'Can view 06-课程章节表', 11, 'view_coursechapter');
INSERT INTO `auth_permission` VALUES (45, 'Can add 03-课程详细表', 12, 'add_coursedetail');
INSERT INTO `auth_permission` VALUES (46, 'Can change 03-课程详细表', 12, 'change_coursedetail');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 03-课程详细表', 12, 'delete_coursedetail');
INSERT INTO `auth_permission` VALUES (48, 'Can view 03-课程详细表', 12, 'view_coursedetail');
INSERT INTO `auth_permission` VALUES (49, 'Can add 12-课程大纲表', 13, 'add_courseoutline');
INSERT INTO `auth_permission` VALUES (50, 'Can change 12-课程大纲表', 13, 'change_courseoutline');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 12-课程大纲表', 13, 'delete_courseoutline');
INSERT INTO `auth_permission` VALUES (52, 'Can view 12-课程大纲表', 13, 'view_courseoutline');
INSERT INTO `auth_permission` VALUES (53, 'Can add 07-课程课时表', 14, 'add_coursesection');
INSERT INTO `auth_permission` VALUES (54, 'Can change 07-课程课时表', 14, 'change_coursesection');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 07-课程课时表', 14, 'delete_coursesection');
INSERT INTO `auth_permission` VALUES (56, 'Can view 07-课程课时表', 14, 'view_coursesection');
INSERT INTO `auth_permission` VALUES (57, 'Can add 05-学位课程表', 15, 'add_degreecourse');
INSERT INTO `auth_permission` VALUES (58, 'Can change 05-学位课程表', 15, 'change_degreecourse');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 05-学位课程表', 15, 'delete_degreecourse');
INSERT INTO `auth_permission` VALUES (60, 'Can view 05-学位课程表', 15, 'view_degreecourse');
INSERT INTO `auth_permission` VALUES (61, 'Can add 09-常见问题表', 16, 'add_oftenaskedquestion');
INSERT INTO `auth_permission` VALUES (62, 'Can change 09-常见问题表', 16, 'change_oftenaskedquestion');
INSERT INTO `auth_permission` VALUES (63, 'Can delete 09-常见问题表', 16, 'delete_oftenaskedquestion');
INSERT INTO `auth_permission` VALUES (64, 'Can view 09-常见问题表', 16, 'view_oftenaskedquestion');
INSERT INTO `auth_permission` VALUES (65, 'Can add 08-价格策略表', 17, 'add_pricepolicy');
INSERT INTO `auth_permission` VALUES (66, 'Can change 08-价格策略表', 17, 'change_pricepolicy');
INSERT INTO `auth_permission` VALUES (67, 'Can delete 08-价格策略表', 17, 'delete_pricepolicy');
INSERT INTO `auth_permission` VALUES (68, 'Can view 08-价格策略表', 17, 'view_pricepolicy');
INSERT INTO `auth_permission` VALUES (69, 'Can add 04-教师表', 18, 'add_teacher');
INSERT INTO `auth_permission` VALUES (70, 'Can change 04-教师表', 18, 'change_teacher');
INSERT INTO `auth_permission` VALUES (71, 'Can delete 04-教师表', 18, 'delete_teacher');
INSERT INTO `auth_permission` VALUES (72, 'Can view 04-教师表', 18, 'view_teacher');
INSERT INTO `auth_permission` VALUES (73, 'Can add 13. 优惠券生成规则记录', 19, 'add_coupon');
INSERT INTO `auth_permission` VALUES (74, 'Can change 13. 优惠券生成规则记录', 19, 'change_coupon');
INSERT INTO `auth_permission` VALUES (75, 'Can delete 13. 优惠券生成规则记录', 19, 'delete_coupon');
INSERT INTO `auth_permission` VALUES (76, 'Can view 13. 优惠券生成规则记录', 19, 'view_coupon');
INSERT INTO `auth_permission` VALUES (77, 'Can add 14. 用户优惠券领取使用记录表', 20, 'add_couponrecord');
INSERT INTO `auth_permission` VALUES (78, 'Can change 14. 用户优惠券领取使用记录表', 20, 'change_couponrecord');
INSERT INTO `auth_permission` VALUES (79, 'Can delete 14. 用户优惠券领取使用记录表', 20, 'delete_couponrecord');
INSERT INTO `auth_permission` VALUES (80, 'Can view 14. 用户优惠券领取使用记录表', 20, 'view_couponrecord');
INSERT INTO `auth_permission` VALUES (81, 'Can add 15. 订单表', 21, 'add_order');
INSERT INTO `auth_permission` VALUES (82, 'Can change 15. 订单表', 21, 'change_order');
INSERT INTO `auth_permission` VALUES (83, 'Can delete 15. 订单表', 21, 'delete_order');
INSERT INTO `auth_permission` VALUES (84, 'Can view 15. 订单表', 21, 'view_order');
INSERT INTO `auth_permission` VALUES (85, 'Can add 16. 订单详细', 22, 'add_orderdetail');
INSERT INTO `auth_permission` VALUES (86, 'Can change 16. 订单详细', 22, 'change_orderdetail');
INSERT INTO `auth_permission` VALUES (87, 'Can delete 16. 订单详细', 22, 'delete_orderdetail');
INSERT INTO `auth_permission` VALUES (88, 'Can view 16. 订单详细', 22, 'view_orderdetail');
INSERT INTO `auth_permission` VALUES (89, 'Can add 17. 贝里交易记录', 23, 'add_transactionrecord');
INSERT INTO `auth_permission` VALUES (90, 'Can change 17. 贝里交易记录', 23, 'change_transactionrecord');
INSERT INTO `auth_permission` VALUES (91, 'Can delete 17. 贝里交易记录', 23, 'delete_transactionrecord');
INSERT INTO `auth_permission` VALUES (92, 'Can view 17. 贝里交易记录', 23, 'view_transactionrecord');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$120000$rJOC1OLvbLO9$Aaoh6xIXAXu29Mw04ACieR/J+jXlKcZG2ghpI5sH0A4=', '2019-02-27 07:56:52.723305', 1, 'wen', '', '', '', 1, 1, '2019-02-27 07:56:27.588985');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2019-02-27 07:57:08.139974', '1', 'Go', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (2, '2019-02-27 07:57:19.727939', '2', 'Python', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (3, '2019-02-27 07:57:24.640961', '3', 'Linu', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (4, '2019-02-27 07:57:29.770337', '3', 'Linux', 2, '[{\"changed\": {\"fields\": [\"title\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (5, '2019-02-27 07:57:34.492257', '4', 'UI', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (6, '2019-02-27 07:57:40.266791', '5', '工具', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (7, '2019-02-27 10:31:42.833985', '1', 'Python开发21天入门', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (8, '2019-02-27 10:42:20.893374', '1', 'Python开发21天入门(1天)5.0', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (9, '2019-02-27 10:55:34.213265', '2', 'Linux系统基础5周入门精讲', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (10, '2019-02-27 10:55:58.210690', '2', 'Linux系统基础5周入门精讲(1周)12.0', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (11, '2019-02-27 17:13:11.315961', '1', 'Alex', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (12, '2019-02-27 17:13:44.662414', '1', 'Python开发21天入门', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (13, '2019-02-27 17:14:54.512798', '1', '行业认知', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (14, '2019-02-27 17:15:30.748628', '2', '基础知识', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (15, '2019-02-27 17:37:47.158166', '1', '第一章', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (16, '2019-02-27 17:37:53.259760', '1', '第一章', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (17, '2019-02-27 17:38:02.725551', '2', '第二章', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (18, '2019-02-27 17:42:37.795180', '2', '第二章', 2, '[]', 11, 1);
INSERT INTO `django_admin_log` VALUES (19, '2019-02-27 17:44:58.440786', '1', '第一章-2', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (20, '2019-02-27 17:54:19.017007', '1', 'Python开发21天入门-第二章-6课时', 2, '[{\"changed\": {\"fields\": [\"chapter\", \"title\", \"section_order\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (21, '2019-02-27 17:54:31.016677', '1', 'Python开发21天入门-第一章-6课时', 2, '[{\"changed\": {\"fields\": [\"chapter\", \"section_order\"]}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (22, '2019-02-27 17:54:42.293087', '2', 'Python开发21天入门-第二章-8课时', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (23, '2019-02-27 18:51:39.181139', '1', 'fadewalk', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (24, '2019-02-27 18:51:41.194065', '1', '下定决心好好学习了，还有可爱的美女小姐姐陪学一点都不枯燥了呢', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (25, '2019-02-27 18:52:07.296615', '2', '课程内容真的很不错，讲解很精细，老师也很幽默帅气，我要加油好好学习啦！', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (26, '2019-02-27 18:52:59.271878', '1', 'Python开发21天入门-1.学完此课程后能达到什么水平？', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (27, '2019-02-27 18:54:24.309530', '2', 'Python开发21天入门-2.学习过程中碰到疑问怎么办？', 1, '[{\"added\": {}}]', 16, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'Course', 'account');
INSERT INTO `django_content_type` VALUES (8, 'Course', 'category');
INSERT INTO `django_content_type` VALUES (9, 'Course', 'comment');
INSERT INTO `django_content_type` VALUES (10, 'Course', 'course');
INSERT INTO `django_content_type` VALUES (11, 'Course', 'coursechapter');
INSERT INTO `django_content_type` VALUES (12, 'Course', 'coursedetail');
INSERT INTO `django_content_type` VALUES (13, 'Course', 'courseoutline');
INSERT INTO `django_content_type` VALUES (14, 'Course', 'coursesection');
INSERT INTO `django_content_type` VALUES (15, 'Course', 'degreecourse');
INSERT INTO `django_content_type` VALUES (16, 'Course', 'oftenaskedquestion');
INSERT INTO `django_content_type` VALUES (17, 'Course', 'pricepolicy');
INSERT INTO `django_content_type` VALUES (18, 'Course', 'teacher');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (19, 'shopping', 'coupon');
INSERT INTO `django_content_type` VALUES (20, 'shopping', 'couponrecord');
INSERT INTO `django_content_type` VALUES (21, 'shopping', 'order');
INSERT INTO `django_content_type` VALUES (22, 'shopping', 'orderdetail');
INSERT INTO `django_content_type` VALUES (23, 'shopping', 'transactionrecord');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-02-27 07:34:26.707266');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2019-02-27 07:34:26.877439');
INSERT INTO `django_migrations` VALUES (3, 'Course', '0001_initial', '2019-02-27 07:34:27.884012');
INSERT INTO `django_migrations` VALUES (4, 'Course', '0002_account_balance', '2019-02-27 07:34:27.923004');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0001_initial', '2019-02-27 07:34:28.364219');
INSERT INTO `django_migrations` VALUES (6, 'admin', '0001_initial', '2019-02-27 07:34:28.462347');
INSERT INTO `django_migrations` VALUES (7, 'admin', '0002_logentry_remove_auto_add', '2019-02-27 07:34:28.475349');
INSERT INTO `django_migrations` VALUES (8, 'admin', '0003_logentry_add_action_flag_choices', '2019-02-27 07:34:28.486347');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0002_alter_permission_name_max_length', '2019-02-27 07:34:28.528350');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0003_alter_user_email_max_length', '2019-02-27 07:34:28.572347');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0004_alter_user_username_opts', '2019-02-27 07:34:28.583348');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0005_alter_user_last_login_null', '2019-02-27 07:34:28.617347');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0006_require_contenttypes_0002', '2019-02-27 07:34:28.621353');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0007_alter_validators_add_error_messages', '2019-02-27 07:34:28.631350');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0008_alter_user_username_max_length', '2019-02-27 07:34:28.715347');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0009_alter_user_last_name_max_length', '2019-02-27 07:34:28.778349');
INSERT INTO `django_migrations` VALUES (17, 'sessions', '0001_initial', '2019-02-27 07:34:28.811347');
INSERT INTO `django_migrations` VALUES (18, 'shopping', '0001_initial', '2019-02-27 07:34:29.347053');
INSERT INTO `django_migrations` VALUES (19, 'shopping', '0002_auto_20190128_2017', '2019-02-27 07:34:29.387091');
INSERT INTO `django_migrations` VALUES (20, 'shopping', '0003_auto_20190201_0607', '2019-02-27 07:34:29.408088');
INSERT INTO `django_migrations` VALUES (21, 'Course', '0003_auto_20190227_1817', '2019-02-27 10:17:23.026414');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('2gkacxh40q5zhwlx8p53afghnq7yrzna', 'Zjk0MWUyYzdiMTYxZDRmNDVmNzkyZTNiYWI1OGI3Y2ZjMGMyNDNmNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOTQzNGQwYWE4Mzc1NTJiODYxZjY5ODI2Nzg1N2Q2MTNmMzUwMTgxIn0=', '2019-03-13 07:56:52.728361');

SET FOREIGN_KEY_CHECKS = 1;
