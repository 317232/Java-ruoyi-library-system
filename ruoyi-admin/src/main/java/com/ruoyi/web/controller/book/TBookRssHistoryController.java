package com.ruoyi.web.controller.book;

import com.google.common.collect.Lists;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.web.domain.TBooks;
import com.ruoyi.web.domain.vo.TBookRssHistoryVo;
import com.ruoyi.web.service.TBookRssHistoryService;
import com.ruoyi.web.service.TBooksService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("books/bookrsshistory")
public class TBookRssHistoryController extends BaseController {

    @Autowired
    private TBookRssHistoryService tBookRssHistoryService;

    @Autowired
    private TBooksService tBooksService;

    @Autowired
    private ISysUserService userService;

    private final String prefix = "books/bookrsshistory";

    /**
     * 图书订阅列表
     * @return
     */
    @RequiresPermissions("books:bookrsshistory:view")
    @GetMapping
    public String view() {
        return prefix + "/list";
    }

    /**
     * 图书订阅跳转
     * @param tBookRssHistoryVo
     * @return
     */
    @PostMapping("/list")
    @ResponseBody
    @RequiresPermissions("books:bookrsshistory:list")
    public TableDataInfo list(TBookRssHistoryVo tBookRssHistoryVo){
        startPage();
        return getDataTable(tBookRssHistoryService.selectList(tBookRssHistoryVo));
    }


    @GetMapping("/add")
    @RequiresPermissions("books:bookrsshistory:add")
    public String add(ModelMap mmap){
        Long userId = ShiroUtils.getUserId();
        List<SysUser> users = userService.selectUserList(new SysUser());

        mmap.put("userId", userId);
        mmap.put("userName", getSysUser().getUserName());
        mmap.put("users",users);
        // 显示所有未上架的书籍
        List<TBooks> tBooks = tBooksService.selectByStatus2(null);

        mmap.put("books", tBooks);
        mmap.put("bookId", tBooks.get(0).getId());
        return prefix + "/add";
    }

    @PostMapping("/add")
    @RequiresPermissions("books:bookrsshistory:add")
    @ResponseBody
    public AjaxResult addsave(TBookRssHistoryVo tBookRssHistoryVo){
        return toAjax(tBookRssHistoryService.insertSelective(tBookRssHistoryVo));
    }


    /**
     * 订阅删除
     * @param ids
     * @return
     */
    @ResponseBody
    @PostMapping("/remove")
    @RequiresPermissions("book:bookrsshistory:remove")
    public AjaxResult remove(String[] ids){
        return toAjax(tBookRssHistoryService.deleteSelective(Lists.newArrayList(ids)));
    }


}
