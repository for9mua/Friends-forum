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
@ApiModel(value = "Messages对象", description = "")
public class Messages implements Serializable {

private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    // 通知内容
    @ApiModelProperty("通知内容")
    @Alias("通知内容")
    private String content;

    // 通知时间
    @ApiModelProperty("通知时间")
    @Alias("通知时间")
    private String time;

    // 通知人id
    @ApiModelProperty("通知人id")
    @Alias("通知人id")
    private Integer userId;

    // 是否已读
    @ApiModelProperty("是否已读")
    @Alias("是否已读")
    private Boolean isread;
}