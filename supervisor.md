/usr/bin/python2 /usr/bin/supervisord -c /etc/supervisor/supervisord.conf


问题：Exited too quickly (process log may have details)
解决：directory=/root/uniapp-Flask ; 非常重要,选择在那个目录下执行命令【文件路径都是相对这个位置】



gave up: sparrow-server-worker entered FATAL state, too many start retries too quickly