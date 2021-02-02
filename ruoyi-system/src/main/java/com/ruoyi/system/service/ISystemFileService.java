package com.ruoyi.system.service;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.domain.SystemFile;

import java.util.List;

/**
 * 系统附件 业务层
 * 
 * @author laichenchen
 */
public interface ISystemFileService
{


    /**
     * 新增附件信息
     * 
     * @param file 附件信息
     * @return 结果
     */
    int insertFile(SystemFile file);


    /**
     * 通过附件ID删除附件
     * 
     * @param fileId 附件户ID
     * @return 结果
     */
    int deleteFileById(String fileId);

    /**
     * 批量删除附件信息
     * 
     * @param fileIds 需要删除的附件ID
     * @return 结果
     */
    int deleteFileByIds(String[] fileIds);

    List<SystemFile> selectFileListByIds(String[] split);

    SystemFile getById(String id);
}
