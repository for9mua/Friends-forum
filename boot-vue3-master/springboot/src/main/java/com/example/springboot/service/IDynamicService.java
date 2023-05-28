package com.example.springboot.service;

import com.example.springboot.entity.Dynamic;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ikun
 * @since 2023-02-28
 */
public interface IDynamicService extends IService<Dynamic> {

    void updateView(Integer id);
}
