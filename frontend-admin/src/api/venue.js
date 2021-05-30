import request from '@/utils/request'

export const listVenue = (params) => request.get('http://localhost:3000/api/venue/info', { params })
export const editVenue = (id, data) => request.post(`http://localhost:3000/api/venue/venueID/${id}`, data)
export const delVenue = (id) => request.delete(`http://localhost:3000/api/venue/info/${id}`)
export const addVenue = (data) => request.post(`http://localhost:3000/api/venue/info`, data)
