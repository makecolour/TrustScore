package com.resfes.trustscore.service;


import com.resfes.trustscore.model.Application;
import lombok.AllArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class EmailServiceImplement implements EmailService {
    private final JavaMailSender mailSender;
    private final Application application;

    @Override
    public void sendSMTP(String subject, String body) {
        String from = application.getMailUsername(); // Assuming you have a method to get the mail username
        String to = application.getEmail(); // This is the admin email
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from);
        message.setTo(to);
        message.setSubject(subject);
        message.setText(body);
        mailSender.send(message);
    }
}
