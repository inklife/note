import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
    noteTmp: ''
  },
  mutations: {
    saveNoteTmp(state, tmp) {
      window.localStorage.setItem('noteTmp', tmp)
      state.noteTmp = tmp
    }
  }
})

export default store
