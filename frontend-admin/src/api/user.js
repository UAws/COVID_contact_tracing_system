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
    url: '/auth/register',
    method: 'post',
    data
  })
}

export function getInfo(user_id, token) {
  return request({
    url: `/user/info/${user_id}`,
    method: 'get',
    params: { token }
  })
}

export function logout() {
  return request({
    url: '/auth/logout',
    method: 'post'
  })
}

export function googleLogin(redirect_uri) {
  return request({
    url: '/auth/oauth/google',
    method: 'get',
    params: { redirect_uri }
  })
}
