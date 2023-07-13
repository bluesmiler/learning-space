<template>
  <div class="header">
    <ul>
      <li>首页</li>
      <li>心得</li>
      <li>未开放</li>
      <li>|</li>
      <li>
        <img src="../assets/xiaoxizhongxin.svg" alt=""/>
      </li>
      <li>|</li>
      <li>
        <img src="../assets/yonghu.svg"  alt="">
      </li>
    </ul>
  </div>
</template>

<script>

export default {
  name: "myHeader",
}
</script>

<style scoped lang="less">
.header {
  width: 100vw;
  height: 8vh;
  background: #f8f8f8;
  display: flex;
  justify-content: right;
  align-items: center;

  li {
    display: inline-block;
    //background: gold;
    margin: 0 1vw;
    text-align: center;
    font-family: serif;
    font-size: 1.1rem;
    letter-spacing: 1px;
    position: relative;
    right: 5vw;
  }

  img{
    //background: yellow;
    position: relative;
    top: 0.7vh;
  }
}

</style>