package com.rehousing.controller;

import com.rehousing.app.data.dto.MemberDto;
import com.rehousing.app.service.KakaoLoginService;
import com.rehousing.app.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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
@RequiredArgsConstructor
@Slf4j
public class MainController {
    final MemberService memberService;
    final KakaoLoginService kakaoLoginService;

    @Value("${app.key.KAKAO_REST_API_KEY}")
    private String kakaoRestApiKey;

    // 메인 화면
    @RequestMapping("/")
    public String main(@RequestParam(value = "code", required = false) String code, HttpSession httpSession) {
        MemberDto loginMemberDto = (MemberDto) httpSession.getAttribute("memberDto");
        // 로그인을 한 경우
        if (loginMemberDto != null) {
            try {
                // 상태 업데이트
                httpSession.setAttribute("memberDto", memberService.getId(loginMemberDto));
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        // Kakao 로그인을 통한 로그인 / 회원가입
        try {
            if (code != null) {
                String accessToken = kakaoLoginService.getAccessTokenFromKakao(kakaoRestApiKey, code);
                if (accessToken != null) {
                    HashMap<String, Object> userInfo = kakaoLoginService.getUserInfo(accessToken);
                    String memberName = (String) userInfo.get("nickname");
                    String memberId = (String) userInfo.get("email");
                    String memberEmail = (String) userInfo.get("email");
                    MemberDto memberDto = MemberDto.builder().
                                                    memberName(memberName).
                                                    memberId(memberId).
                                                    memberEmail(memberEmail).build();

                    MemberDto KakaoLoginMemberDto = memberService.get(memberId);
                    if (KakaoLoginMemberDto == null) {
                        // 처음 카카오 로그인 한 경우
                        memberService.add(memberDto);
                        httpSession.setAttribute("memberDto", memberDto);
                    } else {
                        // 카카오 로그인을 통해 회원가입을 한 경우
                        httpSession.setAttribute("memberDto", KakaoLoginMemberDto);
                    }
                }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
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
