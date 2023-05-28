package com.example.springboot.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.hutool.core.lang.Dict;
import com.example.springboot.common.annotation.AutoLog;
import cn.hutool.core.date.DateUtil;
import com.example.springboot.entity.User;
import com.example.springboot.service.IUserService;
import com.example.springboot.service.impl.DynamicServiceImpl;
import com.example.springboot.service.impl.UserServiceImpl;
import com.example.springboot.utils.IpUtils;
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
import java.util.Objects;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.common.Result;
import org.springframework.web.multipart.MultipartFile;
import com.example.springboot.service.ICommentsService;
import com.example.springboot.entity.Comments;

import org.springframework.web.bind.annotation.RestController;

/**
* <p>
*  前端控制器
* </p>
*
* @author ikun
* @since 2023-03-18
*/
@RestController
@RequestMapping("/comments")
public class CommentsController {

    @Resource
    private ICommentsService commentsService;
    @Resource
    IUserService userService;

    @AutoLog("新增评论")
    @PostMapping
    public Result save(@RequestBody Comments comments) {
        User user = SessionUtils.getUser();
        comments.setUserId(user.getId());
        comments.setTime(DateUtil.now());

        Dict ipAndCity = IpUtils.getIPAndCity();
        comments.setLocation(ipAndCity.get("city").toString());
        commentsService.save(comments);

        // 加积分
        UserServiceImpl.setScore(2, user.getId());
        DynamicServiceImpl.createMessage(comments.getDynamicId(), "收藏");
        return Result.success();
    }

    @AutoLog("编辑评论")
    @PutMapping
    public Result update(@RequestBody Comments comments) {
        commentsService.updateById(comments);
        return Result.success();
    }

    @AutoLog("删除评论")
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        List<Comments> children = commentsService.list(new QueryWrapper<Comments>().eq("pid", id));
        for (Comments child : children) {
            // 删除子评论
            commentsService.removeById(child.getId());
        }
        commentsService.removeById(id);
        return Result.success();
    }

    @AutoLog("批量删除评论")
    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        commentsService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping("/tree")
    @SaIgnore
    public Result tree(@RequestParam Integer dynamicId) {
        List<User> userList = userService.list();
        List<Comments> list = commentsService.list(new QueryWrapper<Comments>().eq("dynamic_id", dynamicId));
        // 给comments里的每个对象设置一个user属性
        list = list.stream().peek(comments -> userList.stream()
                .filter(user -> user.getId().equals(comments.getUserId())).findFirst().ifPresent(comments::setUser))
                .collect(Collectors.toList());
        List<Comments> first = list.stream().filter(comments -> comments.getPid() == null).collect(Collectors.toList());// 一级评论
        for (Comments comments : first) {
            Integer pid = comments.getId();
            List<Comments> second = list.stream().filter(comments1 -> Objects.equals(pid, comments1.getPid())).collect(Collectors.toList());// 二级评论

            // 给second里的每个对象设置一个puser属性
            second = second.stream().peek(comments1 -> userList.stream()
                    .filter(user -> user.getId().equals(comments1.getPuserId())).findFirst()
                    .ifPresent(comments1::setPUser)).collect(Collectors.toList());
            comments.setChildren(second);  // 一级评论设置二级评论
        }
        return Result.success(first);
    }

    @GetMapping
    public Result findAll() {
        return Result.success(commentsService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(commentsService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Comments> queryWrapper = new QueryWrapper<Comments>().orderByDesc("id");
        queryWrapper.like(!"".equals(name), "name", name);
        return Result.success(commentsService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    /**
    * 导出接口
    */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Comments> list = commentsService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("Comments信息表", "UTF-8");
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
        List<Comments> list = reader.readAll(Comments.class);

        commentsService.saveBatch(list);
        return Result.success();
    }

}
