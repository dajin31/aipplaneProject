package com.example.demo.controller;

import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.Properties;

@WebServlet("/PDFGeneratorServlet")
public class PDFGeneratorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // JSON 데이터 읽기
        StringBuilder buffer = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            buffer.append(line);
        }

        // JSON 파싱
        JSONObject jsonData = new JSONObject(buffer.toString());
        String imageData = jsonData.getString("imageData").split(",")[1]; // Base64 데이터 추출
        String passengerName = jsonData.getString("passengerName");
        String email = jsonData.getString("email");

        try {
            // PDF 생성
            ByteArrayOutputStream pdfOutputStream = new ByteArrayOutputStream();
            Document document = new Document(PageSize.A4);
            PdfWriter.getInstance(document, pdfOutputStream);

            document.open();
            document.add(new Paragraph("항공권 예약 확인서"));
            document.add(new Paragraph("승객명: " + passengerName));

            // Base64 이미지 데이터를 PDF에 추가
            byte[] imageBytes = Base64.getDecoder().decode(imageData);
            Image image = Image.getInstance(imageBytes);
            image.scaleToFit(500, 800);
            document.add(image);

            document.close();

            // 이메일 전송 설정
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP 서버 설정 (Gmail 예시)
            props.put("mail.smtp.port", "587"); // SMTP 포트
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true"); // TLS 사용

            // 세션 생성 및 인증
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(
                            "maerong4123@gmail.com", // 발신 이메일 주소
                            "jdto ojae jtak lvke"     // 앱 비밀번호 또는 이메일 비밀번호
                    );
                }
            });

            // 메시지 생성
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("maerong4123@gmail.com")); // 발신자 설정
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email)); // 수신자 설정
            message.setSubject("항공권 예약 확인서"); // 이메일 제목

            // 메시지 본문 및 첨부 파일 설정
            BodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setText("항공권 예약 확인서를 첨부파일로 보내드립니다.");

            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart);

            // PDF 첨부
            messageBodyPart = new MimeBodyPart();
            DataSource source = new ByteArrayDataSource(pdfOutputStream.toByteArray(), "application/pdf");
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName(passengerName + "_항공권.pdf");
            multipart.addBodyPart(messageBodyPart);

            message.setContent(multipart);

            // 이메일 전송
            Transport.send(message);

            // 성공 응답
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print("{\"success\": true}");
            out.flush();

        } catch (Exception e) {
            // 오류 처리
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            out.print("{\"success\": false, \"error\": \"" + e.getMessage() + "\"}");
            out.flush();
        }
    }
}