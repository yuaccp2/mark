1.vim 提高权限保存文件
:w !sudo tee %
2.vim shell 切换
vim下 ：shell
shell下 exit

#排序统计数据
awk '{print $12}' wos.wondershare.cn_access.log | sort | uniq -c | sort -r
awk '/INSERT INTO/{print $10}' 27_platform_mysql_log3306.log  | sort | uniq -c | sort -r
awk '/UPDATE/{print $9}' 27_platform_mysql_log3306.log  | sort | uniq -c | sort -r

#mysql 日志
awk '/INSERT INTO/{{for(i=8;i<=NF;i++) printf"%s ",$i}print ""}' 27_platform_mysql_log3306.log 

#访问日志
awk'{print substr($9, 0, 29)}' acc.log | sort | uniq -c |sort -r

awk '!/\.css|\.js/{print substr($9, 0, match($9, "?"))}' shop.wondershare.com_access.log.2018-07-09 | sort | uniq -c | sort -r

#json 处理
grep '"rt"' logs/http/log_info20180815.log | grep -v '"is_coupload"'  | awk -F '"' '{print $(NF-39)}' | sort | uniq | grep '{' |wc -l

# 按时间排序 
ls -lt 	  时间降序
ls -lrt   时间升序
# 按时间删除文件
删除三天前的log文件
find /文件路径 -name \*.log -ctime +2 -exec rm {} \;

-exec 表示需要执行的命令，{}代表find找到的内容，"\;"是固定写法表示结束-exec

tar -jxvf ×××.tar.bz2

#php 安装

./configure --prefix=/usr/local/php-5.3.28 --enable-fpm --enable-mbstring --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd
make && make install
cp php.ini-development /usr/local/php-5.3.28/lib/

#php redis 扩展
wget http://pecl.php.net/get/redis-3.1.0.tgz
tar -zxvf redis-3.1.0.tgz
cd redis-3.1.0
/usr/local/php-5.3.28/bin/phpize 
./configure --with-php-config=/usr/local/php-5.3.28/bin/php-config
make && make install