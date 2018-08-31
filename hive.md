一、格式
1.TEXTFILE  
  默认格式，导数据时不需要处理直接存储到HDFS
2.SEQUENCEFILE  
  一种Hadoop API提供的二进制文件，使用方便、可分割、可压缩等特点。
3.RCFILE  
  一种行列存储相结合的存储方式。首先，其将数据按行分块，保证同一个record在一个块上，避免读一个记录需要读取多个block。其次，块数据列式存储，有利于数据压缩和快速的列存取。  理论上具有高查询效率（但hive官方说效果不明显，只有存储上能省10%的空间，所以不好用，可以不用）。
4.ORC 
  hive给出的新格式，属于RCFILE的升级版。少70%空间，查询效率高20来倍
  https://www.cnblogs.com/ITtangtang/p/7677912.html
5.自定义格式 
  用户的数据文件格式不能被当前 Hive 所识别的，时通过实现inputformat和outputformat来自定义输入输出格式，
  参考代码：.\hive-0.8.1\src\contrib\src\java\org\apache\hadoop\hive\contrib\fileformat\base64
备注：非testfile格式，需要先储存到testfile表后再导入到其他格式
实例：
20亿数据，查询总记录数，原生24min,ORC 40sec,相差36倍
STORAGE INFORMATION
SerDe Library:	org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe	 
InputFormat:	org.apache.hadoop.mapred.TextInputFormat	 
OutputFormat:	org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat	 

ORC STORAGE INFORMATION
SerDe Library:	org.apache.hadoop.hive.ql.io.orc.OrcSerde	 
InputFormat:	org.apache.hadoop.hive.ql.io.orc.OrcInputFormat	 
OutputFormat:	org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat

https://www.cnblogs.com/ITtangtang/p/7677912.html