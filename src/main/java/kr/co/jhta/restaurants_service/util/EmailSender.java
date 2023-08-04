package kr.co.jhta.restaurants_service.util;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailSender {

    // @Value("${spring.mail.username}")
    private String sender = "thecynicdog0328@gmail.com";

    private final Logger logger = Logger.getLogger(EmailSender.class);

    private JavaMailSender mailSender;

    public EmailSender(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void sendEmail(String receivingEmailAddress, String otpCode) {

        SimpleMailMessage mailMessage = new SimpleMailMessage();

        mailMessage.setFrom(sender);
        mailMessage.setTo(receivingEmailAddress);
        mailMessage.setSubject("[ OTP Code from Jhta restaurants service team ]");

        String text =
                "Welcome!\n\n" +
                "We're excited to have you as a new member.\n" +
                "Here is your One-Time Password (OTP) code: " + otpCode + "\n\n" +
                "Please use this code to complete your registration process.\n" +
                "If you have any questions or need further assistance, feel free to reach out to our support team.\n\n" +
                "Best regards,\n\n" +
                "Jhta restaurants service team ☺\uFE0F";

        mailMessage.setText(text);

        mailSender.send(mailMessage);

        logger.info("Sent email to " + receivingEmailAddress + "...");
    }
}
