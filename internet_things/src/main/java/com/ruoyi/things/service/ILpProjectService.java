package com.ruoyi.things.service;

import java.util.List;
import com.ruoyi.things.domain.LpProject;

/**
 * 项目申请Service接口
 * 
 * @author ruoyi
 * @date 2020-11-02
 */
public interface ILpProjectService 
{
    /**
     * 查询项目申请
     * 
     * @param id 项目申请ID
     * @return 项目申请
     */
    public LpProject selectLpProjectById(String id);

    /**
     * 查询项目申请列表
     * 
     * @param lpProject 项目申请
     * @return 项目申请集合
     */
    public List<LpProject> selectLpProjectList(LpProject lpProject);

    /**
     * 新增项目申请
     * 
     * @param lpProject 项目申请
     * @return 结果
     */
    public int insertLpProject(LpProject lpProject);

    /**
     * 修改项目申请
     * 
     * @param lpProject 项目申请
     * @return 结果
     */
    public int updateLpProject(LpProject lpProject);

    /**
     * 批量删除项目申请
     * 
     * @param ids 需要删除的项目申请ID
     * @return 结果
     */
    public int deleteLpProjectByIds(String[] ids);

    /**
     * 删除项目申请信息
     * 
     * @param id 项目申请ID
     * @return 结果
     */
    public int deleteLpProjectById(String id);
}
