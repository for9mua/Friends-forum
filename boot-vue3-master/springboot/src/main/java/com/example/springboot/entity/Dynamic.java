package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import cn.hutool.core.annotation.Alias;
import com.baomidou.mybatisplus.extension.handlers.FastjsonTypeHandler;
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
* @since 2023-02-28
*/
@Getter
@Setter
@ApiModel(value = "Dynamic对象", description = "")
@TableName(autoResultMap = true)
public class Dynamic implements Serializable {

private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    // 软删除
    @ApiModelProperty("软删除")
    @Alias("软删除")
    @TableLogic(value = "0", delval = "id")
    private Integer deleted;

    // 名称
    @ApiModelProperty("名称")
    @Alias("名称")
    private String name;

    // 内容
    @ApiModelProperty("内容")
    @Alias("内容")
    private String content;

    // 图片
    @ApiModelProperty("图片")
    @Alias("图片")
    private String img;

    // 用户id
    @ApiModelProperty("用户id")
    @Alias("用户id")
    private Integer userId;

    // 时间
    @ApiModelProperty("时间")
    @Alias("时间")
    private String time;


    // 创建时间
    @ApiModelProperty("创建时间")
    @Alias("创建时间")
    @TableField(fill = FieldFill.INSERT)
    @JsonDeserialize(using = LDTConfig.CmzLdtDeSerializer.class)
    @JsonSerialize(using = LDTConfig.CmzLdtSerializer.class)
    private LocalDateTime createTime;

    // 更新时间
    @ApiModelProperty("更新时间")
    @Alias("更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    @JsonDeserialize(using = LDTConfig.CmzLdtDeSerializer.class)
    @JsonSerialize(using = LDTConfig.CmzLdtSerializer.class)
    private LocalDateTime updateTime;
    private String descr;
    private Integer view;


    @TableField(exist = false)  // 数据库不存在这个字段
    private User user;
    @TableField(exist = false)  // 数据库不存在这个字段
    private Boolean hasPraise;
    @TableField(exist = false)  // 数据库不存在这个字段
    private Boolean hasCollect;
    @TableField(exist = false)  // 数据库不存在这个字段
    private Integer hot;  // 热度
    @TableField(exist = false)  // 数据库不存在这个字段
    private Integer praiseCount;  // 点赞
    @TableField(exist = false)  // 数据库不存在这个字段
    private Integer collectCount;  // 收藏
    @TableField(exist = false)  // 数据库不存在这个字段
    private Integer commentCount;  // 评论

    @TableField(typeHandler = FastjsonTypeHandler.class)
    private List<String> tags;
}