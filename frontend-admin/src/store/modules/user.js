import { login, logout, getInfo } from '@/api/user'
import { getToken, setToken, removeToken, setUserToken, getUserToken } from '@/utils/auth'
import router, { resetRouter } from '@/router'

const state = {
  token: getToken(),
  name: '',
  avatar: '',
  introduction: '',
  roles: [],
  user: null
}

const mutations = {
  SET_TOKEN: (state, token) => {
    state.token = token
  },
  SET_INTRODUCTION: (state, introduction) => {
    state.introduction = introduction
  },
  SET_NAME: (state, name) => {
    state.name = name
  },
  SET_AVATAR: (state, avatar) => {
    state.avatar = avatar
  },
  SET_ROLES: (state, roles) => {
    state.roles = roles
  },
  SET_User: (state, user) => {
    state.user = user
  }

}

const actions = {
  // user login
  login({ commit }, userInfo) {
    const { username, password } = userInfo

    let loginPostData
    if (/.+@.+\..+/.test(username)) {
      loginPostData = { emailAddress: username, password: password }
    } else {
      loginPostData = { username: username.trim(), password: password }
    }

    return new Promise((resolve, reject) => {
      login(loginPostData).then(response => {
        const { data } = response
        commit('SET_TOKEN', data.token)
        commit('SET_User', data.user)
        // console.log(data.user)
        setToken(data.token)
        setUserToken(data.user)
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },

  // get user info
  getInfo({ commit, state }) {
    return new Promise((resolve, reject) => {
      const user = JSON.parse(getUserToken())
      const cookieToken = JSON.parse(getToken())
      // console.log(user)
      if (!state.user) {
        commit('SET_User', user)
      }
      if (!state.token || !(state.token instanceof Object)) {
        commit('SET_TOKEN', cookieToken)
      }
      // console.log(state.token)
      getInfo(state.user.user_id, state.token.accessToken).then(response => {
        const { data } = response

        if (!data) {
          reject('Verification failed, please Login again.')
        }

        const { Role, username } = data

        // roles must be a non-empty array
        if (!Role || Role.length <= 0) {
          reject('getInfo: roles must be a non-null array!')
        }

        const roles = [Role[0].role_name]

        commit('SET_ROLES', roles)
        commit('SET_NAME', username)
        commit('SET_AVATAR', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif')
        commit('SET_INTRODUCTION', Role[0].description)
        resolve(data)
      }).catch(error => {
        reject(error)
      })
    })
  },

  // user logout
  logout({ commit, state, dispatch }) {
    return new Promise((resolve, reject) => {
      logout(state.token).then(() => {
        commit('SET_TOKEN', '')
        commit('SET_ROLES', [])
        removeToken()
        resetRouter()

        // reset visited views and cached views
        // to fixed https://github.com/PanJiaChen/vue-element-admin/issues/2485
        dispatch('tagsView/delAllViews', null, { root: true })

        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },

  // remove token
  resetToken({ commit }) {
    return new Promise(resolve => {
      commit('SET_TOKEN', '')
      commit('SET_ROLES', [])
      removeToken()
      resolve()
    })
  },

  // dynamically modify permissions
  async changeRoles({ commit, dispatch }, role) {
    const token = role + '-token'

    commit('SET_TOKEN', token)
    setToken(token)

    const { roles } = await dispatch('getInfo')

    resetRouter()

    // generate accessible routes map based on roles
    const accessRoutes = await dispatch('permission/generateRoutes', roles, { root: true })
    // dynamically add accessible routes
    router.addRoutes(accessRoutes)

    // reset visited views and cached views
    dispatch('tagsView/delAllViews', null, { root: true })
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
