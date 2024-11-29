package com.ruoyi.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ruoyi.web.domain.TRules;

@Repository
public interface TRulesMapper {

    int deleteByPrimaryKey(@Param("ids") List<String> ids);

    int insertSelective(TRules record);

    List<TRules> selectList(TRules tRules);

    TRules selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TRules record);
}