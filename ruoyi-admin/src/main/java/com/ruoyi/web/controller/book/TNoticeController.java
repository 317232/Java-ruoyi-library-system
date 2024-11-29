package com.ruoyi.web.controller.book;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.web.domain.TNotice;
import com.ruoyi.web.service.TNoticeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("books/tnotice")
public class TNoticeController extends BaseController {
    @Autowired
    private TNoticeService tNoticeService;

    private final String prefix = "books/tnotice";

    /**
     * 公告列表
     * @param mmap
     * @return
     */
    @RequiresPermissions("books:tnotice:view")
    @GetMapping
    public String tnotice(ModelMap mmap) {
        List<TNotice> tNotices = tNoticeService.selectList(null);
        mmap.addAttribute("tnotices", tNotices);
        return prefix + "/list";
    }

    /**
     * 列表跳转
     * @param tNotice
     * @return
     */
    @RequiresPermissions("books:tnotice:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TNotice tNotice) {
        startPage();
        return getDataTable(tNoticeService.selectList(tNotice));
    }

    /**
     * 导出公告
     * @param tNotice
     * @return
     */
    @RequiresPermissions("books:tnotice:export")
    @Log(title = "书籍导出", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TNotice tNotice) {
        List<TNotice> tNotices = tNoticeService.selectList(tNotice);
        ExcelUtil<TNotice > util = new ExcelUtil<>(TNotice.class);
        return util.exportExcel(tNotices, "公告数据");
    }

    /**
     * 添加公告
     * @param modelMap
     * @return
     */
    @GetMapping("/add")
    public String add(ModelMap modelMap) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        modelMap.addAttribute("min", sdf.format(new Date()));

        return prefix + "/add";
    }

    /**
     * 添加保存
     * @param tNotice
     * @return
     */
    @RequiresPermissions("books:tnotice:add")
    @Log(title = "公告添加", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TNotice tNotice) {
        // 获取当前的日期和时间
        LocalDateTime now = LocalDateTime.now();

        // 创建一个DateTimeFormatter，用于将LocalDateTime格式化为datetime-local格式
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");

        // 使用formatter将LocalDateTime格式化为字符串
        String formattedDateTime = now.format(formatter);

        LocalDateTime dateTime = LocalDateTime.parse(formattedDateTime, formatter);

        tNotice.setPublishDate(dateTime);

        return toAjax(tNoticeService.insertSelective(tNotice));
    }

    /**
     * 公告修改
     * @param id
     * @param mmap
     * @return
     */
    @RequiresPermissions("books:tnotice:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap) {
        TNotice tNotice = tNoticeService.selectByPrimaryId(id);
        mmap.addAttribute("Tnotices", tNotice);
        // 获取当前的日期和时间
        LocalDateTime now = LocalDateTime.now();

        // 创建一个DateTimeFormatter，用于将LocalDateTime格式化为datetime-local格式
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");

        // 使用formatter将LocalDateTime格式化为字符串
        String formattedDateTime = now.format(formatter);

        LocalDateTime dateTime = LocalDateTime.parse(formattedDateTime, formatter);

        mmap.addAttribute("publishDate",dateTime);

        return prefix + "/edit";
    }

    /**
     * 修改保存
     * @param tNotice
     * @return
     */
    @RequiresPermissions("books:tnotice:edit")
    @Log(title = "公告修改", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TNotice tNotice) {
        // 获取当前的日期和时间
        LocalDateTime now = LocalDateTime.now();

        // 创建一个DateTimeFormatter，用于将LocalDateTime格式化为datetime-local格式
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");

        // 使用formatter将LocalDateTime格式化为字符串
        String formattedDateTime = now.format(formatter);

        LocalDateTime dateTime = LocalDateTime.parse(formattedDateTime, formatter);
        tNotice.setPublishDate(dateTime);
        return toAjax(tNoticeService.updateByPrimaryKeySelective(tNotice));
    }

    /**
     * 删除公告
     * @param ids
     * @return
     */
    @RequiresPermissions("books:tnotice:remove")
    @Log(title = "留言删除", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(Integer ids) {
        return toAjax(tNoticeService.deleteTnoticeByPrimaryKey(ids));
    }


}
