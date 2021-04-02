### Impala架构

#### 1、Impala的核心组件

**Statestore Daemon**

- 负责收集分布在集群中各个impalad进程的资源信息、各节点健康状况，同步节点信息
- 负责query的调度

**Catalog Daemon**

- 从Hive元数据库中同步元数据，分发表的元数据信息到各个impalad中

- 接收来自statestore的所有请求

  > impala版本1.2之后开始有的，不是很只能，有些元数据信息并不能同步到各个impalad的，例如hive中创建表，Catalog Daemon不能同步，需要在imapala手动执行命令同步。

**Impala Daemon(impalad)** <具有数据本地化的特性所以放在DataNode上>

- 接收client、hue、jdbc或者odbc请求、Query执行并返回给中心协调节点

- 子节点上的守护进程，负责向statestore保持通信，汇报工作

  > Impala daemon：执行计算。因内存依赖大，所最好不要和imapla的其他组件放到同意节点

> 考虑集群性能问题，一般将StateStoreDaemon与 Catalog Daemon放在统一节点上，因之间要做通信

#### 2、整体架构流程





![img](D:\github\mark\mark\note\Impala.assets\1200756-20190816113304739-1578438794.png)

1. 客户端向某一个Impalad发送一个query(SQL)

   > 上Impalad会与StateStore保持连接(通信)，确定impala集群哪写Impalad是否健康可工作，与NameNode得到数据元数据信息(数据的位置等)；每个Impalad通过Catalog可知表元数据据信息；

2. Impalad将query解析为具体的执行计划Planner, 交给当前机器Coordinator即为中心协调节点

   > Impalad通过jni，将query传送给java前端，由java前端完成语法分析和生成执行计划(Planner)，并将执行计划封装成thrift格式返回执行计划分为多个阶段，每一个阶段叫做一个（计划片段）PlanFragment，每一个PlanFragment在执行时可以由多个Impalad实例并行执行(有些PlanFragment只能由一个Impalad实例执行),

3. Coordinator(中心协调节点)根据执行计划Planner，通过本机Executor执行，并转发给其它有数据的impalad用Executor进行执行

4. impalad的Executor之间可进行通信，可能需要一些数据的处理

5. 各个impalad的Executor执行完成后，将结果返回给中心协调节点

   > 用户调用GetNext()方法获取计算结果，如果是insert语句，则将计算结果写回hdfs
   >
   > 当所有输入数据被消耗光，执行结束(完成)。
   >
   > 在执行过程中，如果有任何故障发生，则整个执行失败

6. 有中心节点Coordinator将汇聚的查询结果返回给客户端