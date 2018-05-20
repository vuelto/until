<template with html>
    <div id="settings">
        <div class="row">
            <div id="insert">
                <input type="button" value="{milliseconds}" v-on:click="insert" />
                <input type="button" value="{seconds}" v-on:click="insert" />
                <input type="button" value="{minutes}" v-on:click="insert" />
                <input type="button" value="{hours}" v-on:click="insert" />
                <input type="button" value="{days}" v-on:click="insert" />
                <input type="button" value="{weeks}" v-on:click="insert" />
                <input type="button" value="{months}" v-on:click="insert" />
                <input type="button" value="{years}" v-on:click="insert" />
            </div>

            <div id="message">
                <textarea rows="10" cols="20" id="msg" v-model="rawMessage"></textarea>
            </div>
        </div>
        <div id="buttons" class="row">
            <input type="button" v-on:click="save()" id="save" value="save" />
            <input type="button" v-on:click="cancel()" id="cancel" value="cancel" />
        </div>
    </div>
</template>

<script>
    export default {
        name: 'settings',
        props: {
            message: String
        },
        methods: {
            cancel: function () {
                this.$emit('cancel');
            },
            save: function () {
                this.$emit('save', this.rawMessage);
            },
            insert: function (evt) {
                this.rawMessage += evt.currentTarget.value;
            }
        },
        data : function() {
            return {
                rawMessage: ''
            };
        },
        mounted: function() {
            this.rawMessage = this.message;
        }
    }
</script>

<style scoped>
    textarea {
        height: auto;
        width: auto;
    }
    
    div#insert input{
        display:block;
        min-width : 100px;
    }

    div.row {
        display: flex;
    }
</style>
