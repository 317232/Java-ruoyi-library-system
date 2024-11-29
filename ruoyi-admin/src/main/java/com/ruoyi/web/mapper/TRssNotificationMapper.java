package com.ruoyi.web.mapper;

import com.ruoyi.web.domain.TRssNotification;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface TRssNotificationMapper {

    List<TRssNotification> selectByUserIdList(Long userId);

    List<TRssNotification> selectList(TRssNotification tRssNotification);

    int deleteByPrimaryKey(@Param("ids") ArrayList<String> ids);

    int insertSelective(TRssNotification tRssNotification);

    int setRead(@Param("bookName") String bookName,@Param("userId") Long userId);
}
