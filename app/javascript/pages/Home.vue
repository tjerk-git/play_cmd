<template>
  <div>
      <inertia-link :href="$routes.logout()">Log out</inertia-link>
    <h1 class="text-2xl text-center">Home</h1>
    <h2 class="text-xl text-center">This is a Vue page rendered with Inertiajs</h2>
  </div>
</template>

<script>
export default {
  name: "Home"
}
</script>

<style scoped>

</style>
