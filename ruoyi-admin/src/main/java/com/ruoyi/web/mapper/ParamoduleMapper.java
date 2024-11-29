package com.ruoyi.web.mapper;

import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface ParamoduleMapper {
    ArrayList<String> finddata();

    ArrayList<Integer> finddatanum();
}
