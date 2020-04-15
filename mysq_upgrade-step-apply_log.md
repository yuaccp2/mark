[root@sz_sjzx_mysqldb_0_81 data]# innobackupex --defaults-file=/etc/mysql-5.5.41.cnf --apply-log /data/mysqlbak/2019-10-20_13-06-45/
xtrabackup: recognized server arguments: --innodb_checksum_algorithm=innodb --innodb_log_checksum_algorithm=innodb --innodb_data_file_path=ibdata1:10M:autoextend --innodb_log_files_in_group=3 --innodb_log_file_size=268435456 --innodb_fast_checksum=0 --innodb_page_size=16384 --innodb_log_block_size=512 --innodb_undo_directory=. --innodb_undo_tablespaces=0 --server-id=1 --redo-log-version=0 
xtrabackup: recognized client arguments: --innodb_checksum_algorithm=innodb --innodb_log_checksum_algorithm=innodb --innodb_data_file_path=ibdata1:10M:autoextend --innodb_log_files_in_group=3 --innodb_log_file_size=268435456 --innodb_fast_checksum=0 --innodb_page_size=16384 --innodb_log_block_size=512 --innodb_undo_directory=. --innodb_undo_tablespaces=0 --server-id=1 --redo-log-version=0 
191021 04:08:58 innobackupex: Starting the apply-log operation

IMPORTANT: Please check that the apply-log run completes successfully.
           At the end of a successful apply-log run innobackupex
           prints "completed OK!".

innobackupex version 2.4.12 based on MySQL server 5.7.19 Linux (x86_64) (revision id: 170eb8c)
xtrabackup: cd to /data/mysqlbak/2019-10-20_13-06-45/
xtrabackup: This target seems to be not prepared yet.
InnoDB: Number of pools: 1
xtrabackup: xtrabackup_logfile detected: size=26345472, start_lsn=(9875748673933)
xtrabackup: using the following InnoDB configuration for recovery:
xtrabackup:   innodb_data_home_dir = .
xtrabackup:   innodb_data_file_path = ibdata1:10M:autoextend
xtrabackup:   innodb_log_group_home_dir = .
xtrabackup:   innodb_log_files_in_group = 1
xtrabackup:   innodb_log_file_size = 26345472
xtrabackup: using the following InnoDB configuration for recovery:
xtrabackup:   innodb_data_home_dir = .
xtrabackup:   innodb_data_file_path = ibdata1:10M:autoextend
xtrabackup:   innodb_log_group_home_dir = .
xtrabackup:   innodb_log_files_in_group = 1
xtrabackup:   innodb_log_file_size = 26345472
xtrabackup: Starting InnoDB instance for recovery.
xtrabackup: Using 104857600 bytes for buffer pool (set by --use-memory parameter)
InnoDB: PUNCH HOLE support available
InnoDB: Mutexes and rw_locks use GCC atomic builtins
InnoDB: Uses event mutexes
InnoDB: GCC builtin __atomic_thread_fence() is used for memory barrier
InnoDB: Compressed tables use zlib 1.2.7
InnoDB: Number of pools: 1
InnoDB: Using CPU crc32 instructions
InnoDB: Initializing buffer pool, total size = 100M, instances = 1, chunk size = 100M
InnoDB: Completed initialization of buffer pool
InnoDB: page_cleaner coordinator priority: -20
InnoDB: Highest supported file format is Barracuda.
InnoDB: Log scan progressed past the checkpoint lsn 9875748673933
InnoDB: Doing recovery: scanned up to log sequence number 9875753916416 (22%)
InnoDB: Doing recovery: scanned up to log sequence number 9875759159296 (44%)
InnoDB: Doing recovery: scanned up to log sequence number 9875764402176 (67%)
InnoDB: Doing recovery: scanned up to log sequence number 9875769645056 (89%)
InnoDB: Doing recovery: scanned up to log sequence number 9875772124068 (100%)
InnoDB: Database was not shutdown normally!
InnoDB: Starting crash recovery.
InnoDB: Starting an apply batch of log records to the database...
InnoDB: Progress in percent: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 
InnoDB: Apply batch completed
InnoDB: xtrabackup: Last MySQL binlog file position 523885641, file name /dataext/mysql_3306/bin_log/mysql-bin.001775
InnoDB: Creating shared tablespace for temporary tables
InnoDB: Setting file './ibtmp1' size to 12 MB. Physically writing the file full; Please wait ...
InnoDB: File './ibtmp1' size is now 12 MB.
InnoDB: 96 redo rollback segment(s) found. 1 redo rollback segment(s) are active.
InnoDB: 32 non-redo rollback segment(s) are active.
InnoDB: page_cleaner: 1000ms intended loop took 114942ms. The settings might not be optimal. (flushed=0 and evicted=0, during the time.)
InnoDB: 5.7.19 started; log sequence number 9875772124068
InnoDB: xtrabackup: Last MySQL binlog file position 523885641, file name /dataext/mysql_3306/bin_log/mysql-bin.001775

xtrabackup: starting shutdown with innodb_fast_shutdown = 1
InnoDB: FTS optimize thread exiting.
InnoDB: Starting shutdown...
InnoDB: Shutdown completed; log sequence number 9875772147087
InnoDB: Number of pools: 1
xtrabackup: using the following InnoDB configuration for recovery:
xtrabackup:   innodb_data_home_dir = .
xtrabackup:   innodb_data_file_path = ibdata1:10M:autoextend
xtrabackup:   innodb_log_group_home_dir = .
xtrabackup:   innodb_log_files_in_group = 3
xtrabackup:   innodb_log_file_size = 268435456
InnoDB: PUNCH HOLE support available
InnoDB: Mutexes and rw_locks use GCC atomic builtins
InnoDB: Uses event mutexes
InnoDB: GCC builtin __atomic_thread_fence() is used for memory barrier
InnoDB: Compressed tables use zlib 1.2.7
InnoDB: Number of pools: 1
InnoDB: Using CPU crc32 instructions
InnoDB: Initializing buffer pool, total size = 100M, instances = 1, chunk size = 100M
InnoDB: Completed initialization of buffer pool
InnoDB: page_cleaner coordinator priority: -20
InnoDB: Setting log file ./ib_logfile101 size to 256 MB
InnoDB: Progress in MB:
 100 200
InnoDB: Setting log file ./ib_logfile1 size to 256 MB
InnoDB: Progress in MB:
 100 200
InnoDB: Setting log file ./ib_logfile2 size to 256 MB
InnoDB: Progress in MB:
 100 200
InnoDB: Renaming log file ./ib_logfile101 to ./ib_logfile0
InnoDB: New log files created, LSN=9875772147087
InnoDB: Highest supported file format is Barracuda.
InnoDB: Log scan progressed past the checkpoint lsn 9875772147212
InnoDB: Doing recovery: scanned up to log sequence number 9875772147221 (0%)
InnoDB: Database was not shutdown normally!
InnoDB: Starting crash recovery.
InnoDB: xtrabackup: Last MySQL binlog file position 523885641, file name /dataext/mysql_3306/bin_log/mysql-bin.001775
InnoDB: Removed temporary tablespace data file: "ibtmp1"
InnoDB: Creating shared tablespace for temporary tables
InnoDB: Setting file './ibtmp1' size to 12 MB. Physically writing the file full; Please wait ...
InnoDB: File './ibtmp1' size is now 12 MB.
InnoDB: 96 redo rollback segment(s) found. 1 redo rollback segment(s) are active.
InnoDB: 32 non-redo rollback segment(s) are active.
InnoDB: page_cleaner: 1000ms intended loop took 15224ms. The settings might not be optimal. (flushed=0 and evicted=0, during the time.)
InnoDB: 5.7.19 started; log sequence number 9875772147221
xtrabackup: starting shutdown with innodb_fast_shutdown = 1
InnoDB: FTS optimize thread exiting.
InnoDB: Starting shutdown...
InnoDB: Shutdown completed; log sequence number 9875772147240
191021 04:11:16 completed OK!