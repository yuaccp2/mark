http://blog.51cto.com/msgll/1963066 Supervisor安装及进程监控配置介绍

apt-get install python-pip
一、Supervisor安装步骤：
pip uninstall supervisor
1、确认系统Python版本高于2.4：
python -V
Python 2.7.5
yum install python-meld3  #安装依赖程序
2、supervisor可以通过Python包管理工具pip进行安装：
pip install supervisor==3.3.3  -i https://pypi.tuna.tsinghua.edu.cn/simple/
python -m pip install supervisor==3.3.2  -i https://pypi.tuna.tsinghua.edu.cn/simple/
supervisord -v
3.3.3

pip install total_ordering -i https://pypi.tuna.tsinghua.edu.cn/simple/

3、supervisor程序相关程序、配置文件：

[root@localhost ~]# ll /usr/bin/supervisor*
-rwxr-xr-x. 1 root root 323 9月   6 09:34 /usr/bin/supervisorctl    #客户端程序用于启动、停止、重启supervisor监控进程
-rwxr-xr-x. 1 root root 319 9月   6 09:34 /usr/bin/supervisord      #服务端进行，用于监控配置文件中定义对需要监控对进程

supervisor安装成功后，默认不会生成配置文件，需要执行如下命令才会在指定路径下创建配置文件：
[root@localhost ~]# echo_supervisord_conf > /etc/supervisor/supervisord.conf
[root@localhost ~]# ll /etc/supervisord.conf
-rw-r--r--. 1 root root 9205 9月   6 11:19 /etc/supervisord.conf

supervisor -c /etc/supervisor/supervisord.conf
supervisorctl -c /etc/supervisor/supervisord.conf