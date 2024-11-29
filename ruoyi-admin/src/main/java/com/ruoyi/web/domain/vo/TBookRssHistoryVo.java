package com.ruoyi.web.domain.vo;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.web.domain.TBookRssHistory;
import lombok.Data;

import java.util.Date;

@Data
public class TBookRssHistoryVo extends TBookRssHistory {
    @Excel(name = "借阅者")
    private String userName;
    @Excel(name = "书籍名")
    private String bookName;
    @Excel(name = "作者")
    private String author;
    @Excel(name = "所在图书馆")
    private String libraryName;
    @Excel(name = "开始时间", dateFormat = "yyyy:MM:dd")
    private Date createStartTime;
    @Excel(name = "结束时间", dateFormat = "yyyy:MM:dd")
    private Date createEndTime;
}
