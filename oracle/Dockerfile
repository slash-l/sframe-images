# Dockerfile
FROM wnameless/oracle-xe-11g

LABEL maintainer="slash_mumu@163.com"

ENV NLS_LANG AMERICAN_AMERICA.UTF8 
ENV LANG en_US.UTF-8

ADD oracle_init/ /docker-entrypoint-initdb.d/
