import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    checkInCode: ''
  },
  mutations: {
    setCheckInCode(state, code) {
      state.checkInCode = code
    }
  },
  actions: {
  },
  modules: {
  },
  getters: {
    getCheckInCode: state => {
      return state.checkInCode
    }
  }

})
