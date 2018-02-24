import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/view/Home'
import NewNote from '@/view/NewNote'
import CheckNote from '@/view/CheckNote'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      component: Home
    },
    {
      path: '/new',
      component: NewNote
    },
    {
      path: '/check/:NoteId',
      component: CheckNote
    }
  ]
})
