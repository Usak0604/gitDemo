package com.myweb.demo.Service.Impl;

import com.myweb.demo.Dao.LoginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Service("loginService")
public class LoginService {

    @Autowired
    LoginMapper loginMapper;

    public Map<String, Object> loginProcessing(Map<String, Object> param) throws Exception{
        HashMap<String, Object> result = new HashMap<>();
        result.put("result", "success");
        result = (HashMap<String, Object>)loginMapper.loginProcessing(param);

        return result;
    }
}
