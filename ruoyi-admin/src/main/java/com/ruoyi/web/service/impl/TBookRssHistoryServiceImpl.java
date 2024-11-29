package com.ruoyi.web.service.impl;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.web.domain.TBookRssHistory;
import com.ruoyi.web.domain.vo.TBookRssHistoryVo;
import com.ruoyi.web.mapper.TBookRssHistoryMapper;
import com.ruoyi.web.service.TBookRssHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class TBookRssHistoryServiceImpl implements TBookRssHistoryService {

    @Autowired
    private TBookRssHistoryMapper tBookRssHistoryMapper;

    @Override
    public List<TBookRssHistory> selectByUserIdList(Long userId) {
        return tBookRssHistoryMapper.selectByUserIdList(userId);
    }

    @Override
    public List<TBookRssHistoryVo> selectList(TBookRssHistory tBookRssHistory) {
        return tBookRssHistoryMapper.selectList(tBookRssHistory);
    }

    @Override
    public int deleteSelective(List<String> ids) {
        return tBookRssHistoryMapper.deleteSelective(ids);
    }

    @Override
    public int insertSelective(TBookRssHistory tBookRssHistory) {
        
        // 添加时判断是否已经订阅过了
        List<TBookRssHistoryVo> RsHistorys = tBookRssHistoryMapper.selectByBookList(tBookRssHistory.getBookId());
        for (TBookRssHistoryVo rssHistoryVo : RsHistorys){
            if(rssHistoryVo != null && rssHistoryVo.getUserId().equals(tBookRssHistory.getUserId())){
                throw new ServiceException("你已订阅过该图书了,请勿重复订阅！！");
            }
        }
        return tBookRssHistoryMapper.insertSelective(tBookRssHistory);
    }

    @Override
    public TBookRssHistoryVo selectByBookId(Integer id) {
        return tBookRssHistoryMapper.selectByBookId(id);
    }


}
