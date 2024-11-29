package com.ruoyi.web.service.impl;

import com.ruoyi.web.domain.Tillegal;
import com.ruoyi.web.mapper.TillegalMapper;
import com.ruoyi.web.service.TillegalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class TillegalServiceImpl implements TillegalService {

    @Autowired
    private TillegalMapper tillegalMapper;

    @Override
    public List<Tillegal> SelectList(String tillegal) {
        return tillegalMapper.SelectList(tillegal);
    }

    @Override
    public int insertSelective(Tillegal tillegal) {
        return tillegalMapper.insertSelective(tillegal);
    }

    @Override
    public int updateByPrimaryKeySelective(Tillegal tillegal) {
        // tillegal.getCreateTime() 转为 datetime 类型
        System.out.println(tillegal.getCreateTime());
        return tillegalMapper.updateByPrimaryKeySelective(tillegal);
    }

    @Override
    public int deleteByPrimaryKey(List<String> ids) {
        return tillegalMapper.deleteByPrimaryKey(ids);
    }

    @Override
    public Tillegal selectByPrimaryKey(Integer id) {
        return tillegalMapper.selectByPrimaryKey(id);
    }
}
