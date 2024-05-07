package com.rehousing.controller;

import com.rehousing.app.data.dto.MemberDto;
import com.rehousing.app.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/*********************************
 * @function : Main Controller
 * @author : 김민표
 * @Date : April 30. 2024
 * 메인화면 controller 추가 April 30. 2024
 * 메인화면 controller 수정 May 7. 2024
 * 지원자격화면 controller 추가 May 2. 2024
 * 지원자격 controller 추가 May 7. 2024
 *********************************/

@Controller
@AllArgsConstructor
@Slf4j
public class MainController {
    final MemberService memberService;
    // 메인 화면
    @RequestMapping("/")
    public String main(HttpSession httpSession) {
        return "index";
    }

    // 지원자격 화면
    @RequestMapping("/qualify")
    public String memberqualify(Model model) {
        model.addAttribute("center", "qualify");
        return "index";
    }

    // 지원자격 처리
    @RequestMapping("/qualifyimpl")
    public String memberqualifyimpl(HttpSession httpSession) {
        MemberDto memberDto = (MemberDto) httpSession.getAttribute("memberDto");
        try {
            memberService.modifyMemberConfirm(memberDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/";
    }
}
