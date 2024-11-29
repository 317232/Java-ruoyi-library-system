package com.ruoyi.web.mapper;

import com.ruoyi.web.domain.TLibrary;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TLibraryMapper {
    TLibrary selectByLibraryName(Integer id);
    int deleteByPrimaryKey(@Param("ids")List<String> id);
    int insertSelective(TLibrary record);
    List<TLibrary> selectList(TLibrary tLibrary);
    TLibrary selectByPrimaryKey(Integer id);
    int updateByPrimaryKeySelective(TLibrary record);

}
