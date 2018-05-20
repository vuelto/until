import Vue from 'vue';
import App from './App.vue';
import localStorage from 'vue-localstorage';

Vue.config.productionTip = false;

Vue.use(localStorage, {
  name:'ls', 
  bind: true
});

new Vue({
  render: h => h(App)
}).$mount('#app');
