
const state = {
  id: '',
  lat: '',
  lng: ''
}

const mutations = {
  SET_ID: (state, id) => {
    state.id = id
  },
  SET_LAT: (state, lat) => {
    state.lat = lat
  },
  SET_LNG: (state, lng) => {
    state.lng = lng
  }
}
const actions = {
  changeSelectId({ commit }, id) {
    return new Promise(resolve => {
      commit('SET_ID', id)
      resolve()
    })
  },
  changeLat({ commit }, lat) {
    return new Promise(resolve => {
      commit('SET_LAT', lat)
      resolve()
    })
  },
  changeLng({ commit }, lng) {
    return new Promise(resolve => {
      commit('SET_LNG', lng)
      resolve()
    })
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
