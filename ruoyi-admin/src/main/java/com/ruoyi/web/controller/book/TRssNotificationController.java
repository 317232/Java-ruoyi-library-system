package com.ruoyi.web.controller.book;

import com.google.common.collect.Lists;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.web.domain.vo.TRssNotificationVo;
import com.ruoyi.web.service.TBooksService;
import com.ruoyi.web.service.TRssNotificationService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("books/SubNotification")
public class TRssNotificationController extends BaseController {

    @Autowired
    private TRssNotificationService tRssNotificationService;

    @Autowired
    private TBooksService tBooksService;

    private final String prefix = "books/SubNotification";

    @GetMapping
    @RequiresPermissions("books:SubNotification:view")
    public String view(){
        return prefix + "/list";
    }
    @PostMapping("/list")
    @RequiresPermissions("books:SubNotification:list")
    @ResponseBody
    public TableDataInfo list(TRssNotificationVo tRssNotificationVo){
        startPage();
        return getDataTable(tRssNotificationService.selectList(tRssNotificationVo));
    }

    @ResponseBody
    @PostMapping("/remove")
    @RequiresPermissions("book:SubNotification:remove")
    public AjaxResult remove(String[] ids){
        return toAjax(tRssNotificationService.deleteByPrimaryKey(Lists.newArrayList(ids)));
    }

    @PostMapping("/setRead")
    @RequiresPermissions("books:SubNotification:setRead")
    @ResponseBody
    public AjaxResult setRead(String bookName){

        return toAjax(tRssNotificationService.setRead(bookName + "已上架", ShiroUtils.getUserId()));
    }

}
