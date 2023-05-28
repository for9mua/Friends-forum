package com.example.springboot.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.hutool.core.util.StrUtil;
import com.example.springboot.common.annotation.AutoLog;
import cn.hutool.core.date.DateUtil;
import com.example.springboot.entity.*;
import com.example.springboot.service.*;
import com.example.springboot.service.impl.UserServiceImpl;
import com.example.springboot.utils.SessionUtils;
import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelWriter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletOutputStream;
import java.net.URLEncoder;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.io.InputStream;
import java.util.List;
import java.util.Optional;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.common.Result;
import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.bind.annotation.RestController;

/**
* <p>
*  前端控制器
* </p>
*
* @author ikun
* @since 2023-02-28
*/
@RestController
@RequestMapping("/dynamic")
public class DynamicController {

    @Resource
    private IDynamicService dynamicService;
    @Resource
    IUserService userService;
    @Resource
    IPraiseService praiseService;
    @Resource
    ICollectService collectService;
    @Resource
    ICommentsService commentsService;

    @AutoLog("新增动态")
    @PostMapping
    public Result save(@RequestBody Dynamic dynamic) {
        User user = SessionUtils.getUser();  // 获取当前登录的用户信息
        dynamic.setUserId(user.getId());
        dynamic.setTime(DateUtil.now());
        dynamicService.save(dynamic);

        // 加积分
        UserServiceImpl.setScore(5, user.getId());
        return Result.success();
    }

    @AutoLog("编辑动态")
    @PutMapping
    public Result update(@RequestBody Dynamic dynamic) {
        dynamicService.updateById(dynamic);
        return Result.success();
    }

    @AutoLog("删除动态")
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        dynamicService.removeById(id);
        return Result.success();
    }

    @AutoLog("批量删除动态")
    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        dynamicService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(dynamicService.list());
    }

    // 热门动态
    @GetMapping("/hot")
    @SaIgnore // 不登录就可以查询
    public Result hot() {
        List<Dynamic> list = dynamicService.list();
        List<Praise> praiseList = praiseService.list();
        List<Collect> collectList = collectService.list();
        List<Comments> commentsList = commentsService.list();
        for (Dynamic dynamic : list) {
            int praiseCount = (int) praiseList.stream().filter(p -> p.getFid().equals(dynamic.getId())).count();  // 点赞的个数
            int collectCount = (int) collectList.stream().filter(p -> p.getDynamicId().equals(dynamic.getId())).count();  // 点赞的个数
            int commentsCount = (int) commentsList.stream().filter(p -> p.getDynamicId().equals(dynamic.getId())).count();  // 点赞的个数
            //  计算热度 如果点赞过了，那么我们就开始计算权重  点赞的权重是2  收藏的权重也是2  浏览的权重是1 评论是3
            dynamic.setHot(praiseCount * 2 + collectCount * 2 + commentsCount * 3 + dynamic.getView());
        }
        return Result.success(list.stream().sorted((d1, d2) -> d2.getHot().compareTo(d1.getHot())).limit(8));
    }

    // 详情接口
    @GetMapping("/{id}")
    @SaIgnore // 不登录就可以查询
    public Result findOne(@PathVariable Integer id) {
        dynamicService.updateView(id);
        Dynamic dynamic = dynamicService.getById(id);
        Optional.of(userService.getById(dynamic.getUserId())).ifPresent(dynamic::setUser);
        // 查到了点赞的数据
        List<Praise> list = praiseService.list();
        List<Collect> collectList = collectService.list();
        User user = SessionUtils.getUser();
        if (user != null) {
            // 筛选了当前用户是否点赞了动态
            dynamic.setHasPraise(list.stream().anyMatch(praise -> praise.getUserId().equals(user.getId()) && praise.getFid().equals(dynamic.getId())));
            dynamic.setHasCollect(collectList.stream().anyMatch(collect -> collect.getUserId().equals(user.getId()) && collect.getDynamicId().equals(dynamic.getId())));
        }
        // 获取点赞的数量
        dynamic.setPraiseCount((int) list.stream().filter(praise -> praise.getFid().equals(dynamic.getId())).count());
        dynamic.setCollectCount((int) collectList.stream().filter(collect -> collect.getDynamicId().equals(dynamic.getId())).count());
        return Result.success(dynamic);
    }

    @GetMapping("/page")
    @SaIgnore // 不登录就可以查询
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam(defaultValue = "") String type,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Dynamic> queryWrapper = new QueryWrapper<Dynamic>().orderByDesc("id");
        if (StrUtil.isNotBlank(name)) {
            queryWrapper.like("name", name).or(q -> q.like("descr", name)).or(q -> q.like("tags", name));  // where name like xxx and descr like xxx
        }
        User currentUser = SessionUtils.getUser();  // 获取当前登录的用户信息
        if (currentUser != null) {
            String role = currentUser.getRole();  // ADMIN   USER   TEACHER
            if ("user".equals(type) && "USER".equals(role)) {  // 如果type是user，表示筛选用户自己的数据
                queryWrapper.eq("user_id", currentUser.getId());  // select * from  dynamic where user_id = xxx
            }
        }
        Page<Dynamic> page = dynamicService.page(new Page<>(pageNum, pageSize), queryWrapper);
        List<Praise> praiseList = praiseService.list();
        List<Collect> collectList = collectService.list();
        List<Comments> commentsList = commentsService.list();
        List<Dynamic> records = page.getRecords();
        List<User> userList = userService.list();
        for (Dynamic record : records) {
            // 查出用户信息
            userList.stream().filter(user -> user.getId().equals(record.getUserId())).findFirst().ifPresent(record::setUser);

            // 查出多少点赞、收藏、评论
            int priseCount = (int) praiseList.stream().filter(praise -> praise.getFid().equals(record.getId())).count(); // 点赞数
            record.setPraiseCount(priseCount);
            int collectCount = (int) collectList.stream().filter(collect -> collect.getDynamicId().equals(record.getId())).count(); // 点赞数
            record.setCollectCount(collectCount);
            int commentsCount = (int) commentsList.stream().filter(comments -> comments.getDynamicId().equals(record.getId())).count(); // 点赞数
            record.setCommentCount(commentsCount);
        }
        return Result.success(page);
    }

    /**
    * 导出接口
    */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Dynamic> list = dynamicService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("Dynamic信息表", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();

    }

    /**
    * excel 导入
    * @param file
    * @throws Exception
    */
    @PostMapping("/import")
    public Result imp(MultipartFile file) throws Exception {
        InputStream inputStream = file.getInputStream();
        ExcelReader reader = ExcelUtil.getReader(inputStream);
        // 通过 javabean的方式读取Excel内的对象，但是要求表头必须是英文，跟javabean的属性要对应起来
        List<Dynamic> list = reader.readAll(Dynamic.class);

        dynamicService.saveBatch(list);
        return Result.success();
    }

}
