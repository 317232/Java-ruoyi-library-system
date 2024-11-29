package com.ruoyi.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ruoyi.web.domain.TBookSort;
import com.ruoyi.web.mapper.TBookSortMapper;
import com.ruoyi.web.service.TBookSortService;

@Service
@Transactional(rollbackFor = Exception.class)
public class TBookSortServiceImpl implements TBookSortService {

    @Autowired
    private TBookSortMapper tBookSortMapper;

    @Override
    public int deleteByPrimaryKey(List<String> ids) {
        return tBookSortMapper.deleteByPrimaryKey(ids);
    }

    @Override
    public int insertSelective(TBookSort record) {
        return tBookSortMapper.insertSelective(record);
    }

    @Override
    public List<TBookSort> selectList(TBookSort tBookSort) {
        return tBookSortMapper.selectList(tBookSort);
    }

    @Override
    public TBookSort selectByPrimaryKey(Integer id) {
        return tBookSortMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(TBookSort record) {
        return tBookSortMapper.updateByPrimaryKeySelective(record);
    }
}
