package com.rehousing.controller;

import com.rehousing.app.data.dto.MemberDto;
import com.rehousing.app.service.EmailService;
import com.rehousing.app.service.MemberService;
import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;

/*********************************
 * @function : Member Controller
 * @author : 김민표
 * @Date : April 30. 2024
 * 로그인화면 controller 추가 April 30. 2024
 * 로그인화면 controller 수정 May 8. 2024
 * 아이디찾기화면 controller 추가 May 1. 2024
 * 비밀번호찾기화면 controller 추가 May 1. 2024
 * 회원가입화면 controller 추가 May 2. 2024
 * 회원가입 controller 수정 May 7. 2024
 *********************************/
@Controller
@RequiredArgsConstructor
@Slf4j
public class MemberController {
    String dir = "member/";
    final MemberService memberService;
    final EmailService emailService;

    @Value("${app.key.KAKAO_REST_API_KEY}")
    private String kakaoRestApiKey;

    // 로그인 화면
    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", dir + "login");
        model.addAttribute("kakaoRestApiKey", kakaoRestApiKey);
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

    // 로그인 처리
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
                httpSession.setAttribute("memberDto", loginMember);
                return "success";
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // 로그아웃 처리
    @RequestMapping("/logout")
    public String logout(HttpSession httpSession) {
        httpSession.invalidate();
        return "index";
    }

    // 회원가입 화면
    @RequestMapping("/signin")
    public String signin(Model model) {
        model.addAttribute("center", dir + "signin");
        return "index";
    }

    // 회원가입 처리
    @RequestMapping("/signinimpl")
    public String signinimpl(MemberDto memberDto, HttpSession httpSession) {
        try {
            memberService.add(memberDto);
            httpSession.setAttribute("memberDto", memberDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/";
    }

    // 회원가입 - 아이디 중복 체크 처리
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

    // 아이디 찾기 화면
    @RequestMapping("/findid")
    public String findid(Model model) {
        model.addAttribute("center", dir + "findId");
        return "index";
    }

    // 아이디 찾기 처리
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

    // 비밀번호 찾기 화면
    @RequestMapping("/findpw")
    public String findpw(Model model) {
        model.addAttribute("center", dir + "findPw");
        return "index";
    }

    // 비밀번호 찾기 처리
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