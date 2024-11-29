package com.ruoyi.web.service.impl;

import com.ruoyi.web.domain.TSysRole;
import com.ruoyi.web.mapper.UsersMapper;
import com.ruoyi.web.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class UsersServiceImpl implements UsersService {
    @Autowired
    private UsersMapper usersMapper;

    @Override
    public List<TSysRole> SysRoleList() {
        return usersMapper.SysRoleList();
    }

    @Override
    public TSysRole SysRoleByPrimaryKey(Integer id) {
        return usersMapper.SysRoleByPrimaryKey(id);
    }
}
