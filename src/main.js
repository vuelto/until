import Vue from 'vue';
import App from './App.vue';
import './registerServiceWorker';
import LocalStorage from 'vue-localstorage';

Vue.config.productionTip = false;

Vue.use(LocalStorage, {
  name:'ls', 
  bind: true
});

new Vue({
  render: h => h(App), 
}).$mount('#app');
