package com.ruoyi.things.domain;

import lombok.Data;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.EqualsAndHashCode;

/**
 * 设备基础参数对象 lp_base_device_parameter
 * 
 * @author nanking
 * @date 2020-11-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class LpBaseDeviceParameter extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private String id;

    /** 设备基础信息主键 */
    @Excel(name = "设备基础信息主键")
    private String infoId;

    /** 参数名称 */
    @Excel(name = "参数名称")
    private String name;

    /** 接口名称 */
    @Excel(name = "接口名称")
    private String interfaceName;

    /** 控制类型 */
    @Excel(name = "控制类型")
    private String controlType;


    /** 备注信息 */
    private String remarks;

    /** 删除标记（0：正常 1：删除） */
    private String delFlag;

}
