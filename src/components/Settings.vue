<template with html>
    <div id="settings">
        <div class="row">
            <div class="insert">
                <input type="button" value="{milliseconds}" v-on:click="insert" />
                <input type="button" value="{seconds}" v-on:click="insert" />
                <input type="button" value="{minutes}" v-on:click="insert" />
                <input type="button" value="{hours}" v-on:click="insert" />
                <input type="button" value="{days}" v-on:click="insert" />
                <input type="button" value="{weeks}" v-on:click="insert" />
                <input type="button" value="{months}" v-on:click="insert" />
                <input type="button" value="{years}" v-on:click="insert" />
            </div>
            <textarea rows="10" cols="20" id="msg" v-model="d_message"></textarea>
        </div>
        <div class="row">
            <datepicker v-on:selected="dateSelected" v-bind:value="d_endDate" />
        </div>
        <div class="row">
            <label>
                <input type="checkbox" v-model="d_live" />
                Live Updates
            </label>
        </div>
        <div class="row">
            <input type="button" v-on:click="save()" id="save" value="save" />
            <input type="button" v-on:click="cancel()" id="cancel" value="cancel" />
        </div>
    </div>
</template>

<script>
    import datepicker from 'vuejs-datepicker';

    export default {
        name: 'settings',
        components: {
            datepicker
        },
        props: {
            message: String,
            endDate: Date,
            live: Boolean
        },
        methods: {
            cancel: function () {
                this.$emit('cancel');
            },
            save: function () {
                this.$emit('save', {
                    message: this.d_message,
                    endDate: this.d_endDate, 
                    live: this.d_live
                });
            },
            insert: function (evt) {
                this.d_message += evt.currentTarget.value;
            },
            dateSelected: function (date) {
                this.d_endDate = date;
            }
        },
        data: function () {
            return {
                d_message: '',
                d_endDate: new Date(), 
                d_live: true
            };
        },
        mounted: function () {
            this.d_message = this.message;
            this.d_endDate = this.endDate;
            this.d_live = this.live;
        }
    }
</script>

<style scoped>
    textarea {
        height: auto;
        width: auto;
    }

    div.insert input {
        display: block;
        min-width: 100px;
    }

    div.row {
        display: flex;
    }
</style>
