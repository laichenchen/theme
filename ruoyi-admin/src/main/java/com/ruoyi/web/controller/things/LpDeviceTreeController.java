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
import com.ruoyi.things.domain.LpDeviceTree;
import com.ruoyi.things.service.ILpDeviceTreeService;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 设备组织Controller
 * 
 * @author ruoyi
 * @date 2020-11-26
 */
@RestController
@RequestMapping("/things/devicetree")
public class LpDeviceTreeController extends BaseController
{
    @Autowired
    private ILpDeviceTreeService lpDeviceTreeService;

    /**
     * 查询设备组织列表
     */
    @PreAuthorize("@ss.hasPermi('things:devicetree:list')")
    @GetMapping("/list")
    public AjaxResult list(LpDeviceTree lpDeviceTree)
    {
        List<LpDeviceTree> list = lpDeviceTreeService.selectLpDeviceTreeList(lpDeviceTree);
        return AjaxResult.success(list);
    }

    /**
     * 导出设备组织列表
     */
    @PreAuthorize("@ss.hasPermi('things:devicetree:export')")
    @Log(title = "设备组织", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(LpDeviceTree lpDeviceTree)
    {
        List<LpDeviceTree> list = lpDeviceTreeService.selectLpDeviceTreeList(lpDeviceTree);
        ExcelUtil<LpDeviceTree> util = new ExcelUtil<LpDeviceTree>(LpDeviceTree.class);
        return util.exportExcel(list, "devicetree");
    }

    /**
     * 获取设备组织详细信息
     */
    @PreAuthorize("@ss.hasPermi('things:devicetree:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return AjaxResult.success(lpDeviceTreeService.selectLpDeviceTreeById(id));
    }

    /**
     * 新增设备组织
     */
    @PreAuthorize("@ss.hasPermi('things:devicetree:add')")
    @Log(title = "设备组织", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LpDeviceTree lpDeviceTree)
    {
        return toAjax(lpDeviceTreeService.insertLpDeviceTree(lpDeviceTree));
    }

    /**
     * 修改设备组织
     */
    @PreAuthorize("@ss.hasPermi('things:devicetree:edit')")
    @Log(title = "设备组织", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LpDeviceTree lpDeviceTree)
    {
        return toAjax(lpDeviceTreeService.updateLpDeviceTree(lpDeviceTree));
    }

    /**
     * 删除设备组织
     */
    @PreAuthorize("@ss.hasPermi('things:devicetree:remove')")
    @Log(title = "设备组织", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(lpDeviceTreeService.deleteLpDeviceTreeByIds(ids));
    }
}
