package com.ruoyi.web.domain.vo;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.web.domain.TRssNotification;
import lombok.Data;

import java.util.Date;

@Data
public class TRssNotificationVo extends TRssNotification {
    @Excel(name = "开始时间", dateFormat = "yyyy:MM:dd")
    private Date createStartTime;
    @Excel(name = "结束时间", dateFormat = "yyyy:MM:dd")
    private Date createEndTime;
    @Excel(name = "用户名")
    private String userName;
}
