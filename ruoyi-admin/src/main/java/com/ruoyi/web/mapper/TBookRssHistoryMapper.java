package com.ruoyi.web.mapper;

import com.ruoyi.web.domain.TBookRssHistory;
import com.ruoyi.web.domain.vo.TBookRssHistoryVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TBookRssHistoryMapper {

    List<TBookRssHistoryVo> selectList(TBookRssHistory tBookRssHistory);

    List<TBookRssHistory> selectByUserIdList(Long userId);

    int insertSelective(TBookRssHistory tBookRssHistory);

    int deleteSelective(@Param("ids") List<String> id);

    TBookRssHistoryVo selectByBookId(Integer id);

    // 实现层使用
    List<Long> selectUserIds(Integer id);

    List<TBookRssHistoryVo> selectByBookList(Integer id);

    int deleteById(Integer id);


}
