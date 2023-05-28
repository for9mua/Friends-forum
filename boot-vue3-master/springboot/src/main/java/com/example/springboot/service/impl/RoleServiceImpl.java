package com.example.springboot.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.Role;
import com.example.springboot.entity.RolePermission;
import com.example.springboot.exception.ServiceException;
import com.example.springboot.mapper.RoleMapper;
import com.example.springboot.mapper.RolePermissionMapper;
import com.example.springboot.service.IRoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author 程序员青戈
 * @since 2023-01-16
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {
    @Resource
    private RolePermissionMapper rolePermissionMapper;

    @Transactional
    @Override
public void savePermissions(Integer roleId, List<Integer> permissionIds) {
        if (CollUtil.isEmpty(permissionIds) || roleId == null) {
            throw new ServiceException("数据不能为空");
        }
        rolePermissionMapper.delete(new UpdateWrapper<RolePermission>()
                .eq("role_id", roleId));
        permissionIds.forEach(v -> {
            RolePermission rolePermission = new RolePermission();
            rolePermission.setRoleId(roleId);
            rolePermission.setPermissionId(v);
            rolePermissionMapper.insert(rolePermission);
        });
    }

    @Override
    @Transactional
public void deleteRole(Integer id) {
        rolePermissionMapper.delete(new UpdateWrapper<RolePermission>()
                .eq("role_id", id));
        removeById(id);
    }
}
