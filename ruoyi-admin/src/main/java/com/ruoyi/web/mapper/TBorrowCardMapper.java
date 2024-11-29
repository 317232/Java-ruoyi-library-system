package com.ruoyi.web.mapper;

import com.ruoyi.web.domain.TBorrowCard;
import com.ruoyi.web.domain.vo.TBorrowCardVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TBorrowCardMapper {

    int deleteByPrimaryKey(@Param("ids") List<String> ids);

    int insertSelective(TBorrowCard record);

    List<TBorrowCardVo> selectList(TBorrowCardVo tBorrowCardVo);

    TBorrowCard selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TBorrowCard record);

    TBorrowCard selectByPrimaryUserId(Long id);

    List<TBorrowCard> selectByUserAll(Long id);

    List<TBorrowCard> selectByUserIdCard(Long id);
}