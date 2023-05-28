package com.example.springboot.service.impl;

import com.example.springboot.entity.Im;
import com.example.springboot.mapper.ImMapper;
import com.example.springboot.service.IImService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ikun
 * @since 2023-02-18
 */
@Service
public class ImServiceImpl extends ServiceImpl<ImMapper, Im> implements IImService {

}
