package com.example.springboot.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.Dict;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.common.Result;
import com.example.springboot.common.annotation.AutoLog;
import com.example.springboot.controller.domain.LoginDTO;
import com.example.springboot.controller.domain.UserRequest;
import com.example.springboot.entity.Dynamic;
import com.example.springboot.entity.User;
import com.example.springboot.mapper.DynamicMapper;
import com.example.springboot.mapper.GoodsMapper;
import com.example.springboot.mapper.OrdersMapper;
import com.example.springboot.mapper.UserMapper;
import com.example.springboot.service.IUserService;
import com.example.springboot.utils.SpringContextUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

@Api(tags = "无权限接口列表")
@RestController
@Slf4j
public class WebController {

    @Resource
    IUserService userService;

    @GetMapping(value = "/")
    @ApiOperation(value = "版本校验接口")
    public String version() {
        String ver = "partner-back-0.0.1-SNAPSHOT";  // 应用版本号
        Package aPackage = WebController.class.getPackage();
        String title = aPackage.getImplementationTitle();
        String version = aPackage.getImplementationVersion();
        if (title != null && version != null) {
            ver = String.join("-", title, version);
        }
        return ver;
    }

    @AutoLog("用户登录")
    @ApiOperation(value = "用户登录接口")
    @PostMapping("/login")
    public Result login(@RequestBody UserRequest user) {
        long startTime = System.currentTimeMillis();
        LoginDTO res = userService.login(user);
        log.info("登录花费时间 {}ms", System.currentTimeMillis() - startTime);
        return Result.success(res);
    }

    @AutoLog("用户退出登录")
    @ApiOperation(value = "用户退出登录接口")
    @GetMapping("/logout/{uid}")
    @SaIgnore
    public Result logout(@PathVariable String uid) {
        userService.logout(uid);
        return Result.success();
    }

    @AutoLog("用户注册")
    @ApiOperation(value = "用户注册接口")
    @PostMapping("/register")
    public Result register(@RequestBody UserRequest user) {
        userService.register(user);
        return Result.success();
    }

    @AutoLog("用户重置密码")
    @ApiOperation(value = "密码重置接口")
    @PostMapping("/password/reset")
    public Result passwordReset(@RequestBody UserRequest userRequest) {
        String newPass = userService.passwordReset(userRequest);
        return Result.success(newPass);
    }

    @AutoLog("用户修改密码")
    @PostMapping("/password/change")
    public Result passwordChange(@RequestBody UserRequest userRequest) {
        userService.passwordChange(userRequest);
        return Result.success();
    }

    @AutoLog("编辑用户")
    @PutMapping("/updateUser")
    public Result updateUser(@RequestBody User user) {
        Object loginId = StpUtil.getLoginId();
        if (!loginId.equals(user.getUid())) {
            Result.error("无权限");
        }
        userService.updateById(user);
        return Result.success(user);
    }

    @GetMapping("/bizNums")
    public Result bizNums() {
        Dict dict = Dict.create();
        UserMapper userMapper = SpringContextUtil.getBean(UserMapper.class);
        DynamicMapper dynamicMapper = SpringContextUtil.getBean(DynamicMapper.class);
        GoodsMapper goodsMapper = SpringContextUtil.getBean(GoodsMapper.class);
        OrdersMapper ordersMapper = SpringContextUtil.getBean(OrdersMapper.class);

        dict.set("user", userMapper.selectCount(new QueryWrapper<User>().eq("role", "USER")));
        dict.set("dynamic", dynamicMapper.selectCount(null));
        dict.set("goods", goodsMapper.selectCount(null));
        dict.set("orders", ordersMapper.selectCount(null));
        return Result.success(dict);
    }

    @GetMapping("/echarts/dynamicCount")
    public Result dynamicCount() {
        DynamicMapper dynamicMapper = SpringContextUtil.getBean(DynamicMapper.class);
        List<Dict> list = CollUtil.newArrayList();
        List<Dynamic> dynamics = dynamicMapper.selectList(null);
        Set<String> dates = dynamics.stream().filter(dynamic -> dynamic.getTime() != null).map(dynamic -> dynamic.getTime().substring(0, 11)).collect(Collectors.toSet());
        for (String date : dates) {
            Dict dict = Dict.create();
            dict.set("name", date).set("value", dynamics.stream().filter(dynamic -> dynamic.getTime().contains(date)).count());
            list.add(dict);
        }
        return Result.success(list.stream().sorted(Comparator.comparing(dict -> dict.getStr("name"))));
    }

    @GetMapping("/echarts/dynamicTag")
    public Result dynamicTag() {
        DynamicMapper dynamicMapper = SpringContextUtil.getBean(DynamicMapper.class);
        List<Dict> list = CollUtil.newArrayList();
        List<Dynamic> dynamics = dynamicMapper.selectList(null);
        Set<String> tagsSet = new HashSet<>();
        dynamics.stream().map(Dynamic::getTags).forEach(tagsList -> {
            if (tagsList != null) {
                tagsSet.addAll(tagsList);
        }
        });
        for (String tag : tagsSet) {
            Dict dict = Dict.create();
            dict.set("name", tag).set("value", dynamics.stream().filter(dynamic -> dynamic.getTags() != null && dynamic.getTags().contains(tag)).count());
            list.add(dict);
        }
        return Result.success(list);
    }

}
