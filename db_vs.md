Steps for executing a Query in Hive and Impala
Hive receives a SQL query and performs the following steps to get the result:

1.Parses HiveQL
2.Makes optimizations
3.Plans for execution
4.Submits job to the cluster
5.Monitors the progress
6.Processes the data: The job is sent to the data processing engine where it is either converted to MapReduce or processed by Spark.
7.Stores the data in HDFS

Let’s now discuss Impala

Impala performs the following steps after receiving a SQL query:

1.Parses Impala SQL
2.Makes optimizations
3.Plans for execution
4.Executes a query on the cluster
5.Stores data in a cluster