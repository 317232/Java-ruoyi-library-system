package com.ruoyi.web.service;

import com.ruoyi.web.domain.TBookRssHistory;
import com.ruoyi.web.domain.vo.TBookRssHistoryVo;

import java.util.List;

public interface TBookRssHistoryService {

    List<TBookRssHistory> selectByUserIdList(Long userId);
    List<TBookRssHistoryVo> selectList(TBookRssHistory tBookRssHistory);

    int deleteSelective(List<String> ids);

    int insertSelective(TBookRssHistory tBookRssHistory);


    TBookRssHistoryVo selectByBookId(Integer id);

}
