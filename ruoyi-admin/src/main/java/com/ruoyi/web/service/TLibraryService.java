package com.ruoyi.web.service;

import com.ruoyi.web.domain.TLibrary;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TLibraryService {
    TLibrary selectByLibraryName(Integer id);
    int deleteByPrimaryKey(@Param("ids")List<String> ids);
    int insertSelective(TLibrary record);
    List<TLibrary> selectList(TLibrary tLibrary);
    TLibrary selectByPrimaryKey(Integer id);
    int updateByPrimaryKeySelective(TLibrary record);

}
