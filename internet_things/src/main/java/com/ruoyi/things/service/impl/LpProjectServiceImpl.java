package com.ruoyi.things.service.impl;

import java.util.List;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
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

    /**
     * 查询项目申请
     * 
     * @param id 项目申请ID
     * @return 项目申请
     */
    @Override
    public LpProject selectLpProjectById(String id)
    {
        return lpProjectMapper.selectLpProjectById(id);
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
