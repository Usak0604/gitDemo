package com.myweb.demo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/main")
public class MainController {
    @RequestMapping("/page")
    public String mainPage(HttpServletRequest request){

        String a = request.getParameter("inputPassword");

        System.out.println(a);

        return "main";
    }
}
