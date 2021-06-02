import request from '@/utils/request'

export const listVenue = (params) => request.get('/venue/info', { params })
export const editVenue = (id, data) => request.post(`/venue/venueID/${id}`, data)
export const delVenue = (id) => request.delete(`/venue/info/${id}`)
export const addVenue = (data) => request.post(`/venue/info`, data)
