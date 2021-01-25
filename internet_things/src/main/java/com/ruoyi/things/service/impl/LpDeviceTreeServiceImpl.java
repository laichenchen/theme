package com.ruoyi.things.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.things.mapper.LpDeviceTreeMapper;
import com.ruoyi.things.domain.LpDeviceTree;
import com.ruoyi.things.service.ILpDeviceTreeService;

/**
 * 设备组织Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-11-26
 */
@Service
public class LpDeviceTreeServiceImpl implements ILpDeviceTreeService 
{
    @Autowired
    private LpDeviceTreeMapper lpDeviceTreeMapper;

    /**
     * 查询设备组织
     * 
     * @param id 设备组织ID
     * @return 设备组织
     */
    @Override
    public LpDeviceTree selectLpDeviceTreeById(String id)
    {
        return lpDeviceTreeMapper.selectLpDeviceTreeById(id);
    }

    /**
     * 查询设备组织列表
     * 
     * @param lpDeviceTree 设备组织
     * @return 设备组织
     */
    @Override
    public List<LpDeviceTree> selectLpDeviceTreeList(LpDeviceTree lpDeviceTree)
    {
        return lpDeviceTreeMapper.selectLpDeviceTreeList(lpDeviceTree);
    }

    /**
     * 新增设备组织
     * 
     * @param lpDeviceTree 设备组织
     * @return 结果
     */
    @Override
    public int insertLpDeviceTree(LpDeviceTree lpDeviceTree)
    {
        lpDeviceTree.setId(IdUtils.fastSimpleUUID());
        lpDeviceTree.setCreateTime(DateUtils.getNowDate());
        lpDeviceTree.setCreateBy(SecurityUtils.getUsername());
        return lpDeviceTreeMapper.insertLpDeviceTree(lpDeviceTree);
    }

    /**
     * 修改设备组织
     * 
     * @param lpDeviceTree 设备组织
     * @return 结果
     */
    @Override
    public int updateLpDeviceTree(LpDeviceTree lpDeviceTree)
    {
        lpDeviceTree.setUpdateTime(DateUtils.getNowDate());
        lpDeviceTree.setUpdateBy(SecurityUtils.getUsername());
        return lpDeviceTreeMapper.updateLpDeviceTree(lpDeviceTree);
    }

    /**
     * 批量删除设备组织
     * 
     * @param ids 需要删除的设备组织ID
     * @return 结果
     */
    @Override
    public int deleteLpDeviceTreeByIds(String[] ids)
    {
        return lpDeviceTreeMapper.deleteLpDeviceTreeByIds(ids);
    }

    /**
     * 删除设备组织信息
     * 
     * @param id 设备组织ID
     * @return 结果
     */
    @Override
    public int deleteLpDeviceTreeById(String id)
    {
        return lpDeviceTreeMapper.deleteLpDeviceTreeById(id);
    }
}
