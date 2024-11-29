package com.ruoyi.web.mapper;

import com.ruoyi.web.domain.TMessage;
import com.ruoyi.web.domain.vo.TMessageVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TMessageMapper {

    List<TMessageVo> selectList(TMessageVo tMessageVo);

    int insertSelective(TMessage tMessage);

    List<TMessage> selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TMessage tMessage);

    int deleteByPrimaryKey(@Param("ids") List<String> ids);

    TMessageVo selectByPrimaryId(Integer id);
}
