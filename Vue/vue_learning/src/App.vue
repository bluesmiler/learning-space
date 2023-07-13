<template>

  <div class="app-container">
    <h1>App 根组件</h1>
    <hr>
  </div>
  <div class="box">
    <!--      渲染left和right组件,以标签形式使用-->
    <Left></Left>
    <Right></Right>
  </div>

</template>

<script>
import Left from '@/components/leftComponents.vue'
import Right from '@/components/rightComponents'

export default {
  data() {

  },
  methods: {},
  components: {
    Left, Right
  }
}
</script>

<style lang="less">
.app-container {
  padding: 1px 20px 20px;
  background: #efefef;

  h1 {
    color: #444;
  }
}

.box {
  padding: 1px 20px 20px;
  min-height: 250px;
  background: #efefef;
  display: flex;
}
</style>