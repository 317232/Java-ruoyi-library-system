package com.ruoyi.web.controller.book;

import com.google.common.collect.Lists;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.web.domain.TBorrowCard;
import com.ruoyi.web.domain.TRules;
import com.ruoyi.web.domain.vo.TBorrowCardVo;
import com.ruoyi.web.service.TBorrowCardService;
import com.ruoyi.web.service.TRulesService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("books/borrowcard")
public class TBorrowCardController extends BaseController {

    @Autowired
    private TBorrowCardService tBorrowCardService;

    @Autowired
    private TRulesService tRulesService;

    @Autowired
    private ISysUserService userService;

    private final String prefix = "books/borrowcard";

    @RequiresPermissions("books:borrowcard:view")
    @GetMapping
    public String borrowcard(ModelMap modelMap) {
        List<TRules> tRules = tRulesService.selectList(null);
        modelMap.addAttribute("user", userService.selectUserList(new SysUser()));
        modelMap.addAttribute("rules",tRules);
        return prefix + "/list";
    }

    @RequiresPermissions("books:borrowcard:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TBorrowCardVo tBorrowCardVo) {
        startPage();
        return getDataTable(tBorrowCardService.selectList(tBorrowCardVo));
    }

    /**
     * 导出书籍列表
     */
    @RequiresPermissions("books:borrowcard:export")
    @Log(title = "借阅证导出", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TBorrowCardVo tBorrowCardVo) {
        List<TBorrowCardVo> tBorrowCards = tBorrowCardService.selectList(tBorrowCardVo);
        ExcelUtil<TBorrowCardVo> util = new ExcelUtil<>(TBorrowCardVo.class);
        return util.exportExcel(tBorrowCards, "借阅卡记录");
    }

    /**
     * 新增书籍页面跳转
     */
    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("rules", tRulesService.selectList(null));
        model.addAttribute("users", userService.selectUserList(new SysUser()));
        return prefix + "/add";
    }

    /**
     * 新增书籍
     */
    @RequiresPermissions("books:borrowcard:add")
    @Log(title = "借阅证添加", businessType = BusinessType.INSERT)
    @PostMapping("/addBorrowCard")
    @ResponseBody
    public AjaxResult addSave(TBorrowCard tBorrowCard) {
        return toAjax(tBorrowCardService.insertSelective(tBorrowCard));
    }

    /**
     * 修改书籍信息
     */
    @RequiresPermissions("books:borrowcard:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap) {
        TBorrowCard tBorrowCard = tBorrowCardService.selectByPrimaryKey(id);
        mmap.addAttribute("tBorrowCard", tBorrowCard);
        mmap.addAttribute("tRules",tRulesService.selectByPrimaryKey(tBorrowCard.getRuleId()));
        mmap.addAttribute("rules",tRulesService.selectList(null));
        mmap.addAttribute("user",userService.selectUserById(Long.valueOf(tBorrowCard.getUserId())));
        mmap.addAttribute("users",userService.selectUserList(new SysUser()));
        return prefix + "/edit";
    }

    /**
     * 修改保存书籍信息
     */
    @RequiresPermissions("books:borrowcard:edit")
    @Log(title = "借阅证修改", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TBorrowCard tBorrowCard) {
        return toAjax(tBorrowCardService.updateByPrimaryKeySelective(tBorrowCard));
    }

    /**
     * 删除书籍
     */
    @RequiresPermissions("books:borrowcard:remove")
    @Log(title = "借阅证删除", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String[] ids) {
        return toAjax(tBorrowCardService.deleteByPrimaryKey(Lists.newArrayList(ids)));
    }

}
