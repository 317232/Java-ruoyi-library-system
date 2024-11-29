package com.ruoyi.web.service;

import com.ruoyi.web.domain.TNotice;

import java.util.List;

public interface TNoticeService {

    List<TNotice> selectList(TNotice tNotice);

    int insertSelective(TNotice tNotice);

    TNotice selectByPrimaryId(Integer id);

    int updateByPrimaryKeySelective(TNotice tNotice);

    int deleteByPrimaryKey(List<String> ids);

    int deleteTnoticeByPrimaryKey(Integer ids);
}
