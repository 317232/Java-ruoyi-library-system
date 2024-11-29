package com.ruoyi.web.domain;

import com.ruoyi.common.annotation.Excel;
import lombok.Data;

@Data
public class TBorrowCard {
    @Excel(name = "借阅卡编号")
    private Integer id;
    @Excel(name = "用户编号")
    private Long userId;
    @Excel(name = "规则编号")
    private Integer ruleId;
    @Excel(name = "状态")
    private Short status;

    private Integer isDelete;
}