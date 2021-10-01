<template>
    <div>
        {{ newCreated }}
        {{ post }}
    </div>
</template>

<script>
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
