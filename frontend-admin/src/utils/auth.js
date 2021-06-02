import Cookies from 'js-cookie'

const TokenKey = 'Admin-Token'

export function getToken() {
  return Cookies.get(TokenKey)
}

export function setToken(token) {
  return Cookies.set(TokenKey, token)
}

export function setUserToken(token) {
  return Cookies.set('User-Info', token)
}

export function getUserToken() {
  return Cookies.get('User-Info')
}

export function removeToken() {
  Cookies.remove('User-Info')
  return Cookies.remove(TokenKey)
}
