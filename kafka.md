#查看topic内容
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topicName --from-beginning
bin/kafka-console-consumer.sh --bootstrap 127.0.0.1:9092 --topic web_log