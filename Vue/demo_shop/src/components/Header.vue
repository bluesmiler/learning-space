<template>
  <div class="container">
    {{ Title }}
  </div>
</template>

<script>
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Header",
  data() {
    return {
      Title: '购物车'
    }
  }
}
</script>

<style scoped>
.container {
  height: 60px;
  width: 100%;
  background: #1292e5;
  color: white;
  font-size: 18px;

  display: flex;
  /*定义flex后，垂直居中*/
  align-items: center;
  /*定义flex后，水平居中*/
  justify-content: center;
}
</style>