package com.ruoyi.web.domain;

import lombok.Data;

@Data
public class TUsers {
    private Integer userId;
    private String loginName;
    private String userName;
    private String email;
    private String phoneNumber;
    private String sex;
    private String password;
}
