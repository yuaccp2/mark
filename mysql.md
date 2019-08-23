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
CREATE USER 'public_write'@'%' IDENTIFIED BY 'k49nleMW';
##更新账号密码
update user set password=password("root!@#") where user="root";

##授权
GRANT DELETE, INSERT, UPDATE, SELECT ON  *.* TO 'public_write'@'%';
GRANT EXECUTE, INDEX, INSERT, SELECT, UPDATE, ALTER, DELETE ON `data_base_chatbot`.* TO 'weiqing'@'%'; 
flush privileges;
##取消授权
REVOKE DELETE, INSERT, UPDATE ON  *.* FROM 'pangx'@'%'



-S /tmp/mysql-ib.sock -P5029 -uroot


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
ALTER TABLE dm_user_order_value_d REPAIR PARTITION  p201901,p201902;


#导出数据 
mysqldump -uroot -p --host=localhost --all-databases --tables a1 a2 --opt