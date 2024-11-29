package com.ruoyi.web.domain;

import com.ruoyi.common.annotation.Excel;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Data
public class TMessage {
    @Excel(name = "留言编号")
    private Integer id;
    @Excel(name = "借阅证编号")
    private Integer cardId;
    @Excel(name = "留言内容")
    private String content;
    @Excel(name = "发布日期")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH-mm-ss")
    private LocalDateTime publicDate;
    private Integer isDelete;
}