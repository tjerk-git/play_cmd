<template>
    <div>
        <div v-for="post in posts" :key="post.id">
            {{ post }}
        </div>
    </div>
</template>

<script>
export default {
    props: {
        posts: Object
    }
}
</script>
