package com.ruoyi.web.controller.book;

import com.google.common.collect.Lists;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.web.domain.Tillegal;
import com.ruoyi.web.service.TillegalService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.List;

@RequestMapping("books/illegal")
@Controller
public class TillegalController extends BaseController {

    @Autowired
    private TillegalService tillegalService;

    private final String prefix = "books/illegal";

    @GetMapping
    @RequiresPermissions("books:illegal:view")
    public String view(){ return prefix + "/list";}

    @PostMapping("/list")
    @ResponseBody
    @RequiresPermissions("books:illegal:list")
    public TableDataInfo list(String content){
        startPage();
        return getDataTable(tillegalService.SelectList(content));
    }

    @PostMapping("/export")
    @RequiresPermissions("books:illegal:export")
    @ResponseBody
    public AjaxResult export(String content){
        List<Tillegal> tillegalList = tillegalService.SelectList(content);
        System.out.println(tillegalList);
        ExcelUtil<Tillegal> util = new ExcelUtil<>(Tillegal.class);
        return util.exportExcel(tillegalList, "敏感词数据");
    }



    @GetMapping("/add")
    @RequiresPermissions("books:illegal:add")
    public String add(ModelMap mmap){
        Date currentDate = new Date();
        LocalDateTime nowDate = dateformat(currentDate);
        mmap.addAttribute("currentDate", nowDate);
        return prefix + "/add";
    }

    @RequiresPermissions("books:illegal:add")
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Tillegal tillegal) {
        return toAjax(tillegalService.insertSelective(tillegal));
    }

    @RequiresPermissions("books:illegal:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap) {
        Tillegal tillegal = tillegalService.selectByPrimaryKey(id);
        mmap.addAttribute("tillegal", tillegal);
        return prefix + "/edit";
    }

    @RequiresPermissions("books:illegal:edit")
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Tillegal tillegal) {
        return toAjax(tillegalService.updateByPrimaryKeySelective(tillegal));
    }

    @RequiresPermissions("books:illegal:remove")
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String[] ids){
        return toAjax(tillegalService.deleteByPrimaryKey(Lists.newArrayList(ids)));
    }

    public LocalDateTime dateformat(Date date){
        Instant ist = date.toInstant();
        ZonedDateTime zdt = ist.atZone(ZoneId.systemDefault());
        return zdt.toLocalDateTime();
    }
}
