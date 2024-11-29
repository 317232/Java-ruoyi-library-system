package com.ruoyi.web.mapper;

import com.ruoyi.web.domain.Tillegal;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TillegalMapper {

    List<Tillegal> SelectList(String tillegal);

    int insertSelective(Tillegal tillegal);

    int updateByPrimaryKeySelective(Tillegal tillegal);

    int deleteByPrimaryKey(@Param("ids") List<String> ids);

    Tillegal selectByPrimaryKey(Integer id);
}
