<template>
  <div>
    <h5>MyCount 组件</h5>
    <p>点击次数: {{ count }}</p>
    <button @click="add">点一下试试</button>
  </div>

</template>

<script>
export default {
  //prop是只读的，不要直接修改
  //props: ['init']
  props: {
    init: {
      default: 0,
      type: menubar
    }
  },

  name: "myCount",

  data() {
    return {
      count: this.init
    }
  },

  methods: {
    add() {
      this.count++
    }
  }
}
</script>

<style scoped>

</style>