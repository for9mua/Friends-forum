package com.example.springboot.mapper;

import com.example.springboot.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 程序员青戈
 * @since 2022-11-28
 */
public interface UserMapper extends BaseMapper<User> {

    int select1();

    // 更新积分
    @Update("update sys_user set score = score + #{score} where id = #{userId}")
    void setScore(@Param("score") Integer score, @Param("userId") Integer userId);

}
