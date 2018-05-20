<template>
  <div id="app">
    <div v-if="!showSettings">
      <input type="button" id="settings" value="settings" v-on:click="show()">
      <until v-bind:message="message"/>
    </div>
    <div v-if="showSettings">
      <settings v-bind:message="message" v-on:save="save" v-on:cancel="cancel" />
    </div>
  </div>
</template>

<script>
import until from './components/Until.vue';
import settings from './components/Settings.vue';

export default {
  name: 'app',
  components: {
   until, 
   settings
  }, 
  data: function() {
    return {
      showSettings: false, 
      message: ''
    }
  },
  mounted: function(){
    this.message = this.$ls.get('message') ||
      'days until the year is gone forever!';
  },
  methods: {
    show: function() {
      this.showSettings = true;
    }, 
    save: function(msg) {
      this.$ls.set('message', msg);
      this.message = msg;
      this.cancel();
    }, 
    cancel: function() {
      this.showSettings = false;
    }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
</style>
