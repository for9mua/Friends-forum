package com.example.springboot.service;

import com.example.springboot.entity.Role;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 程序员青戈
 * @since 2023-01-16
 */
public interface IRoleService extends IService<Role> {

    void savePermissions(Integer roleId, List<Integer> permissionIds);

    void deleteRole(Integer id);
}
