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
      endDate: Date,
      live: Boolean
    },

    mounted: function () {
      if (this.live) {
        this.interval = setInterval(() =>
        {
          this.now = new Date();
        },60000);
      }
    },
    destroyed: function() {
      clearInterval(this.interval);
    },
    methods: {
      diff: function (time) {
        return moment.duration(
          moment(this.endDate).diff(time)
        );
      },
      milliseconds: function (time) {
        return this.diff(time).asMilliseconds();
      },
      seconds: function (time) {
        return Math.round(this.diff(time).asSeconds());
      },
      minutes: function (time) {
        return Math.round(this.diff(time).asMinutes());
      },
      hours: function (time) {
        return Math.round(this.diff(time).asHours());
      },
      days: function (time) {
        return Math.round(this.diff(time).asDays());
      },
      weeks: function (time) {
        return Math.round(this.diff(time).asWeeks());
      },
      months: function (time) {
        return Math.round(this.diff(time).asMonths());
      },
      years: function (time) {
        return Math.round(this.diff(time).asYears());
      }
    },
    data: function() {
      return {
        now: new Date(), 
        interval: null
      }
    },
    computed: {
      cookedMessage: function () {
        return this.message
          .replace(/{milliseconds}/g, this.milliseconds(this.now))
          .replace(/{seconds}/g, this.seconds(this.now))
          .replace(/{minutes}/g, this.minutes(this.now))
          .replace(/{hours}/g, this.hours(this.now))
          .replace(/{days}/g, this.days(this.now))
          .replace(/{weeks}/g, this.weeks(this.now))
          .replace(/{months}/g, this.months(this.now))
          .replace(/{years}/g, this.years(this.now));
      }
    }
  }
</script>
