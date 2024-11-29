package com.ruoyi.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ruoyi.web.domain.TRules;
import com.ruoyi.web.mapper.TRulesMapper;
import com.ruoyi.web.service.TRulesService;

@Service
@Transactional(rollbackFor = Exception.class)
public class TRulesServiceImpl implements TRulesService {

    @Autowired
    private TRulesMapper tRulesMapper;

    @Override
    public int deleteByPrimaryKey(List<String> ids) {
        return tRulesMapper.deleteByPrimaryKey(ids);
    }

    @Override
    public int insertSelective(TRules record) {
        return tRulesMapper.insertSelective(record);
    }

    @Override
    public List<TRules> selectList(TRules tRules) {
        return tRulesMapper.selectList(tRules);
    }

    @Override
    public TRules selectByPrimaryKey(Integer id) {
        return tRulesMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(TRules record) {
        return tRulesMapper.updateByPrimaryKeySelective(record);
    }
}
