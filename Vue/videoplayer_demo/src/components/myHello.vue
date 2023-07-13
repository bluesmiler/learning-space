<template>
  <div class="container">
    <h1>{{ myTitle }}</h1>
  </div>
</template>

<script>
export default {
  name: "myHello",
  data() {
    return {
      myTitle: 'For Clementine'
    }
  }
}
</script>

<style scoped lang="less">
.container {
  font-size: 1.2rem;
  letter-spacing: 0.16em;
  font-family: fantasy;
  font-style: italic;
  width: 100vw;
  height: 25vh;
  background: #f8f8f8;
  display: flex;
  justify-content: center;
  align-items: center;

  h1 {
    color: #dc0b4b;
  }
}
</style>