package com.ruoyi.web.service.impl;

import com.ruoyi.system.mapper.SysUserMapper;
import com.ruoyi.web.domain.TBooks;
import com.ruoyi.web.domain.TRssNotification;
import com.ruoyi.web.domain.vo.TBookRssHistoryVo;
import com.ruoyi.web.domain.vo.TBooksVo;
import com.ruoyi.web.mapper.TBookRssHistoryMapper;
import com.ruoyi.web.mapper.TBooksMapper;
import com.ruoyi.web.mapper.TRssNotificationMapper;
import com.ruoyi.web.service.TBooksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class TBooksServiceImpl implements TBooksService {

    @Autowired
    private TBooksMapper tBooksMapper;

    @Autowired
    private TRssNotificationMapper tRssNotificationMapper;

    @Autowired
    private TBookRssHistoryMapper tBookRssHistoryMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Override
    public int deleteByPrimaryKey(List<String> ids) {
        return tBooksMapper.deleteByPrimaryKey(ids);
    }

    @Override
    public List<TBooks> selectByStatus2(TBooks tBooks) {
        return tBooksMapper.selectByStatus2(tBooks);
    }

    @Override
    public List<TBooksVo> findDataName() {
        return tBooksMapper.findDataName();
    }

    @Override
    public TBooksVo selectByBookName(String bookName) {
        return tBooksMapper.selectByBookName(bookName);
    }

    @Override
    public int insertSelective(TBooks record) {
        return tBooksMapper.insertSelective(record);
    }

    @Override
    public List<TBooksVo> selectList(TBooksVo tBooksVo) {
        return tBooksMapper.selectList(tBooksVo);
    }
    @Override
    public TBooks selectByPrimaryKey(Integer id) {
        return tBooksMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(TBooks record) {
        if(record.getStatus() != 2){
            List<Long> userIds = tBookRssHistoryMapper.selectUserIds(record.getId());
            List<TBookRssHistoryVo> tBookRssHistoryVoS = tBookRssHistoryMapper.selectByBookList(record.getId());

            // 对书籍id进行一个判断，符合的书籍名信息才可发送订阅通知
            // 对图书进行上架后要发送订阅通知，同时删除图书订阅中用户的订阅信息
            for(Long userId : userIds){
                for(TBookRssHistoryVo tBookRssHistoryVo : tBookRssHistoryVoS){
                    if (tBookRssHistoryVo.getBookId().equals(record.getId())){
                        TRssNotification tRssNotification = new TRssNotification();
                        tRssNotification.setContent(record.getName() + "已上架");
                        tRssNotification.setUserId(userId);
                        tRssNotificationMapper.insertSelective(tRssNotification);
                    }
                }
            }
            // 但是书籍id不是只有一个而是多个人都能借selectByBookId 发送通知后将图书订阅中存有的订阅删除
            for(TBookRssHistoryVo tBookRssHistoryVo : tBookRssHistoryVoS){
                tBookRssHistoryMapper.deleteById(tBookRssHistoryVo.getId());
            }

        }
        return tBooksMapper.updateByPrimaryKeySelective(record);
    }


}
