package com.ruoyi.web.controller.book;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.web.domain.Bo.TBorrowBookBo;
import com.ruoyi.web.service.TBooksService;
import com.ruoyi.web.service.TBorrowBooksService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("books/borrowSelective")
public class TBorrowSelectiveController extends BaseController {


    private final String prefix = "books/borrowSelective";

    private static final Map<String,Object> map = new HashMap<>();

    @Autowired
    private TBooksService tBooksService;

    @Autowired
    private TBorrowBooksService tBorrowBooksService;

    //
    @RequiresPermissions("books:borrowSelective:view")
    @GetMapping
    public String book() {
        return prefix + "/list";
    }

    @RequiresPermissions("books:borrowSelevtive:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TBorrowBookBo tBorrowBooksBo) {
        startPage();
        // 如果状态为1才显示
        return getDataTable(tBorrowBooksService.selectList(tBorrowBooksBo));
    }
}
