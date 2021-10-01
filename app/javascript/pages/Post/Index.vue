<template>
    <div class="grid md:grid-cols-3 sm:grid-cols-1">
        <div v-for="post in posts" :key="post.id" class="py-1.5">
            <h1 class="text-xl font-bold">{{ post.title }}</h1>
            <inertia-link
                class="px-6 py-4 flex items-center focus:text-indigo-500"
                :href="$routes.post(post.id)"
            >
                {{post.title  }}
            </inertia-link>
            <p>{{ post.body }}</p>
        </div>
    </div>
</template>

<script>
import { Link } from '@inertiajs/inertia-vue'

export default {
    props: {
        posts: Array
    },
    components: {
        Link
    }
}
</script>
