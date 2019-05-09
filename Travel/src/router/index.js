import Vue from 'vue'
import Router from 'vue-router'
import Entry from '@/pages/entry/Entry.vue'
import Home from '@/pages/home/Home.vue'
import City from '@/pages/city/City.vue'
import Found from '@/pages/entry/Found.vue'
import Register from '@/pages/entry/Register'
import Detail from '@/pages/detail/Detail'
import Introduce from '@/pages/introduce/Introduce'
import Order from '@/pages/order/Order'
import Setall from '@/pages/setall/Setall'
import Game from '@/pages/game/Game'
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Entry',
      component: Entry,

    },
    {
      path:"/home",
      name:"Home",
      component:Home
    },
    {
      path:"/city",
      name:"City",
      component:City
    },
    {
      path:"/found",
      name:"Found",
      component:Found
    },
    {
      path:"/register",
      name:"Register",
      component:Register
    },
    {
      path:"/detail",
      name:"Detail",
      component:Detail,
    },
    {
      path:"/introduce",
      name:"Introduce",
      component:Introduce
    },
    {
      path:"/order",
      name:"Order",
      component:Order
    },
    {
      path:"/setall",
      name:"Setall",
      component:Setall,
    },
    {
      path:"/game",
      name:"Game",
      component:Game,
    },
  ]
})
