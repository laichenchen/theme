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
import com.ruoyi.things.domain.LpProject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.things.mapper.LpEnterpriseMapper;
import com.ruoyi.things.domain.LpEnterprise;
import com.ruoyi.things.service.ILpEnterpriseService;

/**
 * 企业信息Service业务层处理
 * 
 * @author nanking
 * @date 2020-11-02
 */
@Service
public class LpEnterpriseServiceImpl implements ILpEnterpriseService 
{
    @Autowired
    private LpEnterpriseMapper lpEnterpriseMapper;

    @Autowired
    private ISystemFileService systemFileService;

    /**
     * 查询企业信息
     * 
     * @param id 企业信息ID
     * @return 企业信息
     */
    @Override
    public LpEnterprise selectLpEnterpriseById(String id)
    {
        LpEnterprise lpEnterprise = lpEnterpriseMapper.selectLpEnterpriseById(id);
        //获取附件
        String fileIds = lpEnterprise.getFileIds();
        if(StringUtils.isNotBlank(fileIds)){
            List<SystemFile> fileList = systemFileService.selectFileListByIds(fileIds.split(","));
            if (Objects.nonNull(fileList)) {
                lpEnterprise.setFileList(fileList);
            }
        }
        return lpEnterprise;
    }

    /**
     * 查询企业信息列表
     * 
     * @param lpEnterprise 企业信息
     * @return 企业信息
     */
    @Override
    public List<LpEnterprise> selectLpEnterpriseList(LpEnterprise lpEnterprise)
    {
        return lpEnterpriseMapper.selectLpEnterpriseList(lpEnterprise);
    }

    /**
     * 新增企业信息
     * 
     * @param lpEnterprise 企业信息
     * @return 结果
     */
    @Override
    public int insertLpEnterprise(LpEnterprise lpEnterprise)
    {
        lpEnterprise.setId(IdUtils.fastSimpleUUID());
        lpEnterprise.setCreateTime(DateUtils.getNowDate());
        lpEnterprise.setCreateBy(SecurityUtils.getUsername());
        lpEnterprise.setUpdateTime(DateUtils.getNowDate());
        lpEnterprise.setUpdateBy(SecurityUtils.getUsername());
        //保存文件
        List<String> fileIds = new ArrayList<>();
        if (Objects.nonNull(lpEnterprise.getFileList())) {
            for (int i = 0; i < lpEnterprise.getFileList().size(); i++) {
                fileIds.add(lpEnterprise.getFileList().get(i).getId());
                lpEnterprise.getFileList().get(i).setUploadTime(DateUtils.getNowDate());
                lpEnterprise.getFileList().get(i).setUploadBy(SecurityUtils.getUsername());
                systemFileService.insertFile(lpEnterprise.getFileList().get(i));
            }
        }
        lpEnterprise.setFileIds(String.join(",", fileIds));
        return lpEnterpriseMapper.insertLpEnterprise(lpEnterprise);
    }

    /**
     * 修改企业信息
     * 
     * @param lpEnterprise 企业信息
     * @return 结果
     */
    @Override
    public int updateLpEnterprise(LpEnterprise lpEnterprise)
    {
        //删除原有附件
        LpEnterprise old = lpEnterpriseMapper.selectLpEnterpriseById(lpEnterprise.getId());
        if(StringUtils.isNotBlank(old.getFileIds())){
            systemFileService.deleteFileByIds(old.getFileIds().split(","));
        }
        //保存文件
        List<String> fileIds = new ArrayList<>();
        if (Objects.nonNull(lpEnterprise.getFileList())) {
            for (int i = 0; i < lpEnterprise.getFileList().size(); i++) {
                fileIds.add(lpEnterprise.getFileList().get(i).getId());
                lpEnterprise.getFileList().get(i).setUploadTime(DateUtils.getNowDate());
                lpEnterprise.getFileList().get(i).setUploadBy(SecurityUtils.getUsername());
                systemFileService.insertFile(lpEnterprise.getFileList().get(i));
            }
        }
        lpEnterprise.setFileIds(String.join(",", fileIds));
        lpEnterprise.setUpdateTime(DateUtils.getNowDate());
        lpEnterprise.setUpdateBy(SecurityUtils.getUsername());
        return lpEnterpriseMapper.updateLpEnterprise(lpEnterprise);
    }

    /**
     * 批量删除企业信息
     * 
     * @param ids 需要删除的企业信息ID
     * @return 结果
     */
    @Override
    public int deleteLpEnterpriseByIds(String[] ids)
    {
        return lpEnterpriseMapper.deleteLpEnterpriseByIds(ids);
    }

    /**
     * 删除企业信息信息
     * 
     * @param id 企业信息ID
     * @return 结果
     */
    @Override
    public int deleteLpEnterpriseById(String id)
    {
        return lpEnterpriseMapper.deleteLpEnterpriseById(id);
    }
}
