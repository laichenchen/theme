package com.ruoyi.things.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 设备基础参数对象 lp_base_device_parameter
 * 
 * @author nanking
 * @date 2020-11-02
 */
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

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setInfoId(String infoId) 
    {
        this.infoId = infoId;
    }

    public String getInfoId() 
    {
        return infoId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setInterfaceName(String interfaceName) 
    {
        this.interfaceName = interfaceName;
    }

    public String getInterfaceName() 
    {
        return interfaceName;
    }
    public void setControlType(String controlType) 
    {
        this.controlType = controlType;
    }

    public String getControlType() 
    {
        return controlType;
    }

    public void setRemarks(String remarks) 
    {
        this.remarks = remarks;
    }

    public String getRemarks() 
    {
        return remarks;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("infoId", getInfoId())
            .append("name", getName())
            .append("interfaceName", getInterfaceName())
            .append("controlType", getControlType())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remarks", getRemarks())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
