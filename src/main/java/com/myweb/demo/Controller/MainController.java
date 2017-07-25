package com.myweb.demo.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/main")
public class MainController {
    @RequestMapping("/page")
    public String mainPage(@RequestParam Map<String, Object> param, ModelMap model){
        model.addAttribute("userInfo", param);
        return "main";
    }
}
