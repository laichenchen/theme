package com.ruoyi.things.service;

import java.util.List;
import com.ruoyi.things.domain.LpEnterprise;

/**
 * 企业信息Service接口
 * 
 * @author nanking
 * @date 2020-11-02
 */
public interface ILpEnterpriseService 
{
    /**
     * 查询企业信息
     * 
     * @param id 企业信息ID
     * @return 企业信息
     */
    public LpEnterprise selectLpEnterpriseById(String id);

    /**
     * 查询企业信息列表
     * 
     * @param lpEnterprise 企业信息
     * @return 企业信息集合
     */
    public List<LpEnterprise> selectLpEnterpriseList(LpEnterprise lpEnterprise);

    /**
     * 新增企业信息
     * 
     * @param lpEnterprise 企业信息
     * @return 结果
     */
    public int insertLpEnterprise(LpEnterprise lpEnterprise);

    /**
     * 修改企业信息
     * 
     * @param lpEnterprise 企业信息
     * @return 结果
     */
    public int updateLpEnterprise(LpEnterprise lpEnterprise);

    /**
     * 批量删除企业信息
     * 
     * @param ids 需要删除的企业信息ID
     * @return 结果
     */
    public int deleteLpEnterpriseByIds(String[] ids);

    /**
     * 删除企业信息信息
     * 
     * @param id 企业信息ID
     * @return 结果
     */
    public int deleteLpEnterpriseById(String id);
}
