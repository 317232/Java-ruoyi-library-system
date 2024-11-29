package com.ruoyi.web.service.impl;

import com.ruoyi.web.mapper.ParamoduleMapper;
import org.springframework.stereotype.Service;
import com.ruoyi.web.service.ParamoduleService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;

@Service
public class ParamoduleServiceImpl implements ParamoduleService {

    @Autowired
    private ParamoduleMapper paramoduleDao;
    //查出数据名
    @Override
    public ArrayList<String> finddata(){ return paramoduleDao.finddata(); }
    //查出数据数量
    @Override
    public ArrayList<Integer> finddatanum(){ return paramoduleDao.finddatanum(); }
}

