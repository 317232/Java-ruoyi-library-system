package com.ruoyi.web.controller.usermassage;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.web.domain.TBorrowCard;
import com.ruoyi.web.domain.TMessage;
import com.ruoyi.web.domain.vo.TMessageVo;
import com.ruoyi.web.service.TBorrowCardService;
import com.ruoyi.web.service.TMessageService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

/**
 * 留言板
 */
@Controller
@RequestMapping("userMessages/messageBoard")
public class MessageBoardController extends BaseController {
    private static final Map<String,Object> map = new HashMap<>();

    @Autowired
    private TMessageService tMessageService;

    @Autowired
    private TBorrowCardService tBorrowCardService;

    public LocalDateTime df(){
        // 获取当前的日期和时间
        LocalDateTime now = LocalDateTime.now();

        // 创建一个DateTimeFormatter，用于将LocalDateTime格式化为datetime-local格式
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");

        // 使用formatter将LocalDateTime格式化为字符串
        String formattedDateTime = now.format(formatter);

        LocalDateTime dateTime = LocalDateTime.parse(formattedDateTime, formatter);

        return dateTime;
    }

    private final String prefix = "userMessages/messageBoard";
    @RequiresPermissions("userMessages:messageBoard:add")
    @GetMapping
    public String view(){
        return  prefix + "/add";
    }

    /**
     * 留言添加
     * @param mmap
     * @return
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        SysUser user = getSysUser();
        Long id = user.getUserId();
        TBorrowCard tBorrowCard =  tBorrowCardService.selectByPrimaryUserId(id);
        mmap.addAttribute("cardId",tBorrowCard);
        return prefix + "/add";
    }

    /**
     * 留言添加保存
     * @param tMessage
     * @return
     */
    @RequiresPermissions("userMessages:messageBoard:add")
    @Log(title = "留言添加", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addMessage(TMessage tMessage)
    {

        Long id = getUserId();
        TBorrowCard tBorrowCard = tBorrowCardService.selectByPrimaryUserId(id);
        // 如普通用户没有借阅卡，先去办理借阅卡
        if(tBorrowCard.getId() == null){
            throw new ServiceException("你还没有借阅卡请先去办理借阅卡");
        }
        tMessage.setCardId(tBorrowCard.getId());
        return toAjax(tMessageService.insertSelective(tMessage));
    }


    /**
     * 跳转查看借阅信息
     */
    @RequiresPermissions("userMessages:messageBoard:viewmessage")
    @GetMapping("/viewmessage")
    public String viewmessage() {

        return prefix + "/viewmessage";
    }

    /**
     * 查看留言信息
     */
    @RequiresPermissions("userMessages:messageBoard:viewmessage")
    @PostMapping("/viewmessage")
    @ResponseBody
    public TableDataInfo viewmessageList(TMessageVo tMessageVo) {
        startPage();
        return getDataTable(tMessageService.selectList(tMessageVo));
    }

}
