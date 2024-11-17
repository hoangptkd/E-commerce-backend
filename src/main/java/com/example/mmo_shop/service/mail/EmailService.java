package com.example.mmo_shop.service.mail;
import com.example.mmo_shop.dao.model.entity.EmailMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
@Service
public class EmailService {
    @Autowired
    private JavaMailSender mailSender;
    public void sendEmail(EmailMessage emailMessage) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(emailMessage.getRecipient());
        message.setFrom("black2k4hy@gmail.com");
        message.setSubject(emailMessage.getSubject());
        message.setText(emailMessage.getBody());
        mailSender.send(message);
    }
}
