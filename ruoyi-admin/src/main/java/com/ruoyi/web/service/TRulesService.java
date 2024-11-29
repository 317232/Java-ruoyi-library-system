package com.ruoyi.web.service;

import com.ruoyi.web.domain.TRules;

import java.util.List;

public interface TRulesService {

    int deleteByPrimaryKey(List<String> ids);

    int insertSelective(TRules record);

    List<TRules> selectList(TRules tRules);

    TRules selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TRules record);

}
