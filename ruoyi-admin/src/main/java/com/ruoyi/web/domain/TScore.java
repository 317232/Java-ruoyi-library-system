package com.ruoyi.web.domain;

import lombok.Data;

@Data
public class TScore {
    private Integer id;

    private Integer score;

    private Integer cardId;

    private String grade;

    private Integer nextRuleId;

    private Integer isDelete;

}
