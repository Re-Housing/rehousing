package com.rehousing.app.service;

import com.rehousing.app.data.dto.MemberDto;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;

@Service
public class EmailService {
    @Autowired
    private JavaMailSender javaMailSender;
    private String logoPath = "static/img/logo.png";

    @Async
    public void sendIdMail(MemberDto memberDto) throws MessagingException, UnsupportedEncodingException {
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        helper.setTo(memberDto.getMemberEmail());
        helper.setFrom("rehousing0427@gmail.com", "ReHousing Support");
        helper.setSubject("[ReHousing] 아이디 찾기");

        // HTML 형식으로 메일 내용 작성
        String htmlContent = "<img src='cid:logo' width='100' height='100'>" + "<h1>아이디 찾기 안내</h1><p>회원님의 아이디는 <strong>" + memberDto.getMemberId() + "</strong> 입니다.</p>";
        helper.setText(htmlContent, true);

        helper.addInline("logo", new ClassPathResource(logoPath));

        javaMailSender.send(message);
    }

    @Async
    public void sendPwMail(MemberDto memberDto) throws MessagingException, UnsupportedEncodingException {
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        helper.setTo(memberDto.getMemberEmail());
        helper.setFrom("rehousing0427@gmail.com", "ReHousing Support");
        helper.setSubject("[ReHousing] 비밀번호 찾기");

        // HTML 형식으로 메일 내용 작성
        String htmlContent = "<img src='cid:logo'>" + "<h1>비밀번호 찾기 안내</h1><p>회원님의 비밀번호는 <strong>" + memberDto.getMemberPw() + "</strong> 입니다.</p>";
        helper.setText(htmlContent, true);

        helper.addInline("logo", new ClassPathResource(logoPath));

        javaMailSender.send(message);
    }
}