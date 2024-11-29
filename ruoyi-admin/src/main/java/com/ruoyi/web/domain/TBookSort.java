package com.ruoyi.web.domain;

import com.ruoyi.common.annotation.Excel;
import lombok.Data;

@Data
public class TBookSort {
    @Excel(name = "图书分类编号")
    private Integer id;
    @Excel(name = "分类名")
    private String name;
    @Excel(name = "描述")
    private String description;

    private Integer isDelete;
}