package com.ruoyi.web.service.impl;

import com.ruoyi.web.domain.TNotice;
import com.ruoyi.web.mapper.TNoticeMapper;
import com.ruoyi.web.service.TNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional(rollbackFor = Exception.class)
public class TNoticeServiceImpl implements TNoticeService {
    @Autowired
    private TNoticeMapper tNoticeMapper;

    @Override
    public List<TNotice> selectList(TNotice tNotice) {
        return tNoticeMapper.selectList(tNotice);
    }


    @Override
    public int insertSelective(TNotice tNotice) {
        return tNoticeMapper.insertSelective(tNotice);
    }

    @Override
    public TNotice selectByPrimaryId(Integer id) {
        return tNoticeMapper.selectByPrimaryId(id);
    }

    @Override
    public int updateByPrimaryKeySelective(TNotice tNotice) {

        return tNoticeMapper.updateByPrimaryKeySelective(tNotice);
    }

    @Override
    public int deleteByPrimaryKey(List<String> ids) {
        return tNoticeMapper.deleteByPrimaryKey(ids);
    }

    @Override
    public int deleteTnoticeByPrimaryKey(Integer id) {
        return tNoticeMapper.deleteTnoticeByPrimaryKey(id);
    }


}
