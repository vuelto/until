<template>
  <div id="app">
    <div v-if="!showSettings">
      <input type="button" id="settings" value="settings" v-on:click="show()">
      <until v-bind:message="message" v-bind:endDate="endDate"/>
    </div>
    <div v-if="showSettings">
      <settings v-bind:message="message" v-bind:endDate="endDate" v-on:save="save" v-on:cancel="cancel" />
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
      message: '', 
      endDate: null
    }
  },
  mounted: function(){
    this.endDate = new Date(this.$ls.get('endDate'));
    this.message = this.$ls.get('message') ||
      '{days} days until right now!';
  },
  methods: {
    show: function() {
      this.showSettings = true;
    }, 
    save: function(upd) {
      this.$ls.set('message', upd.message);
      this.$ls.set('endDate', upd.endDate)
      this.message = upd.message;
      this.endDate = new Date(upd.endDate);
      this.showSettings = false;
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
