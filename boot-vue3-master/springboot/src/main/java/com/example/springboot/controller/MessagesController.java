package com.example.springboot.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.example.springboot.common.annotation.AutoLog;
import cn.hutool.core.date.DateUtil;
import com.example.springboot.entity.User;
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
import java.util.Collections;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.common.Result;
import org.springframework.web.multipart.MultipartFile;
import com.example.springboot.service.IMessagesService;
import com.example.springboot.entity.Messages;

import org.springframework.web.bind.annotation.RestController;

/**
* <p>
*  前端控制器
* </p>
*
* @author ikun
* @since 2023-03-26
*/
@RestController
@RequestMapping("/messages")
public class MessagesController {

    @Resource
    private IMessagesService messagesService;

    @AutoLog("新增消息通知")
    @PostMapping
    public Result save(@RequestBody Messages messages) {
//        User user = SessionUtils.getUser();
//        messages.setUser(user.getName());
//        messages.setUserid(user.getId());
//        messages.setDate(DateUtil.today());
//        messages.setTime(DateUtil.now());
        messagesService.save(messages);
        return Result.success();
    }

    @AutoLog("编辑消息通知")
    @PutMapping
    public Result update(@RequestBody Messages messages) {
        messagesService.updateById(messages);
        return Result.success();
    }

    @AutoLog("更新消息已读")
    @PutMapping("/read")
    public Result updateReadStatus() {
        User user = SessionUtils.getUser();
        // 设置当前的用户所有的消息通知为已读状态
        messagesService.update(new UpdateWrapper<Messages>().set("isread", 1).eq("user_id", user.getId()));
        return Result.success();
    }

    @AutoLog("删除消息通知")
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        messagesService.removeById(id);
        return Result.success();
    }

    @AutoLog("批量删除消息通知")
    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        messagesService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping("/unread")
    @SaIgnore
    public Result unread() {
        User user = SessionUtils.getUser();
        if (user != null) {
            // 查询当前登录用户所有未读的消息
            return Result.success(messagesService.list(new QueryWrapper<Messages>().eq("user_id", user.getId()).eq("isread", 0)));
        } else {
            return Result.success(Collections.EMPTY_LIST);
        }
    }

    @GetMapping
    public Result findAll() {
        return Result.success(messagesService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(messagesService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Messages> queryWrapper = new QueryWrapper<Messages>().orderByDesc("id");
        queryWrapper.like(!"".equals(name), "name", name);
        User currentUser = SessionUtils.getUser();
        String role = currentUser.getRole();
        if ("USER".equals(role)) {  // 用户
            queryWrapper.eq("user_id", currentUser.getId());  // select * from  dynamic where user_id = xxx
        }
        return Result.success(messagesService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    /**
    * 导出接口
    */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Messages> list = messagesService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("Messages信息表", "UTF-8");
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
        List<Messages> list = reader.readAll(Messages.class);

        messagesService.saveBatch(list);
        return Result.success();
    }

}
