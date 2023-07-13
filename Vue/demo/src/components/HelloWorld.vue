<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  data() {
    return {
      msg: '网站正在努力开发中'
    }
  }
}
</script>
<style scoped>
.hello{
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}
</style>
