<template>
  <div class="container">
    <h5>Left 组件</h5>
    <hr>
    <MyCount :init="7"></MyCount>
  </div>
</template>

<script>
export default {
  name: "leftComponents"
}
</script>

<style scoped>
.container {
  min-height: 250px;
  padding: 1px 20px 20px;
  background: rgb(236, 182, 83);
  flex: 1;
}
</style>