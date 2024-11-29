package com.ruoyi.web.service.impl;

import com.ruoyi.web.domain.TBorrowCard;
import com.ruoyi.web.domain.vo.TBorrowCardVo;
import com.ruoyi.web.mapper.TBorrowCardMapper;
import com.ruoyi.web.service.TBorrowCardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class TBorrowCardServiceImpl implements TBorrowCardService {

    @Autowired
    private TBorrowCardMapper tBorrowCardMapper;

    @Override
    public int deleteByPrimaryKey(List<String> ids) {
        return tBorrowCardMapper.deleteByPrimaryKey(ids);
    }

    @Override
    public int insertSelective(TBorrowCard record) {
        return tBorrowCardMapper.insertSelective(record);
    }

    @Override
    public List<TBorrowCardVo> selectList(TBorrowCardVo tBorrowCardVo) {
        return tBorrowCardMapper.selectList(tBorrowCardVo);
    }

    @Override
    public List<TBorrowCard> selectByUserAll(Long id) {
        return tBorrowCardMapper.selectByUserAll(id);
    }

    @Override
    public TBorrowCard selectByPrimaryKey(Integer id) {
        return tBorrowCardMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<TBorrowCard> selectByUserIdCard(Long id) {
        return tBorrowCardMapper.selectByUserIdCard(id);
    }

    @Override
    public int updateByPrimaryKeySelective(TBorrowCard record) {
        return tBorrowCardMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public TBorrowCard selectByPrimaryUserId(Long id) {
        return tBorrowCardMapper.selectByPrimaryUserId(id);
    }

}
