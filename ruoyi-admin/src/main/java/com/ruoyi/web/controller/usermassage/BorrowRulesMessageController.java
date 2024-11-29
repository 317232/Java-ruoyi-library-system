package com.ruoyi.web.controller.usermassage;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.web.domain.TRules;
import com.ruoyi.web.service.TRulesService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 借阅规则信息
 */
@Controller
@RequestMapping("userMessages/borrowRulesMessage")
public class BorrowRulesMessageController extends BaseController {
    @Autowired
    private TRulesService tRulesService;

    private final String prefix = "userMessages/borrowRulesMessage";

    @RequiresPermissions("userMessages:borrowRulesMessage:view")
    @GetMapping
    public String violationMessage(ModelMap modelMap) {
        TRules tRules = new TRules();
        modelMap.addAttribute("borrowRules", tRulesService.selectList(tRules));
        return prefix + "/list";
    }

    @RequiresPermissions("userMessages:borrowRulesMessage:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TRules tRules) {
        startPage();
        return getDataTable(tRulesService.selectList(tRules));
    }

}
