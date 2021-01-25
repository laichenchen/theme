package com.ruoyi.things.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
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

    /**
     * 查询企业信息
     * 
     * @param id 企业信息ID
     * @return 企业信息
     */
    @Override
    public LpEnterprise selectLpEnterpriseById(String id)
    {
        return lpEnterpriseMapper.selectLpEnterpriseById(id);
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
