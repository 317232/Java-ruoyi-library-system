package com.ruoyi.web.controller.book;

import com.google.common.collect.Lists;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.web.domain.TBookSort;
import com.ruoyi.web.service.TBookSortService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("books/booksort")
public class TBookSortController extends BaseController {

    private final String prefix = "books/booksort";

    @Autowired
    private TBookSortService tBookSortService;

    /**
     * 图书分类
     * @return
     */
    @RequiresPermissions("books:booksort:view")
    @GetMapping
    public String booksort() {
        return prefix + "/list";
    }

    /**
     * 图书分类列表
     * @param tBookSort
     * @return
     */
    @RequiresPermissions("books:booksort:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TBookSort tBookSort) {
        startPage();
        return getDataTable(tBookSortService.selectList(tBookSort));
    }

    /**
     * 导出书籍分类列表
     */
    @RequiresPermissions("books:booksort:export")
    @Log(title = "书籍导出", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TBookSort tBookSort) {
        List<TBookSort> books = tBookSortService.selectList(tBookSort);
        ExcelUtil<TBookSort> util = new ExcelUtil<>(TBookSort.class);
        return util.exportExcel(books, "书籍分类数据");
    }


    /**
     * 新增书籍分类页面跳转
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增书籍分类
     */
    @RequiresPermissions("books:booksort:add")
    @Log(title = "书籍添加", businessType = BusinessType.INSERT)
    @PostMapping("/addBookSort")
    @ResponseBody
    public AjaxResult addSave(TBookSort tBookSort) {
        return toAjax(tBookSortService.insertSelective(tBookSort));
    }

    /**
     * 修改书籍分类信息
     */
    @RequiresPermissions("books:booksort:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap) {
        TBookSort tBookSort = tBookSortService.selectByPrimaryKey(id);
        mmap.addAttribute("tBookSort", tBookSort);
        return prefix + "/edit";
    }

    /**
     * 修改保存书籍分类信息
     */
    @RequiresPermissions("books:booksort:edit")
    @Log(title = "书籍修改", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TBookSort tBookSort) {
        return toAjax(tBookSortService.updateByPrimaryKeySelective(tBookSort));
    }

    /**
     * 删除书籍分类
     */
    @RequiresPermissions("books:booksort:remove")
    @Log(title = "书籍删除", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String[] ids) {
        return toAjax(tBookSortService.deleteByPrimaryKey(Lists.newArrayList(ids)));
    }

}
