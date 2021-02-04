package com.ruoyi.things.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.system.domain.SystemFile;
import com.ruoyi.system.service.ISystemFileService;
import com.ruoyi.things.domain.LpBaseDevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.things.mapper.LpProjectMapper;
import com.ruoyi.things.domain.LpProject;
import com.ruoyi.things.service.ILpProjectService;

/**
 * 项目申请Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-11-02
 */
@Service
public class LpProjectServiceImpl implements ILpProjectService 
{
    @Autowired
    private LpProjectMapper lpProjectMapper;

    @Autowired
    private ISystemFileService systemFileService;

    /**
     * 查询项目申请
     * 
     * @param id 项目申请ID
     * @return 项目申请
     */
    @Override
    public LpProject selectLpProjectById(String id)
    {
        LpProject lpProject = lpProjectMapper.selectLpProjectById(id);
        //获取附件
        String fileIds = lpProject.getFileIds();
        if(StringUtils.isNotBlank(fileIds)){
            List<SystemFile> fileList = systemFileService.selectFileListByIds(fileIds.split(","));
            if (Objects.nonNull(fileList)) {
                lpProject.setFileList(fileList);
            }
        }
        return lpProject;
    }

    /**
     * 查询项目申请列表
     * 
     * @param lpProject 项目申请
     * @return 项目申请
     */
    @Override
    public List<LpProject> selectLpProjectList(LpProject lpProject)
    {
        return lpProjectMapper.selectLpProjectList(lpProject);
    }

    /**
     * 新增项目申请
     * 
     * @param lpProject 项目申请
     * @return 结果
     */
    @Override
    public int insertLpProject(LpProject lpProject)
    {
        lpProject.setId(IdUtils.fastSimpleUUID());
        lpProject.setCreateTime(DateUtils.getNowDate());
        lpProject.setCreateBy(SecurityUtils.getUsername());
        lpProject.setUpdateTime(DateUtils.getNowDate());
        lpProject.setUpdateBy(SecurityUtils.getUsername());
        //保存文件
        List<String> fileIds = new ArrayList<>();
        if (Objects.nonNull(lpProject.getFileList())) {
            for (int i = 0; i < lpProject.getFileList().size(); i++) {
                fileIds.add(lpProject.getFileList().get(i).getId());
                lpProject.getFileList().get(i).setUploadTime(DateUtils.getNowDate());
                lpProject.getFileList().get(i).setUploadBy(SecurityUtils.getUsername());
                systemFileService.insertFile(lpProject.getFileList().get(i));
            }
        }
        lpProject.setFileIds(String.join(",", fileIds));
        return lpProjectMapper.insertLpProject(lpProject);
    }

    /**
     * 修改项目申请
     * 
     * @param lpProject 项目申请
     * @return 结果
     */
    @Override
    public int updateLpProject(LpProject lpProject)
    {
        //删除原有附件
        LpProject old = lpProjectMapper.selectLpProjectById(lpProject.getId());
        if(StringUtils.isNotBlank(old.getFileIds())){
            systemFileService.deleteFileByIds(old.getFileIds().split(","));
        }
        //保存文件
        List<String> fileIds = new ArrayList<>();
        if (Objects.nonNull(lpProject.getFileList())) {
            for (int i = 0; i < lpProject.getFileList().size(); i++) {
                fileIds.add(lpProject.getFileList().get(i).getId());
                lpProject.getFileList().get(i).setUploadTime(DateUtils.getNowDate());
                lpProject.getFileList().get(i).setUploadBy(SecurityUtils.getUsername());
                systemFileService.insertFile(lpProject.getFileList().get(i));
            }
        }
        lpProject.setFileIds(String.join(",", fileIds));
        lpProject.setUpdateTime(DateUtils.getNowDate());
        lpProject.setUpdateBy(SecurityUtils.getUsername());
        return lpProjectMapper.updateLpProject(lpProject);
    }

    /**
     * 批量删除项目申请
     * 
     * @param ids 需要删除的项目申请ID
     * @return 结果
     */
    @Override
    public int deleteLpProjectByIds(String[] ids)
    {
        return lpProjectMapper.deleteLpProjectByIds(ids);
    }

    /**
     * 删除项目申请信息
     * 
     * @param id 项目申请ID
     * @return 结果
     */
    @Override
    public int deleteLpProjectById(String id)
    {
        return lpProjectMapper.deleteLpProjectById(id);
    }
}
