package com.rehousing.controller;

import com.rehousing.app.data.dto.MemberDto;
import com.rehousing.app.service.EmailService;
import com.rehousing.app.service.MemberService;
import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MemberController {
    String dir = "member/";
    final MemberService memberService;
    final EmailService emailService;


    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", dir + "login");
        MemberDto memberDto = new MemberDto();
        try {
            emailService.sendIdMail(memberDto);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
        return "index";
    }

    @ResponseBody
    @RequestMapping("/loginimpl")
    public String loginimpl(MemberDto memberDto, HttpSession httpSession) {
        String id = memberDto.getMemberId();
        String pw = memberDto.getMemberPw();

        try {
            MemberDto loginMember = memberService.get(id);
            if (loginMember == null) {
                return "idFail";
            } else if (!loginMember.getMemberPw().equals(pw)) {
                return "pwFail";
            } else {
                httpSession.setAttribute("memberId", loginMember.getMemberId());
                httpSession.setAttribute("memberName", loginMember.getMemberName());
                return "success";
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession httpSession) {
        httpSession.invalidate();
        return "index";
    }

    @RequestMapping("/signin")
    public String signin(Model model) {
        model.addAttribute("center", dir + "signin");
        return "index";
    }

    @RequestMapping("/signinimpl")
    public String signinimpl(MemberDto memberDto, HttpSession httpSession) {
        try {
            memberService.add(memberDto);
            httpSession.setAttribute("memberId", memberDto.getMemberId());
            httpSession.setAttribute("memberName", memberDto.getMemberName());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/";
    }

    @ResponseBody
    @RequestMapping("/checkidvalid")
    public String checkidvalid(MemberDto memberDto) {
        try {
            MemberDto checkMemberDto = memberService.checkIdValid(memberDto);
            if (checkMemberDto == null) {
                return "success";
            } else {
                return "fail";
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @RequestMapping("/findid")
    public String findid(Model model) {
        model.addAttribute("center", dir + "findId");
        return "index";
    }

    @ResponseBody
    @RequestMapping("/findidimpl")
    public String findidimpl(MemberDto memberDto) {
        try {
            MemberDto findMemberDto = memberService.getId(memberDto);
            if (findMemberDto == null) {
                return "fail";
            } else {
                emailService.sendIdMail(findMemberDto);
                return "success";
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @RequestMapping("/findpw")
    public String findpw(Model model) {
        model.addAttribute("center", dir + "findPw");
        return "index";
    }

    @ResponseBody
    @RequestMapping("/findpwimpl")
    public String findpwimpl(MemberDto memberDto) {
        try {
            MemberDto findMemberDto = memberService.getPw(memberDto);
            if (findMemberDto == null) {
                return "fail";
            } else {
                emailService.sendPwMail(findMemberDto);
                return "success";
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
