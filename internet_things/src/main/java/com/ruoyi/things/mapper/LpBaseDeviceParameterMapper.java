package com.ruoyi.things.mapper;

import java.util.List;
import com.ruoyi.things.domain.LpBaseDeviceParameter;

/**
 * 设备基础参数Mapper接口
 * 
 * @author nanking
 * @date 2020-11-02
 */
public interface LpBaseDeviceParameterMapper 
{
    /**
     * 查询设备基础参数
     * 
     * @param id 设备基础参数ID
     * @return 设备基础参数
     */
    public LpBaseDeviceParameter selectLpBaseDeviceParameterById(String id);

    /**
     * 查询设备基础参数列表
     * 
     * @param lpBaseDeviceParameter 设备基础参数
     * @return 设备基础参数集合
     */
    public List<LpBaseDeviceParameter> selectLpBaseDeviceParameterList(LpBaseDeviceParameter lpBaseDeviceParameter);

    /**
     * 新增设备基础参数
     * 
     * @param lpBaseDeviceParameter 设备基础参数
     * @return 结果
     */
    public int insertLpBaseDeviceParameter(LpBaseDeviceParameter lpBaseDeviceParameter);

    /**
     * 修改设备基础参数
     * 
     * @param lpBaseDeviceParameter 设备基础参数
     * @return 结果
     */
    public int updateLpBaseDeviceParameter(LpBaseDeviceParameter lpBaseDeviceParameter);

    /**
     * 删除设备基础参数
     * 
     * @param id 设备基础参数ID
     * @return 结果
     */
    public int deleteLpBaseDeviceParameterById(String id);

    /**
     * 批量删除设备基础参数
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteLpBaseDeviceParameterByIds(String[] ids);

    /**
     * 根据设备id删除设备参数
     * @param infoId
     * @return
     */
    int deleteByInfoId(String infoId);
}
