package com.ruoyi.web.controller.usermassage;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.web.domain.TBorrowBooks;
import com.ruoyi.web.domain.TBorrowCard;
import com.ruoyi.web.service.TBorrowBooksService;
import com.ruoyi.web.service.TBorrowCardService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * 借阅信息记录
 */
@Controller
@RequestMapping("userMessages/borrowMessage")
public class BorrowMessageController extends BaseController {
    @Autowired
    private TBorrowBooksService tBorrowBooksService;

    @Autowired
    private ISysUserService iSysUserService;

    @Autowired
    private TBorrowCardService tBorrowCardService;

    private final String prefix = "userMessages/borrowMessage";


    @RequiresPermissions("userMessages:borrowMessage:view")
    @GetMapping
    public String borrowMessage() {
        return prefix + "/list";
    }

//    登录者的借阅卡编号，调用登录者的user_id,通过user_id找到card_id，在通过card_id进行找该用户的借阅信息
    @RequiresPermissions("userMessages:borrowMessage:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list() {

        Long id = getUserId();
        List<TBorrowCard> tBorrowCards =  tBorrowCardService.selectByUserAll(id);
        List<Integer> ids = new ArrayList<>();

        for(int i=0; i < tBorrowCards.size(); i++){
            ids.add(tBorrowCards.get(i).getId());
        }

        List<TBorrowBooks> allBooks = new ArrayList<>();
        TableDataInfo table = new TableDataInfo();
        for (Integer cardId : ids) {
            List<TBorrowBooks> tBorrowBooks = tBorrowBooksService.selectByPrimaryId(cardId); // 修改方法名以匹配实际逻辑
            allBooks.addAll(tBorrowBooks);
        }

        table.setRows(allBooks); // 设置包含所有借书记录的列表
        // 注意：如果需要分页信息，您应该在这里设置它
        startPage();
        return table;
    }




}
