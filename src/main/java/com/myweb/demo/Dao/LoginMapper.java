package com.myweb.demo.Dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Mapper
public interface LoginMapper {

    public Map<String, Object> loginProcessing(Map<String, Object> param) throws Exception;
}
