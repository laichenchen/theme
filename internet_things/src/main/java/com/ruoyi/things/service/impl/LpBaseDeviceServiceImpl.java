package com.ruoyi.things.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.system.domain.SystemFile;
import com.ruoyi.things.domain.LpBaseDevice;
import com.ruoyi.things.domain.LpBaseDeviceParameter;
import com.ruoyi.things.mapper.LpBaseDeviceMapper;
import com.ruoyi.things.mapper.LpBaseDeviceParameterMapper;
import com.ruoyi.things.service.ILpBaseDeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.ruoyi.system.service.ISystemFileService;

/**
 * 设备基础信息Service业务层处理
 *
 * @author nanking
 * @date 2020-11-02
 */
@Service
public class LpBaseDeviceServiceImpl implements ILpBaseDeviceService {
    @Autowired
    private LpBaseDeviceMapper lpBaseDeviceMapper;
    @Autowired
    private LpBaseDeviceParameterMapper deviceParameterMapper;

    @Autowired
    private ISystemFileService systemFileService;

    /**
     * 查询设备基础信息
     *
     * @param id 设备基础信息ID
     * @return 设备基础信息
     */
    @Override
    public LpBaseDevice selectLpBaseDeviceById(String id) {
        LpBaseDevice lpBaseDevice = lpBaseDeviceMapper.selectLpBaseDeviceById(id);
        //获取设备参数列表
        LpBaseDeviceParameter parameter = new LpBaseDeviceParameter();
        parameter.setInfoId(id);
        List<LpBaseDeviceParameter> parameters = deviceParameterMapper.selectLpBaseDeviceParameterList(parameter);
        if (Objects.nonNull(parameters)) {
            lpBaseDevice.setLpBaseDeviceParametersList(parameters);
        }
        //获取附件
        String fileIds = lpBaseDevice.getFileIds();
        if(StringUtils.isNotBlank(fileIds)){
            List<SystemFile> fileList = systemFileService.selectFileListByIds(fileIds.split(","));
            if (Objects.nonNull(fileList)) {
                lpBaseDevice.setFileList(fileList);
            }
        }
        return lpBaseDevice;
    }

    /**
     * 查询设备基础信息列表
     *
     * @param lpBaseDevice 设备基础信息
     * @return 设备基础信息
     */
    @Override
    public List<LpBaseDevice> selectLpBaseDeviceList(LpBaseDevice lpBaseDevice) {
        return lpBaseDeviceMapper.selectLpBaseDeviceList(lpBaseDevice);
    }

    /**
     * 新增设备基础信息
     *
     * @param lpBaseDevice 设备基础信息
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor=Exception.class)
    public int insertLpBaseDevice(LpBaseDevice lpBaseDevice) {
        lpBaseDevice.setId(IdUtils.fastSimpleUUID());
        lpBaseDevice.setCreateTime(DateUtils.getNowDate());
        lpBaseDevice.setCreateBy(SecurityUtils.getUsername());
        //保存设备参数
        if (Objects.nonNull(lpBaseDevice.getLpBaseDeviceParametersList())) {
            for (int i = 0; i < lpBaseDevice.getLpBaseDeviceParametersList().size(); i++) {
                lpBaseDevice.getLpBaseDeviceParametersList().get(i).setId(IdUtils.fastSimpleUUID());
                lpBaseDevice.getLpBaseDeviceParametersList().get(i).setInfoId(lpBaseDevice.getId());
                lpBaseDevice.getLpBaseDeviceParametersList().get(i).setCreateTime(DateUtils.getNowDate());
                lpBaseDevice.getLpBaseDeviceParametersList().get(i).setCreateBy(SecurityUtils.getUsername());
                deviceParameterMapper.insertLpBaseDeviceParameter(lpBaseDevice.getLpBaseDeviceParametersList().get(i));
            }
        }
        //保存文件
        List<String> fileIds = new ArrayList<>();
        if (Objects.nonNull(lpBaseDevice.getFileList())) {
            for (int i = 0; i < lpBaseDevice.getFileList().size(); i++) {
                fileIds.add(lpBaseDevice.getFileList().get(i).getId());
                lpBaseDevice.getFileList().get(i).setUploadTime(DateUtils.getNowDate());
                lpBaseDevice.getFileList().get(i).setUploadBy(SecurityUtils.getUsername());
                systemFileService.insertFile(lpBaseDevice.getFileList().get(i));
            }
        }
        lpBaseDevice.setFileIds(String.join(",", fileIds));
        return lpBaseDeviceMapper.insertLpBaseDevice(lpBaseDevice);
    }

    /**
     * 修改设备基础信息
     *
     * @param lpBaseDevice 设备基础信息
     * @return 结果
     */
    @Override
    public int updateLpBaseDevice(LpBaseDevice lpBaseDevice) {
        //删除原有的设备参数
        deviceParameterMapper.deleteByInfoId(lpBaseDevice.getId());
        //删除原有附件
        LpBaseDevice old = lpBaseDeviceMapper.selectLpBaseDeviceById(lpBaseDevice.getId());
        if(StringUtils.isNotBlank(old.getFileIds())){
            systemFileService.deleteFileByIds(old.getFileIds().split(","));
        }
        //保存设备参数
        if (Objects.nonNull(lpBaseDevice.getLpBaseDeviceParametersList())) {
            for (int i = 0; i < lpBaseDevice.getLpBaseDeviceParametersList().size(); i++) {
                lpBaseDevice.getLpBaseDeviceParametersList().get(i).setId(IdUtils.fastSimpleUUID());
                lpBaseDevice.getLpBaseDeviceParametersList().get(i).setInfoId(lpBaseDevice.getId());
                lpBaseDevice.getLpBaseDeviceParametersList().get(i).setCreateTime(DateUtils.getNowDate());
                lpBaseDevice.getLpBaseDeviceParametersList().get(i).setCreateBy(SecurityUtils.getUsername());
                deviceParameterMapper.insertLpBaseDeviceParameter(lpBaseDevice.getLpBaseDeviceParametersList().get(i));
            }
        }
        //保存文件
        List<String> fileIds = new ArrayList<>();
        if (Objects.nonNull(lpBaseDevice.getFileList())) {
            for (int i = 0; i < lpBaseDevice.getFileList().size(); i++) {
                fileIds.add(lpBaseDevice.getFileList().get(i).getId());
                lpBaseDevice.getFileList().get(i).setUploadTime(DateUtils.getNowDate());
                lpBaseDevice.getFileList().get(i).setUploadBy(SecurityUtils.getUsername());
                systemFileService.insertFile(lpBaseDevice.getFileList().get(i));
            }
        }
        lpBaseDevice.setFileIds(String.join(",", fileIds));
        lpBaseDevice.setUpdateTime(DateUtils.getNowDate());
        lpBaseDevice.setUpdateBy(SecurityUtils.getUsername());
        return lpBaseDeviceMapper.updateLpBaseDevice(lpBaseDevice);
    }

    /**
     * 批量删除设备基础信息
     *
     * @param ids 需要删除的设备基础信息ID
     * @return 结果
     */
    @Override
    public int deleteLpBaseDeviceByIds(String[] ids) {
        return lpBaseDeviceMapper.deleteLpBaseDeviceByIds(ids);
    }

    /**
     * 删除设备基础信息信息
     *
     * @param id 设备基础信息ID
     * @return 结果
     */
    @Override
    public int deleteLpBaseDeviceById(String id) {
        return lpBaseDeviceMapper.deleteLpBaseDeviceById(id);
    }
}
