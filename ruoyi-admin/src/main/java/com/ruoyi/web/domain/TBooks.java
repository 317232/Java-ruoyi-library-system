package com.ruoyi.web.domain;

import com.ruoyi.common.annotation.Excel;

import lombok.Data;

@Data
public class TBooks {
    @Excel(name = "书籍编号")
    private Integer id;

    @Excel(name = "书籍名称")
    private String name;

    @Excel(name = "作者")
    private String author;

    private Integer libraryId;

    private Integer sortId;

    @Excel(name = "书籍位置")
    private String position;

    @Excel(name = "书籍状态")
    private Short status;

    @Excel(name = "书籍简介")
    private String description;

    private Integer isDelete;

}
