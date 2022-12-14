import Vue from "vue"
import Vuex from "vuex"
import asideModule from "./asideModule"
import userModule from "./userModule"

Vue.use(Vuex)

export default new Vuex.Store({
    modules: {
        asideModule,
        userModule,
    }
})