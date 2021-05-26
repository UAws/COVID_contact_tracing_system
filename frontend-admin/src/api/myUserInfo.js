import request from '@/utils/request'

export function fetchUserList(query) {
  return request({
    url: 'http://localhost:3000/api/user/info',
    method: 'get',
    params: query
  })
}

export function createUser(data) {
  return request({
    url: 'http://localhost:3000/api/user/info',
    method: 'post',
    data
  })
}
