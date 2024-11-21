package com.example.mmo_shop.service.mail;

import com.example.mmo_shop.dao.model.entity.EmailMessage;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class EmailServiceTest {
    @Autowired
    private EmailService emailService;

    @Test
    void sendEmail() {
        EmailMessage emailMessage = new EmailMessage("hoangptkdhy@gmail.com", "Test1", "Many test1");
        emailService.sendEmail(emailMessage);
    }
}