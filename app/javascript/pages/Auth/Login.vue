<template>
    <div>
        <form @submit.prevent="form.post($routes.user_session())">
            <input type="text" v-model="form.user.email">
            <input type="password" name="password" id="password" v-model="form.user.password">

            <button type="submit">Send</button>
        </form>
    </div>
</template>
<script>
export default {
    data() {
        return {
            form: this.$inertia.form({
                user: {
                    email: '',
                    password: '',
                    remember_me: null,
                }
            })
        }
    }
}
</script>
