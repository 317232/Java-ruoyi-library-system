/*
 Navicat Premium Dump SQL

 Source Server         : LDL
 Source Server Type    : MySQL
 Source Server Version : 90001 (9.0.1)
 Source Host           : localhost:3306
 Source Schema         : library1

 Target Server Type    : MySQL
 Target Server Version : 90001 (9.0.1)
 File Encoding         : 65001

 Date: 27/11/2024 22:28:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `form_col_num` int NULL DEFAULT 1 COMMENT '表单布局（单列 双列 三列）',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL,
  `number` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 123123);
INSERT INTO `orders` VALUES (2, 450000);

-- ----------------------------
-- Table structure for paramodule
-- ----------------------------
DROP TABLE IF EXISTS `paramodule`;
CREATE TABLE `paramodule`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `dataname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '书籍名',
  `datanum` int NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of paramodule
-- ----------------------------
INSERT INTO `paramodule` VALUES (1, '夏洛特烦恼', 1);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-09-03 14:00:53', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-09-03 14:00:53', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-09-03 14:00:53', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2024-09-03 14:00:53', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2024-09-03 14:00:53', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2024-09-03 14:00:53', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2024-09-03 14:00:53', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2024-09-03 14:00:53', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2024-09-03 14:00:53', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2024-09-03 14:00:53', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (11, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-09-03 14:00:53', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '总馆', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-09-03 14:00:53', 'admin', '2024-09-11 16:50:46');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '福州图书馆', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-09-03 14:00:53', 'admin', '2024-09-11 16:50:56');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-09-03 14:00:53', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '管理部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-09-03 14:00:53', 'admin', '2024-09-11 16:51:07');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-09-03 14:00:53', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '运营部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-09-03 14:00:53', 'admin', '2024-09-27 15:00:34');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-09-03 14:00:53', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-09-03 14:00:53', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-09-03 14:00:53', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-09-03 14:00:53', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '启用', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '禁用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 1, '可借阅', '0', 'book_borrow', NULL, 'primary', 'Y', '0', 'admin', '2024-10-10 14:44:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (31, 2, '已借出', '1', 'book_borrow', '', 'danger', 'Y', '0', 'admin', '2024-10-10 14:45:03', 'admin', '2024-10-10 14:46:05', '');
INSERT INTO `sys_dict_data` VALUES (32, 3, '未上架', '2', 'book_borrow', '', 'info', 'Y', '0', 'admin', '2024-10-23 10:07:36', 'admin', '2024-10-23 10:07:49', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '书籍借阅', 'book_borrow', '0', 'admin', '2024-10-10 14:41:57', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-09-03 14:00:53', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1430 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-03 14:08:13');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-03 14:14:57');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-03 14:15:47');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-11 16:42:38');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-09-11 16:42:42');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-11 16:42:56');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误2次', '2024-09-11 16:43:02');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 16:43:13');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-09-11 17:49:46');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 17:49:57');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 18:44:45');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 20:23:05');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 21:24:45');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 21:48:05');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-11 22:10:36');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 22:10:40');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 22:40:52');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 22:55:54');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 23:25:50');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 23:36:30');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-11 23:41:13');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 23:41:16');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-11 23:54:15');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-12 00:27:23');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-12 00:29:13');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-12 00:34:24');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-12 00:35:22');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-12 00:38:55');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-12 00:45:13');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-12 08:32:37');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-12 11:35:21');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-12 11:35:24');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-13 08:52:17');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-13 09:22:22');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-13 09:24:49');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-13 09:24:52');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-13 09:24:56');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-13 09:34:37');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-13 09:38:02');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-13 14:42:49');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-13 21:11:28');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-13 21:19:13');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-13 23:13:40');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-13 23:35:38');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 08:35:48');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 09:03:37');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-14 09:10:38');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 09:10:42');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 09:14:41');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 09:21:28');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-14 09:22:13');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 09:22:15');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-14 09:23:10');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-14 09:23:14');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 09:23:16');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 09:25:09');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 11:31:36');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-14 11:34:55');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 11:34:57');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 11:42:23');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 11:47:11');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 12:45:49');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 13:02:49');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 13:34:59');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 13:37:31');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 13:41:51');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-14 13:43:59');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-18 01:03:32');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-18 01:03:34');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-18 09:48:04');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-18 09:49:14');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-18 09:49:52');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-09-18 14:38:36');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-18 14:38:44');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-09-18 14:42:39');
INSERT INTO `sys_logininfor` VALUES (175, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-18 14:42:54');
INSERT INTO `sys_logininfor` VALUES (176, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-18 14:46:56');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误2次', '2024-09-18 14:47:04');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-18 14:47:11');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-18 14:50:17');
INSERT INTO `sys_logininfor` VALUES (180, 'common', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-09-18 14:50:34');
INSERT INTO `sys_logininfor` VALUES (181, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-18 14:50:49');
INSERT INTO `sys_logininfor` VALUES (182, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-18 14:55:56');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-18 14:56:09');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-19 14:42:46');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 08:48:06');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-24 09:55:11');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 09:55:17');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 10:00:21');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 10:09:22');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-24 10:19:42');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-09-24 10:19:46');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 10:19:53');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-09-24 10:30:28');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 10:30:36');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 10:31:42');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 10:37:09');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 10:40:34');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 10:46:17');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 10:53:01');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 10:58:05');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-24 11:00:43');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-24 11:00:48');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 11:00:51');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-24 11:12:27');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-24 11:12:30');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 11:12:38');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 11:37:43');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-24 11:49:30');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 11:12:17');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-25 11:15:10');
INSERT INTO `sys_logininfor` VALUES (211, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 11:15:23');
INSERT INTO `sys_logininfor` VALUES (212, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-25 11:16:29');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-09-25 11:16:35');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 11:16:41');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 11:30:25');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 11:34:03');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 11:42:35');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 11:44:09');
INSERT INTO `sys_logininfor` VALUES (219, '111', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-09-25 14:39:44');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 14:39:58');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-25 14:49:01');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 14:49:05');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-25 14:53:24');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-25 14:53:27');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-25 14:53:31');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-25 14:53:35');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 14:53:38');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 15:40:57');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 16:00:23');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-25 16:01:25');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-25 16:01:31');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-25 16:01:34');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 16:01:39');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-25 21:01:46');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 21:01:49');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-25 21:13:11');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 21:13:16');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 21:41:18');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 21:42:02');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-25 21:42:37');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-26 00:02:44');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-26 10:59:17');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-26 11:46:08');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-26 11:48:08');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-26 11:48:12');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-26 11:50:37');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-26 11:50:41');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-26 14:36:34');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-26 15:53:44');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-26 15:59:51');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-26 16:20:07');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-26 20:34:09');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 08:40:50');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 08:45:28');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 08:46:45');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-09-27 08:52:33');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 08:53:37');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 08:56:48');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 09:09:02');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 09:10:28');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 09:12:42');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 09:39:10');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 09:40:17');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 09:48:51');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 09:49:32');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 10:04:51');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 14:32:47');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-27 14:41:12');
INSERT INTO `sys_logininfor` VALUES (269, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 14:41:23');
INSERT INTO `sys_logininfor` VALUES (270, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-27 14:41:31');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 14:41:32');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-27 14:42:00');
INSERT INTO `sys_logininfor` VALUES (273, '张三', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-09-27 14:42:09');
INSERT INTO `sys_logininfor` VALUES (274, 'zhansan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-09-27 14:42:22');
INSERT INTO `sys_logininfor` VALUES (275, 'zhansan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-09-27 14:42:27');
INSERT INTO `sys_logininfor` VALUES (276, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 14:42:50');
INSERT INTO `sys_logininfor` VALUES (277, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-27 14:48:36');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 14:48:37');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-27 14:49:37');
INSERT INTO `sys_logininfor` VALUES (280, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 14:49:51');
INSERT INTO `sys_logininfor` VALUES (281, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-27 14:50:26');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 14:50:27');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-27 14:52:13');
INSERT INTO `sys_logininfor` VALUES (284, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 14:52:26');
INSERT INTO `sys_logininfor` VALUES (285, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-27 14:52:33');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 14:52:35');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-27 14:52:57');
INSERT INTO `sys_logininfor` VALUES (288, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 14:53:09');
INSERT INTO `sys_logininfor` VALUES (289, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-27 14:53:17');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 14:53:18');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-27 14:55:04');
INSERT INTO `sys_logininfor` VALUES (292, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-09-27 14:55:53');
INSERT INTO `sys_logininfor` VALUES (293, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 14:56:01');
INSERT INTO `sys_logininfor` VALUES (294, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-27 14:58:07');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 14:58:08');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-27 14:58:51');
INSERT INTO `sys_logininfor` VALUES (297, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 14:59:04');
INSERT INTO `sys_logininfor` VALUES (298, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-27 15:00:00');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 15:00:02');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-27 15:04:06');
INSERT INTO `sys_logininfor` VALUES (301, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 15:04:16');
INSERT INTO `sys_logininfor` VALUES (302, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-09-27 15:05:05');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 15:05:14');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 15:31:35');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 15:32:29');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 15:48:46');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 15:52:11');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 15:53:02');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-27 15:56:28');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 09:09:53');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 09:12:17');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 09:20:37');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 09:58:59');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 10:07:09');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 10:13:44');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 10:17:27');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 10:28:18');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 11:09:45');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 11:10:59');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 11:21:47');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 15:03:01');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 15:09:27');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 15:09:57');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 15:12:47');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 15:12:54');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 15:19:00');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 15:19:36');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 15:27:00');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 15:29:34');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 15:53:52');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 16:32:12');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 16:41:31');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 16:45:41');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 16:49:35');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 17:04:14');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 17:15:07');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 17:21:12');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 17:25:50');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 17:32:24');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 17:35:33');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 18:19:52');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 18:20:49');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 18:38:40');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 18:55:08');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 18:57:58');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 18:58:07');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 18:59:19');
INSERT INTO `sys_logininfor` VALUES (348, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 19:01:28');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 19:03:26');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 19:05:20');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 19:05:27');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 19:15:25');
INSERT INTO `sys_logininfor` VALUES (353, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 19:22:30');
INSERT INTO `sys_logininfor` VALUES (354, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 19:29:44');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 19:32:07');
INSERT INTO `sys_logininfor` VALUES (356, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 19:36:24');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 19:36:57');
INSERT INTO `sys_logininfor` VALUES (358, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 19:42:54');
INSERT INTO `sys_logininfor` VALUES (359, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 19:48:21');
INSERT INTO `sys_logininfor` VALUES (360, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 20:12:36');
INSERT INTO `sys_logininfor` VALUES (361, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 20:12:53');
INSERT INTO `sys_logininfor` VALUES (362, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 20:14:37');
INSERT INTO `sys_logininfor` VALUES (363, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 20:17:54');
INSERT INTO `sys_logininfor` VALUES (364, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 20:23:06');
INSERT INTO `sys_logininfor` VALUES (365, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 20:29:17');
INSERT INTO `sys_logininfor` VALUES (366, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 20:32:37');
INSERT INTO `sys_logininfor` VALUES (367, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 20:37:02');
INSERT INTO `sys_logininfor` VALUES (368, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 20:47:20');
INSERT INTO `sys_logininfor` VALUES (369, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 20:49:02');
INSERT INTO `sys_logininfor` VALUES (370, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 20:52:08');
INSERT INTO `sys_logininfor` VALUES (371, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 20:56:23');
INSERT INTO `sys_logininfor` VALUES (372, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 21:00:22');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 21:08:31');
INSERT INTO `sys_logininfor` VALUES (374, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 21:17:07');
INSERT INTO `sys_logininfor` VALUES (375, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 21:21:07');
INSERT INTO `sys_logininfor` VALUES (376, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 21:22:44');
INSERT INTO `sys_logininfor` VALUES (377, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 21:31:06');
INSERT INTO `sys_logininfor` VALUES (378, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 21:37:13');
INSERT INTO `sys_logininfor` VALUES (379, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 21:43:11');
INSERT INTO `sys_logininfor` VALUES (380, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 21:51:12');
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-29 21:52:32');
INSERT INTO `sys_logininfor` VALUES (382, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 08:38:47');
INSERT INTO `sys_logininfor` VALUES (383, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 09:45:32');
INSERT INTO `sys_logininfor` VALUES (384, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 10:11:00');
INSERT INTO `sys_logininfor` VALUES (385, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 10:24:12');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 10:25:47');
INSERT INTO `sys_logininfor` VALUES (387, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 10:29:35');
INSERT INTO `sys_logininfor` VALUES (388, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 10:38:04');
INSERT INTO `sys_logininfor` VALUES (389, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 10:38:25');
INSERT INTO `sys_logininfor` VALUES (390, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 10:41:30');
INSERT INTO `sys_logininfor` VALUES (391, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 14:52:15');
INSERT INTO `sys_logininfor` VALUES (392, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 15:00:12');
INSERT INTO `sys_logininfor` VALUES (393, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 15:07:42');
INSERT INTO `sys_logininfor` VALUES (394, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 15:23:28');
INSERT INTO `sys_logininfor` VALUES (395, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 15:32:19');
INSERT INTO `sys_logininfor` VALUES (396, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 15:38:38');
INSERT INTO `sys_logininfor` VALUES (397, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 15:45:39');
INSERT INTO `sys_logininfor` VALUES (398, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 15:46:13');
INSERT INTO `sys_logininfor` VALUES (399, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 15:50:21');
INSERT INTO `sys_logininfor` VALUES (400, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 15:54:36');
INSERT INTO `sys_logininfor` VALUES (401, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 15:59:07');
INSERT INTO `sys_logininfor` VALUES (402, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 16:03:31');
INSERT INTO `sys_logininfor` VALUES (403, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 16:04:11');
INSERT INTO `sys_logininfor` VALUES (404, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 20:04:13');
INSERT INTO `sys_logininfor` VALUES (405, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 20:10:01');
INSERT INTO `sys_logininfor` VALUES (406, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 20:15:30');
INSERT INTO `sys_logininfor` VALUES (407, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 20:23:27');
INSERT INTO `sys_logininfor` VALUES (408, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 20:26:38');
INSERT INTO `sys_logininfor` VALUES (409, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 20:30:20');
INSERT INTO `sys_logininfor` VALUES (410, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 20:37:28');
INSERT INTO `sys_logininfor` VALUES (411, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 20:44:16');
INSERT INTO `sys_logininfor` VALUES (412, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 21:03:34');
INSERT INTO `sys_logininfor` VALUES (413, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 21:05:05');
INSERT INTO `sys_logininfor` VALUES (414, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 21:14:54');
INSERT INTO `sys_logininfor` VALUES (415, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 21:15:43');
INSERT INTO `sys_logininfor` VALUES (416, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 21:20:29');
INSERT INTO `sys_logininfor` VALUES (417, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 21:23:23');
INSERT INTO `sys_logininfor` VALUES (418, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 21:25:06');
INSERT INTO `sys_logininfor` VALUES (419, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 21:30:59');
INSERT INTO `sys_logininfor` VALUES (420, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 21:34:28');
INSERT INTO `sys_logininfor` VALUES (421, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 21:41:25');
INSERT INTO `sys_logininfor` VALUES (422, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 21:42:52');
INSERT INTO `sys_logininfor` VALUES (423, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 21:43:26');
INSERT INTO `sys_logininfor` VALUES (424, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 21:49:02');
INSERT INTO `sys_logininfor` VALUES (425, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-09-30 21:50:49');
INSERT INTO `sys_logininfor` VALUES (426, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 14:00:21');
INSERT INTO `sys_logininfor` VALUES (427, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 14:09:08');
INSERT INTO `sys_logininfor` VALUES (428, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 14:24:12');
INSERT INTO `sys_logininfor` VALUES (429, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 14:27:40');
INSERT INTO `sys_logininfor` VALUES (430, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 14:34:27');
INSERT INTO `sys_logininfor` VALUES (431, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 14:35:21');
INSERT INTO `sys_logininfor` VALUES (432, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 14:39:05');
INSERT INTO `sys_logininfor` VALUES (433, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 14:41:04');
INSERT INTO `sys_logininfor` VALUES (434, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 14:45:53');
INSERT INTO `sys_logininfor` VALUES (435, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 14:53:12');
INSERT INTO `sys_logininfor` VALUES (436, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 14:56:51');
INSERT INTO `sys_logininfor` VALUES (437, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 15:06:13');
INSERT INTO `sys_logininfor` VALUES (438, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 15:10:50');
INSERT INTO `sys_logininfor` VALUES (439, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 15:35:12');
INSERT INTO `sys_logininfor` VALUES (440, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 15:53:50');
INSERT INTO `sys_logininfor` VALUES (441, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 23:41:19');
INSERT INTO `sys_logininfor` VALUES (442, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 23:47:06');
INSERT INTO `sys_logininfor` VALUES (443, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 23:54:29');
INSERT INTO `sys_logininfor` VALUES (444, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-01 23:57:58');
INSERT INTO `sys_logininfor` VALUES (445, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 00:01:38');
INSERT INTO `sys_logininfor` VALUES (446, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 00:04:25');
INSERT INTO `sys_logininfor` VALUES (447, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 00:19:45');
INSERT INTO `sys_logininfor` VALUES (448, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 00:27:00');
INSERT INTO `sys_logininfor` VALUES (449, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 00:43:28');
INSERT INTO `sys_logininfor` VALUES (450, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 00:50:21');
INSERT INTO `sys_logininfor` VALUES (451, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 00:59:11');
INSERT INTO `sys_logininfor` VALUES (452, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 01:06:13');
INSERT INTO `sys_logininfor` VALUES (453, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 01:18:33');
INSERT INTO `sys_logininfor` VALUES (454, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 01:25:27');
INSERT INTO `sys_logininfor` VALUES (455, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 01:32:01');
INSERT INTO `sys_logininfor` VALUES (456, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 01:38:08');
INSERT INTO `sys_logininfor` VALUES (457, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 01:44:05');
INSERT INTO `sys_logininfor` VALUES (458, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 01:57:07');
INSERT INTO `sys_logininfor` VALUES (459, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 02:00:38');
INSERT INTO `sys_logininfor` VALUES (460, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 02:14:15');
INSERT INTO `sys_logininfor` VALUES (461, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 02:19:24');
INSERT INTO `sys_logininfor` VALUES (462, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 02:24:50');
INSERT INTO `sys_logininfor` VALUES (463, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 02:28:02');
INSERT INTO `sys_logininfor` VALUES (464, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 16:04:21');
INSERT INTO `sys_logininfor` VALUES (465, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 16:25:32');
INSERT INTO `sys_logininfor` VALUES (466, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 16:33:40');
INSERT INTO `sys_logininfor` VALUES (467, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 16:47:04');
INSERT INTO `sys_logininfor` VALUES (468, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 17:44:32');
INSERT INTO `sys_logininfor` VALUES (469, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 18:05:00');
INSERT INTO `sys_logininfor` VALUES (470, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 19:21:50');
INSERT INTO `sys_logininfor` VALUES (471, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 19:25:24');
INSERT INTO `sys_logininfor` VALUES (472, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 20:08:17');
INSERT INTO `sys_logininfor` VALUES (473, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 20:18:37');
INSERT INTO `sys_logininfor` VALUES (474, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 20:46:03');
INSERT INTO `sys_logininfor` VALUES (475, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 20:49:38');
INSERT INTO `sys_logininfor` VALUES (476, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 21:15:35');
INSERT INTO `sys_logininfor` VALUES (477, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 21:20:58');
INSERT INTO `sys_logininfor` VALUES (478, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 21:23:29');
INSERT INTO `sys_logininfor` VALUES (479, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 21:27:28');
INSERT INTO `sys_logininfor` VALUES (480, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 21:33:58');
INSERT INTO `sys_logininfor` VALUES (481, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 21:37:37');
INSERT INTO `sys_logininfor` VALUES (482, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 22:53:01');
INSERT INTO `sys_logininfor` VALUES (483, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 23:13:08');
INSERT INTO `sys_logininfor` VALUES (484, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 23:30:34');
INSERT INTO `sys_logininfor` VALUES (485, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-02 23:37:55');
INSERT INTO `sys_logininfor` VALUES (486, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 00:01:36');
INSERT INTO `sys_logininfor` VALUES (487, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 00:10:31');
INSERT INTO `sys_logininfor` VALUES (488, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 00:11:13');
INSERT INTO `sys_logininfor` VALUES (489, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 00:12:26');
INSERT INTO `sys_logininfor` VALUES (490, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 00:19:56');
INSERT INTO `sys_logininfor` VALUES (491, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 00:26:52');
INSERT INTO `sys_logininfor` VALUES (492, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 00:46:24');
INSERT INTO `sys_logininfor` VALUES (493, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 00:48:53');
INSERT INTO `sys_logininfor` VALUES (494, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 00:50:37');
INSERT INTO `sys_logininfor` VALUES (495, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 00:53:41');
INSERT INTO `sys_logininfor` VALUES (496, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 01:02:16');
INSERT INTO `sys_logininfor` VALUES (497, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 01:10:12');
INSERT INTO `sys_logininfor` VALUES (498, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 01:16:49');
INSERT INTO `sys_logininfor` VALUES (499, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 01:19:09');
INSERT INTO `sys_logininfor` VALUES (500, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 01:24:52');
INSERT INTO `sys_logininfor` VALUES (501, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 01:26:38');
INSERT INTO `sys_logininfor` VALUES (502, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 01:37:55');
INSERT INTO `sys_logininfor` VALUES (503, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 01:42:56');
INSERT INTO `sys_logininfor` VALUES (504, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 01:44:06');
INSERT INTO `sys_logininfor` VALUES (505, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-03 02:05:55');
INSERT INTO `sys_logininfor` VALUES (506, 'zhansan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-10-03 02:06:05');
INSERT INTO `sys_logininfor` VALUES (507, 'zhansan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-10-03 02:06:10');
INSERT INTO `sys_logininfor` VALUES (508, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-10-03 02:06:19');
INSERT INTO `sys_logininfor` VALUES (509, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-10-03 02:06:25');
INSERT INTO `sys_logininfor` VALUES (510, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-10-03 02:06:55');
INSERT INTO `sys_logininfor` VALUES (511, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 02:07:06');
INSERT INTO `sys_logininfor` VALUES (512, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-03 02:08:24');
INSERT INTO `sys_logininfor` VALUES (513, 'lisi', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-10-03 02:08:34');
INSERT INTO `sys_logininfor` VALUES (514, 'lisi', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误2次', '2024-10-03 02:08:38');
INSERT INTO `sys_logininfor` VALUES (515, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-10-03 02:08:52');
INSERT INTO `sys_logininfor` VALUES (516, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 02:08:56');
INSERT INTO `sys_logininfor` VALUES (517, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-03 02:09:15');
INSERT INTO `sys_logininfor` VALUES (518, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 02:09:17');
INSERT INTO `sys_logininfor` VALUES (519, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-03 02:09:32');
INSERT INTO `sys_logininfor` VALUES (520, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-10-03 02:09:38');
INSERT INTO `sys_logininfor` VALUES (521, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 02:09:42');
INSERT INTO `sys_logininfor` VALUES (522, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-03 02:10:43');
INSERT INTO `sys_logininfor` VALUES (523, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 02:10:48');
INSERT INTO `sys_logininfor` VALUES (524, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-03 02:19:08');
INSERT INTO `sys_logininfor` VALUES (525, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 02:19:12');
INSERT INTO `sys_logininfor` VALUES (526, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-03 02:19:20');
INSERT INTO `sys_logininfor` VALUES (527, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-10-03 02:19:26');
INSERT INTO `sys_logininfor` VALUES (528, 'lisi', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-10-03 02:19:32');
INSERT INTO `sys_logininfor` VALUES (529, '李四', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-10-03 02:19:46');
INSERT INTO `sys_logininfor` VALUES (530, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 02:19:58');
INSERT INTO `sys_logininfor` VALUES (531, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-03 02:20:26');
INSERT INTO `sys_logininfor` VALUES (532, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 02:20:28');
INSERT INTO `sys_logininfor` VALUES (533, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-03 02:21:44');
INSERT INTO `sys_logininfor` VALUES (534, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 02:21:48');
INSERT INTO `sys_logininfor` VALUES (535, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-03 02:21:54');
INSERT INTO `sys_logininfor` VALUES (536, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 02:21:56');
INSERT INTO `sys_logininfor` VALUES (537, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 02:36:15');
INSERT INTO `sys_logininfor` VALUES (538, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-03 02:41:10');
INSERT INTO `sys_logininfor` VALUES (539, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 02:41:14');
INSERT INTO `sys_logininfor` VALUES (540, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-03 02:41:21');
INSERT INTO `sys_logininfor` VALUES (541, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 02:41:24');
INSERT INTO `sys_logininfor` VALUES (542, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-03 02:43:22');
INSERT INTO `sys_logininfor` VALUES (543, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 02:43:28');
INSERT INTO `sys_logininfor` VALUES (544, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-03 02:43:35');
INSERT INTO `sys_logininfor` VALUES (545, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 02:43:37');
INSERT INTO `sys_logininfor` VALUES (546, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-03 02:45:41');
INSERT INTO `sys_logininfor` VALUES (547, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 02:45:44');
INSERT INTO `sys_logininfor` VALUES (548, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-03 02:46:12');
INSERT INTO `sys_logininfor` VALUES (549, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 02:46:14');
INSERT INTO `sys_logininfor` VALUES (550, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-03 02:46:18');
INSERT INTO `sys_logininfor` VALUES (551, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 02:46:22');
INSERT INTO `sys_logininfor` VALUES (552, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 14:15:12');
INSERT INTO `sys_logininfor` VALUES (553, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 14:20:35');
INSERT INTO `sys_logininfor` VALUES (554, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 14:43:03');
INSERT INTO `sys_logininfor` VALUES (555, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 14:48:14');
INSERT INTO `sys_logininfor` VALUES (556, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 14:49:18');
INSERT INTO `sys_logininfor` VALUES (557, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 14:51:19');
INSERT INTO `sys_logininfor` VALUES (558, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 14:53:35');
INSERT INTO `sys_logininfor` VALUES (559, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 14:57:44');
INSERT INTO `sys_logininfor` VALUES (560, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 15:02:55');
INSERT INTO `sys_logininfor` VALUES (561, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 15:05:50');
INSERT INTO `sys_logininfor` VALUES (562, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 15:28:26');
INSERT INTO `sys_logininfor` VALUES (563, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 15:30:41');
INSERT INTO `sys_logininfor` VALUES (564, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 16:00:14');
INSERT INTO `sys_logininfor` VALUES (565, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 16:04:36');
INSERT INTO `sys_logininfor` VALUES (566, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 16:44:30');
INSERT INTO `sys_logininfor` VALUES (567, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 16:45:50');
INSERT INTO `sys_logininfor` VALUES (568, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 16:49:12');
INSERT INTO `sys_logininfor` VALUES (569, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 17:10:28');
INSERT INTO `sys_logininfor` VALUES (570, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 17:21:38');
INSERT INTO `sys_logininfor` VALUES (571, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 17:27:36');
INSERT INTO `sys_logininfor` VALUES (572, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 21:27:12');
INSERT INTO `sys_logininfor` VALUES (573, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 21:35:39');
INSERT INTO `sys_logininfor` VALUES (574, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 21:55:30');
INSERT INTO `sys_logininfor` VALUES (575, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 22:02:30');
INSERT INTO `sys_logininfor` VALUES (576, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 22:12:21');
INSERT INTO `sys_logininfor` VALUES (577, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 22:43:09');
INSERT INTO `sys_logininfor` VALUES (578, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 22:59:17');
INSERT INTO `sys_logininfor` VALUES (579, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 23:02:49');
INSERT INTO `sys_logininfor` VALUES (580, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 23:05:50');
INSERT INTO `sys_logininfor` VALUES (581, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 23:11:25');
INSERT INTO `sys_logininfor` VALUES (582, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 23:19:05');
INSERT INTO `sys_logininfor` VALUES (583, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 23:44:18');
INSERT INTO `sys_logininfor` VALUES (584, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 23:50:46');
INSERT INTO `sys_logininfor` VALUES (585, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 23:53:43');
INSERT INTO `sys_logininfor` VALUES (586, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-03 23:57:28');
INSERT INTO `sys_logininfor` VALUES (587, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 00:14:06');
INSERT INTO `sys_logininfor` VALUES (588, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 00:21:25');
INSERT INTO `sys_logininfor` VALUES (589, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 00:22:55');
INSERT INTO `sys_logininfor` VALUES (590, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 00:25:01');
INSERT INTO `sys_logininfor` VALUES (591, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 00:25:59');
INSERT INTO `sys_logininfor` VALUES (592, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 00:30:54');
INSERT INTO `sys_logininfor` VALUES (593, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 00:34:42');
INSERT INTO `sys_logininfor` VALUES (594, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 00:37:30');
INSERT INTO `sys_logininfor` VALUES (595, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 00:43:47');
INSERT INTO `sys_logininfor` VALUES (596, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 00:47:14');
INSERT INTO `sys_logininfor` VALUES (597, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 00:57:44');
INSERT INTO `sys_logininfor` VALUES (598, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 01:03:28');
INSERT INTO `sys_logininfor` VALUES (599, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 01:05:39');
INSERT INTO `sys_logininfor` VALUES (600, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 01:09:41');
INSERT INTO `sys_logininfor` VALUES (601, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 01:15:48');
INSERT INTO `sys_logininfor` VALUES (602, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 01:20:26');
INSERT INTO `sys_logininfor` VALUES (603, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 15:21:23');
INSERT INTO `sys_logininfor` VALUES (604, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 15:23:28');
INSERT INTO `sys_logininfor` VALUES (605, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 15:25:38');
INSERT INTO `sys_logininfor` VALUES (606, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 15:31:31');
INSERT INTO `sys_logininfor` VALUES (607, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 15:33:58');
INSERT INTO `sys_logininfor` VALUES (608, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 15:36:39');
INSERT INTO `sys_logininfor` VALUES (609, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 15:38:28');
INSERT INTO `sys_logininfor` VALUES (610, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 15:43:18');
INSERT INTO `sys_logininfor` VALUES (611, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 15:50:37');
INSERT INTO `sys_logininfor` VALUES (612, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 16:09:03');
INSERT INTO `sys_logininfor` VALUES (613, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 16:11:30');
INSERT INTO `sys_logininfor` VALUES (614, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 16:12:41');
INSERT INTO `sys_logininfor` VALUES (615, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 16:14:23');
INSERT INTO `sys_logininfor` VALUES (616, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 18:24:20');
INSERT INTO `sys_logininfor` VALUES (617, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 18:26:04');
INSERT INTO `sys_logininfor` VALUES (618, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 18:32:06');
INSERT INTO `sys_logininfor` VALUES (619, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 18:42:28');
INSERT INTO `sys_logininfor` VALUES (620, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 20:01:09');
INSERT INTO `sys_logininfor` VALUES (621, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 20:08:52');
INSERT INTO `sys_logininfor` VALUES (622, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 20:27:17');
INSERT INTO `sys_logininfor` VALUES (623, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 21:53:54');
INSERT INTO `sys_logininfor` VALUES (624, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 22:15:19');
INSERT INTO `sys_logininfor` VALUES (625, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 22:17:42');
INSERT INTO `sys_logininfor` VALUES (626, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 22:23:05');
INSERT INTO `sys_logininfor` VALUES (627, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 22:26:24');
INSERT INTO `sys_logininfor` VALUES (628, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 22:32:02');
INSERT INTO `sys_logininfor` VALUES (629, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 22:33:40');
INSERT INTO `sys_logininfor` VALUES (630, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 22:41:51');
INSERT INTO `sys_logininfor` VALUES (631, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 22:44:55');
INSERT INTO `sys_logininfor` VALUES (632, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 22:49:34');
INSERT INTO `sys_logininfor` VALUES (633, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 22:54:05');
INSERT INTO `sys_logininfor` VALUES (634, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 22:55:27');
INSERT INTO `sys_logininfor` VALUES (635, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 23:00:02');
INSERT INTO `sys_logininfor` VALUES (636, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 23:02:35');
INSERT INTO `sys_logininfor` VALUES (637, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 23:03:01');
INSERT INTO `sys_logininfor` VALUES (638, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 23:03:58');
INSERT INTO `sys_logininfor` VALUES (639, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 23:05:20');
INSERT INTO `sys_logininfor` VALUES (640, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 23:11:31');
INSERT INTO `sys_logininfor` VALUES (641, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 23:13:18');
INSERT INTO `sys_logininfor` VALUES (642, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 23:17:21');
INSERT INTO `sys_logininfor` VALUES (643, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 23:22:02');
INSERT INTO `sys_logininfor` VALUES (644, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 23:30:26');
INSERT INTO `sys_logininfor` VALUES (645, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-04 23:48:27');
INSERT INTO `sys_logininfor` VALUES (646, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 00:19:20');
INSERT INTO `sys_logininfor` VALUES (647, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 00:20:09');
INSERT INTO `sys_logininfor` VALUES (648, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 00:54:30');
INSERT INTO `sys_logininfor` VALUES (649, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 01:54:01');
INSERT INTO `sys_logininfor` VALUES (650, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 02:03:01');
INSERT INTO `sys_logininfor` VALUES (651, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 02:10:15');
INSERT INTO `sys_logininfor` VALUES (652, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 02:18:08');
INSERT INTO `sys_logininfor` VALUES (653, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 02:19:15');
INSERT INTO `sys_logininfor` VALUES (654, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 02:24:25');
INSERT INTO `sys_logininfor` VALUES (655, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 02:41:49');
INSERT INTO `sys_logininfor` VALUES (656, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 11:53:48');
INSERT INTO `sys_logininfor` VALUES (657, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 13:40:47');
INSERT INTO `sys_logininfor` VALUES (658, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 13:44:31');
INSERT INTO `sys_logininfor` VALUES (659, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 13:55:49');
INSERT INTO `sys_logininfor` VALUES (660, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 19:07:18');
INSERT INTO `sys_logininfor` VALUES (661, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 19:15:53');
INSERT INTO `sys_logininfor` VALUES (662, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 19:22:04');
INSERT INTO `sys_logininfor` VALUES (663, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 19:27:47');
INSERT INTO `sys_logininfor` VALUES (664, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 19:33:34');
INSERT INTO `sys_logininfor` VALUES (665, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 19:45:38');
INSERT INTO `sys_logininfor` VALUES (666, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 19:48:17');
INSERT INTO `sys_logininfor` VALUES (667, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 19:54:10');
INSERT INTO `sys_logininfor` VALUES (668, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 20:02:30');
INSERT INTO `sys_logininfor` VALUES (669, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 20:33:58');
INSERT INTO `sys_logininfor` VALUES (670, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 20:58:36');
INSERT INTO `sys_logininfor` VALUES (671, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 21:20:47');
INSERT INTO `sys_logininfor` VALUES (672, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 21:27:01');
INSERT INTO `sys_logininfor` VALUES (673, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 21:38:59');
INSERT INTO `sys_logininfor` VALUES (674, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 21:43:51');
INSERT INTO `sys_logininfor` VALUES (675, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 22:02:58');
INSERT INTO `sys_logininfor` VALUES (676, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 22:06:41');
INSERT INTO `sys_logininfor` VALUES (677, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 22:30:51');
INSERT INTO `sys_logininfor` VALUES (678, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 23:01:57');
INSERT INTO `sys_logininfor` VALUES (679, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 23:16:56');
INSERT INTO `sys_logininfor` VALUES (680, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-05 23:17:04');
INSERT INTO `sys_logininfor` VALUES (681, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 23:17:09');
INSERT INTO `sys_logininfor` VALUES (682, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-05 23:17:14');
INSERT INTO `sys_logininfor` VALUES (683, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 23:17:18');
INSERT INTO `sys_logininfor` VALUES (684, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-05 23:19:48');
INSERT INTO `sys_logininfor` VALUES (685, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 23:19:50');
INSERT INTO `sys_logininfor` VALUES (686, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 23:29:13');
INSERT INTO `sys_logininfor` VALUES (687, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 23:33:15');
INSERT INTO `sys_logininfor` VALUES (688, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 23:35:06');
INSERT INTO `sys_logininfor` VALUES (689, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-05 23:36:30');
INSERT INTO `sys_logininfor` VALUES (690, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 23:36:33');
INSERT INTO `sys_logininfor` VALUES (691, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-05 23:53:00');
INSERT INTO `sys_logininfor` VALUES (692, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 23:53:02');
INSERT INTO `sys_logininfor` VALUES (693, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-05 23:54:00');
INSERT INTO `sys_logininfor` VALUES (694, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 23:54:02');
INSERT INTO `sys_logininfor` VALUES (695, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-05 23:54:05');
INSERT INTO `sys_logininfor` VALUES (696, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 23:54:09');
INSERT INTO `sys_logininfor` VALUES (697, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-05 23:54:45');
INSERT INTO `sys_logininfor` VALUES (698, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-05 23:54:47');
INSERT INTO `sys_logininfor` VALUES (699, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-06 00:03:02');
INSERT INTO `sys_logininfor` VALUES (700, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 00:03:05');
INSERT INTO `sys_logininfor` VALUES (701, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-06 00:03:18');
INSERT INTO `sys_logininfor` VALUES (702, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 00:03:20');
INSERT INTO `sys_logininfor` VALUES (703, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-06 00:04:17');
INSERT INTO `sys_logininfor` VALUES (704, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 00:04:19');
INSERT INTO `sys_logininfor` VALUES (705, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-06 00:04:25');
INSERT INTO `sys_logininfor` VALUES (706, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 00:04:29');
INSERT INTO `sys_logininfor` VALUES (707, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-06 00:06:41');
INSERT INTO `sys_logininfor` VALUES (708, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 00:06:42');
INSERT INTO `sys_logininfor` VALUES (709, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-06 00:07:05');
INSERT INTO `sys_logininfor` VALUES (710, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 00:07:09');
INSERT INTO `sys_logininfor` VALUES (711, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-06 00:07:17');
INSERT INTO `sys_logininfor` VALUES (712, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 00:07:19');
INSERT INTO `sys_logininfor` VALUES (713, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 00:32:23');
INSERT INTO `sys_logininfor` VALUES (714, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 15:20:04');
INSERT INTO `sys_logininfor` VALUES (715, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-06 15:20:21');
INSERT INTO `sys_logininfor` VALUES (716, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 15:21:09');
INSERT INTO `sys_logininfor` VALUES (717, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-06 15:21:15');
INSERT INTO `sys_logininfor` VALUES (718, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 15:21:19');
INSERT INTO `sys_logininfor` VALUES (719, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 15:34:33');
INSERT INTO `sys_logininfor` VALUES (720, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 16:28:06');
INSERT INTO `sys_logininfor` VALUES (721, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-06 16:28:14');
INSERT INTO `sys_logininfor` VALUES (722, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 16:28:18');
INSERT INTO `sys_logininfor` VALUES (723, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-06 16:28:47');
INSERT INTO `sys_logininfor` VALUES (724, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 16:28:51');
INSERT INTO `sys_logininfor` VALUES (725, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 16:32:42');
INSERT INTO `sys_logininfor` VALUES (726, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-06 16:34:18');
INSERT INTO `sys_logininfor` VALUES (727, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 16:34:19');
INSERT INTO `sys_logininfor` VALUES (728, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-06 16:34:36');
INSERT INTO `sys_logininfor` VALUES (729, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 16:34:40');
INSERT INTO `sys_logininfor` VALUES (730, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 16:38:52');
INSERT INTO `sys_logininfor` VALUES (731, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-06 16:40:46');
INSERT INTO `sys_logininfor` VALUES (732, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 16:43:27');
INSERT INTO `sys_logininfor` VALUES (733, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-06 16:53:21');
INSERT INTO `sys_logininfor` VALUES (734, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-06 16:53:27');
INSERT INTO `sys_logininfor` VALUES (735, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-10-08 08:42:28');
INSERT INTO `sys_logininfor` VALUES (736, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 08:42:38');
INSERT INTO `sys_logininfor` VALUES (737, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 08:44:41');
INSERT INTO `sys_logininfor` VALUES (738, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 08:44:48');
INSERT INTO `sys_logininfor` VALUES (739, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 08:45:34');
INSERT INTO `sys_logininfor` VALUES (740, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 08:45:38');
INSERT INTO `sys_logininfor` VALUES (741, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 08:46:08');
INSERT INTO `sys_logininfor` VALUES (742, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 08:46:15');
INSERT INTO `sys_logininfor` VALUES (743, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 08:46:29');
INSERT INTO `sys_logininfor` VALUES (744, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 08:47:03');
INSERT INTO `sys_logininfor` VALUES (745, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 08:50:47');
INSERT INTO `sys_logininfor` VALUES (746, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 08:50:50');
INSERT INTO `sys_logininfor` VALUES (747, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 08:52:03');
INSERT INTO `sys_logininfor` VALUES (748, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 08:52:05');
INSERT INTO `sys_logininfor` VALUES (749, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 08:58:12');
INSERT INTO `sys_logininfor` VALUES (750, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 08:58:19');
INSERT INTO `sys_logininfor` VALUES (751, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 08:59:28');
INSERT INTO `sys_logininfor` VALUES (752, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 08:59:29');
INSERT INTO `sys_logininfor` VALUES (753, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:03:50');
INSERT INTO `sys_logininfor` VALUES (754, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:03:54');
INSERT INTO `sys_logininfor` VALUES (755, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:06:03');
INSERT INTO `sys_logininfor` VALUES (756, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:06:23');
INSERT INTO `sys_logininfor` VALUES (757, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:06:26');
INSERT INTO `sys_logininfor` VALUES (758, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:06:44');
INSERT INTO `sys_logininfor` VALUES (759, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:06:45');
INSERT INTO `sys_logininfor` VALUES (760, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:07:39');
INSERT INTO `sys_logininfor` VALUES (761, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:09:19');
INSERT INTO `sys_logininfor` VALUES (762, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:09:23');
INSERT INTO `sys_logininfor` VALUES (763, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:09:30');
INSERT INTO `sys_logininfor` VALUES (764, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:09:31');
INSERT INTO `sys_logininfor` VALUES (765, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:09:49');
INSERT INTO `sys_logininfor` VALUES (766, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:09:54');
INSERT INTO `sys_logininfor` VALUES (767, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:10:05');
INSERT INTO `sys_logininfor` VALUES (768, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:10:06');
INSERT INTO `sys_logininfor` VALUES (769, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:11:01');
INSERT INTO `sys_logininfor` VALUES (770, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:11:05');
INSERT INTO `sys_logininfor` VALUES (771, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:11:18');
INSERT INTO `sys_logininfor` VALUES (772, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:11:19');
INSERT INTO `sys_logininfor` VALUES (773, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:11:31');
INSERT INTO `sys_logininfor` VALUES (774, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:11:35');
INSERT INTO `sys_logininfor` VALUES (775, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:11:54');
INSERT INTO `sys_logininfor` VALUES (776, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:11:55');
INSERT INTO `sys_logininfor` VALUES (777, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:12:19');
INSERT INTO `sys_logininfor` VALUES (778, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:12:20');
INSERT INTO `sys_logininfor` VALUES (779, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:12:23');
INSERT INTO `sys_logininfor` VALUES (780, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:12:26');
INSERT INTO `sys_logininfor` VALUES (781, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:12:39');
INSERT INTO `sys_logininfor` VALUES (782, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:12:40');
INSERT INTO `sys_logininfor` VALUES (783, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:13:33');
INSERT INTO `sys_logininfor` VALUES (784, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:13:46');
INSERT INTO `sys_logininfor` VALUES (785, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:13:49');
INSERT INTO `sys_logininfor` VALUES (786, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:13:52');
INSERT INTO `sys_logininfor` VALUES (787, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:14:13');
INSERT INTO `sys_logininfor` VALUES (788, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:14:17');
INSERT INTO `sys_logininfor` VALUES (789, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:17:14');
INSERT INTO `sys_logininfor` VALUES (790, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:17:17');
INSERT INTO `sys_logininfor` VALUES (791, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:17:30');
INSERT INTO `sys_logininfor` VALUES (792, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:17:32');
INSERT INTO `sys_logininfor` VALUES (793, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:20:00');
INSERT INTO `sys_logininfor` VALUES (794, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:20:02');
INSERT INTO `sys_logininfor` VALUES (795, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:20:44');
INSERT INTO `sys_logininfor` VALUES (796, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:20:48');
INSERT INTO `sys_logininfor` VALUES (797, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:22:02');
INSERT INTO `sys_logininfor` VALUES (798, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:22:10');
INSERT INTO `sys_logininfor` VALUES (799, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:24:46');
INSERT INTO `sys_logininfor` VALUES (800, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:24:49');
INSERT INTO `sys_logininfor` VALUES (801, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:28:02');
INSERT INTO `sys_logininfor` VALUES (802, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:28:09');
INSERT INTO `sys_logininfor` VALUES (803, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:29:18');
INSERT INTO `sys_logininfor` VALUES (804, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:29:22');
INSERT INTO `sys_logininfor` VALUES (805, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:29:31');
INSERT INTO `sys_logininfor` VALUES (806, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:29:32');
INSERT INTO `sys_logininfor` VALUES (807, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:30:45');
INSERT INTO `sys_logininfor` VALUES (808, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:30:48');
INSERT INTO `sys_logininfor` VALUES (809, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 09:31:16');
INSERT INTO `sys_logininfor` VALUES (810, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:35:14');
INSERT INTO `sys_logininfor` VALUES (811, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:50:23');
INSERT INTO `sys_logininfor` VALUES (812, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 09:53:41');
INSERT INTO `sys_logininfor` VALUES (813, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 10:09:39');
INSERT INTO `sys_logininfor` VALUES (814, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 10:09:42');
INSERT INTO `sys_logininfor` VALUES (815, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 10:10:03');
INSERT INTO `sys_logininfor` VALUES (816, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-08 10:10:49');
INSERT INTO `sys_logininfor` VALUES (817, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-08 10:10:51');
INSERT INTO `sys_logininfor` VALUES (818, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 11:39:30');
INSERT INTO `sys_logininfor` VALUES (819, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 14:42:48');
INSERT INTO `sys_logininfor` VALUES (820, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 14:46:53');
INSERT INTO `sys_logininfor` VALUES (821, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 14:51:29');
INSERT INTO `sys_logininfor` VALUES (822, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 14:58:13');
INSERT INTO `sys_logininfor` VALUES (823, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 15:03:10');
INSERT INTO `sys_logininfor` VALUES (824, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 15:05:31');
INSERT INTO `sys_logininfor` VALUES (825, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 15:08:04');
INSERT INTO `sys_logininfor` VALUES (826, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 15:10:44');
INSERT INTO `sys_logininfor` VALUES (827, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 15:16:25');
INSERT INTO `sys_logininfor` VALUES (828, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 15:23:31');
INSERT INTO `sys_logininfor` VALUES (829, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 15:32:48');
INSERT INTO `sys_logininfor` VALUES (830, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 15:37:21');
INSERT INTO `sys_logininfor` VALUES (831, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 15:42:37');
INSERT INTO `sys_logininfor` VALUES (832, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 15:57:39');
INSERT INTO `sys_logininfor` VALUES (833, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 22:23:13');
INSERT INTO `sys_logininfor` VALUES (834, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 22:30:39');
INSERT INTO `sys_logininfor` VALUES (835, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 23:07:54');
INSERT INTO `sys_logininfor` VALUES (836, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 23:09:31');
INSERT INTO `sys_logininfor` VALUES (837, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 23:14:14');
INSERT INTO `sys_logininfor` VALUES (838, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 23:16:07');
INSERT INTO `sys_logininfor` VALUES (839, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 23:21:13');
INSERT INTO `sys_logininfor` VALUES (840, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 23:28:57');
INSERT INTO `sys_logininfor` VALUES (841, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-09 23:33:46');
INSERT INTO `sys_logininfor` VALUES (842, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 08:36:36');
INSERT INTO `sys_logininfor` VALUES (843, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 08:36:57');
INSERT INTO `sys_logininfor` VALUES (844, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 10:06:55');
INSERT INTO `sys_logininfor` VALUES (845, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 10:49:52');
INSERT INTO `sys_logininfor` VALUES (846, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-10 10:58:47');
INSERT INTO `sys_logininfor` VALUES (847, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 10:58:52');
INSERT INTO `sys_logininfor` VALUES (848, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-10 10:59:13');
INSERT INTO `sys_logininfor` VALUES (849, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 10:59:15');
INSERT INTO `sys_logininfor` VALUES (850, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-10 11:00:30');
INSERT INTO `sys_logininfor` VALUES (851, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 11:00:35');
INSERT INTO `sys_logininfor` VALUES (852, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 11:09:30');
INSERT INTO `sys_logininfor` VALUES (853, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 11:15:42');
INSERT INTO `sys_logininfor` VALUES (854, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 11:18:54');
INSERT INTO `sys_logininfor` VALUES (855, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 11:22:58');
INSERT INTO `sys_logininfor` VALUES (856, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 11:26:25');
INSERT INTO `sys_logininfor` VALUES (857, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 11:27:27');
INSERT INTO `sys_logininfor` VALUES (858, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 11:38:57');
INSERT INTO `sys_logininfor` VALUES (859, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 11:49:31');
INSERT INTO `sys_logininfor` VALUES (860, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 14:34:35');
INSERT INTO `sys_logininfor` VALUES (861, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 14:54:37');
INSERT INTO `sys_logininfor` VALUES (862, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-10 14:56:36');
INSERT INTO `sys_logininfor` VALUES (863, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 14:56:39');
INSERT INTO `sys_logininfor` VALUES (864, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-10 14:57:35');
INSERT INTO `sys_logininfor` VALUES (865, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 14:57:38');
INSERT INTO `sys_logininfor` VALUES (866, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-10 14:58:46');
INSERT INTO `sys_logininfor` VALUES (867, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 14:58:47');
INSERT INTO `sys_logininfor` VALUES (868, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-10 14:59:00');
INSERT INTO `sys_logininfor` VALUES (869, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 14:59:05');
INSERT INTO `sys_logininfor` VALUES (870, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-10 15:03:33');
INSERT INTO `sys_logininfor` VALUES (871, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 15:03:37');
INSERT INTO `sys_logininfor` VALUES (872, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 16:06:24');
INSERT INTO `sys_logininfor` VALUES (873, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 16:19:58');
INSERT INTO `sys_logininfor` VALUES (874, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-10 17:34:18');
INSERT INTO `sys_logininfor` VALUES (875, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 17:34:46');
INSERT INTO `sys_logininfor` VALUES (876, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-10 17:35:04');
INSERT INTO `sys_logininfor` VALUES (877, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 21:25:07');
INSERT INTO `sys_logininfor` VALUES (878, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 23:12:18');
INSERT INTO `sys_logininfor` VALUES (879, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-10 23:24:47');
INSERT INTO `sys_logininfor` VALUES (880, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 23:24:51');
INSERT INTO `sys_logininfor` VALUES (881, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-10 23:25:05');
INSERT INTO `sys_logininfor` VALUES (882, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 23:25:07');
INSERT INTO `sys_logininfor` VALUES (883, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 23:32:48');
INSERT INTO `sys_logininfor` VALUES (884, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 23:37:39');
INSERT INTO `sys_logininfor` VALUES (885, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 23:46:52');
INSERT INTO `sys_logininfor` VALUES (886, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-10 23:52:41');
INSERT INTO `sys_logininfor` VALUES (887, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 23:52:44');
INSERT INTO `sys_logininfor` VALUES (888, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-10 23:53:28');
INSERT INTO `sys_logininfor` VALUES (889, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-10 23:53:52');
INSERT INTO `sys_logininfor` VALUES (890, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 08:41:31');
INSERT INTO `sys_logininfor` VALUES (891, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 10:48:14');
INSERT INTO `sys_logininfor` VALUES (892, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 10:54:03');
INSERT INTO `sys_logininfor` VALUES (893, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 10:54:07');
INSERT INTO `sys_logininfor` VALUES (894, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 10:55:13');
INSERT INTO `sys_logininfor` VALUES (895, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 10:55:14');
INSERT INTO `sys_logininfor` VALUES (896, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 10:56:51');
INSERT INTO `sys_logininfor` VALUES (897, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 10:56:56');
INSERT INTO `sys_logininfor` VALUES (898, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 10:58:27');
INSERT INTO `sys_logininfor` VALUES (899, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 10:58:31');
INSERT INTO `sys_logininfor` VALUES (900, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 11:05:15');
INSERT INTO `sys_logininfor` VALUES (901, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 11:07:24');
INSERT INTO `sys_logininfor` VALUES (902, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 11:07:28');
INSERT INTO `sys_logininfor` VALUES (903, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 11:09:12');
INSERT INTO `sys_logininfor` VALUES (904, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 11:09:14');
INSERT INTO `sys_logininfor` VALUES (905, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 11:11:09');
INSERT INTO `sys_logininfor` VALUES (906, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 11:11:15');
INSERT INTO `sys_logininfor` VALUES (907, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 11:11:44');
INSERT INTO `sys_logininfor` VALUES (908, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 11:11:48');
INSERT INTO `sys_logininfor` VALUES (909, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 11:11:56');
INSERT INTO `sys_logininfor` VALUES (910, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 11:12:10');
INSERT INTO `sys_logininfor` VALUES (911, 'admin1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 11:12:13');
INSERT INTO `sys_logininfor` VALUES (912, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 11:12:15');
INSERT INTO `sys_logininfor` VALUES (913, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 11:13:04');
INSERT INTO `sys_logininfor` VALUES (914, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 11:13:08');
INSERT INTO `sys_logininfor` VALUES (915, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 11:16:08');
INSERT INTO `sys_logininfor` VALUES (916, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 11:17:21');
INSERT INTO `sys_logininfor` VALUES (917, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 11:24:11');
INSERT INTO `sys_logininfor` VALUES (918, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 11:25:00');
INSERT INTO `sys_logininfor` VALUES (919, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 11:34:54');
INSERT INTO `sys_logininfor` VALUES (920, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 11:42:02');
INSERT INTO `sys_logininfor` VALUES (921, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 11:42:53');
INSERT INTO `sys_logininfor` VALUES (922, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 11:44:37');
INSERT INTO `sys_logininfor` VALUES (923, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 14:27:28');
INSERT INTO `sys_logininfor` VALUES (924, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 14:38:48');
INSERT INTO `sys_logininfor` VALUES (925, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 14:41:23');
INSERT INTO `sys_logininfor` VALUES (926, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 14:46:09');
INSERT INTO `sys_logininfor` VALUES (927, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 14:46:56');
INSERT INTO `sys_logininfor` VALUES (928, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 14:52:23');
INSERT INTO `sys_logininfor` VALUES (929, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 14:57:04');
INSERT INTO `sys_logininfor` VALUES (930, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 14:57:10');
INSERT INTO `sys_logininfor` VALUES (931, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 15:01:01');
INSERT INTO `sys_logininfor` VALUES (932, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 15:07:27');
INSERT INTO `sys_logininfor` VALUES (933, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 15:36:14');
INSERT INTO `sys_logininfor` VALUES (934, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 15:36:27');
INSERT INTO `sys_logininfor` VALUES (935, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 15:40:03');
INSERT INTO `sys_logininfor` VALUES (936, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 15:40:12');
INSERT INTO `sys_logininfor` VALUES (937, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 15:43:46');
INSERT INTO `sys_logininfor` VALUES (938, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 15:48:59');
INSERT INTO `sys_logininfor` VALUES (939, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 16:14:00');
INSERT INTO `sys_logininfor` VALUES (940, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 16:25:33');
INSERT INTO `sys_logininfor` VALUES (941, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 16:33:56');
INSERT INTO `sys_logininfor` VALUES (942, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 16:40:26');
INSERT INTO `sys_logininfor` VALUES (943, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 16:47:33');
INSERT INTO `sys_logininfor` VALUES (944, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 16:48:24');
INSERT INTO `sys_logininfor` VALUES (945, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 16:50:40');
INSERT INTO `sys_logininfor` VALUES (946, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 16:56:57');
INSERT INTO `sys_logininfor` VALUES (947, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:03:57');
INSERT INTO `sys_logininfor` VALUES (948, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:07:11');
INSERT INTO `sys_logininfor` VALUES (949, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:10:10');
INSERT INTO `sys_logininfor` VALUES (950, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:11:34');
INSERT INTO `sys_logininfor` VALUES (951, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:18:21');
INSERT INTO `sys_logininfor` VALUES (952, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:25:04');
INSERT INTO `sys_logininfor` VALUES (953, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 17:25:26');
INSERT INTO `sys_logininfor` VALUES (954, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:25:30');
INSERT INTO `sys_logininfor` VALUES (955, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 17:27:59');
INSERT INTO `sys_logininfor` VALUES (956, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:28:03');
INSERT INTO `sys_logininfor` VALUES (957, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 17:28:08');
INSERT INTO `sys_logininfor` VALUES (958, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:28:11');
INSERT INTO `sys_logininfor` VALUES (959, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 17:28:45');
INSERT INTO `sys_logininfor` VALUES (960, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:28:49');
INSERT INTO `sys_logininfor` VALUES (961, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:29:37');
INSERT INTO `sys_logininfor` VALUES (962, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 17:29:40');
INSERT INTO `sys_logininfor` VALUES (963, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:29:44');
INSERT INTO `sys_logininfor` VALUES (964, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 17:30:41');
INSERT INTO `sys_logininfor` VALUES (965, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:30:43');
INSERT INTO `sys_logininfor` VALUES (966, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 17:30:57');
INSERT INTO `sys_logininfor` VALUES (967, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:30:59');
INSERT INTO `sys_logininfor` VALUES (968, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 17:31:10');
INSERT INTO `sys_logininfor` VALUES (969, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:31:12');
INSERT INTO `sys_logininfor` VALUES (970, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:32:33');
INSERT INTO `sys_logininfor` VALUES (971, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 17:32:58');
INSERT INTO `sys_logininfor` VALUES (972, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:33:01');
INSERT INTO `sys_logininfor` VALUES (973, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:35:01');
INSERT INTO `sys_logininfor` VALUES (974, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-11 17:36:33');
INSERT INTO `sys_logininfor` VALUES (975, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:36:37');
INSERT INTO `sys_logininfor` VALUES (976, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-11 17:38:54');
INSERT INTO `sys_logininfor` VALUES (977, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-12 08:47:02');
INSERT INTO `sys_logininfor` VALUES (978, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-12 08:47:29');
INSERT INTO `sys_logininfor` VALUES (979, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-12 08:47:36');
INSERT INTO `sys_logininfor` VALUES (980, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-12 08:47:52');
INSERT INTO `sys_logininfor` VALUES (981, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-12 08:47:58');
INSERT INTO `sys_logininfor` VALUES (982, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-12 08:49:21');
INSERT INTO `sys_logininfor` VALUES (983, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-12 08:49:26');
INSERT INTO `sys_logininfor` VALUES (984, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-12 08:49:46');
INSERT INTO `sys_logininfor` VALUES (985, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-12 08:49:53');
INSERT INTO `sys_logininfor` VALUES (986, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-12 08:53:08');
INSERT INTO `sys_logininfor` VALUES (987, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-12 08:53:13');
INSERT INTO `sys_logininfor` VALUES (988, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-12 08:53:21');
INSERT INTO `sys_logininfor` VALUES (989, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-12 08:53:25');
INSERT INTO `sys_logininfor` VALUES (990, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-22 15:04:15');
INSERT INTO `sys_logininfor` VALUES (991, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-22 19:20:34');
INSERT INTO `sys_logininfor` VALUES (992, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-23 09:06:34');
INSERT INTO `sys_logininfor` VALUES (993, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-23 09:37:51');
INSERT INTO `sys_logininfor` VALUES (994, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-23 09:50:21');
INSERT INTO `sys_logininfor` VALUES (995, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-23 14:36:44');
INSERT INTO `sys_logininfor` VALUES (996, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-24 15:49:00');
INSERT INTO `sys_logininfor` VALUES (997, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-25 11:39:10');
INSERT INTO `sys_logininfor` VALUES (998, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-25 11:49:46');
INSERT INTO `sys_logininfor` VALUES (999, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-25 11:50:58');
INSERT INTO `sys_logininfor` VALUES (1000, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-25 12:50:39');
INSERT INTO `sys_logininfor` VALUES (1001, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-27 16:14:10');
INSERT INTO `sys_logininfor` VALUES (1002, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-27 18:35:52');
INSERT INTO `sys_logininfor` VALUES (1003, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-27 18:39:27');
INSERT INTO `sys_logininfor` VALUES (1004, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-27 20:51:52');
INSERT INTO `sys_logininfor` VALUES (1005, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-27 21:10:21');
INSERT INTO `sys_logininfor` VALUES (1006, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-27 21:11:00');
INSERT INTO `sys_logininfor` VALUES (1007, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-27 21:15:00');
INSERT INTO `sys_logininfor` VALUES (1008, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-28 10:57:02');
INSERT INTO `sys_logininfor` VALUES (1009, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-28 11:14:59');
INSERT INTO `sys_logininfor` VALUES (1010, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-28 11:44:54');
INSERT INTO `sys_logininfor` VALUES (1011, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-28 12:12:43');
INSERT INTO `sys_logininfor` VALUES (1012, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-28 12:54:51');
INSERT INTO `sys_logininfor` VALUES (1013, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-28 13:00:40');
INSERT INTO `sys_logininfor` VALUES (1014, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-28 13:12:43');
INSERT INTO `sys_logininfor` VALUES (1015, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-28 13:12:45');
INSERT INTO `sys_logininfor` VALUES (1016, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-28 14:38:00');
INSERT INTO `sys_logininfor` VALUES (1017, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-28 14:59:18');
INSERT INTO `sys_logininfor` VALUES (1018, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-28 15:08:37');
INSERT INTO `sys_logininfor` VALUES (1019, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-28 15:14:10');
INSERT INTO `sys_logininfor` VALUES (1020, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-28 15:14:10');
INSERT INTO `sys_logininfor` VALUES (1021, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-28 15:17:29');
INSERT INTO `sys_logininfor` VALUES (1022, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-28 15:18:31');
INSERT INTO `sys_logininfor` VALUES (1023, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-28 15:18:31');
INSERT INTO `sys_logininfor` VALUES (1024, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-28 15:18:31');
INSERT INTO `sys_logininfor` VALUES (1025, '111', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2024-10-28 15:26:18');
INSERT INTO `sys_logininfor` VALUES (1026, '测试3', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2024-10-28 15:28:11');
INSERT INTO `sys_logininfor` VALUES (1027, '测试3', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-28 15:28:38');
INSERT INTO `sys_logininfor` VALUES (1028, '测试3', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-28 15:37:16');
INSERT INTO `sys_logininfor` VALUES (1029, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2024-10-28 15:37:51');
INSERT INTO `sys_logininfor` VALUES (1030, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-28 15:38:05');
INSERT INTO `sys_logininfor` VALUES (1031, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-28 15:38:15');
INSERT INTO `sys_logininfor` VALUES (1032, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-28 15:38:18');
INSERT INTO `sys_logininfor` VALUES (1033, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-28 15:45:27');
INSERT INTO `sys_logininfor` VALUES (1034, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-28 15:45:31');
INSERT INTO `sys_logininfor` VALUES (1035, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-28 15:51:06');
INSERT INTO `sys_logininfor` VALUES (1036, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-28 15:51:09');
INSERT INTO `sys_logininfor` VALUES (1037, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-28 15:51:50');
INSERT INTO `sys_logininfor` VALUES (1038, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-28 15:51:53');
INSERT INTO `sys_logininfor` VALUES (1039, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 14:46:02');
INSERT INTO `sys_logininfor` VALUES (1040, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 14:49:58');
INSERT INTO `sys_logininfor` VALUES (1041, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 15:18:34');
INSERT INTO `sys_logininfor` VALUES (1042, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 15:32:46');
INSERT INTO `sys_logininfor` VALUES (1043, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 15:40:40');
INSERT INTO `sys_logininfor` VALUES (1044, '测试3', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '密码输入错误1次', '2024-10-29 15:55:00');
INSERT INTO `sys_logininfor` VALUES (1045, '测试3', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 15:55:05');
INSERT INTO `sys_logininfor` VALUES (1046, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 19:42:08');
INSERT INTO `sys_logininfor` VALUES (1047, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 20:12:51');
INSERT INTO `sys_logininfor` VALUES (1048, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-29 20:32:46');
INSERT INTO `sys_logininfor` VALUES (1049, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 20:32:48');
INSERT INTO `sys_logininfor` VALUES (1050, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 20:39:26');
INSERT INTO `sys_logininfor` VALUES (1051, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-29 20:39:31');
INSERT INTO `sys_logininfor` VALUES (1052, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 20:39:36');
INSERT INTO `sys_logininfor` VALUES (1053, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-29 20:39:40');
INSERT INTO `sys_logininfor` VALUES (1054, 'ry管理', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2024-10-29 20:39:45');
INSERT INTO `sys_logininfor` VALUES (1055, 'admin1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 20:39:49');
INSERT INTO `sys_logininfor` VALUES (1056, 'admin1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-29 20:41:13');
INSERT INTO `sys_logininfor` VALUES (1057, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 20:41:18');
INSERT INTO `sys_logininfor` VALUES (1058, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-29 20:41:22');
INSERT INTO `sys_logininfor` VALUES (1059, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 20:41:27');
INSERT INTO `sys_logininfor` VALUES (1060, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-29 20:41:32');
INSERT INTO `sys_logininfor` VALUES (1061, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 20:42:16');
INSERT INTO `sys_logininfor` VALUES (1062, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-29 20:42:21');
INSERT INTO `sys_logininfor` VALUES (1063, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 20:42:25');
INSERT INTO `sys_logininfor` VALUES (1064, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 20:58:57');
INSERT INTO `sys_logininfor` VALUES (1065, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 21:03:52');
INSERT INTO `sys_logininfor` VALUES (1066, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 21:17:08');
INSERT INTO `sys_logininfor` VALUES (1067, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 21:20:00');
INSERT INTO `sys_logininfor` VALUES (1068, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-29 21:20:51');
INSERT INTO `sys_logininfor` VALUES (1069, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 21:20:56');
INSERT INTO `sys_logininfor` VALUES (1070, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 21:22:38');
INSERT INTO `sys_logininfor` VALUES (1071, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-29 21:23:34');
INSERT INTO `sys_logininfor` VALUES (1072, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 21:23:36');
INSERT INTO `sys_logininfor` VALUES (1073, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 21:31:56');
INSERT INTO `sys_logininfor` VALUES (1074, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-29 21:32:30');
INSERT INTO `sys_logininfor` VALUES (1075, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 21:32:35');
INSERT INTO `sys_logininfor` VALUES (1076, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 21:45:53');
INSERT INTO `sys_logininfor` VALUES (1077, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-29 21:46:21');
INSERT INTO `sys_logininfor` VALUES (1078, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 21:46:26');
INSERT INTO `sys_logininfor` VALUES (1079, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-29 21:48:39');
INSERT INTO `sys_logininfor` VALUES (1080, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-29 21:48:39');
INSERT INTO `sys_logininfor` VALUES (1081, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 21:48:46');
INSERT INTO `sys_logininfor` VALUES (1082, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-29 21:49:02');
INSERT INTO `sys_logininfor` VALUES (1083, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 21:49:08');
INSERT INTO `sys_logininfor` VALUES (1084, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 21:55:37');
INSERT INTO `sys_logininfor` VALUES (1085, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 22:07:29');
INSERT INTO `sys_logininfor` VALUES (1086, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 22:14:42');
INSERT INTO `sys_logininfor` VALUES (1087, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-29 22:14:45');
INSERT INTO `sys_logininfor` VALUES (1088, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-29 22:14:49');
INSERT INTO `sys_logininfor` VALUES (1089, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 08:48:34');
INSERT INTO `sys_logininfor` VALUES (1090, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 09:17:00');
INSERT INTO `sys_logininfor` VALUES (1091, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 09:49:39');
INSERT INTO `sys_logininfor` VALUES (1092, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 09:52:41');
INSERT INTO `sys_logininfor` VALUES (1093, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-30 09:54:02');
INSERT INTO `sys_logininfor` VALUES (1094, 'admin1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 09:54:08');
INSERT INTO `sys_logininfor` VALUES (1095, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 10:03:57');
INSERT INTO `sys_logininfor` VALUES (1096, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-30 10:04:06');
INSERT INTO `sys_logininfor` VALUES (1097, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 10:04:19');
INSERT INTO `sys_logininfor` VALUES (1098, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-30 10:07:08');
INSERT INTO `sys_logininfor` VALUES (1099, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 10:07:12');
INSERT INTO `sys_logininfor` VALUES (1100, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-30 10:14:37');
INSERT INTO `sys_logininfor` VALUES (1101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 10:14:42');
INSERT INTO `sys_logininfor` VALUES (1102, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-30 10:18:57');
INSERT INTO `sys_logininfor` VALUES (1103, 'admin1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 10:21:36');
INSERT INTO `sys_logininfor` VALUES (1104, 'admin1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 10:23:47');
INSERT INTO `sys_logininfor` VALUES (1105, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 10:43:15');
INSERT INTO `sys_logininfor` VALUES (1106, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-30 10:53:08');
INSERT INTO `sys_logininfor` VALUES (1107, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 10:53:13');
INSERT INTO `sys_logininfor` VALUES (1108, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-30 10:59:53');
INSERT INTO `sys_logininfor` VALUES (1109, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 10:59:56');
INSERT INTO `sys_logininfor` VALUES (1110, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 11:05:47');
INSERT INTO `sys_logininfor` VALUES (1111, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 11:20:05');
INSERT INTO `sys_logininfor` VALUES (1112, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 11:26:30');
INSERT INTO `sys_logininfor` VALUES (1113, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-30 11:26:55');
INSERT INTO `sys_logininfor` VALUES (1114, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 11:27:03');
INSERT INTO `sys_logininfor` VALUES (1115, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 11:31:27');
INSERT INTO `sys_logininfor` VALUES (1116, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-30 11:32:08');
INSERT INTO `sys_logininfor` VALUES (1117, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 11:32:14');
INSERT INTO `sys_logininfor` VALUES (1118, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-30 11:33:10');
INSERT INTO `sys_logininfor` VALUES (1119, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 11:33:12');
INSERT INTO `sys_logininfor` VALUES (1120, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 11:34:59');
INSERT INTO `sys_logininfor` VALUES (1121, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 11:52:38');
INSERT INTO `sys_logininfor` VALUES (1122, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 13:05:56');
INSERT INTO `sys_logininfor` VALUES (1123, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 13:09:46');
INSERT INTO `sys_logininfor` VALUES (1124, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-30 13:15:05');
INSERT INTO `sys_logininfor` VALUES (1125, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 14:52:56');
INSERT INTO `sys_logininfor` VALUES (1126, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 15:12:45');
INSERT INTO `sys_logininfor` VALUES (1127, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 15:51:22');
INSERT INTO `sys_logininfor` VALUES (1128, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 15:53:28');
INSERT INTO `sys_logininfor` VALUES (1129, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 16:00:49');
INSERT INTO `sys_logininfor` VALUES (1130, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 19:00:58');
INSERT INTO `sys_logininfor` VALUES (1131, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 19:18:10');
INSERT INTO `sys_logininfor` VALUES (1132, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 19:30:45');
INSERT INTO `sys_logininfor` VALUES (1133, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 19:31:55');
INSERT INTO `sys_logininfor` VALUES (1134, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 19:58:21');
INSERT INTO `sys_logininfor` VALUES (1135, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 19:59:44');
INSERT INTO `sys_logininfor` VALUES (1136, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:02:57');
INSERT INTO `sys_logininfor` VALUES (1137, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:06:09');
INSERT INTO `sys_logininfor` VALUES (1138, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:10:48');
INSERT INTO `sys_logininfor` VALUES (1139, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:14:36');
INSERT INTO `sys_logininfor` VALUES (1140, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:22:45');
INSERT INTO `sys_logininfor` VALUES (1141, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:22:56');
INSERT INTO `sys_logininfor` VALUES (1142, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-31 20:23:22');
INSERT INTO `sys_logininfor` VALUES (1143, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:23:27');
INSERT INTO `sys_logininfor` VALUES (1144, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-31 20:26:00');
INSERT INTO `sys_logininfor` VALUES (1145, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:26:01');
INSERT INTO `sys_logininfor` VALUES (1146, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:29:22');
INSERT INTO `sys_logininfor` VALUES (1147, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-31 20:29:45');
INSERT INTO `sys_logininfor` VALUES (1148, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:29:47');
INSERT INTO `sys_logininfor` VALUES (1149, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-31 20:30:06');
INSERT INTO `sys_logininfor` VALUES (1150, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:30:09');
INSERT INTO `sys_logininfor` VALUES (1151, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-31 20:30:19');
INSERT INTO `sys_logininfor` VALUES (1152, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:30:20');
INSERT INTO `sys_logininfor` VALUES (1153, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-31 20:31:00');
INSERT INTO `sys_logininfor` VALUES (1154, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:31:03');
INSERT INTO `sys_logininfor` VALUES (1155, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-31 20:31:12');
INSERT INTO `sys_logininfor` VALUES (1156, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:31:14');
INSERT INTO `sys_logininfor` VALUES (1157, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:31:38');
INSERT INTO `sys_logininfor` VALUES (1158, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:36:30');
INSERT INTO `sys_logininfor` VALUES (1159, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-31 20:36:37');
INSERT INTO `sys_logininfor` VALUES (1160, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:36:41');
INSERT INTO `sys_logininfor` VALUES (1161, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:40:12');
INSERT INTO `sys_logininfor` VALUES (1162, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-31 20:40:16');
INSERT INTO `sys_logininfor` VALUES (1163, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-10-31 20:40:19');
INSERT INTO `sys_logininfor` VALUES (1164, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-10-31 20:40:54');
INSERT INTO `sys_logininfor` VALUES (1165, 'ry管理', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2024-10-31 20:40:57');
INSERT INTO `sys_logininfor` VALUES (1166, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-04 11:28:36');
INSERT INTO `sys_logininfor` VALUES (1167, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-08 15:32:49');
INSERT INTO `sys_logininfor` VALUES (1168, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-08 15:33:30');
INSERT INTO `sys_logininfor` VALUES (1169, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-08 15:33:34');
INSERT INTO `sys_logininfor` VALUES (1170, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-08 15:33:43');
INSERT INTO `sys_logininfor` VALUES (1171, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-08 15:34:59');
INSERT INTO `sys_logininfor` VALUES (1172, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-08 15:41:44');
INSERT INTO `sys_logininfor` VALUES (1173, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-08 15:43:26');
INSERT INTO `sys_logininfor` VALUES (1174, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-08 15:56:05');
INSERT INTO `sys_logininfor` VALUES (1175, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-08 15:59:53');
INSERT INTO `sys_logininfor` VALUES (1176, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-12 11:36:15');
INSERT INTO `sys_logininfor` VALUES (1177, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-12 11:36:36');
INSERT INTO `sys_logininfor` VALUES (1178, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-12 11:36:43');
INSERT INTO `sys_logininfor` VALUES (1179, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-12 11:37:05');
INSERT INTO `sys_logininfor` VALUES (1180, 'ry管理', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误', '2024-11-12 11:37:09');
INSERT INTO `sys_logininfor` VALUES (1181, 'ry_lisi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2024-11-12 11:37:38');
INSERT INTO `sys_logininfor` VALUES (1182, 'ry_lisi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-12 11:37:44');
INSERT INTO `sys_logininfor` VALUES (1183, '注册用户测试', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2024-11-12 11:44:48');
INSERT INTO `sys_logininfor` VALUES (1184, '注册用户测试', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-12 11:44:53');
INSERT INTO `sys_logininfor` VALUES (1185, '1111', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2024-11-12 11:59:21');
INSERT INTO `sys_logininfor` VALUES (1186, 'ceshi2', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '注册成功', '2024-11-12 12:10:51');
INSERT INTO `sys_logininfor` VALUES (1187, 'ceshi2', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-12 12:11:46');
INSERT INTO `sys_logininfor` VALUES (1188, 'ceshi2', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-12 12:31:31');
INSERT INTO `sys_logininfor` VALUES (1189, 'ceshi2', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-12 12:38:12');
INSERT INTO `sys_logininfor` VALUES (1190, 'ceshi2', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-12 12:41:05');
INSERT INTO `sys_logininfor` VALUES (1191, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-12 15:11:33');
INSERT INTO `sys_logininfor` VALUES (1192, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-12 15:11:45');
INSERT INTO `sys_logininfor` VALUES (1193, 'ceshi2', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-12 15:11:51');
INSERT INTO `sys_logininfor` VALUES (1194, 'ceshi2', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-12 15:12:41');
INSERT INTO `sys_logininfor` VALUES (1195, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-12 15:12:44');
INSERT INTO `sys_logininfor` VALUES (1196, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-12 15:33:27');
INSERT INTO `sys_logininfor` VALUES (1197, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-12 15:47:53');
INSERT INTO `sys_logininfor` VALUES (1198, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 10:34:22');
INSERT INTO `sys_logininfor` VALUES (1199, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 10:56:30');
INSERT INTO `sys_logininfor` VALUES (1200, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 10:58:44');
INSERT INTO `sys_logininfor` VALUES (1201, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 11:00:58');
INSERT INTO `sys_logininfor` VALUES (1202, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 11:02:06');
INSERT INTO `sys_logininfor` VALUES (1203, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 11:03:27');
INSERT INTO `sys_logininfor` VALUES (1204, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 11:04:19');
INSERT INTO `sys_logininfor` VALUES (1205, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 11:08:35');
INSERT INTO `sys_logininfor` VALUES (1206, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 11:22:26');
INSERT INTO `sys_logininfor` VALUES (1207, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 11:24:42');
INSERT INTO `sys_logininfor` VALUES (1208, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 11:29:46');
INSERT INTO `sys_logininfor` VALUES (1209, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 11:31:44');
INSERT INTO `sys_logininfor` VALUES (1210, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 11:42:35');
INSERT INTO `sys_logininfor` VALUES (1211, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 11:47:44');
INSERT INTO `sys_logininfor` VALUES (1212, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 12:51:24');
INSERT INTO `sys_logininfor` VALUES (1213, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 12:51:26');
INSERT INTO `sys_logininfor` VALUES (1214, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 12:53:28');
INSERT INTO `sys_logininfor` VALUES (1215, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 13:19:44');
INSERT INTO `sys_logininfor` VALUES (1216, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 13:28:38');
INSERT INTO `sys_logininfor` VALUES (1217, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 13:36:13');
INSERT INTO `sys_logininfor` VALUES (1218, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 13:47:53');
INSERT INTO `sys_logininfor` VALUES (1219, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 13:56:25');
INSERT INTO `sys_logininfor` VALUES (1220, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 14:09:07');
INSERT INTO `sys_logininfor` VALUES (1221, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-13 14:47:49');
INSERT INTO `sys_logininfor` VALUES (1222, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-14 15:29:02');
INSERT INTO `sys_logininfor` VALUES (1223, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-14 16:10:12');
INSERT INTO `sys_logininfor` VALUES (1224, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-14 16:34:09');
INSERT INTO `sys_logininfor` VALUES (1225, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-14 16:39:58');
INSERT INTO `sys_logininfor` VALUES (1226, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-14 16:41:16');
INSERT INTO `sys_logininfor` VALUES (1227, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-14 18:59:37');
INSERT INTO `sys_logininfor` VALUES (1228, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-14 19:12:39');
INSERT INTO `sys_logininfor` VALUES (1229, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-14 19:14:55');
INSERT INTO `sys_logininfor` VALUES (1230, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-14 19:29:02');
INSERT INTO `sys_logininfor` VALUES (1231, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-14 19:34:04');
INSERT INTO `sys_logininfor` VALUES (1232, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-14 19:44:19');
INSERT INTO `sys_logininfor` VALUES (1233, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-14 20:47:12');
INSERT INTO `sys_logininfor` VALUES (1234, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-15 21:12:28');
INSERT INTO `sys_logininfor` VALUES (1235, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-15 21:23:08');
INSERT INTO `sys_logininfor` VALUES (1236, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-15 21:23:13');
INSERT INTO `sys_logininfor` VALUES (1237, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-15 21:25:36');
INSERT INTO `sys_logininfor` VALUES (1238, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-15 21:26:57');
INSERT INTO `sys_logininfor` VALUES (1239, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-15 21:35:29');
INSERT INTO `sys_logininfor` VALUES (1240, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-15 21:39:20');
INSERT INTO `sys_logininfor` VALUES (1241, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-15 21:41:47');
INSERT INTO `sys_logininfor` VALUES (1242, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-15 21:45:43');
INSERT INTO `sys_logininfor` VALUES (1243, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-15 21:53:05');
INSERT INTO `sys_logininfor` VALUES (1244, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-15 21:54:50');
INSERT INTO `sys_logininfor` VALUES (1245, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-15 22:01:10');
INSERT INTO `sys_logininfor` VALUES (1246, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-15 22:02:19');
INSERT INTO `sys_logininfor` VALUES (1247, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-15 22:02:47');
INSERT INTO `sys_logininfor` VALUES (1248, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-15 22:06:11');
INSERT INTO `sys_logininfor` VALUES (1249, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-15 22:09:49');
INSERT INTO `sys_logininfor` VALUES (1250, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-16 19:39:22');
INSERT INTO `sys_logininfor` VALUES (1251, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-16 20:33:32');
INSERT INTO `sys_logininfor` VALUES (1252, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-16 20:37:51');
INSERT INTO `sys_logininfor` VALUES (1253, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-16 20:55:52');
INSERT INTO `sys_logininfor` VALUES (1254, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-16 21:24:05');
INSERT INTO `sys_logininfor` VALUES (1255, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-16 21:27:26');
INSERT INTO `sys_logininfor` VALUES (1256, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-16 21:32:00');
INSERT INTO `sys_logininfor` VALUES (1257, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-16 21:34:56');
INSERT INTO `sys_logininfor` VALUES (1258, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-16 21:40:35');
INSERT INTO `sys_logininfor` VALUES (1259, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-17 20:35:38');
INSERT INTO `sys_logininfor` VALUES (1260, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-17 21:04:03');
INSERT INTO `sys_logininfor` VALUES (1261, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-18 14:55:51');
INSERT INTO `sys_logininfor` VALUES (1262, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-18 15:00:01');
INSERT INTO `sys_logininfor` VALUES (1263, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-18 15:03:25');
INSERT INTO `sys_logininfor` VALUES (1264, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-18 15:03:41');
INSERT INTO `sys_logininfor` VALUES (1265, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-18 15:06:30');
INSERT INTO `sys_logininfor` VALUES (1266, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-18 15:08:27');
INSERT INTO `sys_logininfor` VALUES (1267, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-18 15:10:57');
INSERT INTO `sys_logininfor` VALUES (1268, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-18 15:12:45');
INSERT INTO `sys_logininfor` VALUES (1269, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-18 15:15:40');
INSERT INTO `sys_logininfor` VALUES (1270, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-18 15:32:16');
INSERT INTO `sys_logininfor` VALUES (1271, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-18 16:25:23');
INSERT INTO `sys_logininfor` VALUES (1272, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-18 16:33:02');
INSERT INTO `sys_logininfor` VALUES (1273, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-18 16:34:49');
INSERT INTO `sys_logininfor` VALUES (1274, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-18 16:35:26');
INSERT INTO `sys_logininfor` VALUES (1275, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-18 16:38:42');
INSERT INTO `sys_logininfor` VALUES (1276, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-19 09:02:29');
INSERT INTO `sys_logininfor` VALUES (1277, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-19 09:05:01');
INSERT INTO `sys_logininfor` VALUES (1278, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-19 10:09:05');
INSERT INTO `sys_logininfor` VALUES (1279, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-20 15:44:55');
INSERT INTO `sys_logininfor` VALUES (1280, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-20 15:48:49');
INSERT INTO `sys_logininfor` VALUES (1281, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-20 15:53:29');
INSERT INTO `sys_logininfor` VALUES (1282, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-20 15:57:45');
INSERT INTO `sys_logininfor` VALUES (1283, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-20 16:00:06');
INSERT INTO `sys_logininfor` VALUES (1284, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 20:14:37');
INSERT INTO `sys_logininfor` VALUES (1285, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 20:21:54');
INSERT INTO `sys_logininfor` VALUES (1286, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 20:31:45');
INSERT INTO `sys_logininfor` VALUES (1287, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 20:33:23');
INSERT INTO `sys_logininfor` VALUES (1288, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 20:43:15');
INSERT INTO `sys_logininfor` VALUES (1289, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 21:22:38');
INSERT INTO `sys_logininfor` VALUES (1290, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 21:26:09');
INSERT INTO `sys_logininfor` VALUES (1291, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 21:30:59');
INSERT INTO `sys_logininfor` VALUES (1292, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 21:34:04');
INSERT INTO `sys_logininfor` VALUES (1293, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 21:37:33');
INSERT INTO `sys_logininfor` VALUES (1294, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 21:45:50');
INSERT INTO `sys_logininfor` VALUES (1295, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 21:51:11');
INSERT INTO `sys_logininfor` VALUES (1296, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 21:57:20');
INSERT INTO `sys_logininfor` VALUES (1297, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 21:57:40');
INSERT INTO `sys_logininfor` VALUES (1298, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 22:04:57');
INSERT INTO `sys_logininfor` VALUES (1299, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 22:13:09');
INSERT INTO `sys_logininfor` VALUES (1300, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 22:15:25');
INSERT INTO `sys_logininfor` VALUES (1301, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-25 22:24:02');
INSERT INTO `sys_logininfor` VALUES (1302, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 09:20:18');
INSERT INTO `sys_logininfor` VALUES (1303, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 09:30:55');
INSERT INTO `sys_logininfor` VALUES (1304, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 09:32:08');
INSERT INTO `sys_logininfor` VALUES (1305, 'ceshi2', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 09:33:52');
INSERT INTO `sys_logininfor` VALUES (1306, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 09:35:46');
INSERT INTO `sys_logininfor` VALUES (1307, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-26 09:35:54');
INSERT INTO `sys_logininfor` VALUES (1308, 'ceshi2', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 09:35:59');
INSERT INTO `sys_logininfor` VALUES (1309, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 09:53:27');
INSERT INTO `sys_logininfor` VALUES (1310, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-26 09:57:27');
INSERT INTO `sys_logininfor` VALUES (1311, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 09:57:34');
INSERT INTO `sys_logininfor` VALUES (1312, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-26 10:00:04');
INSERT INTO `sys_logininfor` VALUES (1313, 'ceshi2', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 10:10:10');
INSERT INTO `sys_logininfor` VALUES (1314, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 10:26:20');
INSERT INTO `sys_logininfor` VALUES (1315, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 10:32:18');
INSERT INTO `sys_logininfor` VALUES (1316, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 10:38:11');
INSERT INTO `sys_logininfor` VALUES (1317, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 10:47:00');
INSERT INTO `sys_logininfor` VALUES (1318, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 14:34:41');
INSERT INTO `sys_logininfor` VALUES (1319, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 14:42:56');
INSERT INTO `sys_logininfor` VALUES (1320, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 14:43:44');
INSERT INTO `sys_logininfor` VALUES (1321, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 14:43:51');
INSERT INTO `sys_logininfor` VALUES (1322, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 14:48:05');
INSERT INTO `sys_logininfor` VALUES (1323, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 14:50:58');
INSERT INTO `sys_logininfor` VALUES (1324, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-26 14:51:43');
INSERT INTO `sys_logininfor` VALUES (1325, 'ceshi2', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 14:51:46');
INSERT INTO `sys_logininfor` VALUES (1326, 'ceshi2', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-26 14:54:35');
INSERT INTO `sys_logininfor` VALUES (1327, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 14:54:37');
INSERT INTO `sys_logininfor` VALUES (1328, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-26 14:57:17');
INSERT INTO `sys_logininfor` VALUES (1329, 'ceshi2', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 14:57:21');
INSERT INTO `sys_logininfor` VALUES (1330, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 15:05:00');
INSERT INTO `sys_logininfor` VALUES (1331, 'ceshi2', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 15:16:42');
INSERT INTO `sys_logininfor` VALUES (1332, 'ceshi2', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-26 15:17:30');
INSERT INTO `sys_logininfor` VALUES (1333, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 15:17:32');
INSERT INTO `sys_logininfor` VALUES (1334, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-26 15:17:43');
INSERT INTO `sys_logininfor` VALUES (1335, 'admin1', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 15:17:48');
INSERT INTO `sys_logininfor` VALUES (1336, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 15:17:58');
INSERT INTO `sys_logininfor` VALUES (1337, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 15:28:19');
INSERT INTO `sys_logininfor` VALUES (1338, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 15:31:11');
INSERT INTO `sys_logininfor` VALUES (1339, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 15:34:10');
INSERT INTO `sys_logininfor` VALUES (1340, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 15:35:51');
INSERT INTO `sys_logininfor` VALUES (1341, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 15:37:11');
INSERT INTO `sys_logininfor` VALUES (1342, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 15:37:56');
INSERT INTO `sys_logininfor` VALUES (1343, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 15:45:08');
INSERT INTO `sys_logininfor` VALUES (1344, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 15:54:19');
INSERT INTO `sys_logininfor` VALUES (1345, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 15:55:13');
INSERT INTO `sys_logininfor` VALUES (1346, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 15:56:05');
INSERT INTO `sys_logininfor` VALUES (1347, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 20:05:21');
INSERT INTO `sys_logininfor` VALUES (1348, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 20:08:39');
INSERT INTO `sys_logininfor` VALUES (1349, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 20:15:36');
INSERT INTO `sys_logininfor` VALUES (1350, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 20:18:28');
INSERT INTO `sys_logininfor` VALUES (1351, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 20:18:50');
INSERT INTO `sys_logininfor` VALUES (1352, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 20:20:33');
INSERT INTO `sys_logininfor` VALUES (1353, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 20:21:06');
INSERT INTO `sys_logininfor` VALUES (1354, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 20:25:11');
INSERT INTO `sys_logininfor` VALUES (1355, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 20:31:35');
INSERT INTO `sys_logininfor` VALUES (1356, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 20:32:26');
INSERT INTO `sys_logininfor` VALUES (1357, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 20:34:43');
INSERT INTO `sys_logininfor` VALUES (1358, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 20:37:07');
INSERT INTO `sys_logininfor` VALUES (1359, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 20:39:52');
INSERT INTO `sys_logininfor` VALUES (1360, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 20:46:43');
INSERT INTO `sys_logininfor` VALUES (1361, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 20:49:14');
INSERT INTO `sys_logininfor` VALUES (1362, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 20:52:41');
INSERT INTO `sys_logininfor` VALUES (1363, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 20:54:44');
INSERT INTO `sys_logininfor` VALUES (1364, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 21:03:28');
INSERT INTO `sys_logininfor` VALUES (1365, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 21:13:26');
INSERT INTO `sys_logininfor` VALUES (1366, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 21:16:46');
INSERT INTO `sys_logininfor` VALUES (1367, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 21:22:26');
INSERT INTO `sys_logininfor` VALUES (1368, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 21:29:54');
INSERT INTO `sys_logininfor` VALUES (1369, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 21:32:17');
INSERT INTO `sys_logininfor` VALUES (1370, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 21:37:04');
INSERT INTO `sys_logininfor` VALUES (1371, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 21:39:47');
INSERT INTO `sys_logininfor` VALUES (1372, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 21:42:03');
INSERT INTO `sys_logininfor` VALUES (1373, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 21:46:24');
INSERT INTO `sys_logininfor` VALUES (1374, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 21:48:14');
INSERT INTO `sys_logininfor` VALUES (1375, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 22:15:36');
INSERT INTO `sys_logininfor` VALUES (1376, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-26 22:16:33');
INSERT INTO `sys_logininfor` VALUES (1377, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 22:16:37');
INSERT INTO `sys_logininfor` VALUES (1378, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-26 22:16:51');
INSERT INTO `sys_logininfor` VALUES (1379, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 22:16:52');
INSERT INTO `sys_logininfor` VALUES (1380, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-26 22:17:44');
INSERT INTO `sys_logininfor` VALUES (1381, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 22:17:47');
INSERT INTO `sys_logininfor` VALUES (1382, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 22:31:05');
INSERT INTO `sys_logininfor` VALUES (1383, 'ry', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-26 22:34:12');
INSERT INTO `sys_logininfor` VALUES (1384, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 22:34:15');
INSERT INTO `sys_logininfor` VALUES (1385, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-26 22:34:30');
INSERT INTO `sys_logininfor` VALUES (1386, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 22:34:31');
INSERT INTO `sys_logininfor` VALUES (1387, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-26 22:36:15');
INSERT INTO `sys_logininfor` VALUES (1388, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-26 22:36:18');
INSERT INTO `sys_logininfor` VALUES (1389, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-26 22:36:37');
INSERT INTO `sys_logininfor` VALUES (1390, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 09:18:57');
INSERT INTO `sys_logininfor` VALUES (1391, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 09:21:28');
INSERT INTO `sys_logininfor` VALUES (1392, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 09:25:29');
INSERT INTO `sys_logininfor` VALUES (1393, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 09:27:23');
INSERT INTO `sys_logininfor` VALUES (1394, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 09:39:37');
INSERT INTO `sys_logininfor` VALUES (1395, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 09:42:40');
INSERT INTO `sys_logininfor` VALUES (1396, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 09:43:53');
INSERT INTO `sys_logininfor` VALUES (1397, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 10:03:09');
INSERT INTO `sys_logininfor` VALUES (1398, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 10:07:11');
INSERT INTO `sys_logininfor` VALUES (1399, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 10:07:29');
INSERT INTO `sys_logininfor` VALUES (1400, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 10:11:21');
INSERT INTO `sys_logininfor` VALUES (1401, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-27 10:13:10');
INSERT INTO `sys_logininfor` VALUES (1402, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 10:13:12');
INSERT INTO `sys_logininfor` VALUES (1403, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 10:19:12');
INSERT INTO `sys_logininfor` VALUES (1404, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 10:24:19');
INSERT INTO `sys_logininfor` VALUES (1405, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-27 10:25:00');
INSERT INTO `sys_logininfor` VALUES (1406, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 10:25:03');
INSERT INTO `sys_logininfor` VALUES (1407, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-27 10:27:25');
INSERT INTO `sys_logininfor` VALUES (1408, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 10:27:27');
INSERT INTO `sys_logininfor` VALUES (1409, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 10:28:53');
INSERT INTO `sys_logininfor` VALUES (1410, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 10:30:44');
INSERT INTO `sys_logininfor` VALUES (1411, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 10:36:09');
INSERT INTO `sys_logininfor` VALUES (1412, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 10:43:33');
INSERT INTO `sys_logininfor` VALUES (1413, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 11:38:33');
INSERT INTO `sys_logininfor` VALUES (1414, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 15:11:33');
INSERT INTO `sys_logininfor` VALUES (1415, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 15:38:34');
INSERT INTO `sys_logininfor` VALUES (1416, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 15:54:02');
INSERT INTO `sys_logininfor` VALUES (1417, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 15:56:57');
INSERT INTO `sys_logininfor` VALUES (1418, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 15:58:10');
INSERT INTO `sys_logininfor` VALUES (1419, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 21:02:43');
INSERT INTO `sys_logininfor` VALUES (1420, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 21:03:57');
INSERT INTO `sys_logininfor` VALUES (1421, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 21:06:43');
INSERT INTO `sys_logininfor` VALUES (1422, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 21:08:54');
INSERT INTO `sys_logininfor` VALUES (1423, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 21:16:08');
INSERT INTO `sys_logininfor` VALUES (1424, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 21:29:12');
INSERT INTO `sys_logininfor` VALUES (1425, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 22:00:43');
INSERT INTO `sys_logininfor` VALUES (1426, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 22:03:08');
INSERT INTO `sys_logininfor` VALUES (1427, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 22:21:43');
INSERT INTO `sys_logininfor` VALUES (1428, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2024-11-27 22:22:00');
INSERT INTO `sys_logininfor` VALUES (1429, '王明', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-11-27 22:22:04');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2079 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2024-09-03 14:00:53', 'admin', '2024-09-19 14:43:54', '系统管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2024-09-03 14:00:53', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2024-09-03 14:00:53', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2024-09-03 14:00:53', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2024-09-03 14:00:53', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2024-09-03 14:00:53', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2024-09-03 14:00:53', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', 'menuItem', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2024-09-03 14:00:53', 'admin', '2024-09-19 14:46:32', '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2024-09-03 14:00:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '图书管理', 0, 2, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-book', 'admin', '2024-09-11 17:51:37', 'admin', '2024-09-29 17:33:17', '');
INSERT INTO `sys_menu` VALUES (2001, '书籍管理', 2000, 1, 'books/book', 'menuItem', 'C', '0', '1', 'books:book:view', '#', 'admin', '2024-09-11 17:53:52', 'admin', '2024-09-13 09:26:27', '');
INSERT INTO `sys_menu` VALUES (2003, '书籍分类', 2000, 2, 'books/booksort', 'menuItem', 'C', '0', '0', 'books:booksort:view', '#', 'admin', '2024-09-13 08:54:04', 'admin', '2024-09-13 09:26:41', '');
INSERT INTO `sys_menu` VALUES (2004, '借阅证管理', 2000, 3, 'books/borrowcard', 'menuItem', 'C', '0', '0', 'books:borrowcard:view', '#', 'admin', '2024-09-14 08:57:59', 'admin', '2024-09-14 08:58:14', '');
INSERT INTO `sys_menu` VALUES (2005, '发布公告', 0, 4, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-calendar', 'admin', '2024-09-19 14:44:56', 'admin', '2024-10-02 23:39:02', '');
INSERT INTO `sys_menu` VALUES (2007, '公告管理', 2005, 2, 'books/tnotice', 'menuItem', 'C', '0', '1', 'books:tnotice:view', '#', 'admin', '2024-09-24 10:02:49', 'admin', '2024-10-01 15:04:03', '');
INSERT INTO `sys_menu` VALUES (2008, '借阅规则管理', 2000, 5, 'books/rules', 'menuItem', 'C', '0', '1', 'books:rules:view', '#', 'admin', '2024-09-24 11:16:26', 'admin', '2024-10-09 14:44:40', '');
INSERT INTO `sys_menu` VALUES (2023, '借阅信息查询', 2000, 6, 'books/borrowSelective', 'menuItem', 'C', '0', '1', 'books:borrowSelective:view', '#', 'admin', '2024-09-29 17:34:23', 'admin', '2024-10-09 14:44:51', '');
INSERT INTO `sys_menu` VALUES (2024, '管理员信息', 2000, 7, 'books/managerInfo', 'menuItem', 'C', '0', '1', 'books:managerInfo:view', '#', 'admin', '2024-10-02 16:06:46', 'admin', '2024-10-02 16:47:25', '');
INSERT INTO `sys_menu` VALUES (2028, '报表管理', 0, 3, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-bar-chart', 'admin', '2024-10-02 23:49:09', 'admin', '2024-10-02 23:49:16', '');
INSERT INTO `sys_menu` VALUES (2029, '归还报表', 2028, 2, 'books/returntable', 'menuItem', 'C', '0', '1', 'books:returntable:view', '#', 'admin', '2024-10-02 23:49:39', 'admin', '2024-10-03 00:47:20', '');
INSERT INTO `sys_menu` VALUES (2030, '借阅报表', 2028, 1, 'books/borrowtable', 'menuItem', 'C', '0', '1', 'books:borrowtable:view', '#', 'admin', '2024-10-02 23:50:09', 'admin', '2024-10-03 00:46:53', '');
INSERT INTO `sys_menu` VALUES (2031, '借阅规则', 0, 12, 'userMessages/borrowRulesMessage', 'menuItem', 'C', '0', '1', 'userMessages:borrowRulesMessage:view', '#', 'admin', '2024-10-03 02:14:57', 'admin', '2024-10-30 10:18:18', '');
INSERT INTO `sys_menu` VALUES (2032, '图书查看', 0, 6, 'userMessages/bookView', 'menuItem', 'C', '0', '1', 'userMessages:bookView:view', '#', 'admin', '2024-10-03 02:18:37', 'admin', '2024-10-30 10:15:41', '');
INSERT INTO `sys_menu` VALUES (2033, '留言板', 0, 7, 'userMessages/messageBoard', 'menuItem', 'C', '0', '1', 'userMessages:messageBoard:add', '#', 'admin', '2024-10-03 02:25:54', 'admin', '2024-10-30 10:16:19', '');
INSERT INTO `sys_menu` VALUES (2034, '公告信息', 0, 8, 'userMessages/noticeSelective', 'menuItem', 'C', '0', '1', 'userMessages:noticeSelective:view', '#', 'admin', '2024-10-03 02:26:57', 'admin', '2024-10-30 10:16:59', '');
INSERT INTO `sys_menu` VALUES (2035, '个人信息', 0, 8, 'userMessages/userPasonalMessage', 'menuItem', 'C', '0', '1', 'userMessages:userPasonalMessage:view', '#', 'admin', '2024-10-03 02:27:52', 'admin', '2024-10-30 10:16:51', '');
INSERT INTO `sys_menu` VALUES (2036, '个人违章信息', 0, 11, 'userMessages/violationMessage', 'menuItem', 'C', '0', '1', 'userMessages:violationMessage:view', '#', 'admin', '2024-10-03 02:30:23', 'admin', '2024-10-30 10:17:26', '');
INSERT INTO `sys_menu` VALUES (2038, '个人借阅', 0, 10, 'userMessages/borrowMessage', 'menuItem', 'C', '0', '1', 'userMessages:borrowMessage:view', '#', 'admin', '2024-10-04 23:38:27', 'admin', '2024-10-30 10:17:45', '');
INSERT INTO `sys_menu` VALUES (2039, '图书列表', 2001, 1, '#', 'menuItem', 'F', '0', '1', 'books:book:list', '#', 'admin', '2024-10-08 08:49:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '图书列表', 2032, 1, '#', 'menuItem', 'F', '0', '1', 'userMessages:bookView:list', '#', 'admin', '2024-10-08 08:50:25', 'admin', '2024-10-08 08:57:10', '');
INSERT INTO `sys_menu` VALUES (2041, '违章信息列表', 2036, 1, '#', 'menuItem', 'F', '0', '1', 'userMessages:violationMessage:list', '#', 'admin', '2024-10-08 08:52:26', 'admin', '2024-10-08 09:12:11', '');
INSERT INTO `sys_menu` VALUES (2042, '借阅规则列表', 2031, 1, '#', 'menuItem', 'F', '0', '1', 'userMessages:borrowRulesMessage:list', '#', 'admin', '2024-10-08 08:57:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '借阅列表', 2038, 1, '#', 'menuItem', 'F', '0', '1', 'userMessages:borrowMessage:list', '#', 'admin', '2024-10-08 09:08:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '留言添加', 2033, 1, '#', 'menuItem', 'F', '0', '1', 'userMessages:messageBoard:add', '#', 'admin', '2024-10-08 09:09:14', 'admin', '2024-10-11 11:10:50', '');
INSERT INTO `sys_menu` VALUES (2045, '公告信息列表', 2034, 1, '#', 'menuItem', 'F', '0', '1', 'userMessages:notiveSelective:viewNotice', '#', 'admin', '2024-10-08 09:10:58', 'admin', '2024-10-08 09:17:08', '');
INSERT INTO `sys_menu` VALUES (2046, '公告视图', 2034, 2, '#', 'menuItem', 'F', '0', '1', 'userMessages:notiveSelective:view', '#', 'admin', '2024-10-08 09:19:24', 'admin', '2024-10-08 09:30:23', '');
INSERT INTO `sys_menu` VALUES (2047, '公告列表', 2034, 3, '#', 'menuItem', 'F', '0', '1', 'userMessages:notiveSelective:list', '#', 'admin', '2024-10-08 09:30:08', 'admin', '2024-10-08 09:30:32', '');
INSERT INTO `sys_menu` VALUES (2048, '图书馆管理', 2000, 4, 'books/library', 'menuItem', 'C', '0', '1', 'books:library:view', '#', 'admin', '2024-10-09 14:44:03', 'admin', '2024-10-09 14:59:03', '');
INSERT INTO `sys_menu` VALUES (2049, '字典管理', 1, 6, '/system/dict', 'menuItem', 'C', '0', '1', 'system:dict:view', 'fa fa-paint-brush', 'admin', '2024-10-09 15:43:27', 'admin', '2024-10-09 22:24:48', '');
INSERT INTO `sys_menu` VALUES (2050, '借阅图书', 2001, 2, '#', 'menuItem', 'F', '0', '1', 'books:book:borrow', '#', 'admin', '2024-10-10 08:39:15', 'admin', '2024-10-10 10:58:43', '');
INSERT INTO `sys_menu` VALUES (2051, '公告添加', 2007, 2, '#', 'menuItem', 'F', '0', '1', 'books:tnotice:add', '#', 'admin', '2024-10-10 08:42:03', 'admin', '2024-10-10 08:43:57', '');
INSERT INTO `sys_menu` VALUES (2052, '公告列表', 2007, 1, '#', 'menuItem', 'F', '0', '1', 'books:tnotice:list', '#', 'admin', '2024-10-10 08:42:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '公告修改', 2007, 3, '#', 'menuItem', 'F', '0', '1', 'books:tnotice:edit', '#', 'admin', '2024-10-10 08:43:01', 'admin', '2024-10-10 08:44:06', '');
INSERT INTO `sys_menu` VALUES (2054, '公告删除', 2007, 4, '#', 'menuItem', 'F', '0', '1', 'books:tnotice:remove', '#', 'admin', '2024-10-10 08:43:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '查看留言', 2033, 2, '#', 'menuItem', 'F', '0', '1', 'userMessages:messageBoard:viewmessage', '#', 'admin', '2024-10-10 08:45:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '报表列表', 2030, 1, '#', 'menuItem', 'F', '0', '1', 'books:borrowtable:list', '#', 'admin', '2024-10-10 08:46:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '报表列表', 2029, 1, '#', 'menuItem', 'F', '0', '1', 'books:returntable:list', '#', 'admin', '2024-10-10 08:46:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '归还图书', 2001, 3, '#', 'menuItem', 'F', '0', '1', 'books:book:returnBook', '#', 'admin', '2024-10-10 10:58:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '查询是否逾期', 2001, 5, '#', 'menuItem', 'F', '0', '1', 'books:book:returnSelect', '#', 'admin', '2024-10-11 10:56:37', 'admin', '2024-10-12 08:52:17', '');
INSERT INTO `sys_menu` VALUES (2061, '个人借阅证', 0, 5, 'userMessages/borrowCard', 'menuItem', 'C', '0', '1', 'userMessages:borrowCard:viewBorrowCard', '#', 'admin', '2024-10-11 15:37:15', 'admin', '2024-10-30 10:15:24', '');
INSERT INTO `sys_menu` VALUES (2062, '办理借阅证', 2061, 1, '#', 'menuItem', 'F', '0', '1', 'userMessages:borrowCard:add', '#', 'admin', '2024-10-11 15:37:51', 'admin', '2024-10-11 17:26:19', '');
INSERT INTO `sys_menu` VALUES (2063, '查看个人借阅卡信息', 2061, 2, '#', 'menuItem', 'F', '0', '1', 'userMessages:borrowCard:viewBorrowCard', '#', 'admin', '2024-10-11 17:27:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '查看借阅', 2001, 4, '#', 'menuItem', 'F', '0', '1', 'books:book:viewborrow', '#', 'admin', '2024-10-12 08:52:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '图书订阅', 2000, 8, 'books/bookrsshistory', 'menuItem', 'C', '0', '1', 'books:bookrsshistory:view', '#', 'admin', '2024-10-22 19:21:35', 'admin', '2024-10-22 19:21:46', '');
INSERT INTO `sys_menu` VALUES (2066, '订阅通知', 2000, 9, 'books/SubNotification', 'menuItem', 'C', '0', '1', 'books:SubNotification:view', '#', 'admin', '2024-10-24 15:50:03', 'admin', '2024-10-25 11:42:23', '');
INSERT INTO `sys_menu` VALUES (2068, '订阅图书', 2001, 6, '#', 'menuItem', 'F', '0', '1', 'books:book:notification', '#', 'admin', '2024-10-27 21:13:36', 'admin', '2024-10-27 21:14:28', '');
INSERT INTO `sys_menu` VALUES (2069, '读者留言', 2000, 7, 'books/messageBoard', 'menuItem', 'C', '0', '1', 'books:messageBoard:view', '#', 'admin', '2024-10-28 10:58:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2070, '图书借阅', 2032, 2, '#', 'menuItem', 'F', '0', '1', 'userMessages:bookView:borrow', '#', 'admin', '2024-10-29 15:41:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2071, '图书归还', 2032, 3, '#', 'menuItem', 'F', '0', '1', 'userMessages:bookView:returnBook', '#', 'admin', '2024-10-29 15:42:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2072, '归还判断', 2032, 4, '#', 'menuItem', 'F', '0', '1', 'userMessages:bookView:returnSelect', '#', 'admin', '2024-10-29 15:42:35', 'admin', '2024-11-26 14:55:50', '');
INSERT INTO `sys_menu` VALUES (2073, '图书订阅', 2032, 6, '#', 'menuItem', 'F', '0', '1', 'userMessages:bookView:notification', '#', 'admin', '2024-10-29 15:43:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2074, '查看借阅', 2032, 7, '#', 'menuItem', 'F', '0', '1', 'userMessages:bookView:viewborrow', '#', 'admin', '2024-10-31 20:27:22', 'admin', '2024-10-31 20:29:37', '');
INSERT INTO `sys_menu` VALUES (2076, '敏感词管理', 2000, 10, 'books/illegal', 'menuItem', 'C', '0', '1', 'books:illegal:view', '#', 'admin', '2024-11-13 10:35:23', 'admin', '2024-11-13 10:35:37', '');
INSERT INTO `sys_menu` VALUES (2077, '图书续借', 2032, 6, '#', 'menuItem', 'F', '0', '1', 'userMessages:bookView:renewBook', '#', 'admin', '2024-11-26 15:18:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2078, '图书续借', 2001, 7, '#', 'menuItem', 'F', '0', '1', 'books:book:renewBook', '#', 'admin', '2024-11-26 22:17:28', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 868 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '重置密码', 2, 'com.ruoyi.web.controller.system.SysProfileController.resetPwd()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-03 14:08:31', 92);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-09-03 14:10:37', 10);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"若依官网\"],\"url\":[\"http://ruoyi.vip\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-03 14:10:42', 31);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"若依官网\"],\"url\":[\"\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"1\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-03 14:11:02', 12);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-09-03 14:11:04', 9);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-03 14:15:56', 97);
INSERT INTO `sys_oper_log` VALUES (106, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"100\"],\"parentId\":[\"0\"],\"parentName\":[\"无\"],\"deptName\":[\"总管理\"],\"orderNum\":[\"0\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:49:29', 538);
INSERT INTO `sys_oper_log` VALUES (107, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/109', '127.0.0.1', '内网IP', '109', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:49:33', 19);
INSERT INTO `sys_oper_log` VALUES (108, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/108', '127.0.0.1', '内网IP', '108', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:49:35', 16);
INSERT INTO `sys_oper_log` VALUES (109, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/102', '127.0.0.1', '内网IP', '102', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:49:36', 16);
INSERT INTO `sys_oper_log` VALUES (110, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/107', '127.0.0.1', '内网IP', '107', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:49:38', 17);
INSERT INTO `sys_oper_log` VALUES (111, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/106', '127.0.0.1', '内网IP', '106', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:49:39', 14);
INSERT INTO `sys_oper_log` VALUES (112, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/104', '127.0.0.1', '内网IP', '104', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:49:41', 13);
INSERT INTO `sys_oper_log` VALUES (113, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/103', '127.0.0.1', '内网IP', '103', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":301}', 0, NULL, '2024-09-11 16:49:44', 8);
INSERT INTO `sys_oper_log` VALUES (114, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/105', '127.0.0.1', '内网IP', '105', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":301}', 0, NULL, '2024-09-11 16:49:46', 7);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1061', '127.0.0.1', '内网IP', '1061', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-09-11 16:50:01', 10);
INSERT INTO `sys_oper_log` VALUES (116, '通知公告', 3, 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'POST', 1, 'admin', '研发部门', '/system/notice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2,3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:50:15', 12);
INSERT INTO `sys_oper_log` VALUES (117, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"100\"],\"parentId\":[\"0\"],\"parentName\":[\"无\"],\"deptName\":[\"总馆\"],\"orderNum\":[\"0\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:50:46', 18);
INSERT INTO `sys_oper_log` VALUES (118, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"总馆\"],\"deptName\":[\"福州图书馆\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:50:56', 36);
INSERT INTO `sys_oper_log` VALUES (119, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"parentId\":[\"101\"],\"parentName\":[\"福州图书馆\"],\"deptName\":[\"管理部门\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:51:07', 24);
INSERT INTO `sys_oper_log` VALUES (120, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"105\"],\"parentId\":[\"101\"],\"parentName\":[\"福州图书馆\"],\"deptName\":[\"运营部门\"],\"orderNum\":[\"3\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:51:11', 21);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1057', '127.0.0.1', '内网IP', '1057', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-09-11 16:51:20', 8);
INSERT INTO `sys_oper_log` VALUES (122, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'POST', 1, 'admin', '研发部门', '/system/post/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:55:23', 16);
INSERT INTO `sys_oper_log` VALUES (123, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'POST', 1, 'admin', '研发部门', '/system/post/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"项目经理已分配,不能删除\",\"code\":500}', 0, NULL, '2024-09-11 16:55:26', 8);
INSERT INTO `sys_oper_log` VALUES (124, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"4\"],\"postName\":[\"普通用户\"],\"postCode\":[\"user\"],\"postSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:55:34', 14);
INSERT INTO `sys_oper_log` VALUES (125, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"1\"],\"postName\":[\"系统管理员\"],\"postCode\":[\"sys\"],\"postSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:55:43', 11);
INSERT INTO `sys_oper_log` VALUES (126, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"2\"],\"postName\":[\"图书管理员\"],\"postCode\":[\"book_admin\"],\"postSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:55:54', 13);
INSERT INTO `sys_oper_log` VALUES (127, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"4\"],\"postName\":[\"普通用户\"],\"postCode\":[\"user\"],\"postSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:56:04', 13);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"105\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"字典管理\"],\"url\":[\"/system/dict\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dict:view\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-bookmark-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:57:15', 27);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"106\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"参数设置\"],\"url\":[\"/system/config\"],\"target\":[\"menuItem\"],\"perms\":[\"system:config:view\"],\"orderNum\":[\"7\"],\"icon\":[\"fa fa-sun-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:57:21', 12);
INSERT INTO `sys_oper_log` VALUES (130, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"105\"],\"userName\":[\"图书管理员\"],\"dept.deptName\":[\"运营部门\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"\"],\"loginName\":[\"ry\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:58:15', 26);
INSERT INTO `sys_oper_log` VALUES (131, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:58:47', 15);
INSERT INTO `sys_oper_log` VALUES (132, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'admin', '管理部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"系统管理员\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 16:59:23', 16);
INSERT INTO `sys_oper_log` VALUES (133, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"超级管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038\"]}', NULL, 1, '不允许操作超级管理员角色', '2024-09-11 16:59:54', 1);
INSERT INTO `sys_oper_log` VALUES (134, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"超级管理员\"],\"menuIds\":[\"\"]}', NULL, 1, '不允许操作超级管理员角色', '2024-09-11 17:00:04', 1);
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/105', '127.0.0.1', '内网IP', '105', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', 0, NULL, '2024-09-11 17:00:40', 4);
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"图书管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 17:51:37', 13);
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"图书管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 17:52:38', 11);
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"书籍管理\"],\"url\":[\"/book/list\"],\"target\":[\"menuItem\"],\"perms\":[\"system:book:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 17:53:52', 10);
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"书籍管理\"],\"url\":[\"books/book/bookList\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 20:14:19', 178);
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"书籍管理\"],\"url\":[\"books\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 20:16:26', 17);
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"书籍管理\"],\"url\":[\"books\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 20:16:44', 35);
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"书籍管理\"],\"url\":[\"books\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 20:17:14', 15);
INSERT INTO `sys_oper_log` VALUES (143, '书籍', 1, 'com.ruoyi.web.controller.book.TBooksController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/addBook', '127.0.0.1', '内网IP', '{\"name\":[\"SKY\"],\"author\":[\"asdsad\"],\"libraryId\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 21:34:58', 17636);
INSERT INTO `sys_oper_log` VALUES (144, '书籍', 1, 'com.ruoyi.web.controller.book.TBooksController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/addBook', '127.0.0.1', '内网IP', '{\"name\":[\"SKY\"],\"author\":[\"sdgfdg\"],\"libraryId\":[\"3\"],\"position\":[\"sd\"],\"description\":[\"ghfhh\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 21:38:05', 5341);
INSERT INTO `sys_oper_log` VALUES (145, '书籍', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/editBook', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"夏洛特烦恼\"],\"author\":[\"夏洛\"],\"libraryId\":[\"3\"],\"position\":[\"4asdfa23\"],\"description\":[\"<p>我也特烦恼!!!!<br></p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 22:23:27', 217);
INSERT INTO `sys_oper_log` VALUES (146, '书籍', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/editBook', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"夏洛特烦恼\"],\"author\":[\"夏洛\"],\"libraryId\":[\"1\"],\"position\":[\"4asdfa23\"],\"description\":[\"我也特烦恼!!!\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 22:32:47', 11);
INSERT INTO `sys_oper_log` VALUES (147, '书籍', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/editBook', '127.0.0.1', '内网IP', '{\"id\":[\"7\"],\"name\":[\"学习如何跑路\"],\"author\":[\"明月复苏\"],\"libraryId\":[\"1\"],\"position\":[\"2sdsa\"],\"description\":[\"学习如何跑路\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 22:32:55', 7);
INSERT INTO `sys_oper_log` VALUES (148, '书籍', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/editBook', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"name\":[\"代码的力量\"],\"author\":[\"明月复苏\"],\"libraryId\":[\"1\"],\"position\":[\"234as\"],\"description\":[\"神不知鬼不觉的拔掉你的头发\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 22:33:03', 10);
INSERT INTO `sys_oper_log` VALUES (149, '书籍', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/editBook', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"夏洛特烦恼\"],\"author\":[\"夏洛\"],\"libraryId\":[\"1\"],\"sortId\":[\"2\"],\"position\":[\"4asdfa23\"],\"description\":[\"我也特烦恼!!!\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'sort_id\' in \'class com.ruoyi.web.domain.TBooks\'', '2024-09-11 22:56:00', 151);
INSERT INTO `sys_oper_log` VALUES (150, '书籍', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/editBook', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"夏洛特烦恼\"],\"author\":[\"夏洛\"],\"libraryId\":[\"1\"],\"sortId\":[\"2\"],\"position\":[\"4asdfa23\"],\"description\":[\"我也特烦恼!!!\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 22:57:20', 10);
INSERT INTO `sys_oper_log` VALUES (151, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBooksController.remove()', 'POST', 1, 'admin', '管理部门', '/books/removeBook', '127.0.0.1', '内网IP', '{\"ids\":[\"28\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-11 23:54:20', 114);
INSERT INTO `sys_oper_log` VALUES (152, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBooksController.remove()', 'POST', 1, 'admin', '管理部门', '/books/removeBook', '127.0.0.1', '内网IP', '{\"ids\":[\"24,26\"]}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'ids\' not found. Available parameters are [arg0, collection, list]', '2024-09-12 00:27:42', 168);
INSERT INTO `sys_oper_log` VALUES (153, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBooksController.remove()', 'POST', 1, 'admin', '管理部门', '/books/removeBook', '127.0.0.1', '内网IP', '{\"ids\":[\"24,26\"]}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'ids\' not found. Available parameters are [arg0, collection, list]', '2024-09-12 00:28:28', 74);
INSERT INTO `sys_oper_log` VALUES (154, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBooksController.remove()', 'POST', 1, 'admin', '管理部门', '/books/removeBook', '127.0.0.1', '内网IP', '{\"ids\":[\"24,26\"]}', NULL, 1, 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'item.isDelete\'. Cause: org.apache.ibatis.ognl.NoSuchPropertyException: java.lang.String.isDelete', '2024-09-12 00:29:20', 118);
INSERT INTO `sys_oper_log` VALUES (155, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBooksController.remove()', 'POST', 1, 'admin', '管理部门', '/books/removeBook', '127.0.0.1', '内网IP', '{\"ids\":[\"24,26\"]}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'ids\' not found. Available parameters are [arg0, collection, list]', '2024-09-12 00:34:29', 130);
INSERT INTO `sys_oper_log` VALUES (156, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBooksController.remove()', 'POST', 1, 'admin', '管理部门', '/books/removeBook', '127.0.0.1', '内网IP', '{\"ids\":[\"24,26\"]}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'ids\' not found. Available parameters are [arg0, collection, list]', '2024-09-12 00:34:49', 81);
INSERT INTO `sys_oper_log` VALUES (157, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBooksController.remove()', 'POST', 1, 'admin', '管理部门', '/books/removeBook', '127.0.0.1', '内网IP', '{\"ids\":[\"24,26\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update t_books\n             SET is_delete = 1 \n            where id = \'26\'\' at line 5\r\n### The error may exist in file [D:\\IdeaProjects\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\books\\TBooksMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TBooksMapper.deleteByPrimaryKey-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update t_books              SET is_delete = 1              where id = ?          ;              update t_books              SET is_delete = 1              where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update t_books\n             SET is_delete = 1 \n            where id = \'26\'\' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update t_books\n             SET is_delete = 1 \n            where id = \'26\'\' at line 5', '2024-09-12 00:35:27', 224);
INSERT INTO `sys_oper_log` VALUES (158, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBooksController.remove()', 'POST', 1, 'admin', '管理部门', '/books/removeBook', '127.0.0.1', '内网IP', '{\"ids\":[\"24,26\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update t_books set is_delete = 1 where id = \'26\'\' at line 3\r\n### The error may exist in file [D:\\IdeaProjects\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\books\\TBooksMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TBooksMapper.deleteByPrimaryKey-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update t_books set is_delete = 1 where id = ?          ;              update t_books set is_delete = 1 where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update t_books set is_delete = 1 where id = \'26\'\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update t_books set is_delete = 1 where id = \'26\'\' at line 3', '2024-09-12 00:39:03', 208);
INSERT INTO `sys_oper_log` VALUES (159, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBooksController.remove()', 'POST', 1, 'admin', '管理部门', '/books/removeBook', '127.0.0.1', '内网IP', '{\"ids\":[\"24,26\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update t_books set is_delete = 1 where id = \'26\'\' at line 3\r\n### The error may exist in file [D:\\IdeaProjects\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\books\\TBooksMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TBooksMapper.deleteByPrimaryKey-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update t_books set is_delete = 1 where id = ?          ;              update t_books set is_delete = 1 where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update t_books set is_delete = 1 where id = \'26\'\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update t_books set is_delete = 1 where id = \'26\'\' at line 3', '2024-09-12 00:41:50', 10);
INSERT INTO `sys_oper_log` VALUES (160, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBooksController.remove()', 'POST', 1, 'admin', '管理部门', '/books/removeBook', '127.0.0.1', '内网IP', '{\"ids\":[\"26,28\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-12 00:45:21', 166);
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"书籍分类\"],\"url\":[\"books\"],\"target\":[\"menuItem\"],\"perms\":[\"books:booksort:view\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-13 08:53:20', 172);
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2002', '127.0.0.1', '内网IP', '2002', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-13 08:53:44', 16);
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"书籍分类\"],\"url\":[\"books\"],\"target\":[\"menuItem\"],\"perms\":[\"books:booksort:view\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-13 08:54:04', 14);
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"书籍管理\"],\"url\":[\"books/book\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-13 09:26:27', 132);
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2003\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"书籍分类\"],\"url\":[\"books/booksort\"],\"target\":[\"menuItem\"],\"perms\":[\"books:booksort:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-13 09:26:41', 18);
INSERT INTO `sys_oper_log` VALUES (166, '书籍添加', 1, 'com.ruoyi.web.controller.book.TBookSortController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/booksort/addBookSort', '127.0.0.1', '内网IP', '{\"name\":[\"SKY\"],\"description\":[\"asd\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-13 10:05:03', 161);
INSERT INTO `sys_oper_log` VALUES (167, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBookSortController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/booksort/editBookSort', '127.0.0.1', '内网IP', '{\"id\":[\"17\"],\"name\":[\"SKY\"],\"description\":[\"dffdg\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-13 10:05:13', 11);
INSERT INTO `sys_oper_log` VALUES (168, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBookSortController.remove()', 'POST', 1, 'admin', '管理部门', '/books/booksort/removeBookSort', '127.0.0.1', '内网IP', '{\"ids\":[\"17\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-13 10:05:15', 34);
INSERT INTO `sys_oper_log` VALUES (169, '书籍添加', 1, 'com.ruoyi.web.controller.book.TBooksController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/book/addBook', '127.0.0.1', '内网IP', '{\"name\":[\"SKYYYY\"],\"author\":[\"夏洛\"],\"libraryId\":[\"2\"],\"sortId\":[\"5\"],\"position\":[\"4asdfa23\"],\"description\":[\"我也特烦恼!!!\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-13 10:05:44', 11);
INSERT INTO `sys_oper_log` VALUES (170, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/editBook', '127.0.0.1', '内网IP', '{\"id\":[\"29\"],\"name\":[\"SKYYYY\"],\"author\":[\"夏洛\"],\"libraryId\":[\"2\"],\"sortId\":[\"5\"],\"position\":[\"4asdfa23\"],\"description\":[\"我也特烦恼!!!\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-13 10:05:53', 14);
INSERT INTO `sys_oper_log` VALUES (171, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBooksController.remove()', 'POST', 1, 'admin', '管理部门', '/books/book/removeBook', '127.0.0.1', '内网IP', '{\"ids\":[\"29\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-13 10:05:55', 14);
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅证管理\"],\"url\":[\"books/borrowcard/list\"],\"target\":[\"menuItem\"],\"perms\":[\"books:borrowcard:view\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-14 08:58:00', 214);
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2004\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅证管理\"],\"url\":[\"books/borrowcard\"],\"target\":[\"menuItem\"],\"perms\":[\"books:borrowcard:view\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-14 08:58:14', 22);
INSERT INTO `sys_oper_log` VALUES (174, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBorrowCardController.remove()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1805010203,1805010202\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-09-14 11:37:47', 165);
INSERT INTO `sys_oper_log` VALUES (175, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBorrowCardController.remove()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1805010202\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-09-14 11:37:59', 6);
INSERT INTO `sys_oper_log` VALUES (176, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBorrowCardController.remove()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1805010202\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-14 11:40:05', 33);
INSERT INTO `sys_oper_log` VALUES (177, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBooksController.remove()', 'POST', 1, 'admin', '管理部门', '/books/book/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"24\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-14 11:41:50', 11);
INSERT INTO `sys_oper_log` VALUES (178, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBooksController.remove()', 'POST', 1, 'admin', '管理部门', '/books/book/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"21\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-14 11:42:30', 121);
INSERT INTO `sys_oper_log` VALUES (179, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBooksController.remove()', 'POST', 1, 'admin', '管理部门', '/books/book/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-14 11:42:56', 9);
INSERT INTO `sys_oper_log` VALUES (180, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBorrowCardController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1805010219\"],\"userName\":[\"测试1111\"],\"ruleId\":[\"1\"],\"status\":[\"0\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'user_id\' in \'class com.ruoyi.web.domain.TBorrowCard\'', '2024-09-14 12:59:18', 215);
INSERT INTO `sys_oper_log` VALUES (181, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"夏洛特烦恼\"],\"author\":[\"夏洛123213\"],\"libraryId\":[\"1\"],\"sortId\":[\"2\"],\"position\":[\"4asdfa23\"],\"description\":[\"我也特烦恼!!!\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-14 13:00:56', 21);
INSERT INTO `sys_oper_log` VALUES (182, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBookSortController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/booksort/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"未分类\"],\"description\":[\"不可删除11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-14 13:01:02', 13);
INSERT INTO `sys_oper_log` VALUES (183, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBorrowCardController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1805010219\"],\"userName\":[\"测试111\"],\"ruleId\":[\"1\"],\"status\":[\"0\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'user_id\' in \'class com.ruoyi.web.domain.TBorrowCard\'', '2024-09-14 13:03:46', 111);
INSERT INTO `sys_oper_log` VALUES (184, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBorrowCardController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1805010219\"],\"userName\":[\"测试111\"],\"ruleId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-14 13:07:03', 16);
INSERT INTO `sys_oper_log` VALUES (185, '书籍添加', 1, 'com.ruoyi.web.controller.book.TBorrowCardController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/addBorrowCard', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"ruleId\":[\"6\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_name\' doesn\'t have a default value\r\n### The error may exist in file [D:\\IdeaProjects\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\books\\TBorrowCardMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TBorrowCardMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_borrow_card          ( user_id,                                                        rule_id )           values ( ?,                                                        ? )\r\n### Cause: java.sql.SQLException: Field \'user_name\' doesn\'t have a default value\n; Field \'user_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_name\' doesn\'t have a default value', '2024-09-14 13:21:06', 189);
INSERT INTO `sys_oper_log` VALUES (186, '书籍添加', 1, 'com.ruoyi.web.controller.book.TBorrowCardController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/addBorrowCard', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"ruleId\":[\"6\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_name\' doesn\'t have a default value\r\n### The error may exist in file [D:\\IdeaProjects\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\books\\TBorrowCardMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TBorrowCardMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_borrow_card          ( user_id,                                                        rule_id )           values ( ?,                                                        ? )\r\n### Cause: java.sql.SQLException: Field \'user_name\' doesn\'t have a default value\n; Field \'user_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_name\' doesn\'t have a default value', '2024-09-14 13:23:03', 14128);
INSERT INTO `sys_oper_log` VALUES (187, '书籍添加', 1, 'com.ruoyi.web.controller.book.TBorrowCardController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/addBorrowCard', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"ruleId\":[\"4\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_name\' doesn\'t have a default value\r\n### The error may exist in file [D:\\IdeaProjects\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\books\\TBorrowCardMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TBorrowCardMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_borrow_card          ( user_id,                                                        rule_id )           values ( ?,                                                        ? )\r\n### Cause: java.sql.SQLException: Field \'user_name\' doesn\'t have a default value\n; Field \'user_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_name\' doesn\'t have a default value', '2024-09-14 13:26:11', 12);
INSERT INTO `sys_oper_log` VALUES (188, '书籍添加', 1, 'com.ruoyi.web.controller.book.TBorrowCardController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/addBorrowCard', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"ruleId\":[\"4\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'userName\' in \'class com.ruoyi.web.domain.TBorrowCard\'', '2024-09-14 13:44:53', 105);
INSERT INTO `sys_oper_log` VALUES (189, '书籍添加', 1, 'com.ruoyi.web.controller.book.TBorrowCardController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/addBorrowCard', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"ruleId\":[\"4\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'userName\' in \'class com.ruoyi.web.domain.TBorrowCard\'', '2024-09-14 13:46:45', 7393);
INSERT INTO `sys_oper_log` VALUES (190, '书籍添加', 1, 'com.ruoyi.web.controller.book.TBorrowCardController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/addBorrowCard', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"ruleId\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-14 13:47:13', 1659);
INSERT INTO `sys_oper_log` VALUES (191, '重置密码', 2, 'com.ruoyi.web.controller.system.SysProfileController.resetPwd()', 'POST', 1, 'admin', '管理部门', '/system/user/profile/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-18 09:50:17', 128);
INSERT INTO `sys_oper_log` VALUES (192, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"100\"],\"userName\":[\"张三\"],\"deptName\":[\"总馆\"],\"phonenumber\":[\"18020090223\"],\"email\":[\"42313@163.com\"],\"loginName\":[\"zhangsan\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"测试一\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-18 14:40:29', 139);
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-gear\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-19 14:43:54', 126);
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"公告管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-calendar\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-19 14:44:56', 15);
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"公告管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-calendar\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-19 14:45:25', 23);
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1035\"],\"parentId\":[\"107\"],\"menuType\":[\"F\"],\"menuName\":[\"公告查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:notice:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-19 14:46:33', 25);
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"公告查询\"],\"url\":[\"tnotice/selectTnotice\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-24 08:50:18', 137);
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"公告查询\"],\"url\":[\"books/selectTnotice\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-24 08:50:57', 27);
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"公告查询\"],\"url\":[\"books/tnotice\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-24 08:52:33', 33);
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"公告查询\"],\"url\":[\"books/tnotice\"],\"target\":[\"menuItem\"],\"perms\":[\"books:tnotice:view\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-24 10:01:27', 145);
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"公告查询\"],\"url\":[\"books/tnotice\"],\"target\":[\"menuItem\"],\"perms\":[\"books:tnotice:view\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-24 10:01:51', 17);
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"公告添加\"],\"url\":[\"books/tinotice\"],\"target\":[\"menuItem\"],\"perms\":[\"books:tnotice:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-24 10:02:49', 41);
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"公告查询\"],\"url\":[\"books/tnotice\"],\"target\":[\"menuItem\"],\"perms\":[\"books:tnotice:list\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-24 10:03:54', 20);
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"公告添加\"],\"url\":[\"books/tnotice\"],\"target\":[\"menuItem\"],\"perms\":[\"books:tnotice:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-24 10:11:11', 143);
INSERT INTO `sys_oper_log` VALUES (205, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"公告添加\"],\"url\":[\"books/tnotice\"],\"target\":[\"menuItem\"],\"perms\":[\"books:tnotice:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-24 10:22:07', 125);
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2006', '127.0.0.1', '内网IP', '2006', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-24 10:22:15', 33);
INSERT INTO `sys_oper_log` VALUES (207, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"公告管理\"],\"url\":[\"books/tnotice\"],\"target\":[\"menuItem\"],\"perms\":[\"books:tnotice:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-24 10:22:33', 25);
INSERT INTO `sys_oper_log` VALUES (208, '书籍添加', 1, 'com.ruoyi.web.controller.book.TNoticeController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/add', '127.0.0.1', '内网IP', '{\"title\":[\"测试\"],\"detail\":[\"测试\"],\"publishDate\":[\"10:42\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-24 10:42:24', 118);
INSERT INTO `sys_oper_log` VALUES (209, '公告删除', 3, 'com.ruoyi.web.controller.book.TNoticeController.remove()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-09-24 10:42:34', 8);
INSERT INTO `sys_oper_log` VALUES (210, '公告删除', 3, 'com.ruoyi.web.controller.book.TNoticeController.remove()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-09-24 10:42:42', 10);
INSERT INTO `sys_oper_log` VALUES (211, '公告导出', 5, 'com.ruoyi.web.controller.book.TNoticeController.export()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/export', '127.0.0.1', '内网IP', '{\"tnoticeId\":[\"\"],\"title\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', NULL, 1, '导出Excel失败，请联系网站管理员！', '2024-09-24 11:02:20', 1070);
INSERT INTO `sys_oper_log` VALUES (212, '公告删除', 3, 'com.ruoyi.web.controller.book.TNoticeController.remove()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-09-24 11:02:24', 9);
INSERT INTO `sys_oper_log` VALUES (213, '书籍添加', 1, 'com.ruoyi.web.controller.book.TNoticeController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/add', '127.0.0.1', '内网IP', '{\"title\":[\"测试1\"],\"detail\":[\"测试1\"],\"publishDate\":[\"2024-09-24\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'publish_date\' in \'class com.ruoyi.web.domain.TNotice\'', '2024-09-24 11:02:34', 22);
INSERT INTO `sys_oper_log` VALUES (214, '书籍添加', 1, 'com.ruoyi.web.controller.book.TNoticeController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/add', '127.0.0.1', '内网IP', '{\"title\":[\"测试1\"],\"detail\":[\"测试1\"],\"publishDate\":[\"2024-09-24\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'publish_date\' in \'class com.ruoyi.web.domain.TNotice\'', '2024-09-24 11:03:33', 7);
INSERT INTO `sys_oper_log` VALUES (215, '公告删除', 3, 'com.ruoyi.web.controller.book.TNoticeController.remove()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-09-24 11:03:41', 7);
INSERT INTO `sys_oper_log` VALUES (216, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅规则管理\"],\"url\":[\"books/rules\"],\"target\":[\"menuItem\"],\"perms\":[\"books:rules:view\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-24 11:16:26', 171);
INSERT INTO `sys_oper_log` VALUES (217, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,107,1035\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 11:12:58', 109);
INSERT INTO `sys_oper_log` VALUES (218, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"公告信息查询\"],\"url\":[\"userMessages/noticeSelective\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:noticeSelective:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-search\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 11:19:19', 20);
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"用户功能管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-female\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 11:20:46', 38);
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2009\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"公告信息查询\"],\"url\":[\"userMessages/noticeSelective\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:noticeSelective:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-search\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 11:21:01', 48);
INSERT INTO `sys_oper_log` VALUES (221, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2009', '127.0.0.1', '内网IP', '2009', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 11:21:03', 17);
INSERT INTO `sys_oper_log` VALUES (222, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"公告信息查询\"],\"url\":[\"userMessages/noticeSelective\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:noticeSelective:view\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 11:21:14', 21);
INSERT INTO `sys_oper_log` VALUES (223, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"公告信息查询\"],\"url\":[\"userMessages/noticeSelective\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:noticeSelective:list\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 11:32:09', 113);
INSERT INTO `sys_oper_log` VALUES (224, '重置密码', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', 1, 'admin', '管理部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"loginName\":[\"ry\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 14:40:27', 111);
INSERT INTO `sys_oper_log` VALUES (225, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"105\"],\"userName\":[\"图书管理员\"],\"dept.deptName\":[\"运营部门\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"ry@qq.com\"],\"loginName\":[\"ry\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 14:40:36', 89);
INSERT INTO `sys_oper_log` VALUES (226, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'POST', 1, 'admin', '管理部门', '/system/user/authRole/insertAuthRole', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"roleIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 14:54:50', 22);
INSERT INTO `sys_oper_log` VALUES (227, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2010,2011\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 14:55:34', 24);
INSERT INTO `sys_oper_log` VALUES (228, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2010\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息管理\"],\"url\":[\"userMessages/personalMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:personalMessage:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-female\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 15:00:03', 23);
INSERT INTO `sys_oper_log` VALUES (229, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2010\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"用户功能管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-male\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 15:00:49', 26);
INSERT INTO `sys_oper_log` VALUES (230, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息管理\"],\"url\":[\"userMessages/personalMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:personalMessage:view\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 15:01:54', 19);
INSERT INTO `sys_oper_log` VALUES (231, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"图书查看\"],\"url\":[\"userMessages/bookView\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 15:03:32', 28);
INSERT INTO `sys_oper_log` VALUES (232, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"查看违章信息\"],\"url\":[\"userMessages/violationMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:violationMessage:view\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 15:08:55', 29);
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"留言板\"],\"url\":[\"userMessages/messageBoard\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:messageBoard:view\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 15:11:41', 17);
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2010\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"用户功能管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-male\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 15:12:10', 17);
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"图书管理员管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-graduation-cap\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 15:12:58', 13);
INSERT INTO `sys_oper_log` VALUES (236, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2010\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"用户功能管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-male\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 15:13:07', 16);
INSERT INTO `sys_oper_log` VALUES (237, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2016\"],\"menuType\":[\"C\"],\"menuName\":[\"管理员信息管理\"],\"url\":[\"sysBookmenage/manegerInfo\"],\"target\":[\"menuItem\"],\"perms\":[\"sysBookmenage:menagerInfo:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 15:15:14', 18);
INSERT INTO `sys_oper_log` VALUES (238, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"图书管理员\"],\"roleKey\":[\"bookManager\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 15:34:43', 83);
INSERT INTO `sys_oper_log` VALUES (239, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', '管理部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"图书管理员\"],\"roleKey\":[\"bookManager\"],\"dataScope\":[\"2\"],\"deptIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 15:34:55', 81);
INSERT INTO `sys_oper_log` VALUES (240, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"图书管理员\"],\"roleKey\":[\"bookManager\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 15:35:03', 22);
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2017\"],\"parentId\":[\"2016\"],\"menuType\":[\"C\"],\"menuName\":[\"管理员信息管理\"],\"url\":[\"sysBookmenager/manegerInfo\"],\"target\":[\"menuItem\"],\"perms\":[\"sysBookmenager:menagerInfo:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 15:50:02', 135);
INSERT INTO `sys_oper_log` VALUES (242, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"馆长1\"],\"deptName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"馆长1\"],\"sex\":[\"0\"],\"role\":[\"3\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"3\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 15:52:01', 94);
INSERT INTO `sys_oper_log` VALUES (243, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"105\"],\"userName\":[\"图书管理员\"],\"dept.deptName\":[\"运营部门\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"ry@qq.com\"],\"loginName\":[\"ry\"],\"sex\":[\"0\"],\"role\":[\"3\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"3\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 15:52:18', 45);
INSERT INTO `sys_oper_log` VALUES (244, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"公告查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"books:tnotice:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-25 15:53:13', 26);
INSERT INTO `sys_oper_log` VALUES (245, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"查看借阅规则信息\"],\"url\":[\"userMassages/borrowRulesMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:view\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-26 14:40:08', 94);
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"查看借阅规则信息\"],\"url\":[\"usermassages/borrowRulesMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-26 15:54:57', 192);
INSERT INTO `sys_oper_log` VALUES (247, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"查看借阅规则信息\"],\"url\":[\"userMessages/borrowRulesMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-26 15:55:37', 13);
INSERT INTO `sys_oper_log` VALUES (248, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"查看借阅规则信息\"],\"url\":[\"userMessages/borrowRulesMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-26 15:55:51', 12);
INSERT INTO `sys_oper_log` VALUES (249, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"图书查看\"],\"url\":[\"userMessages/bookView\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 10:05:22', 234);
INSERT INTO `sys_oper_log` VALUES (250, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2010,2013,2012,2011,2015,2014,2019\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 14:39:20', 53);
INSERT INTO `sys_oper_log` VALUES (251, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,2010,2013,2012,2011,2015,2014,2019\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 14:41:57', 19);
INSERT INTO `sys_oper_log` VALUES (252, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'zhangsan', '总馆', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"图书查看\"],\"url\":[\"uerMessages/bookView\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-map-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 14:44:32', 17);
INSERT INTO `sys_oper_log` VALUES (253, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'zhangsan', '总馆', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"公告信息查询\"],\"url\":[\"userMessages/noticeSelective\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:noticeSelective:view\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 14:46:15', 14);
INSERT INTO `sys_oper_log` VALUES (254, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'zhangsan', '总馆', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"图书查看\"],\"url\":[\"userMessages/bookView\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 14:47:34', 10);
INSERT INTO `sys_oper_log` VALUES (255, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'zhangsan', '总馆', '/system/menu/remove/2010', '127.0.0.1', '内网IP', '2010', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', 0, NULL, '2024-09-27 14:47:45', 4);
INSERT INTO `sys_oper_log` VALUES (256, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'zhangsan', '总馆', '/system/menu/remove/2013', '127.0.0.1', '内网IP', '2013', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-09-27 14:47:55', 14);
INSERT INTO `sys_oper_log` VALUES (257, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'zhangsan', '总馆', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"2010\"],\"menuType\":[\"M\"],\"menuName\":[\"图书查看\"],\"url\":[\"userMessages/bookView\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 14:48:07', 9);
INSERT INTO `sys_oper_log` VALUES (258, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'zhangsan', '总馆', '/system/menu/remove/2013', '127.0.0.1', '内网IP', '2013', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-09-27 14:48:25', 5);
INSERT INTO `sys_oper_log` VALUES (259, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2021', '127.0.0.1', '内网IP', '2021', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 14:49:06', 12);
INSERT INTO `sys_oper_log` VALUES (260, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2020', '127.0.0.1', '内网IP', '2020', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 14:49:10', 21);
INSERT INTO `sys_oper_log` VALUES (261, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 14:51:15', 19);
INSERT INTO `sys_oper_log` VALUES (262, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"图书管理员\"],\"roleKey\":[\"bookManager\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,2013,2012,2011,2015,2014,2019\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 14:52:10', 42);
INSERT INTO `sys_oper_log` VALUES (263, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2013,2012,2011,2015,2014,2019\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 14:52:50', 15);
INSERT INTO `sys_oper_log` VALUES (264, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"图书查看\"],\"url\":[\"userMessages/bookView\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 14:53:33', 10);
INSERT INTO `sys_oper_log` VALUES (265, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"4\"],\"postName\":[\"普通用户\"],\"postCode\":[\"user\"],\"postSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 14:53:56', 15);
INSERT INTO `sys_oper_log` VALUES (266, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2013,2012,2011,2015,2014,2019\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 14:54:07', 26);
INSERT INTO `sys_oper_log` VALUES (267, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', '管理部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,101,105\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 14:54:20', 19);
INSERT INTO `sys_oper_log` VALUES (268, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2013,2012,2011,2015,2014,2019\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 14:54:41', 23);
INSERT INTO `sys_oper_log` VALUES (269, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"图书管理员\"],\"roleKey\":[\"bookManager\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,2010,2013,2012,2011,2015,2014,2019\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 14:58:47', 146);
INSERT INTO `sys_oper_log` VALUES (270, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"105\"],\"parentId\":[\"101\"],\"parentName\":[\"福州图书馆\"],\"deptName\":[\"运营部门\"],\"orderNum\":[\"3\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 15:00:34', 28);
INSERT INTO `sys_oper_log` VALUES (271, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2018', '127.0.0.1', '内网IP', '2018', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 15:01:11', 14);
INSERT INTO `sys_oper_log` VALUES (272, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2010\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"用户功能管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-male\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 15:01:31', 15);
INSERT INTO `sys_oper_log` VALUES (273, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2010\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"用户功能管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-male\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 15:02:25', 17);
INSERT INTO `sys_oper_log` VALUES (274, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.changeStatus()', 'POST', 1, 'admin', '管理部门', '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 15:02:38', 19);
INSERT INTO `sys_oper_log` VALUES (275, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.changeStatus()', 'POST', 1, 'admin', '管理部门', '/system/role/changeStatus', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 15:02:40', 20);
INSERT INTO `sys_oper_log` VALUES (276, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2013,2012,2011,2015,2014,2019\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 15:03:03', 20);
INSERT INTO `sys_oper_log` VALUES (277, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2013,2012,2011,2015,2014,2019\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 15:03:12', 19);
INSERT INTO `sys_oper_log` VALUES (278, '角色管理', 4, 'com.ruoyi.web.controller.system.SysRoleController.selectAuthUserAll()', 'POST', 1, 'admin', '管理部门', '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"userIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 15:03:34', 10);
INSERT INTO `sys_oper_log` VALUES (279, '角色管理', 4, 'com.ruoyi.web.controller.system.SysRoleController.cancelAuthUser()', 'POST', 1, 'admin', '管理部门', '/system/role/authUser/cancel', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"userId\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 15:03:39', 8);
INSERT INTO `sys_oper_log` VALUES (280, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', 1, 'admin', '管理部门', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 15:05:22', 25);
INSERT INTO `sys_oper_log` VALUES (281, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息管理\"],\"url\":[\"userMessages/userPersonalMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:userPersonalMessage:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 15:54:28', 122);
INSERT INTO `sys_oper_log` VALUES (282, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息管理\"],\"url\":[\"userMessage/userPasonalMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessage/userPasonalMessage:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-27 15:55:35', 17);
INSERT INTO `sys_oper_log` VALUES (283, '借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.borrow()', 'GET', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"books\":[{\"author\":\"夏洛123213\",\"description\":\"我也特烦恼!!!\",\"id\":1,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"夏洛特烦恼\",\"position\":\"4asdfa23\",\"sortId\":2,\"sortName\":\"护理\",\"status\":1},{\"author\":\"江湖老中医\",\"description\":\"详细介绍每植一根发多少钱？\",\"id\":2,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"植发的价格\",\"position\":\"5sdfs1\",\"sortId\":2,\"sortName\":\"护理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"神不知鬼不觉的拔掉你的头发\",\"id\":3,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"代码的力量\",\"position\":\"234as\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"无简介\",\"id\":4,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"java从入门到入土\",\"position\":\"sdfs33\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"图书馆章程\",\"id\":5,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆章程\",\"position\":\"234sdfs\",\"sortId\":5,\"sortName\":\"管理\",\"status\":1},{\"author\":\"吸尘羊\",\"description\":\"图书馆建设！\",\"id\":6,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆建设\",\"position\":\"23dgdff\",\"sortId\":5,\"sortName\":\"管理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"学习如何跑路\",\"id\":7,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"学习如何跑路\",\"position\":\"2sdsa\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"匿名\",\"description\":\"做梦\",\"id\":8,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"美好课设\",\"position\":\"23432s\",\"sortId\":8,\"sortName\":\"励志\",\"status\":1},{\"author\":\"刘丽朵\",\"description\":\"这是一本给孩子的中国童话故事集。以“非教训的无意思、空灵的幻想、快活的嬉笑、纯净的诗意、悠远的生命体味”为选篇标准，从《搜神记》《太平广记》《聊斋志异》《酉阳杂俎》等近30本经典作品中，精心挑选45篇符合现代审美、适合孩子阅读的故事；故事蕴涵着丰富的想象力与趣味性；用简美的现代语言，全新讲述中国童话故事；搭配符合故事主题的原创古风插画，带孩子进入奇幻浪漫的童话世界。\",\"id\":9,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"中国童话\",\"position\":\"6sdf11\",\"sortId\":9,\"sortName\":\"故事\",\"status\":1},{\"author\":\"本多孝好\",\"description\":\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\",\"id\":10,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"人生删除事务所\",\"position\":\"22sdf1\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"拉宾德拉纳特·泰戈尔\",\"description\":\"《飞鸟集》是泰戈尔的代表作之一，也是世界上最杰出的诗集之一。白昼和黑夜、溪流和海洋、自由和背叛，都在泰戈尔的笔下合而为一，短小的语句道出了深刻的人生哲理，引领世人探寻真理和智慧的源泉。初读这些诗篇，如同在暴风雨过后的初夏清晨，推开卧室的窗户，看到一个淡泊清透的世界，一切都是那样清新、亮丽，可是其中的韵味却很厚实，耐人寻味。\",\"id\"', '\"books/book/borrow\"', 0, NULL, '2024-09-29 09:21:01', 13084);
INSERT INTO `sys_oper_log` VALUES (284, '借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.borrow()', 'GET', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"books\":[{\"author\":\"夏洛123213\",\"description\":\"我也特烦恼!!!\",\"id\":1,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"夏洛特烦恼\",\"position\":\"4asdfa23\",\"sortId\":2,\"sortName\":\"护理\",\"status\":1},{\"author\":\"江湖老中医\",\"description\":\"详细介绍每植一根发多少钱？\",\"id\":2,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"植发的价格\",\"position\":\"5sdfs1\",\"sortId\":2,\"sortName\":\"护理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"神不知鬼不觉的拔掉你的头发\",\"id\":3,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"代码的力量\",\"position\":\"234as\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"无简介\",\"id\":4,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"java从入门到入土\",\"position\":\"sdfs33\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"图书馆章程\",\"id\":5,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆章程\",\"position\":\"234sdfs\",\"sortId\":5,\"sortName\":\"管理\",\"status\":1},{\"author\":\"吸尘羊\",\"description\":\"图书馆建设！\",\"id\":6,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆建设\",\"position\":\"23dgdff\",\"sortId\":5,\"sortName\":\"管理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"学习如何跑路\",\"id\":7,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"学习如何跑路\",\"position\":\"2sdsa\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"匿名\",\"description\":\"做梦\",\"id\":8,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"美好课设\",\"position\":\"23432s\",\"sortId\":8,\"sortName\":\"励志\",\"status\":1},{\"author\":\"刘丽朵\",\"description\":\"这是一本给孩子的中国童话故事集。以“非教训的无意思、空灵的幻想、快活的嬉笑、纯净的诗意、悠远的生命体味”为选篇标准，从《搜神记》《太平广记》《聊斋志异》《酉阳杂俎》等近30本经典作品中，精心挑选45篇符合现代审美、适合孩子阅读的故事；故事蕴涵着丰富的想象力与趣味性；用简美的现代语言，全新讲述中国童话故事；搭配符合故事主题的原创古风插画，带孩子进入奇幻浪漫的童话世界。\",\"id\":9,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"中国童话\",\"position\":\"6sdf11\",\"sortId\":9,\"sortName\":\"故事\",\"status\":1},{\"author\":\"本多孝好\",\"description\":\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\",\"id\":10,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"人生删除事务所\",\"position\":\"22sdf1\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"拉宾德拉纳特·泰戈尔\",\"description\":\"《飞鸟集》是泰戈尔的代表作之一，也是世界上最杰出的诗集之一。白昼和黑夜、溪流和海洋、自由和背叛，都在泰戈尔的笔下合而为一，短小的语句道出了深刻的人生哲理，引领世人探寻真理和智慧的源泉。初读这些诗篇，如同在暴风雨过后的初夏清晨，推开卧室的窗户，看到一个淡泊清透的世界，一切都是那样清新、亮丽，可是其中的韵味却很厚实，耐人寻味。\",\"id\"', '\"books/book/borrow\"', 0, NULL, '2024-09-29 09:21:05', 42);
INSERT INTO `sys_oper_log` VALUES (285, '借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.borrow()', 'GET', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"books\":[{\"author\":\"夏洛123213\",\"description\":\"我也特烦恼!!!\",\"id\":1,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"夏洛特烦恼\",\"position\":\"4asdfa23\",\"sortId\":2,\"sortName\":\"护理\",\"status\":1},{\"author\":\"江湖老中医\",\"description\":\"详细介绍每植一根发多少钱？\",\"id\":2,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"植发的价格\",\"position\":\"5sdfs1\",\"sortId\":2,\"sortName\":\"护理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"神不知鬼不觉的拔掉你的头发\",\"id\":3,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"代码的力量\",\"position\":\"234as\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"无简介\",\"id\":4,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"java从入门到入土\",\"position\":\"sdfs33\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"图书馆章程\",\"id\":5,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆章程\",\"position\":\"234sdfs\",\"sortId\":5,\"sortName\":\"管理\",\"status\":1},{\"author\":\"吸尘羊\",\"description\":\"图书馆建设！\",\"id\":6,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆建设\",\"position\":\"23dgdff\",\"sortId\":5,\"sortName\":\"管理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"学习如何跑路\",\"id\":7,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"学习如何跑路\",\"position\":\"2sdsa\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"匿名\",\"description\":\"做梦\",\"id\":8,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"美好课设\",\"position\":\"23432s\",\"sortId\":8,\"sortName\":\"励志\",\"status\":1},{\"author\":\"刘丽朵\",\"description\":\"这是一本给孩子的中国童话故事集。以“非教训的无意思、空灵的幻想、快活的嬉笑、纯净的诗意、悠远的生命体味”为选篇标准，从《搜神记》《太平广记》《聊斋志异》《酉阳杂俎》等近30本经典作品中，精心挑选45篇符合现代审美、适合孩子阅读的故事；故事蕴涵着丰富的想象力与趣味性；用简美的现代语言，全新讲述中国童话故事；搭配符合故事主题的原创古风插画，带孩子进入奇幻浪漫的童话世界。\",\"id\":9,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"中国童话\",\"position\":\"6sdf11\",\"sortId\":9,\"sortName\":\"故事\",\"status\":1},{\"author\":\"本多孝好\",\"description\":\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\",\"id\":10,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"人生删除事务所\",\"position\":\"22sdf1\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"拉宾德拉纳特·泰戈尔\",\"description\":\"《飞鸟集》是泰戈尔的代表作之一，也是世界上最杰出的诗集之一。白昼和黑夜、溪流和海洋、自由和背叛，都在泰戈尔的笔下合而为一，短小的语句道出了深刻的人生哲理，引领世人探寻真理和智慧的源泉。初读这些诗篇，如同在暴风雨过后的初夏清晨，推开卧室的窗户，看到一个淡泊清透的世界，一切都是那样清新、亮丽，可是其中的韵味却很厚实，耐人寻味。\",\"id\"', '\"books/book/borrow\"', 0, NULL, '2024-09-29 09:21:49', 28);
INSERT INTO `sys_oper_log` VALUES (286, '借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.borrow()', 'GET', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"books\":[{\"author\":\"夏洛123213\",\"description\":\"我也特烦恼!!!\",\"id\":1,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"夏洛特烦恼\",\"position\":\"4asdfa23\",\"sortId\":2,\"sortName\":\"护理\",\"status\":1},{\"author\":\"江湖老中医\",\"description\":\"详细介绍每植一根发多少钱？\",\"id\":2,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"植发的价格\",\"position\":\"5sdfs1\",\"sortId\":2,\"sortName\":\"护理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"神不知鬼不觉的拔掉你的头发\",\"id\":3,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"代码的力量\",\"position\":\"234as\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"无简介\",\"id\":4,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"java从入门到入土\",\"position\":\"sdfs33\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"图书馆章程\",\"id\":5,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆章程\",\"position\":\"234sdfs\",\"sortId\":5,\"sortName\":\"管理\",\"status\":1},{\"author\":\"吸尘羊\",\"description\":\"图书馆建设！\",\"id\":6,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆建设\",\"position\":\"23dgdff\",\"sortId\":5,\"sortName\":\"管理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"学习如何跑路\",\"id\":7,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"学习如何跑路\",\"position\":\"2sdsa\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"匿名\",\"description\":\"做梦\",\"id\":8,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"美好课设\",\"position\":\"23432s\",\"sortId\":8,\"sortName\":\"励志\",\"status\":1},{\"author\":\"刘丽朵\",\"description\":\"这是一本给孩子的中国童话故事集。以“非教训的无意思、空灵的幻想、快活的嬉笑、纯净的诗意、悠远的生命体味”为选篇标准，从《搜神记》《太平广记》《聊斋志异》《酉阳杂俎》等近30本经典作品中，精心挑选45篇符合现代审美、适合孩子阅读的故事；故事蕴涵着丰富的想象力与趣味性；用简美的现代语言，全新讲述中国童话故事；搭配符合故事主题的原创古风插画，带孩子进入奇幻浪漫的童话世界。\",\"id\":9,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"中国童话\",\"position\":\"6sdf11\",\"sortId\":9,\"sortName\":\"故事\",\"status\":1},{\"author\":\"本多孝好\",\"description\":\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\",\"id\":10,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"人生删除事务所\",\"position\":\"22sdf1\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"拉宾德拉纳特·泰戈尔\",\"description\":\"《飞鸟集》是泰戈尔的代表作之一，也是世界上最杰出的诗集之一。白昼和黑夜、溪流和海洋、自由和背叛，都在泰戈尔的笔下合而为一，短小的语句道出了深刻的人生哲理，引领世人探寻真理和智慧的源泉。初读这些诗篇，如同在暴风雨过后的初夏清晨，推开卧室的窗户，看到一个淡泊清透的世界，一切都是那样清新、亮丽，可是其中的韵味却很厚实，耐人寻味。\",\"id\"', '\"books/book/borrow\"', 0, NULL, '2024-09-29 09:30:24', 25);
INSERT INTO `sys_oper_log` VALUES (287, '借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.borrow()', 'GET', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"books\":[{\"author\":\"夏洛123213\",\"description\":\"我也特烦恼!!!\",\"id\":1,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"夏洛特烦恼\",\"position\":\"4asdfa23\",\"sortId\":2,\"sortName\":\"护理\",\"status\":1},{\"author\":\"江湖老中医\",\"description\":\"详细介绍每植一根发多少钱？\",\"id\":2,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"植发的价格\",\"position\":\"5sdfs1\",\"sortId\":2,\"sortName\":\"护理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"神不知鬼不觉的拔掉你的头发\",\"id\":3,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"代码的力量\",\"position\":\"234as\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"无简介\",\"id\":4,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"java从入门到入土\",\"position\":\"sdfs33\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"图书馆章程\",\"id\":5,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆章程\",\"position\":\"234sdfs\",\"sortId\":5,\"sortName\":\"管理\",\"status\":1},{\"author\":\"吸尘羊\",\"description\":\"图书馆建设！\",\"id\":6,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆建设\",\"position\":\"23dgdff\",\"sortId\":5,\"sortName\":\"管理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"学习如何跑路\",\"id\":7,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"学习如何跑路\",\"position\":\"2sdsa\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"匿名\",\"description\":\"做梦\",\"id\":8,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"美好课设\",\"position\":\"23432s\",\"sortId\":8,\"sortName\":\"励志\",\"status\":1},{\"author\":\"刘丽朵\",\"description\":\"这是一本给孩子的中国童话故事集。以“非教训的无意思、空灵的幻想、快活的嬉笑、纯净的诗意、悠远的生命体味”为选篇标准，从《搜神记》《太平广记》《聊斋志异》《酉阳杂俎》等近30本经典作品中，精心挑选45篇符合现代审美、适合孩子阅读的故事；故事蕴涵着丰富的想象力与趣味性；用简美的现代语言，全新讲述中国童话故事；搭配符合故事主题的原创古风插画，带孩子进入奇幻浪漫的童话世界。\",\"id\":9,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"中国童话\",\"position\":\"6sdf11\",\"sortId\":9,\"sortName\":\"故事\",\"status\":1},{\"author\":\"本多孝好\",\"description\":\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\",\"id\":10,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"人生删除事务所\",\"position\":\"22sdf1\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"拉宾德拉纳特·泰戈尔\",\"description\":\"《飞鸟集》是泰戈尔的代表作之一，也是世界上最杰出的诗集之一。白昼和黑夜、溪流和海洋、自由和背叛，都在泰戈尔的笔下合而为一，短小的语句道出了深刻的人生哲理，引领世人探寻真理和智慧的源泉。初读这些诗篇，如同在暴风雨过后的初夏清晨，推开卧室的窗户，看到一个淡泊清透的世界，一切都是那样清新、亮丽，可是其中的韵味却很厚实，耐人寻味。\",\"id\"', '\"books/book/borrow\"', 0, NULL, '2024-09-29 09:31:32', 13807);
INSERT INTO `sys_oper_log` VALUES (288, '借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.borrow()', 'GET', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"books\":[{\"author\":\"夏洛123213\",\"description\":\"我也特烦恼!!!\",\"id\":1,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"夏洛特烦恼\",\"position\":\"4asdfa23\",\"sortId\":2,\"sortName\":\"护理\",\"status\":1},{\"author\":\"江湖老中医\",\"description\":\"详细介绍每植一根发多少钱？\",\"id\":2,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"植发的价格\",\"position\":\"5sdfs1\",\"sortId\":2,\"sortName\":\"护理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"神不知鬼不觉的拔掉你的头发\",\"id\":3,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"代码的力量\",\"position\":\"234as\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"无简介\",\"id\":4,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"java从入门到入土\",\"position\":\"sdfs33\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"图书馆章程\",\"id\":5,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆章程\",\"position\":\"234sdfs\",\"sortId\":5,\"sortName\":\"管理\",\"status\":1},{\"author\":\"吸尘羊\",\"description\":\"图书馆建设！\",\"id\":6,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆建设\",\"position\":\"23dgdff\",\"sortId\":5,\"sortName\":\"管理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"学习如何跑路\",\"id\":7,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"学习如何跑路\",\"position\":\"2sdsa\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"匿名\",\"description\":\"做梦\",\"id\":8,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"美好课设\",\"position\":\"23432s\",\"sortId\":8,\"sortName\":\"励志\",\"status\":1},{\"author\":\"刘丽朵\",\"description\":\"这是一本给孩子的中国童话故事集。以“非教训的无意思、空灵的幻想、快活的嬉笑、纯净的诗意、悠远的生命体味”为选篇标准，从《搜神记》《太平广记》《聊斋志异》《酉阳杂俎》等近30本经典作品中，精心挑选45篇符合现代审美、适合孩子阅读的故事；故事蕴涵着丰富的想象力与趣味性；用简美的现代语言，全新讲述中国童话故事；搭配符合故事主题的原创古风插画，带孩子进入奇幻浪漫的童话世界。\",\"id\":9,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"中国童话\",\"position\":\"6sdf11\",\"sortId\":9,\"sortName\":\"故事\",\"status\":1},{\"author\":\"本多孝好\",\"description\":\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\",\"id\":10,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"人生删除事务所\",\"position\":\"22sdf1\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"拉宾德拉纳特·泰戈尔\",\"description\":\"《飞鸟集》是泰戈尔的代表作之一，也是世界上最杰出的诗集之一。白昼和黑夜、溪流和海洋、自由和背叛，都在泰戈尔的笔下合而为一，短小的语句道出了深刻的人生哲理，引领世人探寻真理和智慧的源泉。初读这些诗篇，如同在暴风雨过后的初夏清晨，推开卧室的窗户，看到一个淡泊清透的世界，一切都是那样清新、亮丽，可是其中的韵味却很厚实，耐人寻味。\",\"id\"', '\"books/book/borrow\"', 0, NULL, '2024-09-29 09:32:10', 21);
INSERT INTO `sys_oper_log` VALUES (289, '借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.borrow()', 'GET', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"books\":[{\"author\":\"夏洛123213\",\"description\":\"我也特烦恼!!!\",\"id\":1,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"夏洛特烦恼\",\"position\":\"4asdfa23\",\"sortId\":2,\"sortName\":\"护理\",\"status\":1},{\"author\":\"江湖老中医\",\"description\":\"详细介绍每植一根发多少钱？\",\"id\":2,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"植发的价格\",\"position\":\"5sdfs1\",\"sortId\":2,\"sortName\":\"护理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"神不知鬼不觉的拔掉你的头发\",\"id\":3,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"代码的力量\",\"position\":\"234as\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"无简介\",\"id\":4,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"java从入门到入土\",\"position\":\"sdfs33\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"图书馆章程\",\"id\":5,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆章程\",\"position\":\"234sdfs\",\"sortId\":5,\"sortName\":\"管理\",\"status\":1},{\"author\":\"吸尘羊\",\"description\":\"图书馆建设！\",\"id\":6,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆建设\",\"position\":\"23dgdff\",\"sortId\":5,\"sortName\":\"管理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"学习如何跑路\",\"id\":7,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"学习如何跑路\",\"position\":\"2sdsa\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"匿名\",\"description\":\"做梦\",\"id\":8,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"美好课设\",\"position\":\"23432s\",\"sortId\":8,\"sortName\":\"励志\",\"status\":1},{\"author\":\"刘丽朵\",\"description\":\"这是一本给孩子的中国童话故事集。以“非教训的无意思、空灵的幻想、快活的嬉笑、纯净的诗意、悠远的生命体味”为选篇标准，从《搜神记》《太平广记》《聊斋志异》《酉阳杂俎》等近30本经典作品中，精心挑选45篇符合现代审美、适合孩子阅读的故事；故事蕴涵着丰富的想象力与趣味性；用简美的现代语言，全新讲述中国童话故事；搭配符合故事主题的原创古风插画，带孩子进入奇幻浪漫的童话世界。\",\"id\":9,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"中国童话\",\"position\":\"6sdf11\",\"sortId\":9,\"sortName\":\"故事\",\"status\":1},{\"author\":\"本多孝好\",\"description\":\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\",\"id\":10,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"人生删除事务所\",\"position\":\"22sdf1\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"拉宾德拉纳特·泰戈尔\",\"description\":\"《飞鸟集》是泰戈尔的代表作之一，也是世界上最杰出的诗集之一。白昼和黑夜、溪流和海洋、自由和背叛，都在泰戈尔的笔下合而为一，短小的语句道出了深刻的人生哲理，引领世人探寻真理和智慧的源泉。初读这些诗篇，如同在暴风雨过后的初夏清晨，推开卧室的窗户，看到一个淡泊清透的世界，一切都是那样清新、亮丽，可是其中的韵味却很厚实，耐人寻味。\",\"id\"', '\"books/book/borrow\"', 0, NULL, '2024-09-29 09:36:40', 70327);
INSERT INTO `sys_oper_log` VALUES (290, '借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.borrow()', 'GET', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"books\":[{\"author\":\"夏洛123213\",\"description\":\"我也特烦恼!!!\",\"id\":1,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"夏洛特烦恼\",\"position\":\"4asdfa23\",\"sortId\":2,\"sortName\":\"护理\",\"status\":1},{\"author\":\"江湖老中医\",\"description\":\"详细介绍每植一根发多少钱？\",\"id\":2,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"植发的价格\",\"position\":\"5sdfs1\",\"sortId\":2,\"sortName\":\"护理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"神不知鬼不觉的拔掉你的头发\",\"id\":3,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"代码的力量\",\"position\":\"234as\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"无简介\",\"id\":4,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"java从入门到入土\",\"position\":\"sdfs33\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"图书馆章程\",\"id\":5,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆章程\",\"position\":\"234sdfs\",\"sortId\":5,\"sortName\":\"管理\",\"status\":1},{\"author\":\"吸尘羊\",\"description\":\"图书馆建设！\",\"id\":6,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆建设\",\"position\":\"23dgdff\",\"sortId\":5,\"sortName\":\"管理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"学习如何跑路\",\"id\":7,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"学习如何跑路\",\"position\":\"2sdsa\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"匿名\",\"description\":\"做梦\",\"id\":8,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"美好课设\",\"position\":\"23432s\",\"sortId\":8,\"sortName\":\"励志\",\"status\":1},{\"author\":\"刘丽朵\",\"description\":\"这是一本给孩子的中国童话故事集。以“非教训的无意思、空灵的幻想、快活的嬉笑、纯净的诗意、悠远的生命体味”为选篇标准，从《搜神记》《太平广记》《聊斋志异》《酉阳杂俎》等近30本经典作品中，精心挑选45篇符合现代审美、适合孩子阅读的故事；故事蕴涵着丰富的想象力与趣味性；用简美的现代语言，全新讲述中国童话故事；搭配符合故事主题的原创古风插画，带孩子进入奇幻浪漫的童话世界。\",\"id\":9,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"中国童话\",\"position\":\"6sdf11\",\"sortId\":9,\"sortName\":\"故事\",\"status\":1},{\"author\":\"本多孝好\",\"description\":\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\",\"id\":10,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"人生删除事务所\",\"position\":\"22sdf1\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"拉宾德拉纳特·泰戈尔\",\"description\":\"《飞鸟集》是泰戈尔的代表作之一，也是世界上最杰出的诗集之一。白昼和黑夜、溪流和海洋、自由和背叛，都在泰戈尔的笔下合而为一，短小的语句道出了深刻的人生哲理，引领世人探寻真理和智慧的源泉。初读这些诗篇，如同在暴风雨过后的初夏清晨，推开卧室的窗户，看到一个淡泊清透的世界，一切都是那样清新、亮丽，可是其中的韵味却很厚实，耐人寻味。\",\"id\"', '\"books/book/borrow\"', 0, NULL, '2024-09-29 09:36:45', 2940);
INSERT INTO `sys_oper_log` VALUES (291, '借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.borrow()', 'GET', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"books\":[{\"author\":\"夏洛123213\",\"description\":\"我也特烦恼!!!\",\"id\":1,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"夏洛特烦恼\",\"position\":\"4asdfa23\",\"sortId\":2,\"sortName\":\"护理\",\"status\":1},{\"author\":\"江湖老中医\",\"description\":\"详细介绍每植一根发多少钱？\",\"id\":2,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"植发的价格\",\"position\":\"5sdfs1\",\"sortId\":2,\"sortName\":\"护理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"神不知鬼不觉的拔掉你的头发\",\"id\":3,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"代码的力量\",\"position\":\"234as\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"无简介\",\"id\":4,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"java从入门到入土\",\"position\":\"sdfs33\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"图书馆章程\",\"id\":5,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆章程\",\"position\":\"234sdfs\",\"sortId\":5,\"sortName\":\"管理\",\"status\":1},{\"author\":\"吸尘羊\",\"description\":\"图书馆建设！\",\"id\":6,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆建设\",\"position\":\"23dgdff\",\"sortId\":5,\"sortName\":\"管理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"学习如何跑路\",\"id\":7,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"学习如何跑路\",\"position\":\"2sdsa\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"匿名\",\"description\":\"做梦\",\"id\":8,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"美好课设\",\"position\":\"23432s\",\"sortId\":8,\"sortName\":\"励志\",\"status\":1},{\"author\":\"刘丽朵\",\"description\":\"这是一本给孩子的中国童话故事集。以“非教训的无意思、空灵的幻想、快活的嬉笑、纯净的诗意、悠远的生命体味”为选篇标准，从《搜神记》《太平广记》《聊斋志异》《酉阳杂俎》等近30本经典作品中，精心挑选45篇符合现代审美、适合孩子阅读的故事；故事蕴涵着丰富的想象力与趣味性；用简美的现代语言，全新讲述中国童话故事；搭配符合故事主题的原创古风插画，带孩子进入奇幻浪漫的童话世界。\",\"id\":9,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"中国童话\",\"position\":\"6sdf11\",\"sortId\":9,\"sortName\":\"故事\",\"status\":1},{\"author\":\"本多孝好\",\"description\":\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\",\"id\":10,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"人生删除事务所\",\"position\":\"22sdf1\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"拉宾德拉纳特·泰戈尔\",\"description\":\"《飞鸟集》是泰戈尔的代表作之一，也是世界上最杰出的诗集之一。白昼和黑夜、溪流和海洋、自由和背叛，都在泰戈尔的笔下合而为一，短小的语句道出了深刻的人生哲理，引领世人探寻真理和智慧的源泉。初读这些诗篇，如同在暴风雨过后的初夏清晨，推开卧室的窗户，看到一个淡泊清透的世界，一切都是那样清新、亮丽，可是其中的韵味却很厚实，耐人寻味。\",\"id\"', '\"books/book/borrow\"', 0, NULL, '2024-09-29 09:41:52', 3340);
INSERT INTO `sys_oper_log` VALUES (292, '借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.borrow()', 'GET', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"books\":[{\"author\":\"夏洛123213\",\"description\":\"我也特烦恼!!!\",\"id\":1,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"夏洛特烦恼\",\"position\":\"4asdfa23\",\"sortId\":2,\"sortName\":\"护理\",\"status\":1},{\"author\":\"江湖老中医\",\"description\":\"详细介绍每植一根发多少钱？\",\"id\":2,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"植发的价格\",\"position\":\"5sdfs1\",\"sortId\":2,\"sortName\":\"护理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"神不知鬼不觉的拔掉你的头发\",\"id\":3,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"代码的力量\",\"position\":\"234as\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"无简介\",\"id\":4,\"libraryId\":2,\"libraryName\":\"北图\",\"name\":\"java从入门到入土\",\"position\":\"sdfs33\",\"sortId\":3,\"sortName\":\"编程\",\"status\":1},{\"author\":\"明月复苏\",\"description\":\"图书馆章程\",\"id\":5,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆章程\",\"position\":\"234sdfs\",\"sortId\":5,\"sortName\":\"管理\",\"status\":1},{\"author\":\"吸尘羊\",\"description\":\"图书馆建设！\",\"id\":6,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"图书馆建设\",\"position\":\"23dgdff\",\"sortId\":5,\"sortName\":\"管理\",\"status\":0},{\"author\":\"明月复苏\",\"description\":\"学习如何跑路\",\"id\":7,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"学习如何跑路\",\"position\":\"2sdsa\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"匿名\",\"description\":\"做梦\",\"id\":8,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"美好课设\",\"position\":\"23432s\",\"sortId\":8,\"sortName\":\"励志\",\"status\":1},{\"author\":\"刘丽朵\",\"description\":\"这是一本给孩子的中国童话故事集。以“非教训的无意思、空灵的幻想、快活的嬉笑、纯净的诗意、悠远的生命体味”为选篇标准，从《搜神记》《太平广记》《聊斋志异》《酉阳杂俎》等近30本经典作品中，精心挑选45篇符合现代审美、适合孩子阅读的故事；故事蕴涵着丰富的想象力与趣味性；用简美的现代语言，全新讲述中国童话故事；搭配符合故事主题的原创古风插画，带孩子进入奇幻浪漫的童话世界。\",\"id\":9,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"中国童话\",\"position\":\"6sdf11\",\"sortId\":9,\"sortName\":\"故事\",\"status\":1},{\"author\":\"本多孝好\",\"description\":\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\",\"id\":10,\"libraryId\":1,\"libraryName\":\"南图\",\"name\":\"人生删除事务所\",\"position\":\"22sdf1\",\"sortId\":7,\"sortName\":\"生活\",\"status\":1},{\"author\":\"拉宾德拉纳特·泰戈尔\",\"description\":\"《飞鸟集》是泰戈尔的代表作之一，也是世界上最杰出的诗集之一。白昼和黑夜、溪流和海洋、自由和背叛，都在泰戈尔的笔下合而为一，短小的语句道出了深刻的人生哲理，引领世人探寻真理和智慧的源泉。初读这些诗篇，如同在暴风雨过后的初夏清晨，推开卧室的窗户，看到一个淡泊清透的世界，一切都是那样清新、亮丽，可是其中的韵味却很厚实，耐人寻味。\",\"id\"', '\"books/book/borrow\"', 0, NULL, '2024-09-29 09:59:16', 11063);
INSERT INTO `sys_oper_log` VALUES (293, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'card_id\' in \'class com.ruoyi.web.domain.TBorrowBooks\'', '2024-09-29 10:07:17', 125);
INSERT INTO `sys_oper_log` VALUES (294, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'card_id\' in \'class com.ruoyi.web.domain.TBorrowBooks\'', '2024-09-29 10:16:24', 152728);
INSERT INTO `sys_oper_log` VALUES (295, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'card_id\' in \'class com.ruoyi.web.domain.TBorrowBooks\'', '2024-09-29 10:17:44', 10033);
INSERT INTO `sys_oper_log` VALUES (296, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'card_id\' in \'class com.ruoyi.web.domain.TBorrowBooks\'', '2024-09-29 10:24:46', 46865);
INSERT INTO `sys_oper_log` VALUES (297, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'card_id\' in \'class com.ruoyi.web.domain.TBorrowBooks\'', '2024-09-29 10:25:19', 4088);
INSERT INTO `sys_oper_log` VALUES (298, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'borrow_date\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\31722\\IdeaProjects\\RuoYi-master (2)\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\books\\TBorrowBooksMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TBorrowBooksMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_borrow_books      ( card_id,                       book_id )       values ( ?,                       ? )\r\n### Cause: java.sql.SQLException: Field \'borrow_date\' doesn\'t have a default value\n; Field \'borrow_date\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'borrow_date\' doesn\'t have a default value', '2024-09-29 10:28:30', 6233);
INSERT INTO `sys_oper_log` VALUES (299, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"date\":[\"2024-09-29T11:09\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'card_id\' in \'class com.ruoyi.web.domain.TBorrowBooks\'', '2024-09-29 11:10:10', 166);
INSERT INTO `sys_oper_log` VALUES (300, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息管理\"],\"url\":[\"userMessages/userPasonalMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages/userPasonalMessage:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 11:12:12', 47);
INSERT INTO `sys_oper_log` VALUES (301, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"借阅图书\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:borrow\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 15:15:24', 88);
INSERT INTO `sys_oper_log` VALUES (302, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2022', '127.0.0.1', '内网IP', '2022', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 15:21:36', 56);
INSERT INTO `sys_oper_log` VALUES (303, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'GET', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Cannot invoke \"com.ruoyi.web.domain.TBorrowCard.getRuleId()\" because \"tBorrowCard\" is null', '2024-09-29 15:54:21', 150);
INSERT INTO `sys_oper_log` VALUES (304, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'GET', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Cannot invoke \"com.ruoyi.web.domain.TBorrowCard.getRuleId()\" because \"tBorrowCard\" is null', '2024-09-29 16:32:16', 20);
INSERT INTO `sys_oper_log` VALUES (305, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'GET', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Cannot invoke \"com.ruoyi.web.domain.TBorrowCard.getRuleId()\" because \"tBorrowCard\" is null', '2024-09-29 16:32:49', 5);
INSERT INTO `sys_oper_log` VALUES (306, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'GET', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Cannot invoke \"com.ruoyi.web.domain.TBorrowCard.getRuleId()\" because \"tBorrowCard\" is null', '2024-09-29 16:41:36', 16);
INSERT INTO `sys_oper_log` VALUES (307, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'GET', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Cannot invoke \"com.ruoyi.web.domain.TBorrowCard.getRuleId()\" because \"tBorrowCard\" is null', '2024-09-29 16:44:45', 4);
INSERT INTO `sys_oper_log` VALUES (308, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'GET', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Cannot invoke \"com.ruoyi.web.domain.TBorrowCard.getRuleId()\" because \"tBorrowCard\" is null', '2024-09-29 16:49:11', 205663);
INSERT INTO `sys_oper_log` VALUES (309, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"date\":[\"2024-09-29\"]}', NULL, 1, 'Cannot invoke \"java.util.Date.getTime()\" because \"date2\" is null', '2024-09-29 16:50:28', 15272);
INSERT INTO `sys_oper_log` VALUES (310, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"date\":[\"2024-09-29\"]}', NULL, 1, 'Cannot invoke \"java.util.Date.getTime()\" because \"date2\" is null', '2024-09-29 17:03:53', 720738);
INSERT INTO `sys_oper_log` VALUES (311, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"date\":[\"2024-09-29\"]}', NULL, 1, 'Cannot invoke \"java.util.Date.getTime()\" because \"date2\" is null', '2024-09-29 17:14:54', 615280);
INSERT INTO `sys_oper_log` VALUES (312, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"date\":[\"2024-10-02\"]}', NULL, 1, 'Cannot invoke \"java.util.Date.getTime()\" because \"date2\" is null', '2024-09-29 17:18:03', 157686);
INSERT INTO `sys_oper_log` VALUES (313, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-01\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'borrow_date\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\31722\\IdeaProjects\\RuoYi-master (2)\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\books\\TBorrowBooksMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TBorrowBooksMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_borrow_books      ( card_id,                       book_id,                              end_date )       values ( ?,                       ?,                              ? )\r\n### Cause: java.sql.SQLException: Field \'borrow_date\' doesn\'t have a default value\n; Field \'borrow_date\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'borrow_date\' doesn\'t have a default value', '2024-09-29 17:19:07', 52766);
INSERT INTO `sys_oper_log` VALUES (314, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-09-30\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'borrow_date\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\31722\\IdeaProjects\\RuoYi-master (2)\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\books\\TBorrowBooksMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TBorrowBooksMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_borrow_books      ( card_id,                       book_id,                              end_date )       values ( ?,                       ?,                              ? )\r\n### Cause: java.sql.SQLException: Field \'borrow_date\' doesn\'t have a default value\n; Field \'borrow_date\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'borrow_date\' doesn\'t have a default value', '2024-09-29 17:25:37', 256399);
INSERT INTO `sys_oper_log` VALUES (315, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-01\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'return_date\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\31722\\IdeaProjects\\RuoYi-master (2)\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\books\\TBorrowBooksMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TBorrowBooksMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_borrow_books      ( card_id,                       book_id,                       borrow_date,                       end_date )       values ( ?,                       ?,                       ?,                       ? )\r\n### Cause: java.sql.SQLException: Field \'return_date\' doesn\'t have a default value\n; Field \'return_date\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'return_date\' doesn\'t have a default value', '2024-09-29 17:26:40', 39039);
INSERT INTO `sys_oper_log` VALUES (316, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-09-30\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\31722\\IdeaProjects\\RuoYi-master (2)\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\books\\TBorrowBooksMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TBorrowBooksMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_borrow_books      ( card_id,                       book_id,                       borrow_date,                       end_date )       values ( ?,                       ?,                       ?,                       ? )\r\n### Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n; Field \'status\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'status\' doesn\'t have a default value', '2024-09-29 17:29:52', 7362);
INSERT INTO `sys_oper_log` VALUES (317, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"图书管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 17:33:17', 25);
INSERT INTO `sys_oper_log` VALUES (318, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅信息查询\"],\"url\":[\"books/book\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:borrowselective\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 17:34:23', 15);
INSERT INTO `sys_oper_log` VALUES (319, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-02\"]}', NULL, 1, '可借阅时间不可超过规则限制的借阅时间', '2024-09-29 17:35:43', 1956);
INSERT INTO `sys_oper_log` VALUES (320, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-01\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 17:36:00', 5867);
INSERT INTO `sys_oper_log` VALUES (321, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-01\"]}', NULL, 1, '不能超过规则限定的最大借阅数量', '2024-09-29 17:36:09', 6);
INSERT INTO `sys_oper_log` VALUES (322, '书籍添加', 1, 'com.ruoyi.web.controller.book.TBorrowCardController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/addBorrowCard', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"ruleId\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 18:39:07', 25);
INSERT INTO `sys_oper_log` VALUES (323, '书籍添加', 1, 'com.ruoyi.web.controller.book.TBorrowCardController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/addBorrowCard', '127.0.0.1', '内网IP', '{\"userId\":[\"4\"],\"ruleId\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 18:39:23', 10);
INSERT INTO `sys_oper_log` VALUES (324, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBorrowCardController.remove()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1805010222\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 18:40:07', 50);
INSERT INTO `sys_oper_log` VALUES (325, '借阅规则添加', 1, 'com.ruoyi.web.controller.book.TRulesController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/rules/addRules', '127.0.0.1', '内网IP', '{\"rulesName\":[\"测试8\"],\"borrowNum\":[\"12\"],\"limitDay\":[\"2\"],\"borrowLibrary\":[\"1,2,3\"],\"overtimeFee\":[\"2\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'rules_name\' in \'class com.ruoyi.web.domain.TRules\'', '2024-09-29 19:21:01', 107);
INSERT INTO `sys_oper_log` VALUES (326, '借阅规则添加', 1, 'com.ruoyi.web.controller.book.TRulesController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/rules/addRules', '127.0.0.1', '内网IP', '{\"rulesName\":[\"测试8\"],\"borrowNum\":[\"12\"],\"limitDay\":[\"2\"],\"borrowLibrary\":[\"1,2,3\"],\"overtimeFee\":[\"2\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'rules_name\' in \'class com.ruoyi.web.domain.TRules\'', '2024-09-29 19:22:47', 7255);
INSERT INTO `sys_oper_log` VALUES (327, '借阅规则添加', 1, 'com.ruoyi.web.controller.book.TRulesController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/rules/addRules', '127.0.0.1', '内网IP', '{\"rulesName\":[\"测试8\"],\"borrowNum\":[\"12\"],\"limitDay\":[\"2\"],\"borrowLibrary\":[\"1,2,3\"],\"overtimeFee\":[\"2\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'rules_name\' in \'class com.ruoyi.web.domain.TRules\'', '2024-09-29 19:23:30', 3);
INSERT INTO `sys_oper_log` VALUES (328, '借阅规则添加', 1, 'com.ruoyi.web.controller.book.TRulesController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/rules/addRules', '127.0.0.1', '内网IP', '{\"rulesName\":[\"测试8\"],\"borrowNum\":[\"12\"],\"limitDay\":[\"2\"],\"borrowLibrary\":[\"1,2,3\"],\"overtimeFee\":[\"2\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'rules_name\' in \'class com.ruoyi.web.domain.TRules\'', '2024-09-29 19:25:32', 109068);
INSERT INTO `sys_oper_log` VALUES (329, '借阅规则添加', 1, 'com.ruoyi.web.controller.book.TRulesController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/rules/addRules', '127.0.0.1', '内网IP', '{\"rulesName\":[\"测试8\"],\"borrowNum\":[\"12\"],\"limitDay\":[\"2\"],\"borrowLibrary\":[\"1,2,3\"],\"overtimeFee\":[\"2\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'rules_name\' in \'class com.ruoyi.web.domain.TRules\'', '2024-09-29 19:25:38', 2251);
INSERT INTO `sys_oper_log` VALUES (330, '借阅规则添加', 1, 'com.ruoyi.web.controller.book.TRulesController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/rules/addRules', '127.0.0.1', '内网IP', '{\"rulesName\":[\"测试8\"],\"borrowNum\":[\"12\"],\"limitDay\":[\"2\"],\"borrowLibrary\":[\"1,2,3\"],\"overtimeFee\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 19:32:22', 7060);
INSERT INTO `sys_oper_log` VALUES (331, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBorrowCardController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1805010202\"],\"userId\":[\"1\"],\"ruleId\":[\"7\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 19:33:56', 12);
INSERT INTO `sys_oper_log` VALUES (332, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBorrowCardController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1805010202\"],\"userId\":[\"1\"],\"ruleId\":[\"7\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 19:34:02', 9);
INSERT INTO `sys_oper_log` VALUES (333, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBorrowCardController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1805010202\"],\"userId\":[\"1\"],\"ruleId\":[\"7\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 19:34:07', 11);
INSERT INTO `sys_oper_log` VALUES (334, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBookSortController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/booksort/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"未分类\"],\"description\":[\"不可删除1111\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 19:34:14', 24);
INSERT INTO `sys_oper_log` VALUES (335, '书籍修改', 2, 'com.ruoyi.web.controller.book.TRulesController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"rulesName\":[\"测试\"],\"borrowNum\":[\"12\"],\"limitDay\":[\"60\"],\"borrowLibrary\":[\"1、2、3\"],\"overtimeFee\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 19:37:17', 3663);
INSERT INTO `sys_oper_log` VALUES (336, '书籍删除', 3, 'com.ruoyi.web.controller.book.TRulesController.remove()', 'POST', 1, 'admin', '管理部门', '/books/rules/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 19:37:25', 53);
INSERT INTO `sys_oper_log` VALUES (337, '书籍删除', 3, 'com.ruoyi.web.controller.book.TRulesController.remove()', 'POST', 1, 'admin', '管理部门', '/books/rules/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 19:37:33', 3);
INSERT INTO `sys_oper_log` VALUES (338, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBorrowCardController.remove()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1805010212\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 19:43:04', 14);
INSERT INTO `sys_oper_log` VALUES (339, '规则删除', 3, 'com.ruoyi.web.controller.book.TRulesController.remove()', 'POST', 1, 'admin', '管理部门', '/books/rules/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 19:43:10', 3);
INSERT INTO `sys_oper_log` VALUES (340, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"查看借阅规则信息\"],\"url\":[\"userMessages/borrowRulesMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:list\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 20:18:08', 96);
INSERT INTO `sys_oper_log` VALUES (341, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息管理\"],\"url\":[\"userMessages/userPasonalMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:userPasonalMessage:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 20:30:07', 90);
INSERT INTO `sys_oper_log` VALUES (342, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息管理\"],\"url\":[\"userMessages/userPasonalMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:userPasonalMessage:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 20:31:33', 16);
INSERT INTO `sys_oper_log` VALUES (343, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2012', '127.0.0.1', '内网IP', '2012', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-09-29 20:49:25', 60);
INSERT INTO `sys_oper_log` VALUES (344, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息管理\"],\"url\":[\"userMessages/userPasonalMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:userPasonalMessage:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 20:50:21', 24);
INSERT INTO `sys_oper_log` VALUES (345, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"留言板\"],\"url\":[\"userMessages/messageBoard\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:messageBoard:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 20:56:16', 112);
INSERT INTO `sys_oper_log` VALUES (346, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息管理\"],\"url\":[\"userMessages/userPasonalMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:userPasonalMessage:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 21:20:49', 88);
INSERT INTO `sys_oper_log` VALUES (347, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息管理\"],\"url\":[\"userMessages/userPasonalMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:userPasonalMessage:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-29 21:52:44', 100);
INSERT INTO `sys_oper_log` VALUES (348, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"留言板\"],\"url\":[\"userMessages/messageBoard\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:messageBoard:add\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-30 21:15:22', 99);
INSERT INTO `sys_oper_log` VALUES (349, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'admin', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"qqq\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'values ( \'qqq\' )\' at line 4\r\n### The error may exist in file [C:\\Users\\31722\\IdeaProjects\\RuoYi-master (2)\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\userMessages\\TMessageMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TMessageMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_message          ( context )          value          values ( ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'values ( \'qqq\' )\' at line 4\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'values ( \'qqq\' )\' at line 4', '2024-09-30 21:43:32', 139);
INSERT INTO `sys_oper_log` VALUES (350, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'admin', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"11\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'values ( \'11\' )\' at line 4\r\n### The error may exist in file [C:\\Users\\31722\\IdeaProjects\\RuoYi-master (2)\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\userMessages\\TMessageMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TMessageMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_message          ( context )          value          values ( ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'values ( \'11\' )\' at line 4\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'values ( \'11\' )\' at line 4', '2024-09-30 21:49:07', 118);
INSERT INTO `sys_oper_log` VALUES (351, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'admin', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-09-30 21:50:53', 49);
INSERT INTO `sys_oper_log` VALUES (352, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"公告管理\"],\"url\":[\"books/tnotice\"],\"target\":[\"menuItem\"],\"perms\":[\"books:tnotice:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 15:04:03', 171);
INSERT INTO `sys_oper_log` VALUES (353, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"图书系统开始建设\"],\"detail\":[\"图书系统开始建设11\"],\"publishDate\":[\"15:37\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 15:37:33', 254);
INSERT INTO `sys_oper_log` VALUES (354, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"图书系统开始建设\"],\"detail\":[\"图书系统开始建设11\"],\"publishDate\":[\"15:40\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 15:38:12', 16);
INSERT INTO `sys_oper_log` VALUES (355, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"图书系统开始建设1111\"],\"detail\":[\"图书系统开始建设\"],\"publishDate\":[\"15:54\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 15:54:07', 291);
INSERT INTO `sys_oper_log` VALUES (356, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"图书系统开始建设\"],\"detail\":[\"图书系统开始建设\"],\"publishDate\":[\"15:55\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 15:54:19', 23);
INSERT INTO `sys_oper_log` VALUES (357, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"title\":[\"图书管理系统基本建成\"],\"detail\":[\"庆祝图书管理系统基本建成11\"],\"publishDate\":[\"15:57\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 15:54:27', 16);
INSERT INTO `sys_oper_log` VALUES (358, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"title\":[\"图书管理系统基本建成\"],\"detail\":[\"图书管理系统基本建成11\"],\"publishDate\":[\"15:54\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 15:54:37', 12);
INSERT INTO `sys_oper_log` VALUES (359, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"图书系统开始建设1111\"],\"detail\":[\"图书系统开始建设11\"],\"publishDate\":[\"15:56\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 15:55:05', 20);
INSERT INTO `sys_oper_log` VALUES (360, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"title\":[\"图书系统正在建设\"],\"detail\":[\"图书系统正在建设，冲鸭11\"],\"publishDate\":[\"15:56\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 15:55:14', 19);
INSERT INTO `sys_oper_log` VALUES (361, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"title\":[\"图书系统正在建设\"],\"detail\":[\"图书系统正在建设，冲鸭11\"],\"publishDate\":[\"15:58\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 15:56:08', 10);
INSERT INTO `sys_oper_log` VALUES (362, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"图书系统开始建设1111\"],\"detail\":[\"00\"],\"publishDate\":[\"15:57\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 15:56:23', 10);
INSERT INTO `sys_oper_log` VALUES (363, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"title\":[\"图书系统正在建设\"],\"detail\":[\"图书系统正在建设，冲鸭11\"],\"publishDate\":[\"15:57\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 15:58:42', 45);
INSERT INTO `sys_oper_log` VALUES (364, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"title\":[\"图书管理系统基本建成\"],\"detail\":[\"图书管理系统基本建成\"],\"publishDate\":[\"17:00\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 16:00:13', 15);
INSERT INTO `sys_oper_log` VALUES (365, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"图书系统开始建设1111\"],\"detail\":[\"图书系统开始建设1111\"],\"publishDate\":[\"16:00\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 16:00:35', 88);
INSERT INTO `sys_oper_log` VALUES (366, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"图书系统开始建设\"],\"detail\":[\"图书系统开始建设\"],\"publishDate\":[\"16:00\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 16:00:52', 28);
INSERT INTO `sys_oper_log` VALUES (367, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"title\":[\"图书系统正在建设\"],\"detail\":[\"图书系统正在建设111111111111\"],\"publishDate\":[\"16:01\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 16:01:19', 11);
INSERT INTO `sys_oper_log` VALUES (368, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"图书系统开始建设\"],\"detail\":[\"图书系统开始建设\"],\"publishDate\":[\"2024-10-01T23:41\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 23:41:32', 65);
INSERT INTO `sys_oper_log` VALUES (369, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"图书系统开始建设\"],\"detail\":[\"图书系统开始建设11\"],\"publishDate\":[\"2024-10-01T23:47\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 23:47:40', 263);
INSERT INTO `sys_oper_log` VALUES (370, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"图书系统开始建设\"],\"detail\":[\"图书系统开始建设11\"],\"publishDate\":[\"2024-10-01T23:54\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 23:54:38', 71);
INSERT INTO `sys_oper_log` VALUES (371, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"title\":[\"图书系统正在建设\"],\"detail\":[\"图书系统正在建设，冲鸭11\"],\"publishDate\":[\"2024-10-01T23:54\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-01 23:54:48', 13);
INSERT INTO `sys_oper_log` VALUES (372, '书籍添加', 1, 'com.ruoyi.web.controller.book.TNoticeController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/add', '127.0.0.1', '内网IP', '{\"title\":[\"测试2\"],\"detail\":[\"图书系统正在建设111111111111\"],\"publishDate\":[\"2024-10-02T00:03\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 00:03:27', 93);
INSERT INTO `sys_oper_log` VALUES (373, '书籍添加', 1, 'com.ruoyi.web.controller.book.TNoticeController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/add', '127.0.0.1', '内网IP', '{\"title\":[\"测试3\"],\"detail\":[\"图书系统正在建设\"],\"publishDate\":[\"2024-10-02T00:04\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 00:04:42', 16);
INSERT INTO `sys_oper_log` VALUES (374, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"title\":[\"测试2\"],\"detail\":[\"图书系统正在建设111111111111\"],\"publishDate\":[\"2024-10-02T00:19\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 00:19:55', 12);
INSERT INTO `sys_oper_log` VALUES (375, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"title\":[\"测试3\"],\"detail\":[\"图书系统正在建设\"],\"publishDate\":[\"2024-10-02T00:19\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 00:20:00', 4);
INSERT INTO `sys_oper_log` VALUES (376, '书籍添加', 1, 'com.ruoyi.web.controller.book.TNoticeController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/add', '127.0.0.1', '内网IP', '{\"title\":[\"测试3\"],\"detail\":[\"图书系统正在建设\"],\"publishDate\":[\"2024-10-02T00:20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 00:20:30', 13);
INSERT INTO `sys_oper_log` VALUES (377, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"图书系统开始建设\"],\"detail\":[\"图书系统开始建设11\"],\"publishDate\":[\"2024-10-02T00:24\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 00:23:26', 4);
INSERT INTO `sys_oper_log` VALUES (378, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"图书系统开始建设\"],\"detail\":[\"图书系统开始建设11\"],\"publishDate\":[\"2024-10-02T00:25\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 00:23:33', 13);
INSERT INTO `sys_oper_log` VALUES (379, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"7\"],\"title\":[\"测试3\"],\"detail\":[\"图书系统正在建设111111111111\"],\"publishDate\":[\"2024-10-02T00:43\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 00:43:49', 367);
INSERT INTO `sys_oper_log` VALUES (380, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"title\":[\"测试3\"],\"detail\":[\"图书系统正在建设\"],\"publishDate\":[\"2024-10-02T00:43\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 00:43:58', 14);
INSERT INTO `sys_oper_log` VALUES (381, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"title\":[\"测试3\"],\"detail\":[\"图书系统正在建设\"],\"publishDate\":[\"2024-10-02T00:44\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 00:44:09', 11);
INSERT INTO `sys_oper_log` VALUES (382, '留言删除', 3, 'com.ruoyi.web.controller.book.TNoticeController.remove()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"7\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 01:06:38', 11579);
INSERT INTO `sys_oper_log` VALUES (383, '书籍添加', 1, 'com.ruoyi.web.controller.book.TNoticeController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/add', '127.0.0.1', '内网IP', '{\"title\":[\"测试3\"],\"detail\":[\"图书系统正在建设\"],\"publishDate\":[\"2024-10-02T02:06\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 01:17:39', 638598);
INSERT INTO `sys_oper_log` VALUES (384, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'POST', 1, 'admin', '管理部门', '/system/role/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', NULL, 1, '图书管理员已分配,不能删除', '2024-10-02 16:04:42', 95);
INSERT INTO `sys_oper_log` VALUES (385, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"4\"],\"deptId\":[\"\"],\"userName\":[\"馆长1\"],\"dept.deptName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"馆长1\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 16:05:02', 72);
INSERT INTO `sys_oper_log` VALUES (386, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"105\"],\"userName\":[\"图书管理员\"],\"dept.deptName\":[\"运营部门\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"ry@qq.com\"],\"loginName\":[\"ry\"],\"sex\":[\"0\"],\"role\":[\"2\",\"3\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2,3\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 16:05:08', 33);
INSERT INTO `sys_oper_log` VALUES (387, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"105\"],\"userName\":[\"图书管理员\"],\"dept.deptName\":[\"运营部门\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"ry@qq.com\"],\"loginName\":[\"ry\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 16:05:11', 31);
INSERT INTO `sys_oper_log` VALUES (388, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'POST', 1, 'admin', '管理部门', '/system/role/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 16:05:17', 88);
INSERT INTO `sys_oper_log` VALUES (389, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"4\"],\"deptId\":[\"105\"],\"userName\":[\"馆长1\"],\"dept.deptName\":[\"运营部门\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"馆长1\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 16:05:47', 19);
INSERT INTO `sys_oper_log` VALUES (390, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2017', '127.0.0.1', '内网IP', '2017', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 16:06:06', 30);
INSERT INTO `sys_oper_log` VALUES (391, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"图书管理员信息\"],\"url\":[\"books/managerInfo\"],\"target\":[\"menuItem\"],\"perms\":[\"books:managerInfo:view\"],\"orderNum\":[\"7\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 16:06:46', 37);
INSERT INTO `sys_oper_log` VALUES (392, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2016', '127.0.0.1', '内网IP', '2016', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 16:06:50', 28);
INSERT INTO `sys_oper_log` VALUES (393, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2010\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"用户功能\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-male\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 16:07:00', 18);
INSERT INTO `sys_oper_log` VALUES (394, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2024\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"管理员信息\"],\"url\":[\"books/managerInfo\"],\"target\":[\"menuItem\"],\"perms\":[\"books:managerInfo:view\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 16:47:25', 144);
INSERT INTO `sys_oper_log` VALUES (395, '公告添加', 1, 'com.ruoyi.web.controller.book.TNoticeController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/add', '127.0.0.1', '内网IP', '{\"title\":[\"测试5\"],\"detail\":[\"图书系统正在建设\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 18:05:46', 25824);
INSERT INTO `sys_oper_log` VALUES (396, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2013,2012,2011,2015,2014,2019\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 18:11:58', 166);
INSERT INTO `sys_oper_log` VALUES (397, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2013,2012,2011,2015,2014,2019\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 18:11:58', 90);
INSERT INTO `sys_oper_log` VALUES (398, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2013,2012,2011,2015,2014,2019\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 18:11:58', 79);
INSERT INTO `sys_oper_log` VALUES (399, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"4\"],\"postName\":[\"普通用户\"],\"postCode\":[\"user\"],\"postSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 18:13:53', 48);
INSERT INTO `sys_oper_log` VALUES (400, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'admin', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"qqq\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:12:14', 267);
INSERT INTO `sys_oper_log` VALUES (401, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'admin', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"qqq\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:17:35', 17815);
INSERT INTO `sys_oper_log` VALUES (402, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"报表管理\"],\"url\":[\"books/table\"],\"target\":[\"menuItem\"],\"perms\":[\"books:table:view\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:38:42', 271);
INSERT INTO `sys_oper_log` VALUES (403, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"公告管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-calendar\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:38:51', 41);
INSERT INTO `sys_oper_log` VALUES (404, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"发布公告\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-calendar\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:39:02', 34);
INSERT INTO `sys_oper_log` VALUES (405, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2025\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"报表管理\"],\"url\":[\"books/table\"],\"target\":[\"menuItem\"],\"perms\":[\"books:table:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-bar-chart\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:39:17', 32);
INSERT INTO `sys_oper_log` VALUES (406, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2025\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅报表\"],\"url\":[\"books/table\"],\"target\":[\"menuItem\"],\"perms\":[\"books:table:borrowtable\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:40:03', 35);
INSERT INTO `sys_oper_log` VALUES (407, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2025\"],\"menuType\":[\"C\"],\"menuName\":[\"归还报表\"],\"url\":[\"books/table\"],\"target\":[\"menuItem\"],\"perms\":[\"books:table:returntable\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:40:39', 45);
INSERT INTO `sys_oper_log` VALUES (408, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2025\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"报表管理\"],\"url\":[\"books/table\"],\"target\":[\"menuItem\"],\"perms\":[\"books:table:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-bar-chart\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:47:50', 46);
INSERT INTO `sys_oper_log` VALUES (409, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2025\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"报表管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-bar-chart\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:48:04', 37);
INSERT INTO `sys_oper_log` VALUES (410, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2025', '127.0.0.1', '内网IP', '2025', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', 0, NULL, '2024-10-02 23:48:38', 14);
INSERT INTO `sys_oper_log` VALUES (411, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2026', '127.0.0.1', '内网IP', '2026', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:48:44', 56);
INSERT INTO `sys_oper_log` VALUES (412, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2027', '127.0.0.1', '内网IP', '2027', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:48:48', 30);
INSERT INTO `sys_oper_log` VALUES (413, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2025', '127.0.0.1', '内网IP', '2025', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:48:53', 28);
INSERT INTO `sys_oper_log` VALUES (414, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"报表管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:49:09', 31);
INSERT INTO `sys_oper_log` VALUES (415, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2028\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"报表管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-bar-chart\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:49:16', 49);
INSERT INTO `sys_oper_log` VALUES (416, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2028\"],\"menuType\":[\"C\"],\"menuName\":[\"归还报表\"],\"url\":[\"books/table\"],\"target\":[\"menuItem\"],\"perms\":[\"books:table:returntable\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:49:39', 56);
INSERT INTO `sys_oper_log` VALUES (417, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2028\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅报表\"],\"url\":[\"books/table\"],\"target\":[\"menuItem\"],\"perms\":[\"books:table:borrowtable\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:50:09', 38);
INSERT INTO `sys_oper_log` VALUES (418, '留言删除', 3, 'com.ruoyi.web.controller.book.TNoticeController.remove()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:50:28', 3386);
INSERT INTO `sys_oper_log` VALUES (419, '留言删除', 3, 'com.ruoyi.web.controller.book.TNoticeController.remove()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:50:36', 20);
INSERT INTO `sys_oper_log` VALUES (420, '留言删除', 3, 'com.ruoyi.web.controller.book.TNoticeController.remove()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-02 23:50:40', 16);
INSERT INTO `sys_oper_log` VALUES (421, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"留言板\"],\"url\":[\"userMessages/messageBoard\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:messageBoard:add\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 00:02:04', 92);
INSERT INTO `sys_oper_log` VALUES (422, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2030\"],\"parentId\":[\"2028\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅报表\"],\"url\":[\"books/borrowtable\"],\"target\":[\"menuItem\"],\"perms\":[\"books:borrowtable:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 00:46:53', 87);
INSERT INTO `sys_oper_log` VALUES (423, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2029\"],\"parentId\":[\"2028\"],\"menuType\":[\"C\"],\"menuName\":[\"归还报表\"],\"url\":[\"books/returntable\"],\"target\":[\"menuItem\"],\"perms\":[\"books:returntable:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 00:47:20', 16);
INSERT INTO `sys_oper_log` VALUES (424, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'admin', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"1111\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'publishDate\' in \'class com.ruoyi.web.domain.TMessage\'', '2024-10-03 00:54:03', 88);
INSERT INTO `sys_oper_log` VALUES (425, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'admin', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"1111\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'publishDate\' in \'class com.ruoyi.web.domain.TMessage\'', '2024-10-03 00:55:49', 10);
INSERT INTO `sys_oper_log` VALUES (426, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2013,2012,2011,2015,2014,2019\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 01:02:43', 403);
INSERT INTO `sys_oper_log` VALUES (427, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2013,2012,2011,2015,2014,2019\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 01:02:43', 147);
INSERT INTO `sys_oper_log` VALUES (428, '公告添加', 1, 'com.ruoyi.web.controller.book.TNoticeController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/add', '127.0.0.1', '内网IP', '{\"title\":[\"测试4\"],\"detail\":[\"图书系统正在建设\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 01:04:15', 1943);
INSERT INTO `sys_oper_log` VALUES (429, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'admin', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"1231\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'publishDate\' in \'class com.ruoyi.web.domain.TMessage\'', '2024-10-03 01:06:55', 4960);
INSERT INTO `sys_oper_log` VALUES (430, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'admin', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"111\"]}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'publishDate\' in \'class com.ruoyi.web.domain.TMessage\'', '2024-10-03 01:13:58', 11115);
INSERT INTO `sys_oper_log` VALUES (431, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'admin', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"212212\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [C:\\Users\\31722\\IdeaProjects\\RuoYi-master (2)\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\userMessages\\TMessageMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TMessageMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_message          ( card_id,                               context,                               public_date )           values ( ?,                               ?                               ? )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2024-10-03 01:17:04', 5566);
INSERT INTO `sys_oper_log` VALUES (432, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'admin', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"112qweqeq\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [C:\\Users\\31722\\IdeaProjects\\RuoYi-master (2)\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\userMessages\\TMessageMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TMessageMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_message          ( card_id,                               context,                               public_date )           values ( ?,                               ?                               ? )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2024-10-03 01:19:27', 8960);
INSERT INTO `sys_oper_log` VALUES (433, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'admin', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"12312eqwedaw\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 01:25:05', 94);
INSERT INTO `sys_oper_log` VALUES (434, '书籍导出', 5, 'com.ruoyi.web.controller.book.TBooksController.export()', 'POST', 1, 'admin', '管理部门', '/books/book/export', '127.0.0.1', '内网IP', '{\"name\":[\"\"],\"author\":[\"\"],\"description\":[\"\"],\"position\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', NULL, 1, '导出Excel失败，请联系网站管理员！', '2024-10-03 01:30:02', 1475);
INSERT INTO `sys_oper_log` VALUES (435, '书籍导出', 5, 'com.ruoyi.web.controller.book.TBookSortController.export()', 'POST', 1, 'admin', '管理部门', '/books/booksort/export', '127.0.0.1', '内网IP', '{\"name\":[\"\"],\"description\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', NULL, 1, '导出Excel失败，请联系网站管理员！', '2024-10-03 01:30:12', 25);
INSERT INTO `sys_oper_log` VALUES (436, '书籍导出', 5, 'com.ruoyi.web.controller.book.TBorrowCardController.export()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/export', '127.0.0.1', '内网IP', '{\"userId\":[\"\"],\"ruleId\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', NULL, 1, '导出Excel失败，请联系网站管理员！', '2024-10-03 01:30:16', 23);
INSERT INTO `sys_oper_log` VALUES (437, '书籍导出', 5, 'com.ruoyi.web.controller.book.TBooksController.export()', 'POST', 1, 'admin', '管理部门', '/books/book/export', '127.0.0.1', '内网IP', '{\"name\":[\"\"],\"author\":[\"\"],\"description\":[\"\"],\"position\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', NULL, 1, '导出Excel失败，请联系网站管理员！', '2024-10-03 01:30:27', 33);
INSERT INTO `sys_oper_log` VALUES (438, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2023\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅信息查询\"],\"url\":[\"books/book\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:borrowselective\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 01:31:57', 67);
INSERT INTO `sys_oper_log` VALUES (439, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2023\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅信息查询\"],\"url\":[\"books/book\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:borrowselective\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 01:38:13', 85);
INSERT INTO `sys_oper_log` VALUES (440, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2023\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅信息查询\"],\"url\":[\"books/borrowselective\"],\"target\":[\"menuItem\"],\"perms\":[\"books:borrowselective:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 01:41:12', 17);
INSERT INTO `sys_oper_log` VALUES (441, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2023\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅信息查询\"],\"url\":[\"books/borrowSelective\"],\"target\":[\"menuItem\"],\"perms\":[\"books:borrowSelective:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 01:41:38', 51);
INSERT INTO `sys_oper_log` VALUES (442, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"5\"],\"deptId\":[\"105\"],\"userName\":[\"李四\"],\"dept.deptName\":[\"运营部门\"],\"phonenumber\":[\"\"],\"email\":[\"121312@163.com\"],\"loginName\":[\"lisi\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:08:14', 152);
INSERT INTO `sys_oper_log` VALUES (443, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2010,2013,2012,2011,2015,2014,2019\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:09:30', 21);
INSERT INTO `sys_oper_log` VALUES (444, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"105\"],\"userName\":[\"zhangsan\"],\"deptName\":[\"运营部门\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"zhangsan\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:12:07', 28);
INSERT INTO `sys_oper_log` VALUES (445, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2010,2013,2012,2011,2015,2014,2019\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:12:58', 22);
INSERT INTO `sys_oper_log` VALUES (446, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2019', '127.0.0.1', '内网IP', '2019', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-10-03 02:13:25', 7);
INSERT INTO `sys_oper_log` VALUES (447, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2019', '127.0.0.1', '内网IP', '2019', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-10-03 02:13:37', 16);
INSERT INTO `sys_oper_log` VALUES (448, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"查看借阅规则信息\"],\"url\":[\"userMessages/\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:list\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:13:49', 14);
INSERT INTO `sys_oper_log` VALUES (449, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2019', '127.0.0.1', '内网IP', '2019', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-10-03 02:13:55', 4);
INSERT INTO `sys_oper_log` VALUES (450, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2019', '127.0.0.1', '内网IP', '2019', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-10-03 02:14:06', 4);
INSERT INTO `sys_oper_log` VALUES (451, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"查看借阅规则信息\"],\"url\":[\"userMessages/borrowRulesMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:view\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:14:57', 13);
INSERT INTO `sys_oper_log` VALUES (452, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2019', '127.0.0.1', '内网IP', '2019', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-10-03 02:15:04', 4);
INSERT INTO `sys_oper_log` VALUES (453, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'POST', 1, 'admin', '管理部门', '/system/post/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:16:01', 29);
INSERT INTO `sys_oper_log` VALUES (454, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"4\"],\"postName\":[\"普通用户\"],\"postCode\":[\"user\"],\"postSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:16:08', 19);
INSERT INTO `sys_oper_log` VALUES (455, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2019', '127.0.0.1', '内网IP', '2019', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-10-03 02:16:18', 7);
INSERT INTO `sys_oper_log` VALUES (456, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"查看借阅规则信息\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:16:30', 10);
INSERT INTO `sys_oper_log` VALUES (457, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2031\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"查看借阅规则信息\"],\"url\":[\"userMessages/borrowRulesMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:16:38', 17);
INSERT INTO `sys_oper_log` VALUES (458, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"查看借阅规则信息\"],\"url\":[\"userMessages/borrowRulesMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:17:29', 21);
INSERT INTO `sys_oper_log` VALUES (459, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"图书查看\"],\"url\":[\"userMessages/bookView\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:18:37', 12);
INSERT INTO `sys_oper_log` VALUES (460, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2032\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"图书查看\"],\"url\":[\"userMessages/bookView\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:18:49', 29);
INSERT INTO `sys_oper_log` VALUES (461, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2031,2032\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:19:05', 14);
INSERT INTO `sys_oper_log` VALUES (462, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', '管理部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,101,103\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:21:18', 17);
INSERT INTO `sys_oper_log` VALUES (463, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2010,2013,2012,2011,2015,2014,2019,2031,2032\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:21:42', 33);
INSERT INTO `sys_oper_log` VALUES (464, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2010', '127.0.0.1', '内网IP', '2010', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', 0, NULL, '2024-10-03 02:22:26', 3);
INSERT INTO `sys_oper_log` VALUES (465, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2013', '127.0.0.1', '内网IP', '2013', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-10-03 02:22:35', 4);
INSERT INTO `sys_oper_log` VALUES (466, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2010\"],\"menuType\":[\"M\"],\"menuName\":[\"查看借阅规则信息\"],\"url\":[\"userMessages/borrowRulesMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:22:44', 12);
INSERT INTO `sys_oper_log` VALUES (467, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2014\"],\"parentId\":[\"2010\"],\"menuType\":[\"M\"],\"menuName\":[\"查看违章信息\"],\"url\":[\"userMessages/violationMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:violationMessage:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:22:54', 11);
INSERT INTO `sys_oper_log` VALUES (468, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2014', '127.0.0.1', '内网IP', '2014', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-10-03 02:22:59', 4);
INSERT INTO `sys_oper_log` VALUES (469, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2019', '127.0.0.1', '内网IP', '2019', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-10-03 02:23:01', 4);
INSERT INTO `sys_oper_log` VALUES (470, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2014', '127.0.0.1', '内网IP', '2014', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-10-03 02:23:13', 14);
INSERT INTO `sys_oper_log` VALUES (471, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2014\"],\"parentId\":[\"2010\"],\"menuType\":[\"M\"],\"menuName\":[\"11\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:23:34', 20);
INSERT INTO `sys_oper_log` VALUES (472, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2014', '127.0.0.1', '内网IP', '2014', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-10-03 02:23:40', 4);
INSERT INTO `sys_oper_log` VALUES (473, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2014', '127.0.0.1', '内网IP', '2014', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-10-03 02:23:51', 5);
INSERT INTO `sys_oper_log` VALUES (474, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2014\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"11\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:24:07', 11);
INSERT INTO `sys_oper_log` VALUES (475, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2014', '127.0.0.1', '内网IP', '2014', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-10-03 02:24:37', 4);
INSERT INTO `sys_oper_log` VALUES (476, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"查看借阅规则信息\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:24:50', 9);
INSERT INTO `sys_oper_log` VALUES (477, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"留言板\"],\"url\":[\"userMessages/messageBoard\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:messageBoard:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:25:54', 16);
INSERT INTO `sys_oper_log` VALUES (478, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"公告信息查询\"],\"url\":[\"userMessages/noticeSelective\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:noticeSelective:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:26:57', 11);
INSERT INTO `sys_oper_log` VALUES (479, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息查询\"],\"url\":[\"userMessages/personalMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:personalMessage:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:27:52', 28);
INSERT INTO `sys_oper_log` VALUES (480, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"违章信息查询\"],\"url\":[\"userMessage/violationMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:violationMessage:view\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:30:23', 16);
INSERT INTO `sys_oper_log` VALUES (481, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2014\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"违章信息查询\"],\"url\":[\"userMessage/violationMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:violationMessage:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:30:52', 11);
INSERT INTO `sys_oper_log` VALUES (482, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"查看借阅规则信息\"],\"url\":[\"userMessages/borrowRulesMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:31:33', 12);
INSERT INTO `sys_oper_log` VALUES (483, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2036\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"违章信息查询\"],\"url\":[\"userMessages/violationMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:violationMessage:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:32:54', 17);
INSERT INTO `sys_oper_log` VALUES (484, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2036\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"违章信息查询\"],\"url\":[\"userMessages/violationMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:violationMessage:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:33:55', 13);
INSERT INTO `sys_oper_log` VALUES (485, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2035\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息查询\"],\"url\":[\"userMessages/userPasonalMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:userPasonalMessage:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:35:35', 12);
INSERT INTO `sys_oper_log` VALUES (486, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', '管理部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"dataScope\":[\"3\"],\"deptIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:37:05', 18);
INSERT INTO `sys_oper_log` VALUES (487, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'POST', 1, 'admin', '管理部门', '/system/user/authRole/insertAuthRole', '127.0.0.1', '内网IP', '{\"userId\":[\"4\"],\"roleIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:37:51', 15);
INSERT INTO `sys_oper_log` VALUES (488, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'POST', 1, 'admin', '管理部门', '/system/user/authRole/insertAuthRole', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"roleIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:37:58', 10);
INSERT INTO `sys_oper_log` VALUES (489, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'POST', 1, 'admin', '管理部门', '/system/user/authRole/insertAuthRole', '127.0.0.1', '内网IP', '{\"userId\":[\"6\"],\"roleIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:38:09', 11);
INSERT INTO `sys_oper_log` VALUES (490, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'POST', 1, 'admin', '管理部门', '/system/user/authRole/insertAuthRole', '127.0.0.1', '内网IP', '{\"userId\":[\"4\"],\"roleIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:38:15', 10);
INSERT INTO `sys_oper_log` VALUES (491, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', '管理部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"dataScope\":[\"3\"],\"deptIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:39:10', 22);
INSERT INTO `sys_oper_log` VALUES (492, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', '管理部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"dataScope\":[\"3\"],\"deptIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:39:42', 12);
INSERT INTO `sys_oper_log` VALUES (493, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', '管理部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"dataScope\":[\"2\"],\"deptIds\":[\"105\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:40:52', 14);
INSERT INTO `sys_oper_log` VALUES (494, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"4\"],\"postName\":[\"普通用户\"],\"postCode\":[\"user\"],\"postSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:41:52', 12);
INSERT INTO `sys_oper_log` VALUES (495, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2032,2033,2034,2035,2036,2031\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:43:19', 15);
INSERT INTO `sys_oper_log` VALUES (496, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2032,2033,2034,2035,2036,2031\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:44:04', 20);
INSERT INTO `sys_oper_log` VALUES (497, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2032\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"图书查看\"],\"url\":[\"userMessages/bookView\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:44:17', 17);
INSERT INTO `sys_oper_log` VALUES (498, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2031\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"查看借阅规则信息\"],\"url\":[\"userMessages/borrowRulesMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:44:23', 35);
INSERT INTO `sys_oper_log` VALUES (499, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"超级管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"超级管理员\"],\"menuIds\":[\"1,2000,2028,2005\"]}', NULL, 1, '不允许操作超级管理员角色', '2024-10-03 02:44:38', 6);
INSERT INTO `sys_oper_log` VALUES (500, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"超级管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"超级管理员\"],\"menuIds\":[\"1,2000,2028,2005\"]}', NULL, 1, '不允许操作超级管理员角色', '2024-10-03 02:44:49', 0);
INSERT INTO `sys_oper_log` VALUES (501, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', '管理部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,101,103,105\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 02:46:11', 14);
INSERT INTO `sys_oper_log` VALUES (502, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"查看个人借阅信息\"],\"url\":[\"userMessages/borrowMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowMessage:view\"],\"orderNum\":[\"7\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 14:22:08', 462);
INSERT INTO `sys_oper_log` VALUES (503, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2014\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"违章信息查询\"],\"url\":[\"userMessage/violationMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:violationMessage:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 17:30:20', 261);
INSERT INTO `sys_oper_log` VALUES (504, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2014\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"违章信息查询\"],\"url\":[\"userMessages/violationMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:violationMessage:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 17:31:14', 64);
INSERT INTO `sys_oper_log` VALUES (505, '书籍归还', 2, 'com.ruoyi.web.controller.book.TBooksController.returnbook()', 'GET', 1, 'admin', '管理部门', '/books/book/returnSelect/1', '127.0.0.1', '内网IP', '1 {}', '\"books/book/returnBook\"', 0, NULL, '2024-10-03 21:44:25', 6933);
INSERT INTO `sys_oper_log` VALUES (506, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-04\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-03 22:43:41', 89);
INSERT INTO `sys_oper_log` VALUES (507, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"查看个人借阅信息\"],\"url\":[\"userMessages/borrowMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowMessage:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-04 23:38:28', 327);
INSERT INTO `sys_oper_log` VALUES (508, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2038\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"查看个人借阅信息\"],\"url\":[\"userMessages/borrowMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowMessage:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-04 23:39:19', 45);
INSERT INTO `sys_oper_log` VALUES (509, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2035\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息查询\"],\"url\":[\"userMessages/userPasonalMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:userPasonalMessage:view\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-04 23:39:37', 137);
INSERT INTO `sys_oper_log` VALUES (510, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2034\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"公告信息查询\"],\"url\":[\"userMessages/noticeSelective\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:noticeSelective:view\"],\"orderNum\":[\"8\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-04 23:39:55', 38);
INSERT INTO `sys_oper_log` VALUES (511, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2031\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"查看借阅规则信息\"],\"url\":[\"userMessages/borrowRulesMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:view\"],\"orderNum\":[\"9\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-04 23:40:33', 42);
INSERT INTO `sys_oper_log` VALUES (512, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2038\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"查看个人借阅信息\"],\"url\":[\"userMessages/borrowMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowMessage:view\"],\"orderNum\":[\"9\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-04 23:40:50', 36);
INSERT INTO `sys_oper_log` VALUES (513, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2036\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"违章信息查询\"],\"url\":[\"userMessages/violationMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:violationMessage:view\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-04 23:41:12', 35);
INSERT INTO `sys_oper_log` VALUES (514, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2032\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"图书查看\"],\"url\":[\"userMessages/bookView\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-04 23:41:31', 30);
INSERT INTO `sys_oper_log` VALUES (515, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2031\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"查看借阅规则信息\"],\"url\":[\"userMessages/borrowRulesMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:view\"],\"orderNum\":[\"9\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-04 23:42:39', 40);
INSERT INTO `sys_oper_log` VALUES (516, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2031\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"查看借阅规则信息\"],\"url\":[\"userMessages/borrowRulesMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:view\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-04 23:43:04', 35);
INSERT INTO `sys_oper_log` VALUES (517, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2036\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"违章信息查询\"],\"url\":[\"userMessages/violationMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:violationMessage:view\"],\"orderNum\":[\"11\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-04 23:43:17', 49);
INSERT INTO `sys_oper_log` VALUES (518, '书籍添加', 1, 'com.ruoyi.web.controller.book.TBooksController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/book/addBook', '127.0.0.1', '内网IP', '{\"name\":[\"战神\"],\"author\":[\"12\"],\"libraryId\":[\"1\"],\"sortId\":[\"9\"],\"position\":[\"南图\"],\"description\":[\"11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-05 11:55:57', 379);
INSERT INTO `sys_oper_log` VALUES (519, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"30\"],\"endDate\":[\"2024-10-05\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-05 13:40:11', 6211447);
INSERT INTO `sys_oper_log` VALUES (520, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{}', NULL, 1, '你的书籍都已归还，请前往继续借阅', '2024-10-05 19:05:23', 18272638);
INSERT INTO `sys_oper_log` VALUES (521, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{}', NULL, 1, '你的书籍都已归还，请前往继续借阅', '2024-10-05 19:10:46', 143964);
INSERT INTO `sys_oper_log` VALUES (522, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"overtimeFee\":[\"3\"],\"bookId\":[\"1\"]}', NULL, 1, '', '2024-10-05 19:13:13', 59041);
INSERT INTO `sys_oper_log` VALUES (523, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"id\":[\"30\"],\"cardId\":[\"1805010202\"],\"overtimeFee\":[\"3\"],\"bookId\":[\"1\"],\"borrowDate\":[\"Sun Sep 29 17:36:01 CST 2024\"],\"endDate\":[\"Tue Oct 01 00:00:00 CST 2024\"]}', NULL, 1, '', '2024-10-05 19:19:32', 170702);
INSERT INTO `sys_oper_log` VALUES (524, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"id\":[\"30\"],\"cardId\":[\"1805010202\"],\"overtimeFee\":[\"3\"],\"bookId\":[\"1\"]}', NULL, 1, '', '2024-10-05 19:24:14', 19128);
INSERT INTO `sys_oper_log` VALUES (525, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"id\":[\"30\"],\"cardId\":[\"1805010202\"],\"overtimeFee\":[\"3\"],\"bookId\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-05 19:30:09', 65011);
INSERT INTO `sys_oper_log` VALUES (526, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"id\":[\"31\"],\"cardId\":[\"1805010202\"],\"overtimeFee\":[\"0\"],\"bookId\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-05 19:38:07', 105225);
INSERT INTO `sys_oper_log` VALUES (527, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'GET', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{}', NULL, 1, '', '2024-10-05 21:46:52', 317);
INSERT INTO `sys_oper_log` VALUES (528, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'GET', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{}', NULL, 1, '', '2024-10-05 21:47:02', 23);
INSERT INTO `sys_oper_log` VALUES (529, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-07\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-05 22:40:21', 191);
INSERT INTO `sys_oper_log` VALUES (530, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"id\":[\"33\"],\"cardId\":[\"1805010202\"],\"overtimeFee\":[\"0\"],\"bookId\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-05 22:49:29', 68);
INSERT INTO `sys_oper_log` VALUES (531, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"id\":[\"32\"],\"cardId\":[\"1805010202\"],\"overtimeFee\":[\"0\"],\"bookId\":[\"30\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-05 23:02:48', 33);
INSERT INTO `sys_oper_log` VALUES (532, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"admin1\"],\"deptName\":[\"管理部门\"],\"phonenumber\":[\"18050996069\"],\"email\":[\"3172298228@qq.com\"],\"loginName\":[\"admin1\"],\"sex\":[\"0\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-05 23:04:47', 48);
INSERT INTO `sys_oper_log` VALUES (533, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', '管理部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-05 23:53:58', 99);
INSERT INTO `sys_oper_log` VALUES (534, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'POST', 1, 'admin', '管理部门', '/system/user/authRole/insertAuthRole', '127.0.0.1', '内网IP', '{\"userId\":[\"6\"],\"roleIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-05 23:55:06', 46);
INSERT INTO `sys_oper_log` VALUES (535, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', '管理部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-06 00:04:05', 13);
INSERT INTO `sys_oper_log` VALUES (536, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2005,2007,2032,2033,2035,2034,2031,2036\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-06 00:04:15', 21);
INSERT INTO `sys_oper_log` VALUES (537, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"6\"],\"deptId\":[\"103\"],\"userName\":[\"zhangsan\"],\"dept.deptName\":[\"管理部门\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"zhangsan\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"1,4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-06 00:07:02', 27);
INSERT INTO `sys_oper_log` VALUES (538, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"7\"],\"deptId\":[\"105\"],\"userName\":[\"admin1\"],\"dept.deptName\":[\"运营部门\"],\"phonenumber\":[\"18050996069\"],\"email\":[\"3172298228@qq.com\"],\"loginName\":[\"admin1\"],\"sex\":[\"0\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"1,4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-06 00:07:43', 27);
INSERT INTO `sys_oper_log` VALUES (539, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'POST', 1, 'admin', '管理部门', '/system/user/authRole/insertAuthRole', '127.0.0.1', '内网IP', '{\"userId\":[\"7\"],\"roleIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-06 16:34:33', 162);
INSERT INTO `sys_oper_log` VALUES (540, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', '管理部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,101,103\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 08:43:59', 118);
INSERT INTO `sys_oper_log` VALUES (541, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2032\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"图书查看\"],\"url\":[\"userMessages/bookView\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:list\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 08:46:06', 36);
INSERT INTO `sys_oper_log` VALUES (542, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2032\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"图书查看\"],\"url\":[\"userMessages/bookView\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 08:47:52', 98);
INSERT INTO `sys_oper_log` VALUES (543, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"图书列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 08:49:37', 17);
INSERT INTO `sys_oper_log` VALUES (544, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2032\"],\"menuType\":[\"F\"],\"menuName\":[\"图书列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 08:50:25', 20);
INSERT INTO `sys_oper_log` VALUES (545, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2032,2040,2033,2035,2034,2031,2036\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 08:50:44', 42);
INSERT INTO `sys_oper_log` VALUES (546, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2036\"],\"menuType\":[\"F\"],\"menuName\":[\"违章信息列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:violationMessage:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 08:52:26', 14);
INSERT INTO `sys_oper_log` VALUES (547, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2040\"],\"parentId\":[\"2032\"],\"menuType\":[\"F\"],\"menuName\":[\"图书列表\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 08:57:10', 25);
INSERT INTO `sys_oper_log` VALUES (548, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2031\"],\"menuType\":[\"F\"],\"menuName\":[\"借阅规则列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 08:57:57', 18);
INSERT INTO `sys_oper_log` VALUES (549, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2041\"],\"parentId\":[\"2036\"],\"menuType\":[\"F\"],\"menuName\":[\"违章信息列表\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:violationMessage:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:00:04', 22);
INSERT INTO `sys_oper_log` VALUES (550, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2036\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"违章信息查询\"],\"url\":[\"userMessages/violationMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:violationMessage:view\"],\"orderNum\":[\"11\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:02:39', 44);
INSERT INTO `sys_oper_log` VALUES (551, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2032,2040,2033,2035,2034,2038,2031,2042,2036,2041\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:03:22', 32);
INSERT INTO `sys_oper_log` VALUES (552, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2038\"],\"menuType\":[\"F\"],\"menuName\":[\"借阅列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowMessage:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:08:06', 123);
INSERT INTO `sys_oper_log` VALUES (553, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2041\"],\"parentId\":[\"2036\"],\"menuType\":[\"F\"],\"menuName\":[\"违章信息列表\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowMessage:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:08:31', 20);
INSERT INTO `sys_oper_log` VALUES (554, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2033\"],\"menuType\":[\"F\"],\"menuName\":[\"留言添加\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:messageBoard:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:09:14', 33);
INSERT INTO `sys_oper_log` VALUES (555, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2032,2040,2033,2044,2035,2034,2038,2043,2031,2042,2036,2041\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:09:47', 68);
INSERT INTO `sys_oper_log` VALUES (556, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2034\"],\"menuType\":[\"F\"],\"menuName\":[\"公告信息列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:notiveSelective:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:10:58', 17);
INSERT INTO `sys_oper_log` VALUES (557, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2032,2040,2033,2044,2035,2034,2045,2038,2043,2031,2042,2036,2041\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:11:15', 42);
INSERT INTO `sys_oper_log` VALUES (558, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2041\"],\"parentId\":[\"2036\"],\"menuType\":[\"F\"],\"menuName\":[\"违章信息列表\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:violationMessage:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:12:11', 18);
INSERT INTO `sys_oper_log` VALUES (559, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2034\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"公告信息查询\"],\"url\":[\"userMessages/noticeSelective\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:noticeSelective:view\"],\"orderNum\":[\"8\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:13:26', 11);
INSERT INTO `sys_oper_log` VALUES (560, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2045\"],\"parentId\":[\"2034\"],\"menuType\":[\"F\"],\"menuName\":[\"公告信息列表\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:notiveSelective:viewNotice\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:17:08', 21);
INSERT INTO `sys_oper_log` VALUES (561, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2034\"],\"menuType\":[\"F\"],\"menuName\":[\"公告列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:notiveSelective:list\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:19:24', 12);
INSERT INTO `sys_oper_log` VALUES (562, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2034\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"公告信息查询\"],\"url\":[\"userMessages/noticeSelective\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:noticeSelective:view\"],\"orderNum\":[\"8\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:19:59', 18);
INSERT INTO `sys_oper_log` VALUES (563, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2032,2040,2033,2044,2035,2034,2045,2046,2038,2043,2031,2042,2036,2041\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:20:34', 26);
INSERT INTO `sys_oper_log` VALUES (564, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2032,2040,2033,2044,2035,2034,2045,2046,2038,2043,2031,2042,2036,2041\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:22:28', 18);
INSERT INTO `sys_oper_log` VALUES (565, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2045', '127.0.0.1', '内网IP', '2045', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-10-08 09:22:46', 10);
INSERT INTO `sys_oper_log` VALUES (566, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2046\"],\"parentId\":[\"2034\"],\"menuType\":[\"F\"],\"menuName\":[\"公告列表\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:notiveSelective:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:23:54', 13);
INSERT INTO `sys_oper_log` VALUES (567, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2046\"],\"parentId\":[\"2034\"],\"menuType\":[\"F\"],\"menuName\":[\"公告列表\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:notiveSelective:list\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:24:34', 12);
INSERT INTO `sys_oper_log` VALUES (568, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2046\"],\"parentId\":[\"2034\"],\"menuType\":[\"F\"],\"menuName\":[\"公告列表\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:notiveSelective:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:29:04', 38);
INSERT INTO `sys_oper_log` VALUES (569, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2032,2040,2033,2044,2035,2034,2045,2046,2038,2043,2031,2042,2036,2041\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:29:16', 24);
INSERT INTO `sys_oper_log` VALUES (570, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2034\"],\"menuType\":[\"F\"],\"menuName\":[\"公告列表1\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:notiveSelective:list\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:30:08', 15);
INSERT INTO `sys_oper_log` VALUES (571, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2046\"],\"parentId\":[\"2034\"],\"menuType\":[\"F\"],\"menuName\":[\"公告视图\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:notiveSelective:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:30:23', 12);
INSERT INTO `sys_oper_log` VALUES (572, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2047\"],\"parentId\":[\"2034\"],\"menuType\":[\"F\"],\"menuName\":[\"公告列表\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:notiveSelective:list\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:30:32', 14);
INSERT INTO `sys_oper_log` VALUES (573, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2032,2040,2033,2044,2035,2034,2045,2046,2047,2038,2043,2031,2042,2036,2041\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 09:30:43', 21);
INSERT INTO `sys_oper_log` VALUES (574, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2036\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人违章信息查询\"],\"url\":[\"userMessages/violationMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:violationMessage:view\"],\"orderNum\":[\"11\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-08 10:16:23', 183);
INSERT INTO `sys_oper_log` VALUES (575, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"图书馆管理\"],\"url\":[\"books/library\"],\"target\":[\"menuItem\"],\"perms\":[\"books:library:view\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-09 14:44:04', 87);
INSERT INTO `sys_oper_log` VALUES (576, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅规则管理\"],\"url\":[\"books/rules\"],\"target\":[\"menuItem\"],\"perms\":[\"books:rules:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-09 14:44:40', 18);
INSERT INTO `sys_oper_log` VALUES (577, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2023\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅信息查询\"],\"url\":[\"books/borrowSelective\"],\"target\":[\"menuItem\"],\"perms\":[\"books:borrowSelective:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-09 14:44:51', 32);
INSERT INTO `sys_oper_log` VALUES (578, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2048\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"图书馆管理\"],\"url\":[\"books/library\"],\"target\":[\"menuItem\"],\"perms\":[\"books:library:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-09 14:59:03', 115);
INSERT INTO `sys_oper_log` VALUES (579, '图书馆添加', 1, 'com.ruoyi.web.controller.book.TLibraryController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/library/add', '127.0.0.1', '内网IP', '{\"name\":[\"栈1\"],\"description\":[\"11\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'is_delete\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\31722\\IdeaProjects\\Ruoyi-master\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\books\\TLibraryMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TLibraryMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_library      ( name,                       description )       values ( ?,                       ? )\r\n### Cause: java.sql.SQLException: Field \'is_delete\' doesn\'t have a default value\n; Field \'is_delete\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'is_delete\' doesn\'t have a default value', '2024-10-09 15:05:46', 127);
INSERT INTO `sys_oper_log` VALUES (580, '图书馆添加', 1, 'com.ruoyi.web.controller.book.TLibraryController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/library/add', '127.0.0.1', '内网IP', '{\"name\":[\"栈1\"],\"description\":[\"11\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'is_delete\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\31722\\IdeaProjects\\Ruoyi-master\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\books\\TLibraryMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TLibraryMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_library      ( name,                       description )       values ( ?,                       ? )\r\n### Cause: java.sql.SQLException: Field \'is_delete\' doesn\'t have a default value\n; Field \'is_delete\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'is_delete\' doesn\'t have a default value', '2024-10-09 15:08:38', 165);
INSERT INTO `sys_oper_log` VALUES (581, '图书馆添加', 1, 'com.ruoyi.web.controller.book.TLibraryController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/library/add', '127.0.0.1', '内网IP', '{\"name\":[\"栈1\"],\"description\":[\"11\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'is_delete\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\31722\\IdeaProjects\\Ruoyi-master\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\books\\TLibraryMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TLibraryMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_library      ( name,                       description )       values ( ?,                       ? )\r\n### Cause: java.sql.SQLException: Field \'is_delete\' doesn\'t have a default value\n; Field \'is_delete\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'is_delete\' doesn\'t have a default value', '2024-10-09 15:10:56', 104);
INSERT INTO `sys_oper_log` VALUES (582, '图书馆添加', 1, 'com.ruoyi.web.controller.book.TLibraryController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/library/add', '127.0.0.1', '内网IP', '{\"name\":[\"栈1\"],\"description\":[\"11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-09 15:12:03', 18);
INSERT INTO `sys_oper_log` VALUES (583, '图书馆删除', 3, 'com.ruoyi.web.controller.book.TLibraryController.remove()', 'POST', 1, 'admin', '管理部门', '/books/library/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'ids\' not found. Available parameters are [arg0, collection, list]', '2024-10-09 15:12:14', 10);
INSERT INTO `sys_oper_log` VALUES (584, '图书馆删除', 3, 'com.ruoyi.web.controller.book.TLibraryController.remove()', 'POST', 1, 'admin', '管理部门', '/books/library/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-09 15:16:33', 88);
INSERT INTO `sys_oper_log` VALUES (585, '书籍添加', 1, 'com.ruoyi.web.controller.book.TBooksController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/book/addBook', '127.0.0.1', '内网IP', '{\"name\":[\"limax\"],\"author\":[\"12\"],\"libraryId\":[\"1\"],\"sortId\":[\"3\"],\"position\":[\"南图\"],\"description\":[\"11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-09 15:23:53', 89);
INSERT INTO `sys_oper_log` VALUES (586, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"31\"],\"endDate\":[\"2024-10-11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-09 15:24:39', 46);
INSERT INTO `sys_oper_log` VALUES (587, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"字典管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-09 15:43:27', 90);
INSERT INTO `sys_oper_log` VALUES (588, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2049\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"字典管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-paint-brush\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-09 15:45:00', 17);
INSERT INTO `sys_oper_log` VALUES (589, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"id\":[\"34\"],\"cardId\":[\"1805010202\"],\"overtimeFee\":[\"0\"],\"bookId\":[\"31\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-09 15:45:33', 42);
INSERT INTO `sys_oper_log` VALUES (590, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2049\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"字典管理\"],\"url\":[\"system/dict\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dict:view\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-paint-brush\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-09 22:23:58', 342);
INSERT INTO `sys_oper_log` VALUES (591, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2049\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"字典管理\"],\"url\":[\"/system/dict\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dict:view\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-paint-brush\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-09 22:24:48', 40);
INSERT INTO `sys_oper_log` VALUES (592, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010203\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-27\"]}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbc.id\' in \'field list\'\r\n### The error may exist in file [C:\\Users\\31722\\IdeaProjects\\Ruoyi-master\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\books\\TBorrowCardMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TBorrowCardMapper.selectByPrimaryKey-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select                   tbc.id, tbc.user_id, tbc.rule_id, tbc.status               from t_borrow_card         where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbc.id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'tbc.id\' in \'field list\'', '2024-10-09 23:29:06', 123);
INSERT INTO `sys_oper_log` VALUES (593, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010206\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-27\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-09 23:34:01', 40);
INSERT INTO `sys_oper_log` VALUES (594, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"借阅图书\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"books:borrow:view\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 08:39:15', 56);
INSERT INTO `sys_oper_log` VALUES (595, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"公告添加\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"books:tnotice:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 08:42:03', 58);
INSERT INTO `sys_oper_log` VALUES (596, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"公告列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"books:tnotice:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 08:42:37', 17);
INSERT INTO `sys_oper_log` VALUES (597, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"公告修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"books:tnotice:edit\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 08:43:01', 24);
INSERT INTO `sys_oper_log` VALUES (598, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"公告删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"books:tnotice:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 08:43:41', 23);
INSERT INTO `sys_oper_log` VALUES (599, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2051\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"公告添加\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"books:tnotice:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 08:43:57', 33);
INSERT INTO `sys_oper_log` VALUES (600, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2053\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"公告修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"books:tnotice:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 08:44:06', 33);
INSERT INTO `sys_oper_log` VALUES (601, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2033\"],\"menuType\":[\"F\"],\"menuName\":[\"查看留言\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:messageBoard:viewmessage\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 08:45:15', 29);
INSERT INTO `sys_oper_log` VALUES (602, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2030\"],\"menuType\":[\"F\"],\"menuName\":[\"报表列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"books:borrowtable:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 08:46:32', 26);
INSERT INTO `sys_oper_log` VALUES (603, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2029\"],\"menuType\":[\"F\"],\"menuName\":[\"报表列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"books:returntable:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 08:46:54', 16);
INSERT INTO `sys_oper_log` VALUES (604, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"ry管理\"],\"deptName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"ry1\"],\"sex\":[\"0\"],\"role\":[\"3\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"3\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 10:55:50', 234);
INSERT INTO `sys_oper_log` VALUES (605, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', '管理部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"图书管理员\"],\"roleKey\":[\"bookmanager\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,101,103\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 10:56:04', 40);
INSERT INTO `sys_oper_log` VALUES (606, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"图书管理员\"],\"roleKey\":[\"bookmanager\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"图书管理员\"],\"menuIds\":[\"2000,2001,2050\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 10:56:12', 50);
INSERT INTO `sys_oper_log` VALUES (607, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"图书管理员\"],\"roleKey\":[\"bookmanager\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"图书管理员\"],\"menuIds\":[\"2000,2001,2039,2050\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 10:56:22', 30);
INSERT INTO `sys_oper_log` VALUES (608, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2032,2040,2033,2044,2035,2034,2045,2046,2047,2038,2043,2031,2042,2036,2041\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 10:56:28', 33);
INSERT INTO `sys_oper_log` VALUES (609, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"图书管理员\"],\"roleKey\":[\"bookmanager\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"图书管理员\"],\"menuIds\":[\"2000,2001,2039,2050,2005,2007,2052,2051,2053,2054\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 10:56:38', 31);
INSERT INTO `sys_oper_log` VALUES (610, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"图书管理员\"],\"roleKey\":[\"bookmanager\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"图书管理员\"],\"menuIds\":[\"2000,2001,2039,2050,2028,2030,2056,2029,2057,2005,2007,2052,2051,2053,2054\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 10:56:46', 48);
INSERT INTO `sys_oper_log` VALUES (611, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"归还图书\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:returnBook\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 10:58:25', 30);
INSERT INTO `sys_oper_log` VALUES (612, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2050\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"借阅图书\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:borrow\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 10:58:44', 45);
INSERT INTO `sys_oper_log` VALUES (613, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"图书管理员\"],\"roleKey\":[\"bookmanager\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"图书管理员\"],\"menuIds\":[\"2000,2001,2039,2050,2058,2028,2030,2056,2029,2057,2005,2007,2052,2051,2053,2054\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 10:59:31', 26);
INSERT INTO `sys_oper_log` VALUES (614, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"图书管理员\"],\"roleKey\":[\"bookmanager\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"图书管理员\"],\"menuIds\":[\"2000,2001,2039,2050,2058,2028,2030,2056,2029,2057,2005,2007,2052,2051,2053,2054,2035\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 11:00:28', 34);
INSERT INTO `sys_oper_log` VALUES (615, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"图书系统开始建设\"],\"detail\":[\"1231\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 14:34:50', 77);
INSERT INTO `sys_oper_log` VALUES (616, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"图书系统开始建设\"],\"detail\":[\"123131\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 14:35:00', 30);
INSERT INTO `sys_oper_log` VALUES (617, '公告添加', 1, 'com.ruoyi.web.controller.book.TNoticeController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/add', '127.0.0.1', '内网IP', '{\"title\":[\"测试4\"],\"detail\":[\"图书系统正在建设\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 14:36:30', 12);
INSERT INTO `sys_oper_log` VALUES (618, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"书籍借阅\"],\"dictType\":[\"book_borrow\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 14:41:57', 29);
INSERT INTO `sys_oper_log` VALUES (619, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"可借阅\"],\"dictValue\":[\"0\"],\"dictType\":[\"book_borrow\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 14:44:37', 44);
INSERT INTO `sys_oper_log` VALUES (620, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已借阅\"],\"dictValue\":[\"1\"],\"dictType\":[\"book_borrow\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 14:45:03', 21);
INSERT INTO `sys_oper_log` VALUES (621, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"31\"],\"dictLabel\":[\"已借出\"],\"dictValue\":[\"1\"],\"dictType\":[\"book_borrow\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 14:46:05', 18);
INSERT INTO `sys_oper_log` VALUES (622, '重置密码', 2, 'com.ruoyi.web.controller.system.SysProfileController.resetPwd()', 'POST', 1, 'zhangsan', '管理部门', '/system/user/profile/resetPwd', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 14:58:09', 67);
INSERT INTO `sys_oper_log` VALUES (623, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2032,2040,2033,2044,2055,2035,2034,2045,2046,2047,2038,2043,2031,2042,2036,2041\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 14:58:58', 48);
INSERT INTO `sys_oper_log` VALUES (624, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-10\"]}', NULL, 1, '该书籍已被借阅', '2024-10-10 23:33:23', 75);
INSERT INTO `sys_oper_log` VALUES (625, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"id\":[\"35\"],\"cardId\":[\"1805010206\"],\"overtimeFee\":[\"0\"],\"bookId\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:33:41', 25);
INSERT INTO `sys_oper_log` VALUES (626, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-10\"]}', NULL, 1, '该书籍已被借阅', '2024-10-10 23:34:56', 14);
INSERT INTO `sys_oper_log` VALUES (627, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"夏洛特烦恼\"],\"author\":[\"夏洛123213\"],\"libraryId\":[\"1\"],\"sortId\":[\"2\"],\"position\":[\"4asdfa23\"],\"description\":[\"我也特烦恼!!!\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:38:09', 14896);
INSERT INTO `sys_oper_log` VALUES (628, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-10\"]}', NULL, 1, '不能超过规则限定的最大借阅数量', '2024-10-10 23:40:12', 19950);
INSERT INTO `sys_oper_log` VALUES (629, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-10\"]}', NULL, 1, '不能超过规则限定的最大借阅数量', '2024-10-10 23:42:08', 5147);
INSERT INTO `sys_oper_log` VALUES (630, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"植发的价格\"],\"author\":[\"江湖老中医\"],\"libraryId\":[\"2\"],\"sortId\":[\"2\"],\"position\":[\"5sdfs1\"],\"description\":[\"详细介绍每植一根发多少钱？\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:48:42', 69);
INSERT INTO `sys_oper_log` VALUES (631, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"植发的价格\"],\"author\":[\"江湖老中医\"],\"libraryId\":[\"2\"],\"sortId\":[\"2\"],\"position\":[\"5sdfs1\"],\"description\":[\"详细介绍每植一根发多少钱？\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:48:48', 6);
INSERT INTO `sys_oper_log` VALUES (632, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"植发的价格\"],\"author\":[\"江湖老中医\"],\"libraryId\":[\"2\"],\"sortId\":[\"2\"],\"position\":[\"5sdfs1\"],\"description\":[\"详细介绍每植一根发多少钱？\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:49:17', 24);
INSERT INTO `sys_oper_log` VALUES (633, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"name\":[\"代码的力量\"],\"author\":[\"明月复苏\"],\"libraryId\":[\"1\"],\"sortId\":[\"3\"],\"position\":[\"234as\"],\"description\":[\"神不知鬼不觉的拔掉你的头发\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:49:27', 12);
INSERT INTO `sys_oper_log` VALUES (634, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"name\":[\"java从入门到入土\"],\"author\":[\"明月复苏\"],\"libraryId\":[\"2\"],\"sortId\":[\"3\"],\"position\":[\"sdfs33\"],\"description\":[\"无简介\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:49:34', 11);
INSERT INTO `sys_oper_log` VALUES (635, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"7\"],\"name\":[\"学习如何跑路\"],\"author\":[\"明月复苏\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"2sdsa\"],\"description\":[\"学习如何跑路\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:49:46', 13);
INSERT INTO `sys_oper_log` VALUES (636, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"8\"],\"name\":[\"美好课设\"],\"author\":[\"匿名\"],\"libraryId\":[\"1\"],\"sortId\":[\"8\"],\"position\":[\"23432s\"],\"description\":[\"做梦\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:49:54', 11);
INSERT INTO `sys_oper_log` VALUES (637, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"9\"],\"name\":[\"中国童话\"],\"author\":[\"刘丽朵\"],\"libraryId\":[\"1\"],\"sortId\":[\"9\"],\"position\":[\"6sdf11\"],\"description\":[\"这是一本给孩子的中国童话故事集。以“非教训的无意思、空灵的幻想、快活的嬉笑、纯净的诗意、悠远的生命体味”为选篇标准，从《搜神记》《太平广记》《聊斋志异》《酉阳杂俎》等近30本经典作品中，精心挑选45篇符合现代审美、适合孩子阅读的故事；故事蕴涵着丰富的想象力与趣味性；用简美的现代语言，全新讲述中国童话故事；搭配符合故事主题的原创古风插画，带孩子进入奇幻浪漫的童话世界。\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:50:01', 22);
INSERT INTO `sys_oper_log` VALUES (638, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:50:09', 14);
INSERT INTO `sys_oper_log` VALUES (639, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"11\"],\"name\":[\"飞鸟集\"],\"author\":[\"拉宾德拉纳特·泰戈尔\"],\"libraryId\":[\"1\"],\"sortId\":[\"10\"],\"position\":[\"23sdf12\"],\"description\":[\"《飞鸟集》是泰戈尔的代表作之一，也是世界上最杰出的诗集之一。白昼和黑夜、溪流和海洋、自由和背叛，都在泰戈尔的笔下合而为一，短小的语句道出了深刻的人生哲理，引领世人探寻真理和智慧的源泉。初读这些诗篇，如同在暴风雨过后的初夏清晨，推开卧室的窗户，看到一个淡泊清透的世界，一切都是那样清新、亮丽，可是其中的韵味却很厚实，耐人寻味。\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:50:20', 10);
INSERT INTO `sys_oper_log` VALUES (640, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"12\"],\"name\":[\"声音中的另一种语言\"],\"author\":[\"伊夫·博纳富瓦\"],\"libraryId\":[\"1\"],\"sortId\":[\"10\"],\"position\":[\"23sdf2\"],\"description\":[\"在本书中，我们会读到这位诗人翻译家从自己的写作和翻译经验出发，对诗及诗的翻译的特殊性与重要性的阐述，对某些诗歌译作的批评，对译者处境与任务的思考，以及对不同语言的诗歌的独特见解……总而言之，在博纳富瓦看来，诗，我们在声音中触及的另一种语言，是存在僭越概念性日常言语，书写生命真实“在场”的语言，诗的语言不同于世上其他一切语言，它斟酌词语，倾听节奏，“一首诗歌（poème）的诗（poésie）以一种声音（voix）的方式走向读者”。诗的翻译是可能的，但不同于其他任何翻译，只能以独特的方式进行：“诗歌唯一需要忠实的是‘在场’”，译者要保留诗意，便要倾听词语的音乐，重新经历诗人用声音勾起的关于“在场”的记忆，用自己的语言和存在经验去重构、去分享原诗的“在场”。诗的翻译应当受到重视，通过诗的翻译，处于两种语言间隙的译者和另一种语言的读者能够对虚幻的概念性言语提出质疑，在进一步自我批评的同时重新思考与异的关系，从而探寻真实的生活与场所，与自己真实的信念相遇。\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:50:27', 26);
INSERT INTO `sys_oper_log` VALUES (641, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"13\"],\"name\":[\"诗经\"],\"author\":[\"孔丘\"],\"libraryId\":[\"1\"],\"sortId\":[\"10\"],\"position\":[\"23sdf3\"],\"description\":[\"这本《诗经》收录全部305篇，每篇诗歌都配有相应的解释及译文，使读者更容易理解\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:50:32', 10);
INSERT INTO `sys_oper_log` VALUES (642, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"14\"],\"name\":[\"海子的诗\"],\"author\":[\"海子\"],\"libraryId\":[\"1\"],\"sortId\":[\"10\"],\"position\":[\"23sdf4\"],\"description\":[\"本书收录了已故诗人海子的诗作精华，其诗以独特的风格深受读者的喜爱，从这些诗中反映出诗人那对于一切美好事物的眷恋之情，对于生命的世俗和崇高的激动和关怀。\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:50:41', 13);
INSERT INTO `sys_oper_log` VALUES (643, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"15\"],\"name\":[\"剧变\"],\"author\":[\"[美] 贾雷德·戴蒙德 \"],\"libraryId\":[\"2\"],\"sortId\":[\"11\"],\"position\":[\"2342sdf\"],\"description\":[\"<p>&nbsp; 《剧变》探讨了一个当前人类社会面临的重大问题：当危机来临时，我们该如何应对？从个人视角而言，危机可以改变一个人的成长轨迹，如处理不当，终其一生会生活在负面情绪中。对于整个人类社会而言，危机可使一种文明没落、一个国家解体、一个时代终结。因此，如何分辨危机、应对危机，避免危机，化危机为机遇，实现个人和整个人类社会的剧变，是人类当下面临的主课题。普利策奖得主、《枪炮、病菌与钢铁》作者戴蒙德再一次发挥其历史叙事的顶级水准，带我们巡礼了各国在历史中的危机应对，并从社会学、心理学、经济学、生物进化等跨学科视角展现了人类自古以来何以应对危机的历史沿革，并谏言国家、企业及整个人类社会如何从个人应对危机的进化逻辑和生理变化中得到启示，以更加多维度的、宽视角地看待危机应对这一关乎人类未来的命题。</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:50:48', 9);
INSERT INTO `sys_oper_log` VALUES (644, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"16\"],\"name\":[\"七个疯子\"],\"author\":[\"罗伯特·阿尔特 \"],\"libraryId\":[\"2\"],\"sortId\":[\"12\"],\"position\":[\"234sae\"],\"description\":[\"<p><span class=\\\"all hidden\\\"></span></p><div class=\\\"intro\\\">    <p>◎ “是我想太多，还是这世界太疯狂？”</p>    <p>◎ 毒丽场域疯子们的“蛮荒故事”，纳粹等现代性之殇的神奇预言</p>    <p>◎ “阿根廷的陀思妥耶夫斯基”，拉美现代小说之父，罗伯特·阿尔特代表作</p>    <p>◎ 马尔克斯、博尔赫斯之先驱，胡里奥·科塔萨尔、罗伯特·波拉尼奥、胡安·卡洛斯·奥内蒂盛赞的伟大作家</p>    <p>——————————</p>    <p>本书是阿根廷著名作家罗伯特·阿尔特的长篇小说代表作，描述男主人公在社会底层挣扎并逐渐走向崩溃的过程。故事集中在三天时间，各色人物纷纷登场，从一件绑架案折射出20世纪20年代阿根廷乃至拉美的社会现实生活。作家以精湛的文笔对主人公进行了大量的心理描摹，并通过主人公的眼睛变形地透视了身边的现实和种种人物，其混乱怪诞之感，正应了魔幻现实主义的画风。有续集《喷火器》。</p>    <p>——————————</p>    <p>阿尔特无疑是一位伟大的作家……他是拉美第一位真正的都市小说家……这就是激发文学创作的力量。——《卫报》</p>    <p>他的视野与布宜诺斯艾利斯那一帮家伙昏暗而偏缘的视野从不可同日而语。——胡里奥·科塔萨尔</p>    <p>阿尔特是阿根廷现代小说之父，他是最重要、最伟大的阿根廷小说家。——里卡多·皮格利亚</p>    <p>如果这些海岸上有人能被称为文学天才的话，那一定是罗伯特·阿尔特……我在谈论一个将在时间长河中留下名字的小说家……难以置信，他还不为当今大众所熟知。——胡安·卡洛斯·奥内蒂</p>    <p>——————————</p>    <p>美洲西班牙语文学的另一重要特征即是它永恒的见证：暴力与不公平的见证，集体与个体的见证，现实与虚构的见证，往昔与现今的见证。在美洲，写作总是兼有诗意与政治的功能，写作从来不是一种无谓的游戏，即便在表面看来最形式化的表达中，它也从不逃遁于幻觉中。</p>    <p>——《理想藏书》</p></div><p></p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:50:58', 32);
INSERT INTO `sys_oper_log` VALUES (645, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"17\"],\"name\":[\"走出唯一真理观\"],\"author\":[\"陈嘉映\"],\"libraryId\":[\"1\"],\"sortId\":[\"13\"],\"position\":[\"234sdfd\"],\"description\":[\"<div class=\\\"intro\\\">    <p>★陈嘉映2007—2018自选文集。</p>    <p>★《何为良好生活》后新作，认真思考，认真表述这些思考，召唤爱思考的人来一道思考。</p>    <p>★在危机与纷争爆发的时代，哲学如何协助我们反思生活。“我们与其说需要共识，不如说需要学会，没有共识的人应该如何一起生存。”</p>    <p>本书是陈嘉映先生选编自己于2007—2018年间所作演讲、访谈与评论结集。</p>    <p>有不同的道，从前有不同的道，现在有不同的道，将来还有不同的道。重要的问题不是找到唯一的道，而是这些不同的道之间怎样呼应，怎样交流，怎样斗争。你要是坚持说，哲学要的就是唯一的真理体系，那我不得不说，哲学已经死了。</p>    <p>哲学，尤其今天的哲学，不是宣教式的，不是上智向下愚宣教。我们之所求，首先不是让别人明白，而是求自己明白。</p>    <p>“我个人想要的是，认真思考，认真表述这些思考，召唤爱思考的人来一道思考。”</p></div>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:51:06', 9);
INSERT INTO `sys_oper_log` VALUES (646, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"18\"],\"name\":[\"人类灭绝之后\"],\"author\":[\"杜格尔·狄克逊\"],\"libraryId\":[\"1\"],\"sortId\":[\"14\"],\"position\":[\"234s\"],\"description\":[\"<p><span 《人类灭绝之后——未来世界动物图鉴》描绘了人类灭绝5000万年之后的动物世界。</p>    <p>本书分为十一个章节，前两章回顾了从生命进化之初到人类出现之后的物种进化历程；中间八章则根据狄克逊天马行空又有理有据的想象，推演出在人类灭绝之后的5000万年地球上，从热带到寒带、从雨林到苔原的动物进化可能，带领读者穿越时空，共同欣赏这颗星球上生命进化的壮观景象；最终章则畅想了在更遥远的未来生命终将归往何处.\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:51:17', 42);
INSERT INTO `sys_oper_log` VALUES (647, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"19\"],\"name\":[\"孩子们的诗\"],\"author\":[\"果麦\"],\"libraryId\":[\"1\"],\"sortId\":[\"10\"],\"position\":[\"sd2342\"],\"description\":[\"<p><span class=\\\"all hidden\\\"><div class=\\\"intro\\\">    <p>书中有灵气的诗句包括但不限于以下：</p>    <p>*我的眼睛／很小很小／有时遇到心事／就连两行泪／也装不下——陈科全， 八岁</p>    <p>*灯把黑夜／烫了一个洞——姜二嫚，七岁</p>    <p>*春天来了／我去小溪边砸冰／把春天砸得头破血流／直淌眼泪——铁头，八岁</p>    <p>*要是笑过了头／你就会飞到天上去／要想回到地面／你必须做一件伤心事——朵朵，五岁</p>    <p>*纸币在飘的时候，我们知道风在算钱。——王子乔，六岁</p>    <p>*你问我出生前在做什么／我答 我在天上挑妈妈——朱尔，八岁</p>    <p>*母亲提水桶／父亲提电脑／我想起／往日他们提着我在街上乱跑——王芗远，十二岁</p>    <p>*树枝想去撕裂天空，但却只戳了几个微小的窟窿，它透出天外的光亮，人们把它叫做月亮和星星。——顾城，十二岁</p>    <p>《孩子们的诗》，精选了七十多首等3－13岁小朋友写的诗。小诗人们来自北京、上海、广东、江苏、山东、广西、福建、内蒙古、新疆等全国各个地方。</p>    <p>从上万首诗作中脱颖而出，它们首先是好诗，其次才是孩子的诗。</p>    <p>本书还邀请了Starry阿星、飞行猴CF、九个妖、木可子、黄雷蕾Linali、苏寒、Lett Yice等二十多位国内知名插画家，为书中每一首诗歌创作了兼具美感与奇趣的插画。</p></div></span></p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:51:24', 10);
INSERT INTO `sys_oper_log` VALUES (648, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"20\"],\"name\":[\"万物静默如谜\"],\"author\":[\"维斯拉瓦•辛波斯卡\"],\"libraryId\":[\"1\"],\"sortId\":[\"10\"],\"position\":[\"5楼1室234\"],\"description\":[\"<div class=\\\"intro\\\">    <p>《辛波斯卡诗选：万物静默如谜》收录辛波斯卡各阶段名作75首，包括激发知名绘本作家幾米创作出《向左走，向右走》的《一见钟情》，收录高中语文教材的《底片》，网上广为流传的《在一颗小星星下》《种种可能》等，曾获得《洛杉矶时报》年度最佳图书。</p>    <p>辛波斯卡的诗取材于日常生活的事物和经验，甲虫、海参、石头、沙粒、天空；安眠药、履历表、衣服；电影、画作、剧场、梦境等等，在她的笔下无不焕发出新的诗意，让人们重新认识生活中常见的事物。</p></div>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:51:29', 10);
INSERT INTO `sys_oper_log` VALUES (649, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"21\"],\"name\":[\"Python编程\"],\"author\":[\"埃里克·马瑟斯\"],\"libraryId\":[\"1\"],\"sortId\":[\"3\"],\"position\":[\"4楼1室234\"],\"description\":[\"<p>本书是一本针对所有层次的Python 读者而作的Python 入门书。全书分两部分：第一部分介绍用Python 编程所必须了解的基本概念，包括matplotlib、NumPy 和Pygal 等强大的Python 库和工具介绍，以及列表、字典、if 语句、类、文件与异常、代码测试等内容；第二部分将理论付诸实践，讲解如何开发三个项目，包括简单的Python 2D 游戏开发如何利用数据生成交互式的信息图，以及创建和定制简单的Web 应用，并帮读者解决常见编程问题和困惑。</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:51:41', 7);
INSERT INTO `sys_oper_log` VALUES (650, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"24\"],\"name\":[\"战斗\"],\"author\":[\"战斗\"],\"libraryId\":[\"2\"],\"sortId\":[\"1\"],\"position\":[\"五楼234\"],\"description\":[\"<p>战斗</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:51:49', 11);
INSERT INTO `sys_oper_log` VALUES (651, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"26\"],\"name\":[\"124\"],\"author\":[\"1243\"],\"libraryId\":[\"1\"],\"sortId\":[\"2\"],\"position\":[\"撒旦法\"],\"description\":[\"撒旦法\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:51:57', 10);
INSERT INTO `sys_oper_log` VALUES (652, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"29\"],\"name\":[\"SKYYYY\"],\"author\":[\"夏洛\"],\"libraryId\":[\"2\"],\"sortId\":[\"5\"],\"position\":[\"4asdfa23\"],\"description\":[\"我也特烦恼!!!\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-10 23:52:04', 20);
INSERT INTO `sys_oper_log` VALUES (653, '书籍添加', 1, 'com.ruoyi.web.controller.book.TBooksController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/book/addBook', '127.0.0.1', '内网IP', '{\"name\":[\"limax\"],\"author\":[\"12\"],\"libraryId\":[\"1\"],\"sortId\":[\"2\"],\"position\":[\"南图\"],\"description\":[\"11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 10:49:51', 113);
INSERT INTO `sys_oper_log` VALUES (654, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"32\"],\"name\":[\"limax\"],\"author\":[\"12\"],\"libraryId\":[\"3\"],\"sortId\":[\"2\"],\"position\":[\"南图\"],\"description\":[\"11334456\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 10:50:43', 40);
INSERT INTO `sys_oper_log` VALUES (655, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBooksController.remove()', 'POST', 1, 'admin', '管理部门', '/books/book/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"32\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 10:51:18', 31);
INSERT INTO `sys_oper_log` VALUES (656, '书籍添加', 1, 'com.ruoyi.web.controller.book.TBookSortController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/booksort/addBookSort', '127.0.0.1', '内网IP', '{\"name\":[\"战神\"],\"description\":[\"11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 10:51:44', 19);
INSERT INTO `sys_oper_log` VALUES (657, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBookSortController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/booksort/edit', '127.0.0.1', '内网IP', '{\"id\":[\"18\"],\"name\":[\"战神\"],\"description\":[\"11334456\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 10:51:54', 11);
INSERT INTO `sys_oper_log` VALUES (658, '书籍删除', 3, 'com.ruoyi.web.controller.book.TBookSortController.remove()', 'POST', 1, 'admin', '管理部门', '/books/booksort/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"18\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 10:51:59', 34);
INSERT INTO `sys_oper_log` VALUES (659, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'ry', '运营部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010203\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 10:54:34', 32);
INSERT INTO `sys_oper_log` VALUES (660, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'ry', '运营部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010203\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-11\"]}', NULL, 1, '该书籍已被借阅', '2024-10-11 10:54:42', 10);
INSERT INTO `sys_oper_log` VALUES (661, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"查询是否逾期\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:returnSelect\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 10:56:37', 31);
INSERT INTO `sys_oper_log` VALUES (662, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"图书管理员\"],\"roleKey\":[\"bookmanager\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"图书管理员\"],\"menuIds\":[\"2000,2001,2039,2050,2058,2059,2028,2030,2056,2029,2057,2005,2007,2052,2051,2053,2054,2035\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 10:56:49', 22);
INSERT INTO `sys_oper_log` VALUES (663, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'ry', '运营部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"id\":[\"36\"],\"cardId\":[\"1805010203\"],\"overtimeFee\":[\"0\"],\"bookId\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 10:57:14', 9);
INSERT INTO `sys_oper_log` VALUES (664, '公告添加', 1, 'com.ruoyi.web.controller.book.TNoticeController.addSave()', 'POST', 1, 'ry', '运营部门', '/books/tnotice/add', '127.0.0.1', '内网IP', '{\"title\":[\"测试3\"],\"detail\":[\"图书系统正在建设\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 10:58:00', 40);
INSERT INTO `sys_oper_log` VALUES (665, '留言删除', 3, 'com.ruoyi.web.controller.book.TNoticeController.remove()', 'POST', 1, 'ry', '运营部门', '/books/tnotice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"12\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 10:58:17', 25);
INSERT INTO `sys_oper_log` VALUES (666, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'zhangsan', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"11213213\"]}', NULL, 1, '', '2024-10-11 10:58:55', 2);
INSERT INTO `sys_oper_log` VALUES (667, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'zhangsan', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"121\"]}', NULL, 1, '', '2024-10-11 10:59:12', 4);
INSERT INTO `sys_oper_log` VALUES (668, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'zhangsan', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"123123\"]}', NULL, 1, '', '2024-10-11 11:03:22', 63);
INSERT INTO `sys_oper_log` VALUES (669, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'zhangsan', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"111\"]}', NULL, 1, '', '2024-10-11 11:04:54', 4);
INSERT INTO `sys_oper_log` VALUES (670, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2044\"],\"parentId\":[\"2033\"],\"menuType\":[\"F\"],\"menuName\":[\"留言添加\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:messageBoard:add\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 11:06:42', 33);
INSERT INTO `sys_oper_log` VALUES (671, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'zhangsan', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"121212\"]}', NULL, 1, '', '2024-10-11 11:07:32', 0);
INSERT INTO `sys_oper_log` VALUES (672, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2032,2040,2033,2044,2055,2035,2034,2045,2046,2047,2038,2043,2031,2042,2036,2041\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 11:09:31', 17);
INSERT INTO `sys_oper_log` VALUES (673, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2044\"],\"parentId\":[\"2033\"],\"menuType\":[\"F\"],\"menuName\":[\"留言添加\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:messageBoard:add\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 11:10:50', 8);
INSERT INTO `sys_oper_log` VALUES (674, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'admin', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"222\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 11:10:59', 32);
INSERT INTO `sys_oper_log` VALUES (675, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'zhangsan', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"111\"]}', NULL, 1, '', '2024-10-11 11:11:20', 10);
INSERT INTO `sys_oper_log` VALUES (676, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2032,2040,2033,2044,2055,2035,2034,2045,2046,2047,2038,2043,2031,2042,2036,2041\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 11:12:50', 21);
INSERT INTO `sys_oper_log` VALUES (677, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2032,2040,2033,2044,2055,2035,2034,2045,2046,2047,2038,2043,2031,2042,2036,2041\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 11:12:55', 23);
INSERT INTO `sys_oper_log` VALUES (678, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-11\"]}', NULL, 1, '该书籍已被借阅', '2024-10-11 11:25:28', 79);
INSERT INTO `sys_oper_log` VALUES (679, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2033\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"留言板\"],\"url\":[\"userMessages/messageBoard\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:messageBoard:add\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 14:55:10', 265);
INSERT INTO `sys_oper_log` VALUES (680, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'admin', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"345356\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 14:56:59', 99949);
INSERT INTO `sys_oper_log` VALUES (681, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'zhangsan', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"12313123123\"]}', NULL, 1, '', '2024-10-11 14:59:29', 133279);
INSERT INTO `sys_oper_log` VALUES (682, '书籍添加', 1, 'com.ruoyi.web.controller.book.TBorrowCardController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/addBorrowCard', '127.0.0.1', '内网IP', '{\"userId\":[\"6\"],\"ruleId\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 15:02:54', 4505);
INSERT INTO `sys_oper_log` VALUES (683, '书籍添加', 1, 'com.ruoyi.web.controller.book.TBorrowCardController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/addBorrowCard', '127.0.0.1', '内网IP', '{\"userId\":[\"6\"],\"ruleId\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 15:04:00', 44439);
INSERT INTO `sys_oper_log` VALUES (684, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2004\"],\"menuType\":[\"F\"],\"menuName\":[\"办理借阅证\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"books:borrowcard:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 15:06:10', 82);
INSERT INTO `sys_oper_log` VALUES (685, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2004,2060,2007,2032,2040,2033,2044,2055,2035,2034,2045,2046,2047,2038,2043,2031,2042,2036,2041\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 15:06:22', 116);
INSERT INTO `sys_oper_log` VALUES (686, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"办理借阅证\"],\"url\":[\"userMessages/borrowCard\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowCard:view\"],\"orderNum\":[\"12\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 15:37:15', 70);
INSERT INTO `sys_oper_log` VALUES (687, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2061\"],\"menuType\":[\"F\"],\"menuName\":[\"办理借阅证\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowCard:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 15:37:51', 13);
INSERT INTO `sys_oper_log` VALUES (688, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2061\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"办理借阅证\"],\"url\":[\"userMessages/borrowCard\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowCard:add\"],\"orderNum\":[\"12\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 16:48:49', 89);
INSERT INTO `sys_oper_log` VALUES (689, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2062\"],\"parentId\":[\"2061\"],\"menuType\":[\"F\"],\"menuName\":[\"办理借阅证\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowCard:add\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 17:26:19', 109);
INSERT INTO `sys_oper_log` VALUES (690, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2061\"],\"menuType\":[\"F\"],\"menuName\":[\"查看个人借阅卡信息\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowCard:viewBorrowCard\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 17:27:12', 40);
INSERT INTO `sys_oper_log` VALUES (691, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2004,2060,2007,2032,2040,2033,2044,2055,2035,2034,2045,2046,2047,2038,2043,2031,2042,2036,2041,2061,2062,2063\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 17:27:23', 29);
INSERT INTO `sys_oper_log` VALUES (692, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'zhangsan', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"121231\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 17:29:50', 58);
INSERT INTO `sys_oper_log` VALUES (693, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2032,2040,2033,2044,2055,2035,2034,2045,2046,2047,2038,2043,2031,2042,2036,2041,2061,2062,2063\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 17:30:55', 34);
INSERT INTO `sys_oper_log` VALUES (694, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2032,2040,2033,2044,2055,2035,2034,2045,2046,2047,2038,2043,2031,2042,2036,2041,2061,2062,2063\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 17:32:15', 36);
INSERT INTO `sys_oper_log` VALUES (695, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"name\":[\"图书馆章程\"],\"author\":[\"明月复苏\"],\"libraryId\":[\"1\"],\"sortId\":[\"5\"],\"position\":[\"234sdfs\"],\"description\":[\"图书馆章程\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 17:35:35', 51);
INSERT INTO `sys_oper_log` VALUES (696, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010225\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 17:35:44', 29);
INSERT INTO `sys_oper_log` VALUES (697, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010225\"],\"bookId\":[\"2\"],\"endDate\":[\"2024-10-12\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-11 17:36:12', 21);
INSERT INTO `sys_oper_log` VALUES (698, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'ry', '运营部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010227\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-12\"]}', NULL, 1, '该书籍已被借阅', '2024-10-12 08:48:30', 81);
INSERT INTO `sys_oper_log` VALUES (699, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'ry', '运营部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010227\"],\"bookId\":[\"3\"],\"endDate\":[\"2024-10-12\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-12 08:49:13', 48);
INSERT INTO `sys_oper_log` VALUES (700, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"查看借阅\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:viewborrow\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-12 08:52:02', 46);
INSERT INTO `sys_oper_log` VALUES (701, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2059\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"查询是否逾期\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:returnSelect\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-12 08:52:17', 21);
INSERT INTO `sys_oper_log` VALUES (702, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"图书管理员\"],\"roleKey\":[\"bookmanager\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"图书管理员\"],\"menuIds\":[\"2000,2001,2039,2050,2058,2064,2059,2028,2030,2056,2029,2057,2005,2007,2052,2051,2053,2054,2035\"]}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'LIMIT 10\' at line 5\r\n### The error may exist in file [C:\\Users\\31722\\IdeaProjects\\Ruoyi-master\\RuoYi-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysRoleMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysRoleMapper.checkRoleNameUnique-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select r.role_id, r.role_name, r.role_key, r.role_sort, r.data_scope, r.status, r.del_flag, r.create_time, r.remark          from sys_role r       where r.role_name=? and r.del_flag = \'0\' limit 1  LIMIT ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'LIMIT 10\' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'LIMIT 10\' at line 5', '2024-10-12 08:52:47', 152);
INSERT INTO `sys_oper_log` VALUES (703, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"图书管理员\"],\"roleKey\":[\"bookmanager\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"图书管理员\"],\"menuIds\":[\"2000,2001,2039,2050,2058,2064,2059,2028,2030,2056,2029,2057,2005,2007,2052,2051,2053,2054,2035\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-12 08:53:04', 47);
INSERT INTO `sys_oper_log` VALUES (704, '重置密码', 2, 'com.ruoyi.web.controller.system.SysProfileController.resetPwd()', 'POST', 1, 'ry', '运营部门', '/system/user/profile/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"loginName\":[\"ry\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-12 08:53:40', 18);
INSERT INTO `sys_oper_log` VALUES (705, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"图书订阅\"],\"url\":[\"books/bookrsshistory\"],\"target\":[\"menuItem\"],\"perms\":[\"books:bookrsshistory:view\"],\"orderNum\":[\"10\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-22 19:21:35', 599);
INSERT INTO `sys_oper_log` VALUES (706, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2065\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"图书订阅\"],\"url\":[\"books/bookrsshistory\"],\"target\":[\"menuItem\"],\"perms\":[\"books:bookrsshistory:view\"],\"orderNum\":[\"8\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-22 19:21:46', 52);
INSERT INTO `sys_oper_log` VALUES (707, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"未上架\"],\"dictValue\":[\"3\"],\"dictType\":[\"book_borrow\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-23 10:07:36', 218);
INSERT INTO `sys_oper_log` VALUES (708, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"32\"],\"dictLabel\":[\"未上架\"],\"dictValue\":[\"2\"],\"dictType\":[\"book_borrow\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-23 10:07:49', 35);
INSERT INTO `sys_oper_log` VALUES (709, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"订阅通知\"],\"url\":[\"books/trssNotification\"],\"target\":[\"menuItem\"],\"perms\":[\"books:trssNotification:view\"],\"orderNum\":[\"9\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-24 15:50:03', 90);
INSERT INTO `sys_oper_log` VALUES (710, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"4\"],\"endDate\":[\"2024-10-27\"]}', NULL, 1, '可借阅时间不可超过规则限制的借阅时间', '2024-10-24 15:55:17', 57);
INSERT INTO `sys_oper_log` VALUES (711, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010202\"],\"bookId\":[\"4\"],\"endDate\":[\"2024-10-25\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-24 15:55:22', 62);
INSERT INTO `sys_oper_log` VALUES (712, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2066\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"订阅通知\"],\"url\":[\"books/bookrsshistory\"],\"target\":[\"menuItem\"],\"perms\":[\"books:bookrsshistory:view\"],\"orderNum\":[\"9\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-24 15:59:28', 20);
INSERT INTO `sys_oper_log` VALUES (713, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2066\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"订阅通知\"],\"url\":[\"books/SubNotificaiton\"],\"target\":[\"menuItem\"],\"perms\":[\"books:SubNotificaiton:view\"],\"orderNum\":[\"9\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-25 11:39:41', 42);
INSERT INTO `sys_oper_log` VALUES (714, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2066\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"订阅通知\"],\"url\":[\"books/SubNotificaiton\"],\"target\":[\"menuItem\"],\"perms\":[\"books:SubNotificaiton:view\"],\"orderNum\":[\"9\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-25 11:40:48', 21);
INSERT INTO `sys_oper_log` VALUES (715, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2066\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"订阅通知\"],\"url\":[\"books/SubNotification\"],\"target\":[\"menuItem\"],\"perms\":[\"books:SubNotification:view\"],\"orderNum\":[\"9\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-25 11:42:23', 45);
INSERT INTO `sys_oper_log` VALUES (716, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-25 13:03:41', 254);
INSERT INTO `sys_oper_log` VALUES (717, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-25 13:05:28', 19);
INSERT INTO `sys_oper_log` VALUES (718, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-25 13:05:42', 12);
INSERT INTO `sys_oper_log` VALUES (719, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-25 13:05:51', 21);
INSERT INTO `sys_oper_log` VALUES (720, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"31\"],\"name\":[\"limax\"],\"author\":[\"12\"],\"libraryId\":[\"1\"],\"sortId\":[\"3\"],\"position\":[\"南图\"],\"description\":[\"11\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-27 16:40:33', 23157);
INSERT INTO `sys_oper_log` VALUES (721, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'admin', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"12312412\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-27 17:06:03', 139597);
INSERT INTO `sys_oper_log` VALUES (722, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"31\"],\"name\":[\"limax\"],\"author\":[\"12\"],\"libraryId\":[\"1\"],\"sortId\":[\"3\"],\"position\":[\"南图\"],\"description\":[\"11\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-27 19:51:34', 74568);
INSERT INTO `sys_oper_log` VALUES (723, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBorrowCardController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1805010202\"],\"userId\":[\"1\"],\"ruleId\":[\"7\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-27 20:06:50', 59);
INSERT INTO `sys_oper_log` VALUES (724, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010228\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-10-28\"]}', NULL, 1, '该书籍已被借阅', '2024-10-27 20:49:16', 10889);
INSERT INTO `sys_oper_log` VALUES (725, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"订阅图书\"],\"url\":[\"books/book\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:addNotification\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-27 21:12:23', 333);
INSERT INTO `sys_oper_log` VALUES (726, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2067\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"订阅图书\"],\"url\":[\"books/book\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:addNotification\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-27 21:12:51', 176);
INSERT INTO `sys_oper_log` VALUES (727, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2067\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"订阅图书\"],\"url\":[\"books/book\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:addNotification\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-27 21:13:06', 163);
INSERT INTO `sys_oper_log` VALUES (728, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2067', '127.0.0.1', '内网IP', '2067', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-27 21:13:13', 172);
INSERT INTO `sys_oper_log` VALUES (729, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"订阅图书\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:addNotification\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-27 21:13:36', 131);
INSERT INTO `sys_oper_log` VALUES (730, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2068\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"订阅图书\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:notification\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-27 21:14:29', 218);
INSERT INTO `sys_oper_log` VALUES (731, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"读者留言\"],\"url\":[\"books/messageBoard\"],\"target\":[\"menuItem\"],\"perms\":[\"books:messageBoard:view\"],\"orderNum\":[\"7\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-28 10:58:11', 171);
INSERT INTO `sys_oper_log` VALUES (732, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-28 11:56:20', 452);
INSERT INTO `sys_oper_log` VALUES (733, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-28 11:56:54', 20);
INSERT INTO `sys_oper_log` VALUES (734, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"31\"],\"name\":[\"limax\"],\"author\":[\"12\"],\"libraryId\":[\"1\"],\"sortId\":[\"3\"],\"position\":[\"南图\"],\"description\":[\"11\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-28 12:49:43', 337);
INSERT INTO `sys_oper_log` VALUES (735, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"30\"],\"name\":[\"战神\"],\"author\":[\"12\"],\"libraryId\":[\"1\"],\"sortId\":[\"9\"],\"position\":[\"南图\"],\"description\":[\"11\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-28 12:49:47', 12);
INSERT INTO `sys_oper_log` VALUES (736, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"29\"],\"name\":[\"SKYYYY\"],\"author\":[\"夏洛\"],\"libraryId\":[\"2\"],\"sortId\":[\"5\"],\"position\":[\"4asdfa23\"],\"description\":[\"我也特烦恼!!!\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-28 12:49:57', 30);
INSERT INTO `sys_oper_log` VALUES (737, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"11\"],\"deptId\":[\"\"],\"userName\":[\"王明\"],\"dept.deptName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"王明\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-28 15:45:07', 664);
INSERT INTO `sys_oper_log` VALUES (738, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"10\"],\"deptId\":[\"\"],\"userName\":[\"测试3\"],\"dept.deptName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"测试3\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-28 15:45:12', 45);
INSERT INTO `sys_oper_log` VALUES (739, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"9\"],\"deptId\":[\"\"],\"userName\":[\"111\"],\"dept.deptName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"111\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-28 15:45:23', 49);
INSERT INTO `sys_oper_log` VALUES (740, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2001,2039,2050,2058,2064,2059,2068,2007,2032,2040,2033,2044,2055,2035,2034,2045,2046,2047,2038,2043,2031,2042,2036,2041,2061,2062,2063\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-28 15:51:46', 60);
INSERT INTO `sys_oper_log` VALUES (741, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2060', '127.0.0.1', '内网IP', '2060', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-29 15:41:11', 228);
INSERT INTO `sys_oper_log` VALUES (742, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2032\"],\"menuType\":[\"F\"],\"menuName\":[\"图书借阅\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:borrow\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-29 15:41:35', 29);
INSERT INTO `sys_oper_log` VALUES (743, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2032\"],\"menuType\":[\"F\"],\"menuName\":[\"图书归还\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:returnBook\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-29 15:42:08', 18);
INSERT INTO `sys_oper_log` VALUES (744, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2032\"],\"menuType\":[\"F\"],\"menuName\":[\"归还判断\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:returnSelect\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-29 15:42:35', 65);
INSERT INTO `sys_oper_log` VALUES (745, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2072\"],\"parentId\":[\"2032\"],\"menuType\":[\"F\"],\"menuName\":[\"归还判断\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:returnSelect\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-29 15:42:42', 28);
INSERT INTO `sys_oper_log` VALUES (746, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2032\"],\"menuType\":[\"F\"],\"menuName\":[\"图书订阅\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:notification\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-29 15:43:16', 53);
INSERT INTO `sys_oper_log` VALUES (747, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'admin', '管理部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"系统管理员\"],\"phonenumber\":[\"19898988989\"],\"email\":[\"ry@163.com\"],\"sex\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-29 15:43:46', 44);
INSERT INTO `sys_oper_log` VALUES (748, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2032,2040,2070,2071,2072,2073,2033,2044,2055,2035,2034,2045,2046,2047,2038,2043,2031,2042,2036,2041,2061,2062,2063\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-29 15:46:14', 74);
INSERT INTO `sys_oper_log` VALUES (749, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2032,2040,2070,2071,2072,2073,2033,2044,2055,2035,2034,2045,2046,2047,2038,2043,2031,2042,2036,2041,2061,2062,2063\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-29 15:46:24', 83);
INSERT INTO `sys_oper_log` VALUES (750, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"图书管理员\"],\"roleKey\":[\"bookmanager\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"图书管理员\"],\"menuIds\":[\"2000,2001,2039,2050,2058,2064,2059,2068,2028,2030,2056,2029,2057,2005,2007,2052,2051,2053,2054,2035\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-29 15:46:55', 42);
INSERT INTO `sys_oper_log` VALUES (751, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2061\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"办理借阅证\"],\"url\":[\"userMessages/borrowCard\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowCard:add\"],\"orderNum\":[\"12\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 09:17:46', 130);
INSERT INTO `sys_oper_log` VALUES (752, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2061\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"办理借阅证\"],\"url\":[\"userMessages/borrowCard\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowCard:view\"],\"orderNum\":[\"12\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 09:19:48', 54);
INSERT INTO `sys_oper_log` VALUES (753, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2061\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"办理借阅证\"],\"url\":[\"userMessages/borrowCard\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowCard:add\"],\"orderNum\":[\"12\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 09:22:36', 31);
INSERT INTO `sys_oper_log` VALUES (754, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2061\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人借阅证\"],\"url\":[\"userMessages/borrowCard\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowCard:viewBorrowCard\"],\"orderNum\":[\"12\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 09:50:33', 25);
INSERT INTO `sys_oper_log` VALUES (755, '书籍借阅', 1, 'com.ruoyi.web.controller.usermassage.BookViewController.save()', 'POST', 1, '王明', NULL, '/userMessages/bookView/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010229\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-11-01\"]}', NULL, 1, '该书籍已被借阅', '2024-10-30 10:07:47', 8216);
INSERT INTO `sys_oper_log` VALUES (756, '书籍借阅', 1, 'com.ruoyi.web.controller.usermassage.BookViewController.save()', 'POST', 1, '王明', NULL, '/userMessages/bookView/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010229\"],\"bookId\":[\"5\"],\"endDate\":[\"2024-11-02\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 10:08:08', 54);
INSERT INTO `sys_oper_log` VALUES (757, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2061\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人借阅证\"],\"url\":[\"userMessages/borrowCard\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowCard:viewBorrowCard\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 10:15:24', 43);
INSERT INTO `sys_oper_log` VALUES (758, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2032\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"图书查看\"],\"url\":[\"userMessages/bookView\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 10:15:41', 15);
INSERT INTO `sys_oper_log` VALUES (759, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2062', '127.0.0.1', '内网IP', '2062', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-10-30 10:16:06', 8);
INSERT INTO `sys_oper_log` VALUES (760, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2033\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"留言板\"],\"url\":[\"userMessages/messageBoard\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:messageBoard:add\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 10:16:19', 11);
INSERT INTO `sys_oper_log` VALUES (761, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2035\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息查询\"],\"url\":[\"userMessages/userPasonalMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:userPasonalMessage:view\"],\"orderNum\":[\"8\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 10:16:41', 13);
INSERT INTO `sys_oper_log` VALUES (762, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2035\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息\"],\"url\":[\"userMessages/userPasonalMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:userPasonalMessage:view\"],\"orderNum\":[\"8\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 10:16:51', 13);
INSERT INTO `sys_oper_log` VALUES (763, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2034\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"公告信息\"],\"url\":[\"userMessages/noticeSelective\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:noticeSelective:view\"],\"orderNum\":[\"8\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 10:16:59', 16);
INSERT INTO `sys_oper_log` VALUES (764, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2038\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人借阅\"],\"url\":[\"userMessages/borrowMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowMessage:view\"],\"orderNum\":[\"9\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 10:17:09', 13);
INSERT INTO `sys_oper_log` VALUES (765, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2031\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅规则\"],\"url\":[\"userMessages/borrowRulesMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:view\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 10:17:19', 12);
INSERT INTO `sys_oper_log` VALUES (766, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2036\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人违章信息\"],\"url\":[\"userMessages/violationMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:violationMessage:view\"],\"orderNum\":[\"11\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 10:17:26', 16);
INSERT INTO `sys_oper_log` VALUES (767, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2038\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人借阅\"],\"url\":[\"userMessages/borrowMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowMessage:view\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 10:17:45', 28);
INSERT INTO `sys_oper_log` VALUES (768, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2031\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅规则\"],\"url\":[\"userMessages/borrowRulesMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:view\"],\"orderNum\":[\"11\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 10:17:54', 14);
INSERT INTO `sys_oper_log` VALUES (769, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2031\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅规则\"],\"url\":[\"userMessages/borrowRulesMessage\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:borrowRulesMessage:view\"],\"orderNum\":[\"12\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 10:18:18', 13);
INSERT INTO `sys_oper_log` VALUES (770, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, '王明', NULL, '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"12312313\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 10:55:57', 21351);
INSERT INTO `sys_oper_log` VALUES (771, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, '王明', NULL, '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"context\":[\"1231232222\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 10:57:58', 72749);
INSERT INTO `sys_oper_log` VALUES (772, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, '王明', NULL, '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"content\":[\"书很不错哦！！！\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 10:58:37', 6010);
INSERT INTO `sys_oper_log` VALUES (773, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 11:21:33', 8682);
INSERT INTO `sys_oper_log` VALUES (774, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"31\"],\"name\":[\"limax\"],\"author\":[\"12\"],\"libraryId\":[\"1\"],\"sortId\":[\"3\"],\"position\":[\"南图\"],\"description\":[\"11\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 11:30:35', 143599);
INSERT INTO `sys_oper_log` VALUES (775, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"29\"],\"name\":[\"SKYYYY\"],\"author\":[\"夏洛\"],\"libraryId\":[\"2\"],\"sortId\":[\"5\"],\"position\":[\"4asdfa23\"],\"description\":[\"我也特烦恼!!!\"],\"status\":[\"0\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'t_book_rss_history.PRIMARY\'\r\n### The error may exist in file [C:\\Users\\31722\\IdeaProjects\\Ruoyi-master\\RuoYi-master\\ruoyi-admin\\target\\classes\\mapper\\books\\TBookRssHistoryMapper.xml]\r\n### The error may involve com.ruoyi.web.mapper.TBookRssHistoryMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_book_rss_history          ( id,                                           book_id,                                           user_id )           values ( ?,                                           ?,                                           ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'t_book_rss_history.PRIMARY\'\n; Duplicate entry \'10\' for key \'t_book_rss_history.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'t_book_rss_history.PRIMARY\'', '2024-10-30 11:43:25', 469507);
INSERT INTO `sys_oper_log` VALUES (776, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"29\"],\"name\":[\"SKYYYY\"],\"author\":[\"夏洛\"],\"libraryId\":[\"2\"],\"sortId\":[\"5\"],\"position\":[\"4asdfa23\"],\"description\":[\"我也特烦恼!!!\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 11:54:14', 71990);
INSERT INTO `sys_oper_log` VALUES (777, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"9\"],\"name\":[\"中国童话\"],\"author\":[\"刘丽朵\"],\"libraryId\":[\"1\"],\"sortId\":[\"9\"],\"position\":[\"6sdf11\"],\"description\":[\"这是一本给孩子的中国童话故事集。以“非教训的无意思、空灵的幻想、快活的嬉笑、纯净的诗意、悠远的生命体味”为选篇标准，从《搜神记》《太平广记》《聊斋志异》《酉阳杂俎》等近30本经典作品中，精心挑选45篇符合现代审美、适合孩子阅读的故事；故事蕴涵着丰富的想象力与趣味性；用简美的现代语言，全新讲述中国童话故事；搭配符合故事主题的原创古风插画，带孩子进入奇幻浪漫的童话世界。\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 11:55:05', 16);
INSERT INTO `sys_oper_log` VALUES (778, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"8\"],\"name\":[\"美好课设\"],\"author\":[\"匿名\"],\"libraryId\":[\"1\"],\"sortId\":[\"8\"],\"position\":[\"23432s\"],\"description\":[\"做梦\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 11:55:12', 10);
INSERT INTO `sys_oper_log` VALUES (779, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"30\"],\"name\":[\"战神\"],\"author\":[\"12\"],\"libraryId\":[\"1\"],\"sortId\":[\"9\"],\"position\":[\"南图\"],\"description\":[\"11\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-30 11:57:20', 48508);
INSERT INTO `sys_oper_log` VALUES (780, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"cardId\":[\"1805010229\"],\"userName\":[\"王明\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-11-01\"]}', NULL, 1, '该书籍已被借阅', '2024-10-31 15:31:48', 2880);
INSERT INTO `sys_oper_log` VALUES (781, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"id\":[\"37\"],\"cardId\":[\"1805010225\"],\"overtimeFee\":[\"0\"],\"bookId\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-31 20:00:24', 4653);
INSERT INTO `sys_oper_log` VALUES (782, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"id\":[\"38\"],\"cardId\":[\"1805010225\"],\"overtimeFee\":[\"0\"],\"bookId\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-31 20:06:01', 62575);
INSERT INTO `sys_oper_log` VALUES (783, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"植发的价格\"],\"author\":[\"江湖老中医\"],\"libraryId\":[\"2\"],\"sortId\":[\"2\"],\"position\":[\"5sdfs1\"],\"description\":[\"详细介绍每植一根发多少钱？\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-31 20:06:33', 12758);
INSERT INTO `sys_oper_log` VALUES (784, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"图书管理员\"],\"cardId\":[\"1805010220\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-11-15\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-31 20:15:25', 1978);
INSERT INTO `sys_oper_log` VALUES (785, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2032\"],\"menuType\":[\"F\"],\"menuName\":[\"查看借阅\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:view\"],\"orderNum\":[\"7\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-31 20:27:22', 47);
INSERT INTO `sys_oper_log` VALUES (786, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2074\"],\"parentId\":[\"2032\"],\"menuType\":[\"F\"],\"menuName\":[\"查看借阅\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:viewborrow\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-31 20:29:37', 26);
INSERT INTO `sys_oper_log` VALUES (787, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2061,2062,2063,2032,2040,2070,2071,2072,2073,2074,2033,2044,2055,2035,2034,2045,2046,2047,2038,2043,2036,2041,2031,2042\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-31 20:30:03', 39);
INSERT INTO `sys_oper_log` VALUES (788, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2061,2062,2063,2032,2040,2070,2071,2072,2073,2074,2033,2044,2055,2035,2034,2045,2046,2047,2038,2043,2036,2041,2031,2042\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-31 20:30:36', 35);
INSERT INTO `sys_oper_log` VALUES (789, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'POST', 1, 'admin', '管理部门', '/system/user/authRole/insertAuthRole', '127.0.0.1', '内网IP', '{\"userId\":[\"6\"],\"roleIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-10-31 20:30:57', 12);
INSERT INTO `sys_oper_log` VALUES (790, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'admin', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"content\":[\"222q\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-08 15:35:44', 212);
INSERT INTO `sys_oper_log` VALUES (791, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"系统管理员\"],\"cardId\":[\"1805010228\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-11-12\"]}', NULL, 1, '该书籍已被借阅', '2024-11-08 15:36:59', 32);
INSERT INTO `sys_oper_log` VALUES (792, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"系统管理员\"],\"cardId\":[\"1805010228\"],\"bookId\":[\"2\"],\"endDate\":[\"2024-11-13\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-08 15:37:14', 56);
INSERT INTO `sys_oper_log` VALUES (793, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"id\":[\"43\"],\"cardId\":[\"1805010228\"],\"overtimeFee\":[\"0\"],\"bookId\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-08 15:38:14', 50);
INSERT INTO `sys_oper_log` VALUES (794, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"系统管理员\"],\"cardId\":[\"1805010228\"],\"bookId\":[\"8\"],\"endDate\":[\"2024-11-11\"]}', NULL, 1, '不能超过规则限定的最大借阅数量', '2024-11-08 15:44:53', 20);
INSERT INTO `sys_oper_log` VALUES (795, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"系统管理员\"],\"cardId\":[\"1805010228\"],\"bookId\":[\"8\"],\"endDate\":[\"2024-11-09\"]}', NULL, 1, '不能超过规则限定的最大借阅数量', '2024-11-08 15:44:59', 13);
INSERT INTO `sys_oper_log` VALUES (796, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"系统管理员\"],\"cardId\":[\"1805010221\"],\"bookId\":[\"6\"],\"endDate\":[\"2024-11-13\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-08 15:46:25', 35);
INSERT INTO `sys_oper_log` VALUES (797, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"id\":[\"40\"],\"cardId\":[\"1805010202\"],\"overtimeFee\":[\"13\"],\"bookId\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-08 15:50:34', 26);
INSERT INTO `sys_oper_log` VALUES (798, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2028\"],\"menuType\":[\"C\"],\"menuName\":[\"书籍借阅报表\"],\"url\":[\"books/borrowtable/charts\"],\"target\":[\"menuItem\"],\"perms\":[\"books:borrowtable:show\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-12 15:28:50', 739);
INSERT INTO `sys_oper_log` VALUES (799, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2075\"],\"parentId\":[\"2028\"],\"menuType\":[\"C\"],\"menuName\":[\"书籍借阅报表\"],\"url\":[\"books/borrowtable\"],\"target\":[\"menuItem\"],\"perms\":[\"books:borrowtable:show\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-12 15:29:20', 103);
INSERT INTO `sys_oper_log` VALUES (800, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"敏感词管理\"],\"url\":[\"books/illegal\"],\"target\":[\"menuItem\"],\"perms\":[\"books:illegal:view\"],\"orderNum\":[\"9\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-13 10:35:24', 140);
INSERT INTO `sys_oper_log` VALUES (801, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2076\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"敏感词管理\"],\"url\":[\"books/illegal\"],\"target\":[\"menuItem\"],\"perms\":[\"books:illegal:view\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-13 10:35:37', 23);
INSERT INTO `sys_oper_log` VALUES (802, '书籍添加', 1, 'com.ruoyi.web.controller.book.TBooksController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/book/addBook', '127.0.0.1', '内网IP', '{\"name\":[\"limax11\"],\"author\":[\"12\"],\"libraryId\":[\"1\"],\"sortId\":[\"3\"],\"position\":[\"南图\"],\"description\":[\"11334456\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-13 10:36:01', 23);
INSERT INTO `sys_oper_log` VALUES (803, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"系统管理员\"],\"cardId\":[\"1805010202\"],\"bookId\":[\"2\"],\"endDate\":[\"2024-11-15\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-13 10:36:17', 56);
INSERT INTO `sys_oper_log` VALUES (804, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"id\":[\"45\"],\"cardId\":[\"1805010202\"],\"overtimeFee\":[\"0\"],\"bookId\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-13 10:36:25', 70);
INSERT INTO `sys_oper_log` VALUES (805, '借阅规则添加', 1, 'com.ruoyi.web.controller.book.TRulesController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/rules/addRules', '127.0.0.1', '内网IP', '{\"rulesName\":[\"测试8\"],\"borrowNum\":[\"11\"],\"limitDay\":[\"2\"],\"borrowLibrary\":[\"1,2,3\"],\"overtimeFee\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-13 10:38:05', 14);
INSERT INTO `sys_oper_log` VALUES (806, '规则修改', 2, 'com.ruoyi.web.controller.book.TRulesController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"9\"],\"rulesName\":[\"测试8\"],\"borrowNum\":[\"5\"],\"limitDay\":[\"3\"],\"borrowLibrary\":[\"1,2,3\"],\"overtimeFee\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-13 10:38:17', 14);
INSERT INTO `sys_oper_log` VALUES (807, '书籍导出', 5, 'com.ruoyi.web.controller.book.TBooksController.export()', 'POST', 1, 'admin', '管理部门', '/books/book/export', '127.0.0.1', '内网IP', '{\"name\":[\"\"],\"author\":[\"\"],\"description\":[\"\"],\"position\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', NULL, 1, '导出Excel失败，请联系网站管理员！', '2024-11-13 11:32:21', 27302);
INSERT INTO `sys_oper_log` VALUES (808, '书籍导出', 5, 'com.ruoyi.web.controller.book.TBooksController.export()', 'POST', 1, 'admin', '管理部门', '/books/book/export', '127.0.0.1', '内网IP', '{\"name\":[\"\"],\"author\":[\"\"],\"description\":[\"\"],\"position\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', NULL, 1, '导出Excel失败，请联系网站管理员！', '2024-11-13 11:32:38', 382);
INSERT INTO `sys_oper_log` VALUES (809, '书籍导出', 5, 'com.ruoyi.web.controller.book.TBorrowCardController.export()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/export', '127.0.0.1', '内网IP', '{\"userId\":[\"\"],\"ruleId\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"7fec309e-928d-4c6e-929b-3e2c73025b64_借阅卡记录.xlsx\",\"code\":0}', 0, NULL, '2024-11-13 11:51:47', 306);
INSERT INTO `sys_oper_log` VALUES (810, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '管理部门', '/system/menu/remove/2075', '127.0.0.1', '内网IP', '2075', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-14 16:41:57', 92);
INSERT INTO `sys_oper_log` VALUES (811, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBorrowCardController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1805010204\"],\"userId\":[\"2\"],\"ruleId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-15 21:13:04', 571);
INSERT INTO `sys_oper_log` VALUES (812, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBorrowCardController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1805010205\"],\"userId\":[\"1\"],\"ruleId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-15 21:13:10', 93);
INSERT INTO `sys_oper_log` VALUES (813, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBorrowCardController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1805010206\"],\"userId\":[\"2\"],\"ruleId\":[\"6\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-15 21:13:16', 11);
INSERT INTO `sys_oper_log` VALUES (814, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBorrowCardController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1805010207\"],\"userId\":[\"2\"],\"ruleId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-15 21:13:19', 12);
INSERT INTO `sys_oper_log` VALUES (815, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBorrowCardController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1805010208\"],\"userId\":[\"2\"],\"ruleId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-15 21:13:23', 10);
INSERT INTO `sys_oper_log` VALUES (816, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBorrowCardController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/borrowcard/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1805010210\"],\"userId\":[\"2\"],\"ruleId\":[\"1\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-15 21:13:31', 12);
INSERT INTO `sys_oper_log` VALUES (817, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"ry3\"],\"deptName\":[\"\"],\"phonenumber\":[\"18029049090\"],\"email\":[\"\"],\"loginName\":[\"ry3\"],\"sex\":[\"0\"],\"role\":[\"3\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"3\"],\"postIds\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-15 21:18:14', 60);
INSERT INTO `sys_oper_log` VALUES (818, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-16 19:40:20', 104);
INSERT INTO `sys_oper_log` VALUES (819, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-16 19:40:26', 23);
INSERT INTO `sys_oper_log` VALUES (820, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-16 19:41:53', 14);
INSERT INTO `sys_oper_log` VALUES (821, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-16 19:41:57', 24);
INSERT INTO `sys_oper_log` VALUES (822, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-16 19:42:44', 11);
INSERT INTO `sys_oper_log` VALUES (823, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-16 19:42:48', 41);
INSERT INTO `sys_oper_log` VALUES (824, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-16 20:33:43', 16);
INSERT INTO `sys_oper_log` VALUES (825, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"8\"],\"name\":[\"美好课设\"],\"author\":[\"匿名\"],\"libraryId\":[\"1\"],\"sortId\":[\"8\"],\"position\":[\"23432s\"],\"description\":[\"做梦\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-16 20:40:34', 150152);
INSERT INTO `sys_oper_log` VALUES (826, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-16 20:45:12', 49);
INSERT INTO `sys_oper_log` VALUES (827, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-16 20:45:42', 34);
INSERT INTO `sys_oper_log` VALUES (828, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-16 20:52:29', 380772);
INSERT INTO `sys_oper_log` VALUES (829, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-16 20:56:11', 289);
INSERT INTO `sys_oper_log` VALUES (830, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"33\"],\"name\":[\"limax11\"],\"author\":[\"12\"],\"libraryId\":[\"1\"],\"sortId\":[\"3\"],\"position\":[\"南图\"],\"description\":[\"11334456\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-16 20:56:20', 41);
INSERT INTO `sys_oper_log` VALUES (831, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"31\"],\"name\":[\"limax\"],\"author\":[\"12\"],\"libraryId\":[\"1\"],\"sortId\":[\"3\"],\"position\":[\"南图\"],\"description\":[\"11\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-16 20:56:27', 24);
INSERT INTO `sys_oper_log` VALUES (832, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"name\":[\"人生删除事务所\"],\"author\":[\"本多孝好\"],\"libraryId\":[\"1\"],\"sortId\":[\"7\"],\"position\":[\"22sdf1\"],\"description\":[\"你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-16 20:56:44', 63);
INSERT INTO `sys_oper_log` VALUES (833, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"9\"],\"name\":[\"中国童话\"],\"author\":[\"刘丽朵\"],\"libraryId\":[\"1\"],\"sortId\":[\"9\"],\"position\":[\"6sdf11\"],\"description\":[\"这是一本给孩子的中国童话故事集。以“非教训的无意思、空灵的幻想、快活的嬉笑、纯净的诗意、悠远的生命体味”为选篇标准，从《搜神记》《太平广记》《聊斋志异》《酉阳杂俎》等近30本经典作品中，精心挑选45篇符合现代审美、适合孩子阅读的故事；故事蕴涵着丰富的想象力与趣味性；用简美的现代语言，全新讲述中国童话故事；搭配符合故事主题的原创古风插画，带孩子进入奇幻浪漫的童话世界。\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-16 20:57:41', 17807);
INSERT INTO `sys_oper_log` VALUES (834, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"30\"],\"name\":[\"战神\"],\"author\":[\"12\"],\"libraryId\":[\"1\"],\"sortId\":[\"9\"],\"position\":[\"南图\"],\"description\":[\"11\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-16 21:42:15', 99);
INSERT INTO `sys_oper_log` VALUES (835, '归还报表导出', 5, 'com.ruoyi.web.controller.book.TReturnTableController.export()', 'POST', 1, 'admin', '管理部门', '/books/returntable/export', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"bookId\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"5766507b-70e3-455a-a911-3cced3a8ee36_借阅报表数据.xlsx\",\"code\":0}', 0, NULL, '2024-11-18 14:56:08', 1252);
INSERT INTO `sys_oper_log` VALUES (836, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"系统管理员\"],\"cardId\":[\"1805010230\"],\"bookId\":[\"4\"],\"endDate\":[\"2024-11-20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-19 10:24:05', 201);
INSERT INTO `sys_oper_log` VALUES (837, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"id\":[\"46\"],\"cardId\":[\"1805010230\"],\"overtimeFee\":[\"0\"],\"bookId\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-19 10:24:29', 30);
INSERT INTO `sys_oper_log` VALUES (838, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"系统管理员\"],\"cardId\":[\"1805010230\"],\"bookId\":[\"4\"],\"endDate\":[\"2024-11-20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-19 10:25:17', 33);
INSERT INTO `sys_oper_log` VALUES (839, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"id\":[\"47\"],\"cardId\":[\"1805010230\"],\"overtimeFee\":[\"0\"],\"bookId\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-19 10:25:39', 42);
INSERT INTO `sys_oper_log` VALUES (840, '留言添加', 1, 'com.ruoyi.web.controller.usermassage.MessageBoardController.addMessage()', 'POST', 1, 'admin', '管理部门', '/userMessages/messageBoard/add', '127.0.0.1', '内网IP', '{\"cardId\":[\"\"],\"content\":[\"fackytfyhyjijhio\"]}', NULL, 1, '你输入的内容包含违禁词请重新输入！！！', '2024-11-20 15:57:58', 63);
INSERT INTO `sys_oper_log` VALUES (841, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"系统管理员\"],\"cardId\":[\"1805010221\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-11-26\"]}', NULL, 1, '该书籍已被借阅', '2024-11-25 20:33:42', 84);
INSERT INTO `sys_oper_log` VALUES (842, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"id\":[\"42\"],\"cardId\":[\"1805010220\"],\"overtimeFee\":[\"0\"],\"bookId\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-25 20:33:55', 32);
INSERT INTO `sys_oper_log` VALUES (843, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"系统管理员\"],\"cardId\":[\"1805010230\"],\"bookId\":[\"10\"],\"endDate\":[\"2024-11-25\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-25 20:35:15', 68);
INSERT INTO `sys_oper_log` VALUES (844, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"系统管理员\"],\"cardId\":[\"1805010230\"],\"bookId\":[\"9\"],\"endDate\":[\"2024-11-27\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-25 20:35:27', 31);
INSERT INTO `sys_oper_log` VALUES (845, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"系统管理员\"],\"cardId\":[\"1805010230\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-11-25\"]}', NULL, 1, '不能超过规则限定的最大借阅数量', '2024-11-25 20:39:29', 22);
INSERT INTO `sys_oper_log` VALUES (846, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"王明\"],\"cardId\":[\"1805010229\"],\"bookId\":[\"1\"],\"endDate\":[\"2024-11-25\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-25 20:39:57', 26);
INSERT INTO `sys_oper_log` VALUES (847, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"图书管理员\"],\"cardId\":[\"1805010220\"],\"bookId\":[\"20\"],\"endDate\":[\"2024-11-26\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-25 20:41:31', 37);
INSERT INTO `sys_oper_log` VALUES (848, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"系统管理员\"],\"cardId\":[\"1805010228\"],\"bookId\":[\"19\"],\"endDate\":[\"2024-11-25\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-25 20:41:43', 29);
INSERT INTO `sys_oper_log` VALUES (849, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"系统管理员\"],\"cardId\":[\"1805010226\"],\"bookId\":[\"11\"],\"endDate\":[\"2024-11-25\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-25 20:41:56', 40);
INSERT INTO `sys_oper_log` VALUES (850, '公告添加', 1, 'com.ruoyi.web.controller.book.TNoticeController.addSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/add', '127.0.0.1', '内网IP', '{\"title\":[\"测试4\"],\"detail\":[\"dada\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-26 10:28:06', 36);
INSERT INTO `sys_oper_log` VALUES (851, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"13\"],\"title\":[\"测试4\"],\"detail\":[\"de\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-26 10:28:16', 13);
INSERT INTO `sys_oper_log` VALUES (852, '公告修改', 2, 'com.ruoyi.web.controller.book.TNoticeController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/tnotice/edit', '127.0.0.1', '内网IP', '{\"id\":[\"13\"],\"title\":[\"测试4\"],\"detail\":[\"图书馆测试中\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-26 10:28:31', 15);
INSERT INTO `sys_oper_log` VALUES (853, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2072\"],\"parentId\":[\"2032\"],\"menuType\":[\"F\"],\"menuName\":[\"归还判断\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:returnSelect\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-26 14:55:50', 107);
INSERT INTO `sys_oper_log` VALUES (854, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2032\"],\"menuType\":[\"F\"],\"menuName\":[\"图书续借\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"userMessages:bookView:renewBook\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-26 15:18:30', 20);
INSERT INTO `sys_oper_log` VALUES (855, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通用户\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2007,2061,2062,2063,2032,2040,2070,2071,2072,2073,2077,2074,2033,2044,2055,2034,2045,2046,2047,2035,2038,2043,2036,2041,2031,2042\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-26 20:21:28', 139);
INSERT INTO `sys_oper_log` VALUES (856, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"图书管理员\"],\"cardId\":[\"1805010210\"],\"bookId\":[\"7\"],\"endDate\":[\"2024-11-27\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-26 20:37:57', 1568);
INSERT INTO `sys_oper_log` VALUES (857, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"系统管理员\"],\"cardId\":[\"1805010202\"],\"bookId\":[\"8\"],\"endDate\":[\"2024-11-28\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-26 20:38:24', 4984);
INSERT INTO `sys_oper_log` VALUES (858, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"图书管理员\"],\"cardId\":[\"1805010220\"],\"bookId\":[\"28\"],\"endDate\":[\"2024-11-30\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-26 21:13:58', 117);
INSERT INTO `sys_oper_log` VALUES (859, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"系统管理员\"],\"cardId\":[\"1805010202\"],\"bookId\":[\"26\"],\"endDate\":[\"2024-11-28\"]}', NULL, 1, '不能超过规则限定的最大借阅数量', '2024-11-26 21:14:20', 31);
INSERT INTO `sys_oper_log` VALUES (860, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"系统管理员\"],\"cardId\":[\"1805010228\"],\"bookId\":[\"26\"],\"endDate\":[\"2024-11-28\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-26 21:14:37', 28);
INSERT INTO `sys_oper_log` VALUES (861, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.save()', 'POST', 1, 'admin', '管理部门', '/books/book/borrow', '127.0.0.1', '内网IP', '{\"userName\":[\"系统管理员\"],\"cardId\":[\"1805010205\"],\"bookId\":[\"24\"],\"endDate\":[\"2024-11-28\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-26 21:50:05', 148);
INSERT INTO `sys_oper_log` VALUES (862, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"图书管理员\"],\"roleKey\":[\"bookmanager\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"图书管理员\"],\"menuIds\":[\"2000,2001,2039,2050,2058,2064,2059,2068,2003,2004,2048,2008,2023,2024,2069,2065,2066,2076,2028,2030,2056,2029,2057,2005,2007,2052,2051,2053,2054,2035\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-26 22:16:30', 49);
INSERT INTO `sys_oper_log` VALUES (863, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '管理部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"图书续借\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"books:book:renewBook\"],\"orderNum\":[\"7\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-26 22:17:28', 14);
INSERT INTO `sys_oper_log` VALUES (864, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '管理部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"图书管理员\"],\"roleKey\":[\"bookmanager\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"图书管理员\"],\"menuIds\":[\"2000,2001,2039,2050,2058,2064,2059,2068,2078,2003,2004,2048,2008,2023,2024,2069,2065,2066,2076,2028,2030,2056,2029,2057,2005,2007,2052,2051,2053,2054,2035\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-26 22:17:42', 29);
INSERT INTO `sys_oper_log` VALUES (865, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"29\"],\"name\":[\"SKYYYY\"],\"author\":[\"夏洛\"],\"libraryId\":[\"2\"],\"sortId\":[\"5\"],\"position\":[\"4asdfa23\"],\"description\":[\"我也特烦恼!!!\"],\"status\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-27 10:33:08', 174);
INSERT INTO `sys_oper_log` VALUES (866, '书籍修改', 2, 'com.ruoyi.web.controller.book.TBooksController.editSave()', 'POST', 1, 'admin', '管理部门', '/books/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"29\"],\"name\":[\"SKYYYY\"],\"author\":[\"夏洛\"],\"libraryId\":[\"2\"],\"sortId\":[\"5\"],\"position\":[\"4asdfa23\"],\"description\":[\"我也特烦恼!!!\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-27 10:33:32', 6552);
INSERT INTO `sys_oper_log` VALUES (867, '书籍借阅', 1, 'com.ruoyi.web.controller.book.TBooksController.returnSave()', 'POST', 1, 'admin', '管理部门', '/books/book/returnBook', '127.0.0.1', '内网IP', '{\"id\":[\"55\"],\"cardId\":[\"1805010202\"],\"overtimeFee\":[\"0\"],\"bookId\":[\"8\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-11-27 10:37:55', 7609);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'sys', '系统管理员', 1, '0', 'admin', '2024-09-03 14:00:53', 'admin', '2024-09-11 16:55:43', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通用户', 2, '0', 'admin', '2024-09-03 14:00:53', 'admin', '2024-10-03 02:41:52', '');
INSERT INTO `sys_post` VALUES (5, 'bookmanager', '图书管理员', 3, '0', 'admin', '2024-10-10 09:47:20', 'admin', '2024-10-10 09:47:27', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2024-09-03 14:00:53', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通用户', 'common', 2, '2', '0', '0', 'admin', '2024-09-03 14:00:53', 'admin', '2024-11-26 20:21:28', '普通角色');
INSERT INTO `sys_role` VALUES (3, '图书管理员', 'bookmanager', 3, '2', '0', '0', 'admin', '2024-10-10 08:48:31', 'admin', '2024-11-26 22:17:42', '图书管理员');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 103);
INSERT INTO `sys_role_dept` VALUES (3, 100);
INSERT INTO `sys_role_dept` VALUES (3, 101);
INSERT INTO `sys_role_dept` VALUES (3, 103);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2032);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2034);
INSERT INTO `sys_role_menu` VALUES (2, 2035);
INSERT INTO `sys_role_menu` VALUES (2, 2036);
INSERT INTO `sys_role_menu` VALUES (2, 2038);
INSERT INTO `sys_role_menu` VALUES (2, 2040);
INSERT INTO `sys_role_menu` VALUES (2, 2041);
INSERT INTO `sys_role_menu` VALUES (2, 2042);
INSERT INTO `sys_role_menu` VALUES (2, 2043);
INSERT INTO `sys_role_menu` VALUES (2, 2044);
INSERT INTO `sys_role_menu` VALUES (2, 2045);
INSERT INTO `sys_role_menu` VALUES (2, 2046);
INSERT INTO `sys_role_menu` VALUES (2, 2047);
INSERT INTO `sys_role_menu` VALUES (2, 2055);
INSERT INTO `sys_role_menu` VALUES (2, 2061);
INSERT INTO `sys_role_menu` VALUES (2, 2062);
INSERT INTO `sys_role_menu` VALUES (2, 2063);
INSERT INTO `sys_role_menu` VALUES (2, 2070);
INSERT INTO `sys_role_menu` VALUES (2, 2071);
INSERT INTO `sys_role_menu` VALUES (2, 2072);
INSERT INTO `sys_role_menu` VALUES (2, 2073);
INSERT INTO `sys_role_menu` VALUES (2, 2074);
INSERT INTO `sys_role_menu` VALUES (2, 2077);
INSERT INTO `sys_role_menu` VALUES (3, 2000);
INSERT INTO `sys_role_menu` VALUES (3, 2001);
INSERT INTO `sys_role_menu` VALUES (3, 2003);
INSERT INTO `sys_role_menu` VALUES (3, 2004);
INSERT INTO `sys_role_menu` VALUES (3, 2005);
INSERT INTO `sys_role_menu` VALUES (3, 2007);
INSERT INTO `sys_role_menu` VALUES (3, 2008);
INSERT INTO `sys_role_menu` VALUES (3, 2023);
INSERT INTO `sys_role_menu` VALUES (3, 2024);
INSERT INTO `sys_role_menu` VALUES (3, 2028);
INSERT INTO `sys_role_menu` VALUES (3, 2029);
INSERT INTO `sys_role_menu` VALUES (3, 2030);
INSERT INTO `sys_role_menu` VALUES (3, 2035);
INSERT INTO `sys_role_menu` VALUES (3, 2039);
INSERT INTO `sys_role_menu` VALUES (3, 2048);
INSERT INTO `sys_role_menu` VALUES (3, 2050);
INSERT INTO `sys_role_menu` VALUES (3, 2051);
INSERT INTO `sys_role_menu` VALUES (3, 2052);
INSERT INTO `sys_role_menu` VALUES (3, 2053);
INSERT INTO `sys_role_menu` VALUES (3, 2054);
INSERT INTO `sys_role_menu` VALUES (3, 2056);
INSERT INTO `sys_role_menu` VALUES (3, 2057);
INSERT INTO `sys_role_menu` VALUES (3, 2058);
INSERT INTO `sys_role_menu` VALUES (3, 2059);
INSERT INTO `sys_role_menu` VALUES (3, 2064);
INSERT INTO `sys_role_menu` VALUES (3, 2065);
INSERT INTO `sys_role_menu` VALUES (3, 2066);
INSERT INTO `sys_role_menu` VALUES (3, 2068);
INSERT INTO `sys_role_menu` VALUES (3, 2069);
INSERT INTO `sys_role_menu` VALUES (3, 2076);
INSERT INTO `sys_role_menu` VALUES (3, 2078);

-- ----------------------------
-- Table structure for sys_tuser
-- ----------------------------
DROP TABLE IF EXISTS `sys_tuser`;
CREATE TABLE `sys_tuser`  (
  `id` int NOT NULL,
  `userId` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_tuser
-- ----------------------------
INSERT INTO `sys_tuser` VALUES (1, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '系统管理员', '00', 'ry@163.com', '19898988989', '0', '', 'de5363e884e027e9500daab385ccb22c', '0de2e7', '0', '0', '127.0.0.1', '2024-11-27 22:21:43', '2024-09-18 09:50:17', 'admin', '2024-09-03 14:00:53', '', '2024-11-27 22:21:43', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '图书管理员', '00', 'ry@qq.com', '15666666666', '0', '', 'c1dcb40ead6305b41a34521000c4a10d', 'a5678d', '0', '0', '127.0.0.1', '2024-11-26 22:31:05', '2024-10-12 08:53:41', 'admin', '2024-09-03 14:00:53', 'admin', '2024-11-26 22:31:05', '');
INSERT INTO `sys_user` VALUES (3, 100, 'zhangsan', '张三', '00', '42313@163.com', '18020090223', '0', '', 'b6116d744d87654cf31722af82627993', 'dbff56', '0', '2', '127.0.0.1', '2024-09-27 15:04:17', '2024-09-18 14:40:29', 'admin', '2024-09-18 14:40:29', '', '2024-09-27 15:04:16', '测试一');
INSERT INTO `sys_user` VALUES (4, 105, '馆长1', '馆长1', '00', '', '', '0', '', '01ad15a11dd9a2fd6475db33ad0c6392', '55add3', '0', '0', '', NULL, '2024-09-25 15:52:01', 'admin', '2024-09-25 15:52:00', 'admin', '2024-10-02 16:05:47', '');
INSERT INTO `sys_user` VALUES (5, 105, 'lisi', '李四', '00', '121312@163.com', '', '0', '', '', '', '0', '0', '', NULL, NULL, '', '2024-10-02 16:34:52', 'admin', '2024-10-03 02:08:13', '');
INSERT INTO `sys_user` VALUES (6, 103, 'zhangsan', 'zhangsan', '00', '', '', '0', '', '22e104f6edc44978474b7e45c1cdfae0', '7f186d', '0', '0', '127.0.0.1', '2024-11-12 11:36:43', '2024-10-10 14:58:09', 'admin', '2024-10-03 02:12:07', 'admin', '2024-11-12 11:36:43', '');
INSERT INTO `sys_user` VALUES (7, 105, 'admin1', 'admin1', '00', '3172298228@qq.com', '18050996069', '0', '', '0213579944054523975484b477487c26', 'adf372', '0', '0', '127.0.0.1', '2024-11-26 15:17:48', '2024-10-05 23:04:47', 'admin', '2024-10-05 23:04:47', 'admin', '2024-11-26 15:17:48', '');
INSERT INTO `sys_user` VALUES (8, NULL, 'ry1', 'ry管理', '00', '', '', '0', '', '62c32a6b9b83dbeebacc79930c82853a', 'a36592', '0', '0', '', NULL, '2024-10-10 10:55:50', 'admin', '2024-10-10 10:55:49', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (9, NULL, '111', '111', '01', '', '', '0', '', 'bfacb9a8ce2df2380a6b999af0e7cf59', '77ce52', '0', '0', '', NULL, '2024-10-28 15:26:17', '', '2024-10-28 15:26:17', 'admin', '2024-10-28 15:45:23', '');
INSERT INTO `sys_user` VALUES (10, NULL, '测试3', '测试3', '01', '', '', '0', '', 'df92533659bc6bde0216d41a2711fc9a', '0fdd26', '0', '0', '127.0.0.1', '2024-10-29 15:55:05', '2024-10-28 15:28:12', '', '2024-10-28 15:28:11', 'admin', '2024-10-29 15:55:05', '');
INSERT INTO `sys_user` VALUES (11, NULL, '王明', '王明', '01', '', '', '0', '', '86d62de1ed3772530840e6a47f2a46c7', '338564', '0', '0', '127.0.0.1', '2024-11-27 22:22:05', '2024-10-28 15:37:51', '', '2024-10-28 15:37:51', 'admin', '2024-11-27 22:22:04', '');
INSERT INTO `sys_user` VALUES (14, NULL, '1111', '1111', '01', '', '', '0', '', '5789bdffd02e34b4573cead5a9f530eb', '78a5f6', '0', '0', '', NULL, '2024-11-12 11:58:29', '', '2024-11-12 11:58:45', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (15, NULL, 'ceshi2', 'ceshi2', '01', '', '', '0', '', 'b923e9dc7802558811842f833e58aadc', '4ff36e', '0', '0', '127.0.0.1', '2024-11-26 15:16:43', '2024-11-12 12:10:24', '', '2024-11-12 12:10:27', '', '2024-11-26 15:16:42', NULL);
INSERT INTO `sys_user` VALUES (16, NULL, 'ry3', 'ry3', '00', '', '18029049090', '0', '', '5c8c466fec622ed9ab117815c18b7b55', 'e3d041', '0', '0', '', NULL, '2024-11-15 21:18:14', 'admin', '2024-11-15 21:18:14', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '在线用户记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('7d9e3b9e-93c0-479a-9454-2e99d2e010e7', '王明', NULL, '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', 'on_line', '2024-11-27 22:22:05', '2024-11-27 22:24:47', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (5, 4);
INSERT INTO `sys_user_post` VALUES (6, 1);
INSERT INTO `sys_user_post` VALUES (6, 4);
INSERT INTO `sys_user_post` VALUES (7, 1);
INSERT INTO `sys_user_post` VALUES (7, 4);
INSERT INTO `sys_user_post` VALUES (16, 5);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID(1系统管理员，2普通用户，3图书管理员)',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 3);
INSERT INTO `sys_user_role` VALUES (3, 1);
INSERT INTO `sys_user_role` VALUES (4, 3);
INSERT INTO `sys_user_role` VALUES (5, 2);
INSERT INTO `sys_user_role` VALUES (6, 2);
INSERT INTO `sys_user_role` VALUES (7, 2);
INSERT INTO `sys_user_role` VALUES (8, 3);
INSERT INTO `sys_user_role` VALUES (9, 2);
INSERT INTO `sys_user_role` VALUES (10, 2);
INSERT INTO `sys_user_role` VALUES (11, 2);
INSERT INTO `sys_user_role` VALUES (15, 2);
INSERT INTO `sys_user_role` VALUES (16, 3);

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账户类型：sysadmin系统管理员；bookadmin图书管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_admin
-- ----------------------------

-- ----------------------------
-- Table structure for t_book_rss_history
-- ----------------------------
DROP TABLE IF EXISTS `t_book_rss_history`;
CREATE TABLE `t_book_rss_history`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `user_id` int NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_book_rss_history
-- ----------------------------
INSERT INTO `t_book_rss_history` VALUES (1, 31, 1, '2024-10-30 11:31:51', 1);
INSERT INTO `t_book_rss_history` VALUES (2, 10, 1, '2024-10-30 11:27:41', 1);
INSERT INTO `t_book_rss_history` VALUES (8, 30, 1, '2024-10-30 11:27:34', 1);
INSERT INTO `t_book_rss_history` VALUES (9, 10, 10, '2024-10-30 11:27:39', 1);
INSERT INTO `t_book_rss_history` VALUES (10, 29, 1, '2024-10-30 11:53:15', 1);
INSERT INTO `t_book_rss_history` VALUES (11, 31, 11, '2024-10-30 11:31:53', 1);
INSERT INTO `t_book_rss_history` VALUES (12, 30, 11, '2024-10-30 11:57:06', 1);
INSERT INTO `t_book_rss_history` VALUES (13, 29, 11, '2024-10-30 11:54:14', 1);
INSERT INTO `t_book_rss_history` VALUES (14, 30, 1, '2024-10-30 11:57:20', 1);
INSERT INTO `t_book_rss_history` VALUES (15, 9, 1, '2024-11-13 10:36:55', 1);
INSERT INTO `t_book_rss_history` VALUES (16, 8, 1, '2024-11-16 20:40:34', 1);
INSERT INTO `t_book_rss_history` VALUES (17, 9, 1, '2024-11-16 20:57:41', 1);
INSERT INTO `t_book_rss_history` VALUES (18, 10, 1, '2024-11-16 20:52:29', 1);
INSERT INTO `t_book_rss_history` VALUES (19, 33, 1, '2024-11-16 20:56:31', 0);
INSERT INTO `t_book_rss_history` VALUES (20, 31, 1, '2024-11-16 20:56:33', 0);
INSERT INTO `t_book_rss_history` VALUES (21, 30, 1, '2024-11-16 21:42:23', 0);
INSERT INTO `t_book_rss_history` VALUES (22, 29, 1, '2024-11-27 10:33:32', 1);

-- ----------------------------
-- Table structure for t_book_sort
-- ----------------------------
DROP TABLE IF EXISTS `t_book_sort`;
CREATE TABLE `t_book_sort`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '书籍类型名',
  `description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '简介',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '书籍分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_book_sort
-- ----------------------------
INSERT INTO `t_book_sort` VALUES (1, '未分类', '不可删除1111', 0);
INSERT INTO `t_book_sort` VALUES (2, '护理', '护理护理', 0);
INSERT INTO `t_book_sort` VALUES (3, '编程', '编程编程', 0);
INSERT INTO `t_book_sort` VALUES (4, '艺术', '', 0);
INSERT INTO `t_book_sort` VALUES (5, '管理', NULL, 0);
INSERT INTO `t_book_sort` VALUES (6, '法律', NULL, 0);
INSERT INTO `t_book_sort` VALUES (7, '生活', NULL, 0);
INSERT INTO `t_book_sort` VALUES (8, '励志', '', 0);
INSERT INTO `t_book_sort` VALUES (9, '故事', NULL, 0);
INSERT INTO `t_book_sort` VALUES (10, '诗歌', NULL, 0);
INSERT INTO `t_book_sort` VALUES (11, '社会学', NULL, 0);
INSERT INTO `t_book_sort` VALUES (12, '文学', NULL, 0);
INSERT INTO `t_book_sort` VALUES (13, '哲学', NULL, 0);
INSERT INTO `t_book_sort` VALUES (14, '科学', NULL, 0);
INSERT INTO `t_book_sort` VALUES (16, '幽默', '', 0);
INSERT INTO `t_book_sort` VALUES (17, 'SKY', 'dffdg', 1);
INSERT INTO `t_book_sort` VALUES (18, '战神', '11334456', 1);

-- ----------------------------
-- Table structure for t_books
-- ----------------------------
DROP TABLE IF EXISTS `t_books`;
CREATE TABLE `t_books`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '书籍名字',
  `author` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '作者',
  `library_id` int NOT NULL COMMENT '图书馆id',
  `sort_id` int NOT NULL COMMENT '分类id',
  `position` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '位置',
  `status` smallint NOT NULL DEFAULT 0 COMMENT '状态',
  `description` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '简介',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '书籍表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_books
-- ----------------------------
INSERT INTO `t_books` VALUES (1, '夏洛特烦恼', '夏洛123213', 1, 2, '4asdfa23', 1, '我也特烦恼!!!', 0);
INSERT INTO `t_books` VALUES (2, '植发的价格', '江湖老中医', 2, 2, '5sdfs1', 0, '详细介绍每植一根发多少钱？', 0);
INSERT INTO `t_books` VALUES (3, '代码的力量', '明月复苏', 1, 3, '234as', 1, '神不知鬼不觉的拔掉你的头发', 0);
INSERT INTO `t_books` VALUES (4, 'java从入门到入土', '明月复苏', 2, 3, 'sdfs33', 0, '无简介', 0);
INSERT INTO `t_books` VALUES (5, '图书馆章程', '明月复苏', 1, 5, '234sdfs', 1, '图书馆章程', 0);
INSERT INTO `t_books` VALUES (6, '图书馆建设', '吸尘羊', 1, 5, '23dgdff', 1, '图书馆建设！', 0);
INSERT INTO `t_books` VALUES (7, '学习如何跑路', '明月复苏', 1, 7, '2sdsa', 1, '学习如何跑路', 0);
INSERT INTO `t_books` VALUES (8, '美好课设', '匿名', 1, 8, '23432s', 0, '做梦', 0);
INSERT INTO `t_books` VALUES (9, '中国童话', '刘丽朵', 1, 9, '6sdf11', 1, '这是一本给孩子的中国童话故事集。以“非教训的无意思、空灵的幻想、快活的嬉笑、纯净的诗意、悠远的生命体味”为选篇标准，从《搜神记》《太平广记》《聊斋志异》《酉阳杂俎》等近30本经典作品中，精心挑选45篇符合现代审美、适合孩子阅读的故事；故事蕴涵着丰富的想象力与趣味性；用简美的现代语言，全新讲述中国童话故事；搭配符合故事主题的原创古风插画，带孩子进入奇幻浪漫的童话世界。', 0);
INSERT INTO `t_books` VALUES (10, '人生删除事务所', '本多孝好', 1, 7, '22sdf1', 1, '你想好死后如何处理自己的手机、电脑、社交账号了吗？「死后，你不想示人的数据由我们来删除。」——人生删除事务所', 0);
INSERT INTO `t_books` VALUES (11, '飞鸟集', '拉宾德拉纳特·泰戈尔', 1, 10, '23sdf12', 1, '《飞鸟集》是泰戈尔的代表作之一，也是世界上最杰出的诗集之一。白昼和黑夜、溪流和海洋、自由和背叛，都在泰戈尔的笔下合而为一，短小的语句道出了深刻的人生哲理，引领世人探寻真理和智慧的源泉。初读这些诗篇，如同在暴风雨过后的初夏清晨，推开卧室的窗户，看到一个淡泊清透的世界，一切都是那样清新、亮丽，可是其中的韵味却很厚实，耐人寻味。', 0);
INSERT INTO `t_books` VALUES (12, '声音中的另一种语言', '伊夫·博纳富瓦', 1, 10, '23sdf2', 0, '在本书中，我们会读到这位诗人翻译家从自己的写作和翻译经验出发，对诗及诗的翻译的特殊性与重要性的阐述，对某些诗歌译作的批评，对译者处境与任务的思考，以及对不同语言的诗歌的独特见解……总而言之，在博纳富瓦看来，诗，我们在声音中触及的另一种语言，是存在僭越概念性日常言语，书写生命真实“在场”的语言，诗的语言不同于世上其他一切语言，它斟酌词语，倾听节奏，“一首诗歌（poème）的诗（poésie）以一种声音（voix）的方式走向读者”。诗的翻译是可能的，但不同于其他任何翻译，只能以独特的方式进行：“诗歌唯一需要忠实的是‘在场’”，译者要保留诗意，便要倾听词语的音乐，重新经历诗人用声音勾起的关于“在场”的记忆，用自己的语言和存在经验去重构、去分享原诗的“在场”。诗的翻译应当受到重视，通过诗的翻译，处于两种语言间隙的译者和另一种语言的读者能够对虚幻的概念性言语提出质疑，在进一步自我批评的同时重新思考与异的关系，从而探寻真实的生活与场所，与自己真实的信念相遇。', 0);
INSERT INTO `t_books` VALUES (13, '诗经', '孔丘', 1, 10, '23sdf3', 0, '这本《诗经》收录全部305篇，每篇诗歌都配有相应的解释及译文，使读者更容易理解', 0);
INSERT INTO `t_books` VALUES (14, '海子的诗', '海子', 1, 10, '23sdf4', 0, '本书收录了已故诗人海子的诗作精华，其诗以独特的风格深受读者的喜爱，从这些诗中反映出诗人那对于一切美好事物的眷恋之情，对于生命的世俗和崇高的激动和关怀。', 0);
INSERT INTO `t_books` VALUES (15, '剧变', '[美] 贾雷德·戴蒙德 ', 2, 11, '2342sdf', 0, '<p>&nbsp; 《剧变》探讨了一个当前人类社会面临的重大问题：当危机来临时，我们该如何应对？从个人视角而言，危机可以改变一个人的成长轨迹，如处理不当，终其一生会生活在负面情绪中。对于整个人类社会而言，危机可使一种文明没落、一个国家解体、一个时代终结。因此，如何分辨危机、应对危机，避免危机，化危机为机遇，实现个人和整个人类社会的剧变，是人类当下面临的主课题。普利策奖得主、《枪炮、病菌与钢铁》作者戴蒙德再一次发挥其历史叙事的顶级水准，带我们巡礼了各国在历史中的危机应对，并从社会学、心理学、经济学、生物进化等跨学科视角展现了人类自古以来何以应对危机的历史沿革，并谏言国家、企业及整个人类社会如何从个人应对危机的进化逻辑和生理变化中得到启示，以更加多维度的、宽视角地看待危机应对这一关乎人类未来的命题。</p>', 0);
INSERT INTO `t_books` VALUES (16, '七个疯子', '罗伯特·阿尔特 ', 2, 12, '234sae', 0, '<p><span class=\"all hidden\"></span></p><div class=\"intro\">    <p>◎ “是我想太多，还是这世界太疯狂？”</p>    <p>◎ 毒丽场域疯子们的“蛮荒故事”，纳粹等现代性之殇的神奇预言</p>    <p>◎ “阿根廷的陀思妥耶夫斯基”，拉美现代小说之父，罗伯特·阿尔特代表作</p>    <p>◎ 马尔克斯、博尔赫斯之先驱，胡里奥·科塔萨尔、罗伯特·波拉尼奥、胡安·卡洛斯·奥内蒂盛赞的伟大作家</p>    <p>——————————</p>    <p>本书是阿根廷著名作家罗伯特·阿尔特的长篇小说代表作，描述男主人公在社会底层挣扎并逐渐走向崩溃的过程。故事集中在三天时间，各色人物纷纷登场，从一件绑架案折射出20世纪20年代阿根廷乃至拉美的社会现实生活。作家以精湛的文笔对主人公进行了大量的心理描摹，并通过主人公的眼睛变形地透视了身边的现实和种种人物，其混乱怪诞之感，正应了魔幻现实主义的画风。有续集《喷火器》。</p>    <p>——————————</p>    <p>阿尔特无疑是一位伟大的作家……他是拉美第一位真正的都市小说家……这就是激发文学创作的力量。——《卫报》</p>    <p>他的视野与布宜诺斯艾利斯那一帮家伙昏暗而偏缘的视野从不可同日而语。——胡里奥·科塔萨尔</p>    <p>阿尔特是阿根廷现代小说之父，他是最重要、最伟大的阿根廷小说家。——里卡多·皮格利亚</p>    <p>如果这些海岸上有人能被称为文学天才的话，那一定是罗伯特·阿尔特……我在谈论一个将在时间长河中留下名字的小说家……难以置信，他还不为当今大众所熟知。——胡安·卡洛斯·奥内蒂</p>    <p>——————————</p>    <p>美洲西班牙语文学的另一重要特征即是它永恒的见证：暴力与不公平的见证，集体与个体的见证，现实与虚构的见证，往昔与现今的见证。在美洲，写作总是兼有诗意与政治的功能，写作从来不是一种无谓的游戏，即便在表面看来最形式化的表达中，它也从不逃遁于幻觉中。</p>    <p>——《理想藏书》</p></div><p></p>', 0);
INSERT INTO `t_books` VALUES (17, '走出唯一真理观', '陈嘉映', 1, 13, '234sdfd', 0, '<div class=\"intro\">    <p>★陈嘉映2007—2018自选文集。</p>    <p>★《何为良好生活》后新作，认真思考，认真表述这些思考，召唤爱思考的人来一道思考。</p>    <p>★在危机与纷争爆发的时代，哲学如何协助我们反思生活。“我们与其说需要共识，不如说需要学会，没有共识的人应该如何一起生存。”</p>    <p>本书是陈嘉映先生选编自己于2007—2018年间所作演讲、访谈与评论结集。</p>    <p>有不同的道，从前有不同的道，现在有不同的道，将来还有不同的道。重要的问题不是找到唯一的道，而是这些不同的道之间怎样呼应，怎样交流，怎样斗争。你要是坚持说，哲学要的就是唯一的真理体系，那我不得不说，哲学已经死了。</p>    <p>哲学，尤其今天的哲学，不是宣教式的，不是上智向下愚宣教。我们之所求，首先不是让别人明白，而是求自己明白。</p>    <p>“我个人想要的是，认真思考，认真表述这些思考，召唤爱思考的人来一道思考。”</p></div>', 0);
INSERT INTO `t_books` VALUES (18, '人类灭绝之后', '杜格尔·狄克逊', 1, 14, '234s', 0, '<p><span 《人类灭绝之后——未来世界动物图鉴》描绘了人类灭绝5000万年之后的动物世界。</p>    <p>本书分为十一个章节，前两章回顾了从生命进化之初到人类出现之后的物种进化历程；中间八章则根据狄克逊天马行空又有理有据的想象，推演出在人类灭绝之后的5000万年地球上，从热带到寒带、从雨林到苔原的动物进化可能，带领读者穿越时空，共同欣赏这颗星球上生命进化的壮观景象；最终章则畅想了在更遥远的未来生命终将归往何处.', 0);
INSERT INTO `t_books` VALUES (19, '孩子们的诗', '果麦', 1, 10, 'sd2342', 1, '<p><span class=\"all hidden\"><div class=\"intro\">    <p>书中有灵气的诗句包括但不限于以下：</p>    <p>*我的眼睛／很小很小／有时遇到心事／就连两行泪／也装不下——陈科全， 八岁</p>    <p>*灯把黑夜／烫了一个洞——姜二嫚，七岁</p>    <p>*春天来了／我去小溪边砸冰／把春天砸得头破血流／直淌眼泪——铁头，八岁</p>    <p>*要是笑过了头／你就会飞到天上去／要想回到地面／你必须做一件伤心事——朵朵，五岁</p>    <p>*纸币在飘的时候，我们知道风在算钱。——王子乔，六岁</p>    <p>*你问我出生前在做什么／我答 我在天上挑妈妈——朱尔，八岁</p>    <p>*母亲提水桶／父亲提电脑／我想起／往日他们提着我在街上乱跑——王芗远，十二岁</p>    <p>*树枝想去撕裂天空，但却只戳了几个微小的窟窿，它透出天外的光亮，人们把它叫做月亮和星星。——顾城，十二岁</p>    <p>《孩子们的诗》，精选了七十多首等3－13岁小朋友写的诗。小诗人们来自北京、上海、广东、江苏、山东、广西、福建、内蒙古、新疆等全国各个地方。</p>    <p>从上万首诗作中脱颖而出，它们首先是好诗，其次才是孩子的诗。</p>    <p>本书还邀请了Starry阿星、飞行猴CF、九个妖、木可子、黄雷蕾Linali、苏寒、Lett Yice等二十多位国内知名插画家，为书中每一首诗歌创作了兼具美感与奇趣的插画。</p></div></span></p>', 0);
INSERT INTO `t_books` VALUES (20, '万物静默如谜', '维斯拉瓦•辛波斯卡', 1, 10, '5楼1室234', 1, '<div class=\"intro\">    <p>《辛波斯卡诗选：万物静默如谜》收录辛波斯卡各阶段名作75首，包括激发知名绘本作家幾米创作出《向左走，向右走》的《一见钟情》，收录高中语文教材的《底片》，网上广为流传的《在一颗小星星下》《种种可能》等，曾获得《洛杉矶时报》年度最佳图书。</p>    <p>辛波斯卡的诗取材于日常生活的事物和经验，甲虫、海参、石头、沙粒、天空；安眠药、履历表、衣服；电影、画作、剧场、梦境等等，在她的笔下无不焕发出新的诗意，让人们重新认识生活中常见的事物。</p></div>', 0);
INSERT INTO `t_books` VALUES (21, 'Python编程', '埃里克·马瑟斯', 1, 3, '4楼1室234', 0, '<p>本书是一本针对所有层次的Python 读者而作的Python 入门书。全书分两部分：第一部分介绍用Python 编程所必须了解的基本概念，包括matplotlib、NumPy 和Pygal 等强大的Python 库和工具介绍，以及列表、字典、if 语句、类、文件与异常、代码测试等内容；第二部分将理论付诸实践，讲解如何开发三个项目，包括简单的Python 2D 游戏开发如何利用数据生成交互式的信息图，以及创建和定制简单的Web 应用，并帮读者解决常见编程问题和困惑。</p>', 0);
INSERT INTO `t_books` VALUES (24, '战斗', '战斗', 2, 1, '五楼234', 1, '<p>战斗</p>', 0);
INSERT INTO `t_books` VALUES (26, '124', '1243', 1, 2, '撒旦法', 1, '撒旦法', 0);
INSERT INTO `t_books` VALUES (28, 'SKY', 'sdgfdg', 3, 1, 'sd', 1, 'ghfhhfff', 0);
INSERT INTO `t_books` VALUES (29, 'SKYYYY', '夏洛', 2, 5, '4asdfa23', 0, '我也特烦恼!!!', 0);
INSERT INTO `t_books` VALUES (30, '战神', '12', 1, 9, '南图', 2, '11', 0);
INSERT INTO `t_books` VALUES (31, 'limax', '12', 1, 3, '南图', 2, '11', 0);
INSERT INTO `t_books` VALUES (32, 'limax', '12', 3, 2, '南图', 0, '11334456', 1);
INSERT INTO `t_books` VALUES (33, 'limax11', '12', 1, 3, '南图', 2, '11334456', 0);

-- ----------------------------
-- Table structure for t_borrow_books
-- ----------------------------
DROP TABLE IF EXISTS `t_borrow_books`;
CREATE TABLE `t_borrow_books`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `card_id` int NOT NULL COMMENT '借阅证id',
  `book_id` int NOT NULL COMMENT '书籍id',
  `borrow_date` datetime NOT NULL COMMENT '借阅时间',
  `end_date` datetime NOT NULL COMMENT '预定归还时间',
  `return_date` datetime NULL DEFAULT NULL COMMENT '实际归还时间',
  `illegal` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '违约记录',
  `status` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '归还状态',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '借阅记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_borrow_books
-- ----------------------------
INSERT INTO `t_borrow_books` VALUES (20, 1805010202, 1, '2020-06-11 09:37:10', '2020-06-12 09:37:18', '2020-06-11 09:48:07', NULL, '1', 0);
INSERT INTO `t_borrow_books` VALUES (21, 1805010206, 5, '2020-04-08 09:37:40', '2020-06-08 09:38:14', '2020-06-11 10:50:07', '已逾期3天', '1', 0);
INSERT INTO `t_borrow_books` VALUES (22, 1805010207, 1, '2020-06-11 09:47:44', '2020-08-10 09:47:52', '2020-06-11 09:50:07', NULL, '1', 0);
INSERT INTO `t_borrow_books` VALUES (24, 1805010202, 1, '2020-06-02 09:55:04', '2020-06-03 09:55:16', '2020-06-11 09:56:02', '已逾期8天', '1', 0);
INSERT INTO `t_borrow_books` VALUES (25, 1805010204, 2, '2020-06-11 09:59:42', '2020-08-10 09:59:47', '2020-06-11 10:00:17', NULL, '1', 0);
INSERT INTO `t_borrow_books` VALUES (26, 1805010202, 1, '2020-06-09 10:01:13', '2020-06-10 10:01:48', '2020-06-11 10:07:29', '超期一天', '1', 0);
INSERT INTO `t_borrow_books` VALUES (27, 1805010202, 5, '2020-06-08 10:12:18', '2020-06-09 10:12:27', '2020-06-11 10:13:36', '已逾期2天', '1', 0);
INSERT INTO `t_borrow_books` VALUES (28, 1805010204, 2, '2020-04-07 10:12:28', '2020-06-06 10:12:41', '2024-09-13 20:48:18', NULL, '1', 0);
INSERT INTO `t_borrow_books` VALUES (29, 1805010202, 6, '2020-06-11 08:19:56', '2020-06-12 08:20:07', '2024-09-05 20:48:20', NULL, '1', 0);
INSERT INTO `t_borrow_books` VALUES (30, 1805010202, 1, '2024-09-29 17:36:01', '2024-10-01 00:00:00', '2024-10-05 19:29:25', '逾期4天', '1', 0);
INSERT INTO `t_borrow_books` VALUES (31, 1805010202, 1, '2024-10-03 22:43:41', '2024-10-04 00:00:00', '2024-10-05 19:36:51', '已逾期1天', '1', 0);
INSERT INTO `t_borrow_books` VALUES (32, 1805010202, 30, '2024-10-05 13:40:12', '2024-10-05 00:00:00', '2024-10-05 23:02:48', NULL, '1', 0);
INSERT INTO `t_borrow_books` VALUES (34, 1805010202, 31, '2024-10-09 15:24:40', '2024-10-11 00:00:00', '2024-10-09 15:45:34', NULL, '1', 0);
INSERT INTO `t_borrow_books` VALUES (35, 1805010206, 1, '2024-10-09 23:34:01', '2024-10-27 00:00:00', '2024-10-10 23:33:41', NULL, '1', 0);
INSERT INTO `t_borrow_books` VALUES (36, 1805010203, 1, '2024-10-11 10:54:35', '2024-10-11 00:00:00', '2024-10-11 10:57:14', NULL, '1', 0);
INSERT INTO `t_borrow_books` VALUES (38, 1805010225, 2, '2024-10-11 17:36:13', '2024-10-12 00:00:00', '2024-10-31 20:05:05', '逾期19天', '1', 0);
INSERT INTO `t_borrow_books` VALUES (39, 1805010227, 3, '2024-10-12 08:49:13', '2024-10-12 00:00:00', NULL, NULL, '0', 0);
INSERT INTO `t_borrow_books` VALUES (40, 1805010202, 4, '2024-10-24 15:55:23', '2024-10-25 00:00:00', '2024-11-08 15:50:35', '逾期14天', '1', 0);
INSERT INTO `t_borrow_books` VALUES (41, 1805010229, 5, '2024-10-30 10:08:08', '2024-11-02 00:00:00', NULL, NULL, '0', 0);
INSERT INTO `t_borrow_books` VALUES (42, 1805010220, 1, '2024-10-31 20:15:25', '2024-11-15 00:00:00', '2024-11-25 20:33:55', '逾期11天', '1', 0);
INSERT INTO `t_borrow_books` VALUES (43, 1805010228, 2, '2024-11-08 15:37:15', '2024-11-13 00:00:00', '2024-11-08 15:38:14', NULL, '1', 0);
INSERT INTO `t_borrow_books` VALUES (44, 1805010221, 6, '2024-11-08 15:46:26', '2024-11-13 00:00:00', NULL, NULL, '0', 0);
INSERT INTO `t_borrow_books` VALUES (45, 1805010202, 2, '2024-11-13 10:36:18', '2024-11-15 00:00:00', '2024-11-13 10:36:26', NULL, '1', 0);
INSERT INTO `t_borrow_books` VALUES (46, 1805010230, 4, '2024-11-19 10:24:06', '2024-11-20 00:00:00', '2024-11-19 10:24:29', NULL, '1', 0);
INSERT INTO `t_borrow_books` VALUES (47, 1805010230, 4, '2024-11-19 10:25:18', '2024-11-20 00:00:00', '2024-11-19 10:25:40', NULL, '1', 0);
INSERT INTO `t_borrow_books` VALUES (48, 1805010230, 10, '2024-11-25 20:35:15', '2024-11-25 00:00:00', NULL, NULL, '0', 0);
INSERT INTO `t_borrow_books` VALUES (49, 1805010230, 9, '2024-11-25 20:35:27', '2024-11-27 00:00:00', NULL, NULL, '0', 0);
INSERT INTO `t_borrow_books` VALUES (50, 1805010229, 1, '2024-11-25 20:39:57', '2024-11-25 00:00:00', NULL, NULL, '0', 0);
INSERT INTO `t_borrow_books` VALUES (51, 1805010220, 20, '2024-11-25 20:41:31', '2024-11-29 00:00:00', NULL, NULL, '0', 0);
INSERT INTO `t_borrow_books` VALUES (52, 1805010228, 19, '2024-11-25 20:41:43', '2024-11-25 00:00:00', NULL, NULL, '0', 0);
INSERT INTO `t_borrow_books` VALUES (53, 1805010226, 11, '2024-11-25 20:41:57', '2024-11-25 00:00:00', NULL, NULL, '0', 0);
INSERT INTO `t_borrow_books` VALUES (54, 1805010210, 7, '2024-11-26 20:37:57', '2024-11-28 00:00:00', NULL, NULL, '0', 0);
INSERT INTO `t_borrow_books` VALUES (55, 1805010202, 8, '2024-11-26 20:38:25', '2024-11-28 00:00:00', '2024-11-27 10:37:51', NULL, '1', 0);
INSERT INTO `t_borrow_books` VALUES (56, 1805010220, 28, '2024-11-26 21:13:58', '2024-11-30 00:00:00', NULL, NULL, '0', 0);
INSERT INTO `t_borrow_books` VALUES (57, 1805010228, 26, '2024-11-26 21:14:37', '2024-11-29 00:00:00', NULL, NULL, '0', 0);
INSERT INTO `t_borrow_books` VALUES (58, 1805010205, 24, '2024-11-26 21:50:05', '2024-11-29 00:00:00', NULL, NULL, '0', 0);

-- ----------------------------
-- Table structure for t_borrow_card
-- ----------------------------
DROP TABLE IF EXISTS `t_borrow_card`;
CREATE TABLE `t_borrow_card`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户id',
  `rule_id` int NOT NULL COMMENT '规则id',
  `status` smallint NOT NULL DEFAULT 0 COMMENT '1注销，0正常',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1805010231 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '借阅证表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_borrow_card
-- ----------------------------
INSERT INTO `t_borrow_card` VALUES (1805010202, 1, 7, 0, 0);
INSERT INTO `t_borrow_card` VALUES (1805010203, 2, 2, 0, 0);
INSERT INTO `t_borrow_card` VALUES (1805010204, 2, 1, 0, 0);
INSERT INTO `t_borrow_card` VALUES (1805010205, 1, 1, 0, 0);
INSERT INTO `t_borrow_card` VALUES (1805010206, 2, 6, 0, 0);
INSERT INTO `t_borrow_card` VALUES (1805010207, 2, 1, 0, 0);
INSERT INTO `t_borrow_card` VALUES (1805010208, 2, 1, 0, 0);
INSERT INTO `t_borrow_card` VALUES (1805010210, 2, 1, 0, 0);
INSERT INTO `t_borrow_card` VALUES (1805010211, 1, 1, 1, 0);
INSERT INTO `t_borrow_card` VALUES (1805010212, 2, 1, 1, 1);
INSERT INTO `t_borrow_card` VALUES (1805010213, 1, 1, 1, 0);
INSERT INTO `t_borrow_card` VALUES (1805010214, 2, 1, 1, 0);
INSERT INTO `t_borrow_card` VALUES (1805010217, 1, 2, 1, 0);
INSERT INTO `t_borrow_card` VALUES (1805010219, 2, 1, 0, 0);
INSERT INTO `t_borrow_card` VALUES (1805010220, 2, 4, 0, 0);
INSERT INTO `t_borrow_card` VALUES (1805010221, 1, 1, 0, 0);
INSERT INTO `t_borrow_card` VALUES (1805010222, 4, 1, 0, 1);
INSERT INTO `t_borrow_card` VALUES (1805010223, 6, 1, 0, 0);
INSERT INTO `t_borrow_card` VALUES (1805010224, 6, 2, 0, 0);
INSERT INTO `t_borrow_card` VALUES (1805010225, 1, 1, 0, 0);
INSERT INTO `t_borrow_card` VALUES (1805010226, 1, 1, 0, 0);
INSERT INTO `t_borrow_card` VALUES (1805010227, 6, 1, 0, 0);
INSERT INTO `t_borrow_card` VALUES (1805010228, 1, 5, 0, 0);
INSERT INTO `t_borrow_card` VALUES (1805010229, 11, 7, 0, 0);
INSERT INTO `t_borrow_card` VALUES (1805010230, 15, 7, 0, 0);

-- ----------------------------
-- Table structure for t_illegal
-- ----------------------------
DROP TABLE IF EXISTS `t_illegal`;
CREATE TABLE `t_illegal`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_delete` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_illegal
-- ----------------------------
INSERT INTO `t_illegal` VALUES (1, 'fack', '0', '2024-11-13 11:02:17');
INSERT INTO `t_illegal` VALUES (2, 'lhs', '0', '2024-11-13 11:05:38');
INSERT INTO `t_illegal` VALUES (3, 'lhs', '0', '2024-11-15 21:33:47');

-- ----------------------------
-- Table structure for t_library
-- ----------------------------
DROP TABLE IF EXISTS `t_library`;
CREATE TABLE `t_library`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '图书馆名字',
  `description` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图书馆介绍',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '图书馆表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_library
-- ----------------------------
INSERT INTO `t_library` VALUES (1, '南图', '111', 0);
INSERT INTO `t_library` VALUES (2, '北图', '111', 0);
INSERT INTO `t_library` VALUES (3, '教师之家', NULL, 0);
INSERT INTO `t_library` VALUES (4, '栈1', '11334456', 1);

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `card_id` int NULL DEFAULT NULL COMMENT '借阅证id',
  `content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '留言内容',
  `public_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言时间',
  `is_delete` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '留言表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES (1, 1805010202, '冲鸭，一起来看书111', '2020-06-01 23:11:59', 0);
INSERT INTO `t_message` VALUES (2, 1805010202, '我爱学习', '2020-05-29 23:12:03', 0);
INSERT INTO `t_message` VALUES (3, 1805010202, '图书馆的书质量很好，图书管理员态度非常好，系统管理员也非常热心，太棒了', '2020-06-04 23:12:24', 0);
INSERT INTO `t_message` VALUES (6, 1805010202, '咋回事', '2020-06-12 08:34:18', 0);
INSERT INTO `t_message` VALUES (10, 1805010202, '12312eqwedaw', '2024-10-03 01:25:05', 0);
INSERT INTO `t_message` VALUES (11, 1805010202, '222', '2024-10-11 11:10:59', 0);
INSERT INTO `t_message` VALUES (12, 1805010202, '345356', '2024-10-11 14:55:39', 0);
INSERT INTO `t_message` VALUES (13, 1805010223, '121231', '2024-10-11 17:29:50', 0);
INSERT INTO `t_message` VALUES (14, 1805010202, '12312412', '2024-10-27 17:04:02', 0);
INSERT INTO `t_message` VALUES (17, 1805010229, '书很不错哦！！！', '2024-10-30 10:58:37', 0);
INSERT INTO `t_message` VALUES (18, 1805010202, '222q', '2024-11-08 15:35:44', 0);
INSERT INTO `t_message` VALUES (19, 1805010202, '12121', '2024-11-13 13:56:42', 0);
INSERT INTO `t_message` VALUES (20, 1805010202, 'sdfa', '2024-11-15 21:18:47', 0);
INSERT INTO `t_message` VALUES (21, 1805010202, 'facefaf1212313', '2024-11-20 15:45:13', 0);
INSERT INTO `t_message` VALUES (22, 1805010203, 'facks134112', '2024-11-20 15:45:37', 0);
INSERT INTO `t_message` VALUES (23, 1805010202, 'fackss', '2024-11-20 15:52:05', 0);

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '告示标题',
  `detail` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '告示内容',
  `publish_date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (1, '图书系统开始建设', '123131', '2024-10-10 14:35:00');
INSERT INTO `t_notice` VALUES (2, '图书系统正在建设', '图书系统正在建设，冲鸭11', '2024-10-01 23:54:48');
INSERT INTO `t_notice` VALUES (3, '图书管理系统基本建成', '图书管理系统基本建成', '2024-10-01 15:54:27');
INSERT INTO `t_notice` VALUES (9, '测试5', '图书系统正在建设', '2024-10-02 18:05:30');
INSERT INTO `t_notice` VALUES (10, '测试4', '图书系统正在建设', '2024-10-03 01:04:14');
INSERT INTO `t_notice` VALUES (11, '测试4', '图书系统正在建设', '2024-10-10 14:36:30');
INSERT INTO `t_notice` VALUES (13, '测试4', '图书馆测试中', '2024-11-26 10:28:31');

-- ----------------------------
-- Table structure for t_rss_notification
-- ----------------------------
DROP TABLE IF EXISTS `t_rss_notification`;
CREATE TABLE `t_rss_notification`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订阅编号',
  `user_id` bigint NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订阅内容',
  `is_read` int NULL DEFAULT 0 COMMENT '是否阅读',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_delete` int NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id` DESC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_rss_notification
-- ----------------------------
INSERT INTO `t_rss_notification` VALUES (47, 1, 'SKYYYY已上架', 1, '2024-11-27 22:03:29', 0);
INSERT INTO `t_rss_notification` VALUES (46, 1, '中国童话已上架', 0, '2024-11-16 20:57:41', 0);
INSERT INTO `t_rss_notification` VALUES (45, 1, '人生删除事务所已上架', 1, '2024-11-27 22:21:46', 0);
INSERT INTO `t_rss_notification` VALUES (44, 1, '人生删除事务所已上架', 1, '2024-11-27 22:21:46', 0);
INSERT INTO `t_rss_notification` VALUES (43, 1, '美好课设已上架', 0, '2024-11-16 20:40:34', 0);
INSERT INTO `t_rss_notification` VALUES (42, 1, '美好课设已上架', 0, '2024-11-16 20:38:37', 0);
INSERT INTO `t_rss_notification` VALUES (41, 1, '人生删除事务所已上架', 1, '2024-11-27 22:21:46', 0);
INSERT INTO `t_rss_notification` VALUES (40, 1, '人生删除事务所已上架', 1, '2024-11-27 22:21:46', 0);
INSERT INTO `t_rss_notification` VALUES (39, 1, '人生删除事务所已上架', 1, '2024-11-27 22:21:46', 0);
INSERT INTO `t_rss_notification` VALUES (38, 1, '人生删除事务所已上架', 1, '2024-11-27 22:21:46', 0);
INSERT INTO `t_rss_notification` VALUES (37, 1, '人生删除事务所已上架', 1, '2024-11-27 22:21:46', 0);
INSERT INTO `t_rss_notification` VALUES (36, 1, '人生删除事务所已上架', 1, '2024-11-27 22:21:46', 0);
INSERT INTO `t_rss_notification` VALUES (35, 1, '植发的价格已上架', 0, '2024-10-31 20:06:20', 0);
INSERT INTO `t_rss_notification` VALUES (34, 1, '植发的价格已上架', 0, '2024-10-31 20:06:20', 0);
INSERT INTO `t_rss_notification` VALUES (33, 1, '战神已上架', 0, '2024-10-30 11:56:32', 0);
INSERT INTO `t_rss_notification` VALUES (32, 11, '战神已上架', 0, '2024-10-30 11:56:32', 0);
INSERT INTO `t_rss_notification` VALUES (31, 1, 'SKYYYY已上架', 1, '2024-11-27 22:03:29', 0);
INSERT INTO `t_rss_notification` VALUES (30, 11, 'SKYYYY已上架', 0, '2024-11-27 21:57:20', 0);
INSERT INTO `t_rss_notification` VALUES (29, 11, 'SKYYYY已上架', 0, '2024-11-27 21:57:25', 0);
INSERT INTO `t_rss_notification` VALUES (28, 1, 'SKYYYY已上架', 1, '2024-11-27 22:03:29', 0);
INSERT INTO `t_rss_notification` VALUES (23, 11, 'limax已上架', 0, '2024-10-30 11:28:27', 0);
INSERT INTO `t_rss_notification` VALUES (22, 1, 'limax已上架', 0, '2024-10-30 11:28:27', 0);
INSERT INTO `t_rss_notification` VALUES (21, 1, 'limax已上架', 0, '2024-10-30 11:28:27', 0);
INSERT INTO `t_rss_notification` VALUES (20, 1, '人生删除事务所已上架', 1, '2024-11-27 22:21:46', 0);
INSERT INTO `t_rss_notification` VALUES (19, 10, '人生删除事务所已上架', 0, '2024-10-30 11:21:33', 0);
INSERT INTO `t_rss_notification` VALUES (18, 1, '人生删除事务所已上架', 1, '2024-11-27 22:21:46', 0);
INSERT INTO `t_rss_notification` VALUES (17, 1, '人生删除事务所已上架', 1, '2024-11-27 22:21:46', 0);
INSERT INTO `t_rss_notification` VALUES (16, 1, '人生删除事务所已上架', 1, '2024-11-27 22:21:46', 0);

-- ----------------------------
-- Table structure for t_rules
-- ----------------------------
DROP TABLE IF EXISTS `t_rules`;
CREATE TABLE `t_rules`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `rules_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '规则名称',
  `borrow_num` int NOT NULL COMMENT '限制本数',
  `limit_day` int NOT NULL COMMENT '限制天数',
  `borrow_library` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '限制图书馆',
  `overtime_fee` decimal(10, 0) NOT NULL COMMENT '逾期金额',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '规则表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_rules
-- ----------------------------
INSERT INTO `t_rules` VALUES (1, '6天10本', 10, 60, '1、2、3', 0, 0);
INSERT INTO `t_rules` VALUES (2, '10天12本', 12, 10, '2、3', 1, 0);
INSERT INTO `t_rules` VALUES (3, '45天20本', 20, 45, '1、2、3', 1, 0);
INSERT INTO `t_rules` VALUES (4, '60天25本', 25, 60, '1、2、3', 0, 0);
INSERT INTO `t_rules` VALUES (5, '100天30本', 30, 100, '1', 0, 0);
INSERT INTO `t_rules` VALUES (6, '30天15本', 15, 30, '1、2、3', 0, 0);
INSERT INTO `t_rules` VALUES (7, '1天1本', 1, 1, '1、3', 1, 0);
INSERT INTO `t_rules` VALUES (8, '2天1本', 12, 2, '1,2,3', 2, 1);
INSERT INTO `t_rules` VALUES (9, '3天5本', 5, 3, '1,2,3', 2, 0);

-- ----------------------------
-- Table structure for t_score
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score`  (
  `id` int NOT NULL COMMENT '分数id',
  `score` int NULL DEFAULT 0 COMMENT '分数',
  `card_id` int NULL DEFAULT NULL COMMENT '借阅证id',
  `grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `next_rule_id` int NULL DEFAULT NULL COMMENT '书籍id',
  `is_delete` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_score
-- ----------------------------
INSERT INTO `t_score` VALUES (1, 30, 1805010202, '入门级', 9, '0');

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student`  (
  `id` int NOT NULL,
  `sname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES (1, '李华', 'dsafa', 1);
INSERT INTO `t_student` VALUES (2, '王力', 'www', 1);
INSERT INTO `t_student` VALUES (3, '狗蛋', '21ww', 2);

-- ----------------------------
-- Table structure for t_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher`  (
  `id` int NOT NULL,
  `tname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES (1, '阳明');
INSERT INTO `t_teacher` VALUES (2, '润之');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, '111', '111222', NULL);
INSERT INTO `t_user` VALUES (2, '222', '222333', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `oid` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '小花', '1232313', 2);
INSERT INTO `users` VALUES (2, '小力', '23421344', 1);
INSERT INTO `users` VALUES (3, '赵六', '123121', 1);

SET FOREIGN_KEY_CHECKS = 1;
