package com.ruoyi.web.controller.usermassage;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.web.domain.TNotice;
import com.ruoyi.web.service.TNoticeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 公告信息查看
 */
@Controller
@RequestMapping("userMessages/noticeSelective")
public class NoticeSelectiveController extends BaseController {

    @Autowired
    private TNoticeService tNoticeService;
    private static final Map<String,Object> map = new HashMap<>();

    private final String prefix = "userMessages/noticeSelective";
    @RequiresPermissions("userMessages:notiveSelective:view")
    @GetMapping
    public String noticeSelective(ModelMap modelMap){
        List<TNotice> tNotice = tNoticeService.selectList(new TNotice());
        modelMap.addAttribute("tnotices", tNotice);
        return prefix+"/list";
    }

    @RequiresPermissions("userMessages:notiveSelective:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TNotice tNotice){
        startPage();
        return getDataTable(tNoticeService.selectList(tNotice));
    }

    /**
     * 跳转查看公告信息
     */
    @RequiresPermissions("userMessages:noticeSelective:viewNotice")
    @GetMapping("/viewNotice/{id}")
    public String viewNotice(@PathVariable("id") Integer id) {
        TNotice tNotice = new TNotice();
        tNotice.setId(id);
        map.put("viewNotice", getDataTable(tNoticeService.selectList(tNotice)));
        return prefix + "/viewNotice";
    }

    /**
     * 查看公告信息
     */
    @RequiresPermissions("userMessages:notiveSelective:viewNotice")
    @GetMapping("/viewNotice")
    @ResponseBody
    public TableDataInfo viewNoticeList() {
        TableDataInfo viewNotice = (TableDataInfo) map.get("viewNotice");
        startPage();
        return viewNotice;
    }

}
