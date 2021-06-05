import request from '@/utils/request'

export const listVenue = (params) => request.get('/venue/info', { params })
export const editVenue = (id, data) => request.post(`/venue/venueID/${id}`, data)
export const delVenue = (id) => request.delete(`/venue/info/${id}`)
export const addVenue = (data) => request.post(`/venue/info`, data)

export function venueChangeInHotSport(id) {
  return request({
    url: `/venue/info/changeHotSpot/${id}`,
    method: 'put'
  })
}

export function venueChangeSelectableArea(id, data) {
  return request({
    url: `/venue/info/changeCoordinates/${id}`,
    method: 'post',
    data
  })
}
