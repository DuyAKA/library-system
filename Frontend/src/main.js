import 'mdb-vue-ui-kit/css/mdb.min.css'
import { createApp } from 'vue'
import App from './App.vue'
import Router from './router'
import store from './store'

const app = createApp(App)
app.use(store)
app.use(Router)


app.mount('#app')



