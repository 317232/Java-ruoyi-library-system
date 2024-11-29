package com.ruoyi.web.service;

import java.util.List;

import com.ruoyi.web.domain.TBookSort;

public interface TBookSortService {
    int deleteByPrimaryKey(List<String> ids);
    int insertSelective(TBookSort record);
    List<TBookSort> selectList(TBookSort tBookSort);
    TBookSort selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TBookSort record);

}
