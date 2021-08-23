./redis-cli -h 127.0.0.1 -p 6379 --scan --pattern 'a_*' | xargs ./redis-cli -h 127.0.0.1 -p 6379 del
###key批量删除 
/usr/local/redis/bin/redis-cli -h dc.master.prod.redis -p 9376 -a 'Wshare(2015)#' -n 12  --scan --pattern 'pid_config_*'| xargs /usr/local/redis/bin/redis-cli -h dc.master.prod.redis -p 9376 -a 'Wshare(2015)#' -n 12 del

/usr/local/redis/bin/redis-cli -h dc.master.prod.redis -p 9376 -a 'Wshare(2015)#' -n 12 get sparrow_common_config

"{\"version\":3,\"conf\":{\"conf_upd_gap\":2,\"collect_way\":\"noReal\",\"collect_on\":\"on\",\"send_endpoints\":\"on\",\"send_gap\":30,\"send_num\":10,\"send_size\":200,\"max_resv_day\":30,\"max_file_size\":2000,\"max_log_size\":60,\"send_log_on\":\"on\",\"send_cur_conf\":\"off\",\"zip_data\":\"on\",\"con_timeout\":5000,\"data_range\":\"\",\"send_beginpoints\":\"on\",\"conf_url\":\"sparrow.wondershare.com\",\"enable_https\":\"on\"}}"

/usr/local/redis/bin/redis-cli -h dc.master.prod.redis -p 9376 -a 'Wshare(2015)#' -n 12 get pid_config_1086
/usr/local/redis/bin/redis-cli -h dc.master.prod.redis -p 9376 -a 'Wshare(2015)#' -n 12 set pid_config_4134 "{\"version\":3,\"conf\":{\"conf_upd_gap\":2,\"collect_way\":\"noReal\",\"collect_on\":\"on\",\"send_endpoints\":\"on\",\"send_gap\":1,\"send_num\":20,\"send_size\":2048,\"max_resv_day\":30,\"max_file_size\":2000,\"max_log_size\":60,\"send_log_on\":\"on\",\"send_cur_conf\":\"off\",\"zip_data\":\"on\",\"con_timeout\":5000,\"data_range\":\"\",\"send_beginpoints\":\"on\",\"conf_url\":\"sparrow.wondershare.com\",\"enable_https\":\"on\"}}" 



PID：1937 版本号：5.6.0 和 pid: 8325   版本号：5.0.0-hw 上报配

pid_pver_config_1937_5.6.0
pid_pver_config_8325_5.0.0-hw

/usr/local/redis/bin/redis-cli -h dc.master.prod.redis -p 9376 -a 'Wshare(2015)#' -n 12  --scan --pattern 'pid_pver_config_1937*'