package com.example.springboot.service.impl;

import com.example.springboot.entity.Orders;
import com.example.springboot.mapper.OrdersMapper;
import com.example.springboot.service.IOrdersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ikun
 * @since 2023-03-26
 */
@Service
public class OrdersServiceImpl extends ServiceImpl<OrdersMapper, Orders> implements IOrdersService {

}
