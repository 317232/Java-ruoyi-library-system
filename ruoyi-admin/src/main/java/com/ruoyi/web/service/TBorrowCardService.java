package com.ruoyi.web.service;

import com.ruoyi.web.domain.TBorrowCard;
import com.ruoyi.web.domain.vo.TBorrowCardVo;

import java.util.List;

public interface TBorrowCardService {

    int deleteByPrimaryKey(List<String> ids);

    int insertSelective(TBorrowCard record);

    List<TBorrowCardVo> selectList(TBorrowCardVo tBorrowCardVo);

    List<TBorrowCard> selectByUserAll(Long id);

    TBorrowCard selectByPrimaryKey(Integer id);

    List<TBorrowCard> selectByUserIdCard(Long id);

    int updateByPrimaryKeySelective(TBorrowCard record);

    TBorrowCard selectByPrimaryUserId(Long id);
}
