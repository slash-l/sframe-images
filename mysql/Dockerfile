# mysql Dockerfile
FROM mysql:5.7

LABEL maintainer="slash_mumu@163.com"

#设置免密登录
ENV NLS_LANG AMERICAN_AMERICA.UTF8 
ENV LANG en_US.UTF-8
ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

#将所需文件放到容器中
COPY init/config-file.cnf /etc/mysql/conf.d/config-file.cnf
COPY init/setup.sh /mysql/setup.sh
COPY init/schema.sql /mysql/schema.sql
COPY init/2017.10.13.sql /mysql/2017.10.13.sql
COPY init/privileges.sql /mysql/privileges.sql

#设置容器启动时执行的命令
CMD ["sh", "/mysql/setup.sh"]
