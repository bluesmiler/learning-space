<template>
  <div class="container">
    <div class="container_showImg"></div>
    <div>
      <div class="container_showTitle"></div>
      <div style="display: flex">
        <div class="container_showPrices">1</div>
        <Counter></Counter>
      </div>
    </div>
  </div>
</template>

<script>
import Counter from "@/components/Counter";

export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Goods",
  components: {Counter}
}
</script>

<style lang="less" scoped>
.container {
  display: flex;
  padding: 15px;
  /*opacity: 0.5;*/

  .container_showImg {
    background: #42b983;
    min-width: 140px;
    height: 140px;
  }

  .container_showTitle {
    background: gray;
    height: 45px;
    width: 215px;
    margin: 0 15px;
  }

  .container_showPrices {
    background: #5d08b3;
    height: 35px;
    width: 50px;
    margin-top: 45px;
    margin-left: 15px;
  }
}


</style>