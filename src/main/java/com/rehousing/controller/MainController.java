package com.rehousing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/*********************************
 * @function : Main Controller
 * @author : 김민표
 * @Date : April 30. 2024
 * 메인화면 controller 추가 April 30. 2024
 * 지원자격화면 controller 추가 May 2. 2024
 *********************************/

@Controller
public class MainController {
    // 메인 화면
    @RequestMapping("/")
    public String main() {
        return "index";
    }

    // 지원자격 화면
    @RequestMapping("/qualify")
    public String memberQualify(Model model) {
        model.addAttribute("center", "qualify");
        return "index";
    }
}
