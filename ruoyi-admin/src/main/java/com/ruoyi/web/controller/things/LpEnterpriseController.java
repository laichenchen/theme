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
import com.ruoyi.things.domain.LpEnterprise;
import com.ruoyi.things.service.ILpEnterpriseService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 企业信息Controller
 * 
 * @author nanking
 * @date 2020-11-02
 */
@RestController
@RequestMapping("/things/enterprise")
public class LpEnterpriseController extends BaseController
{
    @Autowired
    private ILpEnterpriseService lpEnterpriseService;

    /**
     * 查询企业信息列表
     */
    @PreAuthorize("@ss.hasPermi('things:enterprise:list')")
    @GetMapping("/list")
    public TableDataInfo list(LpEnterprise lpEnterprise)
    {
        startPage();
        List<LpEnterprise> list = lpEnterpriseService.selectLpEnterpriseList(lpEnterprise);
        return getDataTable(list);
    }

    /**
     * 导出企业信息列表
     */
    @PreAuthorize("@ss.hasPermi('things:enterprise:export')")
    @Log(title = "企业信息", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(LpEnterprise lpEnterprise)
    {
        List<LpEnterprise> list = lpEnterpriseService.selectLpEnterpriseList(lpEnterprise);
        ExcelUtil<LpEnterprise> util = new ExcelUtil<LpEnterprise>(LpEnterprise.class);
        return util.exportExcel(list, "enterprise");
    }

    /**
     * 获取企业信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('things:enterprise:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return AjaxResult.success(lpEnterpriseService.selectLpEnterpriseById(id));
    }

    /**
     * 新增企业信息
     */
    @PreAuthorize("@ss.hasPermi('things:enterprise:add')")
    @Log(title = "企业信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LpEnterprise lpEnterprise)
    {
        return toAjax(lpEnterpriseService.insertLpEnterprise(lpEnterprise));
    }

    /**
     * 修改企业信息
     */
    @PreAuthorize("@ss.hasPermi('things:enterprise:edit')")
    @Log(title = "企业信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LpEnterprise lpEnterprise)
    {
        return toAjax(lpEnterpriseService.updateLpEnterprise(lpEnterprise));
    }

    /**
     * 删除企业信息
     */
    @PreAuthorize("@ss.hasPermi('things:enterprise:remove')")
    @Log(title = "企业信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(lpEnterpriseService.deleteLpEnterpriseByIds(ids));
    }
}
