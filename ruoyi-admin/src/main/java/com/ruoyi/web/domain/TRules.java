package com.ruoyi.web.domain;

import com.ruoyi.common.annotation.Excel;
import lombok.Data;

@Data
public class TRules {
    @Excel(name = "规则编号")
    private Integer id;
    @Excel(name = "规则名")
    private String rulesName;
    @Excel(name = "借阅数")
    private Integer borrowNum;
    @Excel(name = "借阅天数")
    private Integer limitDay;
    @Excel(name = "可借阅图书馆")
    private String borrowLibrary;
    @Excel(name = "逾期金额")
    private Long overtimeFee;

    private Integer isDelete;
}