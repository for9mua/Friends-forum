package com.example.springboot.service.impl;

import cn.dev33.satoken.secure.BCrypt;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.common.Constants;
import com.example.springboot.controller.domain.LoginDTO;
import com.example.springboot.controller.domain.UserRequest;
import com.example.springboot.entity.Permission;
import com.example.springboot.entity.Role;
import com.example.springboot.entity.RolePermission;
import com.example.springboot.entity.User;
import com.example.springboot.exception.ServiceException;
import com.example.springboot.mapper.RolePermissionMapper;
import com.example.springboot.mapper.UserMapper;
import com.example.springboot.service.IPermissionService;
import com.example.springboot.service.IRoleService;
import com.example.springboot.service.IUserService;
import com.example.springboot.utils.SpringContextUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author 程序员青戈
 * @since 2022-11-28
 */
@Service
@Slf4j
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    private static final long TIME_IN_MS5 = 5 * 60 * 1000;  // 表示5分钟的毫秒数

    @Resource
    RolePermissionMapper rolePermissionMapper;

    @Resource
    IRoleService roleService;

    @Resource
    IPermissionService permissionService;

    @Override
    public LoginDTO login(UserRequest user) {
        User dbUser;
        try {
            dbUser = getOne(new UpdateWrapper<User>().eq("username", user.getUsername())
                    .or().eq("email", user.getUsername()));
        } catch (Exception e) {
            throw new RuntimeException("数据库异常");
        }
        if (dbUser == null) {
            throw new ServiceException("未找到用户");
        }
//        String securePass = SaSecureUtil.aesEncrypt(Constants.LOGIN_USER_KEY, user.getPassword());
//        if (!securePass.equals(dbUser.getPassword())) {
//            throw new ServiceException("用户名或密码错误");
//        }
        if (!BCrypt.checkpw(user.getPassword(), dbUser.getPassword())) {
            throw new ServiceException("用户名或密码错误");
        }
        // 登录
        StpUtil.login(dbUser.getUid());  // loginId
        StpUtil.getSession().set(Constants.LOGIN_USER_KEY, dbUser);
        String tokenValue = StpUtil.getTokenInfo().getTokenValue();
//        LoginDTO loginDTO = new LoginDTO(dbUser, tokenValue);

        // 查询用户的菜单树（2层）
        String flag = dbUser.getRole();
        List<Permission> all = getPermissions(flag);  // 水平
        List<Permission> menus = getTreePermissions(all); // 树
        // 页面的按钮权限集合
        List<Permission> auths = all.stream().filter(permission -> permission.getType() == 3).collect(Collectors.toList());
        return LoginDTO.builder().user(dbUser).token(tokenValue).menus(menus).auths(auths).build();
    }

    public List<Permission> getPermissions(String roleFlag) {
        Role role = roleService.getOne(new QueryWrapper<Role>().eq("flag", roleFlag));
        List<RolePermission> rolePermissions = rolePermissionMapper.selectList(new QueryWrapper<RolePermission>().eq("role_id", role.getId()));
        List<Integer> permissionIds = rolePermissions.stream().map(RolePermission::getPermissionId).collect(Collectors.toList());
        List<Permission> permissionList = permissionService.list();
        List<Permission> all = new ArrayList<>();  // 水平的菜单树
        for (Integer permissionId : permissionIds) {
            permissionList.stream().filter(permission -> permission.getId().equals(permissionId)).findFirst()
                    .ifPresent(all::add);
        }
        return all;
    }

    @Override
    public void passwordChange(UserRequest userRequest) {
        User dbUser = getOne(new UpdateWrapper<User>().eq("uid", userRequest.getUid()));
        if (dbUser == null) {
            throw new ServiceException("未找到用户");
        }
        boolean checkpw = BCrypt.checkpw(userRequest.getPassword(), dbUser.getPassword());
        if (!checkpw) {
            throw new ServiceException("原密码错误");
        }
        String newPass = userRequest.getNewPassword();
        dbUser.setPassword(BCrypt.hashpw(newPass));
        updateById(dbUser);   // 设置到数据库
    }

    // 获取角色对应的菜单树
    private List<Permission> getTreePermissions(List<Permission> all) {
        // 菜单树 1级 -> 2级
        List<Permission> parentList = all.stream().filter(permission -> permission.getType() == 1
                || (permission.getType() == 2 && permission.getPid() == null)).collect(Collectors.toList());// type==1 是目录  或者  pid = null
        for (Permission permission : parentList) {
            Integer pid = permission.getId();
            List<Permission> level2List = all.stream().filter(permission1 -> pid.equals(permission1.getPid())).collect(Collectors.toList());// 2级菜单
            permission.setChildren(level2List);
        }
        return parentList.stream().sorted(Comparator.comparing(Permission::getOrders)).collect(Collectors.toList());  // 排序
    }

    @Override
    public void register(UserRequest user) {
        User saveUser = new User();
        BeanUtils.copyProperties(user, saveUser);   // 把请求数据的属性copy给存储数据库的属性
        saveUser.setRole("USER");
        // 存储用户信息
        saveUser(saveUser);
    }


    /**
     * 重置密码
     *
     * @param userRequest
     * @return
     */
    @Override
    public String passwordReset(UserRequest userRequest) {
        String email = userRequest.getEmail();
        User dbUser = getOne(new UpdateWrapper<User>().eq("email", email));
        if (dbUser == null) {
            throw new ServiceException("未找到用户");
        }
        String newPass = "123";
        dbUser.setPassword(BCrypt.hashpw(newPass));
        updateById(dbUser);   // 设置到数据库
        return newPass;
    }

    @Override
    public void logout(String uid) {
        // 退出登录
        StpUtil.logout(uid);
        log.info("用户{}退出成功", uid);
    }


    public User saveUser(User user) {
        User dbUser = getOne(new UpdateWrapper<User>().eq("username", user.getUsername()));
        if (dbUser != null) {
            throw new ServiceException("用户已存在");
        }
        // 设置昵称
        if (StrUtil.isBlank(user.getName())) {
//                String name = Constants.USER_NAME_PREFIX + DateUtil.format(new Date(), Constants.DATE_RULE_YYYYMMDD)
//                        + RandomUtil.randomString(4);
            user.setName("系统用户" + RandomUtil.randomString(6));
        }
        if (StrUtil.isBlank(user.getPassword())) {
            user.setPassword("123");   // 设置默认密码
        }
        // 加密用户密码
        user.setPassword(BCrypt.hashpw(user.getPassword()));  // BCrypt加密
        // 设置唯一标识
        user.setUid(IdUtil.fastSimpleUUID());
        try {
            save(user);
        } catch (Exception e) {
            throw new RuntimeException("注册失败", e);
        }
        return user;
    }

    /**
     *  更新用户积分
     * @param score 待更新的积分
     * @param userId  用户id
     */
    public static void setScore(Integer score, Integer userId) {
        UserMapper userMapper = SpringContextUtil.getBean(UserMapper.class);
        userMapper.setScore(score, userId);
    }

}

