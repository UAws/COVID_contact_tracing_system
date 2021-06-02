import request from '@/utils/request'

export function fetchUserList(query) {
  return request({
    url: '/user/info',
    method: 'get',
    params: query
  })
}
// pv???
export function fetchUserDetails(user_id) {
  return request({
    url: '/user/info',
    method: 'get',
    params: { user_id }
  })
}

export function createUser(data) {
  return request({
    url: '/user/info',
    method: 'post',
    data
  })
}
export function UpdateUser(data) {
  return request({
    url: '/user/info',
    method: 'put',
    data
  })
}

export function DeleteUser(id) {
  return request({
    url: `/user/info/${id}`,
    method: 'delete'
  })
}
