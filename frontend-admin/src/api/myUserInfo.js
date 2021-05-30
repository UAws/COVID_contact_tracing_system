import request from '@/utils/request'

export function fetchUserList(query) {
  return request({
    url: 'https://wdc-backend-live.dev.vmv.re/api/user/info',
    method: 'get',
    params: query
  })
}
// pv???
export function fetchPv(pv) {
  return request({
    url: 'https://wdc-backend-live.dev.vmv.re/api/user/info',
    method: 'get',
    params: { pv }
  })
}

export function createUser(data) {
  return request({
    url: 'https://wdc-backend-live.dev.vmv.re/api/user/info',
    method: 'post',
    params: { data }
  })
}
export function UpdateUser(data) {
  return request({
    url: 'https://wdc-backend-live.dev.vmv.re/api/user/info',
    method: 'post',
    data
  })
}
