package com.example.springboot.controller;

import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletOutputStream;
import java.net.URLEncoder;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.Result;
import com.example.springboot.common.annotation.AutoLog;
import com.example.springboot.entity.Dict;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.InputStream;
import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.web.multipart.MultipartFile;
import com.example.springboot.service.IDictService;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author 程序员青戈
 * @since 2023-02-02
 */
@RestController
@RequestMapping("/dict")
public class DictController {

    @Resource
    private IDictService dictService;

    @AutoLog("新增字典")
    @PostMapping
    @CacheEvict(value = "findIcons", allEntries = true)
    public Result save(@RequestBody Dict dict) {
        dictService.save(dict);
        return Result.success();
    }

    @AutoLog("新增字典")
    @PutMapping
    @CacheEvict(value = "findIcons", allEntries = true)  // 删除所有缓存
    public Result update(@RequestBody Dict dict) {
        dictService.updateById(dict);
        return Result.success();
    }

    @AutoLog("删除字典")
    @DeleteMapping("/{id}")
    @CacheEvict(value = "findIcons", allEntries = true)
    public Result delete(@PathVariable Integer id) {
        dictService.removeById(id);
        return Result.success();
    }

    @AutoLog("批量删除字典")
    @PostMapping("/del/batch")
    @CacheEvict(value = "findIcons", allEntries = true)
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        dictService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(dictService.list());
    }

    @GetMapping("/icons")
    public Result findByType() {
        return Result.success(dictService.findIcons());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(dictService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Dict> queryWrapper = new QueryWrapper<Dict>().orderByDesc("id");
        queryWrapper.like(!"".equals(name), "name", name);
        return Result.success(dictService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    /**
     * 导出接口
     */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Dict> list = dictService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("Dict信息表", "UTF-8");
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
        List<Dict> list = reader.readAll(Dict.class);

        dictService.saveBatch(list);
        return Result.success();
    }

}
