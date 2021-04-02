wget https://github.com/rungao/infobright/raw/master/infobright-4.0.7-0-x86_64-ice.rpm

PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
To do so, start the server, then issue the following commands:

/usr/local/infobright-4.0.7-x86_64/bin/mysqladmin -u root password 'new-password'
/usr/local/infobright-4.0.7-x86_64/bin/mysqladmin -u root -h ws-bg-ods-meta-db2 password 'new-password'

Alternatively you can run:
/usr/local/infobright-4.0.7-x86_64/bin/mysql_secure_installation

which will also give you the option of removing the test
databases and anonymous user created by default.  This is
strongly recommended for production servers.

See the manual for more instructions.

You can start the MySQL daemon with:
cd /usr/local/infobright-4.0.7-x86_64 ; /usr/local/infobright-4.0.7-x86_64/bin/mysqld_safe &

You can test the MySQL daemon with mysql-test-run.pl
cd /usr/local/infobright-4.0.7-x86_64/mysql-test ; perl mysql-test-run.pl

Please report any problems with the /usr/local/infobright-4.0.7-x86_64/scripts/mysqlbug script!

The latest information about MySQL is available at http://www.mysql.com/
Support MySQL by buying support/licenses from http://shop.mysql.com/

System Physical memory: 31993(MB)
Infobright optimal ServerMainHeapSize is set to 10000(MB)
Infobright optimal LoaderMainHeapSize is set to 800(MB)
Infobright server installed into folder /usr/local/infobright
Installation log file /tmp/ib4.0.7-0-install.log
--------------------------------------
To activate infobright server, please run ./postconfig.sh script from /usr/local/infobright-4.0.7-x86_64.
Example command: cd /usr/local/infobright-4.0.7-x86_64; ./postconfig.sh
  Verifying  : infobright-4.0.7-0.x86_64                                                                                                                                                                                                                                  1/1 

Installed:
  infobright.x86_64 0:4.0.7-0                                                                                                                                                                                                                                                 

Complete!



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
