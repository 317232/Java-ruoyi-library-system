package com.ruoyi.web.domain.vo;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.web.domain.TMessage;
import lombok.Data;

import java.util.Date;

@Data
public class TMessageVo extends TMessage {
    @Excel(name="用户名")
    private String userName;
    private Date createStartTime;
    private Date createEndTime;
}
