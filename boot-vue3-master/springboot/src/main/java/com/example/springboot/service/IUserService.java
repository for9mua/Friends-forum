package com.example.springboot.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.springboot.controller.domain.LoginDTO;
import com.example.springboot.controller.domain.UserRequest;
import com.example.springboot.entity.Permission;
import com.example.springboot.entity.User;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author 程序员青戈
 * @since 2022-11-28
 */
public interface IUserService extends IService<User> {

    LoginDTO login(UserRequest user);

    void register(UserRequest user);

    String passwordReset(UserRequest userRequest);

    void logout(String uid);

    User saveUser(User user);

    List<Permission> getPermissions(String roleFlag);

    void passwordChange(UserRequest userRequest);
}
