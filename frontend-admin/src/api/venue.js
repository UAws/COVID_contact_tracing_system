import request from '@/utils/request'

export const listVenue = (params) => request.get('https://wdc-backend-live.dev.vmv.re/api/venue/info', { params })
export const editVenue = (id, data) => request.post(`https://wdc-backend-live.dev.vmv.re/api/venue/venueID/${id}`, data)
export const delVenue = (id) => request.delete(`https://wdc-backend-live.dev.vmv.re/api/venue/info/${id}`)
export const addVenue = (data) => request.post(`https://wdc-backend-live.dev.vmv.re/api/venue/info`, data)
