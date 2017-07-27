package com.myweb.demo.Controller;

import com.myweb.demo.Service.Impl.EmailServiceImpl;
import com.myweb.demo.Service.Impl.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Controller
@RequestMapping("/")
public class LoginController {
    Map<String, Object> result;

    @Resource(name="userService")
    private UserService userService;

    @Resource(name="EmailService")
    private EmailServiceImpl emailService;


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

    @RequestMapping("/sendEmail")
    @ResponseBody
    public Map<String, Object> sendEmail(@RequestParam Map<String, Object> param) throws Exception{
        String to = (String)param.get("inputEmail");
        String subject = "My Web 인증메일입니다.";
        String text = "";
        char[] textChar = new char[10];
        result = new HashMap<>();

        //인증코드 생성
        Random random = new Random();
        for(int i = 0; i < 10; i++){
            //문자 or 숫자 결정
            if(random.nextInt(2) == 0){
                textChar[i] = (char)(random.nextInt(10) + 48);
            }
            else{
                textChar[i] = (char)(random.nextInt(26) + 65);
            }
        }
        text = new String(textChar, 0, textChar.length);

        //user i/o가 응답이 멎어버려 스레드로 메일을 보낸다.
        class mailThread extends Thread{
            String text;
            mailThread(String text){
                this.text = text;
            }
            public void run(){
                emailService.sendSimpleMessage(to, subject, "해당 인증번호를 적어주세요 : " + text);
            }
        }
        mailThread thread = new mailThread(text);
        thread.start();

        result.put("result", text);
        return result;
    }

    @RequestMapping("/userCheck")
    @ResponseBody
    public Map<String, Object> userCheck(@RequestParam Map<String, Object> param) throws Exception{
        result = userService.loginProcessing(param);
        return result;
    }

    @RequestMapping("/idCheck")
    @ResponseBody
    public Map<String, Object> idCheck(@RequestParam Map<String, Object> param) throws Exception{
        result = new HashMap<>();
        if(userService.idCheck(param) == 0 )
            result.put("result", "success");
        else
            result.put("result", "fail");
        return result;
    }
}
