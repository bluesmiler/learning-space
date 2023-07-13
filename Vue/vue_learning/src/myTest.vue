<template>
  <div class="test-box">
    <h3>这是用户自定义的 Test.vue ---- {{ username }}</h3>
    <button @click="changeName">修改用户</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: 'AY'
    }
  },
  methods: {
    changeName() {
      console.log(this)
      this.username = '不是你真改啊'
    }
  },
  //当前组件的监听器
  watch: {},
  //当前组件的计算属性
  computed: {},
  //当前组件的过滤器
  filters: {}

}
</script>

<style>
.test-box {
  background: pink;
}

h3 {
  color: white;
}
</style>