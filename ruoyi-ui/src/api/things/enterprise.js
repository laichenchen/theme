import request from '@/utils/request'

// 查询企业信息列表
export function listEnterprise(query) {
  return request({
    url: '/things/enterprise/list',
    method: 'get',
    params: query
  })
}

// 查询企业信息详细
export function getEnterprise(id) {
  return request({
    url: '/things/enterprise/' + id,
    method: 'get'
  })
}

// 新增企业信息
export function addEnterprise(data) {
  return request({
    url: '/things/enterprise',
    method: 'post',
    data: data
  })
}

// 修改企业信息
export function updateEnterprise(data) {
  return request({
    url: '/things/enterprise',
    method: 'put',
    data: data
  })
}

// 删除企业信息
export function delEnterprise(id) {
  return request({
    url: '/things/enterprise/' + id,
    method: 'delete'
  })
}

// 导出企业信息
export function exportEnterprise(query) {
  return request({
    url: '/things/enterprise/export',
    method: 'get',
    params: query
  })
}