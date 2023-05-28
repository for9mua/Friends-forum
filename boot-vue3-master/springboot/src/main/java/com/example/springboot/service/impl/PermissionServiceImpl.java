package com.example.springboot.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.springboot.entity.Permission;
import com.example.springboot.entity.RolePermission;
import com.example.springboot.mapper.PermissionMapper;
import com.example.springboot.mapper.RolePermissionMapper;
import com.example.springboot.service.IPermissionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author 程序员青戈
 * @since 2023-01-16
 */
@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements IPermissionService {

    @Resource
    RolePermissionMapper rolePermissionMapper;

    @Override
public List<Permission> tree() {
        List<Permission> allData = list();

        return childrenTree(null, allData); // 从第一级开始往下递归获取树
    }

    // 删除权限
    @Override
    @Transactional
public void deletePermission(Integer id) {
        // 删除 role_permission表数据
        rolePermissionMapper.delete(new UpdateWrapper<RolePermission>().eq("permission_id", id));
        remove(new UpdateWrapper<Permission>().eq("pid", id)); // 删除子菜单
        removeById(id);
    }

    // 递归生成树
    private List<Permission> childrenTree(Integer pid, List<Permission> allData) {
        List<Permission> list = new ArrayList<>();
        for (Permission permission : allData) {
            if (Objects.equals(permission.getPid(), pid)) {  // null, 一级
                list.add(permission);
                List<Permission> childrenTree = childrenTree(permission.getId(), allData);  // 递归调用， 摘取二级节点、三级、四级...
                permission.setChildren(childrenTree);
            }
        }
        return list;
    }
}
