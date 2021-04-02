./redis-cli -h 127.0.0.1 -p 6379 --scan --pattern 'a_*' | xargs ./redis-cli -h 127.0.0.1 -p 6379 del
###key批量删除 
/usr/local/redis/bin/redis-cli -h dc.master.prod.redis -p 9376 -a 'Wshare(2015)#' -n 12  --scan --pattern 'pid_config_*'| xargs /usr/local/redis/bin/redis-cli -h dc.master.prod.redis -p 9376 -a 'Wshare(2015)#' -n 12 del


/usr/local/redis/bin/redis-cli -h dc.master.prod.redis -p 9376 -a 'Wshare(2015)#' -n 12 get pid_config_1086