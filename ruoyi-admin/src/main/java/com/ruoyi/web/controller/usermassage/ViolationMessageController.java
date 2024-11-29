package com.ruoyi.web.controller.usermassage;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.web.domain.Bo.TBorrowBookBo;
import com.ruoyi.web.domain.TBorrowBooks;
import com.ruoyi.web.domain.TBorrowCard;
import com.ruoyi.web.service.TBorrowBooksService;
import com.ruoyi.web.service.TBorrowCardService;
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

/**
 * 违章记录信息
 */
@Controller
@RequestMapping("userMessages/violationMessage")
public class ViolationMessageController extends BaseController {
    @Autowired
    private TBorrowBooksService tBorrowBooksService;

    @Autowired
    private TBorrowCardService tBorrowCardService;

    private final String prefix = "userMessages/violationMessage";


    @RequiresPermissions("userMessages:violationMessage:view")
    @GetMapping
    public String violationMessage(ModelMap modelMap) {
        TBorrowBookBo tBorrowBookBo = new TBorrowBookBo();
        modelMap.addAttribute("violations", tBorrowBooksService.selectList(tBorrowBookBo));
        return prefix + "/list";
    }

    @RequiresPermissions("userMessages:violationMessage:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list() {
        Long id = getUserId();
        List<TBorrowCard> tBorrowCards =  tBorrowCardService.selectByUserAll(id);
        List<Integer> ids = new ArrayList<>();

        for(int i=0; i < tBorrowCards.size(); i++){
            ids.add(tBorrowCards.get(i).getId());
        }

        TableDataInfo table = new TableDataInfo();
        List<TBorrowBooks> allNotice = new ArrayList<>();
        for (Integer cardId : ids) {
            List<TBorrowBooks> illegals = tBorrowBooksService.selectByViolation(cardId);// 修改方法名以匹配实际逻辑
            allNotice.addAll(illegals);
        }
        table.setRows(allNotice);
        startPage();
        return table;
    }

}
