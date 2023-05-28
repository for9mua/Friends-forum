package com.example.springboot.service.impl;

import com.example.springboot.entity.Praise;
import com.example.springboot.mapper.PraiseMapper;
import com.example.springboot.service.IPraiseService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ikun
 * @since 2023-03-05
 */
@Service
public class PraiseServiceImpl extends ServiceImpl<PraiseMapper, Praise> implements IPraiseService {

}
