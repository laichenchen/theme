package com.ruoyi.things.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.TreeEntity;

/**
 * 设备组织对象 lp_device_tree
 * 
 * @author ruoyi
 * @date 2020-11-26
 */
public class LpDeviceTree extends TreeEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    @Excel(name = "主键")
    private String id;

    /** 所有父级编号 */
    private String parentIds;

    /** 名称 */
    @Excel(name = "名称")
    private String name;

    /** 类型 */
    @Excel(name = "类型")
    private String type;

    /** 地址编码 */
    private String addressCode;

    /** 上传图片 */
    private String fileId;

    /** 地址详情 */
    private String addressDetail;

    /** 地理坐标 */
    private String map;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;


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
    public void setParentIds(String parentIds) 
    {
        this.parentIds = parentIds;
    }

    public String getParentIds() 
    {
        return parentIds;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setAddressCode(String addressCode) 
    {
        this.addressCode = addressCode;
    }

    public String getAddressCode() 
    {
        return addressCode;
    }
    public void setFileId(String fileId) 
    {
        this.fileId = fileId;
    }

    public String getFileId() 
    {
        return fileId;
    }
    public void setAddressDetail(String addressDetail) 
    {
        this.addressDetail = addressDetail;
    }

    public String getAddressDetail() 
    {
        return addressDetail;
    }
    public void setMap(String map) 
    {
        this.map = map;
    }

    public String getMap() 
    {
        return map;
    }
    public void setSort(Long sort) 
    {
        this.sort = sort;
    }

    public Long getSort() 
    {
        return sort;
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
            .append("parentId", getParentId())
            .append("parentIds", getParentIds())
            .append("name", getName())
            .append("type", getType())
            .append("addressCode", getAddressCode())
            .append("fileId", getFileId())
            .append("addressDetail", getAddressDetail())
            .append("map", getMap())
            .append("sort", getSort())
            .append("createBy", getCreateBy())
            .append("createDate", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateDate", getUpdateTime())
            .append("remarks", getRemarks())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
