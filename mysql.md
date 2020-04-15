##复制安装
从9.87服务器复制的mysql5.5程序， 包含目录 及 配置文件
1.ROOT初始化数据
cd /usr/local/mysql-5.5.41_3307
/usr/local/mysql-5.5.41_3307/scripts/mysql_install_db --datadir=/data/mysql_3307 --defaults-file=/etc/my_3307.cnf

2.改成mysql属主
chwon -R mysql:mysql /data/mysql_3307
3.启动mysql
nohub /bin/sh /usr/local/mysql-5.5.41_3307/bin/mysqld_safe --defaults-file=/etc/my_3307.cnf --basedir=/usr/local/mysql-5.5.41_3307 --datadir=/data/mysql_3307 --pid-file=/data/mysql_3307/mysqld_3307.pid --user=mysql &
4.连接mysql
/usr/local/mysql-5.5.41_3307/bin/mysql -S /data/mysql_3307/mysql.sock -P3307 -uroot
5.导mysql账号
执行 grantUserMysql5.6.sh 生成SQL,需修改变量 root密码及sock文件路径
source grants.sql 即可

##安装
'./configure'  '--prefix=/usr/local/php' '--with-apxs2=/usr/local/apache/bin/apxs' '--with-config-file-path=/etc' '--with-config-file-scan-dir=/etc/php.d' '--with-openssl' '--with-zlib' '--with-curl' '--enable-ftp' '--with-gd' '--with-jpeg-dir' '--with-png-dir' '--with-freetype-dir' '--enable-gd-native-ttf' '--enable-mbstring' '--with-mcrypt' '--enable-zip' '--with-iconv=/usr/local/libiconv' '--with-mysql=/usr/local/mysql' '--without-pear'

./configure --prefix=/usr/local/php-5.3.28 --enable-fpm --enable-mbstring --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd

##创建用户
CREATE USER 'admin'@'%' IDENTIFIED BY 'QazhmHKVIDL+GFRI';
GRANT  ALTER, ALTER ROUTINE, CREATE, CREATE ROUTINE, CREATE TABLESPACE, CREATE TEMPORARY TABLES, CREATE USER, CREATE VIEW, DELETE, DROP, EVENT, EXECUTE, FILE, INDEX, INSERT, LOCK TABLES, PROCESS, RELOAD, SHOW DATABASES, SHOW VIEW, SHUTDOWN, TRIGGER, UPDATE ON  *.* TO 'admin'@'%'; 
##更新账号密码
update user set password=password("####") where user="root";
ALTER USER USER() IDENTIFIED BY 'bigdata#$201911';

##授权
GRANT DELETE, INSERT, UPDATE, SELECT ON  *.* TO 'public_write'@'%';
GRANT EXECUTE, INDEX, INSERT, SELECT, UPDATE, ALTER, DELETE ON `data_base_chatbot`.* TO 'weiqing'@'%'; 
flush privileges;
##取消授权
REVOKE DELETE, INSERT, UPDATE ON  *.* FROM 'pangx'@'%'


GRANT SELECT ON `ods_report_dm`.* TO 'ods_dev'@'%'; 

-S /tmp/mysql-ib.sock -P5029 -uroot

##5.7 初始化数据

/usr/local/mysql/bin/mysqld --defaults-file=/etc/my.cnf --initialize --user=mysql
1、在配置文件my.cnf的mysqld端下加skip-grant-tables跳过密码认证

[mysqld]
skip-grant-tables
update user set password=password("pwd") where user="root";
flush privileges;

GRANT  ALTER, ALTER ROUTINE, CREATE, CREATE ROUTINE, CREATE TABLESPACE, CREATE TEMPORARY TABLES, CREATE USER, CREATE VIEW, DELETE, DROP, EVENT, EXECUTE, FILE, INDEX, INSERT, LOCK TABLES, PROCESS, RELOAD, SHOW DATABASES, SHOW VIEW, SHUTDOWN, TRIGGER, UPDATE ON  *.* TO 'admin'@'%' 

#Mysql 5.7安装 
https://www.percona.com/downloads/Percona-Server-5.7/LATEST/binary/tarball/

/usr/local/mysql/bin/mysqld --initialize-insecure --user=mysql --basedir=/usr/local/mysql --datadir=/data/mysql_data 

##修复mysql表
#myisamchk 表
myisamchk -r <table_name>
#分区表
ALTER TABLE <table_name> REPAIR PARTITION <pname>;
eg. 
myisamchk -r  /data/mysql_3306/report_dm/dm_web_flow_d
ALTER TABLE dm_user_order_value_d REPAIR PARTITION  p201801,p201902;

myisamchk -r  /data/mysql_3306/report_ods/ods_data_order_info_2007
#检查所有表
mysqlcheck -c --all-databases -uroot -p
#导出数据 
mysqldump -uroot -p --host=localhost --all-databases --tables a1 a2 --opt
#导出表结构

mysqldump -uroot -p --databases ods_admin > /home/mysql/ods_admin-Db.sql

mysqldump -h 192.168.10.69 -uws_cbs_read -p --databases cbs_local_ticket --tables ticket_posts_reply --skip-lock-tables > /home/mysql/ticket_posts_reply.sql

192.168.10.69	mysql	国内对内	生产环境	ws_cbs_read	cbsread*&


/usr/local/mysql/bin/mysqldump -uroot -p --databases report_dm --tables dm_data_dlin_country dm_product_refund_d dm_data_cart_origin_detail > /home/mysql/report_dm-report.sql


mysqldump -h localhost -u root -p mydb >e:\mysql\mydb.sql

mysqldump -h127.0.0.1 -uods_rp_dev -P3306 -p --no-data --skip-opt --databases data_base_cart data_base_dl --tables cbs_cart_order product_upgrade_usage_15 > createtab.sql

data_base_cart.cbs_cart_order
data_base_dl.product_upgrade_usage_15

#全局读锁
Flush tables with read lock;
unlock tables;

##清除剩下3天的binlog日志
PURGE MASTER LOGS BEFORE DATE_SUB( NOW( ), INTERVAL 3 DAY);
PURGE MASTER LOGS BEFORE DATE_SUB( NOW( ), INTERVAL 5 DAY);
PURGE MASTER LOGS BEFORE DATE_SUB( NOW( ), INTERVAL 10 DAY);

#参考
Operating System Error Codes
http://doc.docs.sk/mysql-refman-5.5/operating-system-error-codes.html
强制MySQL InnoDB恢复参数 innodb_force_recovery
https://www.askmaclean.com/archives/mysql-innodb-innodb_force_recovery.html


#同步数据
mysql-ib -uods_rp_dev -p -h192.168.12.44 -P3306 --database report_dm --default-character-set=utf8 --skip-column-names -B  -e "SELECT * FROM  report_dm.dm_web_flow_m;" > /data/ODS_tmp/backup/dm_web_flow_m.dat