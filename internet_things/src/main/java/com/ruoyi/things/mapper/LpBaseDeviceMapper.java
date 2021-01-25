package com.ruoyi.things.mapper;

import java.util.List;
import com.ruoyi.things.domain.LpBaseDevice;

/**
 * 设备基础信息Mapper接口
 * 
 * @author nanking
 * @date 2020-11-02
 */
public interface LpBaseDeviceMapper 
{
    /**
     * 查询设备基础信息
     * 
     * @param id 设备基础信息ID
     * @return 设备基础信息
     */
    public LpBaseDevice selectLpBaseDeviceById(String id);

    /**
     * 查询设备基础信息列表
     * 
     * @param lpBaseDevice 设备基础信息
     * @return 设备基础信息集合
     */
    public List<LpBaseDevice> selectLpBaseDeviceList(LpBaseDevice lpBaseDevice);

    /**
     * 新增设备基础信息
     * 
     * @param lpBaseDevice 设备基础信息
     * @return 结果
     */
    public int insertLpBaseDevice(LpBaseDevice lpBaseDevice);

    /**
     * 修改设备基础信息
     * 
     * @param lpBaseDevice 设备基础信息
     * @return 结果
     */
    public int updateLpBaseDevice(LpBaseDevice lpBaseDevice);

    /**
     * 删除设备基础信息
     * 
     * @param id 设备基础信息ID
     * @return 结果
     */
    public int deleteLpBaseDeviceById(String id);

    /**
     * 批量删除设备基础信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteLpBaseDeviceByIds(String[] ids);
}
