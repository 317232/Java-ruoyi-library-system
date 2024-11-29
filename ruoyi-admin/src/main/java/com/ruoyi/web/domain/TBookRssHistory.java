package com.ruoyi.web.domain;

import lombok.Data;

import java.util.Date;

@Data
public class TBookRssHistory {
    private Integer id;
    private Long userId;
    private Integer bookId;

    private Date createTime;
    private Integer isDelete;
}
