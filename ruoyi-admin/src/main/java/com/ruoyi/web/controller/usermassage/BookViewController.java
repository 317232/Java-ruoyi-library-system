package com.ruoyi.web.controller.usermassage;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ShiroUtils;
import com.ruoyi.system.service.ISysRoleService;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.web.domain.Bo.TBorrowBookBo;
import com.ruoyi.web.domain.*;
import com.ruoyi.web.domain.vo.TBookRssHistoryVo;
import com.ruoyi.web.domain.vo.TBooksVo;
import com.ruoyi.web.domain.vo.TBorrowCardVo;
import com.ruoyi.web.service.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.*;

/**
 * 图书查看
 */
@Controller
@RequestMapping("userMessages/bookView")
public class BookViewController extends BaseController {

    private static final Map<String,Object> map = new HashMap<>();

    @Autowired
    private TBooksService tBooksService;

    @Autowired
    private TBorrowBooksService tBorrowBooksService;

    @Autowired
    private TBorrowCardService tBorrowCardService;

    @Autowired
    private TRulesService tRulesService;

    @Autowired
    private TBookRssHistoryService tBookRssHistoryService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysRoleService roleService;


    private final String prefix = "userMessages/bookView";


    @RequiresPermissions("userMessages:bookView:view")
    @GetMapping
    public String book() {
        return prefix + "/list";
    }

    @RequiresPermissions("userMessages:bookView:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TBooksVo tBooksVo) {
        startPage();
        return getDataTable(tBooksService.selectList(tBooksVo));
    }

    /**
     * 跳转查看借阅信息
     */
    @RequiresPermissions("userMessages:bookView:viewborrow")
    @GetMapping("/viewBorrow/{id}")
    public String viewBorrow(@PathVariable("id") Integer id) {
        TBorrowBookBo tBorrowBooks =new TBorrowBookBo();
        tBorrowBooks.setBookId(id);
        map.put("viewborrow", getDataTable(tBorrowBooksService.selectList(tBorrowBooks)));
        return prefix + "/viewborrow";
    }

    /**
     * 查看借阅信息
     */
    @RequiresPermissions("userMessages:bookView:viewborrow")
    @GetMapping("/viewBorrow")
    @ResponseBody
    public TableDataInfo viewBorrowList() {
        TableDataInfo viewborrow = (TableDataInfo) map.get("viewborrow");
        startPage();
        return viewborrow;
    }

    /**
     *借阅图书
     */
    @RequiresPermissions("userMessages:bookView:borrow")
    @GetMapping("/borrow/{id}")
    public String borrow(@PathVariable("id") Integer id,ModelMap modelMap) {
        Long userId = getUserId();
        SysUser user = userService.selectUserById(userId);
        SysRole role = user.getRoles().get(0);

        // 借阅卡列表-对借阅卡的状态进行判定，只有启用状态可以借阅
        List<TBorrowCardVo> tBorrowCards = tBorrowCardService.selectList(null);
        // 将启用的放到一个新的表里
        List<TBorrowCardVo> tBorrowCardVo = new ArrayList<>();
        Map<Integer,String> userNames = new HashMap<>();
        try{
            // 对用户id进行判断，如果是超级管理员显示可用的所有用户的借阅卡，图书管理员显示普通用户和自身的，普通用户显示自身的借阅卡
            for(TBorrowCardVo tBorrowCard : tBorrowCards){
                if (tBorrowCard.getStatus() != 1 ){
                    if(role.getRoleId() == 1){
                        // 所有可用借阅卡id
                        tBorrowCardVo.add(tBorrowCard);
                    }else if (role.getRoleId() == 2 ){
                        // 自身的可用借阅卡id
                        if (tBorrowCard.getUserId().equals(userId)){
                            tBorrowCardVo.add(tBorrowCard);
                        }
                    }else if (role.getRoleId() == 3) {
                        SysUser t = userService.selectUserById(tBorrowCard.getUserId());
                        // 自身可用借阅卡id和普通用户借阅卡id
                        if(tBorrowCard.getUserId().equals(userId) && t.getRoleId() == 2){
                            tBorrowCardVo.add(tBorrowCard);
                        }
                    }
                }
            }
        }catch (NullPointerException e){
            System.out.println(e);
        }

        for(TBorrowCardVo tbc: tBorrowCardVo){
            userNames.put(tbc.getId(),tbc.getUserName());
        }
        modelMap.addAttribute("userName",user.getUserName());
        modelMap.addAttribute("borrowCards",tBorrowCardVo);
        // 显示一下借阅卡的用户名
        modelMap.addAttribute("userNames",userNames);
        // 书籍列表
        TBooks tBooks = tBooksService.selectByPrimaryKey(id);
        modelMap.addAttribute("books", tBooks);

        // 设置年月日
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        modelMap.addAttribute("min", sdf.format(new Date()));
        return prefix + "/borrow";

    }

    /**
     * 保存借阅书籍
     */
    @RequiresPermissions("userMessages:bookView:borrow")
    @Log(title = "书籍借阅", businessType = BusinessType.INSERT)
    @RequestMapping("/borrow")
    @ResponseBody
    public AjaxResult save(TBorrowBooks tBorrowBooks) {

        return toAjax(tBorrowBooksService.insertSelective(tBorrowBooks));
    }

    /**
     * 归还图书
     *
     */
    @RequiresPermissions("userMessages:bookView:returnBook")
    @GetMapping("/returnBook/{id}")
    public String returnBooks(@PathVariable("id") Integer id, ModelMap mmap) {
        // 归还图书是指归还实际归还日期为空的书籍，每次归还一本图书，没有查询到就是都已归还
        try{
            TBorrowBooks tBorrowBooks = tBorrowBooksService.selectByBookId(id);

            if(tBorrowBooks == null){
                // 退出表单
                throw new ServiceException("书籍未查询到");
            }

            // 书籍id查找到借阅卡id
            TBorrowCard tBorrowCard = tBorrowCardService.selectByPrimaryKey(tBorrowBooks.getCardId());
            Set<String> role = roleService.selectRoleKeys(ShiroUtils.getUserId());
            // 角色 为 管理员 可以 进行所有归还
            if(!role.contains("2")){
                if(!tBorrowCard.getUserId().equals(ShiroUtils.getUserId())){
                    throw new ServiceException("你无法归还你未借阅的图书，请联系管理员归还");
                }
            }

            // 借阅规则查找逾期日期
            TRules tRules = tRulesService.selectByPrimaryKey(tBorrowCard.getRuleId());

            // x 为已借阅借阅天数， y为规则限定的借阅天数
            Integer x = DateUtils.differentDaysByMillisecond(tBorrowBooks.getBorrowDate(), new Date());
            Integer y = tRules.getLimitDay();

            Date endDate = tBorrowBooks.getEndDate();
            Date currentDate = new Date();

            // 将 Date 转换为 Instant
            Instant instant = endDate.toInstant();
            Instant ist = currentDate.toInstant();

            // 使用系统默认时区将 Instant 转换为 ZonedDateTime
            ZonedDateTime zonedDateTime = instant.atZone(ZoneId.systemDefault());
            ZonedDateTime zdt = ist.atZone(ZoneId.systemDefault());

            // 从 ZonedDateTime 中提取 LocalDateTime（注意：这会丢失时区信息）
            LocalDateTime localDateTime = zonedDateTime.toLocalDateTime();
            LocalDateTime nowDate = zdt.toLocalDateTime();

            mmap.put("nowDate", nowDate);
            mmap.addAttribute("currentDate", nowDate);
            mmap.addAttribute("endDate", localDateTime);
            mmap.addAttribute("userId", getUserId());
            mmap.addAttribute("tBorrowBooks", tBorrowBooks);
            int t = y - x;
            if(t > 0){
                mmap.addAttribute("countday", y-x);
            }else{

                mmap.addAttribute("countday", "已逾期"+Math.abs(t)+"天");
            }

            // 跳转到目录下的映射文件
            return prefix + "/returnBook" ;
        } catch (ServiceException e){
            throw new ServiceException("该书籍你还未借阅不需要归还哦！");
        }catch (Exception ex){
            throw new ServiceException("发生其他错误，请联系管理员");
        }
    }

    /**
     * 借阅归还是否逾期
     */
    @RequiresPermissions("userMessages:bookView:returnSelect")
    @GetMapping("/returnSelect/{id}")
    public  String returnSelect(@PathVariable("id") Integer id,ModelMap mmap){

        // 通过BookId判断书籍是否逾期
        TBorrowBooks tBorrowBooks = tBorrowBooksService.selectByBookId(id);
        TBorrowCard tBorrowCard = tBorrowCardService.selectByPrimaryKey(tBorrowBooks.getCardId());

        TRules tRules = tRulesService.selectByPrimaryKey(tBorrowCard.getRuleId());

        Integer x = DateUtils.differentDaysByMillisecond(tBorrowBooks.getEndDate(),new Date());
        Integer y = tRules.getLimitDay();
        Integer daysOverdue = x - y;
        Long overdueFee = 0L;

        if(daysOverdue > 0){
            overdueFee = daysOverdue * tRules.getOvertimeFee();
            mmap.put("overdueFee", overdueFee);
            // 会话框，显示还钱，确定，会实现修改归还状态

        }

        mmap.put("illegal",x-y);
        mmap.put("nowDate", mmap.get("nowDate"));
        mmap.addAttribute("overtimeFee", overdueFee);
        mmap.addAttribute("tBorrowBooks", tBorrowBooks);
        return prefix + "/returnSelect";
    }


    /**
     * 保存归还的书籍
     */
    @RequiresPermissions("userMessages:bookView:returnBook")
    @Log(title = "书籍借阅", businessType = BusinessType.INSERT)
    @RequestMapping("/returnBook")
    @ResponseBody
    public AjaxResult returnSave(TBorrowBooks tBorrowBooks) {

        return toAjax(tBorrowBooksService.updateByPrimaryKeySelective(tBorrowBooks));
    }


    /*添加图书订阅功能
    // 添加选项框：询问用户是否确定要订阅该图书
    // 对订阅限制订阅数量
    // 时间在在实体类中设置为默认当前时间
     */
    @PostMapping("/addNotification/{id}")
    @RequiresPermissions("userMessages:bookView:notification")
    @ResponseBody
    public AjaxResult addNotification(@PathVariable("id") Integer id){
        TBooks tBooks = tBooksService.selectByPrimaryKey(id);
        if (tBooks == null) {
            return AjaxResult.error("这本书不存在");
        }
        if (tBooks.getStatus() != 2) {
            return AjaxResult.error("当前书籍不是未上架状态");
        }

        TBookRssHistoryVo tBookRssHistory = tBookRssHistoryService.selectByBookId(id);
        // 是否已订阅过该书籍
        if(tBookRssHistory != null && tBookRssHistory.getUserId().equals(ShiroUtils.getUserId())){
            return AjaxResult.error("你已订阅过该书籍，请勿重复订阅");
        }

        TBookRssHistory tBookRssHistoryNew = new TBookRssHistory();
        tBookRssHistoryNew.setBookId(id);
        tBookRssHistoryNew.setUserId(ShiroUtils.getUserId());
        tBookRssHistoryService.insertSelective(tBookRssHistoryNew);

        return AjaxResult.success("订阅成功");

    }
    /**
     * 跳转续借图书
     * @param mmap
     * @return
     */
    @RequiresPermissions("userMessages:bookView:renewBook")
    @GetMapping("/renewBook/{id}")
    public String renewBook(@PathVariable("id")Integer id, ModelMap mmap){
        // 显示有那些书籍需要续借，或者是根据数量发送一定的请求
        List<TBorrowBookBo> tBorrowBookBos = tBorrowBooksService.selectByViewList(ShiroUtils.getLoginName());
        // 借阅书籍 - 修改归还日期
        TBorrowBooks tBorrowBooks = tBorrowBooksService.selectByBookId(id);
        // 借阅卡 - useId判断
        TBorrowCard tBorrowCard = tBorrowCardService.selectByPrimaryKey(tBorrowBooks.getCardId());
        // 书籍 - 图书名
        TBooks tBooks = tBooksService.selectByPrimaryKey(id);
        // 是否为本人借阅
        if(!tBorrowCard.getUserId().equals(ShiroUtils.getUserId())){
            throw new ServiceException("不是你要续借的");
        }
        // 是否逾期
        int t = differentDays(new Date(), tBorrowBooks.getEndDate());
        if (t < 0){
            throw new ServiceException("已逾期，请先去归还吧！！");
        }else {
            mmap.put("countDay", t); // 剩余日期
        }
        mmap.put("id", tBorrowBooks.getId());
        mmap.put("bookId", tBorrowBooks.getBookId());
        mmap.put("cardId",tBorrowBooks.getCardId());
        mmap.put("endDate", tBorrowBooks.getEndDate());
        mmap.put("bookName", tBooks.getName());
        // 设置年月日
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        mmap.addAttribute("min", sdf.format(tBorrowBooks.getEndDate()));
        return prefix + "/renewBook";
    }

    @RequiresPermissions("userMessages:bookView:renewBook")
    @PostMapping("/renewBook")
    @ResponseBody
    public AjaxResult renewSave(TBorrowBooks tBorrowBooks) {
        return toAjax(tBorrowBooksService.updateByEndDate(tBorrowBooks));
    }

    // 计算时间差
    public static int differentDays(Date date1, Date date2)
    {
        return (int) ((date2.getTime() - date1.getTime()) / (1000 * 3600 * 24));
    }
}
