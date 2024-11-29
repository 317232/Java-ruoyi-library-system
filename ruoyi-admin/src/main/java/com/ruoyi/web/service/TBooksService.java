package com.ruoyi.web.service;

import com.ruoyi.web.domain.TBooks;
import com.ruoyi.web.domain.vo.TBooksVo;

import java.util.List;

public interface TBooksService {
    int insertSelective(TBooks tBooks);
    List<TBooksVo> selectList(TBooksVo tBooks);
    TBooks selectByPrimaryKey(Integer id);
    int updateByPrimaryKeySelective(TBooks tBooks);
    int deleteByPrimaryKey(List<String> ids);
    List<TBooks> selectByStatus2(TBooks tBooks);
    List<TBooksVo> findDataName();

    TBooksVo selectByBookName(String bookName);
}
