package com.ruoyi.web.mapper;

import com.ruoyi.web.domain.TSysRole;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UsersMapper {
    List<TSysRole> SysRoleList();

    TSysRole SysRoleByPrimaryKey(Integer id);
}
