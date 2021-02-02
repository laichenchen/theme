package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.SystemFile;
import com.ruoyi.system.mapper.SystemFileMapper;
import com.ruoyi.system.service.ISystemFileService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 附件 业务层处理
 *
 * @author laichenchen
 */
@Service
public class SystemFileServiceImpl implements ISystemFileService {
    private static final Logger log = LoggerFactory.getLogger(SystemFileServiceImpl.class);

    @Autowired
    private SystemFileMapper fileMapper;

    @Override
    public int insertFile(SystemFile file) {
        return fileMapper.insertFile(file);
    }

    @Override
    public int deleteFileById(String fileId) {
        return fileMapper.deleteFileById(fileId);
    }

    @Override
    public int deleteFileByIds(String[] fileIds) {
        return fileMapper.deleteFileByIds(fileIds);
    }

    @Override
    public List<SystemFile> selectFileListByIds(String[] ids) {
        return fileMapper.selectFileListByIds(ids);
    }

    @Override
    public SystemFile getById(String id) {
        return fileMapper.getById(id);
    }
}
