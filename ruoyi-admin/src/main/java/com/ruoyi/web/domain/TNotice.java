package com.ruoyi.web.domain;

import com.ruoyi.common.annotation.Excel;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Data
public class TNotice {
    @Excel(name = "公告编号")
    private Integer id;
    @Excel(name = "标题")
    private String title;
    @Excel(name = "内容")
    private String detail;
    @Excel(name = "发布日期")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime publishDate;
}