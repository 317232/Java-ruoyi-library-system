package com.ruoyi.web.service;

import com.ruoyi.web.domain.TSysRole;

import java.util.List;

public interface UsersService {
    List<TSysRole> SysRoleList();

    TSysRole SysRoleByPrimaryKey(Integer id);
}
