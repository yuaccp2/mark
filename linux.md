#centOS 版本
cat /etc/redhat-release

1.vim 提高权限保存文件
:w !sudo tee %
2.vim shell 切换
vim下 ：shell
shell下 exit
3.vim 更换文件格式
set ff=unix

######查看文件数量
ls -l 20201127 | grep '^-' | wc -l
######查看CPU核数
# 总核数 = 物理CPU个数 X 每颗物理CPU的核数 
# 总逻辑CPU数 = 物理CPU个数 X 每颗物理CPU的核数 X 超线程数

# 查看物理CPU个数
cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l

# 查看每个物理CPU中core的个数(即核数)
cat /proc/cpuinfo| grep "cpu cores"| uniq

# 查看逻辑CPU的个数
cat /proc/cpuinfo| grep "processor"| wc -l


#查看所有用户的定时任务
cat /etc/passwd | cut -f 1 -d : |xargs -I {} crontab -l -u {}
#排序统计数据
awk '{print $12}' wos.wondershare.cn_access.log | sort | uniq -c | sort -r
awk '/INSERT INTO/{print $10}' 27_platform_mysql_log3306.log  | sort | uniq -c | sort -r
awk '/UPDATE/{print $9}' 27_platform_mysql_log3306.log  | sort | uniq -c | sort -r

#mysql 日志
awk '/INSERT INTO/{{for(i=8;i<=NF;i++) printf"%s ",$i}print ""}' 27_platform_mysql_log3306.log 

#访问日志
awk'{print substr($9, 0, 29)}' acc.log | sort | uniq -c |sort -r

awk '!/\.css|\.js/{print substr($9, 0, match($9, "?"))}' shop.wondershare.com_access.log.2018-07-09 | sort | uniq -c | sort -r

#匹配指定字符
grep 'HTTP_USER_AGENT' /data/cbs_logs/*/2019/02/28/*11.log | awk '{match($0,/(HTTP_USER_AGENT"[^,]*,)/,a);print a[1]}' | sort | uniq -c |sort -rn

#json 处理
grep '"rt"' logs/http/log_info20180815.log | grep -v '"is_coupload"'  | awk -F '"' '{print $(NF-39)}' | sort | uniq | grep '{' |wc -l

# 按时间排序 
ls -lt 	  时间降序
ls -lrt   时间升序
# 按时间删除文件
删除三天前的log文件
find /文件路径 -name \*.log -ctime +2 -exec rm {} \;

-exec 表示需要执行的命令，{}代表find找到的内容，"\;"是固定写法表示结束-exec

find /data/yh_bi/Yonghong/log/* -type f -name 'bi.log*'  -ctime +10  -delete
##删除文件
find /data/cbs_logs/ -type f -name '*.log' -ctime +250 -exec -delete
##删除目录
find /data/cbs_logs/* -maxdepth 0  -type d -ctime +1 -exec rm -rf {} \;    
#合并内容 
find . -name "hprose_access_*0909.log" | while read filename;do cat $filename >> hprose_merge_access_20180909.log;done;


find . -name "support.wondershare.com.old_access.log.2018-11-26" | while read filename;do cat $filename >> support.wondershare.com.old_access_all.log.2018-11-26;done;

echo ''> support.wondershare.com.old_error_all.log.2018-11-26 && find . -name "support.wondershare.com.old_error.log.2018-11-26" | while read filename;do cat $filename >> support.wondershare.com.old_error_all.log.2018-11-26;done;

#查找目录及子目录下的内容
grep -r "xxxx" /dir/
#查找指定扩展名目录及子目录下的内容
find /dir/ -name '*.xx' | xargs grep 'xxxx'
tar -jxvf ×××.tar.bz2

#打包压缩zpi
tar -zcvf xxx.tar.gx /xxx
#打包解压gz 到指定目录
tar -zxvf xxx.tar.gx -C /xxx
#php 安装

./configure --prefix=/usr/local/php-5.3.28 --enable-mbstring --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd
make && make install
cp php.ini-development /usr/local/php-5.3.28/lib/

#php redis 扩展
wget http://pecl.php.net/get/redis-3.1.0.tgz
tar -zxvf redis-3.1.0.tgz
cd redisis-3.1.0
/usr/local/php-5.3.28/bin/phpize 
./configure --with-php-config=/usr/local/php-5.3.28/bin/php-config
make && make install


#查看服务器使用高的
dstat -l -m -r -c --top-io --top-mem --top-cpu
###日期函数使用
#日期递增格式化 +一小时
date -d "2019-05-14 13:00:00 1 hour" '+%Y-%m/dl-v2%y%m-%d%k.txt'

##配置外部邮件发送
centos配置/etc/mail.rc发邮件
安装mailx:

yum install mailx
vi /etc/mail.rc

set from=524755798@qq.com
set smtp="smtps://smtp.qq.com:465"
set smtp-auth-user=524755798
set smtp-auth-password=xxxxxxx (邮箱账号的客户端授权码，需要登陆自己的邮箱进行设置，不是邮箱密码)
set smtp-auth=login
set ssl-verify=ignore
set nss-config-dir=/etc/pki/nssdb

测试：
echo test | mailx -v -s "test"  test@126.com

##添加软件链接
ln -s 源文件 目标文件
支持目录 需用全路径 

##输出第几行到结束
sed -n '100350,$p' /data/mysql_3306/us987-slow.log > /home/mysql/slow_191021.log
sed -n '96891,97125p' /data/mysql_3306/us987-slow.log > /home/mysql/slow_191015.log

###VSftpd 安装配置
sudo yum -y install vsftpd

sudo useradd ftpuser -d /home/ftpuser/ -s /sbin/nologin
sudo passwd ftpuser
sudo service vsftpd restart

### 更改系统时区
timedatectl set-timezone UTC #设置

##FTP账号添加 
useradd -d /home/linsxf/ -g ftp -s /sbin/nologin linsxf

###修改密码
password apache

###北京时区日期
lasthour=`TZ='Asia/Shanghai' date -d '1 hour ago' +%Y%m%d%H`

######批量快速注释及撤销注释：
先使用crontab -e进行对crontab的编辑操作
$ crontab -e
然后使用vi的如下编辑命令
:%s/^/#/
就可以将定时执行的任务前面都加上一个'#',进行注释掉。
同样等，某些操作完成后，也是，先进行对crontab的编辑
$ crontab -e
使用如下编辑命令 
:%s/^#//
就可以讲上次所有注释的定时任务，全部撤销。

###查看出口IP
curl ipinfo.io

###crontab 带日期不执行脚本正确写法
/bin/sh xxx.sh  >>/tmp/xx_`date +"\%Y\%m\%d"`.log

###修改用户组
usermod -g group user
