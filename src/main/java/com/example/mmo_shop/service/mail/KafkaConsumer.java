package com.example.mmo_shop.service.mail;

import com.example.mmo_shop.dao.model.entity.EmailMessage;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Service;

@Service
public class KafkaConsumer {
    @Autowired
    private EmailService emailService;
    private final ObjectMapper objectMapper = new ObjectMapper();

    @KafkaListener(topics = "send_email", groupId = "group_id")
    public void listen(@Payload String emailMessageJson) {
        EmailMessage emailMessage;
        try {
            emailMessage = objectMapper.readValue(emailMessageJson, EmailMessage.class);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
        emailService.sendEmail(emailMessage);
    }
}
