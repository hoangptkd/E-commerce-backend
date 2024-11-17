package com.example.mmo_shop.service.mail;
import com.example.mmo_shop.dao.model.entity.EmailMessage;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;
@Service
public class KafkaProducer {
    private final KafkaTemplate<String, EmailMessage> kafkaTemplate;

    public KafkaProducer(KafkaTemplate<String, EmailMessage> kafkaTemplate) {
        this.kafkaTemplate = kafkaTemplate;
    }
    public void sendMessage(String topic, EmailMessage emailMessage) {
        kafkaTemplate.send(topic, emailMessage);
    }
}
