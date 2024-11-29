package com.ruoyi.web.service.impl;

import com.ruoyi.web.domain.TLibrary;
import com.ruoyi.web.mapper.TLibraryMapper;
import com.ruoyi.web.service.TLibraryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class TLibraryServiceImpl implements TLibraryService {

    @Autowired
    private TLibraryMapper tLibraryMapper;

    @Override
    public TLibrary selectByLibraryName(Integer id) {
        return tLibraryMapper.selectByLibraryName(id);
    }

    @Override
    public int deleteByPrimaryKey(List<String> ids) {
        return tLibraryMapper.deleteByPrimaryKey(ids);
    }

    @Override
    public int insertSelective(TLibrary record) {
        return tLibraryMapper.insertSelective(record);
    }

    @Override
    public List<TLibrary> selectList(TLibrary tLibrary) {
        return tLibraryMapper.selectList(tLibrary);
    }
    @Override
    public TLibrary selectByPrimaryKey(Integer id) {
        return tLibraryMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(TLibrary record) {
        return tLibraryMapper.updateByPrimaryKeySelective(record);
    }
}
