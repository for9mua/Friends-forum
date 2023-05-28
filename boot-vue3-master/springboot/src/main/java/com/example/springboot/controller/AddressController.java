package com.example.springboot.controller;

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
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.common.Result;
import org.springframework.web.multipart.MultipartFile;
import com.example.springboot.service.IAddressService;
import com.example.springboot.entity.Address;

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
@RequestMapping("/address")
public class AddressController {

    @Resource
    private IAddressService addressService;

    @AutoLog("新增收货地址")
    @PostMapping
    public Result save(@RequestBody Address address) {
        User user = SessionUtils.getUser();
//        address.setUser(user.getName());
        address.setUserId(user.getId());
//        address.setDate(DateUtil.today());
//        address.setTime(DateUtil.now());
        addressService.save(address);
        return Result.success();
    }

    @AutoLog("编辑收货地址")
    @PutMapping
    public Result update(@RequestBody Address address) {
        addressService.updateById(address);
        return Result.success();
    }

    @AutoLog("删除收货地址")
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        addressService.removeById(id);
        return Result.success();
    }

    @AutoLog("批量删除收货地址")
    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        addressService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping("/user")
    public Result finUserAddress() {
        User user = SessionUtils.getUser();
        return Result.success(addressService.list(new QueryWrapper<Address>().eq("user_id", user.getId())));
    }

    @GetMapping
    public Result findAll() {
        return Result.success(addressService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(addressService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Address> queryWrapper = new QueryWrapper<Address>().orderByDesc("id");
        queryWrapper.like(!"".equals(name), "name", name);
        User currentUser = SessionUtils.getUser();
        String role = currentUser.getRole();
        if ("USER".equals(role)) {  // 用户
            queryWrapper.eq("user_id", currentUser.getId());  // select * from  dynamic where user_id = xxx
        }
        return Result.success(addressService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    /**
    * 导出接口
    */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Address> list = addressService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("Address信息表", "UTF-8");
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
        List<Address> list = reader.readAll(Address.class);

        addressService.saveBatch(list);
        return Result.success();
    }

}
