package com.example.springboot.service.impl;

import com.example.springboot.entity.Log;
import com.example.springboot.mapper.LogMapper;
import com.example.springboot.service.ILogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ikun
 * @since 2023-02-19
 */
@Service
public class LogServiceImpl extends ServiceImpl<LogMapper, Log> implements ILogService {

}
