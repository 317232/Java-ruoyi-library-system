package com.ruoyi.web.service.impl;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.web.domain.TMessage;
import com.ruoyi.web.domain.Tillegal;
import com.ruoyi.web.domain.vo.TMessageVo;
import com.ruoyi.web.mapper.TBorrowCardMapper;
import com.ruoyi.web.mapper.TMessageMapper;
import com.ruoyi.web.mapper.TillegalMapper;
import com.ruoyi.web.service.TMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class TMessageServiceImpl implements TMessageService {
    @Autowired
    private TMessageMapper tMessageMapper;

    @Autowired
    private TBorrowCardMapper tBorrowCardMapper;

    @Autowired
    private TillegalMapper tillegalMapper;

    @Override
    public List<TMessageVo> selectList(TMessageVo tMessage) {
        return tMessageMapper.selectList(tMessage);
    }

    @Override
    public int insertSelective(TMessage record) {
        List<Tillegal> tillegals = tillegalMapper.SelectList("");
        for (Tillegal tillegal : tillegals){
            if (record.getContent().contains(tillegal.getContent())){
                throw new ServiceException("你输入的内容包含违禁词请重新输入！！！");
            }
        }
        return tMessageMapper.insertSelective(record);
    }

    @Override
    public List<TMessage> selectByPrimaryKey(Integer id) {
        return tMessageMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(TMessage tMessage) {
        return tMessageMapper.updateByPrimaryKeySelective(tMessage);
    }

    @Override
    public int deleteByPrimaryKey(List<String> ids) {
        return tMessageMapper.deleteByPrimaryKey(ids);
    }

    @Override
    public TMessageVo selectByPrimaryId(Integer id) {
        return tMessageMapper.selectByPrimaryId(id);
    }

}
