package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.math.BigDecimal;
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
@ApiModel(value = "Goods对象", description = "")
public class Goods implements Serializable {

private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    // 编号
    @ApiModelProperty("编号")
    @Alias("编号")
    private String code;

    // 名称
    @ApiModelProperty("名称")
    @Alias("名称")
    private String name;

    // 价格
    @ApiModelProperty("价格")
    @Alias("价格")
    private BigDecimal price;

    // 单位
    @ApiModelProperty("单位")
    @Alias("单位")
    private String unit;

    // 库存
    @ApiModelProperty("库存")
    @Alias("库存")
    private Integer num;

    // 所需积分
    @ApiModelProperty("所需积分")
    @Alias("所需积分")
    private Integer score;

    // 图片
    @ApiModelProperty("图片")
    @Alias("图片")
    private String img;

    // 是否上架
    @ApiModelProperty("是否上架")
    @Alias("是否上架")
    private String statusRadio;
}