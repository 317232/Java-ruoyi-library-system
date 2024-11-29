package com.ruoyi.web.service.impl;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.web.domain.*;
import com.ruoyi.web.domain.Bo.TBorrowBookBo;
import com.ruoyi.web.mapper.*;
import com.ruoyi.web.service.TBorrowBooksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class TBorrowBooksServiceImpl implements TBorrowBooksService {

    @Autowired
    private TBorrowBooksMapper tBorrowBooksMapper;

    @Autowired
    private TBorrowCardMapper tBorrowCardMapper;

    @Autowired
    private TRulesMapper tRulesMapper;

    @Autowired
    private TBooksMapper tBooksMapper;

    @Autowired
    private TLibraryMapper tLibraryMapper;
    @Override
    public int deleteByPrimaryKey(List<String> ids) {
        return tBorrowBooksMapper.deleteByPrimaryKey(ids);
    }

    @Override
    public int insertSelective(TBorrowBooks record) {
        TBorrowCard tBorrowCard = tBorrowCardMapper.selectByPrimaryKey(record.getCardId());
        TRules tRules = tRulesMapper.selectByPrimaryKey(tBorrowCard.getRuleId());
        // 书籍
        TBooks tBooks = tBooksMapper.selectByPrimaryKey(record.getBookId());
        if(tBooks.getStatus() == 1){
            // 书籍借阅判断
            throw new ServiceException("该书籍已被借阅");
        }
        // count想借阅的书籍数
        int countByBorrowDate = tBorrowBooksMapper.countByEndDate(record.getCardId());

        if(countByBorrowDate >= tRules.getBorrowNum()){
            // 借阅数量限制
            throw new ServiceException("不能超过规则限定的最大借阅数量");
        }
        // 图书馆
        TLibrary tLibrary = tLibraryMapper.selectByPrimaryKey(tBooks.getLibraryId());
        int libraryId = tBooks.getLibraryId();
        TLibrary name= tLibraryMapper.selectByLibraryName(libraryId);
        // 判断书籍是否在该图书馆,规则中的图书馆与图书馆进行判断
        if(!name.getName().contains(tLibrary.getName())){
            throw new ServiceException("该书籍不在该图书馆");
        }
        // get方法获取到前端name标识的选择
        int differentDayByMillsecond = DateUtils.differentDaysByMillisecond(new Date(), record.getEndDate());
        if(differentDayByMillsecond > tRules.getLimitDay()){
            throw new ServiceException("可借阅时间不可超过规则限制的借阅时间");
        }
        // 借阅时间为当前时间，状态默认为未归还
        record.setBorrowDate(new Date());
        // 根据当前日期，计算最终归还日期

        record.setStatus("0");
        // 书籍设为不可借阅
        tBooks.setStatus((short) 1);
        tBooksMapper.updateByPrimaryKeySelective(tBooks);
        return tBorrowBooksMapper.insertSelective(record);
    }


    @Override
    public List<TBorrowBooks> selectByViolation(Integer id) {
        return tBorrowBooksMapper.selectByViolation(id);
    }
    @Override
    public List<TBorrowBookBo> selectList(TBorrowBookBo tBorrowBookBo) {

        return tBorrowBooksMapper.selectList(tBorrowBookBo);
    }

    @Override
    public TBorrowBooks selectByPrimaryKey(Integer id) {
        return tBorrowBooksMapper.selectByPrimaryKey(id);
    }

    @Override
    public TBorrowBooks selectByBookId(Integer bookId) {
        return tBorrowBooksMapper.selectByBookId(bookId);
    }

    @Override
    public int updateByPrimaryKeySelective(TBorrowBooks record) {
        // 借阅书籍
        TBorrowBooks tBorrowBooks = tBorrowBooksMapper.selectByPrimaryKey(record.getId());
        // 书籍
        TBooks tBooks = tBooksMapper.selectByPrimaryKey(tBorrowBooks.getBookId());

        if(tBorrowBooks.getBookId() == null){
            throw new ServiceException("你的书籍都已归还，请前往继续借阅");
        }
        // 书籍id查找到借阅卡id
        TBorrowCard tBorrowCard = tBorrowCardMapper.selectByPrimaryKey(tBorrowBooks.getCardId());
        // 借阅规则查找逾期日期
        TRules tRules = tRulesMapper.selectByPrimaryKey(tBorrowCard.getRuleId());

        // x 为已借阅借阅天数， y为预计的借阅天数
        Integer x = DateUtils.differentDaysByMillisecond(tBorrowBooks.getBorrowDate(), new Date());
        Integer y = DateUtils.differentDaysByMillisecond(tBorrowBooks.getBorrowDate(), tBorrowBooks.getEndDate());

        int call = y-x;

        Date currentDate = new Date();

        tBorrowBooks.setReturnDate(currentDate);
        if (call < 0){
            tBorrowBooks.setIllegal("逾期"+ Math.abs(call) + "天");
        }

        // 书籍设为可借阅
        tBooks.setStatus((short) 0);
        tBooksMapper.updateByPrimaryKeySelective(tBooks);
        tBorrowBooks.setStatus("1");
        return tBorrowBooksMapper.updateByPrimaryKeySelective(tBorrowBooks);
    }

    @Override
    public int findDataNum(int id) {
        return tBorrowBooksMapper.findDataNum(id);
    }

    @Override
    public List<TBorrowBooks> selectByPrimaryId(Integer cardId) {

        return tBorrowBooksMapper.selectByPrimaryId(cardId);
    }

    @Override
    public List<TBorrowBookBo> selectByViewList(String userName) {
        return tBorrowBooksMapper.selectByViewList(userName);
    }

    @Override
    public int updateByEndDate(TBorrowBooks tBorrowBooks) {
        // 修改时设定的预定归还时间 < 图书馆规则限制日期
        TBorrowBooks BorrowBooks = tBorrowBooksMapper.selectByBookId(tBorrowBooks.getBookId());
        // 书籍id查找到借阅卡id
        TBorrowCard tBorrowCard = tBorrowCardMapper.selectByPrimaryKey(tBorrowBooks.getCardId());
        // 借阅规则查找逾期日期
        TRules tRules = tRulesMapper.selectByPrimaryKey(tBorrowCard.getRuleId());
        int countDay = DateUtils.differentDaysByMillisecond(BorrowBooks.getBorrowDate(), tBorrowBooks.getEndDate());

        if(countDay > tRules.getLimitDay()){
            throw new ServiceException("可借阅时间不可超过规则限制的借阅时间");
        }

        return tBorrowBooksMapper.updateByEndDate(tBorrowBooks);
    }

}
