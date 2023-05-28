package com.example.springboot.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.Result;
import com.example.springboot.common.annotation.AutoLog;
import com.example.springboot.entity.Role;
import com.example.springboot.entity.RolePermission;
import com.example.springboot.mapper.RolePermissionMapper;
import com.example.springboot.service.IRoleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author 程序员青戈
 * @since 2023-01-16
 */
@RestController
@RequestMapping("/role")
@Slf4j
public class RoleController {

    @Resource
    private IRoleService roleService;

    @Resource
    private RolePermissionMapper rolePermissionMapper;

    @AutoLog("新增角色")
    @PostMapping
    public Result save(@RequestBody Role role) {
        roleService.save(role);
        // 存储角色的权限数据
        roleService.savePermissions(role.getId(), role.getPermissionIds());
        return Result.success();
    }

    @AutoLog("编辑角色")
    @PutMapping
    public Result update(@RequestBody Role role) {
        roleService.updateById(role);
        // 存储角色的权限数据
        roleService.savePermissions(role.getId(), role.getPermissionIds());
        return Result.success();
    }

    @AutoLog("删除角色")
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        roleService.deleteRole(id);
        return Result.success();
    }

    @AutoLog("批量删除角色")
    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        roleService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(roleService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(roleService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Role> queryWrapper = new QueryWrapper<Role>().orderByDesc("id");
        queryWrapper.like(!"".equals(name), "name", name);
        Page<Role> page = roleService.page(new Page<>(pageNum, pageSize), queryWrapper);
        List<RolePermission> rolePermissions = rolePermissionMapper.selectList(null);
        page.getRecords().forEach(v -> {
            v.setPermissionIds(rolePermissions.stream().filter(rolePermission -> rolePermission.getRoleId().equals(v.getId()))
                    .map(RolePermission::getPermissionId).collect(Collectors.toList()));
        });
        return Result.success(page);
    }

    /**
     * 导出接口
     */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Role> list = roleService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("Role信息表", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();

    }

    /**
     * excel 导入
     *
     * @param file
     * @throws Exception
     */
    @PostMapping("/import")
    public Result imp(MultipartFile file) throws Exception {
        InputStream inputStream = file.getInputStream();
        ExcelReader reader = ExcelUtil.getReader(inputStream);
        // 通过 javabean的方式读取Excel内的对象，但是要求表头必须是英文，跟javabean的属性要对应起来
        List<Role> list = reader.readAll(Role.class);

        roleService.saveBatch(list);
        return Result.success();
    }

}
