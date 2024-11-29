package com.ruoyi.web.domain;

import lombok.Data;

import java.util.Date;

@Data
public class TRssNotification {
    private Integer id;
    private Long userId;
    private String content;
    private Integer isRead;
    private Date createTime;
    private Integer isDelete;
}
