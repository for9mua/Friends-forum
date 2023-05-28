package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import cn.hutool.core.annotation.Alias;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.example.springboot.common.LDTConfig;
import lombok.Getter;
import lombok.Setter;

/**
* <p>
* 
* </p>
*
* @author ikun
* @since 2023-03-26
*/
@Getter
@Setter
@ApiModel(value = "Address对象", description = "")
public class Address implements Serializable {

private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    // 地址
    @ApiModelProperty("地址")
    @Alias("地址")
    private String address;

    // 收件人名称
    @ApiModelProperty("收件人名称")
    @Alias("收件人名称")
    private String userName;

    // 收件人id
    @ApiModelProperty("收件人id")
    @Alias("收件人id")
    private Integer userId;

    // 电话
    @ApiModelProperty("电话")
    @Alias("电话")
    private String phone;
}