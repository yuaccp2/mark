一.kliny Segments overlap 报错，不能rebulid,refresh,merge.
1.升级到V2.3.0 https://issues.apache.org/jira/browse/KYLIN-2849
Cannot delete segment '20180320120000_20180320130000' as its status is not READY. Discard the on-going job for it.
Cannot delete segment '20180320120000_20180320130000' as it is neither the first nor the last segment.
2.修改元数据，先备份，后清除，再恢复
$KYLIN_HOME/bin/metastore.sh backup 
去掉有问题的节点，节点字段size_kb为0的。文件地址meta_backups/meta_xxxx_xx_xx_xx_xx_xx/cube/cubeName.json
$KYLIN_HOME/bin/metastore.sh reset
$KYLIN_HOME/bin/metastore.sh restore $KYLIN_HOME/meta_backups/meta_xxxx_xx_xx_xx_xx_xx
http://blog.csdn.net/zhangzhaokun/article/details/78419846
二.JVM的几个参数：
-Xms2058mJVM初始分配的堆内存
-Xmx1024mJVM最大允许分配的堆内存，按需分配
-XX:PermSize=128MJVM初始分配的非堆内存
-XX:MaxPermSize=256MJVM最大允许分配的非堆内存，按需分配