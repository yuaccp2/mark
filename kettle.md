##集群服务器创建
创建动态的集群服务
cd /opt/pentaho/data-integration7.0
nohup sh carte.sh pwd/carte-config-master-88.xml >>/opt/pentaho/log/carte_master.log &
nohup sh carte.sh pwd/carte-config-8081.xml >>/opt/pentaho/log/carte_slave1.log &
nohup sh carte.sh pwd/carte-config-8082.xml >>/opt/pentaho/log/carte_slave2.log &

##pentaho界面使用
1.创建 子服务器
2.创建 Kettle集群schemas
  勾选 Dynameic cluster,会根据XML寻找子服务器
  数据是否压压缩，网络较好时不勾选，会加重服务器资源消耗
3.创建 run配置 
  settings 设置为 remote
4.步骤右键 =》集群


##接口调用执行JOB
curl -u "cluster:cluster" "http://10.10.18.166:88/kettle/executeJob/?job=/kettle/report_dm/product_ticket/ods_dm_product_ticket_d.kjb&level=debug"
curl -u "cluster:cluster" "http://10.10.19.61:8082/kettle/executeJob/?job=/opt/pentaho/data-integration7.0/kettle/report_dm/product_ticket/ods_dm_product_ticket_d.kjb&level=debug"

##问题
1.环境变量没找到
设置全局变量， vim /etc/profile
export KETTLE_HOME=/opt/pentaho/data-integration7.0
重启carte服务

report_dm/product_ticket/ods_dm_product_ticket_d.kjb
report_dm/order/order_refund_chargeback.kjb

curl -u "cluster:cluster" "http://10.10.19.61:8082/kettle/executeJob/?job=/opt/pentaho/data-integration7.0/kettle/report_dm/product_ticket/ods_dm_product_ticket_d.kjb&level=Detailed"
curl -u "cluster:cluster" "http://10.10.19.61:8082/kettle/executeJob/?job=/opt/pentaho/data-integration7.0/kettle/report_dm/order/order_refund_chargeback.kjb&level=Detailed"

data_ods_dl/job_data_dl_order.kjb
data_ods_goal/job_data_goal.kjb

curl -u "cluster:cluster" "http://10.10.18.166:88/kettle/executeJob/?job=kettle/report_dm/order/order_refund_chargeback.kjb&level=Detailed"

order/order_refund_chargeback.kjb