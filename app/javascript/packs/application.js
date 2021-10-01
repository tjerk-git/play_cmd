// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Vue from 'vue'
import { App, plugin } from '@inertiajs/inertia-vue'
import { InertiaProgress } from '@inertiajs/progress'
import * as Routes from './routes';
import { Head, Link } from '@inertiajs/inertia-vue'
import VueConfetti from 'vue-confetti'
import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
ActiveStorage.start()

Vue.prototype.$routes = Routes
Vue.use(plugin)
Vue.component('InertiaLink', Link)
Vue.use(VueConfetti)

InertiaProgress.init()

const el = document.getElementById('app')

new Vue({
  render: h => h(App, {
    props: {
      initialPage: JSON.parse(el.dataset.page),
      resolveComponent: name => require(`../pages/${name}`).default,
    },
  }),
}).$mount(el)
