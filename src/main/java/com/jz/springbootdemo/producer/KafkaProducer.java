package com.jz.springbootdemo.producer;

import org.apache.kafka.clients.producer.ProducerRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.messaging.Message;
import org.springframework.stereotype.Component;

@Component
public class KafkaProducer {
    @Autowired
    private KafkaTemplate kafkaTemplate;

    String topic="test";
    public void sendMessage(String key,String data){
        kafkaTemplate.send((Message<?>) new ProducerRecord(topic,key,data));
    }
}
