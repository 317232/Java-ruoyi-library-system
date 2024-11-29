package com.ruoyi.web.controller.usermassage;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.web.domain.TBorrowCard;
import com.ruoyi.web.domain.TRules;
import com.ruoyi.web.service.TBorrowCardService;
import com.ruoyi.web.service.TRulesService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("userMessages/borrowCard")
public class BorrowCardController extends BaseController {


    private final String prefix = "userMessages/borrowCard";

    @Autowired
    private TBorrowCardService tBorrowCardService;

    @Autowired
    private TRulesService tRulesService;

    @Autowired
    private ISysUserService userService;

    @RequiresPermissions("userMessages:borrowCard:add")
    @GetMapping("/add")
    public String add( ModelMap mmap) {
        Long userId = getUserId();
        List<TRules> tRules = tRulesService.selectList(null);
        SysUser user = userService.selectUserById(userId);
        // 取身份信息
        mmap.put("user", user);
        mmap.put("rules",tRules);
        return prefix + "/add";
    }

    @RequiresPermissions("userMessages:borrowCard:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult list(TBorrowCard tBorrowCard) {
        return toAjax(tBorrowCardService.insertSelective(tBorrowCard));
    }


    /**
     * 跳转查看借阅信息
     */
    @RequiresPermissions("userMessages:borrowCard:viewBorrowCard")
    @GetMapping
    public String viewBorrowCard() {
        return prefix + "/viewBorrowCard";
    }

    /**
     * 查看个人借阅卡信息
     */
    @RequiresPermissions("userMessages:borrowCard:viewBorrowCard")
    @PostMapping("/viewBorrowCard")
    @ResponseBody
    public TableDataInfo viewmessageList() {
        Long userId = getUserId();
        List<TBorrowCard> tBorrowCard = tBorrowCardService.selectByUserIdCard(userId);
        startPage();
        return getDataTable(tBorrowCard);
    }
}
