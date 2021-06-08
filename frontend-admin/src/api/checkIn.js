import request from '@/utils/request'

export function postUserCheckIn(data) {
  return request({
    url: `/user/checkIn/`,
    method: 'post',
    data
  })
}
