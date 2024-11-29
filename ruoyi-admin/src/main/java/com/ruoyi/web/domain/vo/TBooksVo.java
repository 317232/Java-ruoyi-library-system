package com.ruoyi.web.domain.vo;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.web.domain.TBooks;

import lombok.Data;

@Data
public class TBooksVo extends TBooks {

    @Excel(name = "所在图书馆")
    private String libraryName;

    @Excel(name = "所属分类")
    private String sortName;

}
