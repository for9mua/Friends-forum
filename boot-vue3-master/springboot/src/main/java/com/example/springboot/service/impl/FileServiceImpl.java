package com.example.springboot.service.impl;

import com.example.springboot.entity.File;
import com.example.springboot.mapper.FileMapper;
import com.example.springboot.service.IFileService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 程序员青戈
 * @since 2023-02-04
 */
@Service
public class FileServiceImpl extends ServiceImpl<FileMapper, File> implements IFileService {

}
