package com.ruoyi.web.controller.usermassage;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.web.controller.system.SysProfileController;
import com.ruoyi.web.service.TBorrowCardService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 用户个人信息
 */
@Controller
@RequestMapping("userMessages/userPasonalMessage")
public class UserPasonalMessageController extends BaseController {

    @Autowired
    private ISysUserService userService;

    @Autowired
    private TBorrowCardService tBorrowCardService;
    private final String prefix = "userMessages/userPasonalMessage";

    private static final Logger log = LoggerFactory.getLogger(SysProfileController.class);


    @RequiresPermissions("userMessages:userPasonalMessage:view")
    @GetMapping
    public String view(ModelMap mmap){
        SysUser user = getSysUser();
        mmap.addAttribute("user", user);
        mmap.addAttribute("roleGroup", userService.selectUserRoleGroup(user.getUserId()));
        mmap.addAttribute("postGroup", userService.selectUserPostGroup(user.getUserId()));
        return prefix + "/list";
    }

    @RequiresPermissions("userMessages:userPasonalMessage:view")
    @PostMapping("/list")
    @ResponseBody
    public SysUser list(){
        SysUser user = getSysUser();
        startPage();
        return userService.selectUserById(user.getUserId());
    }
}
