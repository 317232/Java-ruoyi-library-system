package com.ruoyi.web.mapper;

import com.ruoyi.web.domain.TBooks;
import com.ruoyi.web.domain.vo.TBooksVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TBooksMapper {

    int insertSelective(TBooks tBooks);

    List<TBooksVo> selectList(TBooksVo tBooks);

    TBooks selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TBooks tBooks);

    int deleteByPrimaryKey(@Param("ids") List<String> ids);
    List<TBooksVo> findDataName();

    List<TBooks> selectByStatus2(TBooks tBooks);

    TBooksVo selectByBookName(String bookName);
}
