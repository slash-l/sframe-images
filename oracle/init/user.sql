-- 创建用户 
CREATE USER ONE IDENTIFIED BY Accp1234 
DEFAULT TABLESPACE ONE_DA ;
--授权用户 
GRANT CREATE USER,DROP USER,ALTER USER ,CREATE ANY VIEW , 
DROP ANY VIEW,EXP_FULL_DATABASE,IMP_FULL_DATABASE, 
DBA,CONNECT,RESOURCE,CREATE SESSION TO ONE;