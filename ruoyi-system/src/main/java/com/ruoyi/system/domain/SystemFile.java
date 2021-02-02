package com.ruoyi.system.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 系统附件 t_sys_file
 * 
 * @author laichenchen
 */
@EqualsAndHashCode(callSuper = false)
@Data
public class SystemFile
{
    /** id */
    private String id;
    
    /** 文件原名称 */
    private String name;
    /**文件类型*/
    private String type;
    /**文件路径*/
    private String path;
    /**文件大小*/
    private String size;
    /**上传时间*/
    private Date uploadTime;
    /**上传人*/
    private String uploadBy;


}
