package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
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
* @author 程序员青戈
* @since 2023-02-04
*/
@Getter
@Setter
@TableName("sys_file")
@ApiModel(value = "File对象", description = "")
public class File implements Serializable {

private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    // 文件名
    @ApiModelProperty("文件名")
    @Alias("文件名")
    private String name;

    // 大小
    @ApiModelProperty("大小")
    @Alias("大小")
    private Long size;

    // 类型
    @ApiModelProperty("类型")
    @Alias("类型")
    private String type;

    // 访问链接
    @ApiModelProperty("访问链接")
    @Alias("访问链接")
    private String url;

    // 文件摘要
    @ApiModelProperty("文件摘要")
    @Alias("文件摘要")
    private String md5;

    // 存储地址
    @ApiModelProperty("存储地址")
    @Alias("存储地址")
    private String location;

    // 软删除
    @ApiModelProperty("软删除")
    @Alias("软删除")
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
}