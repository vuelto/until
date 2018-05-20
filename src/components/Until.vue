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
    endDate: Date
  }, 
  methods: {
    diff: function() {
      return moment.duration(
        moment(this.endDate).diff(new Date())
      );
    },
    milliseconds: function() {
      return this.diff().asMilliseconds();
    }, 
    seconds: function() {
      return Math.round(this.diff().asSeconds());
    }, 
    minutes: function() {
      return Math.round(this.diff().asMinutes());
    },
    hours: function() {
      return Math.round(this.diff().asHours());
    },
    days: function(){
      return Math.round(this.diff().asDays());
    }, 
    weeks: function() {
      return Math.round(this.diff().asWeeks());
    }, 
    months: function() {
      return Math.round(this.diff().asMonths());
    }, 
    years: function(){
      return Math.round(this.diff().asYears());
    }
  },
  computed: {
    cookedMessage: function() {
      return this.message
        .replace(/{milliseconds}/g, this.milliseconds())
        .replace(/{seconds}/g, this.seconds())
        .replace(/{minutes}/g, this.minutes())
        .replace(/{hours}/g, this.hours())
        .replace(/{days}/g, this.days())
        .replace(/{weeks}/g, this.weeks())
        .replace(/{months}/g, this.months())
        .replace(/{years}/g, this.years());
    }
  }
}
</script>
