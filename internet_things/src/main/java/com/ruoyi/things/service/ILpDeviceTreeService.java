package com.ruoyi.things.service;

import java.util.List;
import com.ruoyi.things.domain.LpDeviceTree;

/**
 * 设备组织Service接口
 * 
 * @author ruoyi
 * @date 2020-11-26
 */
public interface ILpDeviceTreeService 
{
    /**
     * 查询设备组织
     * 
     * @param id 设备组织ID
     * @return 设备组织
     */
    public LpDeviceTree selectLpDeviceTreeById(String id);

    /**
     * 查询设备组织列表
     * 
     * @param lpDeviceTree 设备组织
     * @return 设备组织集合
     */
    public List<LpDeviceTree> selectLpDeviceTreeList(LpDeviceTree lpDeviceTree);

    /**
     * 新增设备组织
     * 
     * @param lpDeviceTree 设备组织
     * @return 结果
     */
    public int insertLpDeviceTree(LpDeviceTree lpDeviceTree);

    /**
     * 修改设备组织
     * 
     * @param lpDeviceTree 设备组织
     * @return 结果
     */
    public int updateLpDeviceTree(LpDeviceTree lpDeviceTree);

    /**
     * 批量删除设备组织
     * 
     * @param ids 需要删除的设备组织ID
     * @return 结果
     */
    public int deleteLpDeviceTreeByIds(String[] ids);

    /**
     * 删除设备组织信息
     * 
     * @param id 设备组织ID
     * @return 结果
     */
    public int deleteLpDeviceTreeById(String id);
}
