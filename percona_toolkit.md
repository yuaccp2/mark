1.下载
wget https://www.percona.com/downloads/percona-toolkit/3.2.0/binary/redhat/6/x86_64/percona-toolkit-3.2.0-1.el6.x86_64.rpm
2.安装
##检查依赖包
rpm -qa perl-DBI perl-DBD-MySQL perl-Time-HiRes perl-IO-Socket-SSL
yum install perl-DBI
yum install perl-DBD-MySQL
yum install perl-Time-HiRes
yum install perl-IO-Socket-SSL
安装 
yum install  percona-toolkit-3.2.0-1.el7.x86_64.rpm

--execute  执行 
--dry-run  只创建及更新表结构
--print    输出 


pt-table-sync --charset=utf8 --no-check-slave dsn=u=root,p=root,h=172.172.178.76,P=3306 --print


pt-table-sync --replicate=test.checksums --databases=数据库A h=主节点IP,u=ods_dev,p='^2017$#ab@c^' --print --tables=数据库A中的表B h=从节点IP,u=ods_dev,p='^2017$#ab@c^',P=3306

#指定表
pt-table-sync --charset=utf8 --databases=data_base_cdn --tables=dim_exchange_rate_cdn --no-check-slave u=ods_dev,p='^2017$#ab@c^',h=192.168.9.87,P=3306 u=ods_dev,p='^2017$#ab@c^',h=10.13.0.81,P=3306 --print


pt-table-sync  --dry-run --print h=192.168.9.87,u=ods_rp_dev,p='#125%80*&',P=3306,D=data_base_cdn,t=ods_cdn_cost_m h=10.13.0.81
pt-table-sync --execute --print h=192.168.9.87,u=ods_rp_dev,p='#125%80*&',P=3306,D=data_base_cdn,t=ods_cdn_cost_m h=10.13.0.81

pt-table-checksum  h=192.168.9.87,u=ods_rp_dev,p='#125%80*&',P=3306,D=data_base_cdn,t=cdn_url_cpcode_aliyun h=10.13.0.81

ods_rp_dev	#125%80*&

pt-table-checksum --databases=data_base_cdn --tables=dim_exchange_rate_cdn --no-check-slave u=ods_rp_dev,p='#125%80*&',h=192.168.9.87,P=3306 u=ods_rp_dev,p='#125%80*&',h=10.13.0.81,P=3306
————————————————
版权声明：本文为CSDN博主「渔夫数据库笔记」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/shaochenshuo/java/article/details/56009234


pt-table-sync  --dry-run --print h=192.168.9.87,u=ods_rp_dev,p='#125%80*&',P=3306,D=data_base_aps,t=wx_crawler_site_source h=10.13.0.81
pt-table-sync --execute --print --databases ods_web_ga h=192.168.9.87,u=ods_rp_dev,p='#125%80*&',P=3306 h=10.13.0.81 >/tmp/pt-table-sync_ods_web_ga-200609.log

