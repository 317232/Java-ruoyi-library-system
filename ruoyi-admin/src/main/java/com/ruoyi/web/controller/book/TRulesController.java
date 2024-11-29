package com.ruoyi.web.controller.book;

import com.google.common.collect.Lists;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.web.domain.TRules;
import com.ruoyi.web.service.TLibraryService;
import com.ruoyi.web.service.TRulesService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("books/rules")
public class TRulesController extends BaseController {
    @Autowired
    private TRulesService tRulesService;

    @Autowired
    private TLibraryService tLibraryService;

    private final String prefix = "books/rules";
    @RequiresPermissions("books:rules:view")
    @GetMapping
    public String rules(ModelMap modelmap) {
        modelmap.addAttribute("rules",tRulesService.selectList(new TRules()));
        return prefix + "/list";
    }
    @RequiresPermissions("books:rules:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TRules tRules) {
        startPage();
        return getDataTable(tRulesService.selectList(tRules));
    }
    /**
     * 导出书籍列表
     */
    @RequiresPermissions("books:rules:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TRules tRules) {
        List<TRules> tRules1 = tRulesService.selectList(tRules);
        ExcelUtil<TRules> util = new ExcelUtil<>(TRules.class);
        return util.exportExcel(tRules1, "书籍数据");
    }

    /**
     * 新增书籍页面跳转
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增书籍
     */
    @RequiresPermissions("books:rules:add")
    @Log(title = "借阅规则添加", businessType = BusinessType.INSERT)
    @PostMapping("/addRules")
    @ResponseBody
    public AjaxResult addSave(TRules tRules) {
        return toAjax(tRulesService.insertSelective(tRules));
    }

    /**
     * 修改借阅规则信息
     */
    @RequiresPermissions("books:rules:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap) {
        TRules tRules = tRulesService.selectByPrimaryKey(id);
        mmap.addAttribute("Rules",tRules);
        return prefix + "/edit";
    }

    /**
     * 修改保存书籍信息
     */
    @RequiresPermissions("books:rules:edit")
    @Log(title = "规则修改", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TRules tRules) {
        return toAjax(tRulesService.updateByPrimaryKeySelective(tRules));
    }

    /**
     * 删除书籍
     */
    @RequiresPermissions("books:rules:remove")
    @Log(title = "规则删除", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String[] ids) {
        return toAjax(tRulesService.deleteByPrimaryKey(Lists.newArrayList(ids)));
    }
}
