package com.ruoyi.web.mapper;

import com.ruoyi.web.domain.TNotice;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface TNoticeMapper {

    List<TNotice> selectList(TNotice tNotice);

    int insertSelective(TNotice tNotice);

    int updateByPrimaryKeySelective(TNotice tNotice);

    TNotice selectByPrimaryId(Integer id);

    int deleteByPrimaryKey(List<String> ids);

    int deleteTnoticeByPrimaryKey(Integer id);
}
