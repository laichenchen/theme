package com.ruoyi.system.mapper;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.domain.SystemFile;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 附件表 数据层
 * 
 * @author laichenchen
 */
public interface SystemFileMapper
{

    int insertFile(SystemFile file);

    int deleteFileById(String fileId);

    int deleteFileByIds(@Param("list") String[] ids);

    List<SystemFile> selectFileListByIds(@Param("list") String[] ids);

    SystemFile getById(String id);
}
