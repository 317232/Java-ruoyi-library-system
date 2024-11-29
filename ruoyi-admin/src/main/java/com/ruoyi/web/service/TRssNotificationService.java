package com.ruoyi.web.service;

import com.ruoyi.web.domain.TRssNotification;

import java.util.ArrayList;
import java.util.List;

public interface TRssNotificationService {

    List<TRssNotification> selectList(TRssNotification tRssNotification);

    int insertSelective(TRssNotification tRssNotification);

    int deleteByPrimaryKey(ArrayList<String> ids);

    List<TRssNotification> selectByUserIdList(Long userId);

    int setRead(String bookName, Long userId);
}
