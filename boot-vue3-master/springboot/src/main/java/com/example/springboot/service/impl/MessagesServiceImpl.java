package com.example.springboot.service.impl;

import com.example.springboot.entity.Messages;
import com.example.springboot.mapper.MessagesMapper;
import com.example.springboot.service.IMessagesService;
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
public class MessagesServiceImpl extends ServiceImpl<MessagesMapper, Messages> implements IMessagesService {

}
