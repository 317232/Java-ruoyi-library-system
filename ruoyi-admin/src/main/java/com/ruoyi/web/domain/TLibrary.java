package com.ruoyi.web.domain;

import com.ruoyi.common.annotation.Excel;
import lombok.Data;

@Data
public class TLibrary {
    @Excel(name = "图书馆编号")
    private Integer id;
    @Excel(name = "图书馆")
    private String name;
    @Excel(name = "简介")
    private String description;

    private Integer isDelete;
}