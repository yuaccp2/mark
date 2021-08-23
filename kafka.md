#查看topic内容
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topicName --from-beginning
bin/kafka-console-consumer.sh --bootstrap 127.0.0.1:9092 --topic web_log

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic event --from-beginning


#启用zookeeper
./zkServer.sh start
/usr/local/kafka_2.12-2.5.0/config/zookeeper.properties
#启用kafka
nohup bin/kafka-server-start.sh config/server.properties >/dev/null 2>&1 & 
/usr/local/kafka_2.12-2.5.0/config/server.properties


