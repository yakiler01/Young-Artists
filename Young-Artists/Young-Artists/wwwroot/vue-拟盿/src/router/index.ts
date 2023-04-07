import { createRouter, createWebHashHistory, RouteRecordRaw } from 'vue-router'
import iii from '../views/iii.vue'

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'iii',
    component: iii
  }

]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router
