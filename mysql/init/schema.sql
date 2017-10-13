SET SQL_SAFE_UPDATES = 0;

-- 创建 nbo 开发数据库
create database IF NOT EXISTS `nbo_dev` default character set utf8 collate utf8_general_ci;
use nbo_dev;

-- ----------------------------
-- Table structure for NBO_ADMIN_FLOW
-- ----------------------------
DROP TABLE IF EXISTS `NBO_ADMIN_FLOW`;
CREATE TABLE `NBO_ADMIN_FLOW` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`FLOW_CODE` VARCHAR(20) NOT NULL COMMENT '流程代码',
`FLOW_NAME` VARCHAR(20) NOT NULL COMMENT '流程名',
`VERSION` bigint(6) NOT NULL COMMENT '流程版本',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '系统流程基本表';

-- ----------------------------
-- Records of NBO_ADMIN_FLOW
-- ----------------------------
INSERT INTO `NBO_ADMIN_FLOW` VALUES ('1', 'TEST', '应用测试流程', '1', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for NBO_ADMIN_FLOW_NODE
-- ----------------------------
DROP TABLE IF EXISTS `NBO_ADMIN_FLOW_NODE`;
CREATE TABLE `NBO_ADMIN_FLOW_NODE` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`FK_FLOW_ID` bigint(19) NOT NULL COMMENT '流程基本表id',
`NODE_CODE` VARCHAR(20) NOT NULL COMMENT '节点CODE',
`NODE_NAME` VARCHAR(20) NOT NULL COMMENT '节点名字',
`SORT` bigint(3) NOT NULL COMMENT '排序',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '系统流程节点表';

-- ----------------------------
-- Records of NBO_ADMIN_FLOW_NODE
-- ----------------------------
INSERT INTO `NBO_ADMIN_FLOW_NODE` VALUES ('3', '1', 'UAT', '用户验收测试', '3', null, null, null, null, null, null);
INSERT INTO `NBO_ADMIN_FLOW_NODE` VALUES ('1', '1', 'FT', '功能测试', '1', null, null, null, null, null, null);
INSERT INTO `NBO_ADMIN_FLOW_NODE` VALUES ('2', '1', 'SIT', '系统测试', '2', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for NBO_ADMIN_PROJECT_ENV
-- ----------------------------
DROP TABLE IF EXISTS `NBO_ADMIN_PROJECT_ENV`;
CREATE TABLE `NBO_ADMIN_PROJECT_ENV` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`ENV_CODE` VARCHAR(20) NOT NULL COMMENT '环境代码',
`ENV_NAME` VARCHAR(20) NOT NULL COMMENT '环境名',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '系统环境标签表';

-- ----------------------------
-- Records of NBO_ADMIN_PROJECT_ENV
-- ----------------------------
INSERT INTO `NBO_ADMIN_PROJECT_ENV` VALUES ('1', 'DEV', '开发', null, null, null, null, null, null);
INSERT INTO `NBO_ADMIN_PROJECT_ENV` VALUES ('2', 'FT', 'FT', null, null, null, null, null, null);
INSERT INTO `NBO_ADMIN_PROJECT_ENV` VALUES ('3', 'SIT', 'SIT', null, null, null, null, null, null);
INSERT INTO `NBO_ADMIN_PROJECT_ENV` VALUES ('4', 'UAT', 'UAT', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for NBO_ADMIN_PROJECT_MENU
-- ----------------------------
DROP TABLE IF EXISTS `NBO_ADMIN_PROJECT_MENU`;
CREATE TABLE `NBO_ADMIN_PROJECT_MENU` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`NAME` VARCHAR(50) NOT NULL COMMENT '菜单名',
`ROUTE` VARCHAR(100) NOT NULL COMMENT '菜单路由',
`SHOW` bigint(1) DEFAULT 1  NOT NULL COMMENT '是否显示',
`DEVELOPING` bigint(1) DEFAULT 0  NOT NULL COMMENT '是否是开发中',
`SORTING` bigint(3) NOT NULL COMMENT '菜单排序字段',
`ICON` VARCHAR(30) NULL COMMENT 'iconfont 的样式',
`CSS_ICON` VARCHAR(30) NULL COMMENT 'glyphicon 的css 样式',
`PARENT_ID` bigint(19) NULL COMMENT '父菜单ID',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`TYPE_FLAG` VARCHAR(10) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '系统菜单表';

-- ----------------------------
-- Records of NBO_ADMIN_PROJECT_MENU
-- ----------------------------
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('34', '代码仓库', 'platform.app.appDetails.repsList', '1', '0', '34', '', null, '10', null, null, null, null, null, null, 'MENU');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('1', '应用概览', 'platform.app.appDetails.basic', '1', '0', '1', '', null, '0', null, null, null, null, null, null, 'MENU');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('2', '作业编排', 'platform.app.appDetails.job', '1', '0', '8', null, 'glyphicon-stats', '10', null, null, null, null, null, null, 'MENU');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('3', '代码检查', 'platform.app.appDetails.codeCheck', '1', '0', '6', '', null, '10', null, null, null, null, null, null, 'MENU');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('4', '单元测试', 'platform.app.appDetails.test', '1', '0', '7', '', null, '10', null, null, null, null, null, null, 'MENU');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('5', '应用构建', 'platform.app.appDetails.build', '1', '0', '5', '', null, '10', null, null, null, null, null, null, 'MENU');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('6', '构建物管理', 'platform.app.appDetails.uploadConstructs', '1', '0', '9', null, 'glyphicon-edit', '10', null, null, null, null, null, null, 'MENU');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('7', '应用部署', 'platform.app.appDetails.autoDeploy', '1', '0', '11', '', null, '12', null, null, null, null, null, null, 'MENU');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('8', '测试流水线', 'platform.app.appDetails.applicationTest', '1', '0', '10', '', null, '11', null, null, null, null, null, null, 'MENU');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('9', '应用监控', 'platform.app.appDetails.repsList', '1', '0', '12', '', null, '12', null, null, null, null, null, null, 'MENU');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('10', '开发', '-', '1', '0', '2', null, null, '0', null, null, null, null, null, null, 'MENU');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('11', '测试', '-', '1', '0', '3', null, null, '0', null, null, null, null, null, null, 'MENU');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('12', '应用', '-', '1', '0', '4', null, null, '0', null, null, null, null, null, null, 'MENU');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('13', '添加项目', 'platform.app.appDetails.addProject', '1', '0', '13', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('14', '删除项目', 'platform.app.appDetails.delProject', '1', '0', '14', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('15', '添加应用', 'platform.app.appDetails.addApp', '1', '0', '15', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('16', '删应用除', 'platform.app.appDetails.delApp', '1', '0', '16', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('17', '添加环境', 'platform.app.appDetails.addEvn', '1', '0', '17', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('18', '修改环境', 'platform.app.appDetails.updatetimeEvn', '1', '0', '18', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('19', '添加成员', 'platform.app.appDetails.addMember', '1', '0', '19', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('22', '应用构建', 'platform.app.appDetails.appBuild', '1', '0', '22', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('20', '删除成员', 'platform.app.appDetails.delMember', '1', '0', '20', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('21', '修改代码仓库', 'platform.app.appDetails.updatetimeCodeWarehouse', '1', '0', '21', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('23', '代码检查', 'platform.app.appDetails.codeReview', '1', '0', '23', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('24', '单元测试', 'platform.app.appDetails.unitText', '1', '0', '24', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('25', '作业编排', 'platform.app.appDetails.jobSchedul', '1', '0', '25', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('26', '申请测试', 'platform.app.appDetails.applyText', '1', '0', '26', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('27', '提交测试结果（FT测试阶段）', 'platform.app.appDetails.submitFT', '1', '0', '27', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('28', '提交测试结果（SLT测试阶段）', 'platform.app.appDetails.submitSLT', '1', '0', '28', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('29', '提交测试结果（UAL测试阶段）', 'platform.app.appDetails.submitUAL', '1', '0', '29', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('30', '应用部署（FL构建物）', 'platform.app.appDetails.appDeploymentFL', '1', '0', '30', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('31', '应用部署（SLT构建物）', 'platform.app.appDetails.appDeploymentSLT', '1', '0', '31', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('32', '应用部署（UAT构建物）', 'platform.app.appDetails.appDeploymentUAT', '1', '0', '32', null, null, null, null, null, null, null, null, null, 'FUNCTION');
INSERT INTO `NBO_ADMIN_PROJECT_MENU` VALUES ('33', '应用部署（上记以外）', 'platform.app.appDetails.writtenOutside', '1', '0', '33', null, null, null, null, null, null, null, null, null, 'FUNCTION');

-- ----------------------------
-- Table structure for NBO_ADMIN_PROJECT_RM
-- ----------------------------
DROP TABLE IF EXISTS `NBO_ADMIN_PROJECT_RM`;
CREATE TABLE `NBO_ADMIN_PROJECT_RM` (
`FK_ADMIN_SYS_ROLE_ID` bigint(19) NOT NULL COMMENT '角色ID',
`FK_MUNU_ID` bigint(19) NOT NULL COMMENT '菜单ID'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '系统角色菜单关系表';

-- ----------------------------
-- Records of NBO_ADMIN_PROJECT_RM
-- ----------------------------
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '1');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '2');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '3');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '4');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '5');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '6');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '7');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '9');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '10');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '11');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '12');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '21');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '22');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '23');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '24');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '25');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '30');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '31');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '32');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('1', '33');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('2', '1');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('2', '7');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('2', '8');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('2', '11');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('2', '12');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('2', '27');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('2', '30');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('3', '1');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('3', '7');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('3', '8');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('3', '11');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('3', '12');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('3', '17');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('3', '18');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('3', '22');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('3', '28');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('3', '31');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('4', '1');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('4', '7');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('4', '8');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('4', '11');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('4', '12');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('4', '29');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('4', '32');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '1');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '2');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '3');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '4');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '5');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '6');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '7');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '8');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '9');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '10');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '11');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '12');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '13');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '14');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '15');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '16');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '17');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '18');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '19');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '20');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '21');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '22');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '23');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '24');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '25');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '26');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '30');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '31');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '32');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '33');
INSERT INTO `NBO_ADMIN_PROJECT_RM` VALUES ('5', '34');

-- ----------------------------
-- Table structure for NBO_ADMIN_PROJECT_ROLE
-- ----------------------------
DROP TABLE IF EXISTS `NBO_ADMIN_PROJECT_ROLE`;
CREATE TABLE `NBO_ADMIN_PROJECT_ROLE` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`ROLE_CODE` VARCHAR(20) NOT NULL COMMENT '角色代码',
`ROLE_NAME` VARCHAR(20) NOT NULL COMMENT '角色名',
`ROLE_TIP` VARCHAR(200) NOT NULL COMMENT '角色描述',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '系统角色职责表';

-- ----------------------------
-- Records of NBO_ADMIN_PROJECT_ROLE
-- ----------------------------
INSERT INTO `NBO_ADMIN_PROJECT_ROLE` VALUES ('1', 'DEVELOPER', '开发', '参与开发；使用开发标签下的环境。', null, null, null, null, null, null);
INSERT INTO `NBO_ADMIN_PROJECT_ROLE` VALUES ('2', 'FT', 'FT', '参与功能测试；使用FT标签下的环境。', null, null, null, null, null, null);
INSERT INTO `NBO_ADMIN_PROJECT_ROLE` VALUES ('3', 'SIT', 'SIT', '参与集成测试；使用SIT标签下的环境。', null, null, null, null, null, null);
INSERT INTO `NBO_ADMIN_PROJECT_ROLE` VALUES ('4', 'UAT', 'UAT', '参与用户验证；使用UAT标签下的环境。', null, null, null, null, null, null);
INSERT INTO `NBO_ADMIN_PROJECT_ROLE` VALUES ('5', 'LEADER', '项目经理', '参与开发；使用开发标签下的环境；申请测试；删除项目。', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for NBO_ADMIN_PROJECT_ROLE_ENV
-- ----------------------------
DROP TABLE IF EXISTS `NBO_ADMIN_PROJECT_ROLE_ENV`;
CREATE TABLE `NBO_ADMIN_PROJECT_ROLE_ENV` (
`FK_ADMIN_SYS_ROLE_ID` bigint(19) NOT NULL COMMENT '角色id',
`FK_ADMIN_SYS_ENV_ID` bigint(19) NOT NULL COMMENT '环境标签id'
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '系统角色环境标签关系表';

-- ----------------------------
-- Records of NBO_ADMIN_PROJECT_ROLE_ENV
-- ----------------------------
INSERT INTO `NBO_ADMIN_PROJECT_ROLE_ENV` VALUES ('1', '1');
INSERT INTO `NBO_ADMIN_PROJECT_ROLE_ENV` VALUES ('2', '2');
INSERT INTO `NBO_ADMIN_PROJECT_ROLE_ENV` VALUES ('3', '3');
INSERT INTO `NBO_ADMIN_PROJECT_ROLE_ENV` VALUES ('4', '4');
INSERT INTO `NBO_ADMIN_PROJECT_ROLE_ENV` VALUES ('5', '1');

-- ----------------------------
-- Table structure for NBO_ADMIN_USER
-- ----------------------------
DROP TABLE IF EXISTS `NBO_ADMIN_USER`;
CREATE TABLE `NBO_ADMIN_USER` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`CN_NAME` VARCHAR(255) NULL ,
`EMAIL` VARCHAR(255) NULL ,
`PASSWORD` VARCHAR(255) NULL ,
`STATUS` bigint(19) DEFAULT 0  NULL ,
`USER_NAME` VARCHAR(255) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_ADMIN_USER
-- ----------------------------
INSERT INTO `NBO_ADMIN_USER` VALUES ('50', null, null, null, null, null, null, 'Jack-Fan', 'jack@fan.com', '926c8ff4abf212cbd1fbea95e58a3d40', '0', 'jackfan');
INSERT INTO `NBO_ADMIN_USER` VALUES ('1', null, null, DATE_FORMAT(NOW(), '%Y-%m-%d %T'), null, null, DATE_FORMAT(NOW(), '%Y-%m-%d %T'), 'admin', '23333@qq.com', '8af51b6c8f1e872163dd369995d0a7b1', '0', 'ookk');

-- ----------------------------
-- Table structure for NBO_APP
-- ----------------------------
DROP TABLE IF EXISTS `NBO_APP`;
CREATE TABLE `NBO_APP` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`APP_EN_NAME` VARCHAR(50) NULL ,
`APP_NAME` VARCHAR(50) NULL ,
`BUILD_NUM` bigint(10) NULL ,
`BUILD_TYPE` VARCHAR(10) NULL ,
`CODE_TYPE` VARCHAR(10) NULL ,
`DESC_` VARCHAR(200) NULL ,
`JOB_NUM` bigint(10) NULL ,
`REPS_DEFAULT_BRANCH` VARCHAR(50) NULL ,
`REPS_TYPE` VARCHAR(10) NULL ,
`PROJECT_ID` bigint(19) NULL ,
`DELETE_STATUS` VARCHAR(10) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_APP_CONFIG_FILE
-- ----------------------------
DROP TABLE IF EXISTS `NBO_APP_CONFIG_FILE`;
CREATE TABLE `NBO_APP_CONFIG_FILE` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`APP_ID` bigint(19) NULL ,
`APP_NAME` VARCHAR(255) NULL ,
`PATH` VARCHAR(255) NULL ,
`SAVE_PATH` VARCHAR(255) NULL ,
`INSERT_TIME` datetime NULL ,
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`DEPLOY_VERSION_ID` bigint(19) NULL ,
`PROJECT_NAME` VARCHAR(255) NULL ,
`PROJECT_ID` bigint(19) NULL ,
`DEPLOY_VERSION_NAME` VARCHAR(255) NULL ,
`DESTINATION_ADDRESS` VARCHAR(255) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_APP_DEPLOY
-- ----------------------------
DROP TABLE IF EXISTS `NBO_APP_DEPLOY`;
CREATE TABLE `NBO_APP_DEPLOY` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`VISIT_URL` VARCHAR(255) NULL ,
`APP_NAME` VARCHAR(255) NULL ,
`DOMAIN_URL` VARCHAR(255) NULL ,
`INNER_VISIT_URL` VARCHAR(255) NULL ,
`K8S_CLUSTER_IP` VARCHAR(255) NULL ,
`APP_ID` bigint(19) NULL ,
`PROJECT_ID` bigint(19) NULL ,
`PATTERN_TYPE` VARCHAR(255) DEFAULT 0  NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_APP_DEPLOY
-- ----------------------------

-- ----------------------------
-- Table structure for NBO_APP_MENU
-- ----------------------------
DROP TABLE IF EXISTS `NBO_APP_MENU`;
CREATE TABLE `NBO_APP_MENU` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`NAME` VARCHAR(20) NOT NULL COMMENT '菜单名',
`ROUTE` VARCHAR(100) NOT NULL COMMENT '前端路由',
`SHOW` bigint(1) DEFAULT 1  NOT NULL COMMENT '是否显示菜单',
`DEVELOPING` bigint(1) DEFAULT 0  NOT NULL COMMENT '是否显示开发中',
`SORTING` bigint(10) DEFAULT 100  NOT NULL COMMENT '显示icon',
`ICON` VARCHAR(20) NULL COMMENT 'CSS样式icon',
`CSS_ICON` VARCHAR(20) NULL COMMENT 'CSS样式icon',
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '项目应用菜单';

-- ----------------------------
-- Table structure for NBO_APP_MENU_PERMISSION
-- ----------------------------
DROP TABLE IF EXISTS `NBO_APP_MENU_PERMISSION`;
CREATE TABLE `NBO_APP_MENU_PERMISSION` (
`FK_APP_MENU_ID` bigint(19) NOT NULL COMMENT '菜单id',
`FK_PERMISSION_ID` bigint(19) NOT NULL COMMENT '权限id',
PRIMARY KEY (`FK_APP_MENU_ID`, `FK_PERMISSION_ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '菜单权限关联表';

-- ----------------------------
-- Records of NBO_APP_MENU_PERMISSION
-- ----------------------------

-- ----------------------------
-- Table structure for NBO_APP_REPOSITORY
-- ----------------------------
DROP TABLE IF EXISTS `NBO_APP_REPOSITORY`;
CREATE TABLE `NBO_APP_REPOSITORY` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`APP_ID` bigint(19) NULL COMMENT '应用id',
`REPS_TYPE` VARCHAR(5) NULL COMMENT '仓库类型,git,svn',
`REPS_NAME` VARCHAR(50) NULL COMMENT '仓库名',
`REPS_URL` VARCHAR(1000) NULL COMMENT '仓库地址',
`REPS_USERNAME` VARCHAR(50) NULL COMMENT '代码仓库用户名',
`REPS_PASSWORD` VARCHAR(50) NULL COMMENT '代码仓库密码',
`DEFAULT_FLAG` bigint(1) NULL COMMENT '默认标志位',
`ENCODING_TYPE` VARCHAR(20) NULL COMMENT '编码类型',
`INSERT_OPERATOR` VARCHAR(50) NULL COMMENT '创建人',
`INSERT_OPERATOR_ID` bigint(19) NULL COMMENT '创建人id',
`INSERT_TIME` datetime NULL COMMENT '创建时间',
`MODIFY_OPERATOR` VARCHAR(50) NULL COMMENT '修改人',
`MODIFY_OPERATOR_ID` bigint(19) NULL COMMENT '修改人id',
`MODIFY_TIME` datetime NULL COMMENT '修改时间',
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '应用代码仓库表';

-- ----------------------------
-- Table structure for NBO_APP_RUNTIME_ENV
-- ----------------------------
DROP TABLE IF EXISTS `NBO_APP_RUNTIME_ENV`;
CREATE TABLE `NBO_APP_RUNTIME_ENV` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`APP_TYPE` VARCHAR(255) NULL ,
`COMMAND` VARCHAR(255) NULL ,
`DEFAULT_PORT` bigint(10) NULL ,
`DOCKER_IMAGE` VARCHAR(255) NULL ,
`RUN_DIR` VARCHAR(255) NULL ,
`RUNTIME_NAME` VARCHAR(255) NULL ,
`VERSION` VARCHAR(255) NULL ,
`HOME_DIR` VARCHAR(255) NULL ,
`JNDI_FLAG` bigint(1) DEFAULT 0  NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_APP_RUNTIME_ENV
-- ----------------------------
INSERT INTO `NBO_APP_RUNTIME_ENV` VALUES ('5', null, null, null, null, null, null, 'php', null, '80', '192.168.0.8:5000/newtouchone/v4-run-php:5.6', '/var/www/html', 'php5.6 apache ', '2.0', null, '0');
INSERT INTO `NBO_APP_RUNTIME_ENV` VALUES ('1', null, null, null, null, null, null, 'java', null, '8080', '192.168.0.8:5000/newtouchone/jdk1.8:2.0', '/jar', 'jdk1.8(仅用于部署springboot的jar包项目)', '2.0', null, '0');
INSERT INTO `NBO_APP_RUNTIME_ENV` VALUES ('2', null, null, null, null, null, null, 'java', null, '8080', '192.168.0.8:5000/newtouchone/tomcat8:2.0', '/tomcat/webapps', 'tomcat8 jdk7(仅用于部署war包项目)', '2.0', null, '0');
INSERT INTO `NBO_APP_RUNTIME_ENV` VALUES ('3', null, null, null, null, null, null, 'java', null, '8080', '192.168.0.8:5000/newtouchone/java:7', '/tomcat/webapps', 'tomcat8 jdk8(仅用于部署war包项目)', '2.0', null, '0');
INSERT INTO `NBO_APP_RUNTIME_ENV` VALUES ('74', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'nodejs', null, '3000', '192.168.0.8:5000/newtouchone/v4-run-node:1.13', null, 'nodejs 6.11.0 run', '6.11.0', '/home/', '0');

-- ----------------------------
-- Table structure for NBO_APP_TEMPLATE
-- ----------------------------
DROP TABLE IF EXISTS `NBO_APP_TEMPLATE`;
CREATE TABLE `NBO_APP_TEMPLATE` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`BUILD_TYPE` VARCHAR(10) NULL ,
`CODE_TYPE` VARCHAR(10) NULL ,
`COMMENTS` VARCHAR(100) NULL ,
`ENABLED` bigint(1) NULL ,
`GIT_MODULE_NAME` VARCHAR(50) NULL ,
`GIT_URL` VARCHAR(200) NULL ,
`IMG` VARCHAR(200) NULL ,
`NAME` VARCHAR(50) NULL ,
`VERSION` VARCHAR(10) NULL ,
`ENCODEING_TYPE` VARCHAR(10) DEFAULT 0  NULL ,
`DESCRIBE_` VARCHAR(500) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_APP_TEMPLATE
-- ----------------------------
INSERT INTO `NBO_APP_TEMPLATE` VALUES ('1', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'jar', 'java', '基于SpringBoot的Web开发框架', '1', 'master', 'http://183.66.65.223:30080/root/nbo-springboot-angular-template.git', '../resources/image/1-01.svg', 'SpringBoot多模块', '1.0.0', 'UTF-8', 'Spring Boot是由Pivotal团队提供的全新框架，其设计目的是用来简化新Spring应用的初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。通过这种方式，Boot致力于在蓬勃发展的快速应用开发领域（rapid application development）成为领导者。');
INSERT INTO `NBO_APP_TEMPLATE` VALUES ('2', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'jar', 'java', '基于SpringBoot的Web开发框架', '1', 'master', 'http://183.66.65.223:30080/root/nbo-springboot-angular-single-template.git', '../resources/image/web-01.svg', 'SpringBoot单应用', '1.0.0', 'UTF-8', 'Spring Boot是由Pivotal团队提供的全新框架，其设计目的是用来简化新Spring应用的初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。通过这种方式，Boot致力于在蓬勃发展的快速应用开发领域（rapid application development）成为领导者。');
INSERT INTO `NBO_APP_TEMPLATE` VALUES ('3', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, null, 'php', 'php开发框架', '1', 'master', 'http://183.66.65.223:30080/root/nbo-yii-basic-app-template.git', '../resources/image/yii.svg', 'Yii框架模板', null, 'UTF-8', 'Yii 是一个适用于开发 Web2.0 应用程序的高性能 PHP 框架。');
INSERT INTO `NBO_APP_TEMPLATE` VALUES ('4', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, date_format(now(), '%Y-%m-%d %T'), null, 'nodejs', 'Node.js开发框架', '1', 'master', 'http://183.66.65.223:30080/root/nbo-express-basic-template.git', '../resources/image/express.svg', 'Express框架模板', null, 'UTF-8', 'Express 是一个基于 Node.js 平台的极简、灵活的 web 应用开发框架，它提供一系列强大的特性，帮助你创建各种 Web 和移动设备应用。');

-- ----------------------------
-- Table structure for NBO_APP_TEST
-- ----------------------------
DROP TABLE IF EXISTS `NBO_APP_TEST`;
CREATE TABLE `NBO_APP_TEST` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`APP_ID` bigint(19) NULL COMMENT '应用id',
`FK_BUILD_EXEC_ID` bigint(19) NULL COMMENT '代码构建执行id',
`NODE_FLOW` VARCHAR(10) NULL COMMENT '测试流程设置',
`CURRENT_NODE` VARCHAR(20) NULL COMMENT '当前需测试节点 FT,UT,UAT,END(动态节点)',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`FK_ADMIN_FLOW_ID` bigint(19) NULL COMMENT '测试流程版本id',
`FK_TEST_TYPE_ID` bigint(19) NULL COMMENT '测试类型id',
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '测试流水线表';

-- ----------------------------
-- Table structure for NBO_APP_TEST_FILE
-- ----------------------------
DROP TABLE IF EXISTS `NBO_APP_TEST_FILE`;
CREATE TABLE `NBO_APP_TEST_FILE` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`APP_TEST_ID` bigint(19) NOT NULL ,
`FILE_NAME` VARCHAR(200) NULL COMMENT '文件名称',
`SAVE_PATH` VARCHAR(500) NULL COMMENT '保存路径',
`FILE_SIZE` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '应用测试文件表';

-- ----------------------------
-- Table structure for NBO_APP_TEST_FLOW
-- ----------------------------
DROP TABLE IF EXISTS `NBO_APP_TEST_FLOW`;
CREATE TABLE `NBO_APP_TEST_FLOW` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`FK_TEST_ID` bigint(19) NULL COMMENT '应用测试id',
`NODE_STATUS` VARCHAR(10) NULL COMMENT '测试状态PASS,NOPASS',
`NOPASS_REASON` VARCHAR(500) NULL COMMENT '测试不通过原因',
`CURRENT_NODE` VARCHAR(20) NULL COMMENT '当前测试节点',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '测试流水线实例表';

-- ----------------------------
-- Table structure for NBO_APP_TEST_TYPE
-- ----------------------------
DROP TABLE IF EXISTS `NBO_APP_TEST_TYPE`;
CREATE TABLE `NBO_APP_TEST_TYPE` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`TEST_TYPE` bigint(1) NULL COMMENT '是否为并行 0:串行,1:并行',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`RELEASE_VERSION` VARCHAR(50) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '测试流水线实例类型表';

-- ----------------------------
-- Table structure for NBO_BUILD_TASK
-- ----------------------------
DROP TABLE IF EXISTS `NBO_BUILD_TASK`;
CREATE TABLE `NBO_BUILD_TASK` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`MODULE_NAME` VARCHAR(255) NULL ,
`NAME_SPACE` VARCHAR(255) NULL ,
`REPS_BRANCH` VARCHAR(255) NULL ,
`SUPPORT_CODE_TYPE` VARCHAR(255) NULL ,
`TAG_NAME` VARCHAR(255) NULL ,
`TASK_NAME` VARCHAR(255) NULL ,
`ACTION_TYPE` VARCHAR(255) NULL ,
`BUILD_COMMAND` VARCHAR(255) NULL ,
`BUILD_ENV` VARCHAR(255) NULL ,
`BUILD_ENV_VERSION` VARCHAR(255) NULL ,
`BUILD_TOOLS` VARCHAR(255) NULL ,
`BUILD_TOOLS_VERSION` VARCHAR(255) NULL ,
`FILE_DIRECTORY` VARCHAR(255) NULL ,
`JDK_VERSION` VARCHAR(255) NULL ,
`MVN_ID` VARCHAR(255) NULL ,
`MVN_PASSWORD` VARCHAR(255) NULL ,
`MVN_USERNAME` VARCHAR(255) NULL ,
`TARGET_TYPE` VARCHAR(255) NULL ,
`APP_ID` bigint(19) NULL ,
`TASK_ID` bigint(19) NULL ,
`MAVEN_VERSION` VARCHAR(255) NULL ,
`ANT_VERSION` VARCHAR(255) NULL ,
`GRADLE_VERSION` VARCHAR(255) NULL ,
`SCRIPT_TYPE` VARCHAR(255) NULL ,
`COMMAND_PARAMS` VARCHAR(255) NULL ,
`APP_REPS_ID` bigint(19) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_BUILD_TASK_EXEC
-- ----------------------------
DROP TABLE IF EXISTS `NBO_BUILD_TASK_EXEC`;
CREATE TABLE `NBO_BUILD_TASK_EXEC` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`APP_NAME` VARCHAR(255) NULL ,
`COST_TIME` bigint(19) NULL ,
`ERROR_MSG` VARCHAR(255) NULL ,
`EXECUTING_STATUS` VARCHAR(255) NULL ,
`EXECUTING_TYPE` VARCHAR(255) NULL ,
`PROJECT_NAME` VARCHAR(255) NULL ,
`TASK_EXECUTING_PARAMS` VARCHAR(255) NULL ,
`DOCKER_IMAGE_NAME` VARCHAR(255) NULL ,
`FILE_SIZE` bigint(19) NULL ,
`MODULE_NAME` VARCHAR(255) NULL ,
`NAME_SPACE` VARCHAR(255) NULL ,
`PROCESS_STATUS` VARCHAR(255) NULL ,
`REPS_BRANCH` VARCHAR(255) NULL ,
`RESULT_FILE_URL` VARCHAR(255) NULL ,
`RUN_NODE_NAME` VARCHAR(255) NULL ,
`RUN_POD_NAME` VARCHAR(255) NULL ,
`TARGET_TYPE` VARCHAR(255) NULL ,
`VERSION` VARCHAR(255) NULL ,
`APP_ID` bigint(19) NULL ,
`JOB_EXECUTING_ID` bigint(19) NULL ,
`TASK_EXECUTING_ID` bigint(19) NULL ,
`BUILD_TASK_ID` bigint(19) NULL ,
`ERROR_STATUS` VARCHAR(255) NULL ,
`BUILD_FILE_TYPE` VARCHAR(10) NULL COMMENT '构建物来源(upload/build)',
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '任务执行实例表';

-- ----------------------------
-- Table structure for NBO_BUILD_TASK_TEMP
-- ----------------------------
DROP TABLE IF EXISTS `NBO_BUILD_TASK_TEMP`;
CREATE TABLE `NBO_BUILD_TASK_TEMP` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`ACTION_TYPE` VARCHAR(255) NULL ,
`BUILD_COMMAND` VARCHAR(255) NULL ,
`BUILD_ENV` VARCHAR(255) NULL ,
`BUILD_ENV_VERSION` VARCHAR(255) NULL ,
`BUILD_TOOLS` VARCHAR(255) NULL ,
`BUILD_TOOLS_VERSION` VARCHAR(255) NULL ,
`SUPPORT_CODE_TYPE` VARCHAR(255) NULL ,
`TARGET_TYPE` VARCHAR(255) NULL ,
`TASK_TEMPLATE_ID` bigint(19) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_BUILD_TASK_TEMP
-- ----------------------------
INSERT INTO `NBO_BUILD_TASK_TEMP` VALUES ('6', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), 'package', null, 'nodejs', 'nodejs6.11.0', 'zip', 'zip', 'nodejs', 'docker', '100018');
INSERT INTO `NBO_BUILD_TASK_TEMP` VALUES ('5', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), 'package', null, 'nodejs', 'nodejs6.11.0', 'zip', 'zip', 'nodejs', 's3', '100017');
INSERT INTO `NBO_BUILD_TASK_TEMP` VALUES ('1', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'package', 'mvn package -Dmaven.test.skip=true', 'java', 'jdk1.8', 'maven', 'maven3', 'java', 'docker', '100006');
INSERT INTO `NBO_BUILD_TASK_TEMP` VALUES ('10001', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'package', 'mvn package -Dmaven.test.skip=true', 'java', 'jdk1.8', 'maven', 'maven3', 'java', 's3', '100007');
INSERT INTO `NBO_BUILD_TASK_TEMP` VALUES ('20001', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'package', null, 'ios', 'ios', 'xcode', null, 'ios', 'ipa', '100008');
INSERT INTO `NBO_BUILD_TASK_TEMP` VALUES ('30001', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'package', null, 'android', 'android25', 'gradle', '2.5', 'android', 'apk', '100009');
INSERT INTO `NBO_BUILD_TASK_TEMP` VALUES ('40001', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'package', null, 'java', 'jdk1.8', 'ant', null, 'java', 'docker', '100010');
INSERT INTO `NBO_BUILD_TASK_TEMP` VALUES ('50001', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'package', null, 'java', 'jdk1.8', 'ant', null, 'java', 's3', '100011');
INSERT INTO `NBO_BUILD_TASK_TEMP` VALUES ('60001', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'deploy', 'mvn deploy -Dmaven.test.skip=true', 'java', 'jdk1.8', 'maven', 'maven3', 'java', 'mvn仓库', '100012');
INSERT INTO `NBO_BUILD_TASK_TEMP` VALUES ('70001', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'package', null, 'reactNative', 'nodejs', 'react-native', null, 'reactNative', 'apk', '100013');
INSERT INTO `NBO_BUILD_TASK_TEMP` VALUES ('80001', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'package', null, 'android', 'android25', 'ant', null, 'android', 'apk', '100014');
INSERT INTO `NBO_BUILD_TASK_TEMP` VALUES ('90001', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'package', null, 'php', 'php', 'tar', null, 'php', 'docker', '100015');

-- ----------------------------
-- Table structure for NBO_CERTIFICATE_CONF
-- ----------------------------
DROP TABLE IF EXISTS `NBO_CERTIFICATE_CONF`;
CREATE TABLE `NBO_CERTIFICATE_CONF` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`PRODUCT_BUNDLE_IDENTIFIER` VARCHAR(255) NULL ,
`CERTIFICATE_TYPE` VARCHAR(255) NULL ,
`CODE_SIGN_IDENTITY` VARCHAR(255) NULL ,
`CODE_TYPE` VARCHAR(255) NULL ,
`DEVELOPMENT_TEAM` VARCHAR(255) NULL ,
`PROVISIONING_PROFILE` VARCHAR(255) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_CERTIFICATE_CONF
-- ----------------------------

-- ----------------------------
-- Table structure for NBO_CODECHECK_TASK
-- ----------------------------
DROP TABLE IF EXISTS `NBO_CODECHECK_TASK`;
CREATE TABLE `NBO_CODECHECK_TASK` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`MODULE_NAME` VARCHAR(255) NULL ,
`NAME_SPACE` VARCHAR(255) NULL ,
`REPS_BRANCH` VARCHAR(255) NULL ,
`SUPPORT_CODE_TYPE` VARCHAR(255) NULL ,
`TAG_NAME` VARCHAR(255) NULL ,
`TASK_NAME` VARCHAR(255) NULL ,
`APP_ID` bigint(19) NULL ,
`TASK_ID` bigint(19) NULL ,
`APP_REPS_ID` bigint(19) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_CODECHECK_TASK_EXEC
-- ----------------------------
DROP TABLE IF EXISTS `NBO_CODECHECK_TASK_EXEC`;
CREATE TABLE `NBO_CODECHECK_TASK_EXEC` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`APP_NAME` VARCHAR(255) NULL ,
`COST_TIME` bigint(19) NULL ,
`ERROR_MSG` VARCHAR(255) NULL ,
`EXECUTING_STATUS` VARCHAR(255) NULL ,
`EXECUTING_TYPE` VARCHAR(255) NULL ,
`PROJECT_NAME` VARCHAR(255) NULL ,
`TASK_EXECUTING_PARAMS` VARCHAR(255) NULL ,
`NAME_SPACE` VARCHAR(255) NULL ,
`POD_NAME` VARCHAR(255) NULL ,
`PROCESS_STATUS` VARCHAR(255) NULL ,
`REPS_BRANCH` VARCHAR(255) NULL ,
`RESULT_URL` VARCHAR(255) NULL ,
`APP_ID` bigint(19) NULL ,
`JOB_EXECUTING_ID` bigint(19) NULL ,
`TASK_EXECUTING_ID` bigint(19) NULL ,
`CODE_CHECK_TASK_ID` bigint(19) NULL ,
`ERROR_STATUS` VARCHAR(255) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_CODECHECK_TASK_TEMP
-- ----------------------------
DROP TABLE IF EXISTS `NBO_CODECHECK_TASK_TEMP`;
CREATE TABLE `NBO_CODECHECK_TASK_TEMP` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`CHECK_COMMAND` VARCHAR(255) NULL ,
`CHECK_ENV` VARCHAR(255) NULL ,
`CHECK_ENV_VERSION` VARCHAR(255) NULL ,
`CHECK_TOOLS` VARCHAR(255) NULL ,
`CHECK_TOOLS_VERSION` VARCHAR(255) NULL ,
`SUPPORT_CODE_TYPE` VARCHAR(255) NULL ,
`TARGET_TYPE` VARCHAR(255) NULL ,
`TASK_TEMPLATE_ID` bigint(19) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_CODECHECK_TASK_TEMP
-- ----------------------------
INSERT INTO `NBO_CODECHECK_TASK_TEMP` VALUES ('4', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, null, 'nodejs', 'nodejs6.11.0', 'sonar', '2.4', 'nodejs', null, '100019');
INSERT INTO `NBO_CODECHECK_TASK_TEMP` VALUES ('1', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, null, 'java', 'jdk1.8', 'sonar', '2.4', 'java', null, '100001');
INSERT INTO `NBO_CODECHECK_TASK_TEMP` VALUES ('2', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, null, null, 'android', 'android25', '2.4', 'android', null, '100002');
INSERT INTO `NBO_CODECHECK_TASK_TEMP` VALUES ('3', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, null, null, 'ios', 'ios', '2.4', 'ios', null, '100003');

-- ----------------------------
-- Table structure for NBO_CONTAINER_SPEC
-- ----------------------------
DROP TABLE IF EXISTS `NBO_CONTAINER_SPEC`;
CREATE TABLE `NBO_CONTAINER_SPEC` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`CPU` VARCHAR(255) NULL ,
`MEMORY` VARCHAR(255) NULL ,
`INSERT_TIME` datetime NULL ,
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_CONTAINER_SPEC
-- ----------------------------
INSERT INTO `NBO_CONTAINER_SPEC` VALUES ('78', '1', '200M', date_format(now(), '%Y-%m-%d %T'), null, null, null, null, null);

-- ----------------------------
-- Table structure for NBO_DEPLOY_HOST_RESULT
-- ----------------------------
DROP TABLE IF EXISTS `NBO_DEPLOY_HOST_RESULT`;
CREATE TABLE `NBO_DEPLOY_HOST_RESULT` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`INNER_URL` VARCHAR(255) NULL ,
`POD_IMAGE` VARCHAR(255) NULL ,
`POD_NAME` VARCHAR(255) NULL ,
`POD_STATUS` VARCHAR(255) NULL ,
`RUNNING_STATUS` VARCHAR(255) NULL ,
`DEPLOY_VERSION_ID` bigint(19) NULL ,
`PROJECT_HOST_ENV_ID` bigint(19) NULL ,
`CHECK_STATUS` VARCHAR(100) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_DEPLOY_TASK_EXEC
-- ----------------------------
DROP TABLE IF EXISTS `NBO_DEPLOY_TASK_EXEC`;
CREATE TABLE `NBO_DEPLOY_TASK_EXEC` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`APP_NAME` VARCHAR(255) NULL ,
`COST_TIME` bigint(19) NULL ,
`ERROR_MSG` VARCHAR(255) NULL ,
`EXECUTING_STATUS` VARCHAR(255) NULL ,
`EXECUTING_TYPE` VARCHAR(255) NULL ,
`PROJECT_NAME` VARCHAR(255) NULL ,
`TASK_EXECUTING_PARAMS` VARCHAR(255) NULL ,
`DEPLOYMENT_NAME` VARCHAR(255) NULL ,
`OPERATION_TYPE` VARCHAR(255) NULL ,
`OPERATOR_NAME` VARCHAR(255) NULL ,
`APP_ID` bigint(19) NULL ,
`JOB_EXECUTING_ID` bigint(19) NULL ,
`TASK_EXECUTING_ID` bigint(19) NULL ,
`APP_DEPLOY_VERSION_ID` bigint(19) NULL ,
`ERROR_STATUS` VARCHAR(255) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_DEPLOY_TASK_TEMP
-- ----------------------------
DROP TABLE IF EXISTS `NBO_DEPLOY_TASK_TEMP`;
CREATE TABLE `NBO_DEPLOY_TASK_TEMP` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`APP_TYPE` VARCHAR(255) NULL ,
`COMMAND` VARCHAR(255) NULL ,
`DOCKER_IMAGE` VARCHAR(255) NULL ,
`SERVER_NAME` VARCHAR(255) NULL ,
`SERVER_ROOT` VARCHAR(255) NULL ,
`SERVER_VERSION` VARCHAR(255) NULL ,
`TYPE` VARCHAR(255) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_DEPLOY_TASK_TEMP
-- ----------------------------

-- ----------------------------
-- Table structure for NBO_DEPLOY_VERSION
-- ----------------------------
DROP TABLE IF EXISTS `NBO_DEPLOY_VERSION`;
CREATE TABLE `NBO_DEPLOY_VERSION` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`CN_NAME` VARCHAR(255) NULL ,
`DEPLOY_IMAGE_NAME` VARCHAR(255) NULL ,
`EN_NAME` VARCHAR(255) NULL ,
`ERROR_MSG` VARCHAR(1000) DEFAULT NULL  NULL ,
`INNER_VISIT_URL` VARCHAR(255) NULL ,
`K8S_DEPLOYMENT_NAME` VARCHAR(255) NULL ,
`K8S_CLUSTER_IP` VARCHAR(255) NULL ,
`K8S_SERVICE_NAME` VARCHAR(255) NULL ,
`NAMESPACE` VARCHAR(255) NULL ,
`REPLICAS_COUNT` bigint(10) NULL ,
`RESTART_COUNT` bigint(10) NULL ,
`DEPLOY_STATUS` VARCHAR(255) NULL ,
`TYPE` VARCHAR(255) NULL ,
`VERSION_NAME` VARCHAR(255) NULL ,
`VERSION_NO` VARCHAR(255) NULL ,
`VISIT_URL` VARCHAR(255) NULL ,
`APP_ID` bigint(19) NULL ,
`APP_DEPLOY_ID` bigint(19) NULL ,
`APP_RUNTIME_ENV_ID` bigint(19) NULL ,
`K8S_ENV_ID` bigint(19) NULL ,
`PROJECT_ID` bigint(19) NULL ,
`PROJECT_DOCKER_ENV_ID` bigint(19) NULL ,
`PROJECT_ENV_ID` bigint(19) NULL ,
`PROJECT_HOST_ENV_ID` bigint(19) NULL ,
`DATA_SOURCE_MARK` VARCHAR(255) NULL ,
`CONFIGMAP_NAME` VARCHAR(50) NULL ,
`CONFIGMAP_ROOT_DIR` VARCHAR(100) NULL ,
`CONTEXT_ROOT` VARCHAR(50) NULL ,
`CHECK_UP` VARCHAR(100) NULL ,
`APPLICATION_CLASS_LOADER` VARCHAR(100) NULL COMMENT '类装入器顺序',
`WAR_CLASS_LOADER` VARCHAR(100) NULL COMMENT '类装入器策略',
`IS_DELETE` bigint(1) NULL COMMENT '是否删除0否1是',
`JSESSION` VARCHAR(50) NULL ,
`JVM` VARCHAR(50) NULL ,
`CONTAINER_SPEC_ID` bigint(19) NULL ,
`SCALE_TYPE` VARCHAR(50) NULL ,
`MIN_REPLICAS` bigint(1) NULL ,
`MAX_REPLICAS` bigint(19) NULL ,
`CPU_UTILIZATION` bigint(19) NULL ,
`MEMORY_UTILIZATION` bigint(19) NULL ,
`CPU` bigint(19) NULL ,
`MEMORY` bigint(19) NULL ,
`DEPLOY_PATH` VARCHAR(255) NULL ,
`PATTERN_TYPE` bigint(1) NULL ,
`DEPLOY_COMMAND` VARCHAR(255) NULL COMMENT '部署服务启动脚本',
`LOG_PATH` VARCHAR(255) NULL ,
`HOT_DEPLOY` bigint(1) NULL COMMENT '启动脚本命令',
`WAR_PATH` VARCHAR(255) NULL COMMENT 'war包存放路径',
`STOP_COMMAND` VARCHAR(255) NULL ,
`START_COMMAND` VARCHAR(255) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_ENV_DOCKER
-- ----------------------------
DROP TABLE IF EXISTS `NBO_ENV_DOCKER`;
CREATE TABLE `NBO_ENV_DOCKER` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`K8S_RUNTIME_ENV_ID` bigint(19) NULL ,
`PROJECT_ID` bigint(19) NULL ,
`PROJECT_ENV_ID` bigint(19) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_ENV_HOST
-- ----------------------------
DROP TABLE IF EXISTS `NBO_ENV_HOST`;
CREATE TABLE `NBO_ENV_HOST` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`CONSOLE_PORT` VARCHAR(10) NULL ,
`CLUSTER_NAME` VARCHAR(50) NULL ,
`CONSOLE_PASSWORD` VARCHAR(50) NULL ,
`CONSOLE_USER_NAME` VARCHAR(50) NULL ,
`DEPLOYMENT_DIRECTORY` VARCHAR(200) NULL ,
`HOME_DIRECTORY` VARCHAR(200) NULL ,
`HOST_IP` VARCHAR(50) NULL ,
`HOST_NAME` VARCHAR(50) NULL ,
`HOST_PASSWORD` VARCHAR(50) NULL ,
`HOST_PORT` VARCHAR(10) NULL ,
`HOST_USER_NAME` VARCHAR(50) NULL ,
`IS_CLUSTER` VARCHAR(20) NULL ,
`LABELS` VARCHAR(100) NULL ,
`TYPE` VARCHAR(20) NULL ,
`WAS_CELL_NAME` VARCHAR(50) NULL ,
`WAS_CLUSTER_NAME` VARCHAR(50) NULL ,
`WAS_NODE_NAME` VARCHAR(50) NULL ,
`WAS_SERVER_NAME` VARCHAR(200) NULL ,
`PROJECT_ID` bigint(19) NULL ,
`PROJECT_ENV_ID` bigint(19) NULL ,
`WAS_JNDI_NAME` VARCHAR(200) NULL ,
`STOP_SHELL_PATH` VARCHAR(255) NULL ,
`START_SHELL_PATH` VARCHAR(255) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_GIT
-- ----------------------------
DROP TABLE IF EXISTS `NBO_GIT`;
CREATE TABLE `NBO_GIT` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`USER_NAME` VARCHAR(50) NULL ,
`PASSWORD` VARCHAR(50) NULL ,
`NAME` VARCHAR(50) NULL ,
`EMAIL` VARCHAR(50) NULL COMMENT 'email',
`USER_ID` bigint(19) NULL ,
`GITUSERID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'git用户表';

-- ----------------------------
-- Table structure for NBO_JNDI_CONFIG
-- ----------------------------
DROP TABLE IF EXISTS `NBO_JNDI_CONFIG`;
CREATE TABLE `NBO_JNDI_CONFIG` (
`ID` bigint(11) NOT NULL ,
`NAME` VARCHAR(100) NULL ,
`AUTH` VARCHAR(100) NULL ,
`TYPE` VARCHAR(100) NULL ,
`FACTORY` VARCHAR(100) NULL ,
`DRIVER_CLASS` VARCHAR(100) NULL ,
`JDBC_URL` VARCHAR(100) NULL ,
`USERNAME` VARCHAR(100) NULL ,
`PASSWORD` VARCHAR(100) NULL ,
`MIN_POOL_SIZE` VARCHAR(100) NULL ,
`MAX_POOL_SIZE` VARCHAR(100) NULL ,
`MAX_IDLE_TIME` VARCHAR(100) NULL ,
`ACQUIRE_INCREMENT` VARCHAR(100) NULL ,
`INITIAL_POOLSIZE` VARCHAR(100) NULL ,
`IDLE_CONNECTION_TEST_PERIOD` VARCHAR(100) NULL ,
`ACQUIRE_RETRY_ATTEMPTS` VARCHAR(100) NULL ,
`ACQUIRE_RETRY_DELAY` VARCHAR(100) NULL ,
`TEST_CONNECTIO_ON_CHECKIN` VARCHAR(100) NULL ,
`BREAK_AFTER_ACQUIRE_FAILURE` VARCHAR(100) NULL ,
`TEST_CONNECTION_ON_CHECKOUT` VARCHAR(100) NULL ,
`DEPLOY_VERSION_ID` bigint(11) NULL ,
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_JNDI_CONFIG
-- ----------------------------

-- ----------------------------
-- Table structure for NBO_JOB
-- ----------------------------
DROP TABLE IF EXISTS `NBO_JOB`;
CREATE TABLE `NBO_JOB` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`APP_NAME` VARCHAR(255) NULL ,
`JOB_EXECUTIONS` bigint(10) NULL ,
`JOB_NAME` VARCHAR(255) NULL ,
`JOB_PARAMS` VARCHAR(255) NULL ,
`PROJECT_NAME` VARCHAR(255) NULL ,
`APP_ID` bigint(19) NULL ,
`PROJECT_ID` bigint(19) NULL ,
`JOB_STATUS` bigint NULL ,
`GIT_BRANCH` VARCHAR(255) NULL COMMENT 'git代码分支',
`APP_REPS_ID` bigint(19) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_JOB_BAK_COPY
-- ----------------------------
DROP TABLE IF EXISTS `NBO_JOB_BAK_COPY`;
CREATE TABLE `NBO_JOB_BAK_COPY` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`APP_NAME` VARCHAR(255) NULL ,
`JOB_EXECUTIONS` bigint(10) NULL ,
`JOB_NAME` VARCHAR(255) NULL ,
`JOB_PARAMS` VARCHAR(255) NULL ,
`PROJECT_NAME` VARCHAR(255) NULL ,
`APP_ID` bigint(19) NULL ,
`PROJECT_ID` bigint(19) NULL ,
`JOB_STATUS` bigint NULL ,
`GIT_BRANCH` VARCHAR(255) NULL ,
`SVN_REPS` VARCHAR(255) NULL ,
`APP_REPS_ID` bigint(19) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_JOB_EXEC
-- ----------------------------
DROP TABLE IF EXISTS `NBO_JOB_EXEC`;
CREATE TABLE `NBO_JOB_EXEC` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`APP_NAME` VARCHAR(255) NULL ,
`COST_TIME` bigint(19) NULL ,
`ERROR_MSG` VARCHAR(255) NULL ,
`EXECUTING_STATUS` VARCHAR(255) NULL ,
`JOB_PARAMS` VARCHAR(255) NULL ,
`PROJECT_NAME` VARCHAR(255) NULL ,
`VERSION` VARCHAR(255) NULL ,
`APP_ID` bigint(19) NULL ,
`JOB_ID` bigint(19) NULL ,
`PROJECT_ID` bigint(19) NULL ,
`TASK_STATUS` VARCHAR(20) NULL COMMENT '作业运行中的任务状态',
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_K8S_RUNTIME_ENV
-- ----------------------------
DROP TABLE IF EXISTS `NBO_K8S_RUNTIME_ENV`;
CREATE TABLE `NBO_K8S_RUNTIME_ENV` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`APP_INNER_ACCESS_DOMAIN` VARCHAR(50) NULL ,
`APP_INNER_ACCESS_IP` VARCHAR(50) NULL ,
`APP_PUBLIC_ACCESS_DOMAIN` VARCHAR(50) NULL ,
`APP_PUBLIC_ACCESS_IP` VARCHAR(50) NULL ,
`DEFAULT_ENV` bigint(1) NULL ,
`K8S_URL` VARCHAR(200) NULL ,
`NAME` VARCHAR(50) NULL ,
`REGISTRY_URL` VARCHAR(200) NULL ,
`CERT_DATA` VARCHAR(4000) NULL ,
`KEY_DATA` VARCHAR(4000) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_K8S_RUNTIME_ENV
-- ----------------------------
INSERT INTO `NBO_K8S_RUNTIME_ENV` VALUES ('22', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, date_format(now(), '%Y-%m-%d %T'), null, '10.186.127.26', null, '10.186.127.26', '1', 'http://10.186.127.26:8080', '可集成环境', '10.186.122.94:5000', 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUQzVENDQXNXZ0F3SUJBZ0lVSFdBZTVoZm55ZGo1bjRRQXhhRmJVVERYOTFjd0RRWUpLb1pJaHZjTkFRRUwKQlFBd1pURUxNQWtHQTFVRUJoTUNRMDR4RURBT0JnTlZCQWdUQjBKbGFVcHBibWN4RURBT0JnTlZCQWNUQjBKbAphVXBwYm1jeEREQUtCZ05WQkFvVEEyczRjekVQTUEwR0ExVUVDeE1HVTNsemRHVnRNUk13RVFZRFZRUURFd3ByCmRXSmxjbTVsZEdWek1CNFhEVEUzTURjeE9UQXpORFV3TUZvWERURTRNRGN4T1RBek5EVXdNRm93YXpFTE1Ba0cKQTFVRUJoTUNRMDR4RURBT0JnTlZCQWdUQjBKbGFVcHBibWN4RURBT0JnTlZCQWNUQjBKbGFVcHBibWN4RnpBVgpCZ05WQkFvVERuTjVjM1JsYlRwdFlYTjBaWEp6TVE4d0RRWURWUVFMRXdaVGVYTjBaVzB4RGpBTUJnTlZCQU1UCkJXRmtiV2x1TUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUF5VllOVXc3aHcxWUUKY0VqWUNPNVZLTUFxU1IvTkFQTXkrVmU1eTdmZXdOTUc2T2wrY1grODQ3ZnNJSEcrNU1nTDIzNXQwS1ZWMVZwUgpZZitRK0tVbUZROHh3Q1BJZVFhTlFBaEFtVndrUm5hQXQrUklLc2VSL3FrNXhnYWxsZ01hbTVSM2VMaTJDNlU5CkE2b2NlWjlDczlJT0JseEZCdzE3VUNhMEM2OVJ5WXZLWEpBWVhpL3J3THR5eUJUM2s4cXNIMGZFdDcrRXB6L2wKek5KdVpkMS95NU1zcGNPcjlhUDJ6TzdJYjhaZmdoaC9Ic3RqNFgveUZud1VEQXpqTE01OHJuM2ZTUnU5MVRQUwpnY2VpMTJLZGlrU2NKMkgzcG9tbThIS1g5WWp2MUZzckdFTUlyMFBrWnRIWWJJM003YWNkTWszUWZEYXBheVorClIzbkI2aGR4elFJREFRQUJvMzh3ZlRBT0JnTlZIUThCQWY4RUJBTUNCYUF3SFFZRFZSMGxCQll3RkFZSUt3WUIKQlFVSEF3RUdDQ3NHQVFVRkJ3TUNNQXdHQTFVZEV3RUIvd1FDTUFBd0hRWURWUjBPQkJZRUZHM3FUUTFXQ0hCNApKaXRpc2wvaXNuV0lvd3Z1TUI4R0ExVWRJd1FZTUJhQUZEYlZFR0NveU1tc3NndyttbHlRZ3lVSlhaQ1pNQTBHCkNTcUdTSWIzRFFFQkN3VUFBNElCQVFCbUZHb0ExZzNXT1ZkREdPVXIzeWtNbXVtK1FyV0M4Nk5MSGgrNTczWEwKc2cwWXdLTGVXd1NKcE9BSWpONVAwMjFNR2xLVzFBdFBXVCtPNTZhZzJPbXNVeXdadUhLeVZLL1ZtVWd1bC9leQpOd1BiUCtlYVN5OGk4QjVFeXJraGsySU4yTkJZa1B3TTFOZzlqOHdvUVJDQkhLQWFaZm44S25jQ0tMaXBQT1lxCmN4K1lVc3N0V1IvVEpaU2dyMGRXUGIwUElEUytoZDRyTDVLM2tOZDJTU0JhanREdm43YXB1V28zZWFyYlFiMFcKbnY0aEU1VmE3MDNDUC96YndFblgwRzh4S1BuZVB4VmF5VWlKKzRaT3MxWDhPMk9SblJDU3YxUnNXaTBrNlVkRwpRaTlOVm9xbnRQSGV6WTRpanJrVU05RGFSL0dnbWtVbUVaY3lhMnVUbDgxdAotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg ==', 'LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFb3dJQkFBS0NBUUVBeVZZTlV3N2h3MVlFY0VqWUNPNVZLTUFxU1IvTkFQTXkrVmU1eTdmZXdOTUc2T2wrCmNYKzg0N2ZzSUhHKzVNZ0wyMzV0MEtWVjFWcFJZZitRK0tVbUZROHh3Q1BJZVFhTlFBaEFtVndrUm5hQXQrUkkKS3NlUi9xazV4Z2FsbGdNYW01UjNlTGkyQzZVOUE2b2NlWjlDczlJT0JseEZCdzE3VUNhMEM2OVJ5WXZLWEpBWQpYaS9yd0x0eXlCVDNrOHFzSDBmRXQ3K0Vwei9sek5KdVpkMS95NU1zcGNPcjlhUDJ6TzdJYjhaZmdoaC9Ic3RqCjRYL3lGbndVREF6akxNNThybjNmU1J1OTFUUFNnY2VpMTJLZGlrU2NKMkgzcG9tbThIS1g5WWp2MUZzckdFTUkKcjBQa1p0SFliSTNNN2FjZE1rM1FmRGFwYXlaK1IzbkI2aGR4elFJREFRQUJBb0lCQUhHbS9PQ00vdzVvU1JzbApVNlkrKzUyRVZKcHd0Q1c4STJNempUTWRlVVg2R2VWeW9TanF4Ykw2U1BYTG44bS96MG01SmI1cEJubm9nUlpECjBRODdFck5DbjMvcDh5bTJkQmZZVUxjQmw0eWJLbkFrRWtUcjRWTVRMZ1RHRGNVUHZYNWpvY2xvNDRMUlpRN2oKZ1MxNnBJbWpvcjBlYXV6ZlJHUHJaU2xQYjJqSVd6ZWtSZGxaWkNFUWFMb0lESzEyL3Y0Sit5eXVSR1pUNEJpUQpPYmgxNW5WSWc5bEpxTXdRemVPVVJ1Rmt6VC8zMXA3di9NQVh3b29MdkwzM2cxeGZNMk1Ga3kvZWlDMVNCTXY5ClRpWnkxa1FWTWROazFCMlJZeGtQRlU4T0E3bzdwUTRrdVRlRCtMN25Lc2l2bGlOaWRTaEFna3ErU0pEZENSUDAKSWErZXNKVUNnWUVBNTJrdWxsc1Z1ME53eFZMeWRybGNkSkhJeUdmalRiY25GaVZrcmJkU2hURnFHeDBUanhWQgpTWENRR2ZLMm1NRjI3OUo4YXU2K21FWkhNZzJTM2srNUVEc0Z2KzBaSjcyZy9OUXB6VFY0dCs2b2FibUhYM0FwCnNKeFdZeEs0emRuSzdmanRSOEtZUXdwVi9vTmthMVVnUm1YWlRDdGQxamhEQUwzR3V4NFo1ME1DZ1lFQTNyckgKcnRyNnRTcmtyaXlXclFUa25NK0tFQlBRUnZ6aUJoTmN4UFhnRi91TTlteGVUa0lzTkZSMWxVZ2lSTWtOVEQxRQpkcDZDYXRTZ1hzODdwNjZBbEVtQUplalJObnRDZDNpakxyMjdSNktUUTV0bkd3bFN1RTJGYnl2RVRTRVhNZFpzCkNIWFZvQWJQUjNYRGV3M2MwSUt4R25SQ1FQWGl6a1BWeEVjckNhOENnWUVBMjhlZTBuZ3huSWdCdTdiNnh0MW4KUE9NVW9abGhYWGNjclVEWWJOQldsRitKR2JVMDFVam5sN3RMY1FsK2VIZ040Tm0xQnM0MndHTEd6WGZzekMxRgpZMi9iRnh3MUx2US95TUFyNzFUZ2tUZ2VSVU5LbWM3cUdXMXg4bWhla2t0T0cxTzI3OWVXU3QydkxLbFhuMFRiCkFXRkx6cmJGU1dabjVIVlpJSEFIUkFjQ2dZQkc5OWk4WEVYYUNBckpmS2VlQlpzYVkvNm4xTWhlZGlGR3NsQ3kKNlcwMzl3MFpUN3BVMFR6b2g2alhvaDVaTUg2dU5pOWtaR2xGeE80OGgyZUlyRStIOEV1R3lNSXd5K0dIMDhhYgpGQlZpWStqc2Q4M0lqWlh2NTdPR2tybC9vZldVQ2JCdW1hMHh5am10bVZacUZTYXd3WlBRekE1NFNHQzJQR01XCm9WNlRQUUtCZ0NtWWZBTENhYnREajRwc243QkQ1ZFNRblhsNWVpTmNzdUZ6WmlKWjRxSTZCTjNRRnJUWWJsblEKeE5TTU1qVVB5My9KeXpFRTZGRUJaTXIxMEN0UGorYXFiSENqa1JPNnp3WWthcTBiVC9wV280ajhqd3pWeGdSUQp4c1dySUcxdFI3cGRvaWQvMTdmY0Q1RUtxaUhTOUpjRjRSb3RwaS96OHRwS1p3YzUvaFRDCi0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCg =');

-- ----------------------------
-- Table structure for NBO_MAC
-- ----------------------------
DROP TABLE IF EXISTS `NBO_MAC`;
CREATE TABLE `NBO_MAC` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`MAC_HOST` VARCHAR(255) NULL ,
`MAC_PORT` VARCHAR(255) NULL ,
`MAC_USERNAME` VARCHAR(255) NULL ,
`MAC_PASSWORD` VARCHAR(255) NULL ,
`INSERT_TIME` datetime NULL ,
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`NAME` VARCHAR(255) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_MAC
-- ----------------------------

-- ----------------------------
-- Table structure for NBO_MAVEN_CONF
-- ----------------------------
DROP TABLE IF EXISTS `NBO_MAVEN_CONF`;
CREATE TABLE `NBO_MAVEN_CONF` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`NAME` VARCHAR(255) NULL ,
`REPOSITORY_ID` VARCHAR(255) NULL ,
`REPOSITORY_URL` VARCHAR(255) NULL ,
`SERVER_PASSWORD` VARCHAR(255) NULL ,
`SERVER_USER_NAME` VARCHAR(255) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_MAVEN_CONF
-- ----------------------------
INSERT INTO `NBO_MAVEN_CONF` VALUES ('1', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, date_format('2017-09-15 11:14:17', '%Y-%m-%d %T'), 'nexus-releases', 'nexus-releases', 'http://10.191.9.13:8080/nexus/content/repositories/developmentOne/', 'zls281209', 'admin');

-- ----------------------------
-- Table structure for NBO_MIRRORS
-- ----------------------------
DROP TABLE IF EXISTS `NBO_MIRRORS`;
CREATE TABLE `NBO_MIRRORS` (
`ID` bigint NOT NULL ,
`MVNID` VARCHAR(255) NULL ,
`MVNUSERNAME` VARCHAR(255) NULL ,
`MVNREPOSITORYURL` VARCHAR(255) NULL ,
`INSERT_TIME` datetime NULL ,
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint NULL ,
`MODIFY_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_MIRRORS
-- ----------------------------
INSERT INTO `NBO_MIRRORS` VALUES ('21', 'all', '*', 'http://10.191.9.13:8080/nexus/content/groups/public/', date_format(now(), '%Y-%m-%d %T'), null, null, date_format(now(), '%Y-%m-%d %T'), null, null);

-- ----------------------------
-- Table structure for NBO_MOUNT_DIRECTORY
-- ----------------------------
DROP TABLE IF EXISTS `NBO_MOUNT_DIRECTORY`;
CREATE TABLE `NBO_MOUNT_DIRECTORY` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`HOST_DIR` VARCHAR(255) NULL ,
`CONTAINER_DIR` VARCHAR(255) NULL ,
`DEPLOY_VERSION_ID` bigint(19) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_MOUNT_DIRECTORY
-- ----------------------------

-- ----------------------------
-- Table structure for NBO_OPT_PERMISSION
-- ----------------------------
DROP TABLE IF EXISTS `NBO_OPT_PERMISSION`;
CREATE TABLE `NBO_OPT_PERMISSION` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`CODE` VARCHAR(20) NOT NULL ,
`NAME` VARCHAR(30) NOT NULL ,
`TYPE` VARCHAR(10) NOT NULL COMMENT '权限类型',
`INSERT_TIME` datetime NULL COMMENT '插入时间',
`INSERT_OPERATOR` VARCHAR(100) NULL COMMENT '插入者用户名',
`INSERT_OPERATOR_ID` bigint(19) NULL COMMENT '插入者用户名id',
`MODIFY_TIME` datetime NULL COMMENT '更新时间',
`MODIFY_OPERATOR` VARCHAR(100) NULL COMMENT '更新者',
`MODIFY_OPERATOR_ID` bigint(19) NULL COMMENT '更新者id',
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '项目权限表';

-- ----------------------------
-- Records of NBO_OPT_PERMISSION
-- ----------------------------

-- ----------------------------
-- Table structure for NBO_ORG_TREE
-- ----------------------------
DROP TABLE IF EXISTS `NBO_ORG_TREE`;
CREATE TABLE `NBO_ORG_TREE` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`ORG_NAME` VARCHAR(255) NULL ,
`ORG_CODE` VARCHAR(255) NULL ,
`PARENTID` VARCHAR(255) NULL ,
`STATUS` VARCHAR(255) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_ORG_TREE
-- ----------------------------
INSERT INTO `NBO_ORG_TREE` VALUES ('1', null, null, null, null, null, null, '根机构', '1', null, '0');

-- ----------------------------
-- Table structure for NBO_PARAMETERS
-- ----------------------------
DROP TABLE IF EXISTS `NBO_PARAMETERS`;
CREATE TABLE `NBO_PARAMETERS` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`DESC_` VARCHAR(255) NULL ,
`KEY_` VARCHAR(255) NULL ,
`NAME` VARCHAR(255) NULL ,
`TYPE` VARCHAR(255) NULL ,
`VALUE_` VARCHAR(4000) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_PARAMETERS
-- ----------------------------
INSERT INTO `NBO_PARAMETERS` VALUES ('60', null, null, null, null, null, null, '构建python项目所需的基础镜像', 'docker.images.pythonRunImage', null, null, 'registry.one2.newtouch.com:5000/newtouchone/buildimage-python:1');
INSERT INTO `NBO_PARAMETERS` VALUES ('1', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), 'Kubernetes访问地址，可以是域名访问地址也可以是http://ip+port', 'k8s.url', null, null, 'http://10.182.88.246:8080');
INSERT INTO `NBO_PARAMETERS` VALUES ('2', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), 'Docker仓库地址，格式 ip+port', 'docker.registry', null, null, '10.186.122.94:5000');
INSERT INTO `NBO_PARAMETERS` VALUES ('3', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), '构建Java项目所需的基础镜像，目前仅支持jdk1.7、jdk1.8', 'docker.images.taskRunImage', null, null, '10.186.122.94:5000/newtouchone/build-java:201709151018');
INSERT INTO `NBO_PARAMETERS` VALUES ('4', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), '构建Android项目所需的基础镜像', 'docker.images.androidRunImage', null, null, '10.186.122.94:5000/newtouchone/v4-android-buildimage:v4-1.0.0.1');
INSERT INTO `NBO_PARAMETERS` VALUES ('5', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), '构建IOS项目所需的基础镜像', 'docker.images.iosRunImage', null, null, '10.186.122.94:5000/newtouchone/v4-ios-buildimage:v4.2-test-1.0.0.1');
INSERT INTO `NBO_PARAMETERS` VALUES ('6', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), '构建PHP项目所需的基础镜像', 'docker.images.phpRunImage', null, null, null);
INSERT INTO `NBO_PARAMETERS` VALUES ('7', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), 'Ansible部署应用所需的基础镜像', 'docker.images.ansibleRunImage', null, null, '10.186.122.94:5000/newtouchone/host-deploy-test:5');
INSERT INTO `NBO_PARAMETERS` VALUES ('8', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), 'Ceph访问地址，是代理服务器的ip或者节点服务器的IP加端口', 'ceph.innerUrl', null, null, '10.182.124.121');
INSERT INTO `NBO_PARAMETERS` VALUES ('9', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), 'Ceph外网访问地址，查看构建和测试的结果文件时使用', 'ceph.url', null, null, '10.182.124.121');
INSERT INTO `NBO_PARAMETERS` VALUES ('10', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), 'Ceph的访问key值', 'ceph.accesskey', null, null, '3B3Z9E5IMAWTJSM1E5QI');
INSERT INTO `NBO_PARAMETERS` VALUES ('11', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), 'Ceph认证key值', 'ceph.secretkey', null, null, 'J8dNyBJMBOIJqU5SUbXKtsNEVz2VAsTpf3Cwv7KC');
INSERT INTO `NBO_PARAMETERS` VALUES ('12', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), 'Ceph默认桶名称', 'ceph.bucketName', null, null, 'newtouchone');
INSERT INTO `NBO_PARAMETERS` VALUES ('13', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), 'Sonar访问地址，是代理服务器的ip或者节点服务器的IP加端口', 'sonar.innerUrl', null, null, 'http://10.186.122.240:9000');
INSERT INTO `NBO_PARAMETERS` VALUES ('14', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), 'Sonar外网地址', 'sonar.url', null, null, 'http://10.186.122.240:9000');
INSERT INTO `NBO_PARAMETERS` VALUES ('15', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), 'Sonar用户名', 'sonar.username', null, null, 'admin');
INSERT INTO `NBO_PARAMETERS` VALUES ('16', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), 'Sonar密码', 'sonar.password', null, null, 'admin');
INSERT INTO `NBO_PARAMETERS` VALUES ('120', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, null, 'mac.mac1.host', null, 'mac', '10.203.68.140');
INSERT INTO `NBO_PARAMETERS` VALUES ('121', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, date_format('2017-06-27 15:06:21', '%Y-%m-%d %T'), null, 'mac.mac1.port', null, 'mac', 'cicd');
INSERT INTO `NBO_PARAMETERS` VALUES ('122', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, date_format('2017-06-27 15:06:21', '%Y-%m-%d %T'), null, 'mac.mac1.username', null, 'mac', '1qazZSE$');
INSERT INTO `NBO_PARAMETERS` VALUES ('123', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, date_format('2017-06-27 15:06:21', '%Y-%m-%d %T'), null, 'mac.mac1.password', null, 'mac', '22');
INSERT INTO `NBO_PARAMETERS` VALUES ('140', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), '文档应用地址', 'doc.url', null, null, 'docs/index.html');
INSERT INTO `NBO_PARAMETERS` VALUES ('160', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), null, 'k8s.cert.data', null, null, 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUQzVENDQXNXZ0F3SUJBZ0lVWE9KMmw3MWs5UUIvaTBKcVlqM3hQaVdOeXE4d0RRWUpLb1pJaHZjTkFRRUwKQlFBd1pURUxNQWtHQTFVRUJoTUNRMDR4RURBT0JnTlZCQWdUQjBKbGFVcHBibWN4RURBT0JnTlZCQWNUQjBKbAphVXBwYm1jeEREQUtCZ05WQkFvVEEyczRjekVQTUEwR0ExVUVDeE1HVTNsemRHVnRNUk13RVFZRFZRUURFd3ByCmRXSmxjbTVsZEdWek1CNFhEVEUzTURnek1EQTVNREF3TUZvWERURTRNRGd6TURBNU1EQXdNRm93YXpFTE1Ba0cKQTFVRUJoTUNRMDR4RURBT0JnTlZCQWdUQjBKbGFVcHBibWN4RURBT0JnTlZCQWNUQjBKbGFVcHBibWN4RnpBVgpCZ05WQkFvVERuTjVjM1JsYlRwdFlYTjBaWEp6TVE4d0RRWURWUVFMRXdaVGVYTjBaVzB4RGpBTUJnTlZCQU1UCkJXRmtiV2x1TUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUF2NDVBbWpwWTJQVkYKMXY3MUt5enhXa3dPRXVicm1TNkpZb2tPeHlqUlJiN1Q0MHQ4dlNWaHhCOVlESVpHaXhGOXZGVzR1dTFURHZCdwpEYUZRQnEwL3dhL2wwbnNYeXUvL2JkdmFVL3BaVEY2ZzJ5K2RCRmMxeTFsa2NUWjl1TW9lVGRRVHhSR2MyUFRwCkV6V1F5b0FwTHRhT096WlFTWUMrd3FPU0F1R29KNUt2K3A5RDZuWGFjc2V3Z2NnR2p6eWplTG94cmdGckZSUGEKcEZOMlYyTDBCQ2JHcHYzTGhxRzlML0tZb1oyZGRIbnhySlFzcExTRlRZcFBsMTlBcityVU9zSzZqRGlVM0NqUAp5NWdKcFYxWm1WcnVvMkdGbDlXU3JXMUY1R3d2ZXBVSjN2b3VZaXM1U3lyeTZHMlE3YVEwZXRaUWE1OXVQTlpSCkkvSjVXbElmQ3dJREFRQUJvMzh3ZlRBT0JnTlZIUThCQWY4RUJBTUNCYUF3SFFZRFZSMGxCQll3RkFZSUt3WUIKQlFVSEF3RUdDQ3NHQVFVRkJ3TUNNQXdHQTFVZEV3RUIvd1FDTUFBd0hRWURWUjBPQkJZRUZQZktsR2RkTFNpKwpNM01MVWs4R1g2SURsODhtTUI4R0ExVWRJd1FZTUJhQUZGSUE3UzRURGx4U2hWdk91MmFHVEdlQ21jakpNQTBHCkNTcUdTSWIzRFFFQkN3VUFBNElCQVFBWjQ3OXJwV0xqekJrK2lUSkNYc21jSFgrdHJUNkJpNWNvR200S0Rhb3MKaDdlNzJ1VExGM2gvQlVnY1BDaVhYaktkL1RKTnZNZUZuRWZpQjg2dmoxUmE5OGdyclpDU295UXVoSThTa1A3NgpXR1lKK1h3L3ZTY3FGVDlZVThVdFpBenF0ZXRJN1JCQTBLVVJXRzBWMU1jdzltUlFDVUFuRUdXRTZTYm1FelpUCktwMm1qak56UDU5c0NLN0ZXV2M5SlY4SmROQTk2ZEhPZWpVR3JIZjFvNDZFbmFYRXJ3SnBWQnlZRzQrVnhiV24KUWUrVU5SL2E2SWVwalNmMTEwKzg2dHhFUlcySDlHbDR5cDV2Z0duUkxhWERWdnpNU2ZvSWZMQWFSTWUydGdNTQp3YTlQNlNWQ3J3NjRPVjdYbTJKejZzaW1VRDFSU2paQ0M5Q01Nb3RocktRMgotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==');
INSERT INTO `NBO_PARAMETERS` VALUES ('161', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), null, 'k8s.key.data', null, null, 'LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFcEFJQkFBS0NBUUVBdjQ1QW1qcFkyUFZGMXY3MUt5enhXa3dPRXVicm1TNkpZb2tPeHlqUlJiN1Q0MHQ4CnZTVmh4QjlZRElaR2l4Rjl2Rlc0dXUxVER2QndEYUZRQnEwL3dhL2wwbnNYeXUvL2JkdmFVL3BaVEY2ZzJ5K2QKQkZjMXkxbGtjVFo5dU1vZVRkUVR4UkdjMlBUcEV6V1F5b0FwTHRhT096WlFTWUMrd3FPU0F1R29KNUt2K3A5RAo2blhhY3Nld2djZ0dqenlqZUxveHJnRnJGUlBhcEZOMlYyTDBCQ2JHcHYzTGhxRzlML0tZb1oyZGRIbnhySlFzCnBMU0ZUWXBQbDE5QXIrclVPc0s2akRpVTNDalB5NWdKcFYxWm1WcnVvMkdGbDlXU3JXMUY1R3d2ZXBVSjN2b3UKWWlzNVN5cnk2RzJRN2FRMGV0WlFhNTl1UE5aUkkvSjVXbElmQ3dJREFRQUJBb0lCQVFDM2U1UG41eEdwcDY3aApGRkJVcmZUMVVEcCs0cEF6cHo3VGtvTUVROVhJMzlQb09TdGZwZ255cVM5V3Q5dWtZL216Ujh6dHlGdXh5SjhjCmZ6Sy9ZbjNha2hrcXR0dUFlTWlMTzNieXo2OXZsb2l2eXZpMDZyQk5ldS9aL1o4SlBSa3Y1WCtXV1p1S3VYVDAKQUhBVGVCVjZsdXVnVGhNemhNMjBkS2RzZVNmdjFrcHhKU3RPKzhiM0x4ZW5kWG5kTnNzTmZrREV6RkpGYnp1NQpVZkJmQWI2S29xYVJNUHNlN0dlamtuWWRwWUp1b0pEWFFIT2M2ZGMydG5FZE9nU0cxSjJCSE5ZNWYzQlhCUkF1CjJJRTBpTG54Y3FPSGZpQUx5a2RCME54b2NpMHY3RDhIUWs4NVF0V0FvdktzRjJIbXhCOUdQUnpWbk9tWUg0K1YKdjNQNWhnYVJBb0dCQU9lR3JrbmZvUVRGTlcxYmVFUzhLZWFQdkxUZU4rYzFwbVlTTEtXQTV2UVNNeTV2QzhXTQpsbkVHcXY4RTl5MTlOcG5UeUJyRTU2U1Zjd3N0NzB4aVl6ZnRQRmg4RjhWSFhjcmNuVy9URnZuOG56VXFtKzNlCkMvdTY1NEdUUmFRRG02djZWcmxUQUlvcUdpRWNKN1ZUUWJrUUZBUVZFQmdka1BIaTNFcUtSWWVqQW9HQkFOUE4KN3ZHcVZQemhhbG5jdCtuWC95NjhWSVFyRkFORnNldlR6Q2RYZjA4V0g0UytETkNkb2hzWEVBYUxaYjBhRElRTwp6VGwyWnExWGJBV3VNM0wrREQ1d2R0NW16ZmMvSWI4WTM4SkdpbUtuWE1kKzQrMVpWUG80RnZEUXhGSjhXT0lhCkJlRVNpUFFUTDYxS2dEQzhhR2M4d2NXV2lJM0RWS0FOcFZrbXN5RjVBb0dCQUlVejFraElNZkoxcDNSZ1FNU0MKNFRSMkUrS1hTdUJwM0c4ekc1Nm9sN2RxVlNuczEzL3pqNFk5aU5tcHVLL2lMeXkzVEpRaUh3ZHd1RHlCVkFERgpSa0loNmlzYVVlNjlUWGZ1RDJJTHQxZGlBUkxzamNOL2tiTmxaOVlEcmZoYjN3OUZ1dWxxbUkvbEF4MXpmbUR6CklvZmZlVFNVRGF0aUwwY0s5eVNuZ3JNekFvR0FWWDNaQmJqQUJ6YWhhOVk0Y2U0YWRXM1ZHMmdiOHRvdDM4ZWsKcnZpVlRZSGJoUVFGUGl0eVpFYmgxQkp1Slc4ZlFDcU5VYlZsNm0vUURWYnNNMjB4MmY0aExOSUlMdFZQdE1mQQpnYlZoWkVLem8xNm5kNFZJVkp0UlB6QzFIYXBOWWk0bzAxbGM2RS9hUGJORm5PWmZxZFFQVHNiZEpZT0RZL3MrCkU0Y1laTmtDZ1lCY1hZaEJUN09kSll0N0NUSVVZclNFczVCZDVxT1RKNVJJTm54NGhuZk9uU1hWbUZvVkhtOGsKeitqTS94NXVSTTJjdkdsSXcxQnZWRzFkdUVpSzBudTVYUW1Pa1NING9jNks5TG9PL1Rid3UxcGVEU3BDQXp5YQpFUWtzL3ExK3BxUjN2NlVFZEI0SGUwRWtaL01jU091eGk4aVJXTTNlMHZnUWhiNmo0RlRzUkE9PQotLS0tLUVORCBSU0EgUFJJVkFURSBLRVktLS0tLQo=');
INSERT INTO `NBO_PARAMETERS` VALUES ('162', null, null, null, null, null, date_format('2017-08-28 10:55:11', '%Y-%m-%d %T'), null, 'docker.images.nodejsRunImage', null, null, null);
INSERT INTO `NBO_PARAMETERS` VALUES ('163', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), null, 'azure.blob.url', null, null, null);
INSERT INTO `NBO_PARAMETERS` VALUES ('164', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), null, 'azure.blob.account.name', null, null, null);
INSERT INTO `NBO_PARAMETERS` VALUES ('165', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), null, 'azure.blob.account.key', null, null, null);
INSERT INTO `NBO_PARAMETERS` VALUES ('166', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), null, 'azure.blob.container.name', null, null, null);
INSERT INTO `NBO_PARAMETERS` VALUES ('167', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), null, 'es.hosts', null, null, null);
INSERT INTO `NBO_PARAMETERS` VALUES ('168', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), null, 'git.app.template.limits', null, null, '10');
INSERT INTO `NBO_PARAMETERS` VALUES ('169', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), null, 'git.master.url', null, null, 'http://10.186.24.227:10080');
INSERT INTO `NBO_PARAMETERS` VALUES ('170', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), null, 'git.master.inner.url', null, null, 'http://10.186.24.227:10080');
INSERT INTO `NBO_PARAMETERS` VALUES ('171', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), null, 'git.master.token', null, null, 'T7JpzkNJCJsA-Rt8yz57');
INSERT INTO `NBO_PARAMETERS` VALUES ('180', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), '容器日志主路径', 'container.log.host.root.path', null, null, '/applog');
INSERT INTO `NBO_PARAMETERS` VALUES ('181', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), '容器日志初始化镜像', 'container.log.init.image', null, null, '10.186.122.94:5000/newtouchone/busybox:1.24');
INSERT INTO `NBO_PARAMETERS` VALUES ('182', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), null, 'docker.images.staticResourceRunImage', null, null, null);

-- ----------------------------
-- Table structure for NBO_PROJECT
-- ----------------------------
DROP TABLE IF EXISTS `NBO_PROJECT`;
CREATE TABLE `NBO_PROJECT` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`APP_NUMS` bigint(10) NULL ,
`CREATE_USER_NAME` VARCHAR(50) NULL ,
`DELETE_TIME` datetime NULL ,
`DESC_` VARCHAR(200) NULL ,
`NAME` VARCHAR(50) NULL ,
`NAME_SPACE` VARCHAR(50) NULL ,
`STATUS` VARCHAR(10) NULL ,
`CREATE_USER_ID` bigint(19) NULL ,
`ORG_NAME` VARCHAR(50) NULL ,
`ORG_ID` bigint NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_PROJECT_ENV
-- ----------------------------
DROP TABLE IF EXISTS `NBO_PROJECT_ENV`;
CREATE TABLE `NBO_PROJECT_ENV` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`ENV_NAME` VARCHAR(50) NULL ,
`ENV_TYPE` VARCHAR(10) NULL ,
`PROJECT_ID` bigint(19) NULL ,
`TYPE` VARCHAR(20) NULL ,
`ENV_LABEL_CODE` VARCHAR(100) NULL COMMENT '标签代码',
`ENV_LABEL` VARCHAR(100) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_PROJECT_ROLE
-- ----------------------------
DROP TABLE IF EXISTS `NBO_PROJECT_ROLE`;
CREATE TABLE `NBO_PROJECT_ROLE` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`PROJECT_ID` bigint(19) NOT NULL COMMENT '项目id',
`ROLE_NAME` VARCHAR(30) NOT NULL COMMENT '角色名',
`INSERT_TIME` datetime NULL ,
`INSERT_OPERATOR` VARCHAR(100) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(100) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '项目角色表';

-- ----------------------------
-- Records of NBO_PROJECT_ROLE
-- ----------------------------

-- ----------------------------
-- Table structure for NBO_PROJECT_ROLE_ENV
-- ----------------------------
DROP TABLE IF EXISTS `NBO_PROJECT_ROLE_ENV`;
CREATE TABLE `NBO_PROJECT_ROLE_ENV` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`FK_PROJECT_ID` bigint(19) NOT NULL COMMENT '项目id',
`FK_ADMIN_SYS_ROLE_ID` bigint(19) NOT NULL COMMENT '角色id',
`FK_ADMIN_SYS_ENV_ID` bigint(19) NOT NULL COMMENT '环境id',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '项目环境关联表';

-- ----------------------------
-- Table structure for NBO_PROJECT_SERVICE
-- ----------------------------
DROP TABLE IF EXISTS `NBO_PROJECT_SERVICE`;
CREATE TABLE `NBO_PROJECT_SERVICE` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`ACCOUNT_NAME` VARCHAR(255) NULL ,
`ACCOUNT_PASSWORD` VARCHAR(255) NULL ,
`DB_NAME` VARCHAR(255) NULL ,
`ENVIRONMENT_NAME` VARCHAR(255) NULL ,
`EXTEND_ATTR1` VARCHAR(255) NULL ,
`EXTEND_ATTR2` VARCHAR(255) NULL ,
`EXTEND_ATTR3` VARCHAR(255) NULL ,
`INSTANCE_ID` VARCHAR(255) NULL ,
`INSTANCE_URL` VARCHAR(255) NULL ,
`MESSAGE` VARCHAR(255) NULL ,
`PORT` VARCHAR(255) NULL ,
`STATUS` VARCHAR(255) NULL ,
`TYPE` VARCHAR(255) NULL ,
`PROJECT_ID` bigint(19) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_PROJECT_TEST
-- ----------------------------
DROP TABLE IF EXISTS `NBO_PROJECT_TEST`;
CREATE TABLE `NBO_PROJECT_TEST` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`APP_ID` bigint(19) NULL ,
`FK_BUILD_EXEC_ID` bigint(19) NULL COMMENT '代码构建执行id',
`TEST_FLOW` VARCHAR(255) NULL COMMENT '测试流程设置',
`FT_STATUS` VARCHAR(255) NULL COMMENT 'FT测试状态NONE,PASS,NOPASS',
`FT_NOPASS_REASON` VARCHAR(255) NULL COMMENT 'FT测试不通过原因',
`ST_STATUS` VARCHAR(255) NULL COMMENT 'ST测试状态NONE,PASS,NOPASS',
`ST_NOPASS_REASON` VARCHAR(255) NULL COMMENT 'ST测试不通过原因',
`UAT_STATUS` VARCHAR(255) NULL COMMENT 'UAT测试状态 NONE,PASS,NOPASS',
`UAT_NOPASS_REASON` VARCHAR(255) NULL COMMENT 'UAT测试不通过原因',
`CURRENT_NODE` VARCHAR(255) NULL COMMENT '当前需测试节点 FT,UT,UAT,END',
`INSERT_OPERATOR` VARCHAR(255) NULL,
`INSERT_OPERATOR_ID` bigint(19) NULL,
`INSERT_TIME` datetime NULL,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`FT_OPERATOR` VARCHAR(255) NULL COMMENT 'FT操作人',
`ST_OPERATOR` VARCHAR(255) NULL COMMENT 'ST操作人',
`UAT_OPERATOR` VARCHAR(255) DEFAULT ''  NULL COMMENT 'UAT操作人',
`FT_OP_TIME` datetime DEFAULT NULL COMMENT 'FT操作时间',
`ST_OP_TIME` datetime DEFAULT NULL COMMENT 'ST操作时间',
`UAT_OP_TIME` datetime DEFAULT NULL COMMENT 'UAT操作时间',
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_PROJECT_TEST
-- ----------------------------

-- ----------------------------
-- Table structure for NBO_PROJECT_USER
-- ----------------------------
DROP TABLE IF EXISTS `NBO_PROJECT_USER`;
CREATE TABLE `NBO_PROJECT_USER` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`PROJECT_NAME` VARCHAR(50) NULL ,
`ROLE_NAME` VARCHAR(20) NULL ,
`USER_CNNAME` VARCHAR(50) NULL ,
`USER_NAME` VARCHAR(50) NULL ,
`PROJECT_ID` bigint(19) NULL ,
`ROLE_ID` bigint(19) NULL ,
`USER_ID` bigint(19) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_PROJECT_USER_ROLE
-- ----------------------------
DROP TABLE IF EXISTS `NBO_PROJECT_USER_ROLE`;
CREATE TABLE `NBO_PROJECT_USER_ROLE` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`FK_PROJECT_ID` bigint(19) NOT NULL COMMENT '项目id',
`FK_PROJECT_USER_ID` bigint(19) NOT NULL COMMENT '项目用户id',
`FK_ADMIN_SYS_ROLE_ID` bigint(19) NOT NULL COMMENT '角色id',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_ROLE
-- ----------------------------
DROP TABLE IF EXISTS `NBO_ROLE`;
CREATE TABLE `NBO_ROLE` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`ROLE_NAME` VARCHAR(255) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_ROLE
-- ----------------------------

-- ----------------------------
-- Table structure for NBO_ROLE_PERMISSION
-- ----------------------------
DROP TABLE IF EXISTS `NBO_ROLE_PERMISSION`;
CREATE TABLE `NBO_ROLE_PERMISSION` (
`FK_ROLE_ID` bigint(19) NOT NULL COMMENT '角色id',
`FK_PERMISSION_ID` bigint(19) NOT NULL COMMENT '权限id',
PRIMARY KEY (`FK_ROLE_ID`, `FK_PERMISSION_ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '角色权限关联表';

-- ----------------------------
-- Records of NBO_ROLE_PERMISSION
-- ----------------------------

-- ----------------------------
-- Table structure for NBO_SEQUENCE
-- ----------------------------
DROP TABLE IF EXISTS `NBO_SEQUENCE`;
CREATE TABLE `NBO_SEQUENCE` (
`SEQUENCE_NAME` VARCHAR(255) NULL ,
`NEXT_VAL` bigint(19) NULL 
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_SEQUENCE
-- ----------------------------
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_ADMIN_FLOW', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_ADMIN_FLOW_NODE', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_ADMIN_PROJECT_ENV', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_ADMIN_PROJECT_MENU', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_ADMIN_PROJECT_ROLE', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_ADMIN_USER', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_APP', '8894');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_APP_CONFIG_FILE', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_APP_DEPLOY', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_APP_MENU', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_APP_RUNTIME_ENV', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_APP_TEMPLATE', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_APP_TEST', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_APP_TEST_FLOW', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_APP_TEST_TYPE', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_BUILD_TASK', '8893');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_BUILD_TASK_EXEC', '8889');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_CERTIFICATE_CONF', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_CODECHECK_TASK', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_CODECHECK_TASK_EXEC', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_CODECHECK_TASK_TEMP', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_CONTAINER_SPEC', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_DEPLOY_HOST_RESULT', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_DEPLOY_TASK_EXEC', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_DEPLOY_TASK_TEMP', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_DEPLOY_VERSION', '8889');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_ENV_HOST', '8889');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_GIT', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_JNDI_CONFIG', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_JOB', '8893');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_JOB_EXEC', '8889');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_K8S_RUNTIME_ENV', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_MAC', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_MAVEN_CONF', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_MIRRORS', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_MOUNT_DIRECTORY', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_ORG_TREE', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_PARAMETERS', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_PROJECT', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_PROJECT_ENV', '8889');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_PROJECT_ROLE_ENV', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_PROJECT_SERVICE', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_PROJECT_USER', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_PROJECT_USER_ROLE', '8889');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_ROLE', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_SERVICE_LIST_CONF', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_STEP', '8893');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_STEP_EXEC', '8889');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_TASK', '8893');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_TASK_EXEC', '8889');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_UNITTEST_TASK', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_UNITTEST_TASK_EXEC', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_UNITTEST_TASK_TEMP', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_USER', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_APP_TEST_FILE', '8888');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_APP_REPOSITORY', '8894');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_BUILD_TASK_TEMP', '100000');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_ENV_DOCKER', '20000');
INSERT INTO `NBO_SEQUENCE` VALUES ('SEQ_NBO_TASK_TEMP', '200000');

-- ----------------------------
-- Table structure for NBO_SERVICE_LIST_CONF
-- ----------------------------
DROP TABLE IF EXISTS `NBO_SERVICE_LIST_CONF`;
CREATE TABLE `NBO_SERVICE_LIST_CONF` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`DESCRIBE` VARCHAR(255) NULL ,
`IMG_URL` VARCHAR(255) NULL ,
`MAIN_TYPE` VARCHAR(255) NULL ,
`NAME` VARCHAR(255) NULL ,
`TYPE` VARCHAR(255) NULL ,
`VERSION` VARCHAR(255) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_SERVICE_LIST_CONF
-- ----------------------------
INSERT INTO `NBO_SERVICE_LIST_CONF` VALUES ('5', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, date_format(now(), '%Y-%m-%d %T'), null, null, 'MySQL', 'MySQL2', 'MySQL', null);
INSERT INTO `NBO_SERVICE_LIST_CONF` VALUES ('1', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, '最流行的开源关系型数据库', '../resources/image/mysql.svg', 'mysql', 'MySQL', 'paas', '5.6.0');
INSERT INTO `NBO_SERVICE_LIST_CONF` VALUES ('2', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, '高性能的key-value内存数据库', '../resources/image/redis.svg', 'redis', 'Redis', 'paas', '1.0.0');

-- ----------------------------
-- Table structure for NBO_STEP
-- ----------------------------
DROP TABLE IF EXISTS `NBO_STEP`;
CREATE TABLE `NBO_STEP` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`ORDER_` bigint(10) NULL ,
`STEP_NAME` VARCHAR(255) NULL ,
`STEP_PARAMS` VARCHAR(255) NULL ,
`JOB_ID` bigint(19) NULL ,
`PREV_STEP_ID` bigint(19) NULL ,
`TASK_ID` bigint(19) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_STEP_EXEC
-- ----------------------------
DROP TABLE IF EXISTS `NBO_STEP_EXEC`;
CREATE TABLE `NBO_STEP_EXEC` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`COST_TIME` bigint(19) NULL ,
`ERROR_MSG` VARCHAR(255) NULL ,
`EXECUTING_STATUS` VARCHAR(255) NULL ,
`ORDER_` bigint(10) NULL ,
`STEP_PARAMS` VARCHAR(255) NULL ,
`JOB_EXECUTING_ID` bigint(19) NULL ,
`PREV_STEP_EXECUTING_ID` bigint(19) NULL ,
`STEP_ID` bigint(19) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_TASK
-- ----------------------------
DROP TABLE IF EXISTS `NBO_TASK`;
CREATE TABLE `NBO_TASK` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`TASK_NAME` VARCHAR(255) NULL ,
`TASK_PARAMS` VARCHAR(500) NULL ,
`TASK_TYPE` VARCHAR(255) NULL ,
`APP_ID` bigint(19) NULL ,
`JOB_ID` bigint(19) NULL ,
`PROJECT_ID` bigint(19) NULL ,
`STEP_ID` bigint(19) NULL ,
`TASK_TEMPLATE_ID` bigint(19) NULL COMMENT '任务模板ID',
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_TASK_EXEC
-- ----------------------------
DROP TABLE IF EXISTS `NBO_TASK_EXEC`;
CREATE TABLE `NBO_TASK_EXEC` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`COST_TIME` bigint(19) NULL ,
`ERROR_MSG` VARCHAR(255) NULL ,
`EXECUTING_STATUS` VARCHAR(255) NULL ,
`EXECUTING_TYPE` VARCHAR(255) NULL ,
`TASK_NAME` VARCHAR(255) NULL ,
`TASK_PARAMS` VARCHAR(500) NULL ,
`TASK_TYPE` VARCHAR(255) NULL ,
`APP_ID` bigint(19) NULL ,
`JOB_ID` bigint(19) NULL ,
`JOB_EXECUTING_ID` bigint(19) NULL ,
`PROJECT_ID` bigint(19) NULL ,
`STEP_ID` bigint(19) NULL ,
`STEP_EXECUTING_ID` bigint(19) NULL ,
`TASK_ID` bigint(19) NULL ,
`ERROR_STATUS` VARCHAR(255) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_TASK_TEMP
-- ----------------------------
DROP TABLE IF EXISTS `NBO_TASK_TEMP`;
CREATE TABLE `NBO_TASK_TEMP` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`CODE_TYPE` VARCHAR(255) NULL ,
`DESC_` VARCHAR(255) NULL ,
`IMAGE_URL` VARCHAR(255) NULL ,
`NAME` VARCHAR(255) NULL ,
`TYPE` VARCHAR(255) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_TASK_TEMP
-- ----------------------------
INSERT INTO `NBO_TASK_TEMP` VALUES ('100018', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, date_format(now(), '%Y-%m-%d %T'), 'nodejs', '使用zip将应用构建成镜像', '{"environmentImg":"../resources/image/task/static_md.png","toolImg":"../resources/image/task/ziptool_md.png","resultsImg":"../resources/image/task/docker_md.png"}', 'zip构建', 'build');
INSERT INTO `NBO_TASK_TEMP` VALUES ('100019', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, date_format(now(), '%Y-%m-%d %T'), 'nodejs', '使用sonar检查代码', '{"environmentImg":"../resources/image/task/static_md.png","toolImg":"../resources/image/task/sonar_md.png","resultsImg":"../resources/image/task/baogao_md.png"}', 'NodeJS代码检查', 'codeCheck');
INSERT INTO `NBO_TASK_TEMP` VALUES ('100017', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, date_format(now(), '%Y-%m-%d %T'), 'nodejs', '使用zip将应用打包', '{"environmentImg":"../resources/image/task/static_md.png","toolImg":"../resources/image/task/ziptool_md.png","resultsImg":"../resources/image/task/zip_md.png"}', 'zip构建', 'build');
INSERT INTO `NBO_TASK_TEMP` VALUES ('100001', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'java', '使用sonar检查代码', '{"environmentImg":"../resources/image/task/java_md.png","toolImg":"../resources/image/task/sonar_md.png","resultsImg":"../resources/image/task/baogao_md.png"}', 'JAVA代码检查', 'codeCheck');
INSERT INTO `NBO_TASK_TEMP` VALUES ('100002', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'android', '使用sonar检查代码', '{"environmentImg":"../resources/image/task/android_md.png","toolImg":"../resources/image/task/sonar_md.png","resultsImg":"../resources/image/task/baogao_md.png"}', 'Android代码检查', 'codeCheck');
INSERT INTO `NBO_TASK_TEMP` VALUES ('100003', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'ios', '使用sonar检查代码', '{"environmentImg":"../resources/image/task/ios_md.png","toolImg":"../resources/image/task/sonar_md.png","resultsImg":"../resources/image/task/baogao_md.png"}', 'iOS代码检查', 'codeCheck');
INSERT INTO `NBO_TASK_TEMP` VALUES ('100004', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'java', 'maven进行单元测试', '{"environmentImg":"../resources/image/task/java_md.png","toolImg":"../resources/image/task/maven_md.png","resultsImg":"../resources/image/task/baogao_md.png"}', '单元测试', 'unitTest');
INSERT INTO `NBO_TASK_TEMP` VALUES ('100007', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'java', '使用maven将应用打包', '{"environmentImg":"../resources/image/task/java_md.png","toolImg":"../resources/image/task/maven_md.png","resultsImg":"../resources/image/task/warjar_md.png"}', 'maven构建', 'build');
INSERT INTO `NBO_TASK_TEMP` VALUES ('100008', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'ios', '使用xcode将iOS应用构建成api', '{"environmentImg":"../resources/image/task/ios_md.png","toolImg":"../resources/image/task/xcode_md.png","resultsImg":"../resources/image/task/ipa_md.png"}', 'iOS代码构建', 'build');
INSERT INTO `NBO_TASK_TEMP` VALUES ('100009', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'android', '使用xcode将android应用构建成apk', '{"environmentImg":"../resources/image/task/android_md.png","toolImg":"../resources/image/task/gradle_md.png","resultsImg":"../resources/image/task/apk_md.png"}', 'Android代码构建', 'build');
INSERT INTO `NBO_TASK_TEMP` VALUES ('100010', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'java', '使用ant将相应的应用构建成镜像', '{"environmentImg":"../resources/image/task/java_md.png","toolImg":"../resources/image/task/ant_md.png","resultsImg":"../resources/image/task/docker_md.png"}', 'Ant构建', 'build');
INSERT INTO `NBO_TASK_TEMP` VALUES ('100011', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'java', '使用ant将应用打包', '{"environmentImg":"../resources/image/task/java_md.png","toolImg":"../resources/image/task/ant_md.png","resultsImg":"../resources/image/task/warjar_md.png"}', 'Ant构建', 'build');
INSERT INTO `NBO_TASK_TEMP` VALUES ('100012', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'java', '使用maven将应用部署', '{"environmentImg":"../resources/image/task/java_md.png","toolImg":"../resources/image/task/maven_md.png","resultsImg":"../resources/image/task/warjar_md.png"}', 'maven部署', 'build');
INSERT INTO `NBO_TASK_TEMP` VALUES ('100013', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'reactNative', '使用ReacNative将应用构建成apk或api', '{"environmentImg":"../resources/image/task/reactNative_md.png","toolImg":"../resources/image/task/maven_md.png","resultsImg":"../resources/image/task/apkipa_md.png"}', 'React Native代码构建', 'build');
INSERT INTO `NBO_TASK_TEMP` VALUES ('100014', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'android', '使用ant将android应用构建', '{"environmentImg":"../resources/image/task/android_md.png","toolImg":"../resources/image/task/ant_md.png","resultsImg":"../resources/image/task/apk_md.png"}', 'Android的ant构建', 'build');
INSERT INTO `NBO_TASK_TEMP` VALUES ('100015', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'php', '将php项目打成tar包', '{"environmentImg":"../resources/image/task/android_md.png","toolImg":"../resources/image/task/ant_md.png","resultsImg":"../resources/image/task/apk_md.png"}', 'php构建', 'build');
INSERT INTO `NBO_TASK_TEMP` VALUES ('100006', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'java', '使用maven将应用构建成镜像', '{"environmentImg":"../resources/image/task/java_md.png","toolImg":"../resources/image/task/maven_md.png","resultsImg":"../resources/image/task/warjar_md.png"}', 'maven构建', 'build');

-- ----------------------------
-- Table structure for NBO_UNITTEST_TASK
-- ----------------------------
DROP TABLE IF EXISTS `NBO_UNITTEST_TASK`;
CREATE TABLE `NBO_UNITTEST_TASK` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`MODULE_NAME` VARCHAR(255) NULL ,
`NAME_SPACE` VARCHAR(255) NULL ,
`REPS_BRANCH` VARCHAR(255) NULL ,
`SUPPORT_CODE_TYPE` VARCHAR(255) NULL ,
`TAG_NAME` VARCHAR(255) NULL ,
`TASK_NAME` VARCHAR(255) NULL ,
`TEST_COMMAND` VARCHAR(255) NULL ,
`TEST_ENV` VARCHAR(255) NULL ,
`TEST_ENV_VERSION` VARCHAR(255) NULL ,
`TEST_TOOLS` VARCHAR(255) NULL ,
`TEST_TOOLS_VERSION` VARCHAR(255) NULL ,
`APP_ID` bigint(19) NULL ,
`TASK_ID` bigint(19) NULL ,
`COMMAND_PARAMS` VARCHAR(255) NULL COMMENT '命令参数',
`APP_REPS_ID` bigint(19) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_UNITTEST_TASK_EXEC
-- ----------------------------
DROP TABLE IF EXISTS `NBO_UNITTEST_TASK_EXEC`;
CREATE TABLE `NBO_UNITTEST_TASK_EXEC` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`APP_NAME` VARCHAR(255) NULL ,
`COST_TIME` bigint(19) NULL ,
`ERROR_MSG` VARCHAR(255) NULL ,
`EXECUTING_STATUS` VARCHAR(255) NULL ,
`EXECUTING_TYPE` VARCHAR(255) NULL ,
`PROJECT_NAME` VARCHAR(255) NULL ,
`TASK_EXECUTING_PARAMS` VARCHAR(255) NULL ,
`NAME_SPACE` VARCHAR(255) NULL ,
`POD_NAME` VARCHAR(255) NULL ,
`PROCESS_STATUS` VARCHAR(255) NULL ,
`REPS_BRANCH` VARCHAR(255) NULL ,
`RESULT_FILE_URL` VARCHAR(255) NULL ,
`TEST_RESULT` VARCHAR(255) NULL ,
`APP_ID` bigint(19) NULL ,
`JOB_EXECUTING_ID` bigint(19) NULL ,
`TASK_EXECUTING_ID` bigint(19) NULL ,
`UNIT_TEST_TASK_ID` bigint(19) NULL ,
`ERROR_STATUS` VARCHAR(255) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for NBO_UNITTEST_TASK_TEMP
-- ----------------------------
DROP TABLE IF EXISTS `NBO_UNITTEST_TASK_TEMP`;
CREATE TABLE `NBO_UNITTEST_TASK_TEMP` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(255) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(255) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`SUPPORT_CODE_TYPE` VARCHAR(255) NULL ,
`TEST_COMMAND` VARCHAR(255) NULL ,
`TEST_ENV` VARCHAR(255) NULL ,
`TEST_ENV_VERSION` VARCHAR(255) NULL ,
`TEST_TOOLS` VARCHAR(255) NULL ,
`TEST_TOOLS_VERSION` VARCHAR(255) NULL ,
`TASK_TEMPLATE_ID` bigint(19) NULL ,
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_UNITTEST_TASK_TEMP
-- ----------------------------
INSERT INTO `NBO_UNITTEST_TASK_TEMP` VALUES ('1', null, null, date_format(now(), '%Y-%m-%d %T'), null, null, null, 'java', 'mvn test -Dmaven.test.failure.ignore=true', 'java', 'jdk1.8', 'maven', 'maven3', '100004');

-- ----------------------------
-- Table structure for NBO_USER
-- ----------------------------
DROP TABLE IF EXISTS `NBO_USER`;
CREATE TABLE `NBO_USER` (
`ID` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`INSERT_OPERATOR` VARCHAR(50) NULL ,
`INSERT_OPERATOR_ID` bigint(19) NULL ,
`INSERT_TIME` datetime NULL ,
`MODIFY_OPERATOR` VARCHAR(50) NULL ,
`MODIFY_OPERATOR_ID` bigint(19) NULL ,
`MODIFY_TIME` datetime NULL ,
`CN_NAME` VARCHAR(50) NULL ,
`EMAIL` VARCHAR(50) NULL ,
`EXPIRY_DATE` datetime NULL ,
`GIT_PWD` VARCHAR(50) NULL ,
`GIT_USER_ID` bigint(19) NULL ,
`GIT_USER_NAME` VARCHAR(50) NULL ,
`PASSWORD` VARCHAR(50) NULL ,
`STATUS` bigint(19) NULL ,
`USER_NAME` VARCHAR(50) NULL ,
`DEPARTMENT` VARCHAR(50) NULL ,
`ADD_PROJECT_FLAG` bigint(1) NULL COMMENT '能否创建项目',
PRIMARY KEY (`ID`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of NBO_USER
-- ----------------------------
INSERT INTO `NBO_USER` VALUES ('80', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), 'okok1', 'ookk@123.com', null, null, null, 'ookk', '8af51b6c8f1e872163dd369995d0a7b1', '0', 'ookk', '应用开发7部', '1');
INSERT INTO `NBO_USER` VALUES ('130', null, null, null, null, null, date_format(now(), '%Y-%m-%d %T'), '木木', 'jingyi.liu@newtouch.cn', null, null, null, 'liujingyi', '7dbe3fa774adabde792e86f5efa54e54', '0', 'liujingyi', '应用开发9部', '1');

-- ----------------------------
-- Indexes structure for table NBO_ADMIN_FLOW_NODE
-- ----------------------------
CREATE INDEX `NBO_ADMIN_FLOW_NODE_FLOW_ID`
ON `NBO_ADMIN_FLOW_NODE` (`FK_FLOW_ID` ASC);

-- ----------------------------
-- Indexes structure for table NBO_ADMIN_PROJECT_MENU
-- ----------------------------
CREATE INDEX `NBO_ADMIN_PROJECT_MENU_SORTING`
ON `NBO_ADMIN_PROJECT_MENU` (`SORTING` ASC);


-- ----------------------------
-- Indexes structure for table NBO_APP_MENU
-- ----------------------------
CREATE INDEX `NBO_APP_MENU_INDEX_SORTING`
ON `NBO_APP_MENU` (`SORTING` ASC);

-- ----------------------------
-- Indexes structure for table NBO_APP_TEST
-- ----------------------------
CREATE INDEX `INDEX_APP_ID`
ON `NBO_APP_TEST` (`APP_ID` ASC);
CREATE INDEX `INDEX_FK_ADMIN_FLOW_ID`
ON `NBO_APP_TEST` (`FK_ADMIN_FLOW_ID` ASC);
CREATE INDEX `INDEX_NODE_FLOW`
ON `NBO_APP_TEST` (`NODE_FLOW` ASC);

-- ----------------------------
-- Indexes structure for table NBO_PROJECT_ROLE
-- ----------------------------
CREATE INDEX `IDX_PROJECT_ROLE_PROJECTID`
ON `NBO_PROJECT_ROLE` (`PROJECT_ID` ASC);

-- ----------------------------
-- Indexes structure for table NBO_PROJECT_ROLE_ENV
-- ----------------------------
CREATE INDEX `NBO_PROJECT_ROLE_ENV_PROID`
ON `NBO_PROJECT_ROLE_ENV` (`FK_PROJECT_ID` ASC);

-- ----------------------------
-- Indexes structure for table NBO_PROJECT_USER_ROLE
-- ----------------------------
CREATE INDEX `NBO_PROJECT_USER_ROLE_PRO_ID`
ON `NBO_PROJECT_USER_ROLE` (`FK_PROJECT_ID` ASC);

