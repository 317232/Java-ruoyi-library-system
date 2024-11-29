package com.ruoyi.web.controller.book;

import com.google.common.collect.Lists;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.web.domain.TMessage;
import com.ruoyi.web.domain.vo.TBorrowCardVo;
import com.ruoyi.web.domain.vo.TMessageVo;
import com.ruoyi.web.service.TBorrowCardService;
import com.ruoyi.web.service.TMessageService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("books/messageBoard")
public class TMessageBoardController extends BaseController {

    private final String prefix = "books/messageBoard";

    @Autowired
    private TMessageService tMessageService;

    @Autowired
    private TBorrowCardService tBorrowCardService;

    /**
     * 留言板
     * @return
     */
    @RequiresPermissions("books:messageBoard:view")
    @GetMapping
    public String view() {
        return prefix + "/list";
    }

    /**
     * 留言板列表
     * @param tMessageVo
     * @return
     */
    @RequiresPermissions("books:messageBoard:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TMessageVo tMessageVo) {
        startPage();
        return getDataTable(tMessageService.selectList(tMessageVo));
    }

    @RequiresPermissions("books:messageBoard:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TMessageVo tMessageVo) {
        List<TMessageVo> tMessages = tMessageService.selectList(tMessageVo);
        ExcelUtil<TMessageVo> util = new ExcelUtil<>(TMessageVo.class);
        return util.exportExcel(tMessages, "留言数据");
    }

    /**
     * 留言的新增和修改给到管理员去用，普通用户无法使用
     * @param mmap
     * @return
     */
    @RequiresPermissions("books:messageBoard:add")
    @GetMapping("/add")
    public String add(ModelMap mmap){
        Long userId = getUserId();

        // 借阅卡列表-对借阅卡的状态进行判定，只有启用状态可以借阅
        List<TBorrowCardVo> tBorrowCards = tBorrowCardService.selectList(null);

        mmap.addAttribute("cards", tBorrowCards);
        return prefix + "/add";

    }

    @PostMapping("/add")
    @RequiresPermissions("books:messageBoard:add")
    @ResponseBody
    public AjaxResult addsave(TMessageVo tMessageVo){
        return toAjax(tMessageService.insertSelective(tMessageVo));
    }

    @GetMapping("/edit/{id}")
    @RequiresPermissions("books:messageBoard:edit")
    public String edit(@PathVariable("id")Integer id, ModelMap mmap){

        TMessage tMessage = tMessageService.selectByPrimaryId(id);
        mmap.put("tMessage", tMessage);
        List<TBorrowCardVo> tBorrowCards = tBorrowCardService.selectList(null);
        mmap.addAttribute("cards", tBorrowCards);
        return prefix + "/edit";
    }

    @RequiresPermissions("books:messageBoard:edit")
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TMessage tMessage) {
        return toAjax(tMessageService.updateByPrimaryKeySelective(tMessage));
    }

    /**
     * 删除留言
     */
    @RequiresPermissions("books:messageBoard:remove")
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String[] ids) {
        return toAjax(tMessageService.deleteByPrimaryKey(Lists.newArrayList(ids)));
    }

}
