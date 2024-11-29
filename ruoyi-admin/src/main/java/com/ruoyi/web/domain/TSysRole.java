package com.ruoyi.web.domain;

import lombok.Data;

@Data
public class TSysRole {
    private Integer userId;
    private Integer roleId;
    private String loginName;
    private String userName;
    private String email;
    private String phoneNumber;
    private String sex;
    private String password;
}
