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
import com.ruoyi.things.domain.LpBaseDevice;
import com.ruoyi.things.service.ILpBaseDeviceService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 设备基础信息Controller
 * 
 * @author nanking
 * @date 2020-11-02
 */
@RestController
@RequestMapping("/things/basedevice")
public class LpBaseDeviceController extends BaseController
{
    @Autowired
    private ILpBaseDeviceService lpBaseDeviceService;

    /**
     * 查询设备基础信息列表
     */
    @PreAuthorize("@ss.hasPermi('things:basedevice:list')")
    @GetMapping("/list")
    public TableDataInfo list(LpBaseDevice lpBaseDevice)
    {
        startPage();
        List<LpBaseDevice> list = lpBaseDeviceService.selectLpBaseDeviceList(lpBaseDevice);
        return getDataTable(list);
    }

    /**
     * 导出设备基础信息列表
     */
    @PreAuthorize("@ss.hasPermi('things:basedevice:export')")
    @Log(title = "设备基础信息", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(LpBaseDevice lpBaseDevice)
    {
        List<LpBaseDevice> list = lpBaseDeviceService.selectLpBaseDeviceList(lpBaseDevice);
        ExcelUtil<LpBaseDevice> util = new ExcelUtil<LpBaseDevice>(LpBaseDevice.class);
        return util.exportExcel(list, "basedevice");
    }

    /**
     * 获取设备基础信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('things:basedevice:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return AjaxResult.success(lpBaseDeviceService.selectLpBaseDeviceById(id));
    }

    /**
     * 新增设备基础信息
     */
    @PreAuthorize("@ss.hasPermi('things:basedevice:add')")
    @Log(title = "设备基础信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LpBaseDevice lpBaseDevice)
    {
        return toAjax(lpBaseDeviceService.insertLpBaseDevice(lpBaseDevice));
    }

    /**
     * 修改设备基础信息
     */
    @PreAuthorize("@ss.hasPermi('things:basedevice:edit')")
    @Log(title = "设备基础信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LpBaseDevice lpBaseDevice)
    {
        return toAjax(lpBaseDeviceService.updateLpBaseDevice(lpBaseDevice));
    }

    /**
     * 删除设备基础信息
     */
    @PreAuthorize("@ss.hasPermi('things:basedevice:remove')")
    @Log(title = "设备基础信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(lpBaseDeviceService.deleteLpBaseDeviceByIds(ids));
    }
}
