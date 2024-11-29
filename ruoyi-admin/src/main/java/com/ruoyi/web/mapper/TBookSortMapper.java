package com.ruoyi.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ruoyi.web.domain.TBookSort;

@Repository
public interface TBookSortMapper {

    int deleteByPrimaryKey(@Param("ids") List<String> ids);

    int insertSelective(TBookSort record);

    List<TBookSort> selectList(TBookSort tBookSort);

    TBookSort selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TBookSort record);

}
