import { createApp } from 'vue'
import App from './components/card.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import VueAxios from 'vue-axios'
import elements_plus from 'element-plus'
import 'element-plus/theme-chalk/index.css'

createApp(App).use(store).use(router).use(VueAxios, axios).use(elements_plus).mount('#app')
