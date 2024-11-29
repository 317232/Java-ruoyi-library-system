package com.ruoyi.web.service;

import com.ruoyi.web.domain.Bo.TBorrowBookBo;
import com.ruoyi.web.domain.TBorrowBooks;

import java.util.List;

public interface TBorrowBooksService {
    int deleteByPrimaryKey(List<String> ids);

    int insertSelective(TBorrowBooks record);

    List<TBorrowBookBo> selectList(TBorrowBookBo tBorrowBookBo);

    List<TBorrowBooks> selectByViolation(Integer id);

    TBorrowBooks selectByPrimaryKey(Integer id);
    TBorrowBooks selectByBookId(Integer bookId);

    int updateByPrimaryKeySelective(TBorrowBooks record);

    int findDataNum(int id);

    List<TBorrowBooks> selectByPrimaryId(Integer cardId);

    List<TBorrowBookBo> selectByViewList(String userName);


    int updateByEndDate(TBorrowBooks tBorrowBooks);
}
