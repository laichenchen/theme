import request from '@/utils/request'

// 查询设备组织列表
export function listDevicetree(query) {
  return request({
    url: '/things/devicetree/list',
    method: 'get',
    params: query
  })
}

// 查询设备组织详细
export function getDevicetree(id) {
  return request({
    url: '/things/devicetree/' + id,
    method: 'get'
  })
}

// 新增设备组织
export function addDevicetree(data) {
  return request({
    url: '/things/devicetree',
    method: 'post',
    data: data
  })
}

// 修改设备组织
export function updateDevicetree(data) {
  return request({
    url: '/things/devicetree',
    method: 'put',
    data: data
  })
}

// 删除设备组织
export function delDevicetree(id) {
  return request({
    url: '/things/devicetree/' + id,
    method: 'delete'
  })
}

// 导出设备组织
export function exportDevicetree(query) {
  return request({
    url: '/things/devicetree/export',
    method: 'get',
    params: query
  })
}