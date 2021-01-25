import request from '@/utils/request'

// 查询项目申请列表
export function listProject(query) {
  return request({
    url: '/things/project/list',
    method: 'get',
    params: query
  })
}

// 查询项目申请详细
export function getProject(id) {
  return request({
    url: '/things/project/' + id,
    method: 'get'
  })
}

// 新增项目申请
export function addProject(data) {
  return request({
    url: '/things/project',
    method: 'post',
    data: data
  })
}

// 修改项目申请
export function updateProject(data) {
  return request({
    url: '/things/project',
    method: 'put',
    data: data
  })
}

// 删除项目申请
export function delProject(id) {
  return request({
    url: '/things/project/' + id,
    method: 'delete'
  })
}

// 导出项目申请
export function exportProject(query) {
  return request({
    url: '/things/project/export',
    method: 'get',
    params: query
  })
}