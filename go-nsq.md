1.nsqlookupd：管理拓扑信息并提供最终一致性的发现服务的守护进程
D:\myGo\download\nsq-1.1.0.windows-amd64.go1.10.3\bin\nsqlookupd
2.nsqd：一个负责接收、排队、转发消息到客户端的守护进程
1).默认4151
D:\myGo\download\nsq-1.1.0.windows-amd64.go1.10.3\bin\nsqd --lookupd-tcp-address=127.0.0.1:4160 --data-path=D:\server\nsq\data1
2).指定4251
D:\myGo\download\nsq-1.1.0.windows-amd64.go1.10.3\bin\nsqd --worker-id=857 --lookupd-tcp-address=127.0.0.1:4160 --tcp-address=0.0.0.0:4250 --http-address=0.0.0.0:4251 --data-path=D:\server\nsq\data2
3.nsqadmin：一套Web用户界面，可实时查看集群的统计数据和执行各种各样的管理任务
D:\myGo\download\nsq-1.1.0.windows-amd64.go1.10.3\bin\nsqadmin --lookupd-http-address=127.0.0.1:4161
4.文件存储
D:\myGo\download\nsq-1.1.0.windows-amd64.go1.10.3\bin\nsq_to_file --topic=test --output-dir=D:\server\nsq\store --lookupd-http-address=127.0.0.1:4161
5.推送消息
curl -d 'hello world 1' 'http://127.0.0.1:4151/pub?topic=test'
curl -d 'hello world 2' 'http://127.0.0.1:4251/pub?topic=test'
curl -X POST http://127.0.0.1:4151/channel/create?topic=test&channel=testChannel