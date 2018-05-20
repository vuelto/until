<template>
  <div class="until">
    <h3>{{cookedMessage}}</h3>
  </div>
</template>

<script>
import moment from 'moment';

export default {
  name: 'until',
  props: {
    message: String, 
    end: Date
  }, 
  methods: {
    milliseconds: function() {
      return 1;
    }, 
    seconds: function() {
      return 1;
    }, 
    minutes: function() {
      return 1;
    },
    hours: function() {
      return 1;
    },
    days: function(){
      return (365 - moment().dayOfYear())
    }, 
    weeks: function() {
      return 2;
    }, 
    months: function() {
      return 3;
    }, 
    years: function(){
      return 4;
    }
  },
  computed: {
    cookedMessage: function() {
      return this.message
        .replace('{milliseconds}', this.milliseconds())
        .replace('{seconds}', this.seconds())
        .replace('{minutes}', this.minutes())
        .replace('{hours}', this.hours())
        .replace('{days}', this.days())
        .replace('{weeks}', this.weeks())
        .replace('{months}', this.months())
        .replace('{years}', this.years());
    }
  }
}
</script>

<style scoped>
h3 {
  margin: 40px 0 0;
}
</style>
