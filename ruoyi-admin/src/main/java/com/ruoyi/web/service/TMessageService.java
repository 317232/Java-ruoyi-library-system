package com.ruoyi.web.service;

import com.ruoyi.web.domain.TMessage;
import com.ruoyi.web.domain.vo.TMessageVo;

import java.util.List;

public interface TMessageService {
    List<TMessageVo> selectList(TMessageVo tMessageVo);
    int insertSelective(TMessage tMessage);
    List<TMessage> selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TMessage tMessage);

    int deleteByPrimaryKey(List<String> ids);

    TMessageVo selectByPrimaryId(Integer id);
}
