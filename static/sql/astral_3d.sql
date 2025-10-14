SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for astral_3d_assets_category
-- ----------------------------
DROP TABLE IF EXISTS `astral_3d_assets_category`;
CREATE TABLE `astral_3d_assets_category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `pcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级编码',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名',
  `sort_num` int(0) NULL DEFAULT NULL COMMENT '序号',
  `delTag` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记. 0 未删除 1 已删除',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50005 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资产分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of astral_3d_assets_category
-- ----------------------------
INSERT INTO `astral_3d_assets_category` VALUES (1, 'Model', NULL, 'Building', '建筑物', 1, 0, '2025-07-22 17:42:58', '2025-07-22 18:09:54', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (2, 'Model', NULL, 'Plant', '植物', 2, 0, '2025-07-22 17:43:50', '2025-07-22 18:09:54', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (3, 'Model', NULL, 'Animal', '动物', 3, 0, '2025-07-22 17:45:02', '2025-07-22 18:09:55', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (4, 'Model', NULL, 'Traffic', '交通', 4, 0, '2025-07-22 17:45:37', '2025-07-22 18:30:05', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (5, 'Model', NULL, 'Furniture', '家具', 5, 0, '2025-07-22 17:46:00', '2025-07-22 18:09:55', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (6, 'Model', '', 'Outdoor', '室外', 6, 0, '2025-07-22 17:52:34', '2025-07-22 18:10:28', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (7, 'Model', '', 'Natural', '自然元素', 7, 0, '2025-07-22 18:02:32', '2025-07-22 18:10:29', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (8, 'Model', '', 'Security', '安全', 8, 0, '2025-07-22 18:02:32', '2025-07-22 18:57:34', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (9, 'Model', '', 'Other', '其他', 9, 0, '2025-07-22 18:02:32', '2025-07-22 18:57:34', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (101, 'Model', 'Building', 'Residence', '住宅', 1, 0, '2025-07-22 18:02:14', '2025-07-22 18:52:18', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (102, 'Model', 'Building', 'Common', '公共', 2, 0, '2025-07-22 18:05:31', '2025-07-22 18:52:20', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (103, 'Model', 'Building', 'Industry', '工业', 3, 0, '2025-07-22 18:09:26', '2025-07-22 18:52:25', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (104, 'Model', 'Building', 'Agriculture', '农业', 4, 0, '2025-07-22 18:11:50', '2025-07-22 18:52:28', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (201, 'Model', 'Plant', 'Arbor', '乔木', 1, 0, '2025-07-22 18:16:30', '2025-07-22 18:52:33', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (202, 'Model', 'Plant', 'Shrub', '灌木', 2, 0, '2025-07-22 18:17:09', '2025-07-22 18:52:36', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (203, 'Model', 'Plant', 'Herb', '草本', 3, 0, '2025-07-22 18:17:57', '2025-07-22 18:52:44', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (204, 'Model', 'Herb', 'Grass', '草叶', 1, 0, '2025-07-22 18:19:41', '2025-07-22 18:52:47', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (205, 'Model', 'Herb', 'Flower', '花', 2, 0, '2025-07-22 18:20:30', '2025-07-22 18:52:50', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (301, 'Model', 'Animal', 'Person', '人', 1, 0, '2025-07-22 18:23:27', '2025-07-22 18:52:55', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (302, 'Model', 'Animal', 'Beast', '兽', 2, 0, '2025-07-22 18:24:20', '2025-07-22 18:52:58', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (303, 'Model', 'Animal', 'Livestock', '家畜', 3, 0, '2025-07-22 18:25:12', '2025-07-22 18:53:00', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (304, 'Model', 'Animal', 'Bird', '鸟', 4, 0, '2025-07-22 18:25:48', '2025-07-22 18:53:03', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (305, 'Model', 'Animal', 'Fish', '鱼', 5, 0, '2025-07-22 18:29:29', '2025-07-22 18:53:06', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (401, 'Model', 'Traffic', 'Land', '陆', 1, 0, '2025-07-22 18:29:53', '2025-07-22 18:53:14', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (402, 'Model', 'Traffic', 'Sky', '空', 2, 0, '2025-07-22 18:29:53', '2025-07-22 18:53:16', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (403, 'Model', 'Traffic', 'Sea', '海', 3, 0, '2025-07-22 18:29:53', '2025-07-22 18:53:19', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (404, 'Model', 'Traffic', 'Facilities', '设施', 4, 0, '2025-07-22 18:34:11', '2025-07-22 18:53:28', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (405, 'Model', 'Land', 'Car', '汽车', 1, 0, '2025-07-22 18:29:53', '2025-07-22 18:53:31', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (406, 'Model', 'Land', 'Train', '火车', 2, 0, '2025-07-22 18:38:16', '2025-07-22 18:53:35', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (407, 'Model', 'Land', 'Non-motor vehicles', '非机动车', 3, 0, '2025-07-22 18:38:16', '2025-07-22 18:53:38', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (408, 'Model', 'Land', 'Tool accessories', '工具配件', 4, 0, '2025-07-22 18:38:16', '2025-07-22 18:53:38', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (430, 'Model', 'Sky', 'Aircraft', '飞机', 1, 0, '2025-07-22 18:38:16', '2025-08-01 01:21:55', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (431, 'Model', 'Sky', 'Drones', '无人机', 2, 0, '2025-07-22 18:41:21', '2025-08-01 01:21:58', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (460, 'Model', 'Sea', 'Ship', '船舶', 1, 0, '2025-07-22 18:41:21', '2025-08-01 01:22:01', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (701, 'Model', 'Natural', 'Terrain', '地形', 1, 0, '2025-07-22 18:02:14', '2025-07-22 18:55:03', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (702, 'Model', 'Natural', 'Rock', '岩石', 2, 0, '2025-07-22 18:02:14', '2025-07-22 18:56:25', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (801, 'Model', 'Security', 'Safety precautions', '安防', 1, 0, '2025-07-22 18:02:14', '2025-07-22 18:57:11', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (802, 'Model', 'Security', 'Fire fight', '消防', 2, 0, '2025-07-22 18:02:14', '2025-07-22 18:58:00', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (803, 'Model', 'Safety precautions', 'Camera', '摄像头', 1, 0, '2025-07-22 18:02:14', '2025-07-22 22:35:08', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (10000, 'Material', NULL, 'Metal', '金属', 1, 0, '2025-07-22 22:37:51', '2025-07-22 22:37:55', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (10001, 'Material', NULL, 'Stone', '石材', 2, 0, '2025-07-22 22:38:46', '2025-07-22 22:38:49', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (10002, 'Material', NULL, 'Wood', '木材', 3, 0, '2025-07-22 22:38:46', '2025-07-22 22:39:31', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (10003, 'Material', NULL, 'Fabric', '布料', 4, 0, '2025-07-22 22:45:33', '2025-07-22 22:45:38', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (10004, 'Material', NULL, 'Glass', '玻璃', 4, 0, '2025-07-22 22:45:33', '2025-07-22 22:45:38', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (10005, 'Material', NULL, 'Ground', '地面', 5, 0, '2025-07-22 22:45:33', '2025-07-22 22:45:38', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (10006, 'Material', NULL, 'Other', '其他', 6, 0, '2025-07-22 22:45:33', '2025-07-22 22:48:35', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (20000, 'Texture', NULL, 'Brick', '砖石', 1, 0, '2025-07-22 22:51:04', '2025-07-22 22:51:08', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (30000, 'Billboard', NULL, 'Weather', '天气', 1, 0, '2025-07-22 22:51:40', '2025-07-22 22:51:40', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (30001, 'Billboard', NULL, 'Animal', '动物', 2, 0, '2025-07-22 22:51:40', '2025-08-01 21:12:25', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (30002, 'Billboard', NULL, 'Plant', '植物', 3, 0, '2025-07-22 22:51:40', '2025-08-01 21:12:55', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (40000, 'HDR', NULL, 'Skies', '天空', 1, 0, '2025-07-22 22:59:08', '2025-07-22 22:59:08', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (40001, 'HDR', NULL, 'Outdoor', '室外', 2, 0, '2025-07-22 22:59:08', '2025-07-22 22:59:08', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (40002, 'HDR', NULL, 'Indoor', '室内', 3, 0, '2025-07-22 22:59:08', '2025-07-22 23:00:02', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (40003, 'HDR', NULL, 'Night', '夜晚', 4, 0, '2025-07-22 22:59:08', '2025-07-22 23:00:25', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (50000, 'Tiles', NULL, 'Building', '建筑', 1, 0, '2025-09-25 21:18:26', '2025-09-25 21:18:28', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (50001, 'Tiles', NULL, 'Factory', '工厂', 2, 0, '2025-09-25 21:19:19', '2025-09-25 21:19:19', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (50002, 'Tiles', NULL, 'Terrain', '地形', 3, 0, '2025-09-25 21:20:03', '2025-09-25 21:20:03', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (50003, 'Tiles', NULL, 'Biology', '生物', 4, 0, '2025-09-25 21:21:01', '2025-09-25 21:21:01', NULL);
INSERT INTO `astral_3d_assets_category` VALUES (50004, 'Tiles', NULL, 'Other', '其他', 5, 0, '2025-09-25 21:21:18', '2025-09-25 21:21:18', NULL);

-- ----------------------------
-- Table structure for astral_3d_assets_info
-- ----------------------------
DROP TABLE IF EXISTS `astral_3d_assets_info`;
CREATE TABLE `astral_3d_assets_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类别',
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '缩略图',
  `size` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件大小',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '附件地址',
  `delTag` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记. 0 未删除 1 已删除',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资产信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of astral_3d_assets_info
-- ----------------------------
INSERT INTO `astral_3d_assets_info` VALUES (69, '美国-军事运输机', 'Model', 'Aircraft', 'upload/assets/model/thumbnail/2a2dea5f-f271-4174-8a34-16cd3cb640b6.png', '1725120', '', 'upload/assets/model/美国-军事运输机.glb', 0, '2025-07-25 15:58:03', '2025-08-01 20:39:25', NULL);
INSERT INTO `astral_3d_assets_info` VALUES (71, '白色皮卡车', 'Model', 'Car', 'upload/assets/model/thumbnail/4992fb7c-65a8-40bf-b2ce-ecf1ad13c715.png', '16087476', '', 'upload/assets/model/白色皮卡车.glb', 0, '2025-07-25 17:04:34', '2025-08-01 20:39:13', NULL);
INSERT INTO `astral_3d_assets_info` VALUES (73, '蓝色电动车', 'Model', 'Non-motor vehicles', 'upload/assets/model/thumbnail/7147a0f0-c654-4791-ba51-fa62675ee6bf.png', '13211600', '', 'upload/assets/model/电动车.glb', 0, '2025-07-26 01:25:18', '2025-07-26 01:59:08', NULL);
INSERT INTO `astral_3d_assets_info` VALUES (74, '黄色摩托', 'Model', 'Non-motor vehicles', 'upload/assets/model/thumbnail/f3fcb67c-fe2d-4384-a84c-88893333efda.png', '19824140', '', 'upload/assets/model/黄色摩托.glb', 0, '2025-07-26 01:28:36', '2025-07-26 01:28:36', NULL);
INSERT INTO `astral_3d_assets_info` VALUES (77, '警车', 'Model', 'Car', 'upload/assets/model/thumbnail/e0c5cc25-70dd-4999-963e-088a7a8c6e68.png', '536092', '', 'upload/assets/model/警车01.glb', 0, '2025-07-26 01:46:53', '2025-07-26 01:46:53', NULL);
INSERT INTO `astral_3d_assets_info` VALUES (78, '兰博基尼超跑', 'Model', 'Car', 'upload/assets/model/thumbnail/a02819e4-916c-49dc-8e8a-0880c2b46d68.png', '8988996', '', 'upload/assets/model/兰博基尼超跑.glb', 0, '2025-07-26 01:49:33', '2025-07-26 01:49:33', NULL);
INSERT INTO `astral_3d_assets_info` VALUES (79, '生锈旧车', 'Model', 'Car', 'upload/assets/model/thumbnail/f016b8ab-22af-408c-be14-7fc9d72c53f9.png', '11735716', '', 'upload/assets/model/生锈旧车.glb', 0, '2025-07-26 01:56:15', '2025-07-26 01:56:15', NULL);
INSERT INTO `astral_3d_assets_info` VALUES (81, '车辆三角架', 'Model', 'Tool accessories', 'upload/assets/model/thumbnail/1753984412097车辆三角架_thumbnail.png', '234116', '', 'upload/assets/model/车辆三角架.glb', 0, '2025-08-01 01:37:54', '2025-08-01 01:53:35', NULL);
INSERT INTO `astral_3d_assets_info` VALUES (82, 'damaged_plaster_1k', 'Material', 'Stone', 'upload/assets/material/thumbnail/1754050471632damaged_plaster_1k_thumbnail.png', '3745775', '', 'upload/assets/material/damaged_plaster_1k.zip', 0, '2025-08-01 20:14:36', '2025-08-01 20:14:36', NULL);
INSERT INTO `astral_3d_assets_info` VALUES (83, 'laminate_floor_2k', 'Material', 'Wood', 'upload/assets/material/thumbnail/1754051273902laminate_floor_2k_thumbnail.png', '10490629', '', 'upload/assets/material/laminate_floor_2k.zip', 0, '2025-08-01 20:27:57', '2025-08-01 20:27:57', NULL);
INSERT INTO `astral_3d_assets_info` VALUES (84, '河床岩_2k', 'Texture', 'Brick', 'upload/assets/texture/thumbnail/dry_riverbed_rock_diff_2k.jpg', '4334972', '', 'upload/assets/texture/dry_riverbed_rock_diff_2k.jpg', 0, '2025-08-01 20:38:23', '2025-08-01 20:38:40', NULL);
INSERT INTO `astral_3d_assets_info` VALUES (85, '圣诞树', 'Billboard', 'Plant', 'upload/assets/billboard/thumbnail/1754056407585圣诞树_thumbnail.png', '1215', '', 'upload/assets/billboard/圣诞树.svg', 0, '2025-08-01 21:53:31', '2025-08-01 21:53:31', NULL);
INSERT INTO `astral_3d_assets_info` VALUES (86, '小红花', 'Billboard', 'Plant', 'upload/assets/billboard/thumbnail/1754060832542小红花_thumbnail.png', '1610', '', 'upload/assets/billboard/小红花.svg', 0, '2025-08-01 22:36:16', '2025-08-01 23:07:15', NULL);
INSERT INTO `astral_3d_assets_info` VALUES (87, 'sunny_country_road_2k', 'HDR', 'Outdoor', 'upload/assets/hdr/thumbnail/1754069116547sunny_country_road_2k_thumbnail.png', '6456061', '2K', 'upload/assets/hdr/sunny_country_road_2k.hdr', 0, '2025-08-02 01:25:25', '2025-08-12 01:23:25', NULL);
INSERT INTO `astral_3d_assets_info` VALUES (89, '森林-Test1', 'Tiles', 'Terrain', 'upload/assets/tiles/thumbnail/comic_18_1758985698670.jpg', '107556', '', 'upload/assets/tiles/森林-Test1-1758985698719', 0, '2025-09-27 23:08:20', '2025-09-27 23:08:20', NULL);

-- ----------------------------
-- Table structure for astral_3d_bim_to_gltf
-- ----------------------------
DROP TABLE IF EXISTS `astral_3d_bim_to_gltf`;
CREATE TABLE `astral_3d_bim_to_gltf`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名',
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `bim_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'bim源文件路径',
  `bim_file_size` double NULL DEFAULT NULL COMMENT 'bim源文件大小',
  `gltf_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转换后的gltf文件路径',
  `gltf_file_size` double NULL DEFAULT NULL COMMENT '转换后的gltf文件大小',
  `conversion_status` int(0) NOT NULL COMMENT '0 转换中 1 转换完成 2 转换失败',
  `conversion_duration` double NULL DEFAULT NULL COMMENT '转换时长（s）',
  `options` json NULL COMMENT '转换配置',
  `delTag` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记. 0 未删除 1 已删除',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'BIM模型轻量化' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of astral_3d_bim_to_gltf
-- ----------------------------

-- ----------------------------
-- Table structure for astral_3d_cad
-- ----------------------------
DROP TABLE IF EXISTS `astral_3d_cad`;
CREATE TABLE `astral_3d_cad`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名',
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '源文件路径',
  `converter_file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转换后的文件路径',
  `conversion_status` int(0) NOT NULL COMMENT '0 转换中 1 转换完成 2 转换失败',
  `delTag` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记，0 未删除 1 已删除',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of astral_3d_cad
-- ----------------------------

-- ----------------------------
-- Table structure for astral_3d_cesium
-- ----------------------------
DROP TABLE IF EXISTS `astral_3d_cesium`;
CREATE TABLE `astral_3d_cesium`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `scene_id` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '场景ID',
  `cesium_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Cesium token',
  `base_map` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Amap' COMMENT '底图。Amap：高德  Tianditu：天地图',
  `base_map_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'satellite' COMMENT '底图类型，默认影像图。\r\nsatellite：影像图，vector：矢量图',
  `base_map_option` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '默认底图的json 字符串配置项',
  `need_mark_map` int(0) NOT NULL DEFAULT 0 COMMENT '是否叠加标记图（一般只有影像图需要），默认0。 \r\n 0:不叠加 1:叠加',
  `tianditu_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `coordinate_system` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'GCJ-02' COMMENT '地理坐标系统，默认GCJ-02。 \r\nWGS-84：GPS地理坐标系  \r\nGCJ-02：火星坐标系（高德和Google中国）\r\nBD-09：百度坐标系',
  `minLong` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '最小经度，用于定位threejs位于cesium场景哪个位置',
  `minLat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '最小纬度，用于定位threejs位于cesium场景哪个位置',
  `maxLong` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '最大经度，用于定位threejs位于cesium场景哪个位置',
  `maxLat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '最大纬度，用于定位threejs位于cesium场景哪个位置',
  `delTag` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记，0 未删除 1 已删除',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of astral_3d_cesium
-- ----------------------------

-- ----------------------------
-- Table structure for astral_3d_scenes
-- ----------------------------
DROP TABLE IF EXISTS `astral_3d_scenes`;
CREATE TABLE `astral_3d_scenes`  (
  `id` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '主键ID,UUID',
  `sceneType` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '场景类型',
  `sceneName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场景名称',
  `sceneVersion` int(0) NULL DEFAULT 1 COMMENT '场景版本',
  `sceneIntroduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场景描述',
  `coverPicture` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '保存场景时自动生成的封面图url',
  `hasDrawing` int(0) NOT NULL DEFAULT 0 COMMENT '场景是否包含图纸 0:false  1:true',
  `zip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '场景zip包',
  `zipSize` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0KB' COMMENT '场景zip包大小',
  `exampleSceneId` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '创建项目时来源于哪一个示例模板项目，null代表从空项目创建。（fk）',
  `projectType` int(0) NOT NULL DEFAULT 0 COMMENT '项目类型。0：Web3D-THREE  1：WebGIS-Cesium',
  `cesiumConfig` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT 'WebGIS-Cesium 类型项目的基础Cesium配置',
  `delTag` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记，0 未删除 1 已删除',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci COMMENT = '场景zip压缩包信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of astral_3d_scenes
-- ----------------------------

-- ----------------------------
-- Table structure for astral_3d_scenes_example
-- ----------------------------
DROP TABLE IF EXISTS `astral_3d_scenes_example`;
CREATE TABLE `astral_3d_scenes_example`  (
  `id` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '主键ID,UUID',
  `sceneType` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT '场景类型',
  `sceneName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场景名称',
  `sceneVersion` int(0) NULL DEFAULT 1 COMMENT '场景版本',
  `sceneIntroduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场景描述',
  `coverPicture` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '保存场景时自动生成的封面图url',
  `hasDrawing` int(0) NOT NULL DEFAULT 0 COMMENT '场景是否包含图纸 0:false  1:true',
  `zip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '场景zip包',
  `zipSize` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0KB' COMMENT '场景zip包大小',
  `projectType` int(0) NOT NULL DEFAULT 0 COMMENT '示例项目类型。0：Web3D-THREE  1：WebGIS-Cesium',
  `cesiumConfig` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL COMMENT 'WebGIS-Cesium 类型项目的基础Cesium配置',
  `delTag` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记，0 未删除 1 已删除',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci COMMENT = '新建场景时的示例表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of astral_3d_scenes_example
-- ----------------------------
INSERT INTO `astral_3d_scenes_example` VALUES ('10430f58-640f-46b6-b575-6ed68c3e25f6', '其他', '风格化场景', 1, '', 'example/scenes/screenshot/风格化场景-1747464759493.png', 0, 'example/scenes/packages/风格化场景/风格化场景.zip', '6.97 MB', 0, NULL, 0, '2024-05-20 01:51:09', '2025-05-17 14:53:17', NULL);
INSERT INTO `astral_3d_scenes_example` VALUES ('81d8cf5d-9412-4abe-ad5e-9cadadbdb4fb', '园区', '城市', 1, '园区级场景示例', 'example/scenes/screenshot/城市-1747462954059.png', 0, 'example/scenes/packages/城市/城市.zip', '111.35 MB', 0, NULL, 0, '2024-08-13 01:10:54', '2025-05-17 14:36:24', NULL);
INSERT INTO `astral_3d_scenes_example` VALUES ('b8459a27-64f0-4a2c-8153-ae4be6f27cd2', '其他', 'Wolf animations', 1, '动画场景（含脚本）', 'example/scenes/screenshot/Wolf animations-1747464964778.png', 0, 'example/scenes/packages/Wolf animations/Wolf animations.zip', '6.59 MB', 0, NULL, 0, '2024-04-24 16:52:16', '2025-05-17 15:05:13', NULL);
INSERT INTO `astral_3d_scenes_example` VALUES ('d84f6e9a-7afa-4846-b9cb-a63b63a6dc68', '其他', '特效材质贴图', 1, '', 'example/scenes/screenshot/特效材质贴图-1747465066588.png', 0, 'example/scenes/packages/特效材质贴图/特效材质贴图.zip', '4.43 MB', 0, NULL, 0, '2024-05-20 01:12:51', '2025-05-17 15:05:05', NULL);

-- ----------------------------
-- Table structure for astral_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `astral_sys_user`;
CREATE TABLE `astral_sys_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户密码',
  `sex` tinyint(0) NOT NULL DEFAULT 0 COMMENT '性别， 0 表示女， 1 表示男',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `delTag` tinyint(0) NOT NULL DEFAULT 0 COMMENT '删除标记，0 未删除 1 已删除',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'jwt 鉴权 SALT值',
  `lastLoginTime` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `lastLoginIp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录ip',
  `registerIp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册时的ip地址',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of astral_sys_user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
