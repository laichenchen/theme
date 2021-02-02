import request from '@/utils/request'

const globalBaseUrl = " http://127.0.0.1:8080";
const downloadUrl = globalBaseUrl + "/common/download/{id}";
const listUrl = globalBaseUrl + "/common/files/list/{param}";
const uploadUrl = globalBaseUrl + "/common/upload";
const baseUrl = globalBaseUrl + "/common/files/{id}";
export default {
  downloadUrl,
  listUrl,
  uploadUrl,
  baseUrl
}


// 移除附件
export function removeFile(path) {
  return request({
    url: '/common/remove',
    method: 'post',
    params:{filePath:path}
  })
}

// 下载附件
export function downloadFile(id) {
  return request({
    url: downloadUrl.replace("{id}",id),
    method: 'get',
  })
}
