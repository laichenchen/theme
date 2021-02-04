package com.ruoyi.things.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.google.common.collect.Lists;
import com.ruoyi.system.domain.SystemFile;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 项目申请对象 lp_project
 * 
 * @author ruoyi
 * @date 2020-11-02
 */
public class LpProject extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编码 */
    private String id;

    /** 项目名称 */
    @Excel(name = "项目名称")
    private String name;

    /** 项目负责人 */
    @Excel(name = "项目负责人")
    private String head;

    /** 项目电话 */
    @Excel(name = "项目电话")
    private String headPhone;

    /** 乙方 */
    @Excel(name = "乙方")
    private String pa;

    /** 甲方 */
    @Excel(name = "甲方")
    private String pb;

    /** 项目相关文件 */
    @Excel(name = "项目相关文件")
    private String fileIds;

    /** 地理位置坐标*/
    @Excel(name = "地理位置坐标")
    private String latlng;

    public String getLatlng() {
        return latlng;
    }

    public void setLatlng(String latlng) {
        this.latlng = latlng;
    }

    public List<SystemFile> getFileList() {
        return fileList;
    }

    public void setFileList(List<SystemFile> fileList) {
        this.fileList = fileList;
    }

    /** 备注信息 */
    private String remarks;

    /** 删除标记（0：正常 1：删除） */
    private String delFlag;
    private List<SystemFile> fileList =  Lists.newArrayList();

    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setHead(String head) 
    {
        this.head = head;
    }

    public String getHead() 
    {
        return head;
    }
    public void setHeadPhone(String headPhone) 
    {
        this.headPhone = headPhone;
    }

    public String getHeadPhone() 
    {
        return headPhone;
    }
    public void setPa(String pa) 
    {
        this.pa = pa;
    }

    public String getPa() 
    {
        return pa;
    }
    public void setPb(String pb) 
    {
        this.pb = pb;
    }

    public String getPb() 
    {
        return pb;
    }
    public void setFileIds(String fileIds) 
    {
        this.fileIds = fileIds;
    }

    public String getFileIds() 
    {
        return fileIds;
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
            .append("name", getName())
            .append("head", getHead())
            .append("headPhone", getHeadPhone())
            .append("pa", getPa())
            .append("pb", getPb())
            .append("fileIds", getFileIds())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateDate", getUpdateTime())
            .append("remarks", getRemarks())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
