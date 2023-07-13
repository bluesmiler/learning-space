<template>
  <div class="global">
    <router-view class="router-view"></router-view>
    <my-navigation></my-navigation>
  </div>
</template>

<script>

import MyNavigation from "@/components/myNavigation";

export default {
  name: 'App',
  components: {MyNavigation},
}
</script>

<style>
body {
  letter-spacing: 1px;
  background: #f7f8fa;
}
</style>
