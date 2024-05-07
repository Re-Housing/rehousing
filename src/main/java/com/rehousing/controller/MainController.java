package com.rehousing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
    @RequestMapping("/")
    public String main() {
        return "index";
    }

    @RequestMapping("/memberQualify")
    public String memberQualify(Model model) {
        model.addAttribute("center", "qualify");
        return "index";
    }
}
