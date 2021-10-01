<template>
    <div>
        {{ newCreated }}
        {{ post }}
                <inertia-link
                  class="block w-full text-left px-6 py-2 hover:bg-indigo-600 hover:text-white"
                  :href="$routes.destroy_user_session()"
                  method="delete"
                  as="button"
                >
                  Logout
                </inertia-link>
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
