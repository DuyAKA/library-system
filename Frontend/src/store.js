import axios from 'axios';
import { createStore } from 'vuex'
import createPersistedState from "vuex-persistedstate";

const store = createStore({
  state: {
    loginState: "guest",
    serverRoot: "https://endlib-backend.fly.dev",
    //careful, this serverroot must be changed for production
    userName:null
  },
  mutations: {
    SET_LOGIN_STATE(state, new_loginState) {
      state.loginState = new_loginState;
    },

    SET_USER_NAME(state, new_userName){
      state.userName = new_userName;
    }
  },
  actions: {
    async fetchLoginState({ commit, state }) {
      const config = {
        headers: {
          Authorization: `Bearer ${localStorage.getItem("token")}`,
        },
        timeout: 5000
      };
      try{
      const response = await axios.get(`${state.serverRoot}/verify`,config)
      const new_state = await response.data.loginState
      commit('SET_LOGIN_STATE', new_state)
      }
      catch(err){
        console.log("Failed while fetching LoginState: " + err.message);
      }
      
    },

    async changeUsername({commit},new_name){

      commit('SET_USER_NAME', new_name);

    }
  },
  getters: {
    // your getter functions
    getUserName: state => state.userName,
    getLoginState: state => state.loginState,
    getServerRoot: state => state.serverRoot,
    isLoggedIn: state => state.loginState !== "guest"

    //provide extra abstraction
  },
  async created() {
    await this.dispatch('fetchLoginState')
  }
  ,
  plugins: [
    createPersistedState(
      {
        paths: ['userName']
      }
    )
  ],
})

export default store
