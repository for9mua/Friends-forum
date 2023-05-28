package com.example.springboot.utils;

import cn.dev33.satoken.stp.StpUtil;
import com.example.springboot.common.Constants;
import com.example.springboot.entity.User;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SessionUtils {

    // 获取当前登录的用户信息
    public static User getUser() {
        try {
            return (User) StpUtil.getSession().get(Constants.LOGIN_USER_KEY);
        } catch (Exception e) {
            log.error("获取用户失败，当前用户未登录");
            return null;
        }
    }

}
