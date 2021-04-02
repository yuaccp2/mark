这两个参数是mysql对临时表的大小控制 
tmp_table_size      控制内存临时表的最大值,超过限值后就往硬盘写，写的位置由变量 tmpdir 决定 
max_heap_table_size 用户可以创建的内存表(memory table)的大小.这个值用来计算内存表的最大行数值。


mysql> SHOW GLOBAL STATUS LIKE '%key_read%';
+-------------------+-----------------+
| Variable_name     | Value           |
+-------------------+-----------------+
| Key_read_requests | 2454354135490   |
| Key_reads         | 23490           |
+-------------------+-----------------+
2 rows in set (0.00 sec)
一共有Key_read_requests个索引哀求,一共发生了Key_reads次物理IO
Key_reads/Key_read_requests ≈ 0.1%以下比较好.


innodb_buffer_pool_size=67.5G
innodb_buffer_pool_instances=12
tmp_table_size=2G
max_heap_table_size=2G