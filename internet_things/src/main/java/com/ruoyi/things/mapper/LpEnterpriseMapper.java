package com.ruoyi.things.mapper;

import java.util.List;
import com.ruoyi.things.domain.LpEnterprise;

/**
 * 企业信息Mapper接口
 * 
 * @author nanking
 * @date 2020-11-02
 */
public interface LpEnterpriseMapper 
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
     * 删除企业信息
     * 
     * @param id 企业信息ID
     * @return 结果
     */
    public int deleteLpEnterpriseById(String id);

    /**
     * 批量删除企业信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteLpEnterpriseByIds(String[] ids);
}
