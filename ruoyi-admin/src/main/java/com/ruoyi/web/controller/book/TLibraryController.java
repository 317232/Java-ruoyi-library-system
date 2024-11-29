package com.ruoyi.web.controller.book;

import com.google.common.collect.Lists;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.web.domain.TLibrary;
import com.ruoyi.web.service.TLibraryService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("books/library")
public class TLibraryController extends BaseController {

    @Autowired
    private TLibraryService tLibraryService;

    private final String prefix = "books/library";


    @RequiresPermissions("books:library:view")
    @GetMapping
    public String library() {
        return prefix + "/list";
    }

    @RequiresPermissions("books:library:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TLibrary tLibrary) {
        startPage();
        return getDataTable(tLibraryService.selectList(tLibrary));
    }

    /**
     * 导出图书馆数据
     *
     * @param tLibrary
     * @return
     */
    @PostMapping("/export")
    @RequiresPermissions("books:library:export")
    @ResponseBody
    public AjaxResult export(TLibrary tLibrary){
        List<TLibrary> tLibraries = tLibraryService.selectList(tLibrary);
        ExcelUtil<TLibrary> util = new ExcelUtil<>(TLibrary.class);
        return util.exportExcel(tLibraries, "图书馆数据");
    }

    /**
     * 新增书籍页面跳转
     */
    @RequiresPermissions("books:library:add")
    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("librarys", tLibraryService.selectList(null));
        return prefix + "/add";
    }

    /**
     * 新增书籍
     */
    @RequiresPermissions("books:library:add")
    @Log(title = "图书馆添加", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TLibrary tLibrary) {
        return toAjax(tLibraryService.insertSelective(tLibrary));
    }

    /**
     * 修改书籍信息
     */
    @RequiresPermissions("books:library:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap) {
        TLibrary tLibrary = tLibraryService.selectByPrimaryKey(id);
        mmap.addAttribute("librarys", tLibrary);
        return prefix + "/edit";
    }

    /**
     * 修改保存
     * @param tLibrary
     * @return
     */

    @RequiresPermissions("books:library:edit")
    @PostMapping("/edit")
    @ResponseBody
    public  AjaxResult editSave(TLibrary tLibrary){
        return toAjax(tLibraryService.updateByPrimaryKeySelective(tLibrary));
    }

    /**
     * 删除图书馆
     */
    @RequiresPermissions("books:library:remove")
    @Log(title = "图书馆删除", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String[] ids) {
        return toAjax(tLibraryService.deleteByPrimaryKey(Lists.newArrayList(ids)));
    }

}
