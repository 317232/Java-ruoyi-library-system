package com.ruoyi.web.controller.book;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.web.domain.Bo.TBorrowBookBo;
import com.ruoyi.web.domain.TBorrowBooks;
import com.ruoyi.web.service.TBooksService;
import com.ruoyi.web.service.TBorrowBooksService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("books/returntable")
public class TReturnTableController extends BaseController {
    @Autowired
    private TBorrowBooksService tBorrowBooksService;

    @Autowired
    private TBooksService tBooksService;

    private final String prefix = "books/returntable";

    /**
     * 归还报表
     * @return
     */
    @RequiresPermissions("books:returntable:view")
    @GetMapping
    public String table(){
        return prefix + "/list";
    }

    /**
     * 报表跳转
     * @param tBorrowBookBo
     * @return
     */
    @RequiresPermissions("books:returntable:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo tableList(TBorrowBookBo tBorrowBookBo){
        startPage();
        return getDataTable(tBorrowBooksService.selectList(tBorrowBookBo));
    }


    @GetMapping("/echarts")
    @RequiresPermissions("books:returntable:echarts")
    public String show(ModelMap mmap){
        // 一本书的借阅天数，合理借阅占比与统计逾期占比,
        ArrayList<Object> dateCount = new ArrayList<>();
        List<TBorrowBooks> tBorrowBooks = tBorrowBooksService.selectByViolation(null);
        for(TBorrowBooks tBorrowBook : tBorrowBooks){
            if(tBorrowBook.getEndDate() == null){
                continue;
            }
            Integer t = DateUtils.differentDaysByMillisecond(tBorrowBook.getBorrowDate(), tBorrowBook.getEndDate());
            dateCount.add(t); // [1,2,3] {书籍名：借阅天数}
        }

        mmap.put("dateCountJson", dateCount);


        return prefix + "charts";
    }

    /**
     * 导出书籍列表
     */
    @RequiresPermissions("books:returntable:export")
    @Log(title = "归还报表导出", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TBorrowBookBo tBorrowBookBo) {
        List<TBorrowBookBo> tBorrowBookBos = tBorrowBooksService.selectList(tBorrowBookBo);
        ExcelUtil<TBorrowBookBo> util = new ExcelUtil<>(TBorrowBookBo.class);
        return util.exportExcel(tBorrowBookBos, "归还报表数据");
    }
}
