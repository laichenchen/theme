/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1_6033
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : 127.0.0.1:6033
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 06/02/2021 10:35:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'lp_project', '项目申请表', 'LpProject', 'crud', 'com.ruoyi.things', 'things', 'project', '项目申请', 'ruoyi', '0', '/', '{\"parentMenuId\":\"1061\"}', 'admin', '2020-10-31 13:48:15', '', '2020-11-02 16:00:01', NULL);
INSERT INTO `gen_table` VALUES (2, 'lp_enterprise', '企业信息', 'LpEnterprise', 'crud', 'com.ruoyi.things', 'things', 'enterprise', '企业信息', 'nanking', '0', '/', '{\"parentMenuId\":1061}', 'admin', '2020-11-02 16:19:14', '', '2020-11-02 16:24:28', NULL);
INSERT INTO `gen_table` VALUES (3, 'lp_base_device', '设备基础信息', 'LpBaseDevice', 'crud', 'com.ruoyi.things', 'things', 'device', '设备基础信息', 'nanking', '0', '/', '{\"parentMenuId\":1061}', 'admin', '2020-11-02 16:52:37', '', '2020-11-02 21:10:02', NULL);
INSERT INTO `gen_table` VALUES (4, 'lp_base_device_parameter', '设备基础参数表', 'LpBaseDeviceParameter', 'crud', 'com.ruoyi.things', 'things', 'parameter', '设备基础参数', 'nanking', '0', '/', '{\"treeCode\":\"info_id\",\"treeParentCode\":\"info_id\"}', 'admin', '2020-11-02 16:52:37', '', '2020-11-02 16:59:00', NULL);
INSERT INTO `gen_table` VALUES (5, 'lp_device_tree', '设备组织', 'LpDeviceTree', 'tree', 'com.ruoyi.things', 'things', 'devicetree', '设备组织', 'ruoyi', '0', '/', '{\"treeCode\":\"id\",\"treeName\":\"name\",\"treeParentCode\":\"parent_id\",\"parentMenuId\":\"1062\"}', 'admin', '2020-11-18 11:01:14', '', '2020-11-26 14:53:18', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', '编码', 'varchar(32)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-10-31 13:48:15', '', '2020-11-02 16:00:01');
INSERT INTO `gen_table_column` VALUES (2, '1', 'name', '项目名称', 'varchar(200)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-10-31 13:48:15', '', '2020-11-02 16:00:01');
INSERT INTO `gen_table_column` VALUES (3, '1', 'head', '项目负责人', 'varchar(100)', 'String', 'head', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-10-31 13:48:15', '', '2020-11-02 16:00:01');
INSERT INTO `gen_table_column` VALUES (4, '1', 'head_phone', '项目电话', 'varchar(20)', 'String', 'headPhone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-10-31 13:48:15', '', '2020-11-02 16:00:01');
INSERT INTO `gen_table_column` VALUES (5, '1', 'pa', '乙方', 'varchar(32)', 'String', 'pa', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-10-31 13:48:15', '', '2020-11-02 16:00:01');
INSERT INTO `gen_table_column` VALUES (6, '1', 'pb', '甲方', 'varchar(32)', 'String', 'pb', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-10-31 13:48:15', '', '2020-11-02 16:00:01');
INSERT INTO `gen_table_column` VALUES (7, '1', 'file_ids', '项目相关文件', 'varchar(330)', 'String', 'fileIds', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2020-10-31 13:48:15', '', '2020-11-02 16:00:01');
INSERT INTO `gen_table_column` VALUES (8, '1', 'create_by', '创建者', 'varchar(32)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2020-10-31 13:48:15', '', '2020-11-02 16:00:01');
INSERT INTO `gen_table_column` VALUES (9, '1', 'create_date', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2020-10-31 13:48:15', '', '2020-11-02 16:00:01');
INSERT INTO `gen_table_column` VALUES (10, '1', 'update_by', '更新者', 'varchar(32)', 'String', 'updateBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2020-10-31 13:48:15', '', '2020-11-02 16:00:01');
INSERT INTO `gen_table_column` VALUES (11, '1', 'update_date', '更新时间', 'datetime', 'Date', 'updateDate', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'datetime', '', 11, 'admin', '2020-10-31 13:48:15', '', '2020-11-02 16:00:01');
INSERT INTO `gen_table_column` VALUES (12, '1', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2020-10-31 13:48:15', '', '2020-11-02 16:00:01');
INSERT INTO `gen_table_column` VALUES (13, '1', 'del_flag', '删除标记（0：正常 1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2020-10-31 13:48:15', '', '2020-11-02 16:00:01');
INSERT INTO `gen_table_column` VALUES (14, '2', 'id', '主键', 'varchar(32)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-02 16:19:14', '', '2020-11-02 16:24:28');
INSERT INTO `gen_table_column` VALUES (15, '2', 'name', '名称', 'varchar(200)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-11-02 16:19:14', '', '2020-11-02 16:24:28');
INSERT INTO `gen_table_column` VALUES (16, '2', 'address', '地址', 'char(6)', 'String', 'address', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'select', 'sys_user_sex', 3, 'admin', '2020-11-02 16:19:14', '', '2020-11-02 16:24:28');
INSERT INTO `gen_table_column` VALUES (17, '2', 'address_detail', '地址详情', 'varchar(200)', 'String', 'addressDetail', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2020-11-02 16:19:14', '', '2020-11-02 16:24:28');
INSERT INTO `gen_table_column` VALUES (18, '2', 'address_map', '地图坐标', 'varchar(32)', 'String', 'addressMap', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2020-11-02 16:19:14', '', '2020-11-02 16:24:28');
INSERT INTO `gen_table_column` VALUES (19, '2', 'contact', '联系人', 'varchar(20)', 'String', 'contact', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2020-11-02 16:19:14', '', '2020-11-02 16:24:28');
INSERT INTO `gen_table_column` VALUES (20, '2', 'contact_mobile', '联系电话', 'varchar(20)', 'String', 'contactMobile', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2020-11-02 16:19:14', '', '2020-11-02 16:24:28');
INSERT INTO `gen_table_column` VALUES (21, '2', 'email', '邮件地址', 'varchar(100)', 'String', 'email', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2020-11-02 16:19:14', '', '2020-11-02 16:24:28');
INSERT INTO `gen_table_column` VALUES (22, '2', 'create_by', '创建者', 'varchar(32)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2020-11-02 16:19:14', '', '2020-11-02 16:24:28');
INSERT INTO `gen_table_column` VALUES (23, '2', 'create_date', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2020-11-02 16:19:14', '', '2020-11-02 16:24:28');
INSERT INTO `gen_table_column` VALUES (24, '2', 'update_by', '更新者', 'varchar(32)', 'String', 'updateBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2020-11-02 16:19:14', '', '2020-11-02 16:24:28');
INSERT INTO `gen_table_column` VALUES (25, '2', 'update_date', '更新时间', 'datetime', 'Date', 'updateDate', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'datetime', '', 12, 'admin', '2020-11-02 16:19:14', '', '2020-11-02 16:24:28');
INSERT INTO `gen_table_column` VALUES (26, '2', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2020-11-02 16:19:14', '', '2020-11-02 16:24:28');
INSERT INTO `gen_table_column` VALUES (27, '2', 'del_flag', '删除标记（0：正常 1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2020-11-02 16:19:14', '', '2020-11-02 16:24:28');
INSERT INTO `gen_table_column` VALUES (28, '3', 'ID', '主键', 'varchar(32)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 21:10:02');
INSERT INTO `gen_table_column` VALUES (29, '3', 'name', '设备名称', 'varchar(200)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 21:10:02');
INSERT INTO `gen_table_column` VALUES (30, '3', 'model', '设备型号', 'varchar(32)', 'String', 'model', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 21:10:02');
INSERT INTO `gen_table_column` VALUES (31, '3', 'type', '设备类型(01.温度02.压力)', 'char(2)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 4, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 21:10:02');
INSERT INTO `gen_table_column` VALUES (32, '3', 'file_ids', '产品资料文件', 'varchar(330)', 'String', 'fileIds', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 21:10:02');
INSERT INTO `gen_table_column` VALUES (33, '3', 'production_date', '生产日期', 'datetime', 'Date', 'productionDate', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 6, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 21:10:02');
INSERT INTO `gen_table_column` VALUES (34, '3', 'supplier_id', '设备厂家ID', 'varchar(32)', 'String', 'supplierId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 7, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 21:10:02');
INSERT INTO `gen_table_column` VALUES (35, '3', 'create_by', '创建者', 'varchar(32)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 21:10:02');
INSERT INTO `gen_table_column` VALUES (36, '3', 'create_date', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 21:10:02');
INSERT INTO `gen_table_column` VALUES (37, '3', 'update_by', '更新者', 'varchar(32)', 'String', 'updateBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 21:10:02');
INSERT INTO `gen_table_column` VALUES (38, '3', 'update_date', '更新时间', 'datetime', 'Date', 'updateDate', '0', '0', '1', '1', NULL, '1', NULL, 'EQ', 'datetime', '', 11, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 21:10:02');
INSERT INTO `gen_table_column` VALUES (39, '3', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 21:10:02');
INSERT INTO `gen_table_column` VALUES (40, '3', 'del_flag', '删除标记（0：正常 1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 21:10:02');
INSERT INTO `gen_table_column` VALUES (41, '4', 'id', '主键', 'varchar(32)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 16:59:00');
INSERT INTO `gen_table_column` VALUES (42, '4', 'info_id', '设备基础信息主键', 'varchar(32)', 'String', 'infoId', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 2, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 16:59:00');
INSERT INTO `gen_table_column` VALUES (43, '4', 'name', '参数名称', 'varchar(200)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 16:59:00');
INSERT INTO `gen_table_column` VALUES (44, '4', 'interface_name', '接口名称', 'varchar(200)', 'String', 'interfaceName', '0', '0', NULL, '1', '1', '1', NULL, 'LIKE', 'input', '', 4, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 16:59:00');
INSERT INTO `gen_table_column` VALUES (45, '4', 'control_type', '控制类型', 'char(1)', 'String', 'controlType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 5, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 16:59:00');
INSERT INTO `gen_table_column` VALUES (46, '4', 'create_by', '创建者', 'varchar(32)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 16:59:00');
INSERT INTO `gen_table_column` VALUES (47, '4', 'create_date', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 16:59:00');
INSERT INTO `gen_table_column` VALUES (48, '4', 'update_by', '更新者', 'varchar(32)', 'String', 'updateBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 16:59:00');
INSERT INTO `gen_table_column` VALUES (49, '4', 'update_date', '更新时间', 'datetime', 'Date', 'updateDate', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 16:59:00');
INSERT INTO `gen_table_column` VALUES (50, '4', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 16:59:00');
INSERT INTO `gen_table_column` VALUES (51, '4', 'del_flag', '删除标记（0：正常 1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2020-11-02 16:52:37', '', '2020-11-02 16:59:00');
INSERT INTO `gen_table_column` VALUES (52, '5', 'id', '主键', 'varchar(32)', 'String', 'id', '1', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-18 11:01:14', '', '2020-11-26 14:53:18');
INSERT INTO `gen_table_column` VALUES (53, '5', 'parent_id', '父级编号', 'varchar(32)', 'String', 'parentId', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 2, 'admin', '2020-11-18 11:01:14', '', '2020-11-26 14:53:18');
INSERT INTO `gen_table_column` VALUES (54, '5', 'parent_ids', '所有父级编号', 'varchar(2000)', 'String', 'parentIds', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'textarea', '', 3, 'admin', '2020-11-18 11:01:14', '', '2020-11-26 14:53:18');
INSERT INTO `gen_table_column` VALUES (55, '5', 'name', '名称', 'varchar(200)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2020-11-18 11:01:14', '', '2020-11-26 14:53:18');
INSERT INTO `gen_table_column` VALUES (56, '5', 'type', '类型', 'char(1)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 5, 'admin', '2020-11-18 11:01:14', '', '2020-11-26 14:53:18');
INSERT INTO `gen_table_column` VALUES (57, '5', 'address_code', '地址编码', 'char(6)', 'String', 'addressCode', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2020-11-18 11:01:14', '', '2020-11-26 14:53:18');
INSERT INTO `gen_table_column` VALUES (58, '5', 'file_id', '上传图片', 'varchar(32)', 'String', 'fileId', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2020-11-18 11:01:14', '', '2020-11-26 14:53:18');
INSERT INTO `gen_table_column` VALUES (59, '5', 'address_detail', '地址详情', 'varchar(200)', 'String', 'addressDetail', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2020-11-18 11:01:14', '', '2020-11-26 14:53:18');
INSERT INTO `gen_table_column` VALUES (60, '5', 'map', '地理坐标', 'varchar(100)', 'String', 'map', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2020-11-18 11:01:14', '', '2020-11-26 14:53:18');
INSERT INTO `gen_table_column` VALUES (61, '5', 'sort', '排序', 'int(11)', 'Long', 'sort', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-11-18 11:01:14', '', '2020-11-26 14:53:18');
INSERT INTO `gen_table_column` VALUES (62, '5', 'create_by', '创建者', 'varchar(32)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2020-11-18 11:01:14', '', '2020-11-26 14:53:18');
INSERT INTO `gen_table_column` VALUES (63, '5', 'create_date', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2020-11-18 11:01:14', '', '2020-11-26 14:53:18');
INSERT INTO `gen_table_column` VALUES (64, '5', 'update_by', '更新者', 'varchar(32)', 'String', 'updateBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2020-11-18 11:01:14', '', '2020-11-26 14:53:18');
INSERT INTO `gen_table_column` VALUES (65, '5', 'update_date', '更新时间', 'datetime', 'Date', 'updateDate', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2020-11-18 11:01:14', '', '2020-11-26 14:53:18');
INSERT INTO `gen_table_column` VALUES (66, '5', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2020-11-18 11:01:14', '', '2020-11-26 14:53:18');
INSERT INTO `gen_table_column` VALUES (67, '5', 'del_flag', '删除标记（0：正常 1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2020-11-18 11:01:14', '', '2020-11-26 14:53:18');

-- ----------------------------
-- Table structure for lp_base_device
-- ----------------------------
DROP TABLE IF EXISTS `lp_base_device`;
CREATE TABLE `lp_base_device`  (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `model` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备型号',
  `type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备类型(01.温度02.压力)',
  `file_ids` varchar(330) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品资料文件',
  `production_date` datetime(0) NULL DEFAULT NULL COMMENT '生产日期',
  `supplier_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备厂家ID',
  `latlng` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '位置坐标',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常 1：删除）',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备基础信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_base_device
-- ----------------------------
INSERT INTO `lp_base_device` VALUES ('674f87dfa9004ee2b544f330f98cc77f', '设备二', '22222222', '2', '1612402311199', '2018-01-02 00:00:00', '2', '{\"type\":\"Feature\",\"properties\":{},\"geometry\":{\"type\":\"LineString\",\"coordinates\":[[120.187155,31.791045],[120.187557,31.791483],[120.188067,31.791305],[120.188303,31.7911],[120.188228,31.790831]]}}', 'admin', '2021-02-04 09:32:03', 'admin', '2021-02-04 16:18:45', NULL, '0');
INSERT INTO `lp_base_device` VALUES ('d4d7e6a16be4498c9c6f5d8b949589ed', '设备一', 'is001', '2', '1612258683666', '2021-01-05 00:00:00', '43400d9e985d46c9a1c63a4bd079df68', '{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"properties\":{},\"geometry\":{\"type\":\"Point\",\"coordinates\":[117.78717,28.374485]}}]}', 'admin', '2021-01-28 16:13:13', 'admin', '2021-02-04 16:14:00', NULL, '0');

-- ----------------------------
-- Table structure for lp_base_device_parameter
-- ----------------------------
DROP TABLE IF EXISTS `lp_base_device_parameter`;
CREATE TABLE `lp_base_device_parameter`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `info_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备基础信息主键',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数名称',
  `interface_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口名称',
  `control_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控制类型',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常 1：删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_1`(`info_id`) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`info_id`) REFERENCES `lp_base_device` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备基础参数表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_base_device_parameter
-- ----------------------------
INSERT INTO `lp_base_device_parameter` VALUES ('7d4725c30d314901a93ba19a9875f0fa', 'd4d7e6a16be4498c9c6f5d8b949589ed', '参数2', '参数2', '3', 'admin', '2021-02-04 16:13:59', NULL, NULL, '参数3', '0');
INSERT INTO `lp_base_device_parameter` VALUES ('adb9b70c970f4e87b64c0dc69a1f6771', 'd4d7e6a16be4498c9c6f5d8b949589ed', '参数4', '参数4', '4', 'admin', '2021-02-04 16:14:00', NULL, NULL, '参数4', '0');

-- ----------------------------
-- Table structure for lp_device_tree
-- ----------------------------
DROP TABLE IF EXISTS `lp_device_tree`;
CREATE TABLE `lp_device_tree`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所有父级编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型:1地理位置2设备组',
  `address_code` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址编码',
  `file_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传图片',
  `address_detail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址详情',
  `map` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '地理坐标',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常 1：删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备组织' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_device_tree
-- ----------------------------
INSERT INTO `lp_device_tree` VALUES ('23ceaa93948d476288eff6ab230e056b', 'd11a488afcda417798c80f90c266236e', 'd11a488afcda417798c80f90c266236e', '22222', '0', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-24 22:00:49', NULL, NULL, NULL, '0');
INSERT INTO `lp_device_tree` VALUES ('eeb40fd85d7f45e3b83a705ace1772d6', 'd11a488afcda417798c80f90c266236e', 'd11a488afcda417798c80f90c266236e', 'dddd', '0', NULL, NULL, NULL, NULL, NULL, 'admin', '2020-11-24 22:01:01', NULL, NULL, NULL, '0');

-- ----------------------------
-- Table structure for lp_enterprise
-- ----------------------------
DROP TABLE IF EXISTS `lp_enterprise`;
CREATE TABLE `lp_enterprise`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `address` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `address_detail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址详情',
  `latlng` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '地图坐标',
  `contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件地址',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常 1：删除）',
  `file_ids` varchar(330) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品资料文件',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '企业信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_enterprise
-- ----------------------------
INSERT INTO `lp_enterprise` VALUES ('43400d9e985d46c9a1c63a4bd079df68', '11111111', '2', '111111111111111', '{\"type\":\"Feature\",\"properties\":{},\"geometry\":{\"type\":\"Point\",\"coordinates\":[120.330505,32.618557]}}', '111111111', '111111111', '22222', 'admin', '2021-02-01 15:07:44', 'admin', '2021-02-04 11:33:45', '1111111111111', '0', '1612409616658');

-- ----------------------------
-- Table structure for lp_project
-- ----------------------------
DROP TABLE IF EXISTS `lp_project`;
CREATE TABLE `lp_project`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `head` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目负责人',
  `head_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目电话',
  `pa` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '乙方',
  `pb` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '甲方',
  `file_ids` varchar(330) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目相关文件',
  `latlng` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '地理位置坐标',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常 1：删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lp_project
-- ----------------------------
INSERT INTO `lp_project` VALUES ('52308d9d01ed43389771b23d9d843552', '项目一', '来晨晨', '13951039002', '大萨达', '归属感', '1612342246607', NULL, 'admin', '2021-02-01 15:11:08', 'admin', '2021-02-03 16:51:01', '分为', '0');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(0) NOT NULL,
  `sched_time` bigint(0) NOT NULL,
  `priority` int(0) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E07870707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E07870707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E07870707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(0) NOT NULL,
  `checkin_interval` bigint(0) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'LD-2018031210471612424916125', 1612432448697, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(0) NOT NULL,
  `repeat_interval` bigint(0) NOT NULL,
  `times_triggered` bigint(0) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(0) NULL DEFAULT NULL,
  `int_prop_2` int(0) NULL DEFAULT NULL,
  `long_prop_1` bigint(0) NULL DEFAULT NULL,
  `long_prop_2` bigint(0) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(0) NULL DEFAULT NULL,
  `prev_fire_time` bigint(0) NULL DEFAULT NULL,
  `priority` int(0) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(0) NOT NULL,
  `end_time` bigint(0) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(0) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1612424920000, -1, 5, 'PAUSED', 'CRON', 1612424917000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1612424925000, -1, 5, 'PAUSED', 'CRON', 1612424918000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1612424920000, -1, 5, 'PAUSED', 'CRON', 1612424919000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件原名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件类型',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件路径',
  `size` bigint(0) NULL DEFAULT NULL COMMENT '文件大小',
  `upload_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上传时间',
  `upload_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '上传人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('1612258683666', 'IMG_5196.JPG', NULL, '/profile/upload/2021/02/02/c8014d53-7151-416e-b343-ec964b4e3cb0.JPG', 1343512, '2021-02-04 16:14:00', 'admin');
INSERT INTO `sys_file` VALUES ('1612342246607', 'JF4A5260.JPG', NULL, '/profile/upload/2021/02/03/37462ac5-cbef-4b04-9fc1-2374018bd84d.JPG', 3982954, '2021-02-03 16:51:01', 'admin');
INSERT INTO `sys_file` VALUES ('1612402311199', 'JF4A5260.JPG', NULL, '/profile/upload/2021/02/04/34b1881e-37d4-447a-9aee-184a92d8018a.JPG', 3982954, '2021-02-04 16:18:45', 'admin');
INSERT INTO `sys_file` VALUES ('1612409616658', 'IMG_5196.JPG', NULL, '/profile/upload/2021/02/04/1a79c625-581d-49cb-a7f6-75aae58c9d6d.JPG', 1343512, '2021-02-04 11:33:45', 'admin');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-21 08:00:56');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-21 20:27:13');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-31 13:45:11');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-10-31 14:18:26');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-11-01 20:05:36');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-11-01 20:37:19');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-11-02 15:51:54');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-11-02 21:03:09');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-11-02 21:34:01');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-02 21:40:15');
INSERT INTO `sys_logininfor` VALUES (11, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-11-11 10:08:50');
INSERT INTO `sys_logininfor` VALUES (12, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-11-11 11:05:26');
INSERT INTO `sys_logininfor` VALUES (13, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2020-11-15 12:24:08');
INSERT INTO `sys_logininfor` VALUES (14, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-11-15 12:24:15');
INSERT INTO `sys_logininfor` VALUES (15, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码已失效', '2020-11-15 14:35:12');
INSERT INTO `sys_logininfor` VALUES (16, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-11-15 14:35:16');
INSERT INTO `sys_logininfor` VALUES (17, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-11-16 20:07:34');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-16 20:10:38');
INSERT INTO `sys_logininfor` VALUES (19, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-16 21:09:37');
INSERT INTO `sys_logininfor` VALUES (20, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-17 16:37:20');
INSERT INTO `sys_logininfor` VALUES (21, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-18 10:43:32');
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-11-19 16:22:55');
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-11-19 16:55:48');
INSERT INTO `sys_logininfor` VALUES (24, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-23 13:54:37');
INSERT INTO `sys_logininfor` VALUES (25, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-23 14:32:26');
INSERT INTO `sys_logininfor` VALUES (26, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-11-23 15:46:33');
INSERT INTO `sys_logininfor` VALUES (27, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-23 15:46:40');
INSERT INTO `sys_logininfor` VALUES (28, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-24 20:25:13');
INSERT INTO `sys_logininfor` VALUES (29, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-24 21:34:02');
INSERT INTO `sys_logininfor` VALUES (30, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-26 14:47:23');
INSERT INTO `sys_logininfor` VALUES (31, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-26 16:46:05');
INSERT INTO `sys_logininfor` VALUES (32, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-12-13 13:48:12');
INSERT INTO `sys_logininfor` VALUES (33, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码已失效', '2021-01-25 11:01:14');
INSERT INTO `sys_logininfor` VALUES (34, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-01-25 11:01:19');
INSERT INTO `sys_logininfor` VALUES (35, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-01-25 13:42:27');
INSERT INTO `sys_logininfor` VALUES (36, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-01-25 14:23:33');
INSERT INTO `sys_logininfor` VALUES (37, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2021-01-25 15:04:55');
INSERT INTO `sys_logininfor` VALUES (38, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码已失效', '2021-01-25 15:09:00');
INSERT INTO `sys_logininfor` VALUES (39, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-01-25 15:09:38');
INSERT INTO `sys_logininfor` VALUES (40, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-01-25 15:10:59');
INSERT INTO `sys_logininfor` VALUES (41, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2021-01-25 15:13:56');
INSERT INTO `sys_logininfor` VALUES (42, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-01-25 15:14:05');
INSERT INTO `sys_logininfor` VALUES (43, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2021-01-25 15:22:56');
INSERT INTO `sys_logininfor` VALUES (44, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-01-25 15:23:02');
INSERT INTO `sys_logininfor` VALUES (45, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2021-01-25 15:26:59');
INSERT INTO `sys_logininfor` VALUES (46, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-01-25 15:27:08');
INSERT INTO `sys_logininfor` VALUES (47, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-01-27 09:27:48');
INSERT INTO `sys_logininfor` VALUES (48, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-01-28 15:20:36');
INSERT INTO `sys_logininfor` VALUES (49, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-01-28 15:57:20');
INSERT INTO `sys_logininfor` VALUES (50, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-01-28 16:44:08');
INSERT INTO `sys_logininfor` VALUES (51, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-02-01 09:27:11');
INSERT INTO `sys_logininfor` VALUES (52, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-02-01 10:35:29');
INSERT INTO `sys_logininfor` VALUES (53, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-02-01 10:42:05');
INSERT INTO `sys_logininfor` VALUES (54, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-02-01 14:53:59');
INSERT INTO `sys_logininfor` VALUES (55, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-02-01 17:21:21');
INSERT INTO `sys_logininfor` VALUES (56, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-02-02 09:50:14');
INSERT INTO `sys_logininfor` VALUES (57, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-02-02 11:42:38');
INSERT INTO `sys_logininfor` VALUES (58, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-02-02 13:27:29');
INSERT INTO `sys_logininfor` VALUES (59, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-02-02 15:42:15');
INSERT INTO `sys_logininfor` VALUES (60, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-02-03 09:38:43');
INSERT INTO `sys_logininfor` VALUES (61, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-02-03 10:10:45');
INSERT INTO `sys_logininfor` VALUES (62, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-02-03 13:47:41');
INSERT INTO `sys_logininfor` VALUES (63, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-02-03 14:33:21');
INSERT INTO `sys_logininfor` VALUES (64, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-02-04 09:30:44');
INSERT INTO `sys_logininfor` VALUES (65, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-02-04 11:25:04');
INSERT INTO `sys_logininfor` VALUES (66, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2021-02-04 15:51:51');
INSERT INTO `sys_logininfor` VALUES (67, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2021-02-04 15:51:55');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1088 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 10, 'system', NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2018-03-16 11:33:00', 'admin', '2020-10-31 14:25:35', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 20, 'monitor', NULL, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2018-03-16 11:33:00', 'admin', '2020-10-31 14:25:43', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 30, 'tool', NULL, 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2018-03-16 11:33:00', 'admin', '2020-10-31 14:25:49', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '宁路官网', 0, 40, 'http://ningroad.com', NULL, 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2018-03-16 11:33:00', 'admin', '2020-10-31 14:25:55', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', 'system/log/index', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 114, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 114, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 114, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 114, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 114, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 114, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1061, '信息管理', 0, 8, 'info', NULL, 1, 0, 'M', '0', '0', NULL, 'tool', 'admin', '2020-10-31 14:28:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1062, '设备管理', 0, 5, 'repair', NULL, 1, 0, 'M', '0', '0', '', 'job', 'admin', '2020-10-31 14:29:33', 'admin', '2020-11-02 22:03:10', '');
INSERT INTO `sys_menu` VALUES (1063, '设备监控', 0, 1, 'monitor', NULL, 1, 0, 'M', '0', '0', NULL, 'monitor', 'admin', '2020-10-31 14:32:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1064, '项目信息', 1061, 1, 'project', 'things/project/index', 1, 0, 'C', '0', '0', 'things:project:list', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-11-02 22:02:23', '项目申请菜单');
INSERT INTO `sys_menu` VALUES (1065, '项目申请查询', 1064, 1, '#', '', 1, 0, 'F', '0', '0', 'things:project:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1066, '项目申请新增', 1064, 2, '#', '', 1, 0, 'F', '0', '0', 'things:project:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1067, '项目申请修改', 1064, 3, '#', '', 1, 0, 'F', '0', '0', 'things:project:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1068, '项目申请删除', 1064, 4, '#', '', 1, 0, 'F', '0', '0', 'things:project:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1069, '项目申请导出', 1064, 5, '#', '', 1, 0, 'F', '0', '0', 'things:project:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1070, '企业信息', 1061, 1, 'enterprise', 'things/enterprise/index', 1, 0, 'C', '0', '0', 'things:enterprise:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '企业信息菜单');
INSERT INTO `sys_menu` VALUES (1071, '企业信息查询', 1070, 1, '#', '', 1, 0, 'F', '0', '0', 'things:enterprise:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1072, '企业信息新增', 1070, 2, '#', '', 1, 0, 'F', '0', '0', 'things:enterprise:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1073, '企业信息修改', 1070, 3, '#', '', 1, 0, 'F', '0', '0', 'things:enterprise:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1074, '企业信息删除', 1070, 4, '#', '', 1, 0, 'F', '0', '0', 'things:enterprise:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1075, '企业信息导出', 1070, 5, '#', '', 1, 0, 'F', '0', '0', 'things:enterprise:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1076, '设备信息', 1061, 1, 'basedevice', 'things/basedevice/index', 1, 0, 'C', '0', '0', 'things:basedevice:list', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-11-02 21:34:47', '设备基础信息菜单');
INSERT INTO `sys_menu` VALUES (1077, '设备基础信息查询', 1076, 1, '#', '', 1, 0, 'F', '0', '0', 'things:basedevice:query', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-11-02 21:40:55', '');
INSERT INTO `sys_menu` VALUES (1078, '设备基础信息新增', 1076, 2, '#', '', 1, 0, 'F', '0', '0', 'things:basedevice:add', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-11-02 21:41:05', '');
INSERT INTO `sys_menu` VALUES (1079, '设备基础信息修改', 1076, 3, '#', '', 1, 0, 'F', '0', '0', 'things:basedevice:edit', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-11-02 21:41:12', '');
INSERT INTO `sys_menu` VALUES (1080, '设备基础信息删除', 1076, 4, '#', '', 1, 0, 'F', '0', '0', 'things:basedevice:remove', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-11-02 21:41:20', '');
INSERT INTO `sys_menu` VALUES (1081, '设备基础信息导出', 1076, 5, '#', '', 1, 0, 'F', '0', '0', 'things:basedevice:export', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-11-02 21:41:29', '');
INSERT INTO `sys_menu` VALUES (1082, '设备组织', 1062, 1, 'devicetree', 'things/devicetree/index', 1, 0, 'C', '0', '0', 'things:devicetree:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '设备组织菜单');
INSERT INTO `sys_menu` VALUES (1083, '设备组织查询', 1082, 1, '#', '', 1, 0, 'F', '0', '0', 'things:devicetree:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1084, '设备组织新增', 1082, 2, '#', '', 1, 0, 'F', '0', '0', 'things:devicetree:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1085, '设备组织修改', 1082, 3, '#', '', 1, 0, 'F', '0', '0', 'things:devicetree:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1086, '设备组织删除', 1082, 4, '#', '', 1, 0, 'F', '0', '0', 'things:devicetree:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1087, '设备组织导出', 1082, 5, '#', '', 1, 0, 'F', '0', '0', 'things:devicetree:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'lp_project', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-31 13:48:15');
INSERT INTO `sys_oper_log` VALUES (2, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"编码\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1604123295000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"项目名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604123295000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"head\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"项目负责人\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604123295000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"head\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"headPhone\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"项目电话\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604123295000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"head_phone\"},{\"usableColumn\":fal', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-31 13:51:06');
INSERT INTO `sys_oper_log` VALUES (3, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"宁路官网\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"http://ningroad.com\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-31 14:25:15');
INSERT INTO `sys_oper_log` VALUES (4, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"10\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-31 14:25:35');
INSERT INTO `sys_oper_log` VALUES (5, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"monitor\",\"orderNum\":\"20\",\"menuName\":\"系统监控\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitor\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-31 14:25:43');
INSERT INTO `sys_oper_log` VALUES (6, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"tool\",\"orderNum\":\"30\",\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-31 14:25:49');
INSERT INTO `sys_oper_log` VALUES (7, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"40\",\"menuName\":\"宁路官网\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"http://ningroad.com\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-31 14:25:55');
INSERT INTO `sys_oper_log` VALUES (8, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"tool\",\"orderNum\":\"8\",\"menuName\":\"信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"info\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-31 14:28:18');
INSERT INTO `sys_oper_log` VALUES (9, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"job\",\"orderNum\":\"5\",\"menuName\":\"设备维护\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"repair\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-31 14:29:33');
INSERT INTO `sys_oper_log` VALUES (10, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"monitor\",\"orderNum\":\"1\",\"menuName\":\"设备监控\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitor\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-31 14:32:28');
INSERT INTO `sys_oper_log` VALUES (11, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"编码\",\"updateTime\":1604123466000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1604123295000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"项目名称\",\"isQuery\":\"1\",\"updateTime\":1604123466000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604123295000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"head\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"项目负责人\",\"isQuery\":\"1\",\"updateTime\":1604123466000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604123295000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"head\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"headPhone\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"项目电话\",\"isQuery\":\"1\",\"updateTime\":1604123466000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-10-31 14:36:14');
INSERT INTO `sys_oper_log` VALUES (12, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-01 20:23:13');
INSERT INTO `sys_oper_log` VALUES (13, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"编码\",\"updateTime\":1604126174000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1604123295000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"项目名称\",\"isQuery\":\"1\",\"updateTime\":1604126174000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604123295000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"head\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"项目负责人\",\"isQuery\":\"1\",\"updateTime\":1604126174000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604123295000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"head\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"headPhone\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"项目电话\",\"isQuery\":\"1\",\"updateTime\":1604126174000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 15:53:36');
INSERT INTO `sys_oper_log` VALUES (14, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-02 15:53:40');
INSERT INTO `sys_oper_log` VALUES (15, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"编码\",\"updateTime\":1604303615000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1604123295000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"项目名称\",\"isQuery\":\"1\",\"updateTime\":1604303615000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604123295000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"name\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"head\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"项目负责人\",\"isQuery\":\"1\",\"updateTime\":1604303616000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604123295000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"head\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"headPhone\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"项目电话\",\"isQuery\":\"1\",\"updateTime\":1604303616000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 16:00:01');
INSERT INTO `sys_oper_log` VALUES (16, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-02 16:00:06');
INSERT INTO `sys_oper_log` VALUES (17, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-02 16:19:07');
INSERT INTO `sys_oper_log` VALUES (18, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'lp_enterprise', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 16:19:14');
INSERT INTO `sys_oper_log` VALUES (19, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"nanking\",\"columns\":[{\"usableColumn\":false,\"columnId\":14,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1604305154000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604305154000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"nanme\"},{\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_user_sex\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"address\",\"htmlType\":\"select\",\"edit\":true,\"query\":false,\"columnComment\":\"地址\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(6)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604305154000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"address\"},{\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"addressDetail\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"地址详情\",\"sort\":4,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604305154000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"address_detail\"},{\"usableColumn\":false,\"columnId\":18,\"isIncrement', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 16:24:28');
INSERT INTO `sys_oper_log` VALUES (20, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-02 16:27:09');
INSERT INTO `sys_oper_log` VALUES (21, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'lp_base_device,lp_base_device_parameter', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 16:52:37');
INSERT INTO `sys_oper_log` VALUES (22, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"nanking\",\"columns\":[{\"usableColumn\":false,\"columnId\":28,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1604307157000,\"tableId\":3,\"pk\":true,\"columnName\":\"ID\"},{\"usableColumn\":false,\"columnId\":29,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604307157000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"name\"},{\"usableColumn\":false,\"columnId\":30,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"model\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"设备型号\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604307157000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"model\"},{\"usableColumn\":false,\"columnId\":31,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_user_sex\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"设备类型(01.温度02.压力)\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(2)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604307157000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"type\"},{\"usableColumn\":false,\"columnId\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 16:55:21');
INSERT INTO `sys_oper_log` VALUES (23, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"nanking\",\"columns\":[{\"usableColumn\":false,\"columnId\":41,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1604307157000,\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":42,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"infoId\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"设备基础信息主键\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604307157000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"info_id\"},{\"usableColumn\":false,\"columnId\":43,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"参数名称\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604307157000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"name\"},{\"usableColumn\":false,\"columnId\":44,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"interfaceName\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"接口名称\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604307157000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"interface_name\"},{\"usableColumn\":false,\"columnId\":45,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 16:59:00');
INSERT INTO `sys_oper_log` VALUES (24, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-02 21:09:23');
INSERT INTO `sys_oper_log` VALUES (25, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-02 21:09:31');
INSERT INTO `sys_oper_log` VALUES (26, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"nanking\",\"columns\":[{\"usableColumn\":false,\"columnId\":28,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"updateTime\":1604307321000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1604307157000,\"tableId\":3,\"pk\":true,\"columnName\":\"ID\"},{\"usableColumn\":false,\"columnId\":29,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"设备名称\",\"isQuery\":\"1\",\"updateTime\":1604307321000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604307157000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"name\"},{\"usableColumn\":false,\"columnId\":30,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"model\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"设备型号\",\"updateTime\":1604307321000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1604307157000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"model\"},{\"usableColumn\":false,\"columnId\":31,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_user_sex\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"设备类型(01.温度02.压力)\",\"isQuery\":\"1\",\"updateTime\":1604307321000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(2)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createT', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 21:10:02');
INSERT INTO `sys_oper_log` VALUES (27, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-02 21:10:06');
INSERT INTO `sys_oper_log` VALUES (28, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"设备信息\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"basedevice\",\"component\":\"things/basedevice/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1076,\"menuType\":\"C\",\"perms\":\"things:basedevice:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 21:34:47');
INSERT INTO `sys_oper_log` VALUES (29, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"设备基础信息查询\",\"params\":{},\"parentId\":1076,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1077,\"menuType\":\"F\",\"perms\":\"things:basedevice:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 21:40:55');
INSERT INTO `sys_oper_log` VALUES (30, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"2\",\"menuName\":\"设备基础信息新增\",\"params\":{},\"parentId\":1076,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1078,\"menuType\":\"F\",\"perms\":\"things:basedevice:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 21:41:05');
INSERT INTO `sys_oper_log` VALUES (31, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"3\",\"menuName\":\"设备基础信息修改\",\"params\":{},\"parentId\":1076,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1079,\"menuType\":\"F\",\"perms\":\"things:basedevice:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 21:41:12');
INSERT INTO `sys_oper_log` VALUES (32, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"4\",\"menuName\":\"设备基础信息删除\",\"params\":{},\"parentId\":1076,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1080,\"menuType\":\"F\",\"perms\":\"things:basedevice:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 21:41:20');
INSERT INTO `sys_oper_log` VALUES (33, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"5\",\"menuName\":\"设备基础信息导出\",\"params\":{},\"parentId\":1076,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1081,\"menuType\":\"F\",\"perms\":\"things:basedevice:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 21:41:29');
INSERT INTO `sys_oper_log` VALUES (34, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"项目信息\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"project\",\"component\":\"things/project/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1064,\"menuType\":\"C\",\"perms\":\"things:project:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 22:02:23');
INSERT INTO `sys_oper_log` VALUES (35, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"job\",\"orderNum\":\"5\",\"menuName\":\"设备管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"repair\",\"children\":[],\"createTime\":1604125773000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1062,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-02 22:03:10');
INSERT INTO `sys_oper_log` VALUES (36, '项目申请', 1, 'com.ruoyi.web.controller.things.LpProjectController.add()', 'POST', 1, 'admin', NULL, '/things/project', '127.0.0.1', '内网IP', '{\"params\":{},\"head\":\"张三\",\"pa\":\"乙方\",\"pb\":\"甲方\",\"headPhone\":\"15656543421\",\"name\":\"测试项目\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\severs2020\\RuoYi-Vue\\internet_things\\target\\classes\\mapper\\things\\LpProjectMapper.xml]\r\n### The error may involve com.ruoyi.things.mapper.LpProjectMapper.insertLpProject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_project          ( name,             head,             head_phone,             pa,             pb )           values ( ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2020-11-02 23:03:29');
INSERT INTO `sys_oper_log` VALUES (37, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'lp_device_tree', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-18 11:01:14');
INSERT INTO `sys_oper_log` VALUES (38, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":52,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1605668474000,\"tableId\":5,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":true,\"columnId\":53,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"父级编号\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1605668474000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"parent_id\"},{\"usableColumn\":false,\"columnId\":54,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentIds\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"所有父级编号\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(2000)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1605668474000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"parent_ids\"},{\"usableColumn\":false,\"columnId\":55,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"名称\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1605668474000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"name\"},{\"usableColumn\":false', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-18 11:02:32');
INSERT INTO `sys_oper_log` VALUES (39, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":52,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"updateTime\":1605668552000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1605668474000,\"tableId\":5,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":true,\"columnId\":53,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"父级编号\",\"updateTime\":1605668552000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1605668474000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"parent_id\"},{\"usableColumn\":false,\"columnId\":54,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentIds\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":false,\"columnComment\":\"所有父级编号\",\"updateTime\":1605668552000,\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(2000)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1605668474000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"parent_ids\"},{\"usableColumn\":false,\"columnId\":55,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"名称\",\"isQuery\":\"1\",\"updateTime\":1605668552000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1605668474000,\"isE', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-18 11:04:56');
INSERT INTO `sys_oper_log` VALUES (40, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":52,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"updateTime\":1605668696000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1605668474000,\"tableId\":5,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":true,\"columnId\":53,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"父级编号\",\"updateTime\":1605668696000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1605668474000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"parent_id\"},{\"usableColumn\":false,\"columnId\":54,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentIds\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":false,\"columnComment\":\"所有父级编号\",\"updateTime\":1605668696000,\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(2000)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1605668474000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"parent_ids\"},{\"usableColumn\":false,\"columnId\":55,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"名称\",\"isQuery\":\"1\",\"updateTime\":1605668696000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1605668474000,\"isE', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-18 11:05:09');
INSERT INTO `sys_oper_log` VALUES (41, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-18 11:05:40');
INSERT INTO `sys_oper_log` VALUES (42, '设备组织', 1, 'com.ruoyi.web.controller.things.LpDeviceTreeController.add()', 'POST', 1, 'admin', NULL, '/things/tree', '127.0.0.1', '内网IP', '{\"type\":\"0\",\"children\":[],\"params\":{},\"name\":\"测试项目\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\severs2020\\RuoYi-Vue\\internet_things\\target\\classes\\mapper\\things\\LpDeviceTreeMapper.xml]\r\n### The error may involve com.ruoyi.things.mapper.LpDeviceTreeMapper.insertLpDeviceTree-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_device_tree          ( name,             type )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2020-11-23 14:48:56');
INSERT INTO `sys_oper_log` VALUES (43, '设备组织', 1, 'com.ruoyi.web.controller.things.LpDeviceTreeController.add()', 'POST', 1, 'admin', NULL, '/things/tree', '127.0.0.1', '内网IP', '{\"type\":\"0\",\"children\":[],\"params\":{},\"name\":\"测试项目\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\severs2020\\RuoYi-Vue\\internet_things\\target\\classes\\mapper\\things\\LpDeviceTreeMapper.xml]\r\n### The error may involve com.ruoyi.things.mapper.LpDeviceTreeMapper.insertLpDeviceTree-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_device_tree          ( name,             type )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2020-11-23 14:48:56');
INSERT INTO `sys_oper_log` VALUES (44, '设备组织', 1, 'com.ruoyi.web.controller.things.LpDeviceTreeController.add()', 'POST', 1, 'admin', NULL, '/things/tree', '127.0.0.1', '内网IP', '{\"type\":\"0\",\"children\":[],\"id\":\"ab38fbff41f34404a461cb5b84966039\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1606115782718,\"name\":\"测试\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'create_date\' doesn\'t have a default value\r\n### The error may exist in file [D:\\severs2020\\RuoYi-Vue\\internet_things\\target\\classes\\mapper\\things\\LpDeviceTreeMapper.xml]\r\n### The error may involve com.ruoyi.things.mapper.LpDeviceTreeMapper.insertLpDeviceTree-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_device_tree          ( id,                                       name,             type,                                                                              create_by )           values ( ?,                                       ?,             ?,                                                                              ? )\r\n### Cause: java.sql.SQLException: Field \'create_date\' doesn\'t have a default value\n; Field \'create_date\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'create_date\' doesn\'t have a default value', '2020-11-23 15:16:22');
INSERT INTO `sys_oper_log` VALUES (45, '设备组织', 1, 'com.ruoyi.web.controller.things.LpDeviceTreeController.add()', 'POST', 1, 'admin', NULL, '/things/tree', '127.0.0.1', '内网IP', '{\"type\":\"0\",\"children\":[],\"id\":\"8a1df972001e4196a70f2c35c6c84099\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1606115950142,\"name\":\"测试\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'create_date\' doesn\'t have a default value\r\n### The error may exist in file [D:\\severs2020\\RuoYi-Vue\\internet_things\\target\\classes\\mapper\\things\\LpDeviceTreeMapper.xml]\r\n### The error may involve com.ruoyi.things.mapper.LpDeviceTreeMapper.insertLpDeviceTree-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_device_tree          ( id,                                       name,             type,                                                                              create_by )           values ( ?,                                       ?,             ?,                                                                              ? )\r\n### Cause: java.sql.SQLException: Field \'create_date\' doesn\'t have a default value\n; Field \'create_date\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'create_date\' doesn\'t have a default value', '2020-11-23 15:19:30');
INSERT INTO `sys_oper_log` VALUES (46, '设备组织', 1, 'com.ruoyi.web.controller.things.LpDeviceTreeController.add()', 'POST', 1, 'admin', NULL, '/things/tree', '127.0.0.1', '内网IP', '{\"type\":\"0\",\"children\":[],\"id\":\"1ba6c472c6ed4d4286fd147308725f4b\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1606117617668,\"name\":\"测试\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'update_by\' doesn\'t have a default value\r\n### The error may exist in file [D:\\severs2020\\RuoYi-Vue\\internet_things\\target\\classes\\mapper\\things\\LpDeviceTreeMapper.xml]\r\n### The error may involve com.ruoyi.things.mapper.LpDeviceTreeMapper.insertLpDeviceTree-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_device_tree          ( id,                                       name,             type,                                                                              create_by,             create_time )           values ( ?,                                       ?,             ?,                                                                              ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'update_by\' doesn\'t have a default value\n; Field \'update_by\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'update_by\' doesn\'t have a default value', '2020-11-23 15:46:57');
INSERT INTO `sys_oper_log` VALUES (47, '设备组织', 1, 'com.ruoyi.web.controller.things.LpDeviceTreeController.add()', 'POST', 1, 'admin', NULL, '/things/tree', '127.0.0.1', '内网IP', '{\"type\":\"0\",\"children\":[],\"id\":\"d11a488afcda417798c80f90c266236e\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1606118171229,\"name\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 15:56:11');
INSERT INTO `sys_oper_log` VALUES (48, '设备组织', 1, 'com.ruoyi.web.controller.things.LpDeviceTreeController.add()', 'POST', 1, 'admin', NULL, '/things/tree', '127.0.0.1', '内网IP', '{\"type\":\"0\",\"children\":[],\"id\":\"23ceaa93948d476288eff6ab230e056b\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1606226448745,\"name\":\"22222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 22:00:48');
INSERT INTO `sys_oper_log` VALUES (49, '设备组织', 1, 'com.ruoyi.web.controller.things.LpDeviceTreeController.add()', 'POST', 1, 'admin', NULL, '/things/tree', '127.0.0.1', '内网IP', '{\"type\":\"0\",\"children\":[],\"id\":\"eeb40fd85d7f45e3b83a705ace1772d6\",\"params\":{},\"createBy\":\"admin\",\"createTime\":1606226460981,\"name\":\"dddd\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 22:01:01');
INSERT INTO `sys_oper_log` VALUES (50, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":52,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"updateTime\":1605668709000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1605668474000,\"tableId\":5,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":true,\"columnId\":53,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"父级编号\",\"updateTime\":1605668709000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1605668474000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"parent_id\"},{\"usableColumn\":false,\"columnId\":54,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentIds\",\"htmlType\":\"textarea\",\"edit\":false,\"query\":false,\"columnComment\":\"所有父级编号\",\"updateTime\":1605668709000,\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(2000)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1605668474000,\"tableId\":5,\"pk\":false,\"columnName\":\"parent_ids\"},{\"usableColumn\":false,\"columnId\":55,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"名称\",\"isQuery\":\"1\",\"updateTime\":1605668709000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":160566', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-26 14:53:18');
INSERT INTO `sys_oper_log` VALUES (51, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-26 14:54:59');
INSERT INTO `sys_oper_log` VALUES (52, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-01-27 09:30:58');
INSERT INTO `sys_oper_log` VALUES (53, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-01-27 09:31:06');
INSERT INTO `sys_oper_log` VALUES (54, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-01-28 15:21:59');
INSERT INTO `sys_oper_log` VALUES (55, '设备基础信息', 1, 'com.ruoyi.web.controller.things.LpBaseDeviceController.add()', 'POST', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"params\":{},\"type\":\"2\",\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593391,\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-28 16:13:13');
INSERT INTO `sys_oper_log` VALUES (56, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1611821635043,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-28 16:13:55');
INSERT INTO `sys_oper_log` VALUES (57, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1611821723829,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-28 16:15:23');
INSERT INTO `sys_oper_log` VALUES (58, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1611821783948,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-28 16:16:24');
INSERT INTO `sys_oper_log` VALUES (59, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1611823481110,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-28 16:44:41');
INSERT INTO `sys_oper_log` VALUES (60, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1611824190663,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-28 16:56:31');
INSERT INTO `sys_oper_log` VALUES (61, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1611825441074,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-28 17:17:21');
INSERT INTO `sys_oper_log` VALUES (62, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, NULL, NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1611827854480,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-01-28 17:57:36');
INSERT INTO `sys_oper_log` VALUES (63, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612142980577,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"params\":{},\"controlType\":\"参数一\",\"name\":\"参数一\",\"interfaceName\":\"参数一\",\"remarks\":\"参数一\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-01 09:29:47');
INSERT INTO `sys_oper_log` VALUES (64, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612142981000,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"updateTime\":1612146955365,\"params\":{},\"controlType\":\"参数一\",\"updateBy\":\"admin\",\"name\":\"参数一\",\"id\":\"2c219011afa340cd9034f6d35f3613ff\",\"interfaceName\":\"参数一\",\"remarks\":\"参数一\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'control_type\' at row 1\r\n### The error may exist in file [E:\\来晨晨的私人文档\\code\\theme\\internet_things\\target\\classes\\mapper\\things\\LpBaseDeviceParameterMapper.xml]\r\n### The error may involve com.ruoyi.things.mapper.LpBaseDeviceParameterMapper.insertLpBaseDeviceParameter-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_base_device_parameter          ( ID,             name,             interface_name,             control_type,                                       update_by,             update_time,             remarks )           values ( ?,             ?,             ?,             ?,                                       ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'control_type\' at row 1\n; Data truncation: Data too long for column \'control_type\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'control_type\' at row 1', '2021-02-01 10:35:56');
INSERT INTO `sys_oper_log` VALUES (65, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612142981000,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"updateTime\":1612146968560,\"params\":{},\"controlType\":\"1\",\"updateBy\":\"admin\",\"name\":\"参数一\",\"id\":\"9f1c142558dc4173a56a2e3ead922d2c\",\"interfaceName\":\"参数一\",\"remarks\":\"参数一\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'create_by\' doesn\'t have a default value\r\n### The error may exist in file [E:\\来晨晨的私人文档\\code\\theme\\internet_things\\target\\classes\\mapper\\things\\LpBaseDeviceParameterMapper.xml]\r\n### The error may involve com.ruoyi.things.mapper.LpBaseDeviceParameterMapper.insertLpBaseDeviceParameter-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_base_device_parameter          ( ID,             name,             interface_name,             control_type,                                       update_by,             update_time,             remarks )           values ( ?,             ?,             ?,             ?,                                       ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'create_by\' doesn\'t have a default value\n; Field \'create_by\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'create_by\' doesn\'t have a default value', '2021-02-01 10:36:08');
INSERT INTO `sys_oper_log` VALUES (66, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612142981000,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"updateTime\":1612146973998,\"params\":{},\"controlType\":\"1\",\"updateBy\":\"admin\",\"name\":\"参数一\",\"id\":\"060afa79620446de9e01372708394960\",\"interfaceName\":\"参数一\",\"remarks\":\"参数一\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'create_by\' doesn\'t have a default value\r\n### The error may exist in file [E:\\来晨晨的私人文档\\code\\theme\\internet_things\\target\\classes\\mapper\\things\\LpBaseDeviceParameterMapper.xml]\r\n### The error may involve com.ruoyi.things.mapper.LpBaseDeviceParameterMapper.insertLpBaseDeviceParameter-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_base_device_parameter          ( ID,             name,             interface_name,             control_type,                                       update_by,             update_time,             remarks )           values ( ?,             ?,             ?,             ?,                                       ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'create_by\' doesn\'t have a default value\n; Field \'create_by\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'create_by\' doesn\'t have a default value', '2021-02-01 10:36:14');
INSERT INTO `sys_oper_log` VALUES (67, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612142981000,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"updateTime\":1612147007285,\"params\":{},\"controlType\":\"1\",\"updateBy\":\"admin\",\"name\":\"参数一\",\"id\":\"09eeaf83de1c4c8284be9cf5b8f5a775\",\"interfaceName\":\"参数一\",\"remarks\":\"参数一\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'create_by\' doesn\'t have a default value\r\n### The error may exist in file [E:\\来晨晨的私人文档\\code\\theme\\internet_things\\target\\classes\\mapper\\things\\LpBaseDeviceParameterMapper.xml]\r\n### The error may involve com.ruoyi.things.mapper.LpBaseDeviceParameterMapper.insertLpBaseDeviceParameter-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_base_device_parameter          ( ID,             name,             interface_name,             control_type,                                       update_by,             update_time,             remarks )           values ( ?,             ?,             ?,             ?,                                       ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'create_by\' doesn\'t have a default value\n; Field \'create_by\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'create_by\' doesn\'t have a default value', '2021-02-01 10:36:47');
INSERT INTO `sys_oper_log` VALUES (68, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612142981000,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"updateTime\":1612147028471,\"params\":{},\"controlType\":\"1\",\"updateBy\":\"admin\",\"name\":\"参数一\",\"id\":\"3ad0208c43d44b53abb4876fc046de0e\",\"interfaceName\":\"参数一\",\"remarks\":\"参数一\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'create_by\' doesn\'t have a default value\r\n### The error may exist in file [E:\\来晨晨的私人文档\\code\\theme\\internet_things\\target\\classes\\mapper\\things\\LpBaseDeviceParameterMapper.xml]\r\n### The error may involve com.ruoyi.things.mapper.LpBaseDeviceParameterMapper.insertLpBaseDeviceParameter-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_base_device_parameter          ( ID,             name,             interface_name,             control_type,                                       update_by,             update_time,             remarks )           values ( ?,             ?,             ?,             ?,                                       ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'create_by\' doesn\'t have a default value\n; Field \'create_by\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'create_by\' doesn\'t have a default value', '2021-02-01 10:37:08');
INSERT INTO `sys_oper_log` VALUES (69, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612142981000,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"updateTime\":1612147097769,\"params\":{},\"controlType\":\"1\",\"updateBy\":\"admin\",\"name\":\"参数一\",\"id\":\"97a190a2a2674cc1b5eec78f1b4caf64\",\"interfaceName\":\"参数一\",\"remarks\":\"参数一\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'create_by\' doesn\'t have a default value\r\n### The error may exist in file [E:\\来晨晨的私人文档\\code\\theme\\internet_things\\target\\classes\\mapper\\things\\LpBaseDeviceParameterMapper.xml]\r\n### The error may involve com.ruoyi.things.mapper.LpBaseDeviceParameterMapper.insertLpBaseDeviceParameter-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_base_device_parameter          ( ID,             name,             interface_name,             control_type,                                       update_by,             update_time,             remarks )           values ( ?,             ?,             ?,             ?,                                       ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'create_by\' doesn\'t have a default value\n; Field \'create_by\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'create_by\' doesn\'t have a default value', '2021-02-01 10:41:03');
INSERT INTO `sys_oper_log` VALUES (70, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612147353040,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"1\",\"createTime\":1612147342749,\"name\":\"参数1\",\"id\":\"67cd4846472d41e9b3692b68af6c158d\",\"interfaceName\":\"参数1\",\"remarks\":\"参数1\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-01 10:42:33');
INSERT INTO `sys_oper_log` VALUES (71, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612149653814,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612149649803,\"name\":\"参数2\",\"id\":\"7112eeabf319459395a8757093630e8d\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-01 11:20:54');
INSERT INTO `sys_oper_log` VALUES (72, '企业信息', 1, 'com.ruoyi.web.controller.things.LpEnterpriseController.add()', 'POST', 1, 'admin', NULL, '/things/enterprise', '127.0.0.1', '内网IP', '{\"contactMobile\":\"1111111111\",\"address\":\"2\",\"addressMap\":\"1111111111111\",\"params\":{},\"createBy\":\"admin\",\"addressDetail\":\"11111111111111\",\"createTime\":1612150080109,\"contact\":\"1111111111\",\"name\":\"速度时空\",\"id\":\"0907d2dec79044e9bd5207b1750bb303\",\"email\":\"11111111111\",\"remarks\":\"111111111\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'updateDate\' in \'class com.ruoyi.things.domain.LpEnterprise\'', '2021-02-01 11:28:00');
INSERT INTO `sys_oper_log` VALUES (73, '企业信息', 1, 'com.ruoyi.web.controller.things.LpEnterpriseController.add()', 'POST', 1, 'admin', NULL, '/things/enterprise', '127.0.0.1', '内网IP', '{\"contactMobile\":\"1111111111\",\"address\":\"2\",\"addressMap\":\"1111111111111\",\"params\":{},\"createBy\":\"admin\",\"addressDetail\":\"11111111111111\",\"createTime\":1612150562508,\"contact\":\"1111111111\",\"name\":\"速度时空\",\"id\":\"3a7f1952735346559cc514eb8c4c19a4\",\"email\":\"11111111111\",\"remarks\":\"111111111\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'updateDate\' in \'class com.ruoyi.things.domain.LpEnterprise\'', '2021-02-01 11:36:02');
INSERT INTO `sys_oper_log` VALUES (74, '企业信息', 1, 'com.ruoyi.web.controller.things.LpEnterpriseController.add()', 'POST', 1, 'admin', NULL, '/things/enterprise', '127.0.0.1', '内网IP', '{\"contactMobile\":\"111111111111\",\"address\":\"2\",\"addressMap\":\"11111\",\"params\":{},\"createBy\":\"admin\",\"addressDetail\":\"111111111\",\"createTime\":1612150682807,\"contact\":\"111111111111111\",\"name\":\"速度时空\",\"id\":\"e3213d1070ff4fb8ab2c8b7a63c35568\",\"email\":\"1111111111\",\"remarks\":\"11111111\"}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'updateDate\' in \'class com.ruoyi.things.domain.LpEnterprise\'', '2021-02-01 11:38:02');
INSERT INTO `sys_oper_log` VALUES (75, '企业信息', 1, 'com.ruoyi.web.controller.things.LpEnterpriseController.add()', 'POST', 1, 'admin', NULL, '/things/enterprise', '127.0.0.1', '内网IP', '{\"contactMobile\":\"111111111\",\"address\":\"2\",\"addressMap\":\"111111111\",\"params\":{},\"createBy\":\"admin\",\"addressDetail\":\"111111111111111\",\"createTime\":1612163264098,\"contact\":\"111111111\",\"name\":\"11111111\",\"id\":\"43400d9e985d46c9a1c63a4bd079df68\",\"email\":\"11111111\",\"remarks\":\"1111111111111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-01 15:07:44');
INSERT INTO `sys_oper_log` VALUES (76, '企业信息', 2, 'com.ruoyi.web.controller.things.LpEnterpriseController.edit()', 'PUT', 1, 'admin', NULL, '/things/enterprise', '127.0.0.1', '内网IP', '{\"contactMobile\":\"111111111\",\"address\":\"2\",\"addressMap\":\"111111111\",\"updateTime\":1612163386964,\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"addressDetail\":\"111111111111111\",\"createTime\":1612163264000,\"updateBy\":\"admin\",\"contact\":\"111111111\",\"name\":\"11111111\",\"id\":\"43400d9e985d46c9a1c63a4bd079df68\",\"email\":\"22222\",\"remarks\":\"1111111111111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-01 15:09:47');
INSERT INTO `sys_oper_log` VALUES (77, '项目申请', 1, 'com.ruoyi.web.controller.things.LpProjectController.add()', 'POST', 1, 'admin', NULL, '/things/project', '127.0.0.1', '内网IP', '{\"params\":{},\"head\":\"来晨晨\",\"pa\":\"大萨达\",\"createBy\":\"admin\",\"pb\":\"归属感\",\"headPhone\":\"13951039002\",\"createTime\":1612163468462,\"fileIds\":\"个人\",\"name\":\"项目一\",\"id\":\"52308d9d01ed43389771b23d9d843552\",\"remarks\":\"分为\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-01 15:11:08');
INSERT INTO `sys_oper_log` VALUES (78, '设备基础信息', 1, 'com.ruoyi.web.controller.things.LpBaseDeviceController.add()', 'POST', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"params\":{},\"lpBaseDeviceParametersList\":[],\"createBy\":\"admin\",\"createTime\":1612235425376,\"id\":\"db49bda4da07438cb705a8e6d4e13c74\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-02 11:10:25');
INSERT INTO `sys_oper_log` VALUES (79, '设备基础信息', 3, 'com.ruoyi.web.controller.things.LpBaseDeviceController.remove()', 'DELETE', 1, 'admin', NULL, '/things/basedevice/db49bda4da07438cb705a8e6d4e13c74', '127.0.0.1', '内网IP', '{ids=db49bda4da07438cb705a8e6d4e13c74}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-02 11:10:32');
INSERT INTO `sys_oper_log` VALUES (80, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612149654000,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612247813332,\"name\":\"参数2\",\"id\":\"5a70392cdcbd4a2a8155fcd828a29ba9\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"参数33\",\"createTime\":1612247813464,\"name\":\"参数3\",\"id\":\"7184a148b25149f39f9f1289af5464fd\",\"interfaceName\":\"参数333\",\"remarks\":\"参数3333\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'control_type\' at row 1\r\n### The error may exist in file [E:\\来晨晨的私人文档\\code\\theme\\internet_things\\target\\classes\\mapper\\things\\LpBaseDeviceParameterMapper.xml]\r\n### The error may involve com.ruoyi.things.mapper.LpBaseDeviceParameterMapper.insertLpBaseDeviceParameter-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_base_device_parameter          ( ID,             info_id,             name,             interface_name,             control_type,             create_by,             create_time,                                       remarks )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'control_type\' at row 1\n; Data truncation: Data too long for column \'control_type\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'control_type\' at row 1', '2021-02-02 14:36:53');
INSERT INTO `sys_oper_log` VALUES (81, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612149654000,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612247828422,\"name\":\"参数2\",\"id\":\"92cd959a2dc046aeba8692c5ba8b1b56\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"33\",\"createTime\":1612247828489,\"name\":\"参数3\",\"id\":\"dabc5866cc224cd193ed783a4328e7e6\",\"interfaceName\":\"参数333\",\"remarks\":\"参数3333\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'control_type\' at row 1\r\n### The error may exist in file [E:\\来晨晨的私人文档\\code\\theme\\internet_things\\target\\classes\\mapper\\things\\LpBaseDeviceParameterMapper.xml]\r\n### The error may involve com.ruoyi.things.mapper.LpBaseDeviceParameterMapper.insertLpBaseDeviceParameter-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into lp_base_device_parameter          ( ID,             info_id,             name,             interface_name,             control_type,             create_by,             create_time,                                       remarks )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'control_type\' at row 1\n; Data truncation: Data too long for column \'control_type\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'control_type\' at row 1', '2021-02-02 14:37:08');
INSERT INTO `sys_oper_log` VALUES (82, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612247833404,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612247833263,\"name\":\"参数2\",\"id\":\"596d274449df4ca4a218f00e8c6ac91b\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612247833338,\"name\":\"参数3\",\"id\":\"52f53656ed96440fb1e59769150187c0\",\"interfaceName\":\"参数333\",\"remarks\":\"参数3333\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-02 14:37:13');
INSERT INTO `sys_oper_log` VALUES (83, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612249166701,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612249166543,\"name\":\"参数3\",\"id\":\"1e796aefedb241ba9f9d602bc1f59684\",\"interfaceName\":\"参数333\",\"remarks\":\"参数3333\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612249166643,\"name\":\"参数2\",\"id\":\"382f5f5a26574918abd1928abf406d4e\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"fileList\":[{\"originalName\":\"微信图片_20210201135916.jpg\",\"path\":\"/profile/upload/2021/02/02/df03b36e-d658-47c1-adf1-982a6cdb88b3.jpg\",\"size\":\"192726\",\"id\":\"1612249163591\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-02 14:59:26');
INSERT INTO `sys_oper_log` VALUES (84, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612249264943,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612249264777,\"name\":\"参数3\",\"id\":\"bddddeab26344c12808159d0b5f63017\",\"interfaceName\":\"参数333\",\"remarks\":\"参数3333\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612249264883,\"name\":\"参数2\",\"id\":\"dc68f8d400484d14bf8333032a546907\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"fileList\":[{\"originalName\":\"微信图片_20210201135852.jpg\",\"path\":\"/profile/upload/2021/02/02/d6b2d7b0-93a9-4dc2-b3fa-747d679c6cc4.jpg\",\"size\":\"183185\",\"id\":\"1612249195587\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-02 15:01:05');
INSERT INTO `sys_oper_log` VALUES (85, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612251774451,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612251774319,\"name\":\"参数3\",\"id\":\"88006f4adca046138041ff3bec1cd14b\",\"interfaceName\":\"参数333\",\"remarks\":\"参数3333\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612251774416,\"name\":\"参数2\",\"id\":\"b145b4d185a9486b896d1b00d1561fcf\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"fileList\":[{\"originalName\":\"微信图片_20210201135929.jpg\",\"path\":\"/profile/upload/2021/02/02/24fa81f2-4d25-45f1-9150-2c7542bc3445.jpg\",\"size\":\"153099\",\"id\":\"1612251749325\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-02 15:42:54');
INSERT INTO `sys_oper_log` VALUES (86, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612251774000,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612251860674,\"name\":\"参数2\",\"id\":\"a31c8b51038147799136685e4828f242\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"4\",\"createTime\":1612251862918,\"name\":\"参数4\",\"id\":\"42fb8802779844198050203ddc415109\",\"interfaceName\":\"参数4\",\"remarks\":\"参数4\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"fileList\":[{\"originalName\":\"微信图片_20210201135908.jpg\",\"uploadBy\":\"admin\",\"path\":\"/profile/upload/2021/02/02/34f560b0-68ab-4144-956e-ad4848c2c4f2.jpg\",\"size\":\"147551\",\"id\":\"1612251824315\",\"uploadTime\":1612251869186}]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [E:\\来晨晨的私人文档\\code\\theme\\ruoyi-system\\target\\classes\\mapper\\system\\SystemFileMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SystemFileMapper.insertFile-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_file(                        id,                                 original_name,                                           path,                                 size,              upload_time,upload_by   )values(                        ?,                                 ?,                                           ?,             ?,?   )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2021-02-02 15:44:35');
INSERT INTO `sys_oper_log` VALUES (87, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612252011770,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"4\",\"createTime\":1612252002497,\"name\":\"参数4\",\"id\":\"8ba04056704f4a969684ce8ffc729b64\",\"interfaceName\":\"参数4\",\"remarks\":\"参数4\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612252003901,\"name\":\"参数2\",\"id\":\"4f702c4932f74f6b857ed6082e672860\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"fileIds\":\"1612251983262\",\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"fileList\":[{\"originalName\":\"微信图片_20210201135916.jpg\",\"uploadBy\":\"admin\",\"path\":\"/profile/upload/2021/02/02/c64d9e54-0a63-4e1b-9176-8fe0a28e4ac2.jpg\",\"size\":\"192726\",\"id\":\"1612251983262\",\"uploadTime\":1612252008420}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-02 15:46:53');
INSERT INTO `sys_oper_log` VALUES (88, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612252667952,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612252667768,\"name\":\"参数2\",\"id\":\"c476ffbe6f6848a9b786495d3d2ac88f\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"4\",\"createTime\":1612252667851,\"name\":\"参数4\",\"id\":\"f88eb443c67945739f6ce843190ccb90\",\"interfaceName\":\"参数4\",\"remarks\":\"参数4\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"fileIds\":\"1612252637779\",\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"fileList\":[{\"originalName\":\"微信图片_20210201135926.jpg\",\"uploadBy\":\"admin\",\"path\":\"/profile/upload/2021/02/02/4bc6a20a-7cf4-4859-8c5b-70cbc5223091.jpg\",\"size\":\"188034\",\"id\":\"1612252637779\",\"uploadTime\":1612252667909}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-02 15:57:48');
INSERT INTO `sys_oper_log` VALUES (89, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612257922970,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612257921898,\"name\":\"参数2\",\"id\":\"07e27e748eb14f658f10b138a0fff81b\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"4\",\"createTime\":1612257922462,\"name\":\"参数4\",\"id\":\"8273a38b89e64da9bf386e4699cb528a\",\"interfaceName\":\"参数4\",\"remarks\":\"参数4\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"fileIds\":\"1612252637779\",\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"fileList\":[{\"uploadBy\":\"admin\",\"path\":\"/profile/upload/2021/02/02/4bc6a20a-7cf4-4859-8c5b-70cbc5223091.jpg\",\"size\":\"188034\",\"name\":\"微信图片_20210201135926.jpg\",\"id\":\"1612252637779\",\"uploadTime\":1612257922721}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-02 17:25:23');
INSERT INTO `sys_oper_log` VALUES (90, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612258130155,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612258109413,\"name\":\"参数2\",\"id\":\"d4527e2f80e9438ea76551710f3c2a8e\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"4\",\"createTime\":1612258111852,\"name\":\"参数4\",\"id\":\"7e69e9da4eee41218bac5cfd9dbd3bcf\",\"interfaceName\":\"参数4\",\"remarks\":\"参数4\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"fileIds\":\"\",\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"fileList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-02 17:28:51');
INSERT INTO `sys_oper_log` VALUES (91, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612258696093,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"4\",\"createTime\":1612258695656,\"name\":\"参数4\",\"id\":\"b0b992aff42544b2a7212dfe52de3c0b\",\"interfaceName\":\"参数4\",\"remarks\":\"参数4\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612258695800,\"name\":\"参数2\",\"id\":\"593657fcfbab49beb0fa3231909dea45\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"fileIds\":\"1612258683666\",\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"fileList\":[{\"uploadBy\":\"admin\",\"path\":\"/profile/upload/2021/02/02/c8014d53-7151-416e-b343-ec964b4e3cb0.JPG\",\"size\":\"1343512\",\"name\":\"IMG_5196.JPG\",\"id\":\"1612258683666\",\"uploadTime\":1612258695877}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-02 17:38:16');
INSERT INTO `sys_oper_log` VALUES (92, '设备基础信息', 1, 'com.ruoyi.web.controller.things.LpBaseDeviceController.add()', 'POST', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"params\":{},\"lpBaseDeviceParametersList\":[],\"createBy\":\"admin\",\"createTime\":1612331283126,\"fileIds\":\"\",\"id\":\"28120d99586048d888cb61287d5991d1\",\"fileList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-03 13:48:05');
INSERT INTO `sys_oper_log` VALUES (93, '设备基础信息', 3, 'com.ruoyi.web.controller.things.LpBaseDeviceController.remove()', 'DELETE', 1, 'admin', NULL, '/things/basedevice/28120d99586048d888cb61287d5991d1', '127.0.0.1', '内网IP', '{ids=28120d99586048d888cb61287d5991d1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-03 13:48:16');
INSERT INTO `sys_oper_log` VALUES (94, '设备基础信息', 1, 'com.ruoyi.web.controller.things.LpBaseDeviceController.add()', 'POST', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"params\":{},\"lpBaseDeviceParametersList\":[],\"createBy\":\"admin\",\"createTime\":1612331310659,\"fileIds\":\"\",\"id\":\"977238aea80748d59bf0da3259a635e8\",\"fileList\":[]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-03 13:48:30');
INSERT INTO `sys_oper_log` VALUES (95, '设备基础信息', 3, 'com.ruoyi.web.controller.things.LpBaseDeviceController.remove()', 'DELETE', 1, 'admin', NULL, '/things/basedevice/977238aea80748d59bf0da3259a635e8', '127.0.0.1', '内网IP', '{ids=977238aea80748d59bf0da3259a635e8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-03 14:42:22');
INSERT INTO `sys_oper_log` VALUES (96, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612334567287,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612334567012,\"name\":\"参数2\",\"id\":\"a6f56d71aa5b4fa68164364bc83ffc9d\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"4\",\"createTime\":1612334567086,\"name\":\"参数4\",\"id\":\"54906e403fb24d60ab604bb2cf47b584\",\"interfaceName\":\"参数4\",\"remarks\":\"参数4\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"fileIds\":\"1612258683666\",\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"fileList\":[{\"uploadBy\":\"admin\",\"path\":\"/profile/upload/2021/02/02/c8014d53-7151-416e-b343-ec964b4e3cb0.JPG\",\"size\":\"1343512\",\"name\":\"IMG_5196.JPG\",\"id\":\"1612258683666\",\"uploadTime\":1612334567221}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-03 14:42:47');
INSERT INTO `sys_oper_log` VALUES (97, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612334665771,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"4\",\"createTime\":1612334665404,\"name\":\"参数4\",\"id\":\"d68ea261d01640a785ad27a49f3acfeb\",\"interfaceName\":\"参数4\",\"remarks\":\"参数4\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612334665446,\"name\":\"参数2\",\"id\":\"0840a54447c54a18a66198c95d296975\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"fileIds\":\"1612258683666\",\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"fileList\":[{\"uploadBy\":\"admin\",\"path\":\"/profile/upload/2021/02/02/c8014d53-7151-416e-b343-ec964b4e3cb0.JPG\",\"size\":\"1343512\",\"name\":\"IMG_5196.JPG\",\"id\":\"1612258683666\",\"uploadTime\":1612334665688}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-03 14:44:25');
INSERT INTO `sys_oper_log` VALUES (98, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612334709178,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612334708977,\"name\":\"参数2\",\"id\":\"3ef0a6f025a749008470466fdc4ef67a\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"4\",\"createTime\":1612334709019,\"name\":\"参数4\",\"id\":\"f826fa1fc3f5446fa59de7b9037a357f\",\"interfaceName\":\"参数4\",\"remarks\":\"参数4\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"fileIds\":\"1612258683666\",\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"fileList\":[{\"uploadBy\":\"admin\",\"path\":\"/profile/upload/2021/02/02/c8014d53-7151-416e-b343-ec964b4e3cb0.JPG\",\"size\":\"1343512\",\"name\":\"IMG_5196.JPG\",\"id\":\"1612258683666\",\"uploadTime\":1612334709135}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-03 14:45:09');
INSERT INTO `sys_oper_log` VALUES (99, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612334875353,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612334874678,\"name\":\"参数2\",\"id\":\"39a470bcc6e3416988949445ff12472a\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"4\",\"createTime\":1612334874723,\"name\":\"参数4\",\"id\":\"d41ecd1448d144e791410a1b9feb15c5\",\"interfaceName\":\"参数4\",\"remarks\":\"参数4\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"fileIds\":\"1612258683666\",\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"fileList\":[{\"uploadBy\":\"admin\",\"path\":\"/profile/upload/2021/02/02/c8014d53-7151-416e-b343-ec964b4e3cb0.JPG\",\"size\":\"1343512\",\"name\":\"IMG_5196.JPG\",\"id\":\"1612258683666\",\"uploadTime\":1612334875072}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-03 14:47:56');
INSERT INTO `sys_oper_log` VALUES (100, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612334981601,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612334981266,\"name\":\"参数2\",\"id\":\"7e94d83d84f540dcb7cbccc737b90917\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"4\",\"createTime\":1612334981358,\"name\":\"参数4\",\"id\":\"d3a44c5453b84ddba048d379ab46de0f\",\"interfaceName\":\"参数4\",\"remarks\":\"参数4\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"fileIds\":\"1612258683666\",\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"fileList\":[{\"uploadBy\":\"admin\",\"path\":\"/profile/upload/2021/02/02/c8014d53-7151-416e-b343-ec964b4e3cb0.JPG\",\"size\":\"1343512\",\"name\":\"IMG_5196.JPG\",\"id\":\"1612258683666\",\"uploadTime\":1612334981513}],\"latlng\":\"{\\\"type\\\":\\\"Feature\\\",\\\"properties\\\":{},\\\"geometry\\\":{\\\"type\\\":\\\"Point\\\",\\\"coordinates\\\":[120.492554,31.529385]}}\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-03 14:49:42');
INSERT INTO `sys_oper_log` VALUES (101, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612338896882,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612338896652,\"name\":\"参数2\",\"id\":\"8a27051a16a04bb89b964a05ce1bd7ac\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"4\",\"createTime\":1612338896750,\"name\":\"参数4\",\"id\":\"eebc4196128442719aad286585653e82\",\"interfaceName\":\"参数4\",\"remarks\":\"参数4\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"fileIds\":\"1612258683666\",\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"fileList\":[{\"uploadBy\":\"admin\",\"path\":\"/profile/upload/2021/02/02/c8014d53-7151-416e-b343-ec964b4e3cb0.JPG\",\"size\":\"1343512\",\"name\":\"IMG_5196.JPG\",\"id\":\"1612258683666\",\"uploadTime\":1612338896832}],\"latlng\":\"{\\\"type\\\":\\\"Feature\\\",\\\"properties\\\":{},\\\"geometry\\\":{\\\"type\\\":\\\"Point\\\",\\\"coordinates\\\":[117.78717,28.374485]}}\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-03 15:54:57');
INSERT INTO `sys_oper_log` VALUES (102, '项目申请', 2, 'com.ruoyi.web.controller.things.LpProjectController.edit()', 'PUT', 1, 'admin', NULL, '/things/project', '127.0.0.1', '内网IP', '{\"updateTime\":1612342260720,\"delFlag\":\"0\",\"params\":{},\"head\":\"来晨晨\",\"pa\":\"大萨达\",\"createBy\":\"admin\",\"pb\":\"归属感\",\"headPhone\":\"13951039002\",\"createTime\":1612163468000,\"fileIds\":\"1612342246607\",\"updateBy\":\"admin\",\"name\":\"项目一\",\"id\":\"52308d9d01ed43389771b23d9d843552\",\"fileList\":[{\"uploadBy\":\"admin\",\"path\":\"/profile/upload/2021/02/03/37462ac5-cbef-4b04-9fc1-2374018bd84d.JPG\",\"size\":\"3982954\",\"name\":\"JF4A5260.JPG\",\"id\":\"1612342246607\",\"uploadTime\":1612342260642}],\"remarks\":\"分为\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-03 16:51:00');
INSERT INTO `sys_oper_log` VALUES (103, '设备基础信息', 1, 'com.ruoyi.web.controller.things.LpBaseDeviceController.add()', 'POST', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[],\"createBy\":\"admin\",\"productionDate\":1514822400000,\"createTime\":1612402322584,\"fileIds\":\"1612402311199\",\"name\":\"设备二\",\"model\":\"22222222\",\"id\":\"674f87dfa9004ee2b544f330f98cc77f\",\"fileList\":[{\"uploadBy\":\"admin\",\"path\":\"/profile/upload/2021/02/04/34b1881e-37d4-447a-9aee-184a92d8018a.JPG\",\"size\":\"3982954\",\"name\":\"JF4A5260.JPG\",\"id\":\"1612402311199\",\"uploadTime\":1612402322584}],\"latlng\":\"{\\\"type\\\":\\\"Feature\\\",\\\"properties\\\":{},\\\"geometry\\\":{\\\"type\\\":\\\"Point\\\",\\\"coordinates\\\":[120.187683,31.791221]}}\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-04 09:32:02');
INSERT INTO `sys_oper_log` VALUES (104, '企业信息', 2, 'com.ruoyi.web.controller.things.LpEnterpriseController.edit()', 'PUT', 1, 'admin', NULL, '/things/enterprise', '127.0.0.1', '内网IP', '{\"contactMobile\":\"111111111\",\"address\":\"2\",\"updateTime\":1612409625012,\"delFlag\":\"0\",\"params\":{},\"addressDetail\":\"111111111111111\",\"createTime\":1612163264000,\"fileIds\":\"1612409616658\",\"updateBy\":\"admin\",\"contact\":\"111111111\",\"name\":\"11111111\",\"id\":\"43400d9e985d46c9a1c63a4bd079df68\",\"email\":\"22222\",\"fileList\":[{\"uploadBy\":\"admin\",\"path\":\"/profile/upload/2021/02/04/1a79c625-581d-49cb-a7f6-75aae58c9d6d.JPG\",\"size\":\"1343512\",\"name\":\"IMG_5196.JPG\",\"id\":\"1612409616658\",\"uploadTime\":1612409624909}],\"latlng\":\"{\\\"type\\\":\\\"Feature\\\",\\\"properties\\\":{},\\\"geometry\\\":{\\\"type\\\":\\\"Point\\\",\\\"coordinates\\\":[120.330505,32.618557]}}\",\"remarks\":\"1111111111111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-04 11:33:45');
INSERT INTO `sys_oper_log` VALUES (105, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"43400d9e985d46c9a1c63a4bd079df68\",\"updateTime\":1612426440238,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"3\",\"createTime\":1612426439107,\"name\":\"参数2\",\"id\":\"7d4725c30d314901a93ba19a9875f0fa\",\"interfaceName\":\"参数2\",\"remarks\":\"参数3\"},{\"infoId\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"delFlag\":\"0\",\"params\":{},\"createBy\":\"admin\",\"controlType\":\"4\",\"createTime\":1612426439634,\"name\":\"参数4\",\"id\":\"adb9b70c970f4e87b64c0dc69a1f6771\",\"interfaceName\":\"参数4\",\"remarks\":\"参数4\"}],\"createBy\":\"admin\",\"productionDate\":1609776000000,\"createTime\":1611821593000,\"fileIds\":\"1612258683666\",\"updateBy\":\"admin\",\"name\":\"设备一\",\"model\":\"is001\",\"id\":\"d4d7e6a16be4498c9c6f5d8b949589ed\",\"fileList\":[{\"uploadBy\":\"admin\",\"path\":\"/profile/upload/2021/02/02/c8014d53-7151-416e-b343-ec964b4e3cb0.JPG\",\"size\":\"1343512\",\"name\":\"IMG_5196.JPG\",\"id\":\"1612258683666\",\"uploadTime\":1612426439953}],\"latlng\":\"{\\\"type\\\":\\\"FeatureCollection\\\",\\\"features\\\":[{\\\"type\\\":\\\"Feature\\\",\\\"properties\\\":{},\\\"geometry\\\":{\\\"type\\\":\\\"Point\\\",\\\"coordinates\\\":[117.78717,28.374485]}}]}\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-04 16:14:00');
INSERT INTO `sys_oper_log` VALUES (106, '设备基础信息', 2, 'com.ruoyi.web.controller.things.LpBaseDeviceController.edit()', 'PUT', 1, 'admin', NULL, '/things/basedevice', '127.0.0.1', '内网IP', '{\"supplierId\":\"2\",\"updateTime\":1612426724948,\"delFlag\":\"0\",\"params\":{},\"type\":\"2\",\"lpBaseDeviceParametersList\":[],\"createBy\":\"admin\",\"productionDate\":1514822400000,\"createTime\":1612402323000,\"fileIds\":\"1612402311199\",\"updateBy\":\"admin\",\"name\":\"设备二\",\"model\":\"22222222\",\"id\":\"674f87dfa9004ee2b544f330f98cc77f\",\"fileList\":[{\"uploadBy\":\"admin\",\"path\":\"/profile/upload/2021/02/04/34b1881e-37d4-447a-9aee-184a92d8018a.JPG\",\"size\":\"3982954\",\"name\":\"JF4A5260.JPG\",\"id\":\"1612402311199\",\"uploadTime\":1612426724880}],\"latlng\":\"{\\\"type\\\":\\\"Feature\\\",\\\"properties\\\":{},\\\"geometry\\\":{\\\"type\\\":\\\"LineString\\\",\\\"coordinates\\\":[[120.187155,31.791045],[120.187557,31.791483],[120.188067,31.791305],[120.188303,31.7911],[120.188228,31.790831]]}}\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-04 16:18:45');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
