package com.myweb.demo.Dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Mapper
public interface UserMapper {

    public Map<String, Object> loginProcessing(Map<String, Object> param) throws Exception;
    public int idCheck(Map<String, Object> param) throws Exception;
}
