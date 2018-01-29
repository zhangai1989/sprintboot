package com.jz.springbootdemo.controller;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.logging.Logger;


@Component
public class Samplecontroller {

    public static Logger logger = (Logger) LoggerFactory.getLogger(Samplecontroller.class);
    private KafkaTemplate<String, String> template;

    @RequestMapping("/send")
    @ResponseBody
    String send(String topic, String key, String data) {
        template.send(topic, key, data);
        return "success";
    }

    public static void main(String[] args) throws Exception {
        SpringApplication.run(Samplecontroller.class, args);
    }

    @KafkaListener(id = "t1", topics = "t1")
    public void listenT1(ConsumerRecord<?, ?> cr) throws Exception {
//        logger.info("{} - {} : {}", cr.topic(), cr.key(), cr.value());
    }

    @KafkaListener(id = "t2", topics = "t2")
    public void listenT2(ConsumerRecord<?, ?> cr) throws Exception {
//        logger.info("{} - {} : {}", cr.topic(), cr.key(), cr.value());
    }
}
