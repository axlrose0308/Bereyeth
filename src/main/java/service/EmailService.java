package service;

import model.Email;
import model.Seminar;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

@Service
public class EmailService {
    @Resource
    private JavaMailSender javaMailSender;

    @Resource
    private SimpleMailMessage simpleMailMessage;

    public void sendEmail(String[] recipients, int messageType, Seminar seminar) {
        Email email = new Email(recipients, messageType, seminar);

        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper messageHelper;
        try {
            messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setFrom(simpleMailMessage.getFrom());

            messageHelper.setTo(email.getRecipients());
            messageHelper.setSubject(email.getSubject());
            // true for html type email
            messageHelper.setText(email.getContent(), true);
            messageHelper.setSentDate(new Date());

            //

            javaMailSender.send(message);

        } catch (MessagingException e) {

            e.printStackTrace();
        }
    }

}
