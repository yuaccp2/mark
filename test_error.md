压测的错误统计 
connectex: Only one usage of each socket address (protocol/network address/port) is normally permitted.
通常只允许每个套接字地址（协议/网络地址/端口）使用一种。
----TCP链接超出
--https://blog.csdn.net/MBuger/article/details/83088894

context deadline exceeded (Client.Timeout exceeded while awaiting headers)
 上下文截止时间已超过（等待标头时超过了Client.Timeout）
----


##问题：connect: cannot assign requested address
原因：TCP 端口不够用，每个client请求都需要一个。
解决方案：
排查命令
ss -s 查看当前链接数
ulimit -a 
sysctl -a | grep net.ipv4.tcp_tw
1、增加TCP端口数
vi /etc/sysctl.conf
net.ipv4.ip_local_port_range = 32768 60999 #28,231个端口
sysctl -p
2、tcp关闭
查看关闭时间
vi /etc/sysctl.conf
#表示开启重用。允许将TIME-WAIT sockets重新用于新的TCP连接，默认为0，表示关闭；
net.ipv4.tcp_tw_reuse = 1
#表示开启TCP连接中TIME-WAIT sockets的快速回收，默认为0，表示关闭。
net.ipv4.tcp_tw_recycle = 1
sysctl -p

##问题：socket: too many open files
增加打开文件数据
ulimit -n 65535

##问题：context deadline exceeded (Client.Timeout exceeded while awaiting headers)

设置
pending signals 1030853


查看win TCP链接
netstat -an|find "ESTABLISHED" /c