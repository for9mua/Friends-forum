package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

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
* @since 2023-03-18
*/
@Getter
@Setter
@ApiModel(value = "Comments对象", description = "")
public class Comments implements Serializable {

private static final long serialVersionUID = 1L;

    // id
    @ApiModelProperty("id")
    @Alias("id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    // 逻辑删除
    @ApiModelProperty("逻辑删除")
    @Alias("逻辑删除")
    @TableLogic(value = "0", delval = "id")
    private Integer deleted;

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

    // 内容
    @ApiModelProperty("内容")
    @Alias("内容")
    private String content;

    // 用户
    @ApiModelProperty("用户")
    @Alias("用户")
    private Integer userId;

    // 动态
    @ApiModelProperty("动态")
    @Alias("动态")
    private Integer dynamicId;

    // 时间
    @ApiModelProperty("时间")
    @Alias("时间")
    private String time;
    @ApiModelProperty("父级id")
    @Alias("父级id")
    private Integer pid;

    @ApiModelProperty("属地")
    @Alias("属地")
    private String location;

    @TableField(exist = false)
    private List<Comments> children;

    @TableField(exist = false)
    private User user;

    private Integer puserId;
    // 回复的对象
    @TableField(exist = false)
    private User pUser;

}