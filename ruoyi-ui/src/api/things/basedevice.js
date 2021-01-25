import request from '@/utils/request'

// 查询设备基础信息列表
export function listDevice(query) {
  return request({
    url: '/things/basedevice/list',
    method: 'get',
    params: query
  })
}

// 查询设备基础信息详细
export function getDevice(id) {
  return request({
    url: '/things/basedevice/' + id,
    method: 'get'
  })
}

// 新增设备基础信息
export function addDevice(data) {
  return request({
    url: '/things/basedevice',
    method: 'post',
    data: data
  })
}

// 修改设备基础信息
export function updateDevice(data) {
  return request({
    url: '/things/basedevice',
    method: 'put',
    data: data
  })
}

// 删除设备基础信息
export function delDevice(id) {
  return request({
    url: '/things/basedevice/' + id,
    method: 'delete'
  })
}

// 导出设备基础信息
export function exportDevice(query) {
  return request({
    url: '/things/basedevice/export',
    method: 'get',
    params: query
  })
}
