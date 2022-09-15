package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.Data;

@Controller
public class DemoController {
    @GetMapping("/")
    public String main (){
        return "main";
    }

}
