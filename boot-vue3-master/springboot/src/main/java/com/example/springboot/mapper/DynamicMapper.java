package com.example.springboot.mapper;

import com.example.springboot.entity.Dynamic;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Update;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ikun
 * @since 2023-02-28
 */
public interface DynamicMapper extends BaseMapper<Dynamic> {

    @Update("update dynamic set view = view + 1 where id = #{id}")
    void updateView(Integer id);
}
