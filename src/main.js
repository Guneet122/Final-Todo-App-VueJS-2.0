import Vue from 'vue'
import App from './App.vue'
import VueRouter from 'vue-router'
import VeeValidate from 'vee-validate';
import TodoList from './components/Todolist.vue';
import AboutTab from './components/About.vue';
import ContactTab from './components/Contact.vue';

Vue.use(VueRouter)
Vue.use(VeeValidate)
Vue.config.productionTip = false


const router= new VueRouter({
  routes: [
    {path:'/', component: TodoList},
    {path:'/contact', component: ContactTab},
    {path:'/about', component: AboutTab}
  ],
  mode: "history",
  base: "/"
})

new Vue({
  render: h => h(App),
  router: router
}).$mount('#app')
