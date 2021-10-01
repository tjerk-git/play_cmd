<template>
    <div>
        {{ newCreated }}
        {{ post }}
    </div>
</template>

<script>
import VueConfetti from 'vue-confetti'
import Vue from 'vue'

Vue.use(VueConfetti)

export default {
    props: {
        newCreated: Boolean,
        post: Object
    },
    mounted() {
        this.$confetti.start()
        setTimeout(() => {
            this.$confetti.stop()
        }, 5000);
    }
}
</script>
