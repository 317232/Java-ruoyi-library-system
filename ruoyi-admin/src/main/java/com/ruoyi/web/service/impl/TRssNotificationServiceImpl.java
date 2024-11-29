package com.ruoyi.web.service.impl;

import com.ruoyi.web.domain.TRssNotification;
import com.ruoyi.web.mapper.TBooksMapper;
import com.ruoyi.web.mapper.TRssNotificationMapper;
import com.ruoyi.web.service.TRssNotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class TRssNotificationServiceImpl implements TRssNotificationService {

    @Autowired
    private TRssNotificationMapper tRssNotificationMapper;
    @Autowired
    private TBooksMapper tBooksMapper;

    @Override
    public List<TRssNotification> selectList(TRssNotification tRssNotification) {
        return tRssNotificationMapper.selectList(tRssNotification);
    }

    @Override
    public int deleteByPrimaryKey(ArrayList<String> ids) {
        return tRssNotificationMapper.deleteByPrimaryKey(ids);
    }

    @Override
    public List<TRssNotification> selectByUserIdList(Long userId) {
        return tRssNotificationMapper.selectByUserIdList(userId);
    }

    @Override
    public int setRead(String bookName, Long userId) {
        return tRssNotificationMapper.setRead(bookName, userId);
    }

    @Override
    public int insertSelective(TRssNotification tRssNotification) {
        return tRssNotificationMapper.insertSelective(tRssNotification);
    }


}
