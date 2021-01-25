package com.ruoyi.web.controller.things;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.things.domain.LpProject;
import com.ruoyi.things.service.ILpProjectService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 项目申请Controller
 * 
 * @author ruoyi
 * @date 2020-11-02
 */
@RestController
@RequestMapping("/things/project")
public class LpProjectController extends BaseController
{
    @Autowired
    private ILpProjectService lpProjectService;

    /**
     * 查询项目申请列表
     */
    @PreAuthorize("@ss.hasPermi('things:project:list')")
    @GetMapping("/list")
    public TableDataInfo list(LpProject lpProject)
    {
        startPage();
        List<LpProject> list = lpProjectService.selectLpProjectList(lpProject);
        return getDataTable(list);
    }

    /**
     * 导出项目申请列表
     */
    @PreAuthorize("@ss.hasPermi('things:project:export')")
    @Log(title = "项目申请", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(LpProject lpProject)
    {
        List<LpProject> list = lpProjectService.selectLpProjectList(lpProject);
        ExcelUtil<LpProject> util = new ExcelUtil<LpProject>(LpProject.class);
        return util.exportExcel(list, "project");
    }

    /**
     * 获取项目申请详细信息
     */
    @PreAuthorize("@ss.hasPermi('things:project:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return AjaxResult.success(lpProjectService.selectLpProjectById(id));
    }

    /**
     * 新增项目申请
     */
    @PreAuthorize("@ss.hasPermi('things:project:add')")
    @Log(title = "项目申请", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LpProject lpProject)
    {
        return toAjax(lpProjectService.insertLpProject(lpProject));
    }

    /**
     * 修改项目申请
     */
    @PreAuthorize("@ss.hasPermi('things:project:edit')")
    @Log(title = "项目申请", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LpProject lpProject)
    {
        return toAjax(lpProjectService.updateLpProject(lpProject));
    }

    /**
     * 删除项目申请
     */
    @PreAuthorize("@ss.hasPermi('things:project:remove')")
    @Log(title = "项目申请", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(lpProjectService.deleteLpProjectByIds(ids));
    }
}
