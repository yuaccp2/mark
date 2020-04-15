###配置从库
#编辑 vim /etc/my.cnf
server-id = 2 #ID大于1即可
#设置主从同步账号
grant replication slave on *.* to 'slave_user'@'10.13.0.81' identified by 'slave@2019';
flush privileges;
#执行同步命令，设置主服务器ip，同步账号密码，同步位置
change master to master_host='192.168.9.87',master_user='slave_user',master_password='slave@2019',master_log_file='mysql-bin.000369',master_log_pos=361977253;
#启动从命令
start slave;
stop slave;
show slave status\G;
	
#执行同步命令，设置主服务器ip，同步账号密码，同步位置
change master to master_host='192.168.9.87',master_user='slave_user',master_password='slave@2019',master_log_file='mysql-bin.000369',master_log_pos=361977253;

###只读模式
flush tables with read lock;
set global read_only=1;


SHOW PROCESSLIST;
SHOW GLOBAL VARIABLES LIKE '%SLAVE%';

SHOW GLOBAL VARIABLES LIKE '%commit%';
##-----开启多线程复制，查看性能
#slave_parallel_type LOGICAL_CLOCK
#slave_parallel_workers 10
SELECT * FROM performance_schema.setup_consumers;
UPDATE performance_schema.setup_consumers SET ENABLED = 'YES' WHERE NAME LIKE 'events_transactions%';

UPDATE performance_schema.setup_instruments SET ENABLED = 'YES', TIMED = 'YES'WHERE NAME = 'transaction';

#binlog_group_commit_sync_delay = 0
#binlog_group_commit_sync_no_delay_count = 0
SET GLOBAL binlog_group_commit_sync_delay = 1000000;
SET GLOBAL binlog_group_commit_sync_no_delay_count = 20;