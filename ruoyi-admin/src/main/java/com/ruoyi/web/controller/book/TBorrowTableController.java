package com.ruoyi.web.controller.book;

import com.alibaba.fastjson.JSON;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.web.domain.Bo.TBorrowBookBo;
import com.ruoyi.web.domain.vo.TBooksVo;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("books/borrowtable")
public class TBorrowTableController extends BaseController {

    @Autowired
    private TBorrowBooksService tBorrowBooksService;

    @Autowired
    private TBooksService tBooksService;

    private final String prefix = "books/borrowtable";

    @RequiresPermissions("books:borrowtable:view")
    @GetMapping
    public String table(){
        return prefix + "/list";
    }

    @RequiresPermissions("books:borrowtable:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo tableList(TBorrowBookBo tBorrowBooksBo){
        startPage();
        return getDataTable(tBorrowBooksService.selectList(tBorrowBooksBo));
    }

    /**
     * 导出书籍列表
     */
    @RequiresPermissions("books:borrowtable:export")
    @Log(title = "借阅报表导出", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TBorrowBookBo tBorrowBookBo) {
        List<TBorrowBookBo> tBorrowBookBos = tBorrowBooksService.selectList(tBorrowBookBo);
        ExcelUtil<TBorrowBookBo> util = new ExcelUtil<>(TBorrowBookBo.class);
        return util.exportExcel(tBorrowBookBos, "借阅报表数据");
    }

    @GetMapping("/echarts")
    @RequiresPermissions("books:borrowtable:echarts")
    public String show(ModelMap mmap){
        ArrayList<String> dataname = new ArrayList<>();
        ArrayList<Integer> datanum = new ArrayList<>();
        // 获取到的书籍信息和借阅数信息放入以上列表
        List<TBooksVo> tBook = tBooksService.findDataName();
        List<TBooksVo> tBooksVoList = tBooksService.selectList(null);
        for(TBooksVo tBooksVo: tBooksVoList){
            datanum.add(tBorrowBooksService.findDataNum(tBooksVo.getId()));
        }
        for(TBooksVo tBooksVo : tBook){
            dataname.add(tBooksVo.getName());
        }
        List<Map<String, Integer>> outerCount = new ArrayList<>();
        Map<String,Integer> Count = new HashMap<>();

        for (int i = 0; i < datanum.size(); i++){
            // key:书籍名， value:借阅数量
            Count.put(dataname.get(i),datanum.get(i));
        }


        String datanameJson = JSON.toJSONString(dataname);
        String datanumJson = JSON.toJSONString(datanum);
        String countJson = JSON.toJSONString(Count);

        System.out.println(datanameJson);
        System.out.println(datanumJson);
        System.out.println(countJson);

        mmap.put("datanameJson",datanameJson);
        mmap.put("datanumJson",datanumJson);
        mmap.put("countJson", countJson);

        return prefix + "/charts";
    }

}
