import request from '@/utils/request'

export function postUserCheckIn(data) {
  return request({
    url: `/user/checkIn/`,
    method: 'post',
    data
  })
}

export function fetchCheckInList(query) {
  return request({
    url: '/user/checkIn/',
    method: 'get',
    params: query
  })
}
