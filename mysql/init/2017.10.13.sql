-- 增量脚本
-- 2017.10.13
use nbo_dev;

ALTER TABLE NBO_K8S_RUNTIME_ENV ADD ENV_TYPE VARCHAR(30);
ALTER TABLE NBO_K8S_RUNTIME_ENV ADD DCOS_TOKEN VARCHAR(30);

CREATE TABLE DCOS_NBO_PROJECT
(
    ID BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    RUNTIME_ENV_ID BIGINT(20) COMMENT 'DCOS运行环境ID',
    NBO_PROJECT_ID BIGINT(20) COMMENT 'NBO项目ID',
    DCOS_PROJECT_ID VARCHAR(32) COMMENT 'DCOS项目ID',
    INSERT_TIME DATETIME,
    INSERT_OPERATOR VARCHAR(50),
    INSERT_OPERATOR_ID BIGINT(20),
    MODIFY_TIME DATETIME,
    MODIFY_OPERATOR VARCHAR(50),
    MODIFY_OPERATOR_ID BIGINT(20)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DCOS与项目关联表';


CREATE TABLE DCOS_NBO_ENV
(
    ID BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    PROJECT_ID BIGINT(20) COMMENT '项目ID',
    PROJECT_ENV_ID BIGINT(20) COMMENT 'NBO项目ID',
    DCOS_CLUSTER_ID VARCHAR(32) COMMENT 'DCOS集群ID',
    DCOS_NBO_PROJECT_ID BIGINT(20) COMMENT 'DCOS与项目关联表ID',
    INSERT_TIME DATETIME,
    INSERT_OPERATOR VARCHAR(50),
    INSERT_OPERATOR_ID BIGINT(20),
    MODIFY_TIME DATETIME,
    MODIFY_OPERATOR VARCHAR(50),
    MODIFY_OPERATOR_ID BIGINT(20)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DCOS项目环境表';



CREATE TABLE DCOS_NBO_HOST
(
    ID BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    HOST_IP VARCHAR(50)  COMMENT '主机IP',
    HOST_NAME VARCHAR(50)  COMMENT '主机名称',
    HOST_USER_NAME VARCHAR(50) COMMENT 'ssh用户名',
    HOST_PASSWORD VARCHAR(50) COMMENT 'ssh密码',
    HOST_PORT INT(5) COMMENT 'ssh端口',
    HOST_ROOT_PASSWORD VARCHAR(50) COMMENT 'root密码',
    DCOS_HOST_ID VARCHAR(32) COMMENT 'DCOS主机ID',
    DCOS_NBO_PROJECT_ID BIGINT(20) COMMENT 'DCOS与项目关联表ID',
    PROJECT_ID BIGINT(20) COMMENT '项目ID',
    INSERT_TIME DATETIME,
    INSERT_OPERATOR VARCHAR(50),
    INSERT_OPERATOR_ID BIGINT(20),
    MODIFY_TIME DATETIME,
    MODIFY_OPERATOR VARCHAR(50),
    MODIFY_OPERATOR_ID BIGINT(20)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DCOS项目主机表';


 CREATE TABLE DCOS_NBO_ENV_HOST
(
    ID BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    DCOS_NBO_ENV_ID BIGINT(20) COMMENT 'DCOS环境ID',
    DCOS_NBO_HOST_ID BIGINT(20) COMMENT 'DCOS主机ID',
    INSERT_TIME DATETIME,
    INSERT_OPERATOR VARCHAR(50),
    INSERT_OPERATOR_ID BIGINT(20),
    MODIFY_TIME DATETIME,
    MODIFY_OPERATOR VARCHAR(50),
    MODIFY_OPERATOR_ID BIGINT(20)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DCOS环境与主机关联表';

 CREATE TABLE DCOS_IMAGE
(
    ID BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    IMAGE_NAME VARCHAR(100) COMMENT '镜像名称',
    RUNTIME_ENV_ID BIGINT(20) COMMENT '运行环境ID',
    INSERT_TIME DATETIME,
    INSERT_OPERATOR VARCHAR(50),
    INSERT_OPERATOR_ID BIGINT(20),
    MODIFY_TIME DATETIME,
    MODIFY_OPERATOR VARCHAR(50),
    MODIFY_OPERATOR_ID BIGINT(20)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DCOS镜像表';

ALTER TABLE NBO_DEPLOY_VERSION ADD DCOS_APP_ID VARCHAR(32) COMMENT 'DCOS应用ID';
ALTER TABLE NBO_DEPLOY_VERSION ADD DCOS_IMAGE_NAME VARCHAR(100) COMMENT 'DCOS镜像名称';

ALTER TABLE NBO_DEPLOY_VERSION ADD DCOS_PORT VARCHAR(200) COMMENT 'DCOS端口号';

UPDATE  NBO_K8S_RUNTIME_ENV a SET a.ENV_TYPE='K8S' WHERE a.KEY_DATA IS NOT NULL;
UPDATE  NBO_K8S_RUNTIME_ENV a SET a.ENV_TYPE='DCOS' WHERE a.KEY_DATA IS NULL;

update NBO_BUILD_TASK_TEMP b set b.build_command = 'mvn clean install -Dmaven.test.skip=true' where b.support_code_type='java' and  b.action_type='package' and b.build_tools='maven';


-- 2017.10.13 end
