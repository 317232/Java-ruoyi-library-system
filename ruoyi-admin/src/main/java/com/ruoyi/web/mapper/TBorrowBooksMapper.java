package com.ruoyi.web.mapper;

import com.ruoyi.web.domain.Bo.TBorrowBookBo;
import com.ruoyi.web.domain.TBorrowBooks;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TBorrowBooksMapper {

    int deleteByPrimaryKey(@Param("ids") List<String> ids);

    int insertSelective(TBorrowBooks record);

    List<TBorrowBookBo> selectByViewList(String userName);

    List<TBorrowBookBo> selectList(TBorrowBookBo tBorrowBookBo);

    List<TBorrowBooks> selectByViolation(Integer tBorrowBooks);

    TBorrowBooks selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TBorrowBooks record);

    List<TBorrowBooks> selectByPrimaryId(Integer cardId);

    int countByEndDate(Integer cardId);

    TBorrowBooks selectByBookId(Integer bookId);

    int findDataNum(Integer bookId);

    int updateByEndDate(TBorrowBooks tBorrowBooks);
}