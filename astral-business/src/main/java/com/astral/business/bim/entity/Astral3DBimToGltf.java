package com.astral.business.bim.entity;


import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.handlers.FastjsonTypeHandler;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.JdbcType;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * BIM模型轻量化(Astral3DBimToGltf)表实体类
 */
@Data
@TableName(value = "astral_3d_bim_to_gltf", autoResultMap = true)
@AllArgsConstructor
@NoArgsConstructor
public class Astral3DBimToGltf implements Serializable{

    @TableId(type = IdType.AUTO)
    private Long id;
    //文件名
    private String fileName;
    //缩略图
    private String thumbnail;
    //bim源文件路径
    private String bimFilePath;
    //bim源文件大小
    private BigDecimal bimFileSize;
    //转换后的gltf文件路径
    private String gltfFilePath;
    //转换后的gltf文件大小
    private BigDecimal gltfFileSize;
    //0 转换中 1 转换完成 2 转换失败
    private Integer conversionStatus;
    //转换时长（s）
    private BigDecimal conversionDuration;
    //转换配置
    @TableField(typeHandler = FastjsonTypeHandler.class, jdbcType = JdbcType.LONGNVARCHAR)
    private JSONObject options;
    //删除标记，0 未删除 1 已删除
    @TableField("delTag")
    private Integer delTag;

    @TableField("createTime")
    private Date createTime;

    @TableField("updateTime")
    private Date updateTime;

    @TableField("delTime")
    private Date delTime;


}

