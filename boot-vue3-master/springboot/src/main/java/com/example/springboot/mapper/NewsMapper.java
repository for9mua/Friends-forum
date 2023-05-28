package com.example.springboot.mapper;

import com.example.springboot.entity.News;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Update;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ikun
 * @since 2023-03-25
 */
public interface NewsMapper extends BaseMapper<News> {

    @Update("update news set view = view + 1 where id = #{id}")
    void updateView(Integer id);
}
