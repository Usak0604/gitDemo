package com.myweb.demo.Controller;

import com.myweb.demo.Service.Impl.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Map;

@Controller
@RequestMapping("/")
public class LoginController {
    Map<String, Object> result;

    @Resource(name="loginService")
    private UserService userService;


    @RequestMapping("/")
    public String login() throws Exception{
        return "login";
    }

    @RequestMapping("/signUp")
    public String signUp() throws Exception{
        return "signUpPopUp";
    }

    @RequestMapping("/loginProcessing")
    public String loginProcessing(ModelMap model) throws Exception{
        Map modelMap = (Map)result.get("resultMap");
        model.addAttribute("userInfo", modelMap);
        return "loginProcessing";
    }

    @RequestMapping("/userCheck")
    @ResponseBody
    public Map<String, Object> userCheck(@RequestParam Map<String, Object> param) throws Exception{
        result = userService.loginProcessing(param);
        return result;
    }
}
