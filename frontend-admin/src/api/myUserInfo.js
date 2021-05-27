import request from '@/utils/request'

export function fetchUserList(query) {
  return request({
    url: 'https://wdc-backend-live.dev.vmv.re/api/user/info',
    method: 'get',
    params: query
  })
}

export function createUser(data) {
  return request({
    url: 'https://wdc-backend-live.dev.vmv.re/api/user/info',
    method: 'post',
    data
  })
}
