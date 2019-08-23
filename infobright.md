安装 
1.配置信息
cd /usr/local/infobright-4.0.7-x86_64
./postconfig.sh
4、初始化数据
cd /usr/local/infobright-4.0.7-x86_64/scripts/
./mysql_install_db --user=root --basedir=/usr/local/infobright-4.0.7-x86_64 --datadir=/data/mysql_5029 --force
chown mysql.mysql -R /usr/local/infobright-4.0.7-x86_64/
5、启动infobright
/etc/init.d/mysqld-ib start

错误处理
*1)./usr/libexec/sudoers.so must be only be writable by owner
chown root:root/usr/lib/sudo/sudoers.so
chmod 644 /usr/lib/sudo/sudoers.so
chmod 755 /usr/lib/sudo/sudoers.so
*2)权限问题
chown -R mysql:mysql /data/mysql_5029
chown -R mysql.mysql/usr/local/infobright-4.0.7-x86_64/

/usr/local/infobright-4.0.7-x86_64/bin/mysqladmin -u root password 'FZDF1Pv3yvOK8l9J'

6.添加用户
GRANT INSERT,CREATE,SELECT,DELETE,UPDATE ON *.* TO 'us_write'@'%' IDENTIFIED BY '123456';
GRANT INSERT,CREATE,SELECT,DELETE,UPDATE,DROP,ALTER ON *.* TO 'idbadmin'@'%' IDENTIFIED BY 'abcd1234';
grant FILE on *.* to 'us_write'@'%';

GRANT ALTER, ALTER ROUTINE, CREATE, CREATE ROUTINE,CREATE TEMPORARY TABLES, CREATE USER, CREATE VIEW, DELETE, DROP, EVENT, EXECUTE, FILE, INDEX, INSERT, LOCK TABLES, PROCESS, REFERENCES, RELOAD, REPLICATION CLIENT, REPLICATION SLAVE, SELECT, SHOW DATABASES, SHOW VIEW, SHUTDOWN, SUPER, TRIGGER, UPDATE ON *.* TO 'us_write'@'%'; 

FLUSH PRIVILEGES;




/usr/local/Calpont/bin/cpimport $database $tablename "/dataext/dataclean/backup/$FILENAME" -s ',' -E '"' -C '\'

mysql-ib -uus_write -p'uS*76&5(9ps&#jdb' --database $database --default-character-set=utf8 \
          -e"  LOAD DATA INFILE  \
         '/dataext/dataclean/backup/${FILENAME}' \
          INTO TABLE ${tablename} FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' "

cd /usr/local/infobright-4.0.7-x86_64
ln -s /usr/local/infobright-4.0.7-x86_64 infobright

ln -s /usr/local/infobright/bin/mysql /usr/bin/mysql-ib
