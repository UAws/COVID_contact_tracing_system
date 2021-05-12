import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Index from '../views/Index'
import Hotspot from '@/views/Hotspot'
import Login from '@/views/Auth/Login'
import Signup from '@/views/Auth/Signup'

Vue.use(VueRouter)

const routes = [
  {
    path: '/home',
    name: 'Home',
    component: Home
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path: '/index',
    name: 'Index-1',
    component: Index
  },
  {
    path: '/',
    name: 'Index',
    component: Index
  },
  {
    path: '/hotspot',
    name: 'hotspot',
    component: Hotspot
  },
  {
    path: '/auth/login',
    name: 'login',
    component: Login
  },
  {
    path: '/auth/signup',
    name: 'signup',
    component: Signup
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
