package com.myweb.demo.Service.Impl;

import com.myweb.demo.Dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service("loginService")
public class UserService {

    @Autowired
    UserMapper userMapper;

    public Map<String, Object> loginProcessing(Map<String, Object> param) throws Exception{
        Map<String, Object> queryResult = userMapper.loginProcessing(param);
        Map<String, Object> result = new HashMap<>();

        if(queryResult == null){
            result.put("result", "fail");
        }
        else{
            result.put("result", "success");
            result.put("resultMap", queryResult);
        }

        return result;
    }
}
