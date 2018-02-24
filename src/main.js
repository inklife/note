import FastClick from 'fastclick'

document.addEventListener('DOMContentLoaded', function () {
  FastClick.attach(document.body)
}, false)
// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import store from './store'
import YDUI from 'vue-ydui'
import 'vue-ydui/dist/ydui.rem.css'

Vue.use(YDUI)

import { Confirm, Alert, Toast, Notify, Loading } from 'vue-ydui/dist/lib.rem/dialog'
Vue.prototype.$dialog = {
  confirm: Confirm,
  alert: Alert,
  toast: Toast,
  notify: Notify,
  loading: Loading
}

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
