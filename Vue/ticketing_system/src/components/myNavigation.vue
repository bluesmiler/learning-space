<template>
  <div class="navigation-container">
    <van-tabbar route>
      <van-tabbar-item replace to="/home" icon="wap-home-o">首页</van-tabbar-item>
      <van-tabbar-item replace to="/sale" icon="tv-o">买票</van-tabbar-item>
<!--      <van-tabbar-item replace to="/news" icon="orders-o">资讯</van-tabbar-item>-->
      <van-tabbar-item replace to="/user" icon="user-o">我的</van-tabbar-item>
    </van-tabbar>
  </div>
</template>

<script>
export default {
  name: "myNavigation",
}
</script>

<style scoped lang="less">

</style>