SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for rc_admin
-- ----------------------------
DROP TABLE IF EXISTS `rc_admin`;
CREATE TABLE `rc_admin`  (
  `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员Id',
  `admin_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `admin_password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `admin_privilege` int(11) NOT NULL COMMENT '角色\r\n二进制表示权限\r\n1-系管理\r\n2-专业管理\r\n4-班级管理\r\n8-学生管理\r\n16-教师管理\r\n32-课程管理\r\n64-选课管理\r\n128-管理员管理',
  PRIMARY KEY (`admin_id`) USING BTREE,
  UNIQUE INDEX `idx_admin_username`(`admin_username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_admin
-- ----------------------------
INSERT INTO `rc_admin` VALUES (1, 'admin', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', 255);
INSERT INTO `rc_admin` VALUES (2, 'azure99', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', 96);

-- ----------------------------
-- Table structure for rc_class
-- ----------------------------
DROP TABLE IF EXISTS `rc_class`;
CREATE TABLE `rc_class`  (
  `class_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '班级Id',
  `class_major_id` int(10) UNSIGNED NOT NULL COMMENT '专业Id',
  `class_grade` int(10) UNSIGNED NOT NULL COMMENT '年级',
  `class_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '班级名称',
  PRIMARY KEY (`class_id`) USING BTREE,
  INDEX `fk_major_id`(`class_major_id`) USING BTREE,
  INDEX `idx_class_name`(`class_name`) USING BTREE,
  CONSTRAINT `fk_major_id` FOREIGN KEY (`class_major_id`) REFERENCES `rc_major` (`major_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_class
-- ----------------------------
INSERT INTO `rc_class` VALUES (1, 1, 2017, '计信1班');
INSERT INTO `rc_class` VALUES (2, 1, 2019, '计信1班');
INSERT INTO `rc_class` VALUES (3, 4, 2017, '数学1班');
INSERT INTO `rc_class` VALUES (4, 5, 2017, '测试班级1');
INSERT INTO `rc_class` VALUES (5, 5, 2017, '测试班级2');
INSERT INTO `rc_class` VALUES (6, 5, 2017, '测试班级3');
INSERT INTO `rc_class` VALUES (7, 5, 2017, '测试班级4');
INSERT INTO `rc_class` VALUES (8, 5, 2017, '测试班级5');
INSERT INTO `rc_class` VALUES (9, 5, 2017, '测试班级6');
INSERT INTO `rc_class` VALUES (10, 5, 2017, '测试班级7');
INSERT INTO `rc_class` VALUES (11, 5, 2017, '测试班级8');
INSERT INTO `rc_class` VALUES (12, 5, 2017, '测试班级9');
INSERT INTO `rc_class` VALUES (13, 5, 2017, '测试班级10');
INSERT INTO `rc_class` VALUES (14, 5, 2019, '演示班级1');
INSERT INTO `rc_class` VALUES (15, 5, 2019, '演示班级2');
INSERT INTO `rc_class` VALUES (16, 5, 2019, '演示班级3');
INSERT INTO `rc_class` VALUES (17, 5, 2019, '演示班级4');
INSERT INTO `rc_class` VALUES (18, 5, 2019, '演示班级5');
INSERT INTO `rc_class` VALUES (19, 5, 2019, '演示班级6');
INSERT INTO `rc_class` VALUES (20, 5, 2019, '演示班级7');
INSERT INTO `rc_class` VALUES (21, 5, 2019, '演示班级8');
INSERT INTO `rc_class` VALUES (22, 5, 2019, '演示班级9');
INSERT INTO `rc_class` VALUES (23, 5, 2019, '演示班级10');

-- ----------------------------
-- Table structure for rc_course
-- ----------------------------
DROP TABLE IF EXISTS `rc_course`;
CREATE TABLE `rc_course`  (
  `course_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '课程Id',
  `course_teacher_id` int(10) UNSIGNED NOT NULL COMMENT '授课教师Id',
  `course_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程名称',
  `course_grade` int(10) UNSIGNED NOT NULL COMMENT '授课年级',
  `course_time` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上课时间 星期几-第几节-几节课',
  `course_location` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上课地址',
  `course_credit` int(10) UNSIGNED NOT NULL COMMENT '学分',
  `course_selected_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已选人数',
  `course_max_size` int(10) UNSIGNED NOT NULL COMMENT '最大容量',
  `course_exam_date` datetime(0) NULL DEFAULT NULL COMMENT '考试时间',
  `course_exam_location` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '考试地点',
  PRIMARY KEY (`course_id`) USING BTREE,
  INDEX `fk_course_teacher_id`(`course_teacher_id`) USING BTREE,
  INDEX `idx_course_name`(`course_name`) USING BTREE,
  CONSTRAINT `fk_course_teacher_id` FOREIGN KEY (`course_teacher_id`) REFERENCES `rc_teacher` (`teacher_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_course
-- ----------------------------
INSERT INTO `rc_course` VALUES (1, 1, 'C语言程序设计', 2017, '1-1-2', '信工楼107', 5, 18, 50, NULL, NULL);
INSERT INTO `rc_course` VALUES (2, 1, 'Java程序设计', 2019, '1-3-2', '信工楼106', 4, 0, 30, NULL, NULL);
INSERT INTO `rc_course` VALUES (3, 1, '数据库实用技术', 2017, '2-3-2', 'C区202', 2, 1, 50, NULL, NULL);
INSERT INTO `rc_course` VALUES (4, 1, 'ASP.Net开发', 2017, '5-5-3', 'E区315', 2, 0, 1, NULL, NULL);
INSERT INTO `rc_course` VALUES (5, 1, 'Spring企业级开发', 2017, '3-9-2', '信工楼101', 3, 0, 10, NULL, NULL);
INSERT INTO `rc_course` VALUES (6, 3, '数据库概论', 2017, '3-1-2', 'C区106', 5, 0, 40, NULL, NULL);
INSERT INTO `rc_course` VALUES (7, 3, 'Photoshop', 2017, '2-3-2', 'C区222', 2, 0, 20, NULL, NULL);
INSERT INTO `rc_course` VALUES (8, 4, '计算机网络', 2017, '4-1-3', '信工楼109', 5, 0, 20, NULL, NULL);

-- ----------------------------
-- Table structure for rc_department
-- ----------------------------
DROP TABLE IF EXISTS `rc_department`;
CREATE TABLE `rc_department`  (
  `department_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '系Id',
  `department_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系名称',
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_department
-- ----------------------------
INSERT INTO `rc_department` VALUES (1, '计算机系');
INSERT INTO `rc_department` VALUES (2, '数学系');
INSERT INTO `rc_department` VALUES (3, '物理系');
INSERT INTO `rc_department` VALUES (4, '化学系');
INSERT INTO `rc_department` VALUES (5, '测试系1');
INSERT INTO `rc_department` VALUES (6, '测试系2');
INSERT INTO `rc_department` VALUES (7, '测试系3');
INSERT INTO `rc_department` VALUES (8, '测试系4');
INSERT INTO `rc_department` VALUES (9, '测试系5');
INSERT INTO `rc_department` VALUES (10, '测试系6');
INSERT INTO `rc_department` VALUES (11, '测试系7');
INSERT INTO `rc_department` VALUES (12, '测试系8');
INSERT INTO `rc_department` VALUES (13, '测试系9');
INSERT INTO `rc_department` VALUES (14, '测试系10');
INSERT INTO `rc_department` VALUES (15, '临时系1');
INSERT INTO `rc_department` VALUES (16, '临时系2');
INSERT INTO `rc_department` VALUES (17, '临时系3');
INSERT INTO `rc_department` VALUES (18, '临时系4');
INSERT INTO `rc_department` VALUES (19, '临时系5');
INSERT INTO `rc_department` VALUES (20, '临时系6');
INSERT INTO `rc_department` VALUES (21, '临时系7');
INSERT INTO `rc_department` VALUES (22, '临时系8');
INSERT INTO `rc_department` VALUES (23, '临时系9');
INSERT INTO `rc_department` VALUES (24, '临时系10');
INSERT INTO `rc_department` VALUES (25, '演示系1');
INSERT INTO `rc_department` VALUES (26, '演示系2');
INSERT INTO `rc_department` VALUES (27, '演示系3');
INSERT INTO `rc_department` VALUES (28, '演示系4');
INSERT INTO `rc_department` VALUES (29, '演示系5');
INSERT INTO `rc_department` VALUES (30, '演示系6');
INSERT INTO `rc_department` VALUES (31, '演示系7');
INSERT INTO `rc_department` VALUES (32, '演示系8');
INSERT INTO `rc_department` VALUES (33, '演示系9');
INSERT INTO `rc_department` VALUES (34, '演示系10');
INSERT INTO `rc_department` VALUES (35, '演示系11');
INSERT INTO `rc_department` VALUES (36, '演示系12');
INSERT INTO `rc_department` VALUES (37, '演示系13');
INSERT INTO `rc_department` VALUES (38, '演示系14');
INSERT INTO `rc_department` VALUES (39, '演示系15');
INSERT INTO `rc_department` VALUES (40, '演示系16');
INSERT INTO `rc_department` VALUES (41, '演示系17');
INSERT INTO `rc_department` VALUES (42, '演示系18');
INSERT INTO `rc_department` VALUES (43, '演示系19');
INSERT INTO `rc_department` VALUES (44, '演示系20');

-- ----------------------------
-- Table structure for rc_major
-- ----------------------------
DROP TABLE IF EXISTS `rc_major`;
CREATE TABLE `rc_major`  (
  `major_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '专业Id',
  `major_department_id` int(10) UNSIGNED NOT NULL COMMENT '系Id',
  `major_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '专业名称',
  PRIMARY KEY (`major_id`) USING BTREE,
  INDEX `fk_major_department_id`(`major_department_id`) USING BTREE,
  INDEX `idx_major_name`(`major_name`) USING BTREE,
  CONSTRAINT `fk_major_department_id` FOREIGN KEY (`major_department_id`) REFERENCES `rc_department` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_major
-- ----------------------------
INSERT INTO `rc_major` VALUES (1, 1, '计算机科学与技术');
INSERT INTO `rc_major` VALUES (2, 1, '软件工程');
INSERT INTO `rc_major` VALUES (3, 1, '信息工程');
INSERT INTO `rc_major` VALUES (4, 2, '应用数学');
INSERT INTO `rc_major` VALUES (5, 2, '数学师范');
INSERT INTO `rc_major` VALUES (6, 5, '测试专业1');
INSERT INTO `rc_major` VALUES (7, 5, '测试专业2');
INSERT INTO `rc_major` VALUES (8, 5, '测试专业3');
INSERT INTO `rc_major` VALUES (9, 5, '测试专业4');
INSERT INTO `rc_major` VALUES (10, 5, '测试专业5');
INSERT INTO `rc_major` VALUES (11, 5, '测试专业6');
INSERT INTO `rc_major` VALUES (12, 5, '测试专业7');
INSERT INTO `rc_major` VALUES (13, 5, '测试专业8');
INSERT INTO `rc_major` VALUES (14, 5, '测试专业9');
INSERT INTO `rc_major` VALUES (15, 5, '测试专业10');
INSERT INTO `rc_major` VALUES (16, 6, '临时专业1');
INSERT INTO `rc_major` VALUES (17, 6, '临时专业2');
INSERT INTO `rc_major` VALUES (18, 6, '临时专业3');
INSERT INTO `rc_major` VALUES (19, 6, '临时专业4');
INSERT INTO `rc_major` VALUES (20, 6, '临时专业5');
INSERT INTO `rc_major` VALUES (21, 6, '临时专业6');
INSERT INTO `rc_major` VALUES (22, 6, '临时专业7');
INSERT INTO `rc_major` VALUES (23, 6, '临时专业8');
INSERT INTO `rc_major` VALUES (24, 6, '临时专业9');
INSERT INTO `rc_major` VALUES (25, 6, '临时专业10');
INSERT INTO `rc_major` VALUES (26, 7, '演示专业1');
INSERT INTO `rc_major` VALUES (27, 7, '演示专业2');
INSERT INTO `rc_major` VALUES (28, 7, '演示专业3');
INSERT INTO `rc_major` VALUES (29, 7, '演示专业4');
INSERT INTO `rc_major` VALUES (30, 7, '演示专业5');
INSERT INTO `rc_major` VALUES (31, 7, '演示专业6');
INSERT INTO `rc_major` VALUES (32, 7, '演示专业7');
INSERT INTO `rc_major` VALUES (33, 7, '演示专业8');
INSERT INTO `rc_major` VALUES (34, 7, '演示专业9');
INSERT INTO `rc_major` VALUES (35, 7, '演示专业10');
INSERT INTO `rc_major` VALUES (36, 7, '演示专业11');
INSERT INTO `rc_major` VALUES (37, 7, '演示专业12');
INSERT INTO `rc_major` VALUES (38, 7, '演示专业13');
INSERT INTO `rc_major` VALUES (39, 7, '演示专业14');
INSERT INTO `rc_major` VALUES (40, 7, '演示专业15');
INSERT INTO `rc_major` VALUES (41, 7, '演示专业16');
INSERT INTO `rc_major` VALUES (42, 7, '演示专业17');
INSERT INTO `rc_major` VALUES (43, 7, '演示专业18');
INSERT INTO `rc_major` VALUES (44, 7, '演示专业19');
INSERT INTO `rc_major` VALUES (45, 7, '演示专业20');

-- ----------------------------
-- Table structure for rc_student
-- ----------------------------
DROP TABLE IF EXISTS `rc_student`;
CREATE TABLE `rc_student`  (
  `student_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '学生Id',
  `student_class_id` int(10) UNSIGNED NOT NULL COMMENT '班级Id',
  `student_number` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学号',
  `student_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `student_password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `student_email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `student_birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `student_sex` tinyint(1) UNSIGNED NOT NULL COMMENT '性别',
  `student_last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最近登录时间',
  PRIMARY KEY (`student_id`) USING BTREE,
  INDEX `fk_student_class_id`(`student_class_id`) USING BTREE,
  UNIQUE INDEX `idx_student_number`(`student_number`) USING BTREE,
  INDEX `idx_student_name`(`student_name`) USING BTREE,
  CONSTRAINT `fk_student_class_id` FOREIGN KEY (`student_class_id`) REFERENCES `rc_class` (`class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_student
-- ----------------------------
INSERT INTO `rc_student` VALUES (1, 1, '201711010001', '李雨轩', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', '961523404@qq.com', '1998-08-19 16:09:47', 1, '2019-12-16 17:16:47');
INSERT INTO `rc_student` VALUES (2, 1, '201711010002', '宋健', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (3, 1, '201711010003', '李同学1', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (4, 1, '201711010004', '李同学2', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (5, 1, '201711010005', '李同学3', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (6, 1, '201711010006', '李同学4', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (7, 1, '201711010007', '李同学5', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (8, 1, '201711010008', '李同学6', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (9, 1, '201711010009', '李同学7', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (10, 1, '201711010010', '李同学8', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (11, 1, '201711010011', '李同学9', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 0, NULL);
INSERT INTO `rc_student` VALUES (12, 1, '201711010012', '张同学1', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (13, 1, '201711010013', '张同学2', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (14, 1, '201711010014', '张同学3', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (15, 1, '201711010015', '张同学4', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (16, 1, '201711010016', '张同学5', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (17, 1, '201711010017', '张同学6', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (18, 1, '201711010018', '张同学7', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (19, 3, '201711020001', '王同学1', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (20, 3, '201711020002', '王同学2', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (21, 3, '201711020003', '王同学3', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (22, 3, '201711020004', '王同学4', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (23, 3, '201711020005', '王同学5', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (24, 3, '201711020006', '王同学6', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (25, 3, '201711020007', '王同学7', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (26, 3, '201711020008', '王同学8', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (27, 3, '201711020009', '王同学9', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);
INSERT INTO `rc_student` VALUES (28, 3, '201711020010', '王同学10', '81a5f5a9bfde4cdcb5b9fe1f8508df2a', NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for rc_student_course
-- ----------------------------
DROP TABLE IF EXISTS `rc_student_course`;
CREATE TABLE `rc_student_course`  (
  `sc_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '选课Id',
  `sc_student_id` int(10) UNSIGNED NOT NULL COMMENT '学生Id',
  `sc_course_id` int(10) UNSIGNED NOT NULL COMMENT '课程Id',
  `sc_daily_score` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '日常表现分',
  `sc_exam_score` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '期末测试分',
  `sc_score` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '总成绩',
  PRIMARY KEY (`sc_id`) USING BTREE,
  INDEX `fk_sc_course_id`(`sc_course_id`) USING BTREE,
  INDEX `fk_sc_student_id`(`sc_student_id`) USING BTREE,
  CONSTRAINT `fk_sc_course_id` FOREIGN KEY (`sc_course_id`) REFERENCES `rc_course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sc_student_id` FOREIGN KEY (`sc_student_id`) REFERENCES `rc_student` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_student_course
-- ----------------------------
INSERT INTO `rc_student_course` VALUES (1, 1, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (2, 2, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (3, 3, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (4, 4, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (5, 5, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (6, 6, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (7, 7, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (8, 8, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (9, 9, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (10, 10, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (11, 11, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (12, 12, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (13, 13, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (14, 14, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (15, 15, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (16, 16, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (17, 17, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (18, 18, 1, NULL, NULL, NULL);
INSERT INTO `rc_student_course` VALUES (19, 1, 3, 98, 100, 99);

-- ----------------------------
-- Table structure for rc_teacher
-- ----------------------------
DROP TABLE IF EXISTS `rc_teacher`;
CREATE TABLE `rc_teacher`  (
  `teacher_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '教师Id',
  `teacher_department_id` int(10) UNSIGNED NOT NULL COMMENT '系Id',
  `teacher_number` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工号',
  `teacher_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '教师姓名',
  `teacher_password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`teacher_id`) USING BTREE,
  INDEX `fk_teacher_department_id`(`teacher_department_id`) USING BTREE,
  UNIQUE INDEX `idx_teacher_number`(`teacher_number`) USING BTREE,
  CONSTRAINT `fk_teacher_department_id` FOREIGN KEY (`teacher_department_id`) REFERENCES `rc_department` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rc_teacher
-- ----------------------------
INSERT INTO `rc_teacher` VALUES (1, 1, '201711010001', '张三', '81a5f5a9bfde4cdcb5b9fe1f8508df2a');
INSERT INTO `rc_teacher` VALUES (2, 3, '201711020001', '宋老师', '81a5f5a9bfde4cdcb5b9fe1f8508df2a');
INSERT INTO `rc_teacher` VALUES (3, 1, '201711010002', '宋老师', '81a5f5a9bfde4cdcb5b9fe1f8508df2a');
INSERT INTO `rc_teacher` VALUES (4, 1, '201711010003', '张老师', '81a5f5a9bfde4cdcb5b9fe1f8508df2a');
INSERT INTO `rc_teacher` VALUES (5, 1, '201711010004', '吕老师', '81a5f5a9bfde4cdcb5b9fe1f8508df2a');
INSERT INTO `rc_teacher` VALUES (6, 1, '201711010005', '王老师', '81a5f5a9bfde4cdcb5b9fe1f8508df2a');
INSERT INTO `rc_teacher` VALUES (7, 1, '201711010006', '丁老师', '81a5f5a9bfde4cdcb5b9fe1f8508df2a');
INSERT INTO `rc_teacher` VALUES (8, 1, '201711010007', '高老师', '81a5f5a9bfde4cdcb5b9fe1f8508df2a');
INSERT INTO `rc_teacher` VALUES (9, 1, '201711010008', '赵老师', '81a5f5a9bfde4cdcb5b9fe1f8508df2a');

SET FOREIGN_KEY_CHECKS = 1;
