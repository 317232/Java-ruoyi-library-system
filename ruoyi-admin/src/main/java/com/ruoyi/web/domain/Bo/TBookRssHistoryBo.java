package com.ruoyi.web.domain.Bo;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.web.domain.TBookRssHistory;
import lombok.Data;

import java.util.Date;
@Data
public class TBookRssHistoryBo extends TBookRssHistory {

    @Excel(name = "开始时间", dateFormat = "yyyy:MM:dd")
    private Date createStartTime;


    @Excel(name = "结束时间", dateFormat = "yyyy:MM:dd")
    private Date createEndTime;
}
