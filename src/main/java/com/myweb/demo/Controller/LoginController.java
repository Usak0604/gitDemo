package com.myweb.demo.Controller;

import com.myweb.demo.Service.Impl.LoginService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.Map;

@Controller
@RequestMapping("/")
public class LoginController {
    @Resource(name="loginService")
    private LoginService loginService;


    @RequestMapping("/")
    public String login() throws Exception{
        return "login";
    }

    @RequestMapping("/loginProcessing")
    public String loginProcessing(@RequestParam Map<String, Object> param, ModelMap model) throws Exception{
        Map<String, Object> result = loginService.loginProcessing(param);
        String resultMessage = (String)result.get("result");

        switch(resultMessage){
            case "fail":
                return "login";
            case "success":
                Map modelMap = (Map)result.get("resultMap");
                model.addAttribute("userInfo", modelMap);
                return "loginProcessing";
        }
        return "main";
    }
}
