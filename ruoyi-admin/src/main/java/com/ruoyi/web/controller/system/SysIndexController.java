package com.ruoyi.web.controller.system;

import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.constant.ShiroConstants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysMenu;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.*;
import com.ruoyi.framework.shiro.service.SysPasswordService;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysMenuService;
import com.ruoyi.web.domain.Bo.TBorrowBookBo;
import com.ruoyi.web.domain.TBookRssHistory;
import com.ruoyi.web.domain.TBooks;
import com.ruoyi.web.domain.TBorrowCard;
import com.ruoyi.web.domain.TRssNotification;
import com.ruoyi.web.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 首页 业务处理
 * 
 * @author ruoyi
 */
@Controller
public class SysIndexController extends BaseController
{
    @Autowired
    private ISysMenuService menuService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private SysPasswordService passwordService;

    @Autowired
    private TBorrowCardService tBorrowCardService;

    @Autowired
    private TBorrowBooksService tBorrowBooksService;

    @Autowired
    private TBooksService booksService;

    @Autowired
    private TBookRssHistoryService tBookRssHistoryService;

    @Autowired
    private TRssNotificationService tRssNotificationService;
    // 系统首页
    @GetMapping("/index")
    public String index(ModelMap mmap)
    {
        // 取身份信息
        SysUser user = getSysUser();
        // 根据用户id取出菜单
        List<SysMenu> menus = menuService.selectMenusByUser(user);
        mmap.put("menus", menus);
        mmap.put("user", user);
        mmap.put("sideTheme", configService.selectConfigByKey("sys.index.sideTheme"));
        mmap.put("skinName", configService.selectConfigByKey("sys.index.skinName"));
        Boolean footer = Convert.toBool(configService.selectConfigByKey("sys.index.footer"), true);
        Boolean tagsView = Convert.toBool(configService.selectConfigByKey("sys.index.tagsView"), true);
        mmap.put("footer", footer);
        mmap.put("tagsView", tagsView);
        mmap.put("mainClass", contentMainClass(footer, tagsView));
        mmap.put("copyrightYear", RuoYiConfig.getCopyrightYear());
        mmap.put("demoEnabled", RuoYiConfig.isDemoEnabled());
        mmap.put("isDefaultModifyPwd", initPasswordIsModify(user.getPwdUpdateDate()));
        mmap.put("isPasswordExpired", passwordIsExpiration(user.getPwdUpdateDate()));
        mmap.put("isMobile", ServletUtils.checkAgentIsMobile(ServletUtils.getRequest().getHeader("User-Agent")));
        // 根据用户id查找借阅证信息
        mmap.put("isBorrowCard",BookCardException());
        mmap.put("isDateTime", renewBookException());
        mmap.put("bookName", findBookName());
        mmap.put("notificationDom", notificationDom());

        // 菜单导航显示风格
        String menuStyle = configService.selectConfigByKey("sys.index.menuStyle");
        // 移动端，默认使左侧导航菜单，否则取默认配置
        String indexStyle = ServletUtils.checkAgentIsMobile(ServletUtils.getRequest().getHeader("User-Agent")) ? "index" : menuStyle;

        // 优先Cookie配置导航菜单
        Cookie[] cookies = ServletUtils.getRequest().getCookies();
        for (Cookie cookie : cookies)
        {
            if (StringUtils.isNotEmpty(cookie.getName()) && "nav-style".equalsIgnoreCase(cookie.getName()))
            {
                indexStyle = cookie.getValue();
                break;
            }
        }
        String webIndex = "topnav".equalsIgnoreCase(indexStyle) ? "index-topnav" : "index";
        return webIndex;
    }

    // 锁定屏幕
    @GetMapping("/lockscreen")
    public String lockscreen(ModelMap mmap)
    {
        mmap.put("user", getSysUser());
        ServletUtils.getSession().setAttribute(ShiroConstants.LOCK_SCREEN, true);
        return "lock";
    }

    // 解锁屏幕
    @PostMapping("/unlockscreen")
    @ResponseBody
    public AjaxResult unlockscreen(String password)
    {
        SysUser user = getSysUser();
        if (StringUtils.isNull(user))
        {
            return AjaxResult.error("服务器超时，请重新登录");
        }
        if (passwordService.matches(user, password))
        {
            ServletUtils.getSession().removeAttribute(ShiroConstants.LOCK_SCREEN);
            return AjaxResult.success();
        }
        return AjaxResult.error("密码不正确，请重新输入。");
    }

    // 切换主题
    @GetMapping("/system/switchSkin")
    public String switchSkin()
    {
        return "skin";
    }

    // 切换菜单
    @GetMapping("/system/menuStyle/{style}")
    public void menuStyle(@PathVariable String style, HttpServletResponse response)
    {
        CookieUtils.setCookie(response, "nav-style", style);
    }

    // 系统介绍
    @GetMapping("/system/main")
    public String main(ModelMap mmap)
    {
        mmap.put("version", RuoYiConfig.getVersion());
        return "main";
    }

    // content-main class
    public String contentMainClass(Boolean footer, Boolean tagsView)
    {
        if (!footer && !tagsView)
        {
            return "tagsview-footer-hide";
        }
        else if (!footer)
        {
            return "footer-hide";
        }
        else if (!tagsView)
        {
            return "tagsview-hide";
        }
        return StringUtils.EMPTY;
    }

    // 检查初始密码是否提醒修改
    public boolean initPasswordIsModify(Date pwdUpdateDate)
    {
        Integer initPasswordModify = Convert.toInt(configService.selectConfigByKey("sys.account.initPasswordModify"));
        return initPasswordModify != null && initPasswordModify == 1 && pwdUpdateDate == null;
    }

    // 检查密码是否过期
    public boolean passwordIsExpiration(Date pwdUpdateDate)
    {
        Integer passwordValidateDays = Convert.toInt(configService.selectConfigByKey("sys.account.passwordValidateDays"));
        if (passwordValidateDays != null && passwordValidateDays > 0)
        {
            if (StringUtils.isNull(pwdUpdateDate))
            {
                // 如果从未修改过初始密码，直接提醒过期
                return true;
            }
            Date nowDate = DateUtils.getNowDate();
            return DateUtils.differentDaysByMillisecond(nowDate, pwdUpdateDate) > passwordValidateDays;
        }
        return false;
    }
    // 书籍
    public boolean BookCardException(){
        List<TBorrowCard> tBorrowCards = tBorrowCardService.selectByUserAll(ShiroUtils.getUserId());
        if (tBorrowCards.isEmpty()){
            return true;
        }
        return false;
    }
    public int differentDays(Date date1, Date date2){
        return (int)(date2.getTime() - date1.getTime()) / (1000 * 3600 * 24);
    }
    // 查找续借的书籍名
    public String findBookName(){
        List<TBorrowBookBo> tBorrowBookBos = tBorrowBooksService.selectByViewList(ShiroUtils.getLoginName());
        for (TBorrowBookBo tBorrowBookBo : tBorrowBookBos) {
            if (differentDays(tBorrowBookBo.getEndDate(), new Date()) == 0 && tBorrowBookBo.getUserName().equals(ShiroUtils.getLoginName())) {
                TBooks tBooks = booksService.selectByPrimaryKey(tBorrowBookBo.getBookId());
                return tBooks.getName();
            }
        }
        return null;
    }
    // 是否续借续借
    public boolean renewBookException(){
        try {
            if (!findBookName().isEmpty()){
                return true;
            }
        }catch (NullPointerException e){
            System.out.println(e);
        }

        return false;
    }
    // 是否上架
    public List<String> notificationDom() {
        List<String> inf = new ArrayList<>();
        // 订阅的图书，可能有多个
        List<TBookRssHistory> tBookRssHistorys = tBookRssHistoryService.selectByUserIdList(ShiroUtils.getUserId());
        List<TRssNotification> tRssNotifications = tRssNotificationService.selectByUserIdList(ShiroUtils.getUserId());

        for (TBookRssHistory tBookRssHistoryVo : tBookRssHistorys) {
            // 先找到该用户的图书订阅是否上架
            if (tBookRssHistoryVo.getUserId().equals(ShiroUtils.getUserId()) && tBookRssHistoryVo.getIsDelete() == 1) {
                String bookName = booksService.selectByPrimaryKey(tBookRssHistoryVo.getBookId()).getName();
                // 再判断是否已读
                for (TRssNotification tRssNotification : tRssNotifications){
                    // 最后在内容判断是否相同且是未读
                    if(tRssNotification.getContent().equals(bookName+"已上架") && tRssNotification.getIsRead() == 0){
                        inf.add(bookName);
                        break;
                    }
                }
            }

        }

        return inf;

    }


}
