package com.example.demo.service;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import java.util.Random;

public class EmailService {

    // 임시 비밀번호 전송 함수
    public static String sendTemporaryPassword(String toEmail) {
        String host = "smtp.gmail.com";  // 예시: Gmail SMTP 서버
        final String fromEmail = "1123@gmail.com";  // 발신 이메일 (자신의 이메일)
        final String password = "jdto ojae jtak lvke";  // 이메일 비밀번호

        // Properties 설정
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // 임시 비밀번호 생성
        String temporaryPassword = generateTemporaryPassword();

        // 이메일 세션 생성
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            // 이메일 메시지 설정
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("임시 비밀번호 전송");

            // 이메일 본문 내용
            String emailBody = "안녕하세요! \n\n" +
                    "귀하의 임시 비밀번호는 " + temporaryPassword + " 입니다. \n\n" +
                    "임시 비밀번호로 로그인 후 비밀번호를 변경해주세요.";

            message.setText(emailBody);

            // 이메일 전송
            Transport.send(message);

            System.out.println("임시 비밀번호 이메일이 전송되었습니다.");

        } catch (MessagingException e) {
            e.printStackTrace();
            return null;  // 이메일 전송 실패 시 null 반환
        }

        return temporaryPassword;  // 임시 비밀번호 반환
    }

    // 임시 비밀번호 생성
    private static String generateTemporaryPassword() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder password = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < 12; i++) { // 12자리 임시 비밀번호 생성
            password.append(characters.charAt(random.nextInt(characters.length())));
        }
        return password.toString();
    }
}