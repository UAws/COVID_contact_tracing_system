import request from '@/utils/request'

export function login(data) {
  return request({
    url: '/auth/login',
    method: 'post',
    data
  })
}
export function signup(data) {
  return request({
    url: '/auth/signup',
    method: 'post',
    data
  })
}

export function getInfo(user_id, token) {
  return request({
    url: `/user/info/${user_id}?token=`,
    method: 'get',
    params: { token }
  })
}

export function logout() {
  return request({
    url: '/user/logout',
    method: 'post'
  })
}
