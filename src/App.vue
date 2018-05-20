<template>
  <div id="app">
    <div v-if="!showSettings">
      <input type="button" id="settings" value="settings" v-on:click="show()">
      <until v-bind:message="message" v-bind:endDate="endDate" v-bind:live="live" />
    </div>
    <div v-if="showSettings">
      <settings v-bind:message="message" v-bind:endDate="endDate" v-bind:live="live" v-on:save="save" v-on:cancel="cancel" />
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
    data: function () {
      return {
        showSettings: false,
        message: '',
        endDate: null,
        live: true
      }
    },
    mounted: function () {
      this.loadSettings();
    },
    methods: {
      loadSettings: function () {
        var d = this.$ls.get('endDate');
        if (d) {
          this.endDate = new Date(this.$ls.get('endDate'));
        } else {
          this.endDate = new Date();
        }
        this.message = this.$ls.get('message') || '{days} days until right now!';
        this.live = this.$ls.get('live') === 'true';
      },
      show: function () {
        this.showSettings = true;
      },
      save: function (upd) {
        this.$ls.set('message', upd.message);
        this.$ls.set('endDate', upd.endDate)
        this.$ls.set('live', upd.live);
        this.message = upd.message;
        this.endDate = new Date(upd.endDate);
        this.live = upd.live;
        this.showSettings = false;
      },
      cancel: function () {
        this.showSettings = false;
      }
    }
  }
</script>

<style>
</style>