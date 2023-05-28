package com.example.springboot.controller;

import cn.hutool.core.util.RandomUtil;
import com.example.springboot.common.annotation.AutoLog;
import cn.hutool.core.date.DateUtil;
import com.example.springboot.entity.Goods;
import com.example.springboot.entity.User;
import com.example.springboot.service.IGoodsService;
import com.example.springboot.service.IUserService;
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
import java.util.Date;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.common.Result;
import org.springframework.web.multipart.MultipartFile;
import com.example.springboot.service.IOrdersService;
import com.example.springboot.entity.Orders;

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
@RequestMapping("/orders")
public class OrdersController {

    @Resource
    private IOrdersService ordersService;
    @Resource
    IGoodsService goodsService;
    @Resource
    IUserService userService;

    @AutoLog("新增积分订单")
    @PostMapping
    public Result save(@RequestBody Orders orders) {
        User user = SessionUtils.getUser();
        user = userService.getById(user.getId());  // 从数据库查询出用户的真实信息
        Integer score = user.getScore();
        Integer goodsId = orders.getGoodsId();
        Goods goods = goodsService.getById(goodsId);
        if (score < goods.getScore()) { // 用户积分不足
            return Result.error("-1", "您的积分不足");
        }
        if (goods.getNum() <= 0) { // 库存不足
            return Result.error("-1", "商品库存不足");
        }
        orders.setUserId(user.getId());
        orders.setScore(goods.getScore());
        orders.setTime(DateUtil.now());
        orders.setCode(DateUtil.format(new Date(), "yyyyMMddd") + (System.currentTimeMillis()+"").substring(7));
        ordersService.save(orders);

        // 更新商品库存
        goods.setNum(goods.getNum() - orders.getNum());
        goodsService.updateById(goods);

        user.setScore(user.getScore() - goods.getScore());  // 扣除用户积分
        userService.updateById(user);
        return Result.success();
    }

    @AutoLog("编辑积分订单")
    @PutMapping
    public Result update(@RequestBody Orders orders) {
        ordersService.updateById(orders);
        return Result.success();
    }

    @AutoLog("删除积分订单")
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        ordersService.removeById(id);
        return Result.success();
    }

    @AutoLog("批量删除积分订单")
    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        ordersService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(ordersService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(ordersService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Orders> queryWrapper = new QueryWrapper<Orders>().orderByDesc("id");
        queryWrapper.like(!"".equals(name), "code", name);
        User currentUser = SessionUtils.getUser();
        String role = currentUser.getRole();
        if ("USER".equals(role)) {  // 用户
            queryWrapper.eq("user_id", currentUser.getId());  // select * from  dynamic where user_id = xxx
        }
        return Result.success(ordersService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    /**
    * 导出接口
    */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Orders> list = ordersService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("Orders信息表", "UTF-8");
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
        List<Orders> list = reader.readAll(Orders.class);

        ordersService.saveBatch(list);
        return Result.success();
    }

}
