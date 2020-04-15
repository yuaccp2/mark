SHOW VARIABLES LIKE "%log_bin%"

# binlog 配置
log-bin = /data/mysql_3306/binlog/mysql-bin.log
#expire-logs-days = 14
#max-binlog-size = 500M
server-id = 1

#NFS 挂载
service nfs start
mkdir /mnt_81_data2
mount 10.13.0.81:/data/mysqlbak /mnt_81_data2

#下载安装 XtraBackup
https://www.percona.com/downloads/XtraBackup/LATEST/
#全量备份
innobackupex --defaults-file=/etc/my.cnf --user=root --password='' /mnt_81_data/

innobackupex --defaults-file=/etc/my.cnf --no-lock --user 'root' --password '' --stream=tar ./ | ssh root@192.1168.2.100 \ "cat - > /home/backup/database/`date +%Y%m%d`/`date +%H-%M`-backup.tar"

#全量恢复

1.innobackupex --defaults-file=/etc/mysql-5.5.41.cnf --apply-log /data/mysqlbak/2019-10-20_13-06-45/
2.
备份恢复
#innobackupex --defaults-file=/etc/mysql-5.5.41.cnf --copy-back /data/mysqlbak/2019-08-31_14-42-53/
移动恢复
innobackupex --defaults-file=/etc/mysql-5.5.41.cnf --move-back /data/mysqlbak/2019-10-20_13-06-45/

#admin	QazhmHKVIDL+GFRI
##数据升级
mysql_upgrade -s -uadmin -p"QazhmHKVIDL+GFRI"
  -s, --upgrade-system-tables 
                      Only upgrade the system tables, do not try to upgrade the
                      data.
10:12 

3.chomw -R mysql:mysql
#重启
/usr/local/mysql-5.5.41_3306/bin/mysqld --defaults-file=/etc/mysql-5.5.41.cnf --basedir=/usr/local/mysql-5.5.41_3306 --datadir=/data/mysql_3306 --plugin-dir=/usr/local/mysql-5.5.41_3306/lib/plugin --user=mysql --log-error=/data/mysql_3306/log_error.log --open-files-limit=10240 --pid-file=/data/mysql_3306/us987.ws.cn.pid --socket=/data/mysql_3306/mysql.sock --port=3306


/usr/local/mysql-5.5.41_3306/bin/mysqld --defaults-file=/etc/mysql-5.5.41.cnf --basedir=/usr/local/mysql-5.5.41_3306 --datadir=/data/mysql_3306 --plugin-dir=/usr/local/mysql-5.5.41_3306/lib/plugin --user=mysql --log-error=/data/mysql_3306/log_error.log --open-files-limit=10240 --pid-file=/data/mysql_3306/us987.ws.cn.pid --socket=/data/mysql_3306/mysql.sock --port=3307


/usr/local/mysql-5.5.41_3306/bin/mysql -S /data/mysql_3306/mysql.sock -uroot -p
####修复表
repair table
check table 

####升级后表不存在
"Error    : Table 'xx.xxx' doesn't exist"
1.把数据文件改名
 mv xxx.frm xxx001.frm
 mv xxx.ibd xxx001.ibd
2.创建表结构
都需要加 ROW_FORMAT=COMPACT ，就算之前 有ROW_FORMAT参数
3.丢弃数据表空间文件
ALTER TABLE xxx DISCARD TABLESPACE;
4.把数据文件名改回来
 mv xxx001.ibd xxx0.ibd
5.恢复数据表空间文件
ALTER TABLE xxx IMPORT  TABLESPACE;

###删除ibd文件引起问题
1.删除相关表
USE mysql;
drop table if exists innodb_index_stats;
drop table if exists innodb_table_stats;
drop table if exists slave_master_info;
drop table if exists slave_relay_log_info;
drop table if exists slave_worker_info;
2.删除ibd文件
mv /data/mysql_data/mysql/innodb_* /data/mysql_data_backup/mysql/
mv /data/mysql_data/mysql/slave_* /data/mysql_data_backup/mysql/
3.创建表结构
mysql -uroot -p
use mysql;
source /usr/local/mysql/share/mysql_system_tables.sql;
desc innodb_index_stats;



###主从
grant replication slave on *.* to 'slave_user'@'10.13.0.81' identified by 'slave@2019';
flush privileges;

#执行同步命令，设置主服务器ip，同步账号密码，同步位置
change master to master_host='192.168.9.87',master_user='slave_user',master_password='slave@2019',master_log_file='mysql-bin.000369',master_log_pos=361977253;

change master to master_host='192.168.9.87',master_user='slave_user',master_password='slave@2019',master_log_file='mysql-bin.000374',master_log_pos=931272775;

change master to master_host='192.168.9.87',master_user='slave_user',master_password='slave@2019',master_log_file='mysql-bin.001775',master_log_pos=523885641;
72484933
79508824
#开启同步功能
mysql>start slave;


 show variables like '%sql_slave_skip_counter%';
 show slave status\G;

 start slave;
 stop slave;
 set global sql_slave_skip_counter=1; 

