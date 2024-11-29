package com.ruoyi.web.service;

import com.ruoyi.web.domain.Tillegal;

import java.util.List;

public interface TillegalService {

    List<Tillegal> SelectList(String tillegal);

    int insertSelective(Tillegal tillegal);

    int updateByPrimaryKeySelective(Tillegal tillegal);

    int deleteByPrimaryKey(List<String> ids);

    Tillegal selectByPrimaryKey(Integer id);
}
